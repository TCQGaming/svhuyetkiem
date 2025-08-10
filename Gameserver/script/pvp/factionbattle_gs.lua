-------------------------------------------------------------------
--File: 	factionbattle_gs.lua
--Author: 	zhengyuhua
--Date: 	2008-1-8 17:38
--Describe:	Môn phái chiến --gamecenterđoan kịch bản gốc 
-------------------------------------------------------------------
-- mở ra Môn phái chiến 
function FactionBattle:StartFactionBattle_GS()
	local nRet = 0
	self.tbData = {};
	assert(self:LoadArenaRange(self.SETTING_PATH..self.ARENA_RANGE) == 1);	-- độc thủ hỗn chiến ngẫu nhiên phạm vi phối trí 
	assert(self:LoadArenaPoint(self.SETTING_PATH..self.ARENA_POINT) == 1);	-- độc thủ đấu loại xác định địa điểm phối trí 
	assert(self:LoadBoxPoint(self.SETTING_PATH..self.BOX_POINT) == 1);		-- độc thủ cái rương đích cà điểm 
	if not self.tbBattleFlag then
		self.tbBattleFlag = {}
	end
	for i = 1, Player.FACTION_NUM do
		self.tbBattleFlag[i] = 1;
	end
	-- for nFaction, nMapId in pairs(self.FACTION_TO_MAP) do
		-- if IsMapLoaded(nMapId) == 1 then	-- địa đồ gia chở tắc mở ra hoạt động 		
			-- self.tbData[nFaction] = Lib:NewClass(self.tbBaseFaction, nFaction, nMapId);	-- sáng tạo hoạt động số liệu đối tượng 
			-- nRet = 1;
			-- SpecialEvent.ExtendEvent:DoExecute("Open_FactionBattle", nFaction, nMapId);
		-- local szMsg ="<color=yellow>Loạn Chiến Môn Phái<color> đã bắt đầu ghi danh , các nhân sĩ hay mau mau về gặp Trưởng Môn để<color=yellow> Báo Danh <color>tham gia"
	-- KDialog.MsgToGlobal(szMsg);
		-- end
	-- end
	-- Lấy thứ hiện tại (0=CN, 1=Thứ2,...,6=Thứ7)
local nWeek = tonumber(GetLocalDate("%w"))
        local szMsg = ""
-- Kiểm tra và chọn bảng map
if nWeek == 2 then  -- Thứ 3
    -- Xử lý cho Loạn Chiến Môn Phái (dùng FACTION_TO_MAP)
    for nFaction, nMapId in pairs(self.ThiDauMonPhai_TO_MAP) do
        if IsMapLoaded(nMapId) == 1 then
            self.tbData[nFaction] = Lib:NewClass(self.tbBaseFaction, nFaction, nMapId)
			nRet = 1;
            SpecialEvent.ExtendEvent:DoExecute("Open_FactionBattle", nFaction, nMapId)
		 szMsg ="<color=yellow>Loạn Chiến Môn Phái Thứ 3 Hàng Tuần <color> đã bắt đầu ghi danh , các nhân sĩ hay mau mau về gặp Trưởng Môn để<color=yellow> Báo Danh <color>tham gia"

        end
    end
elseif nWeek == 5 then  -- Thứ 6
    -- Xử lý cho Thi Đấu Môn Phái (dùng ThiDauMonPhai_TO_MAP)
    for nFaction, nMapId in pairs(self.FACTION_TO_MAP) do
	print("Môn phái:", nFaction, "Map:", nMapId)
        if IsMapLoaded(nMapId) == 1 then
            self.tbData[nFaction] = Lib:NewClass(self.tbBaseFaction, nFaction, nMapId)
			nRet = 1;
            SpecialEvent.ExtendEvent:DoExecute("Open_FactionBattle", nFaction, nMapId)
            szMsg = "<color=yellow>Thi đấu Môn Phái Thứ 6 Hàng Tuần <color> đã bắt đầu ghi danh , các nhân sĩ hay mau mau về gặp Trưởng Môn để<color=yellow> Báo Danh <color>tham gia"

        end
    end
end
        KDialog.MsgToGlobal(szMsg)

	if nRet == 1 then
		self:StartSignUp();
	end
end

function FactionBattle:EndBattle_GS2(nFaction)
	if not self.tbBattleFlag then
		self.tbBattleFlag = {}
	end
	self.tbBattleFlag[nFaction] = 0;
end

function FactionBattle:GetBattleFlag(nFaction)
	if not self.tbBattleFlag then
		self.tbBattleFlag = {}
	end
	return self.tbBattleFlag[nFaction];
end

function FactionBattle:GetFactionData(nFaction)
	if self.tbData then
		return self.tbData[nFaction];
	end
end

-- khởi động hoạt động 
function FactionBattle:StartSignUp()
	for i, tbInfo in pairs(self.tbData) do
		tbInfo:TimerStart();
		tbInfo:CheckMap();
	end
	-- local szMsg ="<color=yellow>Loạn Chiến Môn Phái<color> đã bắt đầu ghi danh , các nhân sĩ hay mau mau về gặp Trưởng Môn để<color=yellow> Báo Danh <color>tham gia"
	-- KDialog.NewsMsg(0, Env.NEWSMSG_NORMAL, szMsg);
	-- KDialog.MsgToGlobal(szMsg);
end

-- ly khai địa đồ 
function FactionBattle:OnLeaveMap(nFaction)
	local tbData = self:GetFactionData(nFaction);
	local nPlayerId = me.nId;
	if tbData then
		if tbData:FindAttendPlayer(nPlayerId) == 1 then		-- tạm thời khôi phục như cũ trạng thái 
			tbData:KickPlayerFromArena(nPlayerId);
			tbData:ResumeNormalState(nPlayerId);
		end
		tbData:DelMapPlayerTable(nPlayerId);
	end
	me.nForbidChangePK = 0;
	me.ForbidEnmity(0);		--báo thù 
	me.ForbidExercise(0); 	--luận bàn 
	me.DisabledStall(1);	--bày sạp 
	me.ForbitTrade(0);
end

-- tiến nhập địa đồ 
function FactionBattle:OnEnterMap(nFaction, bIsNewWorld)
	local tbData = self:GetFactionData(nFaction)
	if tbData then
		tbData:AddMapPlayerTable(me.nId);
		if tbData:FindAttendPlayer(me.nId) == 1 then		-- thiết trí bỉ tái chuẩn bị trạng thái 
			-- TODO
		end
	end
	self:TrapIn(me);
	me.SetFightState(0);
	me.nPkModel = Player.emKPK_STATE_PRACTISE;
	me.nForbidChangePK = 1;
	me.ForbidEnmity(1);		-- cấm báo thù 
	me.ForbidExercise(1); 	-- cấm luận bàn 
	me.DisabledStall(1);	--cấm bày sạp 
	me.ForbitTrade(0);
end

-- độc thủ các nơi so tài đích ngẫu nhiên tiến nhập điểm 
function FactionBattle:LoadArenaRange(szFullPath)
	self.tbArenaRange = {}
	local tbNumColName = {ARENA_ID = 1, X = 1, Y = 1, RADII = 1};
	local tbFileData = Lib:LoadTabFile(szFullPath, tbNumColName);
	if not tbFileData then
		return 0;
	end
	for nIndex, tbRow in pairs(tbFileData) do
		if not self.tbArenaRange[tbRow.ARENA_ID] then
			self.tbArenaRange[tbRow.ARENA_ID] = {}
		end
		local tbPoint = {nX = tbRow.X, nY = tbRow.Y, nR = tbRow.RADII};	-- Trung tâm X,Y,bán kính 
		table.insert(self.tbArenaRange[tbRow.ARENA_ID], tbPoint);
	end
	return 1;
end

-- đấu loại xác định địa điểm tái nhập 
function FactionBattle:LoadArenaPoint(szFullPath)
	self.tbArenaPoint = {}
	local tbNumColName = {ARENA_ID = 1, X1 = 1, Y1 = 1, X2 = 1, Y2 = 1};
	local tbFileData = Lib:LoadTabFile(szFullPath, tbNumColName);
	if not tbFileData then
		return 0;
	end
	for nIndex, tbRow in pairs(tbFileData) do
		self.tbArenaPoint[tbRow.ARENA_ID] = {}	-- có tha cho xác định địa điểm tắc hội bao trùm 
		self.tbArenaPoint[tbRow.ARENA_ID][1] = {tbRow.X1, tbRow.Y1};
		self.tbArenaPoint[tbRow.ARENA_ID][2] = {tbRow.X2, tbRow.Y2};
	end
	return 1;
end

-- gia chở thưởng cho cái rương đích cà điểm 
function FactionBattle:LoadBoxPoint(szFullPath)
	self.tbBoxPoint = {}
	local tbNumColName = {GROUP = 1, X = 1, Y = 1};
	local tbFileData = Lib:LoadTabFile(szFullPath, tbNumColName);
	if not tbFileData then
		return 0;
	end
	for nIndex, tbRow in pairs(tbFileData) do
		if not self.tbBoxPoint[tbRow.GROUP] then
			self.tbBoxPoint[tbRow.GROUP] = {}
		end
		local tbPoint = {nX = tbRow.X, nY = tbRow.Y};	-- Trung tâm X,Y,bán kính 
		table.insert(self.tbBoxPoint[tbRow.GROUP], tbPoint);
	end
	return 1;
end

-- gia chở thưởng cho cái rương đích cà điểm 
function FactionBattle:LoadBoxPoint(szFullPath)
	self.tbBoxPoint = {}
	local tbNumColName = {GROUP = 1, X = 1, Y = 1};
	local tbFileData = Lib:LoadTabFile(szFullPath, tbNumColName);
	if not tbFileData then
		return 0;
	end
	for nIndex, tbRow in pairs(tbFileData) do
		if not self.tbBoxPoint[tbRow.GROUP] then
			self.tbBoxPoint[tbRow.GROUP] = {}
		end
		local tbPoint = {nX = tbRow.X, nY = tbRow.Y};	-- Trung tâm X,Y,bán kính 
		table.insert(self.tbBoxPoint[tbRow.GROUP], tbPoint);
	end
	return 1;
end

-- thu hoạch một cái lăn lộn chiến khu một ngẫu nhiên điểm 
function FactionBattle:GetRandomPoint(nArenaId)
	if not self.tbArenaRange or not self.tbArenaRange[nArenaId] then
		return;
	end
	local nArenaRangeNum = #self.tbArenaRange[nArenaId];
	local tbRandomRange = self.tbArenaRange[nArenaId][MathRandom(nArenaRangeNum)];
	if not tbRandomRange then
		return;
	end
	local nAngle = 6.28 * MathRandom()				-- ngẫu nhiên độ cung độ 3.14 * 2 = 6.28
	local nRadii = MathRandom(tbRandomRange.nR)	-- ngẫu nhiên cự ly 
	local nX = math.floor(math.cos(nAngle) * nRadii + tbRandomRange.nX);
	local nY = math.floor(math.sin(nAngle) * nRadii + tbRandomRange.nY);
	return nX, nY;
end

-- thu hoạch một cái đấu loại khu vực đích hai người xác định địa điểm 
function FactionBattle:GetElimFixPoint(nArenaId)
	if self.tbArenaPoint and self.tbArenaPoint[nArenaId] then
		return self.tbArenaPoint[nArenaId][1], self.tbArenaPoint[nArenaId][2];
	end
end

-- đóng hoạt động 
function FactionBattle:ShutDown(nFaction)
	if self.tbData and self.tbData[nFaction]then
		self.tbData[nFaction] = nil;
	end
	GCExcute{"FactionBattle:EndBattle_GC", nFaction};
end

function FactionBattle:ShowMsgToMapPlayer(nFaction, szMsg)
	if self.tbData and self.tbData[nFaction] then 
		self.tbData[nFaction]:MsgToMapPlayer(szMsg);
	end
end

-- truyền tống ngoạn gia tới một cái truyền vào điểm 
function FactionBattle:TrapIn(pPlayer)
    local nRandom = MathRandom(4)
    if pPlayer and self.REV_POINT[nRandom] then
        -- Lấy thứ hiện tại
        local nWeek = tonumber(GetLocalDate("%w")) -- 0=CN, 1=T2,...,6=T7
        local nMapId = 0

        if nWeek == 2 then
            -- Thứ 3: Loạn Chiến -> dùng FACTION_TO_MAP
            nMapId = self.ThiDauMonPhai_TO_MAP[pPlayer.nFaction]
        elseif nWeek == 5 then
            -- Thứ 6: Thi Đấu -> dùng ThiDauMonPhai_TO_MAP
            nMapId = self.FACTION_TO_MAP[pPlayer.nFaction]
        else
            -- Ngày khác -> mặc định dùng FACTION_TO_MAP (phòng trường hợp test)
            nMapId = self.FACTION_TO_MAP[pPlayer.nFaction]
        end

        -- Chuyển người chơi vào đúng map
        if nMapId then
            pPlayer.NewWorld(nMapId, unpack(self.REV_POINT[nRandom]))
	if ConfigAll.GioiHanKhongTrungPhai_ThiDauMonPhai  == 1 then 
				CampBattle:GioiHanMonPhai(pPlayer)
	end 
        else
            pPlayer.Msg("Không tìm thấy bản đồ cho môn phái này!")
        end
    end
end


function FactionBattle:FinalWinner(nFaction, nPlayerId)
	GCExcute{"FactionBattle:FinalWinner_GC", nFaction, nPlayerId};
	-- quán quân cờ 
	self:AwardChampionStart(nFaction, nPlayerId);
end


function FactionBattle:ShowCandidate(nFaction)
	local tbCandidate = GetCurCandidate(nFaction);
	print("tháng này ：")
	Lib:ShowTB(tbCandidate);
	tbCandidate = GetLastMonthCandidate(nFaction);
	print("tháng trước:");
	Lib:ShowTB(tbCandidate);
	print("khoá trước:");
	tbCandidate = GetAllElectWinner(nFaction);
	Lib:ShowTB(tbCandidate);
	print("gần nhất:")
	local tbPlayer = GetCurWinner(nFaction);
	if tbPlayer then
		Lib:ShowTB(tbPlayer);
	end
end
