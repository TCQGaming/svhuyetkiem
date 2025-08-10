-- 文件名　:crosstimeroom_gs.lua
-- 创建者　:zhangjunjie
-- 创建时间:2011-08-01 15:22:28
-- 描述:时光屋gs 

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\boss\\crosstimeroom\\crosstimeroom_def.lua")


CrossTimeRoom.tbGameManager = {};
local tbGameManager = CrossTimeRoom.tbGameManager;

function tbGameManager:InitManager()
	self.tbGame = {};
	self.tbMap = {};
	self.tbPlayer = {};	--存储是谁开的副本
	self.nMapCount = 0;
	self.nGameCount = 0;
end

--gs根据server id申请fb
function tbGameManager:ApplyGame(nPlayerId,nServerId,nApplyMapId)
	if self.tbPlayer[nPlayerId] then
		return 0;
	end
	for i = 1, self.nMapCount do
		if not self.tbGame[self.tbMap[i]] and self.tbMap[i] and self.tbMap[i] ~= 0 then
			self.tbPlayer[nPlayerId] = self.tbMap[i];
			self.tbMap[i] = self.tbMap[i];
			self.tbGame[self.tbMap[i]] = Lib:NewClass(CrossTimeRoom.tbBase);
			self.tbGame[self.tbMap[i]]:InitGame(self.tbMap[i],nServerId,nPlayerId);
			self.nGameCount = self.nGameCount + 1;
			Map:RegisterMapForbidReviveType(self.tbMap[i],0,0, "Bản đồ cấm chức năng hồi sinh");
--			Map:RegisterMapForbidRemoteRevive(self.tbMap[i],0,"Bản đồ cắm về thành chửa trị");
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			local szName = pPlayer and pPlayer.szName or "";
			GCExcute{"CrossTimeRoom:SyncGameMapInfo_GC",nPlayerId,szName,nApplyMapId};	--同步申请信息到每个gs，保证一个队伍只开启一个副本
			if pPlayer then
				pPlayer.Msg("<color=yellow>Ngươi đã mở thành công Thời Quang Điện<color>, gọi bạn bè mau mau vào Thời Quang Điện. ");
				KTeam.Msg2Team(pPlayer.nTeamId, "Đội trưởng đã mở thành công Thời Quang Điện ");	
				--CrossTimeRoom:AddTeamPlayerLockBuff(pPlayer);
			end
			return 1;
		end
	end
	if self.nMapCount >= CrossTimeRoom.MAX_GAME then
		return 0;
	end
	if (Map:LoadDynMap(Map.DYNMAP_TREASUREMAP,CrossTimeRoom.nTemplateMapId, {self.OnLoadMapFinish,self,nPlayerId,nServerId,nApplyMapId}) == 1)then
		self.nMapCount = self.nMapCount + 1; 	-- 先占一个名额~不用等GC响应也能判断是否已经到达副本上限
		self.tbMap[self.nMapCount] = 0; 		-- 先标0防止其他副本使用本地图
		self.tbPlayer[nPlayerId] = 0;
		return 1;
	end
end

--地图加载完成后的回调
function tbGameManager:OnLoadMapFinish(nPlayerId,nServerId,nApplyMapId,nMapId)
	for nPlayerId, nIsFinishLoad in pairs(self.tbPlayer) do
		if nIsFinishLoad == 0 then
			for i = 1,  #self.tbMap do
				if self.tbMap[i] == 0 then
					self.tbPlayer[nPlayerId] = nMapId;
					self.tbMap[i] = nMapId;
					self.tbGame[self.tbMap[i]] = Lib:NewClass(CrossTimeRoom.tbBase);
					self.tbGame[self.tbMap[i]]:InitGame(self.tbMap[i],nServerId,nPlayerId);
					self.nGameCount = self.nGameCount + 1;
					Map:RegisterMapForbidReviveType(nMapId,0,0, "Bản đồ không cho hồi sinh");
--					Map:RegisterMapForbidRemoteRevive(nMapId,0,"Bản đồ không cho về thành trị thương");
					local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
					local szName = pPlayer and pPlayer.szName or "";
					GCExcute{"CrossTimeRoom:SyncGameMapInfo_GC",nPlayerId,szName,nApplyMapId};	--同步申请信息到每个gs，保证一个队伍只开启一个副本
					if pPlayer then
						pPlayer.Msg("<color=yellow>Ngươi đã mở thành công Thời Quang Điện<color>, mau mau gọi bạn bè vào nhanh. ");
						KTeam.Msg2Team(pPlayer.nTeamId, "Đội trưởng đã mở thành công Thời Quang Điện. ");	
						--CrossTimeRoom:AddTeamPlayerLockBuff(pPlayer);
					end
					return 1;
				end
			end
		end
	end
	return 0;
end

function CrossTimeRoom:Init()
	self.tbManager = {};
end

if not CrossTimeRoom.tbManager then
	CrossTimeRoom:Init();
end

--通过地图id获取fb对象
function CrossTimeRoom:GetGameObjByMapId(nMapId)
	local tbManager = self.tbManager;
	if tbManager[GetServerId()] and tbManager[GetServerId()].tbGame and tbManager[GetServerId()].tbGame[nMapId] then
		return tbManager[GetServerId()].tbGame[nMapId];
	end
end


--通过playerid 获取对象
function CrossTimeRoom:GetGameObjByPlayerId(nPlayerId)
	local tbManager = self.tbManager;
	if tbManager[GetServerId()] and tbManager[GetServerId()].tbPlayer[nPlayerId] and
		tbManager[GetServerId()].tbGame and tbManager[GetServerId()].tbGame[tbManager[GetServerId()].tbPlayer[nPlayerId]] then
		return tbManager[GetServerId()].tbGame[tbManager[GetServerId()].tbPlayer[nPlayerId]];
	end
end

function CrossTimeRoom:GetGameObjByTeamId(nTeamId)
	if nTeamId <= 0 then
		return;
	end
	local tbTeamList = KTeam.GetTeamMemberList(nTeamId);	
	if not tbTeamList then
		return;
	end
	for _,nPlayerId in pairs(tbTeamList) do
		local pGame = self:GetGameObjByPlayerId(nPlayerId);
		if pGame then
			return pGame;
		end
	end
end

--刷报名npc 
function CrossTimeRoom:AddApplyNpc_GS()
	--皇陵 không có 开放则不进行传送npc的刷出
	if TimeFrame:GetState("OpenBoss120") ~= 1 then
		return 0;
	else
		local nOpenBoss120Week = Lib:GetLocalWeek(TimeFrame:GetTime("OpenBoss120"));
		local nNowWeek = Lib:GetLocalWeek(GetTime());
		if nNowWeek <= nOpenBoss120Week then
			return 0;
		end
		if IsMapLoaded(CrossTimeRoom.nApplyNpcMapId) ~= 1 then
			return 0;
		end
		local tbPos = CrossTimeRoom.tbApplyNpcPos;
		self.pApplyNpc = KNpc.Add2(CrossTimeRoom.nApplyNpcTemplateId,100,-1,CrossTimeRoom.nApplyNpcMapId,tbPos[1],tbPos[2]);
		if self.nDeleteApplyNpcTimer and self.nDeleteApplyNpcTimer > 0 then
			Timer:Close(self.nDeleteApplyNpcTimer);
			self.nDeleteApplyNpcTimer = 0;
		end
		local szMsg = "Xung quanh Lam Phong Dương xuất hiện mây mù âm u sấm chóp đùng đùng. Lối vào Thời Quan Điện đã được khai mở. Mau mau đến Tàn Tích Cung A Phòng!";
		KDialog.NewsMsg(1, Env.NEWSMSG_NORMAL,szMsg);
		KDialog.MsgToGlobal(szMsg);
		self.nDeleteApplyNpcTimer = Timer:Register(CrossTimeRoom.nCloseTransferNpcDelay * Env.GAME_FPS, self.DeleteApplyNpc, self);
	end
end

--删除报名npc
function CrossTimeRoom:DeleteApplyNpc()
	if self.pApplyNpc then
		self.pApplyNpc.Delete();
	end
	self.nDeleteApplyNpcTimer = 0;
	local szMsg = "Thời Quang Điện báo danh người ly khai Tàn tích cung A Phòng!!";
	KDialog.NewsMsg(1, Env.NEWSMSG_NORMAL,szMsg);
	KDialog.MsgToGlobal(szMsg);
	return 0;
end

--申请
function CrossTimeRoom:ApplyGame_GS(nPlayerId,nServerId,nApplyMapId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not self.tbManager[nServerId] then
		self.tbManager[nServerId] = Lib:NewClass(tbGameManager);
		self.tbManager[nServerId]:InitManager();
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then	--已经有申请过了
		return 0;
	end
	local nRet = self.tbManager[nServerId]:ApplyGame(nPlayerId,nServerId,nApplyMapId);
	if nRet ~= 1 and pPlayer then
		--todo，通知申请 thất bại, 地图满了, xin thử lại sau
		pPlayer.Msg("Vui lòng quay trở lại sau!");
		return 0;
	end
end

--是否有申请过的副本存在
function CrossTimeRoom:IsAlreadyApply(nPlayerId)
	if not self.tbGameMapInfo then
		return 0;
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
		return 1,self.tbGameMapInfo[nPlayerId];
	end
	return 0;
end

--同步申请的信息，保证所有server一个队伍里只能申请一个
function CrossTimeRoom:SyncGameMapInfo_GS(nPlayerId,szName,nApplyMapId)
	if not self.tbGameMapInfo then
		self.tbGameMapInfo = {};
	end
	if not self.tbGameMapInfo[nPlayerId] then
		self.tbGameMapInfo[nPlayerId] = {};
	end
	self.tbGameMapInfo[nPlayerId].szName = szName;
	self.tbGameMapInfo[nPlayerId].nApplyMapId = nApplyMapId;
end

-- 关闭
function CrossTimeRoom:EndGame_GS(nPlayerId,nServerId,nMapId)
	if self.tbManager and self.tbManager[nServerId] and 
		self.tbManager[nServerId].tbGame and self.tbManager[nServerId].tbGame[nMapId] then
		Map:UnRegisterMapForbidRemoteRevive(nMapId);
		Map:UnRegisterMapForbidReviveType(nMapId);
		self.tbManager[nServerId].tbGame[nMapId] = nil;
		self.tbManager[nServerId].nGameCount = self.tbManager[nServerId].nGameCount - 1;
		self.tbManager[nServerId].tbPlayer[nPlayerId] = nil;
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
		self.tbGameMapInfo[nPlayerId] = nil;
	end
end

function CrossTimeRoom:GetGameNum(nServerId)
	if not self.tbManager[nServerId] then
		return 0;
	end
	return self.tbManager[nServerId].nGameCount;
end

--加入游戏
function CrossTimeRoom:JoinGame()
--[[	if me.GetTiredDegree1() == 2 then
		Dialog:Say("Nhà ngươi quá mệt mỏi, hãy nghỉ ngơi chút đã!");
		return;
	end]]
	local nRet,szMsg  = self:CheckCanJoin(me.nId);
	local pGame = self:GetGameObjByTeamId(me.nTeamId);
	if not pGame then
		return 0;
	end
	if nRet ~= 1  then
		Dialog:Say(szMsg);
		return 0;
	end	
	pGame:JoinGame(me);
end

--是否能进入
function CrossTimeRoom:CheckCanJoin(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local nTeamId = pPlayer.nTeamId;
	if nTeamId <= 0 then
		return 0,"Lập tổ đội !";
	end
	local nRet,szMsg = self:CheckCondition(nPlayerId);
	if nRet ~= 1 then
		return 0,szMsg;
	end
	local pGame = self:GetGameObjByTeamId(pPlayer.nTeamId);
	if not pGame then
		return 0,"Nhóm của ngươi thiếu lệnh bài. ";
	end
	--检查道具
	-- local bHasItem = self:CheckHaveJoinItem(pPlayer);
	-- if bHasItem ~= 1 and pGame:FindLogOutPlayer(pPlayer.nId) ~= 1 then	--进入过的就不用再判断是不是有道具了
		-- return 0,"Ngươi trên người không làm bài!!"
	-- end
	local nPlayerNum = pGame:GetPlayerCount();
	if nPlayerNum >= CrossTimeRoom.MAX_PLAYER then
		return 0,"Số ngươi chơi vào đã tối đa rồi!"
	end
--[[	if not Task:GetPlayerTask(pPlayer).tbTasks[479] then
		return 0,"Ngươi chưa nhận nhiệm vụ Thời Quan Điện!";
	end
	if Task:GetPlayerTask(pPlayer).tbTasks[479].nCurStep ~= 2 then
		return 0,"Hãy hoàn thành bước 2 nhiệm vụ Thời Quan Điện!";
	end]]
--	if pPlayer.GetSkillState(CrossTimeRoom.nLimitJoinHuanglingBuffId) <= 0 then
--		if self:IsTimeCanApply() == 1 then
--			return 1;
--		else
--			return 0,"    现在不是报名时间，无法进行报名!\n    <color=yellow>每天副本报名及开启时间 là: 15:25一15:35和22:25一22:35，该时间段以外玩家将无法报名或者进入副本. <color>";
--		end
--	end
	return 1;
end

--是否开启检测
function CrossTimeRoom:CheckCondition(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local tbTeamList = KTeam.GetTeamMemberList(pPlayer.nTeamId);	
	if not tbTeamList then
		return 0,"Không có tổ đội!";
	end
	local tbGame = {};
	local nGameCount = 0;
	for _,nPlayerId in pairs(tbTeamList) do
		if self:GetGameObjByPlayerId(nPlayerId) then
			tbGame[nPlayerId] = 1;
			nGameCount = nGameCount + 1;
		end
	end
	if nGameCount < 1 then
		local nGameNum = 0;
		local szMap = "";
		for _,nPlayerId in pairs(tbTeamList) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
				nGameNum = nGameNum + 1;
			end
		end
		if nGameNum < 1 then
			return 0,"Đổi trưởng đến đây mới có thể mở!";
		end
		if nGameNum > 1 then
			local szName = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
				end
			end
			return 0,string.format("Những người chơi khác nhau trong đội của Bạn đã mở ngục tối! Người chơi đã mở ngục tối là: \n",szName);		
		end
		if nGameNum == 1 then
			local szMap = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szMap = szMap ..  GetMapNameFormId(self.tbGameMapInfo[nPlayerId].nApplyMapId);
					break;
				end
			end
			return 0,string.format("Đội ngũ tại %s mở ra phó bản! Hãy vào trước!",szMap);	
		end
	end
	if nGameCount > 1 then
		local szMsg = "Của ngươi đội ngũ trung hữu vượt lên trước hai người mở ra quá phó bản liễu, một người đội ngũ chỉ có thể mở ra một người phó bản! Đã mở ra phó bản đích ngoạn gia vi:\n "
		local szName = "";
		for nId,_ in pairs(tbGame) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nId] then
				szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
			end
		end
		szMsg = szMsg .. szName;
		return 0,szMsg;
	end
	return 1;
end

--是否是申请时间
function CrossTimeRoom:IsTimeCanApply()
	local nTime = tonumber(os.date("%H%M",GetTime()));
	if nTime >= CrossTimeRoom.nBeginTransferTimeDay and nTime < CrossTimeRoom.nEndTransferTimeDay then
		return 1;
	elseif nTime >= CrossTimeRoom.nBeginTransferTimeNight and nTime < CrossTimeRoom.nEndTransferTimeNight then
		return 1;
	else
		return 0;
	end
end

--是否能申请fb
function CrossTimeRoom:CheckCanApply(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local tbTeamList = KTeam.GetTeamMemberList(pPlayer.nTeamId);	
	if not tbTeamList then
		return 0,"Không có tổ đội!";
	end
--	if self:IsTimeCanApply() ~= 1 then
--		return 0,"    现在不是报名时间，无法进行报名!\n    <color=yellow>每天副本报名及开启时间 là: 15:25一15:35和22:25一22:35，该时间段以外玩家将无法报名或者进入副本. <color>";
--	end
	local tbGame = {};
	local nGameCount = 0
	for _,nPlayerId in pairs(tbTeamList) do
		if self:GetGameObjByPlayerId(nPlayerId) then
			tbGame[nPlayerId] = 1;
			nGameCount = nGameCount + 1;
		end
	end
	if nGameCount < 1 then
		local nGameNum = 0;
		local szMap = "";
		for _,nPlayerId in pairs(tbTeamList) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
				nGameNum = nGameNum + 1;
			end
		end
		if nGameNum > 1 then
			local szName = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
				end
			end
			return 0,string.format("Nhóm của bạn có những người chơi khác nhau đã mở ngục tối! Người chơi đã mở ngục tối là : \n",szName);		
		end
		if nGameNum == 1 then
			local szMap = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szMap = szMap ..  GetMapNameFormId(self.tbGameMapInfo[nPlayerId].nApplyMapId);
					break;
				end
			end
			return 0,string.format("Nhóm của bạn đã có một bản sao trong %s ! Vui lòng truy cập và truy cập !",szMap);	
		end
	end
	if nGameCount > 1 then
		local szMsg = "Hơn hai người trong nhóm của Bạn đã mở ngục tối và một đội chỉ có thể mở một ngục tối! Những người chơi đã mở là:  \n"
		local szName = "";
		for nId,_ in pairs(tbGame) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nId] then
				szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
			end
		end
		szMsg = szMsg .. szName;
		return 0,szMsg;
	end
--[[	if not Task:GetPlayerTask(pPlayer).tbTasks[479] then
		return 0,"Bạn đã không chấp nhận nhiệm vụ của Yin Yang Temple of Time !";
	end
	if Task:GetPlayerTask(pPlayer).tbTasks[479].nCurStep ~= 2 then
		return 0,"Bạn đã không chấp nhận bước nhiệm vụ do Thời gian Miếu Âm Dương giao !";
	end]]
	return 1;
end

--检测是否有道具
function CrossTimeRoom:CheckHaveJoinItem(pPlayer)
	if not pPlayer then
		return 0;
	end
	local tbFind = pPlayer.FindItemInBags(unpack(CrossTimeRoom.ENTER_ITEM_GDPL));
	if #tbFind < 1 then
		return 0;
	end
	return 1;
end

--扣玩家道具
function CrossTimeRoom:ConsumePlayerItem(pPlayer)
	if not pPlayer then
		return 0;
	end
	local tbFind = pPlayer.FindItemInBags(unpack(CrossTimeRoom.ENTER_ITEM_GDPL));
	if #tbFind < 1 then
		return 0;
	end
	if #tbFind > 0 then
		pPlayer.ConsumeItemInBags(1, unpack(CrossTimeRoom.ENTER_ITEM_GDPL));
		--StatLog:WriteStatLog("stat_info","yinyangshiguangdian","enter",pPlayer.nId,1);	--数据埋点
		return 1;
	end	
end

--给玩家加buff
function CrossTimeRoom:AddPlayerLockBuff(pPlayer)
	if not pPlayer then
		return 0;
	end
	local nTime = tonumber(os.date("%H%M",GetTime()));
	local nSec = 45 * 60;
	if nTime >= CrossTimeRoom.nBeginTransferTimeDay and nTime < CrossTimeRoom.nDelteTransferNpcTimeDay then
		local nTime = tonumber(os.date("%Y%m%d%H%M",GetTime()));
		local nNewTime = tonumber(os.date("%Y%m%d0000",GetTime())) + CrossTimeRoom.nDelteTransferNpcTimeDay;
		nSec =  Lib:GetDate2Time(nNewTime) - Lib:GetDate2Time(nTime);
	elseif nTime >= CrossTimeRoom.nBeginTransferTimeNight and nTime < CrossTimeRoom.nDelteTransferNpcTimeNight then
		local nTime = tonumber(os.date("%Y%m%d%H%M",GetTime()));
		local nNewTime = tonumber(os.date("%Y%m%d0000",GetTime())) + CrossTimeRoom.nDelteTransferNpcTimeNight;
		nSec =  Lib:GetDate2Time(nNewTime) - Lib:GetDate2Time(nTime);
	end
	pPlayer.AddSkillState(CrossTimeRoom.nLimitJoinHuanglingBuffId,1,1,nSec * Env.GAME_FPS,1,0,1);
end

--给队伍玩家加buff
function CrossTimeRoom:AddTeamPlayerLockBuff(pPlayer)
	if not pPlayer then
		return 0;
	end
	if pPlayer.nTeamId <= 0 then
		return 0;
	end
	local tbMemberId,nCount = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	for _,nPlayerId in pairs(tbMemberId) do
		local pMember = KPlayer.GetPlayerObjById(nPlayerId);
		if pMember then
			self:AddPlayerLockBuff(pMember);
		end
	end
	return 1;
end


function CrossTimeRoom:GetCrossTimeRoomOpenState()
	local nOpenBoss120Week = Lib:GetLocalWeek(TimeFrame:GetTime("OpenBoss120"));
	local nNowWeek = Lib:GetLocalWeek(GetTime());
	if KGblTask.SCGetDbTaskInt(DBTASK_CROSSTIMEROOM_CLOSESTATE) ~= 0 then
		return 0;
	end
	if TimeFrame:GetState("OpenBoss120") ~= 1 then
		return 0;
	end
	if nNowWeek <= nOpenBoss120Week then
		return 0;
	end
	return 1;
end


--给予每周的时光屋令牌
function CrossTimeRoom:GiveCrossTimeRoomItem()
	local szMsg = string.format("    Nếu uy danh đạt được xếp hạng <color=yello>%s<color> trở lên, sau 12 giờ trưa thứ 2 hàng tuần , ta sẽ phát cho ngươi<color=yellow> 2 <color>lệnh bài để vào Thời Quang Điện, nhưng phải đợi thứ 2 sau khi server mở Hoàng Lăng.(<color=yellow>Hãy nhận lệnh bài trong tuần đó<color>)",CrossTimeRoom.nGetJoinItemBaseKinLevel,CrossTimeRoom.nGetJoinItemBasePlayerLevel,CrossTimeRoom.nEnterItemNum);
	local tbOpt = {};
	tbOpt[#tbOpt + 1] = {"Nhận lệnh bài Thời Quang Điện",self.OnGiveCrossTimeRoomEnterItem,self};
	tbOpt[#tbOpt + 1] = {"Để ta xem đã"};
	Dialog:Say(szMsg,tbOpt);
	return 1;
end

function CrossTimeRoom:OnGiveCrossTimeRoomEnterItem()
	local nOpenBoss120Week = Lib:GetLocalWeek(TimeFrame:GetTime("OpenBoss120"));
	local nNowWeek = Lib:GetLocalWeek(GetTime());
	if TimeFrame:GetState("OpenBoss120") ~= 1 then
		Dialog:Say("Xin lỗi . Tính năng Tần Lăng chưa mở!",{"Ta biết rồi"});
		return 0;
	end
	if nNowWeek <= nOpenBoss120Week then
		Dialog:Say("Xin lỗi ! Tuần thứ 2 sau khi server mở Hoàng Lăng mới có thể nhận!",{"Ta biết rồi"});
		return 0;
	end
	local nKinId, nMemberId = me.GetKinMember();	
	local cKin = KKin.GetKin(nKinId);
	if not cKin then
		Dialog:Say("Xin lỗi! Ngươi không có gia tộc - gia nhập gia tộc rồi hãy đến tìm ta",{"Ta biết rồi"});
		return 0;
	end
	local nTimeSec = GetTime();
	local nWeek = tonumber(os.date("%w",nTimeSec));
	nWeek = (nWeek == 0 and 7 or nWeek);
	local nTime = nWeek * 10000 + tonumber(os.date("%H%M",nTimeSec));
	if nTime < CrossTimeRoom.nGetEnterItemLimitTime then
		Dialog:Say("Xin lỗi! Chưa đến giờ Nhận lệnh bài thứ 2 <color=yellow>12:00<colr> hãy quay lại",{"Ta biết rồi"});
		return 0;
	end
	local nKinRank = HomeLand:GetKinRank(nKinId);
	if nKinRank <= 0 or nKinRank > CrossTimeRoom.nGetJoinItemBaseKinLevel then
		Dialog:Say("Uy danh Gia Tộc giang hồ của ngươi vẫn chưa đủ điều kiện nhận Lệnh bài Thời Quang Điện!",{"Ta biết rồi"});
		return 0;
	end
	local nPlayerRank = GetPlayerHonorRank(me.nId,11,0,0);	--获取个人uy danh giang hồ排行
	if nPlayerRank <= 0 or nPlayerRank > CrossTimeRoom.nGetJoinItemBasePlayerLevel then
		Dialog:Say("Uy danh giang hồ của ngươi vẫn chưa đủ điều kiện nhận Lệnh bài Thời Quang Điện!",{"Ta biết rồi"});
		return 0;
	end
	local nLastGetTime = Lib:GetLocalWeek(me.GetTask(CrossTimeRoom.nTaskGroupId,CrossTimeRoom.nTaskGetItemTime));
	local nNowWeekTime = Lib:GetLocalWeek(GetTime());
	if nLastGetTime == nNowWeekTime then
		Dialog:Say("Xin lỗi! Tuần này ngươi đã nhận rồi tuần sau hãy quay lại",{"Ta biết rồi"});
		return 0;
	end
	if me.CountFreeBagCell() < CrossTimeRoom.nEnterItemNum then
		local szMsg = "Hành trang không đủ chổ!";
		me.Msg(szMsg);
		return 0;
	end
	local tbItemGdpl = CrossTimeRoom.ENTER_ITEM_GDPL;
	local nRemainWeekDay = 7 - (tonumber(os.date("%w",nTimeSec)) == 0 and 7 or tonumber(os.date("%w",nTimeSec)));
	local nRemainDayTime = Lib:GetDate2Time(tonumber(os.date("%Y%m%d",GetTime()))) + 3600 * 24 * (nRemainWeekDay + 1);
	for i = 1 , CrossTimeRoom.nEnterItemNum do
		local pItem = me.AddItem(unpack(tbItemGdpl));
		if not pItem then
			Dbg:WriteLog("CrossTimeRoom", "Give Enter Item failed",me.szName);
		else
			pItem.SetTimeOut(0,nRemainDayTime);
			pItem.Sync();
		end	
	end
	local szKinName = cKin.GetName();
	--StatLog:WriteStatLog("stat_info","yinyangshiguangdian","get",me.nId,szKinName,2);	--数据埋点
	me.SetTask(CrossTimeRoom.nTaskGroupId,CrossTimeRoom.nTaskGetItemTime,GetTime());
	return 1;
end

--每周清除任务，并将次数清零
function CrossTimeRoom:PlayerWeekEvent()
	me.SetTask(CrossTimeRoom.nTaskGroupId,CrossTimeRoom.nTaskGetCount,0);
	Task:CloseTask(479,"failed");
end

function CrossTimeRoom:GetCrossTimeRoomNewTask_vn()
	if TimeFrame:GetServerOpenDay() > 270 then
		return 1;
	end
	return 0;
end

PlayerSchemeEvent:RegisterGlobalWeekEvent({CrossTimeRoom.PlayerWeekEvent,CrossTimeRoom});

