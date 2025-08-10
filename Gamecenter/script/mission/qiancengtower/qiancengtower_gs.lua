-- 文件名　：qiancengtower_gs.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-05-27 19:35:50

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");
Require("\\script\\mission\\qiancengtower\\qiancengtower_public.lua");

QianCengTower.TOWER_CFGFILE = "\\setting\\mission\\qiancengtower\\qiancengtowercfg.txt";
QianCengTower.TOWER_NPC_POSFILE = "\\setting\\mission\\qiancengtower\\map2npcpos.txt";
QianCengTower.TOWER_QIAN_FANPAI_FILE = "\\setting\\mission\\qiancengtower\\fanpai.txt";

function QianCengTower:GetMaxRoomNum()
	local nMaxNum = self.DEF_BEFORE_99_MAX_ROOM;
	if (TimeFrame:GetStateGS("OpenLevel99") == 1) then
		nMaxNum = self.DEF_AFTER_99_MAX_ROOM;
	end
	return nMaxNum;
end

function QianCengTower:GetRoomInfo(nRoomNum)
	return self.tbRoomInfoCfg[nRoomNum];
end

function QianCengTower:IsInGameMission(pPlayer)
	local tbMission = pPlayer.GetTempTable("QianCengTower").tbMission;	
	if (not tbMission) then
		return 0;
	end
	return 1;
end

function QianCengTower:GetPlayerEnterPos(nTempMapId)
	local tbMapPos = QianCengTower.tbMap2PosCfg[nTempMapId];
	return tbMapPos.tbEnterPos;
end

function QianCengTower:OnApplyOpen(nSureFlag)
	local nCheckFlag, szErrorMsg = self:IsCanSignUp(me);
	if (1 ~= nCheckFlag) then
		Dialog:Say(szErrorMsg);
		return 0;
	end

	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	local nMinSaveRoom = 999;
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		local nRoomStartNum = self:GetPlayerRoomSave(pPlayer);
		nRoomStartNum = math.floor(nRoomStartNum / 10);
		if (nMinSaveRoom > nRoomStartNum) then
			nMinSaveRoom = nRoomStartNum;
		end
	end
	
	local szMsg = string.format("Dưới đây là các cấp độ mà ngươi có thể chọn mở thử thạch, mời lựa chọn:");
	local tbOpt = {};

	for nBeginRoom = 0, nMinSaveRoom do
		local nRoomNum = nBeginRoom * 10 + 1;
		if (nRoomNum < self:GetMaxRoomNum()) then
			tbOpt[#tbOpt + 1] = {string.format("Tầng <color=yellow>Tháp %s<color>", nRoomNum), self.OnSureApplyOpen, self, nRoomNum};
		end
		nBeginRoom = nBeginRoom + 1;
	end
	
	tbOpt[#tbOpt + 1] = {"Để ta suy nghĩ"};
	Dialog:Say(szMsg, tbOpt);
	return 1;
end

function QianCengTower:GetTeamBestOpenRoomNum(pPlayer)
	if (pPlayer.nTeamId <= 0) then
		return -1;
	end
	
	local tbTeamMemberList = KTeam.GetTeamMemberList(pPlayer.nTeamId);

	if (#tbTeamMemberList > self.DEF_SIGN_MAX_TEAM_NUM) then
		return -1;
	end
	
	local nMinSaveRoom = 999;
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (not pTeamPlayer) then
			return -1;
		end

		local nRoomStartNum = self:GetPlayerRoomSave(pTeamPlayer);
		nRoomStartNum = math.floor(nRoomStartNum / 10);
		if (nMinSaveRoom > nRoomStartNum) then
			nMinSaveRoom = nRoomStartNum;
		end
	end
	return nMinSaveRoom;
end

function QianCengTower:OnSureApplyOpen(nRoomNum)
	Dialog:Say(string.format("Ngươi có chắc chắn muốn thử thách Tầng <color=yellow>Tháp %s<color>?", nRoomNum), {
			{"Chắc chắn", self.ApplyOpenGame, self, nRoomNum},
			{"Để ta suy nghĩ lại"},
		});
	return 1;
end

function QianCengTower:ApplyOpenGame(nMinSaveRoom)
	local nCheckFlag, szErrorMsg = self:IsCanSignUp(me);
	if (1 ~= nCheckFlag) then
		Dialog:Say(szErrorMsg);
		return 0;
	end
	
	local nBestNum = QianCengTower:GetTeamBestOpenRoomNum(me);
	if (nBestNum * 10 + 1 < nMinSaveRoom) then
		Dialog:Say("Tầng Tháp mà ngươi có thể đến là Tầng Tháp thấp nhất mà thành viên trong đội ngươi có thể đến");
		return 0;
	end
	
	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		pPlayer.AddWaitGetItemNum(1);
	end
	
	self:ApplyOpenGame_GS(me.szName, nMinSaveRoom);
	return 1;
end

function QianCengTower:OnEnterTower()
	local nEnterMapId = self:GetPlayerGameMap(me);
	
	local nMapFlag, szMapMsg = Map:CheckTagServerPlayerCount(nEnterMapId);
	if (1 ~= nMapFlag) then
		Dialog:Say(szMapMsg);
		return 0;
	end
	
	if me.IsCaptain() == 0 then
		Dialog:Say("Ngươi không phải đội trưởng không thể dẫn đội vào Tháp!");
		return 0;
	end

	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	if not tbTeamMemberList then
		Dialog:Say("Ngươi phải lập đội mới được vào Tháp!");
		return 0;
	end
	
	local nTeamSignMapId = self:GetPlayerLeavePos(me);
	local nTeamMissionId = self:GetPlayerMissionId(me);
	
	local nFlag, szError = self:IsCanEnterGame(me, nTeamSignMapId, nTeamMissionId);
	if (1 ~= nFlag) then
		Dialog:Say("" .. szError);
		return 0;
	end
	
	local nMapId, nPosX, nPosY = me.GetWorldPos();
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if not pTeamPlayer then
			Dialog:Say(string.format("Thành viên trong đội không ở gần đây không thể vào Tháp!"));
			return 0;
		end
		local nMapId2, nPosX2, nPosY2	= pTeamPlayer.GetWorldPos();
		if nMapId2 ~= nMapId then
			Dialog:Say(string.format("Thành viên đội <color=yellow>%s<color> không ở gần đây không thể vào Tháp!", pTeamPlayer.szName));
			return 0;
		end
		
		local nDisSquare = (nPosX - nPosX2)^2 + (nPosY - nPosY2)^2;
		if nMapId2 ~= nMapId or nDisSquare > self.DEF_SQU_SIGN_UP_DIS then
			Dialog:Say(string.format("Thành viên đội <color=yellow>%s<color> không ở gần đây không thể vào Tháp!", pTeamPlayer.szName));
			return 0;
		end
		
		local nFlag, szError = self:IsCanEnterGame(pTeamPlayer, nTeamSignMapId, nTeamMissionId);
		if (1 ~= nFlag) then
			Dialog:Say(string.format("Thành viên đội <color=yellow>%s<color> %s", pTeamPlayer.szName, szError));
			return 0;
		end
	end	

	local nCurOpenRoomNum = self:GetPlayerOpenRoom(me);
	local tbRoomInfo = self:GetRoomInfo(nCurOpenRoomNum);
	local tbEnterPos = self:GetPlayerEnterPos(tbRoomInfo.nTempMapId);

	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		pTeamPlayer.NewWorld(nEnterMapId, tbEnterPos[1], tbEnterPos[2]);
		pTeamPlayer.CallClientScript({"UiManager:CloseWindow","UI_NEWFUBENVIEW"});
	end

	return 1;
end

function QianCengTower:IsCanEnterGame(pPlayer, nSignMapId, nSignMissionId)
	local nApplyTime = self:GetOpenGameTime(pPlayer);
	local nNowTime = GetTime();
	
	if (nApplyTime <= 0) then
		return 0, "Thiên Tầng Tháp chưa mở";
	end
	
	if (nNowTime - nApplyTime >= self.DEF_TIME_SIGN_UP) then
		return 0, "Đội chưa mở Thiên Tầng Tháp!";
	end
	
	local nMissionId = self:GetPlayerMissionId(pPlayer);
	if (nMissionId <= 0 or nMissionId ~= nSignMissionId) then
		return 0, "Đội chưa mở Thiên Tầng Tháp!";
	end
	
	local nMapId = self:GetPlayerLeavePos(pPlayer);
	if (nMapId ~= nSignMapId) then
		return 0, "Đội chưa mở Thiên Tầng Tháp!";
	end
	
	return 1;
end

function QianCengTower:EnterGame(pPlayer)
	local nCurOpenRoomNum = self:GetPlayerOpenRoom(pPlayer);
	local tbRoomInfo = self:GetRoomInfo(nCurOpenRoomNum + 1);
	local tbEnterPos = self:GetPlayerEnterPos(tbRoomInfo.nTempMapId);
	pPlayer.NewWorld(nMapId, tbEnterPos[1], tbEnterPos[2]);
	pPlayer.CallClientScript({"UiManager:CloseWindow","UI_NEWFUBENVIEW"});
end

function QianCengTower:CheckBaseCondition(pPlayer)
	if (pPlayer.nLevel < self.MIN_JOIN_LEVEL) then
		return 0, string.format("Cấp độ chưa đạt %s không thể vào, vì sự an toàn của ngươi hãy rèn luyện thêm rồi quay lại!", self.MIN_JOIN_LEVEL);
	end
	
	if (pPlayer.nFaction <= 0) then
		return 0, "Chưa gia nhập môn phái không thể tham gia!";
	end
	
	

	if pPlayer.nTeamId <= 0 then
		return 0, "Hãy lập đội trước!";
	end	
	
	return 1;
end

function QianCengTower:IsCanSignUp(pPlayer)
	local szMapClass = GetMapType(pPlayer.nMapId) or ""
	if szMapClass ~= "village" and szMapClass ~= "city" then
		return 0, "Chỉ có thể mở Tháp tại thành thị và thôn trấn!";
	end
	
	local nErrorFlag, szErrorMsg = self:CheckBaseCondition(pPlayer);
	if (1 ~= nErrorFlag) then
		return 0, "" .. szErrorMsg;
	end

	if pPlayer.IsCaptain() == 0 then
		return 0, "Ngươi không phải đội trưởng không thể mở Tháp!";
	end

	local tbTeamMemberList = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	if not tbTeamMemberList then
		return 0, "Ngươi phải lập đội mới được vào Tháp!";
	end
	
	if (#tbTeamMemberList > self.DEF_SIGN_MAX_TEAM_NUM) then
		return 0, string.format("Thành viên đội không được vượt quá <color=yellow>%s<color> thành viên!", self.DEF_SIGN_MAX_TEAM_NUM);
	end

	
	

	
	local nNowTime = GetTime();
	local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if not pTeamPlayer then
			return 0, string.format("Thành viên trong đội không ở gần đây không thể vào Tháp!");
		end
		local nMapId2, nPosX2, nPosY2	= pTeamPlayer.GetWorldPos();
		if nMapId2 ~= nMapId then
			return 0, string.format("Thành viên đội <color=yellow>%s<color> không ở gần đây không thể vào Tháp!", pTeamPlayer.szName);
		end
		
		local nDisSquare = (nPosX - nPosX2)^2 + (nPosY - nPosY2)^2;
		if nMapId2 ~= nMapId or nDisSquare > self.DEF_SQU_SIGN_UP_DIS then
			return 0, string.format("Thành viên đội <color=yellow>%s<color> không ở gần đây không thể vào Tháp!", pTeamPlayer.szName);
		end
		
		local nFlag, szErrorMsg = self:CheckBaseCondition(pTeamPlayer);
		if (1 ~= nFlag) then
			return 0, string.format("Thành viên đội <color=yellow>%s<color> %s!", pTeamPlayer.szName, szErrorMsg);
		end		
		local nApplyTime = self:GetOpenGameTime(pTeamPlayer);
		local nDetTime = nNowTime - nApplyTime;
		if (nDetTime > 0 and nDetTime <= self.DEF_TIME_SIGN_UP) then
			return 0, string.format("Thành viên đội <color=yellow>%s<color> đã mở Tháp!", pTeamPlayer.szName);
		end
	end
	return 1;
end

function QianCengTower:IsCanOpen(pPlayer)
	if (pPlayer.nLevel < self.MIN_JOIN_LEVEL) then
		return 0, string.format("Cấp độ chưa đạt %s không thể vào, vì sự an toàn của ngươi hãy rèn luyện thêm rồi quay lại!", self.MIN_JOIN_LEVEL);
	end
	
	if (pPlayer.nFaction <= 0) then
		return 0, "Chưa gia nhập môn phái không thể tham gia!";
	end
	
	local nTodayJoinCount = self:GetPlayerTodayJoinCount(pPlayer);
	if (nTodayJoinCount <= 0) then
		return 0, "Hôm nay đã tham gia tối đa mai quay lại nhé!";
	end

	if pPlayer.nTeamId <= 0 then
		return 0, "Hãy lập đội trước!";
	end
	if pPlayer.IsCaptain() == 0 then
		return 0, "Ngươi không phải đội trưởng không thể mở Tháp!";
	end

	local tbTeamMemberList = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	if not tbTeamMemberList then
		return 0, "Hãy lập đội trước!";
	end
	
	local nNowTime = GetTime();

	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamMember = KPlayer.GetPlayerObjById(nPlayerId);
		if (pTeamMember) then
			local nApplyTime = self:GetOpenGameTime(pTeamMember);
			local nDetTime = nNowTime - nApplyTime;
			if (nDetTime > 0 and nDetTime <= 60 * 2) then
				return 0, string.format("Thành viên đội <color=yellow>%s<color> đã mở Tháp!", pTeamMember.szName);
			end
		end
	end

	return 1;
end

function QianCengTower:ApplyOpenGame_GS(szPlayerName, nRoomStartNum)
	if (not self.nTotalMissionId) then
		self.nTotalMissionId = 0;
	end
	local tbRoomInfo = self:GetRoomInfo(nRoomStartNum);
	if (not tbRoomInfo) then
		self:ApplyOpenGame_Failed_GS(szPlayerName, 0);
		return 0;
	end
	
	self.nTotalMissionId = self.nTotalMissionId + 1;

	local nMapFlag = Map:LoadDynMap(1, tbRoomInfo.nTempMapId, {self.OnLoadMapFinish, self, szPlayerName, nRoomStartNum, self.nTotalMissionId, 0});
	if (nMapFlag ~= 1) then
		self:ApplyOpenGame_Failed_GS(szPlayerName, 0, "Mở Tháp không thành không vui lòng thử lại!");
		return 0;
	end
	return 1;
end

function QianCengTower:ApplyOpenGame_Failed_GS(szPlayerName, bIsNewPlayerApply, szFailedMsg)
	local pPlayer = KPlayer.GetPlayerByName(szPlayerName);
	if (not pPlayer) then
		return 0;
	end
	
	szFailedMsg = szFailedMsg or "Mở Tháp không thành không vui lòng thử lại!"

	if (bIsNewPlayerApply == 1) then
		pPlayer.Msg(szFailedMsg);
		Dialog:SendBlackBoardMsg(pPlayer, szFailedMsg);		
		return 0;
	end
	
	local tbTeamMemberList = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	if tbTeamMemberList then
		for _, nPlayerId in ipairs(tbTeamMemberList) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pPlayer) then
				pPlayer.AddWaitGetItemNum(-1);
				pPlayer.Msg(szFailedMsg);
				Dialog:SendBlackBoardMsg(pPlayer, szFailedMsg);
			end
		end
	end	
end

function QianCengTower:OnLoadMapFinish(szPlayerName, nRoomStartNum, nMissionId, bIsNewPlayerApply, nDynMapId)	
	local nFlag = self:InitalOneQianCengTower(szPlayerName, nRoomStartNum, nMissionId, bIsNewPlayerApply, nDynMapId);
	if (1 == nFlag) then
		self:ApplyOpenGame_Successed_GS(szPlayerName, nMissionId, nDynMapId, nRoomStartNum, bIsNewPlayerApply);
	elseif (0 == nFlag) then
		self:ApplyOpenGame_Failed_GS(szPlayerName, bIsNewPlayerApply, "Mở Tháp không thành không vui lòng thử lại!");
		return 0;
	end
	
	if (not self.tbMisId2MapId) then
		self.tbMisId2MapId = {};
	end
	
	local nOrgMapId = self.tbMisId2MapId[nMissionId] or 0;
	
	self.tbMisId2MapId[nMissionId] = nDynMapId;

	if (not self.tbMapId2MisId) then
		self.tbMapId2MisId = {};
	end
	self.tbMapId2MisId[nDynMapId] = nMissionId;
	self.tbMapId2MisId[nOrgMapId] = nil;

	Map:RegisterMapForbidReviveType(nDynMapId,0,0, "Bản đồ hiện tại cấm hồi sinh tại chỗ và hồi sinh kỹ năng!");
	Map:RegisterMapForbidRemoteRevive(nDynMapId,0,"Bản đồ hiện tại cấm về thành!");	

	if (not szPlayerName) then
		return 0;
	end

	local pPlayer = KPlayer.GetPlayerByName(szPlayerName);
	if (not pPlayer) then
		return 0;
	end
	
	-- 新手
	if (bIsNewPlayerApply == 1) then		
		self:OnEnterTower_NewPlayer(pPlayer);
	end
	
	return 1;
end

function QianCengTower:ApplyOpenGame_Successed_GS(szPlayerName, nMissionId, nDynMapId, nRoomStartNum, bIsNewPlayerApply)
	local pPlayer = KPlayer.GetPlayerByName(szPlayerName);
	if (not pPlayer) then
		return 0;
	end
	
	local szMsg = "Thiên Tầng Tháp đã mở vui lòng nhanh chóng vào Tháp!"
	local nSaveMapId, nX, nY = pPlayer.GetWorldPos();
	local nNowTime = GetTime();	
	
	if (bIsNewPlayerApply == 1) then
		pPlayer.Msg(szMsg);
		Dialog:SendBlackBoardMsg(pPlayer, szMsg);
		self:SetPlayerGameMap(pPlayer, nDynMapId);
		self:SetOpenGameTime(pPlayer,nNowTime);
		self:SetPlayerOpenRoom(pPlayer, nRoomStartNum);
		self:SetPlayerLeavePos(pPlayer, nSaveMapId, nX, nY);
		QianCengTower:SetPlayerMissionId(pPlayer, nMissionId);
		return 1;
	end	

	local tbTeamMemberList = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	if tbTeamMemberList then
		for _, nPlayerId in ipairs(tbTeamMemberList) do
			local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pTeamPlayer) then
				pTeamPlayer.AddWaitGetItemNum(-1);
				pTeamPlayer.Msg(szMsg);
				Dialog:SendBlackBoardMsg(pTeamPlayer, szMsg);

				self:SetPlayerGameMap(pTeamPlayer, nDynMapId);
				self:SetOpenGameTime(pTeamPlayer,nNowTime);
				self:SetPlayerOpenRoom(pTeamPlayer, nRoomStartNum);
				self:SetPlayerLeavePos(pTeamPlayer, nSaveMapId, nX, nY);
				QianCengTower:SetPlayerMissionId(pTeamPlayer, nMissionId);
				--TreasureMap.TreasureMapEx:ApplyTreasuremapInfo(pTeamPlayer);
			end
		end
	end		
end

function QianCengTower:InitalOneQianCengTower(szPlayerName, nRoomStartNum, nMissionId, bIsNewPlayerApply, nDynMapId)
	if (not self.tbMissionList) then
		self.tbMissionList = {};
	end
	
	local tbMission = self.tbMissionList[nMissionId];
	if (tbMission) then
		tbMission:ApplyMapSuccessd(nDynMapId);
		return 2;
	end
	
	tbMission = Lib:NewClass(QianCengTower.RoomBaseMission, nMissionId, nRoomStartNum, bIsNewPlayerApply, nDynMapId);
	if (not tbMission) then
		return 0;
	end
	
	tbMission:Open();
	
	self.tbMissionList[nMissionId] = tbMission;
	self.nOpenGameNum = 0;
	if (bIsNewPlayerApply == 1) then
		self.nOpenNewPlayerGameNum = self.nOpenNewPlayerGameNum + 1;
	else
		self.nOpenGameNum = self.nOpenGameNum + 1;	
	end
	
	return 1;
end

--开启界面
function QianCengTower:OpenSingleUi(pPlayer, szMsg, nLastFrameTime)
	if not pPlayer then
		return 0;
	end
	Dialog:SetBattleTimer(pPlayer,  szMsg, nLastFrameTime);
	Dialog:ShowBattleMsg(pPlayer,  1,  0); --开启界面
end

--关闭界面
function QianCengTower:CloseSingleUi(pPlayer)
	if not pPlayer then
		return 0;
	end
	Dialog:ShowBattleMsg(pPlayer,  0,  0); -- 关闭界面
end

--更新界面时间
function QianCengTower:UpdateTimeUi(pPlayer, szMsg, nLastFrameTime)
	if not pPlayer then
		return 0;
	end
	Dialog:SetBattleTimer(pPlayer,  szMsg, nLastFrameTime);
end

--更新界面信息
function QianCengTower:UpdateMsgUi(pPlayer, szMsg)
	if not pPlayer then
		return 0;
	end
	Dialog:SendBattleMsg(pPlayer, szMsg, 1);
end

function QianCengTower:LoadCfgFile()
	local tbFile = Lib:LoadTabFile(self.TOWER_CFGFILE);
	if not tbFile then
		return
	end
	self.tbRoomInfoCfg = {};
	local tbRoomInfo = {};
	for nId, tbParam in ipairs(tbFile) do
		if (nId > 1) then
			local nTempMapId	= tonumber(tbParam["TEMP_MAP_ID"]) or 0;
			local nRank			= tonumber(tbParam["ROOM_RANK"]) or 0;
			local nRoomType		= tonumber(tbParam["ROOM_TYPE"]) or 0;
			local nNormalNpc	= tonumber(tbParam["NORMAL_NPC"]);
			local nNormalNum	= tonumber(tbParam["NORMAL_NUM"]);
			local nNormalLevel	= tonumber(tbParam["NORMAL_LEVEL"]);
			local nJingNpc		= tonumber(tbParam["JING_NPC"]);
			local nJingNum		= tonumber(tbParam["JING_NUM"]);
			local nJingLevel	= tonumber(tbParam["JING_LEVEL"]);
			local nBossNpc		= tonumber(tbParam["BOSS_NPC"]);
			local nBossNum		= tonumber(tbParam["BOSS_NUM"]);
			local nBossLevel	= tonumber(tbParam["BOSS_LEVEL"]);
			local nNpcLevel		= tonumber(tbParam["NPC_LEVEL"]);
			local nStar			= tonumber(tbParam["STAR_NPC"]);
			local nStarNum		= tonumber(tbParam["STAR_NUM"]);
			local nStarDamage1	= tonumber(tbParam["STAR_DAMAGE1"]);
			local nStarDamage1Num = tonumber(tbParam["STAR_DAMAGE1_NUM"]);
			local nStarDamage2	= tonumber(tbParam["STAR_DAMAGE2"]);
			local nStarDamage2Num = tonumber(tbParam["STAR_DAMAGE2_NUM"]);
			local nStarBuffNpc	= tonumber(tbParam["STAR_BUFF_NPC"]);
			local nStarBuffNpcNum= tonumber(tbParam["STAR_BUFF_NPC_NUM"]);
			local nBox			= tonumber(tbParam["BOX_NPC"]);
			local nBoxNum		= tonumber(tbParam["BOX_NPC_NUM"]);
			local nBoxNpc		= tonumber(tbParam["PICK_NPC"]);
			local nBoxNpcNum 	= tonumber(tbParam["PICK_NPC_NUM"]);
			local nBoxBoss		= tonumber(tbParam["PICK_BOSS"]);
			local nBoxBossNum 	= tonumber(tbParam["PICK_BOSS_NUM"]);
			local nStarFinishNum= tonumber(tbParam["STAR_FINISH_NUM"]);
			
			if (nTempMapId > 0 and nRank > 0 and nRoomType > 0) then
				if (not tbRoomInfo[nRank]) then
					tbRoomInfo[nRank] = {};
				end
				tbRoomInfo[nRank] = {
						nTempMapId	= nTempMapId,
						nRank		= nRank,
						nRoomType	= nRoomType,
						nNormalNpc	= nNormalNpc,
						nNormalNum	= nNormalNum,
						nNormalLevel = nNormalLevel,
						nJingNpc	= nJingNpc,
						nJingNum	= nJingNum,
						nJingLevel	= nJingLevel,
						nBossNpc	= nBossNpc,
						nBossNum	= nBossNum,
						nBossLevel	= nBossLevel,
						nNpcLevel	= nNpcLevel,
						nStar		= nStar,
						nStarNum	= nStarNum,
						nStarFinishNum	= nStarFinishNum,
						nStarDamage1	= nStarDamage1,
						nStarDamage1Num = nStarDamage1Num,
						nStarDamage2	= nStarDamage2,
						nStarDamage2Num = nStarDamage2Num,
						nStarBuffNpc	= nStarBuffNpc,
						nStarBuffNpcNum = nStarBuffNpcNum,
						nBox		= nBox,
						nBoxNum		= nBoxNum,
						nBoxNpc		= nBoxNpc,
						nBoxNpcNum	= nBoxNpcNum,
						nBoxBoss	= nBoxBoss,
						nBoxBossNum	= nBoxBossNum,
					};
			end
		end
	end
	self.tbRoomInfoCfg = tbRoomInfo;
end

function QianCengTower:LoadDetailNpcPos(szFileName)
	local tbFile = Lib:LoadTabFile(szFileName);
	if not tbFile then
		return
	end
	local tbPosList = {};
	local tbPos2Trap = {};
	for nId, tbParam in ipairs(tbFile) do
		local nRound	= tonumber(tbParam["ROUND"]) or 1;
		local nMapX		= tonumber(tbParam["MAPX"]);
		local nMapY		= tonumber(tbParam["MAPY"]);
		local szTrapName = tbParam["TRAP_NAME"];
		if (nMapX > 0 and nMapY > 0) then
			if (not tbPosList[nRound]) then
				tbPosList[nRound] = {};
			end
			table.insert(tbPosList[nRound], {nMapX, nMapY});
			local nKey = nMapX * 10000 + nMapY;
			tbPos2Trap[nKey] = szTrapName;
		end
	end
	return tbPosList, tbPos2Trap;
end

function QianCengTower:LoadNpcPosFile()
	local tbFile = Lib:LoadTabFile(self.TOWER_NPC_POSFILE);
	if not tbFile then
		return
	end
	self.tbMap2PosCfg = {};
	local tbMap2PosCfg = {};
	for nId, tbParam in ipairs(tbFile) do
		if (nId > 1) then
			local nTempMapId = tonumber(tbParam["TEMP_MAP_ID"]) or 0;
			if (nTempMapId > 0) then
				if (not tbMap2PosCfg[nTempMapId]) then
					tbMap2PosCfg[nTempMapId] = {};
				end
				local szNormalNpcPos = tbParam["NORMAL_NPC_POS"];
				local tbNormalNpcPos = self:LoadDetailNpcPos(szNormalNpcPos);
				tbMap2PosCfg[nTempMapId].tbNormalNpcPos = tbNormalNpcPos;
				
				local szJingNpcPos 	= tbParam["JING_POS"];
				local tbJingNpcPos 	= self:LoadDetailNpcPos(szJingNpcPos);
				tbMap2PosCfg[nTempMapId].tbJingNpcPos = tbJingNpcPos;
				
				local szBossPos 	= tbParam["BOSS_POS"];
				local tbBossNpcPos 	= self:LoadDetailNpcPos(szBossPos);
				tbMap2PosCfg[nTempMapId].tbBossNpcPos = tbBossNpcPos;
				
				local nPlayerEnterX = tonumber(tbParam["PLAYER_ENTER_POS_X"]);
				local nPlayerEnterY = tonumber(tbParam["PLAYER_ENTER_POS_Y"]);
				tbMap2PosCfg[nTempMapId].tbEnterPos = {nPlayerEnterX, nPlayerEnterY};
				
				local szStarPos = tbParam["STAR_POS"];
				local tbStarPos, tbTrapName	= self:LoadDetailNpcPos(szStarPos);
				tbMap2PosCfg[nTempMapId].tbStarPos = tbStarPos;
				tbMap2PosCfg[nTempMapId].tbStarTrapName = tbTrapName;

				local szRandBossPos = tbParam["RAND_POS"];
				local tbRandBossPos	= self:LoadDetailNpcPos(szRandBossPos);
				tbMap2PosCfg[nTempMapId].tbRandBossPos = tbRandBossPos;

				local szBoxPos = tbParam["RESCUE_POS"];
				local tbBoxPos	= self:LoadDetailNpcPos(szBoxPos);
				tbMap2PosCfg[nTempMapId].tbBoxPos = tbBoxPos;

				local szBoxNpcPos	= tbParam["PICK_POS"];
				local tbBoxNpcPos	= self:LoadDetailNpcPos(szBoxNpcPos);
				tbMap2PosCfg[nTempMapId].tbBoxNpcPos = tbBoxNpcPos;
				
				local szBoxBossPos	= tbParam["PICK_BOSS_POS"];
				local tbBoxBossPos	= self:LoadDetailNpcPos(szBoxBossPos);
				tbMap2PosCfg[nTempMapId].tbBoxBossPos = tbBoxBossPos;
			end
		end
	end
	self.tbMap2PosCfg = tbMap2PosCfg;
end

function QianCengTower:UpdateDaliyFreeCount(pPlayer)
	if (GLOBAL_AGENT) then
		return 0;
	end
	local nUpdateTime	= pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_UPDATE_JOIN_COUNT_TIME);
	local nNowTime		= GetTime();
	local nUpdateDay	= Lib:GetLocalDay(nUpdateTime);
	local nNowDay		= Lib:GetLocalDay(nNowTime);
	if (nUpdateDay >= nNowDay) then
		return 0;
	end
	
	local nOrgCount = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_TODAY_JOIN_COUNT);
	local nDetCount = (nNowDay - nUpdateDay) * self.FREE_DALIY_COUNT;
	local nAddCount = nDetCount + nOrgCount;
	if (nAddCount > self.MAX_FREE_COUNT) then
		nAddCount = self.MAX_FREE_COUNT;
	end
	
	if (nUpdateTime <= 0) then
		nAddCount = self.FREE_DALIY_COUNT;
	end
	
	if (pPlayer.nLevel >= 50) then
		local szMsg = string.format("Hôm nay ngươi nhận được %s lần mở Tháp, tổng số lần mở Tháp của ngươi còn %s lần.", nAddCount - nOrgCount, nAddCount);
		pPlayer.Msg(szMsg);
	end
	
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_UPDATE_JOIN_COUNT_TIME, nNowTime);
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_TODAY_JOIN_COUNT, nAddCount);
	return 1
end

function QianCengTower:OnOpenReviveMsgBox(pPlayer)
	pPlayer.CallClientScript({"QianCengTower:OnOpenReviveMsgBox_Client"});
end

function QianCengTower:ApplyQianCengTowerRevive()
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 0;
	end
	tbMission:RevivePlayerByItem(me);
	return 1;
end

function QianCengTower:ApplyEnterQianCengTower(nRoomNum)
	local nFlag = self:IsInGameMission(me);
	if (1 == nFlag) then
		return 0;
	end
	
	nRoomNum = math.floor(nRoomNum / 10) * 10 + 1;
	
	local nSignUpTime = QianCengTower:GetOpenGameTime(me);
	local nEnterFuBen = 0;
	
	local nNowTime = GetTime();
	local nDetTime = nNowTime - nSignUpTime;
	if (nDetTime < QianCengTower.DEF_TIME_SIGN_UP) then
		self:OnEnterTower();
		return;
	end
	
	local nMaxNum = self:GetMaxRoomNum();
	if (nRoomNum <= 0 or nRoomNum > nMaxNum) then
		return 0;
	end
	
	self:OnSureApplyOpen(nRoomNum);
end

function QianCengTower:ApplyLeaveQianCengRoom(pPlayer)
	local tbMission = pPlayer.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 0;
	end
	tbMission:LeaveGame(pPlayer);
end

function QianCengTower:CloseGameMission(nMissionId, bIsNewPlayerApply)
	if (bIsNewPlayerApply == 1) then
		self.nOpenNewPlayerGameNum = self.nOpenNewPlayerGameNum - 1;
	else
		self.nOpenGameNum = self.nOpenGameNum - 1;
	end
	self.tbMissionList[nMissionId] = nil;
	local nMapId = self.tbMisId2MapId[nMissionId];
	self.tbMapId2MisId[nMapId] = nil;
	self.tbMisId2MapId[nMissionId] = nil;
end

-- 新手报名新手副本
function QianCengTower:ApplyOpenGame_NewPlayer(pPlayer)
	local nCheckFlag, szErrorMsg = self:IsCanSignUp_NewPlayer(pPlayer);
	if (1 ~= nCheckFlag) then
		Dialog:SayByPlayer(pPlayer, szErrorMsg);
		return 0;
	end
		
	self:ApplyOpenGame_NewPlayer_GS(pPlayer.szName, 1);
	return 1;
end

function QianCengTower:IsCanSignUp_NewPlayer(pPlayer)
	local szMapClass = GetMapType(pPlayer.nMapId) or ""
	if szMapClass ~= "village" and szMapClass ~= "city" then
		return 0, "Chỉ có thể mở Tháp tại thành thị và thôn trấn!";
	end
	
	local nErrorFlag, szErrorMsg = self:CheckBaseCondition_NewPlayer(pPlayer);
	if (1 ~= nErrorFlag) then
		return 0, "" .. szErrorMsg;
	end
	
	local nNowServerMapCount = GetCurGSServerAllLoadMapCount();
	local nMaxMapCount = GetCurGSServerMaxMapCount();
	if (not self.nOpenNewPlayerGameNum) then
		self.nOpenNewPlayerGameNum = 0;
	end
	
	if (nNowServerMapCount + 1 >= nMaxMapCount) then
		return 0, "Hiện tại Thiên Tầng Tháp đã đầy vui lòng quay lại sau!";
	end
	
	if (self.nOpenNewPlayerGameNum >= self.MAX_OPEN_MISSION_NEWPLAYER_COUNT) then
		return 0, "Hiện tại Thiên Tầng Tháp đã đầy vui lòng quay lại sau!";
	end
	
	return 1;
end

function QianCengTower:CheckBaseCondition_NewPlayer(pPlayer)
	if (pPlayer.nFaction <= 0) then
		return 0, "Chưa gia nhập môn phái không thể tham gia!";
	end
	
	local nGetNewXoYoState = Task.tbFubenTask:IsNewPlayerQianCeng(pPlayer);
	if (nGetNewXoYoState ~= 1) then
		return 0, "Không phải Tân Thủ không thể tham gia Thử Nghiệm!";
	end

	local nIsCanAgain = Task.tbFubenTask:IsCanSignUpQianGameAgainInTime(pPlayer);
	if (nIsCanAgain ~= 1) then
		return 0, "Sau 30 phút nữa mới có thể mở Tháp!"
	end
	
	return 1;
end

function QianCengTower:ApplyOpenGame_NewPlayer_GS(szPlayerName, nRoomStartNum)
	if (not self.nTotalMissionId) then
		self.nTotalMissionId = 0;
	end
	local tbRoomInfo = self:GetRoomInfo(nRoomStartNum);
	if (not tbRoomInfo) then
		self:ApplyOpenGame_Failed_GS(szPlayerName, 1);
		return 0;
	end
	
	self.nTotalMissionId = self.nTotalMissionId + 1;

	local nMapFlag = Map:LoadDynMap(1, tbRoomInfo.nTempMapId, {self.OnLoadMapFinish, self, szPlayerName, nRoomStartNum, self.nTotalMissionId, 1});
	if (nMapFlag ~= 1) then
		self:ApplyOpenGame_Failed_GS(szPlayerName, 1, "Mở Tháp không thành không vui lòng thử lại!");
		return 0;
	end
	return 1;
end

function QianCengTower:IsCanEnterGame_NewPlayer(pPlayer, nSignMapId, nSignMissionId)
	local nApplyTime = self:GetOpenGameTime(pPlayer);
	local nNowTime = GetTime();
	
	if (nApplyTime <= 0) then
		return 0, "Thiên Tầng Tháp chưa mở!";
	end
	
	local nMissionId = self:GetPlayerMissionId(pPlayer);
	if (nMissionId <= 0 or nMissionId ~= nSignMissionId) then
		return 0, "Thiên Tầng Tháp đã đóng vui lòng đăng ký lại!";
	end
	
	return 1;
end

function QianCengTower:OnEnterTower_NewPlayer(pPlayer)
	local nEnterMapId = self:GetPlayerGameMap(pPlayer);
	
	local nMapFlag, szMapMsg = Map:CheckTagServerPlayerCount(nEnterMapId);
	if (1 ~= nMapFlag) then
		Dialog:SayByPlayer(pPlayer, szMapMsg);
		return 0;
	end
	
	local nTeamSignMapId = self:GetPlayerLeavePos(pPlayer);
	local nTeamMissionId = self:GetPlayerMissionId(pPlayer);	
	
	local nFlag, szError = self:IsCanEnterGame_NewPlayer(pPlayer, nTeamSignMapId, nTeamMissionId);
	if (1 ~= nFlag) then
		Dialog:SayByPlayer(pPlayer, "Thành viên đội ngươi " .. szError);
		return 0;
	end
	
	local nCurOpenRoomNum = self:GetPlayerOpenRoom(pPlayer);
	local tbRoomInfo = self:GetRoomInfo(nCurOpenRoomNum);
	local tbEnterPos = self:GetPlayerEnterPos(tbRoomInfo.nTempMapId);
	pPlayer.NewWorld(nEnterMapId, tbEnterPos[1], tbEnterPos[2]);
	pPlayer.CallClientScript({"UiManager:CloseWindow","UI_NEWFUBENVIEW"});
	return 1;
end

----------------------------------------------------------
-- 八千里路翻牌
----------------------------------------------------------
function QianCengTower:IsCanFanPai(pPlayer, nRound)	
	if (nRound > self.DEF_MAX_FANPAI_COUNT) then
		return 0, string.format("Đã hết cơ hội %s rút thăm may mắn!", self.DEF_MAX_FANPAI_COUNT);
	end
	return 1;
end

function QianCengTower:ShowRandomItem(pPlayer, nRound)
	pPlayer.GetTempTable("QianCengTower").nFanPaiRound = nRound;
	local tbAwardList = self.tbFanPaiAwardList[nRound];
	local tbAwardItem = {};
	for i, tbAward in pairs(tbAwardList.tbAwardItem) do
		tbAwardItem[i] ={tbAward[1], tbAward[2]};
	end
	
	self:SetPlayerBuyFanPaiType(pPlayer, nRound);
	pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_QIANCENGFANPAI", nRound, tbAwardItem, self.DEF_MAX_FANPAI_COUNT});
	return 1;
end

function QianCengTower:ApplyJoinFanPai(pPlayer, nRoomNum)
	nRoomNum = nRoomNum or 0;
	local nGuessRound	= self:GetPlayerBuyFanPaiType(pPlayer);
	local nRandomRet	= self:GetPlayerFanResult(pPlayer);
	-- 如果有奖励先领取奖励
	if (nRandomRet > 0) then
		pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_QIANCENGFANPAI", 0, {}, self.DEF_MAX_FANPAI_COUNT});
		return 0;
	end

	if (not pPlayer.GetTempTable("QianCengTower").nFanPaiRound) then
		return 0;
	end
	
	local nIsInMission = self:IsInGameMission(pPlayer);
	
	-- 如果上次没抽完
	if (nGuessRound > 0 and nIsInMission ~= 1) then
		pPlayer.GetTempTable("QianCengTower").nFanPaiRound = nGuessRound;
		self:ShowRandomItem(pPlayer, nGuessRound);
		return 1;
	end
	
	local nRound = pPlayer.GetTempTable("QianCengTower").nFanPaiRound + 1;

	local nFlag, szError = self:IsCanFanPai(pPlayer, nRound);
	if (1 ~= nFlag) then
		Dialog:SayByPlayer(pPlayer, szError);
		return 0;
	end
	
	local nHaveCount = self:GetPlayerFanPaiCount(pPlayer);
	if (nRound == 1) then
		if (nIsInMission ~= 1) then
			return 1;
		end
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "lottery", pPlayer.nId, string.format("%s,%s,0,%s", nRoomNum, nRound, 0));
		self:ShowRandomItem(pPlayer, nRound);
		return 1;
	end
	
	-- 新手参与千层副本
	local nIsNewPlayerFreenFlag = pPlayer.GetTempTable("QianCengTower").nFreeFanPai or 0;
	if (nIsNewPlayerFreenFlag > 0) then
		self:ShowRandomItem(pPlayer, nRound);
		pPlayer.GetTempTable("QianCengTower").nFreeFanPai = nIsNewPlayerFreenFlag - 1;
		return 1;
	end
	
	local nFreeCount = math.floor(nHaveCount / 3);

	if (nRound == 2 and nFreeCount > 0) then
		if (nIsInMission == 1) then
			self:SetPlayerFanPaiCount(pPlayer, nHaveCount - 3);
			--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "lottery", pPlayer.nId, string.format("%s,%s,1,%s", nRoomNum, nRound, 1));
			self:ShowRandomItem(pPlayer, nRound);
			return 1;
		end
	end
	
	if (nIsInMission ~= 1 and nRound == 2) then
		local nCount = self:GetPlayerBuyFanPaiCount(pPlayer);
		if (nCount <= 0) then
			Dialog:SayByPlayer(pPlayer, "Hiện tại không thể rút thăm!");
			return 0;
		end
	end
	
	local tbAwardList = self.tbFanPaiAwardList[nRound];
	local tbConsumeItem = tbAwardList.tbConsumeItem;
	local szItemName	= KItem.GetNameById(unpack(tbConsumeItem.tbItem));
	local nJingHuo = tbAwardList.nNeedJingHuo;
	local szMsg = string.format("您可以选择消耗<color=yellow>%s个%s<color>或消耗<color=green>%s点精活<color>，购买一次抽奖机会，请选择", tbConsumeItem.nNeedCount, szItemName, nJingHuo);
	local tbOpt = {
			{string.format("<color=yellow>是，我要消耗%s个%s继续抽奖<color>", tbConsumeItem.nNeedCount, szItemName), self.OnSureBuyFanPaiCount, self, nRound, self.DEF_BUY_TYPE_FANPAI_COUNT_CONSUMEITEM, nRoomNum},
			{string.format("<color=green>是，我要花费%s点精活继续抽奖<color>", nJingHuo), self.OnSureBuyFanPaiCount, self, nRound, self.DEF_BUY_TYPE_FANPAI_COUNT_JINGHUO, nRoomNum},
			{"再考虑考虑"},
		};
	
	Dialog:SayByPlayer(pPlayer, szMsg, tbOpt);
end

function QianCengTower:OnSureBuyFanPaiCount(nRound, nBuyType, nRoomNum, nFlag)
	local nFlag, szError = self:IsCanFanPai(me, nRound);
	if (1 ~= nFlag) then
		Dialog:Say(szError);
		return 0;
	end
	
	local nIsInMission = self:IsInGameMission(me);
	if (nRound == 2 and nIsInMission == 0) then
		local nCount = self:GetPlayerBuyFanPaiCount(me);
		if (nCount <= 0) then
			Dialog:Say("当前没有可额外抽奖次数");
			return 0;
		end
	end

	local tbAwardList = self.tbFanPaiAwardList[nRound];
	local nNeedJingHuo = tbAwardList.nNeedJingHuo;
	local tbConsumeItem = tbAwardList.tbConsumeItem;
	
	-- 判断
	if (self.DEF_BUY_TYPE_FANPAI_COUNT_JINGHUO == nBuyType) then
		if me.dwCurGTP < nNeedJingHuo or me.dwCurMKP < nNeedJingHuo then
			Dialog:Say(string.format("你的精活不足，购买抽奖机会需要消耗精力和活力各<color=yellow>%s点<color>。",nNeedJingHuo));
			return 0;
		end		
	else
		local nHaveCount = me.GetItemCountInBags(unpack(tbConsumeItem.tbItem));
		if (tbConsumeItem.nNeedCount > nHaveCount) then
			local szItemName = KItem.GetNameById(unpack(tbConsumeItem.tbItem));
			local nDet = tbConsumeItem.nNeedCount - nHaveCount;
			Dialog:Say(string.format("<color=pink>第%s轮<color>抽奖需要<color=green>%s个%s<color>，您所携带的数量为<color=red>%s个<color>！需要现在购买吗？", nRound, tbConsumeItem.nNeedCount, szItemName, nHaveCount),
				{
					{string.format("购买<color=yellow>%s个%s<color>", nDet, szItemName), self.BuyConsumeItem, self, nDet, tbAwardList.nWareId},
					{"再考虑考虑"},
				});
			return 0;
		end
	end
	
	local nCount = self:GetPlayerBuyFanPaiCount(me);
	-- 消耗
	if (self.DEF_BUY_TYPE_FANPAI_COUNT_JINGHUO == nBuyType) then
		me.ChangeCurGatherPoint(-nNeedJingHuo);
		me.ChangeCurMakePoint(-nNeedJingHuo);
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "lottery", me.nId, string.format("%s,%s,3,%s", nRoomNum, nRound, nNeedJingHuo));
		
		if (nRound == 2 and nIsInMission == 0) then
			self:SetPlayerBuyFanPaiCount(me, nCount - 1);
		end
		
		QianCengTower:ShowRandomItem(me, nRound);
		return 1;	
	else
		local nRet = me.ConsumeItemInBags2(tbConsumeItem.nNeedCount, unpack(tbConsumeItem.tbItem));
		if (nRet ~= 0) then
			me.Msg("扣除道具失败！");
			return 0;
		end

		if (nRound == 2 and nIsInMission == 0) then
			self:SetPlayerBuyFanPaiCount(me, nCount - 1);
		end
		local szItemName = KItem.GetNameById(unpack(tbConsumeItem.tbItem));
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "lottery", me.nId, string.format("%s,%s,2,%s", nRoomNum, nRound, szItemName));
		QianCengTower:ShowRandomItem(me, nRound);
		return 1;
	end

	return 0;
end

function QianCengTower:BuyConsumeItem(nCount, nWareId)
	if (me.CountFreeBagCell() < nCount) then
		Dialog:Say(string.format("您的背包空间不足%s格无法购买！", nCount));
		return 0;
	end
	local nRet = me.ApplyAutoBuyAndUse(nWareId, nCount, 0);
	if (nRet ~= 1) then
		Dialog:Say("购买抽奖机会失败！");
		return 0;
	end
	return 1;
end

function QianCengTower:ApplyGuessAward(nSelectIndex)
	local nGuessRound = self:GetPlayerBuyFanPaiType(me);
	if (nGuessRound <= 0) then
		return 0;
	end
	
	local bNewPlayer = me.GetTempTable("QianCengTower").nIsInNewQianCeng or 0;
	
	local nRandomRet = self:RandomFanPaiItem(nGuessRound, bNewPlayer);
	self:SetPlayerFanResult(me, nRandomRet);
	--Achievement:Finish--Achievement(me, 529);
	self:ShowRandomResult(me, nRandomRet, nGuessRound, nSelectIndex);

	if (nGuessRound == 3) then
		me.AddKinReputeEntry(self.DEF_WEIWANG_FANPAI3);
	end
	return 1;
end

function QianCengTower:ApplyOpenQianCengFanPai()
	local nIsInMission = self:IsInGameMission(me);
	if (nIsInMission == 1) then
		me.Msg("只能在副本外打开界面！");
		return 0;
	end

	local szMapClass = GetMapType(me.nMapId) or ""
	if szMapClass ~= "village" and szMapClass ~= "city" then
		me.Msg("Chỉ có thể mở Tháp tại thành thị và thôn trấn!");
		return 0;
	end

	local nRandomRet	= self:GetPlayerFanResult(me);
	local nGuessRound	= self:GetPlayerBuyFanPaiType(me);
	local nCount = self:GetPlayerBuyFanPaiCount(me);
	if (nGuessRound <= 0 and nCount <= 0) then
		Dialog:Say("当前没有可额外抽奖次数");
		return 0;
	end
	
	me.GetTempTable("QianCengTower").nFanPaiRound = 1;
	QianCengTower:ApplyJoinFanPai(me);
	return 1;
end

function QianCengTower:ApplyGetQianFanPaiAward(pPlayer)
	local nGuessRound	= self:GetPlayerBuyFanPaiType(pPlayer);
	local nRandomRet	= self:GetPlayerFanResult(pPlayer);
	
	if (nGuessRound <= 0 or nRandomRet <= 0) then
		return 0;
	end
	
	local nRet = self:GiveFanPaiItem(pPlayer, nGuessRound, nRandomRet);
	if (1 == nRet) then
		local nRound = pPlayer.GetTempTable("QianCengTower").nFanPaiRound;
		pPlayer.CallClientScript({"Ui:ServerCall", "UI_QIANCENGFANPAI", "UpdateFanResult", nRound});
		if (nRound and nRound < 3) then
			Dialog:SendBlackBoardMsg(pPlayer, "继续下一次抽奖，获得更加丰厚的奖励！");
		else
			pPlayer.GetTempTable("QianCengTower").nFanPaiRound = nil;
		end
	end
end

function QianCengTower:RandomFanPaiItem(nRound, bNewPlayer)
	local tbAwardList = self.tbFanPaiAwardList[nRound];
	local nTotalRandom = 0;
	for i, tbAward in pairs(tbAwardList.tbAwardItem) do
		nTotalRandom = nTotalRandom + tbAward[3];
	end
	
	local nRandom = MathRandom(nTotalRandom);
	local nTotal = 0;
	for i, tbAward in ipairs(tbAwardList.tbAwardItem) do
		local nCurRandom = tbAward[3];
		if (bNewPlayer and bNewPlayer == 1) then
			nCurRandom = tbAward[8];
		end

		if (nRandom <= nTotal + nCurRandom) then
			return i, tbAward;
		end
		nTotal = nTotal + nCurRandom
	end
	return 1;
end

function QianCengTower:GiveFanPaiItem(pPlayer, nRound, nRet)
	local tbAwardList = self.tbFanPaiAwardList[nRound];
	if (not tbAwardList) then
		return 0;
	end
	local tbItem = tbAwardList.tbAwardItem[nRet];
	if (not tbItem) then
		return 0;
	end
	
	-- 条件判断
	if (tbItem[1] == "item") then		
		local nNeedBag = KItem.GetNeedFreeBag(tbItem[2][1], tbItem[2][2], tbItem[2][3], tbItem[2][4], nil, tbItem[2][5]);
		if pPlayer.CountFreeBagCell() < nNeedBag then
			pPlayer.Msg(string.format("您的背包空间不足%s格，无法领取奖励！", nNeedBag));
			return 0;
		end
	end
	
	-- 给予奖励
	self:SetPlayerBuyFanPaiType(pPlayer, 0);
	self:SetPlayerFanResult(pPlayer, 0);
	if (tbItem[1] == "weiwang") then
		pPlayer.AddKinReputeEntry(tbItem[2][1]);
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "get_award", pPlayer.nId, string.format("weiwang,%s", tbItem[2][1]));
	elseif (tbItem[1] == "item") then		
		pPlayer.AddStackItem(tbItem[2][1], tbItem[2][2], tbItem[2][3], tbItem[2][4], {bForceBind = tbItem[2][6]}, tbItem[2][5]);
		pPlayer.Msg(string.format("您得到了%s个物品奖励！", tbItem[2][5]));
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "get_award", pPlayer.nId, string.format("%s_%s_%s_%s,%s", tbItem[2][1], tbItem[2][2], tbItem[2][3], tbItem[2][4], tbItem[2][5]));
	end

	return 1;
end

function QianCengTower:ShowRandomResult(pPlayer, nRandomRet, nRound, nSelectIndex)
	local tbAwardList = self.tbFanPaiAwardList[nRound];
	local tbAwardItem = {};
	local tbTemp = {};
	local tbSelectTemp = {};
	local nIsKinTong = "";
	local tbResultAward = tbAwardList.tbAwardItem[nRandomRet];
	for i, tbAward in pairs(tbAwardList.tbAwardItem) do
		if (nRandomRet == i) then
			tbSelectTemp = {i, 1};
		else
			tbTemp[#tbTemp + 1] = {i};
		end
	end
	
	local szNormalMsg = string.format("在<color=gold>【八千里路】千层副本<color>中通过第%s轮抽奖获得了【%s】，真是可喜可贺！", nRound, tbResultAward[4]);
	-- 家族帮会公告
	if (tbResultAward[5] == 1) then
		if (pPlayer.dwTongId > 0) then
			Player:SendMsgToKinOrTong(pPlayer, szNormalMsg, 1);
		elseif (pPlayer.dwKinId > 0) then
			Player:SendMsgToKinOrTong(pPlayer, szNormalMsg, 0);
		end
	end
	
	-- 好友公告
	if (tbResultAward[6] == 1) then
		pPlayer.SendMsgToFriend(string.format("您的好友[<color=yellow>%s<color>]%s", pPlayer.szName, szNormalMsg));
	end
	
	-- 世界公告
	if (tbResultAward[7] == 1) then
		KDialog.NewsMsg(1, Env.NEWSMSG_NORMAL, string.format("侠客<color=gold>%s<color>%s", pPlayer.szName, szNormalMsg));
	end
	
	Lib:SmashTable(tbTemp);
	table.insert(tbTemp, nSelectIndex, tbSelectTemp);
	pPlayer.CallClientScript({"Ui:ServerCall", "UI_QIANCENGFANPAI", "UpdateFanResult" , nRound, tbTemp});
end

-- 这个只处理副本里的情况
function QianCengTower:CloseFanPaiGame(pPlayer)
	pPlayer.CallClientScript({"UiManager:CloseWindow","UI_QIANCENGFANPAI"});
	local nRound = pPlayer.GetTempTable("QianCengTower").nFanPaiRound;
	if (not nRound) then
		return 0;
	end
	
	me.GetTempTable("QianCengTower").nFanPaiRound = nil;
	
	local nIsInMission = self:IsInGameMission(pPlayer);
	if (nIsInMission ~= 1) then
		return 0;
	end	
	
	local nGuessRound	= self:GetPlayerBuyFanPaiType(pPlayer);
	local nRandomRet	= self:GetPlayerFanResult(pPlayer);
	
	local bNewPlayer = pPlayer.GetTempTable("QianCengTower").nIsInNewQianCeng or 0;
	
	if (nRandomRet > 0) then
		pPlayer.Msg("您有奖励尚未领取！请等下次抽奖或从【义军军需官】界面进行领奖！");
	elseif (nGuessRound > 0) then
		local nRandomRet = self:RandomFanPaiItem(nGuessRound, bNewPlayer);
		self:SetPlayerFanResult(pPlayer, nRandomRet);
		----Achievement:Finish--Achievement(pPlayer, 529);
		if (nGuessRound == 3) then
			pPlayer.AddKinReputeEntry(self.DEF_WEIWANG_FANPAI3);
		end
	end

	if (nRound > 1) then
		return 0;
	end	
	
	local nCount = self:GetPlayerBuyFanPaiCount(pPlayer);
	
	if (nCount >= self.DEF_MAX_FANPAI_EX_COUNT) then
		return 0;
	end
	
	self:SetPlayerBuyFanPaiCount(pPlayer, nCount + 1);
	Dialog:SendBlackBoardMsg(pPlayer, "您的付费抽奖机会将会保留！您可从【义军军需官】界面继续抽奖！");	
end

function QianCengTower:LoadQianFanPaiFile()
	local tbFile = Lib:LoadTabFile(self.TOWER_QIAN_FANPAI_FILE);
	if not tbFile then
		return
	end
	local tbFanPaiAwardList = {};
	self.tbFanPaiAwardList = {};
	for nId, tbParam in ipairs(tbFile) do
		if (nId > 1) then
			local nRound = tonumber(tbParam["ROUND"]);
			local nIndex = tonumber(tbParam["INDEX"]);
			local szConsumeItem = tbParam["CONSUME_ITEM"] or "";
			local nJingHuo = tonumber(tbParam["JINGHUO"]);
			local szName	= tbParam["NAME"];
			local szType	= tbParam["TYPE"];
			local szValue	= tbParam["VALUE"];
			local nWareId	= tonumber(tbParam["WAREID"]);
			local nRate		= tonumber(tbParam["RATE"]);
			local nIsKinTongMsg = tonumber(tbParam["KINTONGMSG"]) or 0;
			local nIsFriendMsg = tonumber(tbParam["FRIENDMSG"]) or 0;
			local nIsWorldMsg = tonumber(tbParam["WORLDMSG"]) or 0;
			local nNewRate = tonumber(tbParam["NEWRATE"]) or 0;
			if (nRound > 0) then
				local tbRound = tbFanPaiAwardList[nRound];
				if (not tbRound) then
					tbFanPaiAwardList[nRound] = {};
					tbRound = tbFanPaiAwardList[nRound];
				end

				tbRound.nNeedJingHuo = nJingHuo;
				tbRound.nWareId	= nWareId;
				
				if (not tbRound.tbAwardItem) then
					tbRound.tbAwardItem = {};
				end
				
				local tbValue = Lib:SplitStr(szValue);
				for i, value in pairs(tbValue) do
					tbValue[i] = tonumber(value);
				end
				
				local tbConsumeItem = {};
				tbConsumeItem.nNeedCount = 0;
				if (szConsumeItem and szConsumeItem ~= "") then
					local tbConsume = Lib:SplitStr(szConsumeItem);
					local tbItem = {
						tonumber(tbConsume[1]), 
						tonumber(tbConsume[2]), 
						tonumber(tbConsume[3]),
						tonumber(tbConsume[4]),
					};
					tbConsumeItem.tbItem = tbItem;
					tbConsumeItem.nNeedCount = tonumber(tbConsume[5]) or 0;
				end
				
				tbRound.tbConsumeItem = tbConsumeItem;
				tbRound.tbAwardItem[nIndex] = { szType, tbValue, nRate, szName, nIsKinTongMsg, nIsFriendMsg, nIsWorldMsg, nNewRate};
			end
		end
	end
	self.tbFanPaiAwardList = tbFanPaiAwardList;
end

-- 评价界面
function QianCengTower:ShowPingJiaWindow(pPlayer)
	local nAward = self:GetPlayerFinishAward(pPlayer);
	if (nAward <= 0) then
		return 0;
	end
	
	local nOpenRoom = self:GetPlayerFinishAwardStartRoom(pPlayer);
	
	pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_QIANCENGFINALSHOW", nOpenRoom, nOpenRoom + 20 - 1, nAward});
	return 1;
end

function QianCengTower:ApplyGetQianCengFinishAward(pPlayer)
	local nAward = self:GetPlayerFinishAward(pPlayer);
	if (nAward <= 0) then
		Dialog:SayByPlayer(pPlayer, "您没有八千里路完成奖励可以领取！");
		return 0;
	end
	
	if (pPlayer.CountFreeBagCell() < 1) then
		Dialog:SayByPlayer(pPlayer, "您的背包空间不足1格，请整理后再领取！");
		return 0;
	end
	
	self:GetFinishAward(pPlayer);
end

QianCengTower.tbFinishAward = {
		[1] = {18,1,2218,1,1,3600 * 24 * 30},
		[2] = {18,1,2218,2,1,3600 * 24 * 30},
		[3] = {18,1,2218,3,1,3600 * 24 * 30},
		[4] = {18,1,2218,4,1,3600 * 24 * 30},
	};

function QianCengTower:GetFinishAward(pPlayer)
	local nAward = self:GetPlayerFinishAward(pPlayer);
	local nStartRoom = self:GetPlayerFinishAwardStartRoom(pPlayer);
	self:SetPlayerFinishAward(pPlayer, 0);
	self:SetPlayerFinishAwardStartRoom(pPlayer, 0);
	local tbItem = self.tbFinishAward[nAward];
	local pItem = pPlayer.AddItemEx(tbItem[1], tbItem[2], tbItem[3], tbItem[4], {bForceBind = tbItem[5]}, nil, GetTime() + tbItem[6]);
	if (pItem) then
		pItem.SetGenInfo(1, nStartRoom);
	end
	pPlayer.CallClientScript({"UiManager:CloseWindow","UI_QIANCENGFINALSHOW"});
end

-- tbQianCengLadder = { [1] = { nRoomNum, nTime, tbTeam },}
-- tbTeam = {szName1, szName2, szName3};
function QianCengTower:ShowQianCengLadder()

end

function QianCengTower:GetOneLadderInfo(tbInfo)
	local nRoomNum = tbInfo[1];
	local nTime	= tbInfo[2];
	local tbTeam = tbInfo[3];
	
	local szMsg = string.format("<color=yellow>Đã đến Tháp<color>: %s\n", nRoomNum);
	szMsg = szMsg .. string.format("<color=green>Thời gian qua Tầng<color>: %s\n", Lib:TimeDesc(nTime));
	szMsg = szMsg .. "<color=pink>Thành viên đội<color>:"
	for i, szName in pairs(tbTeam) do
		if (i > 1) then
			szMsg = szMsg .. ",";
		end
		szMsg = szMsg .. szName;
	end
	szMsg = szMsg .. "\n\n";
	
	return szMsg;
end

function QianCengTower:OnLogin_UpdateEvent()
	QianCengTower:UpdateDaliyFreeCount(me);
	local szPlayerName = KGblTask.SCGetDbTaskStr(DBTASK_QIANCENGFUBEN_FIRST_PLAYER);
	if (szPlayerName == me.szName and me.FindTitle(19,4,1,0) == 0) then
		me.AddTitle(19,4,1,0);
	end
end

QianCengTower:LoadCfgFile();
QianCengTower:LoadNpcPosFile();
QianCengTower:LoadQianFanPaiFile();

PlayerEvent:RegisterGlobal("OnLoginOnly", QianCengTower.OnLogin_UpdateEvent, QianCengTower);
ServerEvent:RegisterServerStartFunc(QianCengTower.LoadQianCengLadder, QianCengTower);
