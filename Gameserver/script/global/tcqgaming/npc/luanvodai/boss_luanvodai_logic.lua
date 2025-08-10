if not MODULE_GAMESERVER then
    return;
end

LuanVoDai = LuanVoDai or {};
LuanVoDai.ThoiGianChuanBi = 10  -- Thời gian chuẩn bị (giây)
LuanVoDai.ThoiGianChienDau = 300  -- Thời gian chiến đấu (giây)
LuanVoDai.ThoiGianTinhDiem = 10  -- Thời gian ghi điểm dame (giây)
LuanVoDai.MapList = {};  -- Danh sách các bản đồ động và người chơi
LuanVoDai.nMapCount = 0;
LuanVoDai.PlayerTimers = LuanVoDai.PlayerTimers or {}

-- Bắt đầu sự kiện cho người chơi
function LuanVoDai:StartLuanVoDaiEvent(pPlayer)
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))

	if  nCurTime < 0001 or nCurTime > 2100 then 
		Dialog:Say("<color=yellow>Luận Võ Đài chỉ được mở vào lúc\n:<color><color=green>00h01p đến 2100<color> hàng ngày\nTrả thưởng vào lúc <color=green>22h00 đến 23h59.");
		return;
	end
	
		local nGioiHanSoNguoiThamGia = KGblTask.SCGetDbTaskInt(DBTASD_GIOIHANLUANVODAI)

    if nGioiHanSoNguoiThamGia >= 18 then
        return Dialog:Say("Bản đồ Luận Võ Đài đã FULL 18 Võ Đài . Vui lòng chờ các cao thủ luận võ xong hiện nay số người luận võ là <color=yellow>"..nGioiHanSoNguoiThamGia.." người")
    end
	
    -- Tạo bản đồ động và khởi tạo mission
    self:JoinMission(pPlayer);
end

function LuanVoDai:ApplyMap(nPlayerId)
    -- Kiểm tra nếu `self.MapList` hoặc `self.MapList.BelongList` là nil, khởi tạo nó
    self.MapList = self.MapList or {}
    self.MapList.BelongList = self.MapList.BelongList or {}
	
    -- Lấy thông tin bản đồ mẫu cho Luận Võ Đài từ cấu hình hoặc thiết lập sẵn
    local nTempMapId = 2030  -- ID của bản đồ mẫu cho Luận Võ Đài (thay thế ID này bằng đúng giá trị bạn cần)

    -- Tạo bản đồ động
    local nMapFlag = Map:LoadDynMap(1, nTempMapId, {self.StartPreparationPhase, self, nPlayerId});

    -- Kiểm tra nếu việc tải bản đồ không thành công
    if nMapFlag ~= 1 then
        return nil;  -- Không thể tạo bản đồ
    end

    -- Gán bản đồ động cho người chơi
    self.MapList.BelongList[nPlayerId] = {nTempMapId, 0, nMapFlag};
	self.nMapCount = self.nMapCount + 1; 	-- 先占一个名额~不用等GC响应也能判断是否已经到达副本上限

    return nMapFlag;
end


-- Tham gia Mission và đưa người chơi vào bản đồ động
function LuanVoDai:JoinMission(pPlayer)
    -- Tạo bản đồ động
    local nMapId = self:ApplyMap(pPlayer.nId);
    if not nMapId then
        pPlayer.Msg("Không thể khởi tạo bản đồ. Vui lòng thử lại.");
        return;
    end

    -- Tạo Mission nếu chưa có
    if not self.MissionList then
        self.MissionList = {};
    end

    -- Kiểm tra xem người chơi đã có Mission chưa
    if not self.MissionList[pPlayer.nId] then
        self.MissionList[pPlayer.nId] = Mission:New();
    end

    -- Bắt đầu Mission
    local mission = self.MissionList[pPlayer.nId];
    if not mission.tbPlayers then
        mission:Open();
    end

    -- Thêm người chơi vào Mission
    mission:JoinPlayer(pPlayer, 0);  -- Tham gia nhóm 0 (có thể tùy chỉnh nếu có nhiều nhóm)
    pPlayer.Msg("Bạn đã tham gia vào Luận Võ Đài trên bản đồ riêng!");

end

-- Bắt đầu giai đoạn chuẩn bị cho người chơi
function LuanVoDai:StartPreparationPhase(nPlayerId, nMapId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
    if not pPlayer then
        return;
    end
	
	
	 local nRandomToaDo = MathRandom(1,5)
	 if nRandomToaDo == 1 then 
    pPlayer.NewWorld(nMapId, 1645, 3181);  -- Tọa độ trong bản đồ
	elseif nRandomToaDo == 2 then 
	    pPlayer.NewWorld(nMapId, 1635,3166);  -- Tọa độ trong bản đồ
	elseif nRandomToaDo == 3 then 
	    pPlayer.NewWorld(nMapId, 1633,3195);  -- Tọa độ trong bản đồ
	elseif nRandomToaDo == 4 then 
	    pPlayer.NewWorld(nMapId, 1655,3196);  -- Tọa độ trong bản đồ	
	elseif nRandomToaDo == 5 then 
	    pPlayer.NewWorld(nMapId, 1631,3196);  -- Tọa độ trong bản đồ
	end 
	pPlayer.SetTask(9190,1,nMapId)----Lưu bản đồ
	pPlayer.TeamDisable(1);
	KGblTask.SCSetDbTaskInt(DBTASD_GIOIHANLUANVODAI, KGblTask.SCGetDbTaskInt(DBTASD_GIOIHANLUANVODAI)+1);
self.PlayerTimers[nPlayerId] = self.PlayerTimers[nPlayerId] or {}

    -- Lưu thời gian chuẩn bị riêng cho người chơi
    self.PlayerTimers[nPlayerId] = {nRemainingPrepareTime = self.ThoiGianChuanBi, nStartTime = nil}

    -- Hiển thị thời gian chuẩn bị trên giao diện
    Dialog:SetBattleTimer(pPlayer, string.format("<color=green>Thời gian chuẩn bị còn: <color=white>%d giây<color>\n", self.PlayerTimers[nPlayerId].nRemainingPrepareTime), self.PlayerTimers[nPlayerId].nRemainingPrepareTime)
    Dialog:ShowBattleMsg(pPlayer, 1, 0)

    -- Đăng ký Timer mỗi giây để cập nhật đếm ngược
    self.PlayerTimers[nPlayerId].PrepareTimerId = Timer:Register(Env.GAME_FPS, self.UpdatePreparationTime, self, pPlayer, nMapId)
end

function LuanVoDai:RestorePlayerState(pPlayer,nMapId)
	if(pPlayer.nTeamId > 0)then
		Dialog:Say("Hoạt động này không cho phép tổ đội<enter><enter><color=yellow>Hãy rời tổ đội!<color>");
		return 0;
	end
		pPlayer.TeamDisable(1);
        pPlayer.NewWorld(nMapId, 1645, 3181)
end



-- Cập nhật thời gian chuẩn bị
function LuanVoDai:UpdatePreparationTime(pPlayer, nMapId)
    local nPlayerId = pPlayer.nId
    if self.PlayerTimers[nPlayerId].nRemainingPrepareTime > 0 then
        self.PlayerTimers[nPlayerId].nRemainingPrepareTime = self.PlayerTimers[nPlayerId].nRemainingPrepareTime - 1
        if self.PlayerTimers[nPlayerId].nRemainingPrepareTime > 0 then
            Dialog:SetBattleTimer(pPlayer, string.format("<color=green>Thời gian chuẩn bị còn: <color=white>%d giây<color>\n", self.PlayerTimers[nPlayerId].nRemainingPrepareTime), self.PlayerTimers[nPlayerId].nRemainingPrepareTime)
            Dialog:ShowBattleMsg(pPlayer, 1, 0)
            return Env.GAME_FPS
        else
            -- Bắt đầu giai đoạn chiến đấu
            self:StartFightPhase(pPlayer, nMapId)
            return 0
        end
    else
        return 0
    end
end


-- Bắt đầu giai đoạn chiến đấu
function LuanVoDai:StartFightPhase(pPlayer, nMapId)
    local nPlayerId = pPlayer.nId
    pPlayer.Msg("Sự kiện chính đã bắt đầu! Bạn có 3 phút để đánh Boss Hỏa Đao Vương!")
	pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
    -- Kiểm tra và khởi tạo PlayerTimers nếu cần
    self.PlayerTimers[nPlayerId] = self.PlayerTimers[nPlayerId] or {}

    -- Lưu thời gian bắt đầu riêng cho người chơi
    self.PlayerTimers[nPlayerId].nStartTime = GetTime()

    -- Tạo Boss Hỏa Đao Vương tại vị trí trong bản đồ động
	local pNpc
	  if pPlayer.nFaction == 1 or pPlayer.nFaction == 2 then  --hệ kim
     pNpc = KNpc.Add2(10424, 150, 4, nMapId, 1645, 3181) ----- sẽ ra boss hệ hỏa 
elseif pPlayer.nFaction == 3 or pPlayer.nFaction == 4 or pPlayer.nFaction == 11 then -- hệ mộc
     pNpc = KNpc.Add2(10424, 150, 1, nMapId, 1645, 3181) ----- sẽ ra bos hệ kim
elseif pPlayer.nFaction == 5 or pPlayer.nFaction == 6 or pPlayer.nFaction == 12 then  -- thủy 
     pNpc = KNpc.Add2(10424, 150, 5, nMapId, 1645, 3181) -- sẽ ra boss hệ thổ 
elseif pPlayer.nFaction == 7 or pPlayer.nFaction == 8 then  -- hỏa 
     pNpc = KNpc.Add2(10424, 150, 3, nMapId, 1645, 3181)----- sẽ ra boss hệ thủy 
elseif pPlayer.nFaction == 9 or pPlayer.nFaction == 10 then -- thổ 
     pNpc = KNpc.Add2(10424, 150, 2, nMapId, 1645, 3181)----- sẽ ra boss hệ mộc
end 
    if pNpc and pPlayer then
        self.PlayerTimers[nPlayerId].EventTimerId = Timer:Register(self.ThoiGianChienDau * Env.GAME_FPS, self.EndGame_GS, self, pPlayer, pNpc,nMapId)
        self.PlayerTimers[nPlayerId].nTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self,pPlayer, pNpc.dwId)
    else
        -- print("Error: pPlayer or pNpc does not exist")
    end

    -- Hủy bỏ Timer chuẩn bị
    if self.PlayerTimers[nPlayerId].PrepareTimerId then
        Timer:Close(self.PlayerTimers[nPlayerId].PrepareTimerId)
        self.PlayerTimers[nPlayerId].PrepareTimerId = nil
    end
end




function LuanVoDai:OnNpcTimer(pPlayer,nNpcId)
    local pNpc = KNpc.GetById(nNpcId);
    if not pNpc then
        return 0;
    end

    -- Lấy thời gian còn lại từ hàm GetRestTime
    local nTimeRemaining = self:GetRestTime(pPlayer);
    
    -- Gọi hàm cập nhật thời gian và sát thương cho người chơi
    self:AddAroundPlayersExp(nNpcId, nTimeRemaining);

    return 1 * Env.GAME_FPS;  -- Gọi lại sau mỗi giây
end

function LuanVoDai:GetRestTime(pPlayer)
    local nPlayerId = pPlayer.nId
    -- Kiểm tra xem PlayerTimers có tồn tại cho nPlayerId hay không
    if not self.PlayerTimers[nPlayerId] or not self.PlayerTimers[nPlayerId].nStartTime then
        -- Nếu PlayerTimers hoặc nStartTime không tồn tại, trả về giá trị mặc định (0 chẳng hạn)
        return 0
    end

    -- Tính toán thời gian còn lại
    local nCurrentTime = GetTime();
    local nElapsedTime = nCurrentTime - self.PlayerTimers[nPlayerId].nStartTime;  -- Thời gian đã trôi qua

    local nTimeRemaining = self.ThoiGianChienDau - nElapsedTime;  -- 180 giây = 3 phút
    if nTimeRemaining < 0 then
        nTimeRemaining = 0;  -- Đảm bảo không có giá trị âm
    end

    -- Debug: In giá trị để kiểm tra
    -- print("Player ID:", nPlayerId, "Elapsed Time:", nElapsedTime, "Time Remaining:", nTimeRemaining)

    return nTimeRemaining;
end



function LuanVoDai:AddAroundPlayersExp(nNpcId, nTimeRemaining)
    local pNpc = KNpc.GetById(nNpcId);
    if (not pNpc) then
        return 0;
    end

    local tbDamage = pNpc.GetDamageTable();
    if not tbDamage then
        return 0;
    end

    local tbPlayer = {unpack(tbDamage)};
    if tbPlayer then
        for i = 1, #tbPlayer do
            self:AddExp2Player(tbPlayer[i].nPlayerId, nNpcId, nTimeRemaining);  -- Truyền đúng nTimeRemaining
        end
    end

    local tbListPlayerXungQuanh = KNpc.GetAroundPlayerList(nNpcId, 56);
    if tbListPlayerXungQuanh then
        for _, pPlayer in pairs(tbListPlayerXungQuanh) do
            self:AddExp2Player(pPlayer.nId, nNpcId, nTimeRemaining);  -- Truyền đúng nTimeRemaining
        end
    end
end

function LuanVoDai:EndGame_GS(pPlayer, pNpc, nMapId)
    if not pPlayer then
        return 0 -- Dừng lại nếu người chơi không tồn tại
    end
    -- Đảm bảo rằng hàm không bị gọi lại nhiều lần cho cùng một người chơi
    if self.PlayerTimers[pPlayer.nId] and self.PlayerTimers[pPlayer.nId].bIsEndGame then
        -- print("Trận đấu đã kết thúc trước đó.")
        return 0 
    end
			if pNpc then
			ClearMapNpcWithName(nMapId,"Hỏa Đao Vương BOSS");
			end

    -- Thông báo cho người chơi và chuyển sang giai đoạn ghi nhận sát thương
    pPlayer.Msg("Trận đấu đã kết thúc. Hệ thống sẽ ghi nhận sát thương của bạn trong 10 giây.")
    pPlayer.SetTask(9190, 1, 0)  -- Lưu task bản đồ
	   local soluotdi =  pPlayer.GetTask(9190, 2)  -- Lưu task số lượt tham gia trong ngày
    pPlayer.SetTask(9190, 2, soluotdi + 1)  -- Lưu task số lượt tham gia trong ngày
    Dialog:ShowBattleMsg(pPlayer, 1, 0)
	pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
	pPlayer.SetFightState(0);
    -- Bắt đầu đếm ngược 10 giây ghi nhận sát thương
    self.PlayerTimers[pPlayer.nId] = self.PlayerTimers[pPlayer.nId] or {}
    self.PlayerTimers[pPlayer.nId].nRemainingGhiNhanTime = self.ThoiGianTinhDiem

    -- Đăng ký Timer để cập nhật quá trình ghi nhận
    self.PlayerTimers[pPlayer.nId].GhiNhanTimerId = Timer:Register(Env.GAME_FPS, self.UpdateGhiNhanTime, self, pPlayer, pNpc)

end

function LuanVoDai:UpdateGhiNhanTime(pPlayer, pNpc)
    if not pPlayer then
        return 0;
    end
    
    local nPlayerId = pPlayer.nId
    
    -- Kiểm tra nếu nRemainingGhiNhanTime không tồn tại, khởi tạo nó
    if not self.PlayerTimers[nPlayerId] or not self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime then
        -- Gán giá trị mặc định nếu không tồn tại
        self.PlayerTimers[nPlayerId] = self.PlayerTimers[nPlayerId] or {}
        self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime = 10
    end

    -- Kiểm tra thời gian ghi nhận còn lại
    if self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime > 0 then
        -- Trừ thời gian mỗi giây
        self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime = self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime - 1

        -- Cập nhật hiển thị trên giao diện
        Dialog:SetBattleTimer(pPlayer, string.format("<color=red>Thời gian ghi nhận còn lại: <color=white>%d giây<color>\n", self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime), self.PlayerTimers[nPlayerId].nRemainingGhiNhanTime)
        Dialog:ShowBattleMsg(pPlayer, 1, 0)

        -- Tiếp tục đếm ngược
        return Env.GAME_FPS
    else
        -- Khi thời gian ghi nhận đã hết, kết thúc sự kiện
        self:FinalizeEndGame(pPlayer, pNpc)

        return 0 -- Dừng Timer
    end
end

function LuanVoDai:FinalizeEndGame(pPlayer, pNpc)
    -- Đảm bảo chỉ kết thúc một lần cho mỗi người chơi
    if self.PlayerTimers[pPlayer.nId] and self.PlayerTimers[pPlayer.nId].bIsEndGame then
        return 0
    end

    -- Đánh dấu trận đấu đã kết thúc
    self.PlayerTimers[pPlayer.nId].bIsEndGame = true

    -- Ghi log sát thương nếu cần thiết
    self:LogPlayerDamage(pPlayer)

    -- Thông báo kết thúc sự kiện
    Dialog:ShowBattleMsg(pPlayer, 0, 0)
    pPlayer.NewWorld(8, 1726, 3386) -- Chuyển người chơi đến vị trí khác

    local nTimeRemaining = self:GetRestTime(pPlayer);
if nTimeRemaining <= 0 then 
    -- Đóng Timer ghi nhận nếu tồn tại
    if self.PlayerTimers[pPlayer.nId] then
        if self.PlayerTimers[pPlayer.nId].GhiNhanTimerId ~= nil then
            Timer:Close(self.PlayerTimers[pPlayer.nId].GhiNhanTimerId)
            self.PlayerTimers[pPlayer.nId].GhiNhanTimerId = nil
        end

        if self.PlayerTimers[pPlayer.nId].EventTimerId ~= nil then
            Timer:Close(self.PlayerTimers[pPlayer.nId].EventTimerId)
            self.PlayerTimers[pPlayer.nId].EventTimerId = nil
        end
			local nGioiHanSoNguoiThamGia = KGblTask.SCGetDbTaskInt(DBTASD_GIOIHANLUANVODAI)
			if nGioiHanSoNguoiThamGia > 0 then 
			KGblTask.SCSetDbTaskInt(DBTASD_GIOIHANLUANVODAI, KGblTask.SCGetDbTaskInt(DBTASD_GIOIHANLUANVODAI)-1);
			end 
        pPlayer.Msg("Tranh tài đã kết thúc. Hẹn gặp lại lần sau!")
    end

    -- Xóa thông tin Timer của người chơi để tránh lỗi gọi lại
    self.PlayerTimers[pPlayer.nId] = nil

    -- Xóa Mission của người chơi sau khi kết thúc
    if self.MissionList[pPlayer.nId] then
        self.MissionList[pPlayer.nId] = nil
    end
end
end


function LuanVoDai:ClearTimers(nPlayerId)
    if self.PlayerTimers[nPlayerId] then
        if self.PlayerTimers[nPlayerId].nTimerId then
            Timer:Close(self.PlayerTimers[nPlayerId].nTimerId)
            self.PlayerTimers[nPlayerId].nTimerId = nil
        end
        if self.PlayerTimers[nPlayerId].EventTimerId then
            Timer:Close(self.PlayerTimers[nPlayerId].EventTimerId)
            self.PlayerTimers[nPlayerId].EventTimerId = nil
        end
        if self.PlayerTimers[nPlayerId].GhiNhanTimerId then
            Timer:Close(self.PlayerTimers[nPlayerId].GhiNhanTimerId)
            self.PlayerTimers[nPlayerId].GhiNhanTimerId = nil
        end

        -- Xóa thông tin Timer của người chơi
        self.PlayerTimers[nPlayerId] = nil
    end
end



function LuanVoDai:AddExp2Player(nPlayerId, nNpcId, nTimeRemaining)

	
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	    -- Nếu thời gian đã hết, hủy bỏ Timer và ẩn giao diện
    if nTimeRemaining <= 0 then
    -- Hủy tất cả các Timer liên quan đến người chơi này
		self:ClearTimers(nPlayerId)
        Dialog:ShowBattleMsg(pPlayer, 0, 0)  -- Ẩn hiển thị
        return 0 -- Hủy Timer
    end
	
	local pNpc = KNpc.GetById(nNpcId);
	local tbDamage = pNpc.GetDamageTable();
	if (not pNpc) then
		return 0;
	end
	   local szTimeMsg = string.format("<color=green>Thời gian còn lại: <color=white>%d giây<color>\n", nTimeRemaining);
            Dialog:SetBattleTimer(pPlayer, szTimeMsg, nTimeRemaining);
            Dialog:ShowBattleMsg(pPlayer, 1, 0);
			-- pPlayer.SetTask(9190,2,nTimeRemaining)----Lưu bản đồ
		local szMsg = "<color=green>Tên Boss: <color=white>"..pNpc.szName.."<color>\n";
	
	-- 排序
	local tbSort = {unpack(tbDamage)};
	table.sort(tbSort, self._SortDamage);
	local nDamage = 0;
		for i=1,#tbSort  do
			nDamage = nDamage + tbSort[i].nDamage;
		end
    local nPlayerDamage = 0  -- Biến lưu sát thương của người chơi hiện tại

	for i = 1, 3 do
		if tbSort[i] then
			local szCaptainName = nil;
			local szTKName		= "Không";
				if tbSort[i].nPlayerId > 0 then
				if tbSort[i].nTeamId == 0 then
					szCaptainName = KGCPlayer.GetPlayerName(tbSort[i].nPlayerId);
				else
					local tbPlayer = KTeam.GetTeamMemberList(tbSort[i].nTeamId) or {};
					if tbPlayer[1] then
						szCaptainName = KGCPlayer.GetPlayerName(tbPlayer[1]);
					end
				end
			end
			if szCaptainName then
				nPlayerDamage = math.floor(tbSort[i].nDamage)  -- Lưu sát thương của người chơi hiện tại
				szMsg = szMsg .. string.format("<color=green>%d: <color>", i) .. "<color=red>Đội <color=yellow>" .. szCaptainName .. "<color> : <color=yellow> ".. math.floor(tbSort[i].nDamage) .."<color> <color=red>ST<color>\n";
			end
		end
	end
    -- Lưu lại sát thương của người chơi để ghi log sau khi sự kiện kết thúc
    if not self.tbPlayerDamage then
        self.tbPlayerDamage = {}
    end
    self.tbPlayerDamage[pPlayer.szName] = {
        nDamage = nPlayerDamage,
        nTime = GetLocalDate("%Y-%m-%d %H:%M:%S")  -- Lấy thời gian địa phương chính xác
    }
	    -- pPlayer.Msg(string.format("Sát thương của bạn: %d", nPlayerDamage))

	Dialog:SendBattleMsg(pPlayer,szMsg, 1);
	Dialog:ShowBattleMsg(pPlayer, 1, 0);
end

LuanVoDai._SortDamage = function(tbDamage1, tbDamage2)
	return tbDamage1.nDamage > tbDamage2.nDamage;
end


function LuanVoDai:LogPlayerDamage(pPlayer)
    -- Kiểm tra xem dữ liệu sát thương của người chơi có tồn tại không
    if not self.tbPlayerDamage then
        -- print("Error: Không có dữ liệu sát thương để ghi log.")
        return;
    end

    -- Kiểm tra nếu người chơi hợp lệ
    if not pPlayer then
        print("Error: Nguoi choi khong hop le.")
        return;
    end

    -- Lấy sát thương của người chơi từ bảng self.tbPlayerDamage
    local szPlayerName = pPlayer.szName
    local tbPlayerInfo = self.tbPlayerDamage[szPlayerName]
    
    -- Nếu không có thông tin sát thương của người chơi trong self.tbPlayerDamage, thoát hàm
    if not tbPlayerInfo then
		pPlayer.SetTask(9190,1,0)----Lưu bản đồ
        -- print("Không tìm thấy sát thương của người chơi:", szPlayerName) -- nếu off thì sẽ rơi vào trường này để tránh lỗi !
        return;
    end

    local nTongDame = tbPlayerInfo.nDamage
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())

    -- Đường dẫn tới file log
    local szFile = "\\script\\global\\tcqgaming\\npc\\luanvodai\\BangXepHang.txt"

    -- Đọc nội dung hiện tại của file log
    local szData = KFile.ReadTxtFile(szFile) or ""

    -- Kiểm tra sự tồn tại của người chơi trong file và cập nhật nếu cần
    local bDataExists = false
    local bDataChanged = false
    local lines = {}

    -- Đọc dữ liệu hiện tại và kiểm tra sự tồn tại của người chơi trong file
    if szData then
        for line in szData:gmatch("[^\r\n]+") do
            local name, vsv, date = line:match("([^\t]+)%s+([%d]+)%s+([^\t]+)")
            if name and vsv and date then
                if name == szPlayerName then
                    bDataExists = true -- Người chơi đã tồn tại
                    if tonumber(vsv) < nTongDame then
                        -- Cập nhật khi sát thương mới lớn hơn sát thương cũ
                        bDataChanged = true
                        vsv = tostring(nTongDame)
                        date = szDate -- Cập nhật lại thời gian
                    end
                end
                table.insert(lines, string.format("%s\t%s\t%s", name, vsv, date))
            else
                table.insert(lines, line) -- Giữ lại các dòng khác
            end
        end
    end

    -- Nếu người chơi chưa có trong bảng, thêm mới
    if not bDataExists then
        bDataChanged = true
        table.insert(lines, string.format("%s\t%d\t%s", szPlayerName, nTongDame, szDate))
    end

    -- Nếu có thay đổi dữ liệu thì ghi lại vào file
    if bDataChanged then
        -- Thêm dòng trống vào cuối log
        table.insert(lines, "")  -- Thêm dòng trống cuối

        -- Ghi lại toàn bộ nội dung file với dòng trống cuối cùng
        KFile.WriteFile(szFile, table.concat(lines, "\r\n"))
        -- print("Log đã được cập nhật cho người chơi:", szPlayerName)
    end
end

function LuanVoDai:NhanPhanThuongThamGia(pPlayer)
   local soluotdi =  pPlayer.GetTask(9190, 2)  -- Lưu task số lượt tham gia trong ngày
   local nTaskNhanThuong =  pPlayer.GetTask(9190, 3)  -- Lưu task số lượt tham gia trong ngày
   if nTaskNhanThuong > 0 then 
   Dialog:Say("Bạn đã nhận phần quà này rồi mà?")
   return 
   end 
	if soluotdi > 2 then 
	me.AddStackItem(18,1,114,6,{bForceBind=1},3)
	me.AddBindCoin(5*10000);---Đồng Khóa
	pPlayer.SetTask(9190, 3, 1)  -- Lưu task nhận thưởng tham gia
	 KDialog.MsgToGlobal("Chúc mừng <color=gold>"..pPlayer.szName.."<color> đã nhận được <color=yellow>3 viên Huyền Tinh Cấp 6 và 5 vạn đồng khóa<color> khi tham gia <color=yellow>Luận Võ Đài!")
	end 
	end 
	
	
function LuanVoDai:Reset_BangXepHang_NgayMoi()
	LuanVoDai:ResetFile_XepHang_LuanVoDai() -- reset file save
	local szMsg = "<color=green>Luận Võ Đài<color> đã mở cửa quý đồng đạo mau mau tìm đến<color=cyan> NPC Cổ Phong Hà <color>tại <pos=8,1740,3397> báo danh ngay."
	KDialog.MsgToGlobal(szMsg);
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,szMsg);
end

function LuanVoDai:ResetFile_XepHang_LuanVoDai()
        local szFile = "\\script\\global\\tcqgaming\\npc\\luanvodai\\BangXepHang.txt"
	KFile.WriteFile(szFile, "szName\tnTongDame\tszDate\nKhông xác định 1\t1\t2021-08-05 11:25:08\nKhông xác định 2\t2\t2021-08-05 11:25:34\nKhông xác định 3\t3\t2021-08-05 11:25:49\nKhông xác định 4\t4\t2021-08-05 11:25:56\nKhông xác định 5\t5\t2021-08-05 11:25:56\nKhông xác định 6\t6\t2021-08-05 11:25:56\nKhông xác định 7\t7\t2021-08-05 11:25:56\nKhông xác định 8\t8\t2021-08-05 11:25:56\nKhông xác định 9\t9\t2021-08-05 11:25:56\nKhông xác định 10\t10\t2021-08-05 11:25:56\n");	
end