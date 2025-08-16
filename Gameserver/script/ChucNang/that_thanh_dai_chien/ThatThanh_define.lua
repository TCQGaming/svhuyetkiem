if not MODULE_GAMESERVER then
return;
end
----Tính năng : Thất Thành Đại Chiến
----Time : 11/01/2024
-----Người viết : TCQGaming
 CTC_7_Thanh.LoiDai_Time_BD =  50*60 -- thoi gian bao danh 19h00 - 19h50
 CTC_7_Thanh.LoiDai_Time_ChienDau =  60* 60; -- 60 *60, thời gian diễn ra sự kiện 19h50 - 20h50
CTC_7_Thanh.ENDTIME = 2100;-- cau hinh thoi gian su kien dien ra, sau time này mới có thể nhận thưởng thành viên và bang chủ gs
CTC_7_Thanh.WEEKDAY = 1;-- 1 là thứ 2
CTC_7_Thanh.ThoiGianThamGiaBatDau = 1930;-----Bắt đầu tham gia 19h30
CTC_7_Thanh.ThoiGianThamGiaKetThuc = 2050;------Kết thúc tham gia 20h50
CTC_7_Thanh.ThoiGianBaoDanh7Thanh = 1900;------Thời gian báo danh bang chủ - 19h00
CTC_7_Thanh.ThoiGianEndBaoDanh7Thanh = 1950;------ Kết thúc báo danh 19h50
CTC_7_Thanh.TimeNhanThuongStart = 2050;-------Bắt đầu cho nhận thưởng 20h50
CTC_7_Thanh.TimeNhanThuongEnd = 2359;--------Kết thúc nhận thưởng 23h59 cùng ngày
CTC_7_Thanh.MapID = 2028;
CTC_7_Thanh.nTimerId = 0;
CTC_7_Thanh.nTimerId_BD = 0;
CTC_7_Thanh.nTimerId_BD_1 = 0;
CTC_7_Thanh.SoLuongBangBaoDanh = 10;
CTC_7_Thanh.SoNguoi = 100
CTC_7_Thanh.PlayerList = {};
CTC_7_Thanh.LongTru_BK  = "";
CTC_7_Thanh.LongTru_PT  = "";
CTC_7_Thanh.LongTru_ThanhDo  = "";
 CTC_7_Thanh.LongTru_TuongDuong  = "";
 CTC_7_Thanh.LongTru_DuongChau  = "";
 CTC_7_Thanh.LongTru_DaiLy  = "";
 CTC_7_Thanh.LongTru_LamAn  = "";
CTC_7_Thanh.StartTime_LongTru_PT = 0 
CTC_7_Thanh.StartTime_LongTru_BK = 0 
CTC_7_Thanh.StartTime_LongTru_DC = 0 
CTC_7_Thanh.StartTime_LongTru_LA = 0 
CTC_7_Thanh.StartTime_LongTru_ThanhDo = 0 
CTC_7_Thanh.StartTime_LongTru_TuongDuong = 0 
CTC_7_Thanh.StartTime_LongTru_DaiLy = 0 
CTC_7_Thanh.TimeBatTu = 30*60
function CTC_7_Thanh:thongbaoCTC_7_Thanh()
    KDialog.MsgToGlobal("Hoạt động <color=yellow>Thất Thành Đại Chiến<color> Đã Mở Báo Danh Tại : <pos=8,1717,3362>")
    GlobalExcute({"Dialog:GlobalNewsMsg_GS", "Thất Thành Đại Chiến <pos=8,1717,3362>"})
	CTC_7_Thanh:xoabaodanhbang()
	CTC_7_Thanh:xoathanhvienthamgia()
	CTC_7_Thanh:xoalognhanthuong()
	-- CTC_7_Thanh:baodanhCTC_7_Thanh()
end 

function CTC_7_Thanh:baodanhCTC_7_Thanh()
    self.nTimerId_BD_1 = Timer:Register(1 * Env.GAME_FPS, self.StartGame_CB, self)
    self.nTimerId_BD = Timer:Register(CTC_7_Thanh.LoiDai_Time_BD * Env.GAME_FPS, self.StartGame_GS, self)
end

function CTC_7_Thanh:StartGame_GS()
    if CTC_7_Thanh:CheckTime() == false then
        return
    end
	self.CreatNPC_BK();
	self.CreatNPC_DC();
	self.CreatNPC_LA();
	self.CreatNPC_TuongDuong();
	self.CreatNPC_ThanhDo();
	self.CreatNPC_PT();
	self.CreatNPC_DaiLy();
	CTC_7_Thanh:PKLoiDaiStart()
    self.ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self)
    self.nTimerId = Timer:Register(CTC_7_Thanh.LoiDai_Time_ChienDau * Env.GAME_FPS, self.EndGame_GS, self)
    CTC_7_Thanh.Show_Line_BD = 0
    Timer:Close(self.nTimerId_BD)
    Timer:Close(self.nTimerId_BD_1)
end


function CTC_7_Thanh:CreatNPC_BK()
	local tbTruBK	= Npc:GetClass("long_tru_thatthanh_bk");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2163);
	if nMapIndex < 0 then
		return;
	end
   	local pNpc = KNpc.Add2(10396, 200, -1, 2163, 1579,3092);
		Npc:RegPNpcOnDeath(pNpc, tbTruBK.OnDeath_Boss, self,0);
end

function CTC_7_Thanh:CreatNPC_DC()
	local tbTruDC	= Npc:GetClass("long_tru_thatthanh_duongchau");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2164);
	if nMapIndex < 0 then
		return;
	end
   local pNpc = KNpc.Add2(10399, 200, -1, 2164, 1598,3185);
		Npc:RegPNpcOnDeath(pNpc, tbTruDC.OnDeath_Boss, self,0);
end

function CTC_7_Thanh:CreatNPC_LA()
local tbTruLA	= Npc:GetClass("long_tru_thatthanh_laman");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2165);
	if nMapIndex < 0 then
		return;
	end
   local pNpc = KNpc.Add2(10397, 200, -1, 2165, 1631,3947);
		Npc:RegPNpcOnDeath(pNpc, tbTruLA.OnDeath_Boss, self,0);
end
function CTC_7_Thanh:CreatNPC_TuongDuong()
	local tbTruTuongDuong	= Npc:GetClass("long_tru_thatthanh_tuongduong");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2166);
	if nMapIndex < 0 then
		return;
	end
    local pNpc = KNpc.Add2(10401, 200, -1, 2166, 1665,3142);
		Npc:RegPNpcOnDeath(pNpc, tbTruTuongDuong.OnDeath_Boss, self,0);
end
function CTC_7_Thanh:CreatNPC_ThanhDo()
	local tbTruThanhDo	= Npc:GetClass("long_tru_thatthanh_thanhdo");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2167);
	if nMapIndex < 0 then
		return;
	end
  local pNpc =  KNpc.Add2(10398, 200, -1, 2167, 1621,3221);
		Npc:RegPNpcOnDeath(pNpc, tbTruThanhDo.OnDeath_Boss, self,0);
end
function CTC_7_Thanh:CreatNPC_PT()
	local tbTruPT	= Npc:GetClass("long_tru_thatthanh_pt");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2168);
	if nMapIndex < 0 then
		return;
	end
   local pNpc = KNpc.Add2(10395, 200, -1, 2168, 1762,3497);
		Npc:RegPNpcOnDeath(pNpc, tbTruPT.OnDeath_Boss, self,0);
end
function CTC_7_Thanh:CreatNPC_DaiLy()
	local tbTruDL	= Npc:GetClass("long_tru_thatthanh_daily");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(2169);
	if nMapIndex < 0 then
		return;
	end
 local pNpc =   KNpc.Add2(10400, 200, -1, 2169, 1506,3274);
		Npc:RegPNpcOnDeath(pNpc, tbTruDL.OnDeath_Boss, self,0);
end

-- Kiểm tra thời gian
function CTC_7_Thanh:CheckTime()
    local nTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nTime))
    local nCurTime = tonumber(os.date("%H%M", nTime))
    if nWeekDay == CTC_7_Thanh.WEEKDAY then
        return true
    end
    return false
end

-- Hàm bắt đầu chuẩn bị cho người chơi
function CTC_7_Thanh:StartGame_CB()
    local tbLocalPlayer = KPlayer.GetAllPlayer()
    local mapList = {2163, 2164, 2165, 2166, 2167, 2168, 2169}
    
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId, _, _ = pPlayer.GetWorldPos()
		
        for _, mapId in ipairs(mapList) do
            if nMapId == mapId then
                local nResTime_CB = CTC_7_Thanh:GetRestTime1()
                if nResTime_CB > 0 then
                    Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian chuẩn bị còn: <color=white>%s<color><color>\n", nResTime_CB)
                    Dialog:ShowBattleMsg(pPlayer, 1, 0)
                end
                break -- Ngừng kiểm tra các bản đồ khác trong mapList nếu đã tìm thấy mapId tương ứng
            end
        end
    end
    
    return 3 * Env.GAME_FPS
end


-- Lấy thời gian còn lại cho việc chuẩn bị
function CTC_7_Thanh:GetRestTime1()
    if self.nTimerId_BD > 0 then
        return Timer:GetRestTime(self.nTimerId_BD)
    end
    return 0
end

-- Lấy thời gian còn lại cho sự kiện chính
function CTC_7_Thanh:GetRestTime()
    if self.nTimerId > 0 then
        return Timer:GetRestTime(self.nTimerId)
    end
    return 0
end

function CTC_7_Thanh:OnNpcTimer()
    self:AddExp2Player()
    return 3 * Env.GAME_FPS
end

function CTC_7_Thanh:AddExp2Player()
	local tbLocalPlayer = KPlayer.GetAllPlayer()
    local mapList = {2163, 2164, 2165, 2166, 2167, 2168, 2169}
    
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId, _, _ = pPlayer.GetWorldPos()
		
        for _, mapId in ipairs(mapList) do
            if nMapId == mapId then
		local currentTime = GetTime()
    local timeRemaining_PT = CTC_7_Thanh.StartTime_LongTru_PT and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_PT)) or 0
    local timeRemaining_BK = CTC_7_Thanh.StartTime_LongTru_BK and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_BK)) or 0
    local timeRemaining_LA = CTC_7_Thanh.StartTime_LongTru_LA and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_LA)) or 0
    local timeRemaining_ThanhDo = CTC_7_Thanh.StartTime_LongTru_ThanhDo and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_ThanhDo)) or 0
    local timeRemaining_DC = CTC_7_Thanh.StartTime_LongTru_DC and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_DC)) or 0
    local timeRemaining_TuongDuong = CTC_7_Thanh.StartTime_LongTru_TuongDuong and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_TuongDuong)) or 0
    local timeRemaining_DaiLy = CTC_7_Thanh.StartTime_LongTru_DaiLy and (CTC_7_Thanh.TimeBatTu - (currentTime - CTC_7_Thanh.StartTime_LongTru_DaiLy)) or 0
	  local szMsg_PT = ""
	  local szMsg_BK = ""
	  local szMsg_LA = ""
	  local szMsg_ThanhDo = ""
	  local szMsg_DC = ""
	  local szMsg_TuongDuong = ""
	  local szMsg_DaiLy = ""

    local szFilePT = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local ChiemPT = KFile.ReadTxtFile(szFilePT)
	    local szFileBK = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local ChiemBK = KFile.ReadTxtFile(szFileBK)
	    local szFileDC = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local ChiemDC = KFile.ReadTxtFile(szFileDC)
	    local szFileLA = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local ChiemLA = KFile.ReadTxtFile(szFileLA)
	    local szFileDL = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local ChiemDL = KFile.ReadTxtFile(szFileDL)
	    local szFileTuongDuong = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local ChiemTuongDuong = KFile.ReadTxtFile(szFileTuongDuong)
	    local szFileThanhDo = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local ChiemThanhDo = KFile.ReadTxtFile(szFileThanhDo)

local nMemberCountPT = CTC_7_Thanh:CountMembersInBang(ChiemPT)
local nMemberCountBK = CTC_7_Thanh:CountMembersInBang(ChiemBK)
local nMemberCountLA = CTC_7_Thanh:CountMembersInBang(ChiemLA)
local nMemberCountTDo = CTC_7_Thanh:CountMembersInBang(ChiemThanhDo)
local nMemberCountTD = CTC_7_Thanh:CountMembersInBang(ChiemTuongDuong)
local nMemberCountDL = CTC_7_Thanh:CountMembersInBang(ChiemDL)
local nMemberCountDC = CTC_7_Thanh:CountMembersInBang(ChiemDC)
if ChiemPT then
    if timeRemaining_PT > 0 then 
        szMsg_PT = "Phượng Tường: <color=yellow>" .. ChiemPT .. "<color><color=green> ("..nMemberCountPT..")<color> còn : " .. timeRemaining_PT .. " giây bất tử\n"
    else 
        szMsg_PT = "Phượng Tường: <color=yellow>" .. ChiemPT .. "<color><color=green> ("..nMemberCountPT..")<color>\n"
    end
else 
    szMsg_PT = "Phượng Tường: <color=yellow>Vô Hệ<color>\n"
end 

if ChiemBK then 
    if timeRemaining_BK > 0 then 
        szMsg_BK = "Biện Kinh: <color=yellow>" .. ChiemBK .. "<color><color=green> ("..nMemberCountBK..")<color> còn : " .. timeRemaining_BK .. " giây bất tử\n"
    else 
        szMsg_BK = "Biện Kinh: <color=yellow>" .. ChiemBK.. "<color><color=green> ("..nMemberCountBK..")<color>\n"
    end
else 
    szMsg_BK = "Biện Kinh: <color=yellow>Vô Hệ<color>\n"
end 

if ChiemLA then 
    if timeRemaining_LA > 0 then 
        szMsg_LA = "Lâm An: <color=yellow>" .. ChiemLA .. "<color><color=green> ("..nMemberCountLA..")<color> còn : " .. timeRemaining_LA .. " giây bất tử\n"
    else
        szMsg_LA = "Lâm An: <color=yellow>" .. ChiemLA .. "<color><color=green> ("..nMemberCountLA..")<color>\n"
    end
else 
    szMsg_LA = "Lâm An: <color=yellow>Vô Hệ<color>\n"
end 
if ChiemThanhDo then 
	if timeRemaining_ThanhDo > 0 then 
                szMsg_ThanhDo = "Thành Đô: <color=yellow>" .. ChiemThanhDo .. "<color><color=green> ("..nMemberCountTDo..")<color> còn : " .. timeRemaining_ThanhDo .. " giây bất tử\n"
	else 
                szMsg_ThanhDo = "Thành Đô: <color=yellow>" .. ChiemThanhDo .. "<color><color=green> ("..nMemberCountTDo..")<color>\n"
    end
else 
	szMsg_ThanhDo = "Thành Đô: <color=yellow>Vô Hệ<color>\n"
end 
if ChiemDC then 
	if timeRemaining_DC > 0 then 
                szMsg_DC = "Dương Châu: <color=yellow>" .. ChiemDC .. "<color><color=green> ("..nMemberCountDC..")<color> còn : " .. timeRemaining_DC .. " giây bất tử\n"
	else 
                szMsg_DC = "Dương Châu: <color=yellow>" .. ChiemDC .. "<color><color=green> ("..nMemberCountDC..")<color>\n"
	end
else 
	szMsg_DC = "Dương Châu: <color=yellow>Vô Hệ<color>\n"
end 
if ChiemTuongDuong then 
	if timeRemaining_TuongDuong > 0 then 
                szMsg_TuongDuong = "Tương Dương: <color=yellow>" .. ChiemTuongDuong .. "<color><color=green> ("..nMemberCountTD..")<color> còn : " .. timeRemaining_TuongDuong .. " giây bất tử\n<color=cyan>▶▶▶▶▶▶▶▶◀◀◀◀◀◀◀\n"
	else 
                szMsg_TuongDuong = "Tương Dương: <color=yellow>" .. ChiemTuongDuong .. "<color><color=green> ("..nMemberCountTD..")<color>\n<color=cyan>▶▶▶▶▶▶▶▶◀◀◀◀◀◀◀\n"
	end
else 
	szMsg_TuongDuong = "Tương Dương: <color=yellow>Vô Hệ<color>\n"
end 
if ChiemDL then 
	if timeRemaining_DaiLy > 0 then 
                szMsg_DaiLy = "Đại Lý: <color=yellow>" .. ChiemDL .. "<color><color=green> ("..nMemberCountDL..")<color> còn : " .. timeRemaining_DaiLy .. " giây bất tử\n"
	else 
                szMsg_DaiLy = "Đại Lý: <color=yellow>" .. ChiemDL .. "<color><color=green> ("..nMemberCountDL..")<color>\n"
	end
else 
	szMsg_DaiLy = "Đại Lý: <color=yellow>Vô Hệ<color>\n"
end 
            local nMapId = pPlayer.GetWorldPos()
            local szMsg = ""
            if nMapId == 2163 or nMapId == 2164 or nMapId == 2165 or nMapId == 2166 or nMapId == 2167 or nMapId == 2168 or nMapId == 2169 then
                szMsg = szMsg .. "<color=cyan>▶▶▶Chiến Báo Thất Thành◀◀◀<color>\n" ..
                    szMsg_PT ..
                    szMsg_BK ..
                    szMsg_LA ..
                    szMsg_ThanhDo ..
                    szMsg_DC ..
                    szMsg_DaiLy ..
                    szMsg_TuongDuong ..
                    ""
				szMsg = szMsg .. "<color=yellow>___Chú thích thông tin chiến báo__<color>\nThành-Bang Chiếm-Mem Tham Chiến<color>" 
                Dialog:SendBattleMsg(pPlayer, szMsg, 1)
                Dialog:ShowBattleMsg(pPlayer, 1, 0)
            end

            local nResTime = CTC_7_Thanh:GetRestTime()
            if nResTime > 0 then
                if pPlayer.nPkModel == Player.emKPK_STATE_PRACTISE then
                    pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER
                end
                -- Hiển thị thời gian còn lại thông qua hộp thoại
                Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian còn lại: <color=white>%s<color><color>\n", nResTime)
                Dialog:ShowBattleMsg(pPlayer, 1, 0)
            end
        end
    end
end
end 
function CTC_7_Thanh:CountMembersInBang(szBangName)
    local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
    local szMemberData = KFile.ReadTxtFile(szMemberFile)

    local nMemberCount = 0

    if szMemberData then
        for line in szMemberData:gmatch("[^\r\n]+") do
            local bangName, _ = line:match("^(%S+)%s+(%S+)$")

            if bangName == szBangName then
                nMemberCount = nMemberCount + 1
            end
        end
    end

    return nMemberCount
end


-- Sắp xếp bảng xếp hạng theo điểm
CTC_7_Thanh._SortDamage = function(tbDamage1, tbDamage2)
    return tbDamage1[2] > tbDamage2[2]
end

function CTC_7_Thanh:FindPlayer(pPlayer)
	if not pPlayer then
		return false;
	end
	for _,nPlayerId in pairs(CTC_7_Thanh.PlayerList) do
		if pPlayer.nId == nPlayerId then
			return true;
		end
	end
	return false;
end


function CTC_7_Thanh:FindPosTong(tbArr,nValue)
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


function CTC_7_Thanh:EndGame_GS()
    if not CTC_7_Thanh:CheckTime() then
        return
    end
if self.ReadyTimerId ~= 0 then
    Timer:Close(self.ReadyTimerId)
end 
	if self.nTimerId ~= 0 then
    Timer:Close(self.nTimerId)
	end 
    self.nTimerId = 0
    self.ReadyTimerId = 0
	CTC_7_Thanh:DelAllNPC()
    CTC_7_Thanh.nTimerId_BD = 0
    CTC_7_Thanh.nTimerId_BD_1 = 0
	CTC_7_Thanh.PlayerList = {};
    CTC_7_Thanh:VeThanhPT()
	CTC_7_Thanh:xoalognhanthuong()
	CTC_7_Thanh:xoabaodanhbang()
	CTC_7_Thanh:xoathanhvienthamgia()


    local szFilePT = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local ChiemPT = KFile.ReadTxtFile(szFilePT)
	    local szFileBK = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local ChiemBK = KFile.ReadTxtFile(szFileBK)
	    local szFileDC = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local ChiemDC = KFile.ReadTxtFile(szFileDC)
	    local szFileLA = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local ChiemLA = KFile.ReadTxtFile(szFileLA)
	    local szFileDL = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local ChiemDL = KFile.ReadTxtFile(szFileDL)
	    local szFileTuongDuong = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local ChiemTuongDuong = KFile.ReadTxtFile(szFileTuongDuong)
	    local szFileThanhDo = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local ChiemThanhDo = KFile.ReadTxtFile(szFileThanhDo)
	if not ChiemPT then 
	ChiemPT = "Vô Hệ"
	end 
		if not ChiemBK then 
	ChiemBK = "Vô Hệ"
	end 
		if not ChiemDC then 
	ChiemDC = "Vô Hệ"
	end 
		if not ChiemLA then 
	ChiemLA = "Vô Hệ"
	end 
		if not ChiemDL then 
	ChiemDL = "Vô Hệ"
	end 
		if not ChiemTuongDuong then 
	ChiemTuongDuong = "Vô Hệ"
	end 
			if not ChiemThanhDo then 
	ChiemThanhDo = "Vô Hệ"
	end 
	local szMsg = ""
    szMsg = szMsg .. "Bang <color=yellow>" .. ChiemPT .. "<color> đã chiếm thành công Phượng Tường\n" ..
                    "Bang <color=yellow>" .. ChiemBK .. "<color> đã chiếm thành công Biện Kinh\n\n" ..
                    "Bang <color=yellow>" .. ChiemDC .. "<color> đã chiếm thành công Dương Châu\n\n" ..
                    "Bang <color=yellow>" .. ChiemThanhDo .. "<color> đã chiếm thành công Thành Đô\n\n" ..
                    "Bang <color=yellow>" .. ChiemTuongDuong .. "<color> đã chiếm thành công Tương Dương\n\n" ..
                    "Bang <color=yellow>" .. ChiemDL .. "<color> đã chiếm thành công Đại Lý\n\n" ..
                    "Bang <color=yellow>" .. ChiemLA .. "<color> đã chiếm thành công Lâm An\n\n" ..
                    ""
					
					
        KDialog.MsgToGlobal(szMsg)
 end

function CTC_7_Thanh:xoabaodanhbang()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
	KFile.WriteFile(szFile, "");	
end

function CTC_7_Thanh:xoathanhvienthamgia()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
	KFile.WriteFile(szFile, "");	
end
function CTC_7_Thanh:xoalognhanthuong()
    local danhSachFile = {
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_pt.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_bk.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_tuongduong.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_laman.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_duongchau.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_daily.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_thanhdo.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanbienkinh.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanduongchau.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanlaman.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanthanhdo.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhantuongduong.txt",
        "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanphuongtuong.txt"
    }
    
    for _, szFile in ipairs(danhSachFile) do
        KFile.WriteFile(szFile, "")
    end
end



function CTC_7_Thanh:PKLoiDaiStart()
local tbLocalPlayer = KPlayer.GetAllPlayer();
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId = pPlayer.GetWorldPos();  
        if (nMapId == 2163) or (nMapId == 2164) or (nMapId == 2165) or (nMapId == 2166) or (nMapId == 2167)  or (nMapId == 2168)  or (nMapId == 2169) then
			pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			pPlayer.nPkModel = Player.emKPK_STATE_TONG; --- chuyen pk bang
			pPlayer.SetFightState(1);
			Dialog:SendBlackBoardMsg(pPlayer, "Trạng Thái Chiến Đấu Bang Hội Đã Sẵn Sàng, Người Chơi Có Thể PK!!!");
        end
end
end

function CTC_7_Thanh:VeThanhPT()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
	local nRandomToaDo = MathRandom(1,7)
        if (nMapId == 2163) or (nMapId == 2164) or (nMapId == 2165) or (nMapId == 2166) or (nMapId == 2167)  or (nMapId == 2168)  or (nMapId == 2169) then
		if nRandomToaDo == 1 then 
		pPlayer.NewWorld(24, 1749,3496);
		elseif nRandomToaDo == 2 then 
		pPlayer.NewWorld(26,1630,3135);
		elseif nRandomToaDo == 3 then 
		pPlayer.NewWorld(29,1606,3947);
			elseif nRandomToaDo == 4 then 
		pPlayer.NewWorld(25,1612,3149);
			elseif nRandomToaDo == 5 then 
		pPlayer.NewWorld(23,1491,3184);
			elseif nRandomToaDo == 6 then 
		pPlayer.NewWorld(27,1665,3255);
			elseif nRandomToaDo == 7 then 
		pPlayer.NewWorld(28,1501,3272);
		end 
			Dialog:SendBattleMsg(pPlayer,"", 1);
			Dialog:ShowBattleMsg(pPlayer, 0, 0); 
	end
end
KDialog.MsgToGlobal("Hoạt động <color=pink>Thất Thành Đại Chiến <color>Đã Kết Thúc <color=yellow> Chúc mừng các bang hội");
end


function CTC_7_Thanh:DelAllNPC()
	ClearMapNpc(2163);
	ClearMapNpc(2164);
	ClearMapNpc(2165);
	ClearMapNpc(2166);
	ClearMapNpc(2167);
	ClearMapNpc(2168);
	ClearMapNpc(2169);
end
function CTC_7_Thanh:MuaMauNhanh()
    local MAX_BLOOD = 100
    local tbBloodItems = {
        [9] = { -- Faction 9
            {17, 3, 1, 3}, -- 50-69
            {17, 3, 1, 4}, -- 70-89
            {17, 3, 1, 5}, -- 90-99
            {17, 3, 1, 6}, -- >=100
        },
        ["default"] = {
            {17, 1, 1, 3}, -- 50-69
            {17, 1, 1, 4}, -- 70-89
            {17, 1, 1, 5}, -- 90-99
            {17, 1, 1, 6}, -- >=100
        }
    }

    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end
    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
    if me.GetCamp() == 0 then
        Dialog:Say("Ngươi chưa vào phái.")
        return 0
    end

    local nMapId = me.nMapId
    for _, nPlayerId in ipairs(tbMember) do
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
        if not pPlayer or pPlayer.nMapId ~= nMapId then
            Dialog:Say("Có thành viên không cùng bản đồ, không thể mở máu.")
            return 0
        end
        if pPlayer.GetCamp() == 0 then
            Dialog:Say(pPlayer.szName .. " chưa vào phái.")
            return 0
        end
    end

    for _, nPlayerId in ipairs(tbMember) do
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
        if pPlayer then
            local list = tbBloodItems[pPlayer.nFaction] or tbBloodItems["default"]
            local genre, detail, particular, level
            if pPlayer.nLevel >= 50 and pPlayer.nLevel < 70 then
                genre, detail, particular, level = unpack(list[1])
            elseif pPlayer.nLevel >= 70 and pPlayer.nLevel < 90 then
                genre, detail, particular, level = unpack(list[2])
            elseif pPlayer.nLevel >= 90 and pPlayer.nLevel < 100 then
                genre, detail, particular, level = unpack(list[3])
            else
                genre, detail, particular, level = unpack(list[4])
            end

            local nCurrent = pPlayer.GetItemCountInBags(genre, detail, particular, level)
            if nCurrent > MAX_BLOOD then
                -- Xóa số dư
                local nRemove = nCurrent - MAX_BLOOD
                local tbItemId = {genre, detail, particular, level, 0, 0}
                Task:DelItem(pPlayer, tbItemId, nRemove)
            elseif nCurrent < MAX_BLOOD then
                local nNeed = MAX_BLOOD - nCurrent
                pPlayer.AddStackItem(genre, detail, particular, level, {bForceBind = 1}, nNeed)
                local szMsg = string.format("Đã cấp %d bình máu cho <color=yellow>%s<color> (hiện đủ %d/100)", nNeed, pPlayer.szName, MAX_BLOOD)
                KTeam.Msg2Team(pPlayer.nTeamId, szMsg)
            else
                local szMsg = string.format("<color=yellow>%s<color> đã đủ %d bình máu", pPlayer.szName, MAX_BLOOD)
                KTeam.Msg2Team(pPlayer.nTeamId, szMsg)
            end
        end
    end
    return 1
end
