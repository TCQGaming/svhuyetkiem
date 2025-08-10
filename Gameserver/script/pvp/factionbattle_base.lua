-------------------------------------------------------------------
--File: 	factionbattle_base.lua
--Author: 	zhengyuhua
--Date: 	2008-1-8 17:38
--Describe:	Môn phái chiến ăn khớp 
-------------------------------------------------------------------
local tbBaseFaction	= {};	-- 	các môn phái Môn phái chiến cơ loại 
FactionBattle.tbBaseFaction = tbBaseFaction;

tbBaseFaction.tbSortFunc = {
	__lt = function(tbA, tbB)
		return tbA.nKey> tbB.nKey;
	end
};

function tbBaseFaction:init(nFaction, nMapId)
	self.tbAttendPlayer = nil;
	self.tbMapPlayer 	= nil;
	self.tbArena		= nil;				-- các đấu trường số liệu biểu 
	self.tbWinner		= {};
	self.tbNextWinner	= {};
	self.tbSort			= {};				-- tức thời sắp xếp thứ tự tin tức biểu 
	self.tb16Player		= {};
	self.tbSportscast	= {};				-- bỉ tái tình hình thực tế biểu （thi đấu trình mặt biên cần số liệu ）
	self.nFaction		= nFaction;			-- Môn phái 
	self.nAttendCount	= 0;				-- người tham gia đếm hết 
	self.nMapId			= nMapId			-- sân đấu địa đồ 
	self.nState			= 0;				-- hoạt động trạng thái 
	self.nStateJour		= 0;				-- trạng thái Lưu Thuỷ 
	self.nIndex			= 0;
	self.nTimerId 		= 0;				-- đúng giờ khí ID
	self.nFinalWinner	= 0;
	self.nMeleeConut	= 0;
	self.nFightTimerId 	= 0;				-- tiến nhập chiến đấu đảo kế thì （hoạt động toàn cục ）
	self.tbRestActitive = Lib:NewClass(FactionBattle.tbBaseFactionRest);	-- nghỉ ngơi đang lúc hoạt động đối tượng 
	self.tbRestActitive:InitRest(nMapId); -- mới bắt đầu hóa 
	
	-- mới bắt đầu hóa logsố liệu 
	self.tbRoutes = KPlayer.GetFactionInfo(nFaction).tbRoutes;
	self.tbAttendRount= {};		-- tham gia lộ tuyến phân bố 
	self.tbRouteKills = {};		-- sát nhân sổ lộ tuyến phân bố 
	self.tb16Rount	= {};		-- 16cường lộ tuyến phân bố 
	self.tb8Rount	= {};		-- 8cường lộ tuyến phân bố 
end

-- thu được Môn phái chiến người tham gia liệt biểu (không có tắc sáng tạo ，vĩnh viễn không quay lại quay về nil)
function tbBaseFaction:GetAttendPlayerTable()
	if not self.tbAttendPlayer then
		self.tbAttendPlayer = {}
	end
	return self.tbAttendPlayer;
end

-- từ người tham gia liệt biểu trung tìm kiếm mỗ ngoạn gia có hay không tồn tại return 0 or 1
function tbBaseFaction:FindAttendPlayer(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable();
	if (tbPlayer and tbPlayer[nPlayerId]) then
		return 1;
	end
	return 0;
end

-- từ người tham gia liệt biểu trung cắt bỏ mỗ ngoạn gia （nếu như tồn tại nói return 1, or return 0）
function tbBaseFaction:DelAttendPlayer(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable();

	if tbPlayer[nPlayerId] then
		tbPlayer[nPlayerId] = nil;
		self.nAttendCount = self.nAttendCount - 1;
		return 1;
	end
	return 0;
end

function tbBaseFaction:GetAttendPlayuerCount()
	if not self.nAttendCount then
		self.nAttendCount = 0;
	end
	return self.nAttendCount;
end

-- bả mỗ ngoạn gia xen vào đáo người tham gia liệt biểu trung (phản hồi 1 or 0, 1：xen vào thành công,0:dĩ tồn tại)
function tbBaseFaction:AddAttendPlayer(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable();
	if tbPlayer[nPlayerId] then
		return 0;
	end
	if not self.nAttendCount then
		self.nAttendCount = 0;
	end
	tbPlayer[nPlayerId] = {};
	tbPlayer[nPlayerId].nScore 		= 0;	-- hỗn chiến vi tích phân 	(bài danh căn cứ)
	tbPlayer[nPlayerId].nArenaId 	= 0;	-- hỗn chiến khu ID
	tbPlayer[nPlayerId].nTimerId	= 0;	-- lần nữa tiến vào trạng thái chiến đấu đúng giờ ID
	tbPlayer[nPlayerId].nDeathCount = 0;	-- tử vong số lần đếm hết 
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if pPlayer then
		tbPlayer[nPlayerId].szName = pPlayer.szName;
		tbPlayer[nPlayerId].szAccount = pPlayer.szAccount;
		local nRoute = pPlayer.nRouteId;
		if not self.tbAttendRount[nRoute] then
			self.tbAttendRount[nRoute] = 0;
		end
		self.tbAttendRount[nRoute] = self.tbAttendRount[nRoute] + 1;
	end
	self.nAttendCount = self.nAttendCount + 1;
	return 1;
end

-- thu hoạch sở hữu ngoạn gia liệt biểu （thi đấu thể thao địa đồ nội đích ）
function tbBaseFaction:GetMapPlayerTable()
	if not self.tbMapPlayer then
		self.tbMapPlayer = {};
		for i = 1, FactionBattle.ADDEXP_QUEUE_NUM do
			self.tbMapPlayer[i] = {};
		end
	end
	return self.tbMapPlayer;
end

-- từ sở hữu ngoạn gia liệt biểu trung cắt bỏ một cái ngoạn gia,nPlayerId vi Trống tắc toàn bộ san 
function tbBaseFaction:DelMapPlayerTable(nPlayerId)
	local tbMapPlayer = self:GetMapPlayerTable();
	for i = 1, FactionBattle.ADDEXP_QUEUE_NUM do
		if nPlayerId and tbMapPlayer[i][nPlayerId] then
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				self.tbRestActitive:LeaveEvent(pPlayer);
				self:SyncSportscast(pPlayer, 30 * 18);		-- mở ra hoạt động ，hoạt động mặt biên vẫn đang hữu hiệu 30miểu  --TODO
				self:SetOutMap(pPlayer);
			end
			tbMapPlayer[i][nPlayerId] = nil;
		elseif not nPlayerId then
			for nId in pairs(tbMapPlayer[i]) do
				local pPlayer = KPlayer.GetPlayerObjById(nId);
				if pPlayer then
					self.tbRestActitive:LeaveEvent(pPlayer);
					self:SyncSportscast(pPlayer, 10 * 60 * 18);		-- mở ra hoạt động ，hoạt động mặt biên vẫn đang hữu hiệu 10phút 
					self:SetOutMap(pPlayer);
				end
				tbMapPlayer[i][nId] = nil;
			end
		end
	end
end

-- tăng ngoạn gia đáo sở hữu ngoạn gia liệt biểu 
function tbBaseFaction:AddMapPlayerTable(nPlayerId)
 	local nIndex = self:GetEnterIndex();
	local tbMapPlayer = self:GetMapPlayerTable();
	tbMapPlayer[nIndex][nPlayerId] = 1;
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if pPlayer then
		self:UpdateMapPlayerInfo(nPlayerId);
		FactionBattle:CheckDegree(pPlayer);
		self:SyncSportscast(pPlayer);		-- đồng bộ mặt biên số liệu 
		self.tbRestActitive:JoinEvent(pPlayer); 
		self:SetInMap(pPlayer);
		local nCurPlayerCount = self:GetAttendPlayuerCount();
		local szMsg ="";
		if self.nState == FactionBattle.SIGN_UP then
			if nCurPlayerCount>= FactionBattle.MAX_ATTEND_PLAYER then
				szMsg = string.format("Báo danh nhân số người tham gia được %d nhân sĩ hạn mức cao nhất ，bạn đến trễ không thể tham gia", FactionBattle.MAX_ATTEND_PLAYER);	
--			elseif (Wlls:CheckFactionLimit() == 1 and pPlayer.nLevel>= FactionBattle.MAX_LEVEL) then
--				szMsg ="ngươi đã xuất sư ，bất năng tham gia nữa Môn phái thi đấu thể thao";
			elseif pPlayer.nLevel <FactionBattle.MIN_LEVEL then
				szMsg ="Ngươi cấp bậc chưa đủ"..FactionBattle.MIN_LEVEL.."cấp ，không thể tham gia trận này rồi"
			else
				self:AddAttendPlayer(nPlayerId);
				szMsg ="Ngươi đã báo danh thi đấu";
			end
		elseif self.nState> FactionBattle.SIGN_UP then
			szMsg ="Môn phái thi đấu thể thao đã bắt đầu rồi ，báo danh đã hết hạn";
		else
			return 0;
		end
		Dialog:SendBlackBoardMsg(pPlayer, szMsg);
	end
end


-- tự động phân phối Index，thực hiện phân đội liệt tồn trữ địa đồ ngoạn gia ，phân tránh +kinh nghiệm 
function tbBaseFaction:GetEnterIndex()
	if not self.nIndex then
		self.nIndex = 0;
	end
	self.nIndex = self.nIndex + 1;
	return self.nIndex % FactionBattle.ADDEXP_QUEUE_NUM + 1;
end

-- thu được mỗ thi đấu nơi sân đích ngoạn gia 
function tbBaseFaction:GetArenaPlayer(nArenaId)
	if not self.tbArena then
		self.tbArena = {};
	end
	if not self.tbArena[nArenaId] then
		self.tbArena[nArenaId] = {};
	end
	return self.tbArena[nArenaId];
end

-- bả một cái ngoạn gia tăng đáo một cái nơi sân liệt biểu trung 
function tbBaseFaction:AddArenaPlayer(nArenaId, nPlayerId)
	local tbPlayer = self:GetArenaPlayer(nArenaId);
	local tbAttendPlayer = self:GetAttendPlayerTable();
	if ((tbPlayer[nPlayerId]) or (not tbAttendPlayer[nPlayerId])) then
		return 0;
	end
	tbAttendPlayer[nPlayerId].nArenaId = nArenaId;
	tbPlayer[nPlayerId] = 1;
end

-- từ mỗ trong sân cắt bỏ một cái ngoạn gia 
function tbBaseFaction:DelArenaPlayer(nArenaId, nPlayerId)
	if not nArenaId or not nPlayerId then
		return;
	end
	
	if (self.nState == FactionBattle.ELIMINATION and self.tbAttend) then
		for i, tbplayerId in pairs(self.tbAttend) do
			if (nPlayerId == tbplayerId[1] or nPlayerId == tbplayerId[2]) then
				local pPlayer1 = KPlayer.GetPlayerObjById(tbplayerId[1]);
				local pPlayer2 = KPlayer.GetPlayerObjById(tbplayerId[2]);
				if (pPlayer1) then
					Dialog:SendBattleMsg(pPlayer1,"");
				end;
				if (pPlayer2) then
					Dialog:SendBattleMsg(pPlayer2,"")
				end;
				self.tbAttend[i] = nil;
			end;
		end;
	end;
	
	local tbPlayer = self:GetArenaPlayer(nArenaId)
	if tbPlayer[nPlayerId] then
		tbPlayer[nPlayerId]= nil;
	end
	
end

-- kiểm tra địa đồ trung có hay không đã có nhân tồn tại ，tịnh tố ta xử lý 
function tbBaseFaction:CheckMap()
	local tbPlayer = KPlayer.GetMapPlayer(self.nMapId);
	for i, pPlayer in pairs(tbPlayer) do
		self:AddMapPlayerTable(pPlayer.nId);	-- gia tới đất đồ ngoạn gia liệt biểu trung 
	end
end

-- phân giai đoạn đúng giờ bắt đầu 
function tbBaseFaction:TimerStart(szFunction)
	local nRet;
	self.nTimerId = 0;
	if szFunction then
		local fncExcute = self[szFunction];
		if fncExcute then
			nRet = fncExcute(self);
			if nRet and nRet == 0 then	
				self:ShutDown();	-- đóng hoạt động 
				return 0;
			end
		end
	end
	-- trạng thái chuyển hoán 
	self.nStateJour = self.nStateJour + 1;
	self.nState = FactionBattle.STATE_TRANS[self.nStateJour][1];
	if self.nState == FactionBattle.NOTHING or self.nState>= FactionBattle.END then	-- vị tất mở ra có lẽ đã kết thúc 
		self:ShutDown(1);	-- đóng hoạt động 
		return 0;
	end
	-- tiếp theo giai đoạn đúng giờ 
	local tbTimer = FactionBattle.STATE_TRANS[self.nStateJour];
	if not tbTimer then
		return 0;
	end
	self.nTimerId = Timer:Register(
		tbTimer[2] * Env.GAME_FPS,
		self.TimerStart,
		self,
		tbTimer[3]
	);	-- mở ra mới đúng giờ 
	self:UpdateMapPlayerInfo()
	return 0
end

-- canh bản đồ mới nội ngoạn gia tin tức,nPlayrIdvi 0tắc canh tân toàn bộ ngoạn gia tin tức 
function tbBaseFaction:UpdateMapPlayerInfo(nPlayerId)
	local nRestTime = Timer:GetRestTime(self.nTimerId);
	local szMsg =""
	local szTimeFmt =""; 
	if self.nState == FactionBattle.SIGN_UP then 
		szTimeFmt ="<color=green>Báo danh thời gian còn lại：<color>";
	elseif self.nState == FactionBattle.MELEE then
		if nPlayerId then
			self:UpdateMeleePlayerTimer(nPlayerId, 1);
			self:UpdateMeleePlayerInfo(nPlayerId);
			return 0;
		end
	elseif self.nState == FactionBattle.READY_ELIMINATION then
		-- điểm cờ hoạt động đã có số liệu mặt biên ，không tăng thêm mặt biên tin tức 
		if self.nEliminationCount and self.nEliminationCount> 0 then
			return 0;
		end
		szTimeFmt ="<color=green>Chuẩn bị vào vòng đấu bảng thời gian ：<color>"
	elseif self.nState == FactionBattle.ELIMINATION then
		local szN ="";
		if FactionBattle.BOX_NUM[self.nEliminationCount][1]> 2 then
			szN = FactionBattle.BOX_NUM[self.nEliminationCount][1].."cường";
		else
			szN ="quán quân";
		end
		szTimeFmt = string.format("<color=green>%s tiếp theo thời gian ：<color>", szN);
	elseif self.nState == FactionBattle.CHAMPION_AWARD then
		szTimeFmt ="<color=green>Quán quân lĩnh thưởng thời gian ：<color>";
	else
		return ;
	end
	
	if (nPlayerId and nPlayerId> 0) then
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId, 1);
		if not pPlayer then
			return ;
		end
		Dialog:SendBattleMsg(pPlayer, szMsg);
		Dialog:SetBattleTimer(pPlayer, szTimeFmt.."<color=white>%s<color>\n", nRestTime);
		Dialog:ShowBattleMsg(pPlayer, 1, 0); --mở ra mặt biên 
	else
		local tbMapPlayer = self:GetMapPlayerTable();
		for i = 1, FactionBattle.ADDEXP_QUEUE_NUM do
			for nId in pairs(tbMapPlayer[i]) do
				if self.nState == FactionBattle.MELEE then
					self:UpdateMeleePlayerTimer(nId);
					self:UpdateMeleePlayerInfo(nId);
				else
					local pPlayer = KPlayer.GetPlayerObjById(nId);
					if pPlayer then
						Dialog:SendBattleMsg(pPlayer, szMsg);
						Dialog:SetBattleTimer(pPlayer, szTimeFmt.."<color=white>%s<color>\n", nRestTime);
					end
				end
			end
		end
	end
end

-- hỗn chiến thời kì cần tức thời đồng bộ nặng đầu chiến đấu đảo kế thì và chiến trường bài danh ，cần chia lìa tin tức và đảo kế thì đích đồng bộ 
-- canh tân hỗn chiến ngoạn gia tin tức 
function tbBaseFaction:UpdateMeleePlayerInfo(nPlayerId)
	local nRestTime = Timer:GetRestTime(self.nTimerId);
	local tbPlayer = self:GetAttendPlayerTable();
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not tbPlayer[nPlayerId] then
		if pPlayer then
			Dialog:SendBattleMsg(pPlayer,"");
		end
		return 0;
	end
	local nSort = tbPlayer[nPlayerId].nSort;
	local tbTmp = {};
	local tbTmpId = {};
	table.insert(tbTmpId, nPlayerId);
	-- sắp xếp thứ tự 
	while (nSort> 1) do
		if self.tbSort[nSort].tbPlayerInfo.nScore> self.tbSort[nSort - 1].tbPlayerInfo.nScore then
			table.insert(tbTmpId, self.tbSort[nSort - 1].nPlayerId);
			tbTmp = self.tbSort[nSort];
			self.tbSort[nSort] = self.tbSort[nSort - 1];
			self.tbSort[nSort - 1] = tbTmp;
			self.tbSort[nSort - 1].tbPlayerInfo.nSort = nSort - 1;
			self.tbSort[nSort].tbPlayerInfo.nSort = nSort;			
			nSort = nSort - 1;
		else
			nSort = 0;
		end
	end
	for i, nId in ipairs(tbTmpId) do
		pPlayer = KPlayer.GetPlayerObjById(nId);
		if pPlayer then
			local szMsg = string.format("Số mạng giết được ：%s\n\nXếp hạng hiện tại ：%s", tbPlayer[nId].nScore, tbPlayer[nId].nSort);
			Dialog:SendBattleMsg(pPlayer, szMsg);
		end
	end
end

-- canh tân hỗn chiến ngoạn gia đảo kế thì 
function tbBaseFaction:UpdateMeleePlayerTimer(nPlayerId, bShowMsg)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local nRestTime = Timer:GetRestTime(self.nTimerId);
	local tbPlayer = self:GetAttendPlayerTable();
	local szTimeFmt ="";
	if self.nMeleeConut == 4 then
		szTimeFmt ="<color=green>ly tự do PK kết thúc thặng dư ：<color><color=white>%s<color>\n";
	else
		szTimeFmt ="<color=green>Thời gian vào vòng tiếp theo:<color><color=white>%s<color>\n";
	end
	if tbPlayer[nPlayerId] and tbPlayer[nPlayerId].nTimerId ~= 0 then
		local nRetTime = Timer:GetRestTime(tbPlayer[nPlayerId].nTimerId);
		szTimeFmt = szTimeFmt.."\n<color=green>Thời gian hồi sinh ：<color><color=white>%s<color>\n";
		Dialog:SetBattleTimer(pPlayer, szTimeFmt, nRestTime, nRetTime);
	elseif tbPlayer[nPlayerId] and tbPlayer[nPlayerId].nArenaId> 0 and self.nFightTimerId> 0 then
		local nRetTime = Timer:GetRestTime(self.nFightTimerId);
		szTimeFmt = szTimeFmt.."\n<color=green>Thời gian hồi sinh ：<color><color=white>%s<color>\n";
		Dialog:SetBattleTimer(pPlayer, szTimeFmt, nRestTime, nRetTime);
	else
		Dialog:SetBattleTimer(pPlayer, szTimeFmt, nRestTime);
	end
	if bShowMsg == 1 then
		Dialog:ShowBattleMsg(pPlayer, 1, 0); --mở ra mặt biên 
	end
end

function tbBaseFaction:BeginAddExp()
	self:BoardMsgToMapPlayer("Ngươi đã vào sân đấu tranh tài!");
	Timer:Register(
		FactionBattle.ADDEXP_SECOND_PRE_TIME * Env.GAME_FPS,
		self.AddExp,
		self
	);
end

-- tăng kinh nghiệm,án bất đồng đội ngũ phân tránh gia ，để tránh khỏi ngoạn gia số lượng khổng lồ dẫn đến những phục vụ khác ở +kinh nghiệm trong lúc diên thì quá lớn 
function tbBaseFaction:AddExp()
	if self.nState == FactionBattle.NOTHING or self.nState == FactionBattle.END then
		return 0;
	end
	Timer:Register(
		1,
		self._AddExp,
		self,
		1
	);	-- phân tránh +kinh nghiệm 
end

function tbBaseFaction:_AddExp(nIndex)
	if nIndex> FactionBattle.ADDEXP_QUEUE_NUM then
		return 0
	end
	local tbPlayer = self:GetMapPlayerTable();
	for nPlayerId in pairs(tbPlayer[nIndex]) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer then
			local nExp = pPlayer.GetBaseAwardExp() * FactionBattle.RATIO;
			pPlayer.AddExp(nExp);
		end
	end
	Timer:Register(
		1,
		self._AddExp,
		self,
		nIndex + 1
	);
	return 0;
end

-- thưởng thức gia phân phối đáo tương quan hỗn chiến địa đồ,cùng với ngoạn gia các loại tương quan thiết trí 
function tbBaseFaction:AssignPlayerToMelee()
	local tbPlayer = self:GetAttendPlayerTable()
	-- nhân số không đạt yêu cầu thấp nhất tắc không tiến hành 
	local nPlayerNum = self:GetAttendPlayuerCount();
	if nPlayerNum <FactionBattle.MIN_ATTEND_PLAYER then
		return 0;
	end
	
	-- án đẳng cấp sắp xếp thứ tự 
	self.tbSort = {}
	for nPlayerId in pairs(tbPlayer) do
		local tbTemp = {}
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		if (pPlayer) and (pPlayer.nMapId == self.nMapId) then
			tbTemp.nKey = pPlayer.nLevel + (pPlayer.GetExp() / pPlayer.GetUpLevelExp());
			tbTemp.nPlayerId = nPlayerId;
			tbTemp.tbPlayerInfo = tbPlayer[nPlayerId];
			tbTemp.pPlayer = pPlayer;
			setmetatable(tbTemp, self.tbSortFunc);
			table.insert(self.tbSort, tbTemp);
		else
			self:DelAttendPlayer(nPlayerId);
		end
	end
	-- ở đây đích tham gia nhân số bất túc tắc không tiến hành 
	self.nTotalPlayer = #self.tbSort;
	if self.nTotalPlayer <FactionBattle.MIN_ATTEND_PLAYER then
		return 0;
	end
	-- sắp xếp thứ tự 
	table.sort(self.tbSort);
	-- tính toán cần nơi so tài một sổ 
	local nArenaNum = math.ceil(nPlayerNum / FactionBattle.PLAYER_PER_ARENA);
	local nPlayerPerArena = math.ceil(nPlayerNum / nArenaNum);
	-- đẳng cấp bình quân phân bố mà đem ngoạn gia gữi đi đáo các nơi so tài 
	for i = 1, nArenaNum do
		local j = i;
		while (self.tbSort[j]) do
			local nX, nY = FactionBattle:GetRandomPoint(i)
			self.tbSort[j].pPlayer.NewWorld(self.nMapId, nX, nY);
			if (self.tbSort[j].pPlayer.GetTrainingTeacher()) then	-- nếu như ngoạn gia đích thân phận là đồ đệ ，như vậy thầy trò nhiệm vụ ở giữa đích Môn phái thi đấu thể thao số lần gia 1
				-- local tbItem = Item:GetClass("teacher2student");
				local nNeed_Faction = self.tbSort[j].pPlayer.GetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_FACTION) + 1;
				self.tbSort[j].pPlayer.SetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_FACTION, nNeed_Faction);
			end
			
			-- thầy trò thành tựu ：Môn phái thi đấu thể thao 
			Achievement:FinishAchievement(self.tbSort[j].pPlayer.nId, Achievement.FACTION);
			
			if (self.tbSort[j].tbPlayerInfo) then
				self.tbSort[j].tbPlayerInfo.nSort = j;	-- mới bắt đầu bài danh 
			end
			--KStatLog.ModifyAdd("RoleWeeklyEvent", self.tbSort[j].pPlayer.szName,"tuần này tham gia Môn phái thi đấu thể thao số lần", 1);
			self:SetPlayerMeleeState(self.tbSort[j].pPlayer);
			FactionBattle:AwardAttender(self.tbSort[j].pPlayer, 1);
			self:AddArenaPlayer(i, self.tbSort[j].nPlayerId); 			-- ghi lại từng chiến trường đích ngoạn gia 
			j = j + nArenaNum;
		end
	end
	-- hỗn chiến bảo hộ thời gian 
	self.nFightTimerId = Timer:Register(
		FactionBattle.MELEE_PROTECT_TIME * Env.GAME_FPS,
		self.ChangeFight,
		self
	);	
	return 1;
end

function tbBaseFaction:RestartMelee()
	self.nMeleeConut = self.nMeleeConut + 1;
	local tbPlayer = self:GetAttendPlayerTable();
	local nPlayerCount = 0;
	-- tính toán nhân số 
	for nPlayerId, tbInfo in pairs(tbPlayer) do
		if tbInfo.nTimerId and tbInfo.nTimerId> 0 then
			Timer:Close(tbInfo.nTimerId);
			tbInfo.nTimerId = 0;
		end
		if tbInfo.nArenaId> 0 then
			self:DelArenaPlayer(tbInfo.nArenaId, nPlayerId);
		end
		tbInfo.nDeathCount = 0;
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer and pPlayer.nMapId == self.nMapId then
			pPlayer.SetFightState(0);
			pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE;
			nPlayerCount = nPlayerCount + 1
			tbInfo.pPlayer = pPlayer;	-- đến lúc số liệu 
		else
			tbInfo.pPlayer = nil;
		end
	end
	
	-- phân phối nơi sân 
	local nArenaNum = math.ceil(nPlayerCount / FactionBattle.PLAYER_PER_ARENA) + 1;
	if nPlayerCount <= FactionBattle.MIN_RESTART_MELEE then
		nArenaNum = 1;
	end
	if nArenaNum> FactionBattle.MAX_ARENA then
		nArenaNum = FactionBattle.MAX_ARENA; 
	end
	local nPlayerPerArena = math.ceil(nPlayerCount / nArenaNum);
	local nMaxPlayer = self:GetAttendPlayuerCount();
	local nArenaId = 1;
	local nArenaPlayerCount = 0;
	for i = 1, nMaxPlayer do
		if self.tbSort[i] and self.tbSort[i].tbPlayerInfo.pPlayer then
			local pPlayer = self.tbSort[i].tbPlayerInfo.pPlayer;
			local nX, nY = FactionBattle:GetRandomPoint(nArenaId);
			pPlayer.NewWorld(self.nMapId, nX, nY);
			self:SetPlayerMeleeState(pPlayer);
			self:AddArenaPlayer(nArenaId, self.tbSort[i].nPlayerId);
			nArenaPlayerCount = nArenaPlayerCount + 1;
			if nArenaPlayerCount == nPlayerPerArena then	-- cai tràng phân người của được rồi ，phân kế tiếp tràng 
				nArenaPlayerCount = 0;
				nArenaId = nArenaId + 1;
			end
		end
	end
	-- hỗn chiến bảo hộ thời gian 
	self.nFightTimerId = Timer:Register(
		FactionBattle.MELEE_RESTART_PROTECT * Env.GAME_FPS,
		self.ChangeFight,
		self
	);	
end

-- thiết trí ngoạn gia dự bị hỗn chiến trạng thái （truyền tống tiến hỗn chiến khu thiết trí ）
function tbBaseFaction:SetPlayerMeleeState(pPlayer)
	if type(pPlayer) ~="userdata"then
		Dbg:WriteLog("FactionBattle","tbBaseFaction:SetPlayerMeleeState(pPlayer) param pPlayer isn't userdate but", type(pPlayer));
		assert(nil);
	end
	-- phi trạng thái chiến đấu, bảo hộ thời gian qua đi tiến nhập trạng thái chiến đấu 
	pPlayer.SetFightState(0);
	--	PKtrạng thái bảo hộ người hiểu biết ít nhập tàn sát trạng thái 
	pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE;
	-- chiến trường tiêu chí （cùng gia tộc nhưng công kích lẫn nhau ）
	pPlayer.nInBattleState	= 1;
	-- cấm họp thành đội 
	pPlayer.TeamDisable(1);
	pPlayer.TeamApplyLeave();
	-- cấm giao dịch 
	pPlayer.ForbitTrade(1);
	-- che đậy họp thành đội 、giao dịch 、bạn tốt mặt biên 
	pPlayer.SetDisableTeam(1);
	pPlayer.SetDisableStall(1);
	pPlayer.SetDisableFriend(1);	
	
	-- tử vong nghiêm phạt 
	pPlayer.SetNoDeathPunish(1);
	-- tử vong quay về điều 	
	Setting:SetGlobalObj(pPlayer);
	local tbPlayer = self:GetAttendPlayerTable();
	if tbPlayer[pPlayer.nId].nOnDeathRegId ~= 0 then
		PlayerEvent:UnRegister("OnDeath", tbPlayer[pPlayer.nId].nOnDeathRegId);
		tbPlayer[pPlayer.nId].nOnDeathRegId = 0;
	end
	tbPlayer[pPlayer.nId].nOnDeathRegId	= PlayerEvent:Register("OnDeath", self.OnDeathInMelee, self);
	Setting:RestoreGlobalObj();
end

-- thiết trí ngoạn gia đấu loại dự bị trạng thái (truyền tống tiến đấu loại khu thiết trí)
function tbBaseFaction:SetPlayerElmState(pPlayer)
	-- phi trạng thái chiến đấu, bảo hộ thời gian qua đi tiến nhập trạng thái chiến đấu 
	pPlayer.SetFightState(0);
	--	PKtrạng thái bảo hộ người hiểu biết ít nhập tàn sát trạng thái 
	pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE;
	-- chiến trường tiêu chí （cùng gia tộc nhưng công kích lẫn nhau ）
	pPlayer.nInBattleState	= 1;
	-- cấm họp thành đội 
	pPlayer.TeamDisable(1);
	pPlayer.TeamApplyLeave();
	-- cấm giao dịch 
	pPlayer.ForbitTrade(1);
	-- Phiêu máu có thể thấy được 
	pPlayer.SetBroadHitState(1);
	-- tử vong nghiêm phạt 
	pPlayer.SetNoDeathPunish(1);

	-- che đậy họp thành đội 、giao dịch 、bạn tốt mặt biên 
	pPlayer.SetDisableTeam(1);
	pPlayer.SetDisableStall(1);
	pPlayer.SetDisableFriend(1);	
	
	--	tử vong quay về điều 
	Setting:SetGlobalObj(pPlayer);
	local tbPlayer = self:GetAttendPlayerTable();
	if tbPlayer[pPlayer.nId].nOnDeathRegId ~= 0 then
		PlayerEvent:UnRegister("OnDeath", tbPlayer[pPlayer.nId].nOnDeathRegId);
		tbPlayer[pPlayer.nId].nOnDeathRegId = 0;
	end
	tbPlayer[pPlayer.nId].nOnDeathRegId	= PlayerEvent:Register("OnDeath", self.OnDeathInElimin, self);
	Setting:RestoreGlobalObj();
end

-- thiết trí ngoạn gia tiến nhập bỉ tái trạng thái (bỉ tái bắt đầu thiết trí)
function tbBaseFaction:SetPlayerFightState(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if pPlayer then
	-- trạng thái chiến đấu 
		pPlayer.SetFightState(1);
	-- PKtrạng thái 
		pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER;
	-- tính toán thương tổn lượng (đấu loại)
		local tbPlayer = self:GetAttendPlayerTable();
		if not tbPlayer[nPlayerId] then		-- một báo danh quá ？
			return 0;
		end
		if self.nState == FactionBattle.ELIMINATION then			
			tbPlayer[nPlayerId].nDamageCount = 0;
			pPlayer.StartDamageCounter();
			
			local szMsg = string.format("phe mình bị thương tổn tổng sản lượng ：0\nđối phương bị thương tổn tổng sản lượng ：0\n");
			Dialog:SendBattleMsg(pPlayer, szMsg);
			if (not self.nDamageTimer) then
				self.nDamageTimer = Timer:Register(Env.GAME_FPS * 5, self.DamageTimerBreath, self);
			end
			
		end
	end
end

function tbBaseFaction:DamageTimerBreath()
	if (#self.tbAttend <= 0) then
		self.nDamageTimer = nil;
		return 0;
	end;
	for _, tbplayerId in pairs(self.tbAttend) do
		local pPlayer1 = KPlayer.GetPlayerObjById(tbplayerId[1]);
		local pPlayer2 = KPlayer.GetPlayerObjById(tbplayerId[2]);
		if (pPlayer1 and pPlayer2) then
			local nDamage1 = pPlayer1.GetDamageCounter();
			local nDamage2 = pPlayer2.GetDamageCounter();
		
			local szMsg1 = string.format("phe mình bị thương tổn tổng sản lượng ：%s\nđối phương bị thương tổn tổng sản lượng ：%s\n", nDamage1, nDamage2);
			local szMsg2 = string.format("phe mình bị thương tổn tổng sản lượng ：%s\nđối phương bị thương tổn tổng sản lượng ：%s\n", nDamage2, nDamage1);
			
			Dialog:SendBattleMsg(pPlayer1, szMsg1);
			Dialog:SendBattleMsg(pPlayer2, szMsg2);
		end;
	end;
end;

-- khôi phục ngoạn gia đáo trạng thái bình thường 
function tbBaseFaction:ResumeNormalState(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return;
	end
	local tbPlayer = self:GetAttendPlayerTable();
	if not tbPlayer[nPlayerId] then		-- một báo danh quá ？
		return 0;
	end
	-- phi trạng thái chiến đấu 
	pPlayer.SetFightState(0);
	pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE;
	-- tử vong nghiêm phạt 
	pPlayer.SetNoDeathPunish(0);
	-- chiến trường tiêu chí （cùng gia tộc nhưng công kích lẫn nhau ）
	pPlayer.nInBattleState	= 0;
	-- cho phép họp thành đội 
	pPlayer.TeamDisable(0);	

	-- đóng che đậy họp thành đội 、giao dịch 、bạn tốt mặt biên 
	pPlayer.SetDisableTeam(0);
	pPlayer.SetDisableStall(0);
	pPlayer.SetDisableFriend(0);		
	
	-- ko cho phép giao dịch 
	pPlayer.ForbitTrade(0);
	-- đình chỉ tính toán thương tổn lượng 
	tbPlayer[nPlayerId].nDamageCount = pPlayer.GetDamageCounter();
	pPlayer.StopDamageCounter();
	-- gạch bỏ tử vong kịch bản gốc 
	Setting:SetGlobalObj(pPlayer);
	PlayerEvent:UnRegister("OnDeath", tbPlayer[nPlayerId].nOnDeathRegId);
	Setting:RestoreGlobalObj();
end

-- thiết trí tiến nhập địa đồ đích trạng thái 
function tbBaseFaction:SetInMap(pPlayer)
	-- đến lúc sống lại điểm 
	local nRandom = MathRandom(4)
	pPlayer.SetTmpDeathPos(self.nMapId, unpack(FactionBattle.REV_POINT[nRandom]));
end

-- thiết trí ly khai địa đồ đích trạng thái 
function tbBaseFaction:SetOutMap(pPlayer)
	-- khôi phục sống lại 
	local nRevMapId, nRevPointId = pPlayer.GetRevivePos();
	pPlayer.SetRevivePos(nRevMapId, nRevPointId);
end

-- sở hữu khu vực ngoạn gia đều tiến nhập trạng thái chiến đấu 
function tbBaseFaction:ChangeFight()
	self.nFightTimerId = 0;
	local tbPlayer = self:GetAttendPlayerTable();
	if (self.tbArena) then
		for i, tbOne in pairs(self.tbArena) do
			for nPlayerId in pairs(tbOne) do
				self:SetPlayerFightState(nPlayerId);
				if self.nState == FactionBattle.MELEE then
					self:UpdateMeleePlayerTimer(nPlayerId);
				end
			end
		end
	end
	return 0;
end

-- thích một cái chính đang chiến đấu khu đích ngoạn gia ly khai chiến đấu khu vực （chích cắt bỏ ghi lại ，không NewWorld）
function tbBaseFaction:KickPlayerFromArena(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable();
	if tbPlayer[nPlayerId] then
		local nArenaId = tbPlayer[nPlayerId].nArenaId
		if not nArenaId or nArenaId == 0 then
			return;
		end
		self:DelArenaPlayer(nArenaId, nPlayerId);
		tbPlayer[nPlayerId].nArenaId = 0;
		if tbPlayer[nPlayerId].nTimerId ~= 0 then
			Timer:Close(tbPlayer[nPlayerId].nTimerId);
			tbPlayer[nPlayerId].nTimerId = 0;
		end
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (pPlayer and self.nMapId == pPlayer.nMapId) then
			self:ResumeNormalState(nPlayerId);	-- khôi phục trạng thái 
		end
		local nRet = self:CheckPlayerNumInArena(nArenaId);
		if nRet ~= 1 then		-- kết thúc cai hỗn chiến khu vực hoạt động 
			if self.nState == FactionBattle.ELIMINATION and self.tbNextWinner[nArenaId] == -1 then
				local tbOnlyPlayer = self:GetArenaPlayer(nArenaId);
				for nWinnerId in pairs(tbOnlyPlayer) do	-- chỉ có một người liễu 
					self:SetEliminationWinner(nArenaId, nWinnerId, nPlayerId);
				end
			end
			self:MsgToArenaPlayer(nArenaId,"thắng bại đã phân ，Hãy cố gắng ở vòng sau nữa nhé ！");
			Timer:Register(
				FactionBattle.END_DELAY * Env.GAME_FPS,
				self.CloseArena,
				self,
				nArenaId
				);
			
		end
	end
end

-- hỗn chiến kỳ ngoạn gia tử vong kịch bản gốc 
function tbBaseFaction:OnDeathInMelee(pKillerNpc)
	local pKillerPlayer = pKillerNpc.GetPlayer();
	if not pKillerPlayer then
		return;
	end
	local tbPlayer = self:GetAttendPlayerTable();
	local nKillerRoute = pKillerPlayer.nRouteId;
	if self.tbRouteKills[nKillerRoute] == nil then
		self.tbRouteKills[nKillerRoute] = 0;
	end
	self.tbRouteKills[nKillerRoute] = self.tbRouteKills[nKillerRoute] + 1;
	if tbPlayer[pKillerPlayer.nId] and self.nState == FactionBattle.MELEE then		-- hỗn chiến hình thức hạ gia phân đà để ý 
		tbPlayer[pKillerPlayer.nId].nScore = tbPlayer[pKillerPlayer.nId].nScore + 1;
		if tbPlayer[pKillerPlayer.nId].nScore == 1 then
			FactionBattle:AwardAttender(pKillerPlayer, 2);
		end
		-- lập tức tại chỗ sống lại 
		me.ReviveImmediately(1);
		-- trạng thái chiến đấu 
		me.SetFightState(0);
		-- PKtrạng thái 
		me.nPkModel = Player.emKPK_STATE_PRACTISE;
		-- nặng đầu chiến đấu đúng giờ 
		tbPlayer[me.nId].nDeathCount = tbPlayer[me.nId].nDeathCount + 1;
		local nDeath = tbPlayer[me.nId].nDeathCount;
		if nDeath> #FactionBattle.return_TO_MELEE_TIME then
			nDeath = #FactionBattle.return_TO_MELEE_TIME
		end
		tbPlayer[me.nId].nTimerId = Timer:Register(
			FactionBattle.return_TO_MELEE_TIME[nDeath] * Env.GAME_FPS,
			self.ReturnToMelee,
			self,
			me.nId
		);
		self:UpdateMeleePlayerTimer(me.nId);		-- người bị giết thời gian đổi mới 
		self:UpdateMeleePlayerInfo(pKillerPlayer.nId); -- người giết người canh tân tin tức 
		pKillerPlayer.Msg("ngươi đánh bại <color=yellow>"..me.szName.."<color>，Số mạng giết được <color=green>"..tbPlayer[pKillerPlayer.nId].nScore);
		me.Msg("ngươi bị <color=yellow>"..pKillerPlayer.szName.."<color>đánh bại ，<color=green>"..FactionBattle.return_TO_MELEE_TIME[nDeath].."s <color>sau tiếp tục chiến đấu ！");
	end
end

-- một lần nữa đầu nhập chiến đấu đúng giờ hàm số 
function tbBaseFaction:ReturnToMelee(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable()
	if tbPlayer[nPlayerId] then
		tbPlayer[nPlayerId].nTimerId = 0;
		self:SetPlayerFightState(nPlayerId);
		self:UpdateMeleePlayerTimer(nPlayerId);
	end
	return 0;
end

-- đấu loại kỳ ngoạn gia tử vong kịch bản gốc 
function tbBaseFaction:OnDeathInElimin(pKillerNpc)
	local pKillerPlayer = pKillerNpc.GetPlayer();
	if not pKillerPlayer then
		return;
	end
	Timer:Register(
		FactionBattle.END_DELAY * Env.GAME_FPS,
		self.AutoRevivePlayer,
		self,
		me.nId
	);
	self:KickPlayerFromArena(me.nId);
end

-- tự động sống lại (đấu loại giai đoạn)
function tbBaseFaction:AutoRevivePlayer(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	if pPlayer.IsDead() == 1 then
		pPlayer.Revive(0);
	end
	return 0;
end

-- kiểm tra tràng bề trên sổ có hay không năng kế tục bỉ tái (có hay không>1nhân)
function tbBaseFaction:CheckPlayerNumInArena(nArenaId)
	local nNum = 0;
	local nPlayerId = 0;
	local tbPlayer = self:GetArenaPlayer(nArenaId);
	for i in pairs(tbPlayer) do
		nNum = nNum + 1;
		nPlayerId = i;
		if nNum> 1 then
			return 1;
		end
	end
	return 0, nPlayerId;
end

-- kết thúc mỗ nơi sân hoạt động ，gồm ngoạn gia truyền tống quay về sân rộng 
function tbBaseFaction:CloseArena(nArenaId)
	local tbPlayer = self:GetAttendPlayerTable();
	local tbArenaPlayer = self:GetArenaPlayer(nArenaId);
	for nPlayerId in pairs(tbArenaPlayer) do
		self:DelArenaPlayer(nArenaId, nPlayerId)
		if tbPlayer[nPlayerId] then
			tbPlayer[nPlayerId].nArenaId = 0;
			if tbPlayer[nPlayerId].nTimerId ~= 0 then
				Timer:Close(tbPlayer[nPlayerId].nTimerId);
			end
			tbPlayer[nPlayerId].nTimerId = 0;
		end
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (pPlayer and self.nMapId == pPlayer.nMapId) then
			self:ResumeNormalState(nPlayerId);
		end
		if pPlayer then
			FactionBattle:TrapIn(pPlayer);
		end
	end
	self.tbArena[nArenaId] = nil;
	return 0;
end

-- cấp ở mỗ đấu trường khu trung đích ngoạn gia gữi đi tin tức 
function tbBaseFaction:MsgToArenaPlayer(nArenaId, szMsg)
	local tbPlayer = self:GetArenaPlayer(nArenaId);
	if not tbPlayer then
		return;
	end
	for nPlayerId in pairs(tbPlayer) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer then
			pPlayer.Msg(szMsg);
		end
	end
end

-- cấp địa đồ nội đích ngoạn gia gữi đi tin tức 
function tbBaseFaction:MsgToMapPlayer(szMsg)
	if self.tbMapPlayer then
		for nIndex, tbPlayer in pairs(self.tbMapPlayer) do
			for nPlayerId in pairs(tbPlayer) do
				local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
				if pPlayer then
					pPlayer.Msg(szMsg);
				end
			end
		end
	end
end

function tbBaseFaction:BoardMsgToMapPlayer(szMsg)
	if self.tbMapPlayer then
		for nIndex, tbPlayer in pairs(self.tbMapPlayer) do
			for nPlayerId in pairs(tbPlayer) do
				local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
				if pPlayer then
					Dialog:SendBlackBoardMsg(pPlayer, szMsg);
				end
			end
		end
	end
end

-- đấu loại một cái ngoạn gia 
function tbBaseFaction:WashOutPlayer(nPlayerId)
	local tbPlayer = self:GetAttendPlayerTable();
	if tbPlayer[nPlayerId] then
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (pPlayer and self.nMapId == pPlayer.nMapId) then
			self:ResumeNormalState(nPlayerId);
		end
		self:DelAttendPlayer(nPlayerId);
	end
end

-- tính toán 16cường 
function tbBaseFaction:Calc16thPlayer()
	local tbPlayer = self:GetAttendPlayerTable()
	local pPlayer;
	local nCount = 1;
	local tb16thPlayer = {};
	local n = 1;
	local m = 1;
	
	while (#tb16thPlayer <16 and self.tbSort[m]) do
		pPlayer = KPlayer.GetPlayerObjById(self.tbSort[m].nPlayerId);	
		if pPlayer and pPlayer.nMapId == self.nMapId then
			tb16thPlayer[#tb16thPlayer + 1] = self.tbSort[m].nPlayerId;
			FactionBattle:AwardAttender(pPlayer, 3);
			-- ghi lại 16cường lộ tuyến phân bố 
			local nRoute = pPlayer.nRouteId;
			if not self.tb16Rount[nRoute] then
				self.tb16Rount[nRoute] = 0
			end
			self.tb16Rount[nRoute] = self.tb16Rount[nRoute] + 1
			n = n + 1;
		end
		m = m + 1;
	end
	local nPlayerNum = #tb16thPlayer;
	for i = 1, 8 do
		self.tbWinner[2 * i - 1] = tb16thPlayer[FactionBattle.ELIMI_VS_TABLE[i][1]] or 0;
		self.tbWinner[2 * i] = tb16thPlayer[FactionBattle.ELIMI_VS_TABLE[i][2]] or 0;
	end
	for i = 1, 16 do
		if self.tbAttendPlayer[self.tbWinner[i]] then
			self.tbSportscast[self.tbWinner[i]] = {};
			self.tb16Player[i] = self.tbSportscast[self.tbWinner[i]];
			self.tbSportscast[self.tbWinner[i]].szName = self.tbAttendPlayer[self.tbWinner[i]].szName;
			self.tbSportscast[self.tbWinner[i]].nWinCount = 0;
		end
	end
	local tbMapPlayer = KPlayer.GetMapPlayer(self.nMapId);
	for i, pPlayer in pairs(tbMapPlayer) do
		self:SyncSportscast(pPlayer);	
	end
	for i = 1, #self.tbSort do
		-- cho mỗi một tham gia ngoạn gia gia hỗn chiến đích vinh dự 、uy vọng 
		local pPlayer = KPlayer.GetPlayerObjById(self.tbSort[i].nPlayerId);
		if pPlayer then
			for j = 1, #FactionBattle.MELEE_HONOR do
				if i <= math.floor(FactionBattle.MELEE_HONOR[j][1] * self.nTotalPlayer) then
					FactionBattle:AddFactionHonor(pPlayer, FactionBattle.MELEE_HONOR[j][2]);
					pPlayer.AddKinReputeEntry(FactionBattle.MELEE_HONOR[j][3],"factionbattle");
					
					-- tăng kiến thiết tài chính và cá nhân 、bang chủ 、tộc trưởng đích công ty cổ phần 
					Tong:AddStockBaseCount_GS1(pPlayer.nId, FactionBattle.MELEE_HONOR[j][4], 0.7, 0.2, 0.05, 0, 0.05);
					break;
				end
			end
		end
	end
end

-- đấu loại phán đoán người thắng 
function tbBaseFaction:CalcWinner()
	if self.tbNextWinner then
		for i in pairs(self.tbNextWinner) do
			if self.tbNextWinner[i] == -1 then	-- không biết người thắng 
				-- xử thắng 
				local nPlayer1Id = self.tbWinner[2 * i - 1];
				local nPlayer2Id = self.tbWinner[2 * i];
				local pPlayer1 = KPlayer.GetPlayerObjById(nPlayer1Id);
				local pPlayer2 = KPlayer.GetPlayerObjById(nPlayer2Id);
				local nScore1 = 0;
				local nScore2 = 0;
				local tbPlayer = self:GetAttendPlayerTable();
				local nDamageCount1 = 0;
				local nDamageCount2 = 0;
				if pPlayer1 then
					if tbPlayer[nPlayer1Id] then
						nDamageCount1 = tbPlayer[nPlayer1Id].nDamageCount;
					end
					nScore1 = nDamageCount1 * 100 - pPlayer1.nLevel - (pPlayer1.GetExp() / pPlayer1.GetUpLevelExp());		
					Dbg:WriteLog("FactionBattle","ngoạn gia 1:"..pPlayer1.szName, nDamageCount1);		
				end
				if pPlayer2 then
					if tbPlayer[nPlayer2Id] then
						nDamageCount2 = tbPlayer[nPlayer2Id].nDamageCount;
					end
					nScore2 = nDamageCount2 * 100 - pPlayer2.nLevel - (pPlayer2.GetExp() / pPlayer2.GetUpLevelExp());
					Dbg:WriteLog("FactionBattle","ngoạn gia 2:"..pPlayer2.szName, nDamageCount2);
				end
				self.tbNextWinner[i] = nScore1 <nScore2 and nPlayer1Id or nPlayer2Id;
				if self.tbNextWinner[i] == nPlayer1Id then
					self:SetEliminationWinner(i, nPlayer1Id, nPlayer2Id, 1);
				else
					self:SetEliminationWinner(i, nPlayer2Id, nPlayer1Id, 1);
				end
			end
		end
		self.tbWinner = self.tbNextWinner;
	end
end

-- đấu loại dữ thi đấu trình tính toán 
function tbBaseFaction:CalcElimination()
	local tbPlayer = self:GetAttendPlayerTable();
	local tbTempPlayer = {};
	local nTempCount = 0;
	for i, nWinnerId in pairs(self.tbWinner) do
		if nWinnerId ~= 0 then
			tbTempPlayer[nWinnerId] = tbPlayer[nWinnerId];
			self:DelAttendPlayer(nWinnerId);
			nTempCount = nTempCount + 1;
		end
	end
	for nPlayerId in pairs(tbPlayer) do
		self:WashOutPlayer(nPlayerId);	-- đấu loại ngoạn gia 
	end
	self.tbAttendPlayer = tbTempPlayer;
	self.nAttendCount = nTempCount;
end


-- bả đấu loại ngoạn gia truyền tống đáo chỉ định khu vực ，chuẩn bị bỉ tái 
function tbBaseFaction:AssignPlayerToElimination()
	local tbPlayer = self.tbWinner;
	local nPlayerNum = #self.tbWinner;
	self.tbNextWinner = {};
	self.tbAttend = {};
	for i = 1, math.ceil(nPlayerNum / 2) do
		local nPlayer1Id = self.tbWinner[2 * i - 1];
		local nPlayer2Id = self.tbWinner[2 * i];
		local pPlayer1 = KPlayer.GetPlayerObjById(nPlayer1Id)
		local pPlayer2 = KPlayer.GetPlayerObjById(nPlayer2Id)
		self.tbNextWinner[i] = -1;		-- vi -1，không biết tấn cấp danh sách 
		if pPlayer1 and pPlayer2 and pPlayer1.nMapId == self.nMapId and pPlayer2.nMapId == self.nMapId then
			self.tbAttend[i] = {nPlayer1Id, nPlayer2Id};	
			local tbPoint1, tbPoint2 = FactionBattle:GetElimFixPoint(i);
			self:AddArenaPlayer(i, nPlayer1Id);
			self:AddArenaPlayer(i, nPlayer2Id);
			pPlayer1.NewWorld(self.nMapId, unpack(tbPoint1));
			self:SetPlayerElmState(pPlayer1);
			pPlayer2.NewWorld(self.nMapId, unpack(tbPoint2));
			self:SetPlayerElmState(pPlayer2);
		elseif pPlayer1 and pPlayer1.nMapId == self.nMapId then
			self:SetEliminationWinner(i, nPlayer1Id, nPlayer2Id);
		elseif pPlayer2 and pPlayer2.nMapId == self.nMapId then
			self:SetEliminationWinner(i, nPlayer2Id, nPlayer1Id);
		else 	-- không đối thủ VSkhông đối thủ 
			self.tbNextWinner[i] = 0;	-- 0 vi không người tấn cấp 
		end
	end
	-- tiến nhập bảo hộ thời gian 
	Timer:Register(
		FactionBattle.ELIMI_PROTECT_TIME * Env.GAME_FPS,
		self.ChangeFight,
		self
		);
end

function tbBaseFaction:SetEliminationWinner(nArenaId, nWinnerId, nLoserId, bCalcDamiage)
	local pWinner = KPlayer.GetPlayerObjById(nWinnerId);
	if not pWinner then
		self.tbNextWinner[nArenaId] = 0
		return 0;
	end
	self.tbNextWinner[nArenaId] = nWinnerId;
	if self.tbSportscast[nWinnerId] then
		self.tbSportscast[nWinnerId].nWinCount = self.tbSportscast[nWinnerId].nWinCount + 1;
	end
	FactionBattle:AwardAttender(pWinner, self.nEliminationCount + 3);
	-- tấn cấp thưởng cho 
	local tbPlayer = KPlayer.GetMapPlayer(self.nMapId);
	local tbAttendPlayer = self:GetAttendPlayerTable();
	local nPlayerNum = #tbPlayer;
	FactionBattle:PromotionAward(self.nMapId, nArenaId, self.nEliminationCount, nWinnerId, nLoserId, nPlayerNum);
	
	-- thông cáo 
	local pLoser = KPlayer.GetPlayerObjById(nLoserId);
	if pLoser then
		pLoser.Msg("ngươi bị thua ，mất lượt đi vòng kế tiếp ");
		Dialog:SendBlackBoardMsg(pLoser,"ngươi bị thua ，mất lượt đi vòng kế tiếp ");
	end
	if self.tbSportscast[nWinnerId].nWinCount>= 4 then
	local szTitle = "";
	if nWeek == 2 then  -- Thứ 3
				szTitle ="<color=cyan>Thi đấu Loạn Phái !";
	elseif nWeek == 5 then  -- Thứ 6
				szTitle ="<color=cyan>Thi Đấu Môn Phái";
	else 
					szTitle ="<color=cyan>Thi đấu Loạn Phái !";
	end 
		pWinner.Msg("Chúc mừng ngươi đánh bại tất cả đối thủ danh ngôi Tân Nhân Vương "..szTitle.." Tuần này");
		self:MsgToMapPlayer("Chúc mừng <color=yellow>"..pWinner.szName.."<color> đánh bại tất cả đối thủ danh ngôi Tân Nhân Vương "..szTitle.." Tuần này");
		self:BoardMsgToMapPlayer("Chúc mừng ["..pWinner.szName.."] Đã trở thành Tân Nhân Vương "..szTitle.." Tuần này")
		KDialog.MsgToGlobal("<color=yellow>["..pWinner.szName.."]<color> đánh bại tất cả đối thủ danh ngôi vô địch Quán "..szTitle.." Tuần này ");
		--Dialog:SendBlackBoardMsg(pWinner,"ngươi đánh bại đối thủ ，thu được Môn phái thi đấu thể thao quán quân ！");
		FactionBattle:FinalWinner(self.nFaction, nWinnerId);
		self.nFinalWinner = nWinnerId;
		-- nếu như một đối thủ mà quyết ra quán quân tắc khiêu quá đấu loại trạng thái 
		if self.nState == FactionBattle.READY_ELIMINATION then
			self.nStateJour = self.nStateJour + 1;
		end
		if self.nTimerId and self.nTimerId> 0 then
			Timer:Close(self.nTimerId);
			self:TimerStart();
		end
		
		local szFaction = Player:GetFactionRouteName(pWinner.nFaction);
		local szWinMsg ="ở "..szFaction.." Môn phái thi đấu trận chung kết thắng lợi ，"..szFaction.."Trở thành Tân Nhân Vương ";
		local szLoseMsg ="ở "..szFaction.." Môn phái thi đấu trận chung kết tiếc nuối bị thua ";
		
		pWinner.SendMsgToFriend("ngài thật là tốt hữu ["..pWinner.szName.."]"..szWinMsg);
		Player:SendMsgToKinOrTong(pWinner, szWinMsg, 1);
		if (pLoser) then
			pLoser.SendMsgToFriend("ngài thật là tốt hữu [".. pLoser.szName.."]"..szLoseMsg);
			Player:SendMsgToKinOrTong(pLoser, szLoseMsg, 1);
		end
		
		Dbg:WriteLogEx(Dbg.LOG_INFO,"FactionBattle","Quán Quân:", pWinner.szName, pWinner.szAccount);
	else
		Dialog:SendBlackBoardMsg(pWinner,"Các hạ đã đánh bại đối thủ ，đủ tư cách vào vòng kế tiếp !");
		pWinner.Msg("Các hạ đã đánh bại đối thủ ，đủ tư cách vào vòng kế tiếp !");
	end
	
	local szMsg ="";
	if (self.tbSportscast[nWinnerId].nWinCount == 1) then
		local nRoute = pWinner.nRouteId
		if not self.tb8Rount[nRoute] then
			self.tb8Rount[nRoute] = 0;
		end
		self.tb8Rount[nRoute] = self.tb8Rount[nRoute] + 1;
	end
	if (self.tbSportscast[nWinnerId].nWinCount == 2) then
		--vòng bán kết 
		szMsg ="ở "..Player:GetFactionRouteName(pWinner.nFaction).." Thi Đấu Môn Phái vào trận Bán Kết xin chúc mừng";
		pWinner.SendMsgToFriend("ngài thật là tốt hữu ["..pWinner.szName.."]".. szMsg);
		Player:SendMsgToKinOrTong(pWinner, szMsg, 0);
	elseif (self.tbSportscast[nWinnerId].nWinCount == 3) then
		--tiến nhập trận chung kết 
		szMsg ="ở "..Player:GetFactionRouteName(pWinner.nFaction).."  Thi Đấu Môn Phái tiến vào trận Chung Kết xin chúc mừng";
		pWinner.SendMsgToFriend("ngài thật là tốt hữu ["..pWinner.szName.."]".. szMsg);
		Player:SendMsgToKinOrTong(pWinner, szMsg, 0);
	end
	
	local szLoserName = KGCPlayer.GetPlayerName(nLoserId);
	local szReason;
	if not szLoserName then
		szLoserName ="";
	end
	if bCalcDamiage and bCalcDamiage == 1 then
		szReason ="thương lượng máu thủ thắng";
	else
		szReason ="trực tiếp đánh bại";
	end
	local szQiang ="bất minh"; 
	if FactionBattle.BOX_NUM[self.nEliminationCount] then
		szQiang = FactionBattle.BOX_NUM[self.nEliminationCount][1].."cường";
	end 
	local szMsg = string.format("ở %sbỉ tái đánh bại %s, nguyên nhân vi %s", szQiang,szLoserName, szReason)
	pWinner.PlayerLog(Log.emKPLAYERLOG_TYPE_FACTIONSPORTS, szMsg)
	-- đồng bộ số liệu 
	for i, pPlayer in pairs(tbPlayer) do
		self:SyncSportscast(pPlayer);	
	end
	Dbg:WriteLog("FactionBattle","SetWinner","FactionId:"..pWinner.nFaction, pWinner.szName..szMsg, nArenaId or 0);
end

-- bắt đầu hỗn chiến hình thức 
function tbBaseFaction:StartMelee()
	if self:AssignPlayerToMelee() ~= 1 then
		local szMsg ="bởi ở đây tham gia nhân số đạt "..FactionBattle.MIN_ATTEND_PLAYER.." người ，Thi Đấu Môn Phái đã mở"
		self:MsgToMapPlayer(szMsg);
		return 0;
	end
	
		local nWeek = tonumber(GetLocalDate("%w"))
local szTitle = "";
	if nWeek == 2 then  -- Thứ 3
				szTitle ="<color=cyan>Thi đấu loạn phái chính thức bắt đầu !";
	elseif nWeek == 5 then  -- Thứ 6
				szTitle ="<color=cyan>Thi đấu môn phái phái chính thức bắt đầu !";
	end 
	
	self:MsgToMapPlayer("Thi đấu loạn phái chính thức bắt đầu !")
	self:BeginAddExp();
end

-- kết thúc hỗn chiến hình thức 
function tbBaseFaction:EndMelee()
	self:BoardMsgToMapPlayer("16 cường đã bắt đầu, các hạ hãy ~ để xem chi tiết");
	if self.tbArena then
		for i in pairs(self.tbArena) do
			self:CloseArena(i);
		end
	end
	local nDegree = GetFactionBattleCurId();
	self:Calc16thPlayer()
	self:CalcElimination();
	Timer:Register(2 * 60 * 18, self.AnounceTime, self);
end

function tbBaseFaction:StartElimination()
	if not self.nEliminationCount then
		self.nEliminationCount = 0;
	end
	self.nEliminationCount = self.nEliminationCount + 1;
	local szMsg ="";
	if FactionBattle.BOX_NUM[self.nEliminationCount][1]> 2 then
		szMsg = FactionBattle.BOX_NUM[self.nEliminationCount][1].." cường bắt đầu rồi ! tuyển thủ dự thi chuẩn bị vào lôi đài";
	else
		szMsg ="cuối trận chung kết bắt đầu rồi ! tuyển thủ dự thi chuẩn bị vào lôi đài"
	end
	self:MsgToMapPlayer(szMsg);
	self:BoardMsgToMapPlayer(szMsg);
	self:AssignPlayerToElimination();
end

-- kết thúc đấu loại (quán quân sớm sinh ra nói sẽ không thuyên chuyển ở đây)
function tbBaseFaction:EndElimination()
	local nIndex = FactionBattle.BOX_NUM[self.nEliminationCount][1];
	local szMsg =""
	if nIndex> 2 then
		szMsg = string.format("%s cường kết thúc，%s cường tuyển thủ chuẩn bị sẵn sàng ",
			tonumber(nIndex), tonumber(math.ceil(nIndex / 2)))
		self:MsgToMapPlayer(szMsg); 
	end
	if self.tbArena then
		for i in pairs(self.tbArena) do
			self:CloseArena(i);
		end
	end
	self:CalcWinner();
	self:CalcElimination();
	
	if nIndex == 16 then -- 16cường kết thúc ~ghi lại 8cường lộ tuyến phân bố 
		local nDegree = GetFactionBattleCurId();
	end
	-- mở ra nghỉ ngơi kỳ hoạt động 
	if self.nEliminationCount <4 then
		self.tbRestActitive:StartRest();
		Timer:Register(FactionBattle.ANOUNCE_TIME * Env.GAME_FPS, self.AnounceTime, self);
	end
end

function tbBaseFaction:AnounceTime()
	if not self.nEliminationCount then
		self.nEliminationCount = 0;
	end
	if FactionBattle.BOX_NUM[self.nEliminationCount + 1][1]> 2 then
		self:MsgToMapPlayer(FactionBattle.BOX_NUM[self.nEliminationCount + 1][1].." vòng loại bảng tuyển thủ chuẩn bị sẵn sàng");
	else
		self:MsgToMapPlayer("Trận chung kết đấu loại còn có 60s tuyển thủ chuẩn bị sẵn sàng")
	end
	return 0;
end

function tbBaseFaction:ShutDown(bCamplete)
	local tbPlayer = self:GetAttendPlayerTable()
	for nPlayerId in pairs(tbPlayer) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (pPlayer and self.nMapId == pPlayer.nMapId) then
			self:ResumeNormalState(nPlayerId);
		end
	end
	self.nState = FactionBattle.NOTHING;
	FactionBattle:ShutDown(self.nFaction);
		local nWeek = tonumber(GetLocalDate("%w"))
		local szTitle = "";
	if bCamplete == 1 then
	if nWeek == 2 then  -- Thứ 3
				szTitle ="Đã tìm ra <color=cyan>Quán Quân Loạn Môn Phái<color>";
	elseif nWeek == 5 then  -- Thứ 6
					szTitle ="Đã tìm ra <color=cyan>Quán Quân Thi Đấu Môn Phái<color>";
	end 
	
		self:MsgToMapPlayer(szTitle);
		self:BoardMsgToMapPlayer(szTitle);
	else
		if nWeek == 2 then  -- Thứ 3
				szTitle ="Loạn chiến môn phái đã kết thúc";
	elseif nWeek == 5 then  -- Thứ 6
					szTitle ="Thi Đấu môn phái đã kết thúc";
	end 
		self:MsgToMapPlayer(szTitle);
	end
	
	self:DelMapPlayerTable();
	-- đóng nghỉ ngơi hoạt động 
	self.tbRestActitive:EndRest();
	self.nTimerId = 0;
end

-- Trống hàm số ~gì cũng không tố 
function tbBaseFaction:EndChampionAward()
end

-- đồng bộ mặt biên cần số liệu cấp ngoạn gia 
function tbBaseFaction:SyncSportscast(pPlayer, nUsefulTime)
	if pPlayer then
		Dialog:SyncCampaignDate(pPlayer,"FactionBattle", self.tb16Player, nUsefulTime);
	end
	return 1;
end

function tbBaseFaction:EndAll()
	self:ShutDown(0);
	if self.nTimerId ~= 0 then
		Timer:Close(nTimerId);
	end
end

function tbBaseFaction:GetFinalWinner()
	return self.nFinalWinner;
end
