if not MODULE_GAMESERVER then
return;
end
----Tính năng : Lôi đài bang hội 16 vs 16
----Time : 29/09/2023
-----Người viết : TCQGaming
 LOIDAI16.LoiDai_Time_BD = 15 * 60 -- thoi gian bao danh
 LOIDAI16.LoiDai_Time_ChienDau = 20 * 60; -- 60 *60, thời gian diễn ra sự kiện
-- LOIDAI16.LoiDai_Time_BD = 60 -- thoi gian bao danh
-- LOIDAI16.LoiDai_Time_ChienDau = 60; -- 60 *60, thời gian diễn ra sự kiện
LOIDAI16.ENDTIME = 2100;-- cau hinh thoi gian su kien dien ra, sau time này mới có thể nhận thưởng thành viên và bang chủ gs
LOIDAI16.WEEKDAY = 3;-- 3 là thứ 4
LOIDAI16.MapID = 2028;
LOIDAI16.nTimerId = 0;
LOIDAI16.nTimerId_BD = 0;
LOIDAI16.nTimerId_BD_1 = 0;
LOIDAI16.SoLuongBangBaoDanh = 10;
LOIDAI16.SoNguoi = 16
LOIDAI16.PlayerList = {};
function LOIDAI16:thongbaoloidai16()
    KDialog.MsgToGlobal("Hoạt động <color=yellow>Lôi đài bang hội<color> Đã Mở Báo Danh Tại : <pos=8,1696,3352>")
    GlobalExcute({"Dialog:GlobalNewsMsg_GS", "Lôi đài bang hội <pos=8,1696,3352>"})
	LOIDAI16:xoabaodanhbang()
	LOIDAI16:xoathanhvienthamgia()
	LOIDAI16:xoalogcap()
	LOIDAI16:xoadanhsachcap()
	LOIDAI16:xoalogketquawin()
	LOIDAI16:xoalogketquathua()
	LOIDAI16:baodanhloidai16()
end 

function LOIDAI16:baodanhloidai16()
    self.nTimerId_BD_1 = Timer:Register(1 * Env.GAME_FPS, self.StartGame_CB, self)
    self.nTimerId_BD = Timer:Register(LOIDAI16.LoiDai_Time_BD * Env.GAME_FPS, self.StartGame_GS, self)
end

function LOIDAI16:SetMapForbidReviveType(mapID, forbidReviveType, nReviveCount, szMsg)
    Map:RegisterMapForbidReviveType(mapID, forbidReviveType, nReviveCount, szMsg)
end
-- Hàm khởi đầu sự kiện Lôi Đài Bang Hội
function LOIDAI16:StartGame_GS()
    if LOIDAI16:CheckTime() == false then
        return
    end
	
    -- Danh sách các bản đồ từ 2023 đến 2029
    local mapList = {2023, 2024, 2025, 2026, 2027}

    -- Đặt giới hạn chết cho từng bản đồ trong danh sách
    for _, mapID in ipairs(mapList) do
        self:SetMapForbidReviveType(mapID, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
    end
	self.DichChuyenPlayer()
    self.ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self)
    self.nTimerId = Timer:Register(LOIDAI16.LoiDai_Time_ChienDau * Env.GAME_FPS, self.EndGame_GS, self)
    local szMsgBatDauCTC = string.format("<color=cyan>Chuẩn bị PK Sau 5 Phút<color>")
    KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsgBatDauCTC)
    KDialog.MsgToGlobal(szMsgBatDauCTC)
    LOIDAI16.Show_Line_BD = 0
    Timer:Close(self.nTimerId_BD)
    Timer:Close(self.nTimerId_BD_1)
end

-- Kiểm tra thời gian
function LOIDAI16:CheckTime()
    local nTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nTime))
    local nCurTime = tonumber(os.date("%H%M", nTime))
    if nWeekDay == LOIDAI16.WEEKDAY then
        return true
    end
    return false
end

-- Hàm bắt đầu chuẩn bị cho người chơi
function LOIDAI16:StartGame_CB()
    local tbLocalPlayer = KPlayer.GetAllPlayer()
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId, nPosX, nPosY = pPlayer.GetWorldPos()
        if nMapId == LOIDAI16.MapID then
            local szMsg = ""
            local nResTime_CB = LOIDAI16:GetRestTime1()
            if nResTime_CB > 0 then
                Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian chuẩn bị còn: <color=white>%s<color><color>\n", nResTime_CB)
                Dialog:ShowBattleMsg(pPlayer, 1, 0)
				else 
                return 0
            end
        end
    end
    return 3 * Env.GAME_FPS
end

-- Lấy thời gian còn lại cho việc chuẩn bị
function LOIDAI16:GetRestTime1()
    if self.nTimerId_BD > 0 then
        return Timer:GetRestTime(self.nTimerId_BD)
    end
    return 0
end

-- Lấy thời gian còn lại cho sự kiện chính
function LOIDAI16:GetRestTime()
    if self.nTimerId > 0 then
        return Timer:GetRestTime(self.nTimerId)
    end
    return 0
end

function LOIDAI16:OnNpcTimer()
    self:AddAroundPlayersExp()
    return 3 * Env.GAME_FPS
end

function LOIDAI16:AddAroundPlayersExp()
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
    local tbPlayerData = KFile.ReadTxtFile(szMemberFile)

    if not tbPlayerData then
        return
    end

        self:AddExp2Player()
	
end

function LOIDAI16:AddExp2Player()
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
    local tbPlayerData = KFile.ReadTxtFile(szMemberFile)

    if not tbPlayerData then
        return
    end

	local tbPlayer = LOIDAI16.PlayerList;
	for _, nPlayerId in pairs(tbPlayer) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
        local nMapId, nPosX, nPosY = pPlayer.GetWorldPos()
        local szLogFileName = ""
        if nMapId == 2023 then
            szLogFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap1.txt"
        elseif nMapId == 2024 then
            szLogFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap2.txt"
        elseif nMapId == 2025 then
            szLogFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap3.txt"
        elseif nMapId == 2026 then
            szLogFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap4.txt"
        elseif nMapId == 2027 then
            szLogFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap5.txt"
        end

        local szLogContent = KFile.ReadTxtFile(szLogFileName)

        if not szLogContent then
            return
        end

        -- Tạo một bảng để lưu điểm số của các bang hội
        local tbBangHoiDiem = {}

        -- Đọc log điểm số từ tệp và cập nhật bảng điểm số
        for line in string.gmatch(szLogContent, "([^\r\n]+)") do
            local szBangHoi, nDiem = string.match(line, "(.-):%s*(%d+)")
            if szBangHoi and nDiem then
                if tbBangHoiDiem[szBangHoi] then
                    -- Nếu tên bang đã tồn tại trong bảng điểm số, cộng thêm điểm mới vào
                    tbBangHoiDiem[szBangHoi] = tbBangHoiDiem[szBangHoi] + tonumber(nDiem)
                else
                    -- Nếu tên bang chưa tồn tại, thêm mới vào bảng
                    tbBangHoiDiem[szBangHoi] = tonumber(nDiem)
                end
            end
        end

        -- Sắp xếp bảng xếp hạng theo điểm số
        local tbSortedScores = {}
        for szName, nScore in pairs(tbBangHoiDiem) do
            table.insert(tbSortedScores, {szName, nScore})
        end
        table.sort(tbSortedScores, function(a, b) return a[2] > b[2] end)

        local szMsg = "Xếp Hạng Điểm: \n"

        for i, data in ipairs(tbSortedScores) do
            local szName, nScore = data[1], data[2]
            szMsg = szMsg .. string.format("Hạng %d: <color=cyan>%s<color> : <color=yellow>%d<color> điểm\n", i, szName, nScore)
        end
			szMsg =	szMsg .."\nQuy tắc tính điểm\n"..
					"<color=yellow>Giết Địch +1000 Điểm\n"..
					"";

	local nMapId, nX, nY = pPlayer.GetWorldPos();
	if nMapId == 2023 or nMapId == 2024 or nMapId == 2025 or nMapId == 2026 or nMapId == 2027 then
		Dialog:SendBattleMsg(pPlayer, szMsg, 1);
		Dialog:ShowBattleMsg(pPlayer, 1, 0);
	end


        local nResTime = LOIDAI16:GetRestTime()

        if nResTime > 0 then
			if pPlayer.nPkModel == Player.emKPK_STATE_PRACTISE then
				pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER;-- chuyen pk emKPK_STATE_BUTCHER
            end
        -- Hiển thị rank dựa trên thông điệp
            Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian còn lại: <color=white>%s<color><color>\n", nResTime)
            Dialog:ShowBattleMsg(pPlayer, 1, 0)
        end
    end
end 

-- Sắp xếp bảng xếp hạng theo điểm
LOIDAI16._SortDamage = function(tbDamage1, tbDamage2)
    return tbDamage1[2] > tbDamage2[2]
end


function LOIDAI16:FindPosTong(tbArr,nValue)
	local pos = 0;
	if not tbArr then
		return;
	end
	for	i = 1,#tbArr do
		if tbArr[i][1] == nValue then
		
		pos = i;
		break;
		end
	end
	return pos;
end


function LOIDAI16:EndGame_GS()
    if not LOIDAI16:CheckTime() then
        return
    end

    Timer:Close(self.ReadyTimerId)
    Timer:Close(self.nTimerId)
    self.nTimerId = 0
    self.ReadyTimerId = 0
    LOIDAI16.nTimerId_BD = 0
    LOIDAI16.nTimerId_BD_1 = 0
	LOIDAI16.PlayerList = {};
    local tbMapIds = {2023, 2024, 2025, 2026, 2027}
    local tbBangHoiScores = {}  -- Bảng lưu số điểm của từng bang hội

    for _, nMapId in ipairs(tbMapIds) do
        local szLogFileName = string.format("\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap%d.txt", nMapId - 2022)
        local szLogContent = KFile.ReadTxtFile(szLogFileName)

        if szLogContent then
            for line in string.gmatch(szLogContent, "([^\r\n]+)") do
				local szBangHoi, nDiem = string.match(line, "(.-): (%d+)")

                if szBangHoi and nDiem then
                    nDiem = tonumber(nDiem)
                    if not tbBangHoiScores[szBangHoi] then
                        tbBangHoiScores[szBangHoi] = 0
                    end
                    tbBangHoiScores[szBangHoi] = tbBangHoiScores[szBangHoi] + nDiem
                end
            end
        end
    end

    -- Xác định và ghi kết quả cho từng cặp đấu
    local tbWinningBangHois = {}
    local tbLosingBangHois = {}  -- Danh sách các bang hội thua
    local nMaxScore = 0

    for szBangHoi, nDiem in pairs(tbBangHoiScores) do
        if nDiem > nMaxScore then
            nMaxScore = nDiem
            tbWinningBangHois = {szBangHoi}
            tbLosingBangHois = {}  -- Đặt lại danh sách các bang thua
        elseif nDiem == nMaxScore then
            table.insert(tbWinningBangHois, szBangHoi)
        else
            table.insert(tbLosingBangHois, szBangHoi)
        end
    end

    local szCapFile = "\\script\\ChucNang\\loidaibanghoi\\danhSachCap.txt"
    local szCapData = KFile.ReadTxtFile(szCapFile)

    if szCapData then
        for line in string.gmatch(szCapData, "([^\r\n]+)") do
            local szBangHoi1, szBangHoi2 = string.match(line, "(.+) đối đầu với (.+)")

            if szBangHoi1 and szBangHoi2 then
                if szBangHoi1 == "KhôngBang" then
                    table.insert(tbWinningBangHois, szBangHoi2)
                elseif szBangHoi2 == "KhôngBang" then
                    table.insert(tbWinningBangHois, szBangHoi1)
                end
            end
        end
    end

    -- Ghi tên các bang hội chiến thắng vào tệp log thắng
    local szLogWinFileName = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquawin.txt"
    local szLogWinContent = table.concat(tbWinningBangHois, "\n")

    KFile.WriteFile(szLogWinFileName, szLogWinContent, false)  -- Ghi đè nội dung tệp

    -- Ghi tên các bang hội thua vào tệp log thua
    local szLogLoseFileName = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquathua.txt"
    local szLogLoseContent = table.concat(tbLosingBangHois, "\n")

    KFile.WriteFile(szLogLoseFileName, szLogLoseContent, false)  -- Ghi đè nội dung tệp

    -- Xử lý hành động cho các bang hội thua
    for _, szLosingBangHoi in ipairs(tbLosingBangHois) do
        LOIDAI16:VeThanhPTThua(szLosingBangHoi)  -- Gọi hàm xử lý cho các bang hội thua
    end

    -- Hiển thị thông báo toàn cầu và thực hiện các hành động khác
    if #tbWinningBangHois > 0 then
        local szMsg = ""
        for _, szWinningBangHoi in ipairs(tbWinningBangHois) do
            szMsg = szMsg .. string.format("Bang hội <color=yellow>%s<color> chiến thắng với <color=yellow>%d<color> điểm!\n", szWinningBangHoi, nMaxScore)
        end
        KDialog.MsgToGlobal(szMsg)
        LOIDAI16:VeThanhPTWin()
    else
        LOIDAI16:VeThanhPT()
        KDialog.MsgToGlobal("Không có bang hội nào dành chiến thắng hoặc thất bại. Chúc mừng tất cả các bang hội đã tham gia!")
    end
end

function LOIDAI16:SapXepVaGhiDanhSachCap()
    -- Đọc tệp log
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\baodanh.txt"
    local szMemberData = KFile.ReadTxtFile(szMemberFile)

    -- Tạo danh sách tất cả các bang hội từ tệp "baodanh.txt"
    local tbMembers = {}
    for szBangHoi in string.gmatch(szMemberData, "([^\n]+)") do
        table.insert(tbMembers, szBangHoi)
    end

    -- Kiểm tra số lượng bang hội đã báo danh
    local nTotalBangHoi = #tbMembers
    local szMsg = string.format("<color=cyan>Hệ Thống Đã Sắp Xếp Cặp Thi Đấu Bang Hội Thành Công<color>\nHiện có %d bang hội đã báo danh lôi đài vui lòng chờ thêm chút nữa trận đấu sẽ bắt đầu ngay sau đây.", nTotalBangHoi)
    KDialog.MsgToGlobal(szMsg)

    -- Ngẫu nhiên xếp lại thứ tự của các bang hội
    for i = nTotalBangHoi, 2, -1 do
        local j = MathRandom(1, i)
        tbMembers[i], tbMembers[j] = tbMembers[j], tbMembers[i]
    end

    -- Sắp xếp các cặp đối đầu
    local tbCacCap = {}

    -- Tạo các cặp đối đầu
    for i = 1, nTotalBangHoi, 2 do
        local szBangHoi1 = tbMembers[i]
        local szBangHoi2 = tbMembers[i + 1]

        if szBangHoi1 and szBangHoi2 then
            table.insert(tbCacCap, {BangHoi1 = szBangHoi1, BangHoi2 = szBangHoi2})
			        elseif szBangHoi1 then
            table.insert(tbCacCap, {BangHoi1 = szBangHoi1, BangHoi2 = "KhôngBang"})
        end
    end

    -- Ghi danh sách các cặp vào log
    local szCapFile = "\\script\\ChucNang\\loidaibanghoi\\danhSachCap.txt"
    local szCapData = ""

    for _, tbCap in ipairs(tbCacCap) do
        if tbCap.BangHoi1 and tbCap.BangHoi2 then
            szCapData = szCapData .. tbCap.BangHoi1 .. " đối đầu với " .. tbCap.BangHoi2 .. "\n"
        end
    end

    KFile.WriteFile(szCapFile, szCapData)

    -- Hiển thị thông báo cho các cặp đối đầu
    for _, tbCap in ipairs(tbCacCap) do
        if tbCap.BangHoi1 and tbCap.BangHoi2 then
            local szMsg = string.format("<color=yellow>%s<color> đối đầu với <color=yellow>%s<color>", tbCap.BangHoi1, tbCap.BangHoi2)
            KDialog.MsgToGlobal(szMsg)
        end
    end
end

function LOIDAI16:GhiLogDiemBangHoi()
    -- Đọc danh sách tên các bang hội và các cặp đối đầu từ tệp baodanh.txt
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\danhSachCap.txt"
    local szMemberData = KFile.ReadTxtFile(szMemberFile)

    local tbCacCap = {}  -- Danh sách các cặp đối đầu
    for line in string.gmatch(szMemberData, "([^\n]+)") do
        local szTongName1, szTongName2 = string.match(line, "^(.-) đối đầu với (.-)$")
        if szTongName1 and szTongName2 then
            table.insert(tbCacCap, {BangHoi1 = szTongName1, BangHoi2 = szTongName2})
        end
    end

    -- Lấy danh sách các bản đồ
    local tbMapIds = {2023, 2024, 2025, 2026, 2027}

    -- Xác định điểm số ban đầu cho từng bang hội
    local tbBangHoiDiem = {}
    for i, tbCap in ipairs(tbCacCap) do
        local szTongName1 = tbCap.BangHoi1
        local szTongName2 = tbCap.BangHoi2
        tbBangHoiDiem[szTongName1] = 0
        tbBangHoiDiem[szTongName2] = 0

        -- Ghi log tên các bang hội và điểm số 0 vào tệp log cho từng cặp đối đầu
        if tbMapIds[i] then
            local szLogFileName = string.format("\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap%d.txt", tbMapIds[i] - 2022)
            local szLogContent = KFile.ReadTxtFile(szLogFileName)
            if not szLogContent or szLogContent == "" then
                szLogContent = szTongName1 .. ": 0\n" .. szTongName2 .. ": 0\n"
                KFile.WriteFile(szLogFileName, szLogContent, false)
            end
        end
    end
end




function LOIDAI16:DichChuyenPlayer()
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
    local szMemberData = KFile.ReadTxtFile(szMemberFile)

    if not szMemberData then
        return
    end

    LOIDAI16:GhiLogDiemBangHoi()

    -- Tách danh sách thành viên thành mảng
    local tbMembers = {}
    for line in string.gmatch(szMemberData, "(.-)\r\n") do
        local szTongName, szPlayerName = string.match(line, "^(.-)\t(.-)$")
        table.insert(tbMembers, {TongName = szTongName, PlayerName = szPlayerName})
    end

    -- Danh sách các bản đồ cố định
    local tbMapIds = {2023, 2024, 2025, 2026, 2027}
    local nMapIndex = 1

    -- Đọc tất cả tệp log cặp đấu và dịch chuyển các cặp đó vào map tương ứng
    for i = 1, #tbMapIds do
        local nMapId = tbMapIds[i]
        local szCapFileName = string.format("\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap%d.txt", i)

        local szCapData = KFile.ReadTxtFile(szCapFileName)

        if szCapData and szCapData ~= "" then
            local tbGroupMembers = {}
            for _, tbPlayerInfo in pairs(tbMembers) do
                local szTongName = tbPlayerInfo.TongName
                if string.find(szCapData, szTongName) then
                    local pPlayer = KPlayer.GetPlayerByName(tbPlayerInfo.PlayerName)
                    if pPlayer then
                        local nMapId, _, _ = pPlayer.GetWorldPos()
                        if nMapId == 2028 then
                            table.insert(tbGroupMembers, pPlayer)
                        end
                    end
                end
            end 

            if #tbGroupMembers > 0 then
                for _, pPlayer in pairs(tbGroupMembers) do
                    pPlayer.NewWorld(nMapId, 1618, 3175)
                end
                KDialog.MsgToGlobal("Hoạt động Lôi Đài Bang Hội đã sẵn sàng")
            end
        end
    end

    -- Xử lý trường hợp có một bang còn lại
    local tbRemainingMembers = {}
    for _, tbPlayerInfo in pairs(tbMembers) do
        local pPlayer = KPlayer.GetPlayerByName(tbPlayerInfo.PlayerName)
        if pPlayer then
            local nMapId, _, _ = pPlayer.GetWorldPos()
            if nMapId == 2028 then
                table.insert(tbRemainingMembers, pPlayer)
            end
        end
    end

    if #tbRemainingMembers > 0 then
        local nMapId
        repeat
            nMapId = tbMapIds[nMapIndex]
            nMapIndex = nMapIndex % #tbMapIds + 1
        until not tbAssignedMaps[nMapId]

        for _, pPlayer in pairs(tbRemainingMembers) do
            pPlayer.NewWorld(nMapId, 1618, 3175)
        end
        KDialog.MsgToGlobal("Hoạt động Lôi Đài Bang Hội đã sẵn sàng cho bang còn lại.")
    end
end




function LOIDAI16:GetRandomMapId()
    local tbMapList = {2023, 2024, 2025, 2026, 2027}
    return tbMapList[MathRandom(#tbMapList)]
end

function LOIDAI16:vaomapbaodanh()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2023) or (nMapId == 2024) or (nMapId == 2025) or (nMapId == 2026) or (nMapId == 2027)  then
			pPlayer.NewWorld(2028,1656,3269);
			pPlayer.SetTask(3141,1,0);
	end
end
end

function LOIDAI16:xoabaodanhbang()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\baodanh.txt"
	KFile.WriteFile(szFile, "");	
end

function LOIDAI16:xoalogketquawin()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquawin.txt"
	KFile.WriteFile(szFile, "");	
end

function LOIDAI16:xoalogketquathua()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquathua.txt"
	KFile.WriteFile(szFile, "");	
end

function LOIDAI16:xoathanhvienthamgia()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
	KFile.WriteFile(szFile, "");	
end

function LOIDAI16:xoadanhsachcap()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\danhSachCap.txt"
	KFile.WriteFile(szFile, "");	
end

function LOIDAI16:xoalogcap()
    for i = 1, 5 do
        local szFileName = "\\script\\ChucNang\\loidaibanghoi\\DiemSo\\cap" .. i .. ".txt"
        KFile.WriteFile(szFileName, "")
    end
end

function LOIDAI16:PKLoiDaiStart()
local tbLocalPlayer = KPlayer.GetAllPlayer();
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId = pPlayer.GetWorldPos();  
        if (nMapId == 2023) or (nMapId == 2024) or (nMapId == 2025) or (nMapId == 2026) or (nMapId == 2027) then
			pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
			pPlayer.SetFightState(1);
			Dialog:SendBlackBoardMsg(pPlayer, "Trạng Thái Đồ Sát Đã Sẵn Sàng, Người Chơi Có Thể PK!!!");
        end
end

end


function LOIDAI16:VeThanhPTThua(szBangHoi)
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2023) or (nMapId == 2024) or (nMapId == 2025) or (nMapId == 2026) or (nMapId == 2027)  then
		pPlayer.NewWorld(24, 1767, 3540);
	end
end
end

function LOIDAI16:VeThanhPT()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2023) or (nMapId == 2024) or (nMapId == 2025) or (nMapId == 2026) or (nMapId == 2027)  then
		pPlayer.NewWorld(24, 1767, 3540);
	end
end
end

function LOIDAI16:VeThanhPTWin(szBangHoi)
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2023) or (nMapId == 2024) or (nMapId == 2025) or (nMapId == 2026) or (nMapId == 2027)  then
		pPlayer.NewWorld(24, 1767, 3540);
		pPlayer.SetTask(9174, 2, 2);
	end
end
KDialog.MsgToGlobal("Hoạt động <color=pink> Giai Đoạn 1 Lôi Đài Bang Hội 16 Vs 16<color>Đã Kết Thúc Rồi ");
end

function LOIDAI16:vethanhgiaidoan2()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2029) then
		pPlayer.NewWorld(24, 1767, 3540);
	end
end
			KDialog.MsgToGlobal("Hoạt động <color=yellow> Giai Đoạn 2 Liệp Sát Hỏa Kỳ Lân Đã Kết Thúc<color>");
end


