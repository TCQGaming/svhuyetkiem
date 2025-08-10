-----Dev TCQGaming
-----date : 15/09/2023
local tbVlmc = Npc:GetClass("bdvlmc");
tbVlmc.ISOPEN = 1;
tbVlmc.HONOR_CLASS_MONEY		= 8;	
tbVlmc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbVlmc.HONOR_CLASS_MONEY,
	},
};
function tbVlmc:OnDialog()
-- DoScript("\\script\\ChucNang\\taotuviet\\bdvlmc.lua");
	local nMoHoatDong = ConfigAll.HoatDongNguHanh
	if nMoHoatDong == 0 then 
	Dialog:Say("Tính năng chưa mở");
	return 0;
	end 
	
	--------Giới hạn hệ nhân vật / PC--------
local nHardWareId = me.dwHardWareId;

local tbHwidPaths = {
    ["TLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt",
    ["TLB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt",
    ["TVT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt",
    ["TVC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt",
    ["DMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt",
    ["DMT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt",
    ["NDD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt",
    ["NDC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt",
    ["NMC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt",
    ["NMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt",
    ["TYC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt",
    ["TYK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt",
    ["CBB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt",
    ["CBR"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt",
    ["TNK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt",
    ["TND"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt",
    ["VDK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt",
    ["VDQ"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDQ.txt",
    ["CLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt",
    ["CLK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt",
    ["MGC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt",
    ["MGK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt",
    ["DTC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt",
    ["DTK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt"
}

local tbFactionLimits = {
    {nMonPhai = 1,  nHeMonPhai = 1,  key = "TLD", name = "Thiếu Lâm Đao"},
    {nMonPhai = 2,  nHeMonPhai = 1,  key = "TLB", name = "Thiếu Lâm Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 2,  key = "TVT", name = "Thiên Vương Thương"},
    {nMonPhai = 2,  nHeMonPhai = 2,  key = "TVC", name = "Thiên Vương Chùy"},
    {nMonPhai = 1,  nHeMonPhai = 3,  key = "DMB", name = "Đường Môn Bẫy"},
    {nMonPhai = 2,  nHeMonPhai = 3,  key = "DMT", name = "Đường Môn Tiễn"},
    {nMonPhai = 1,  nHeMonPhai = 4,  key = "NDD", name = "Ngũ Độc Đao"},
    {nMonPhai = 2,  nHeMonPhai = 4,  key = "NDC", name = "Ngũ Độc Chưởng"},
    {nMonPhai = 1,  nHeMonPhai = 5,  key = "NMC", name = "Nga My Chưởng"},
    {nMonPhai = 2,  nHeMonPhai = 5,  key = "NMB", name = "Nga My Buff"},
    {nMonPhai = 1,  nHeMonPhai = 6,  key = "TYK", name = "Thúy Yên Kiếm"},
    {nMonPhai = 2,  nHeMonPhai = 6,  key = "TYC", name = "Thúy Yên Đao"},
    {nMonPhai = 1,  nHeMonPhai = 7,  key = "CBR", name = "Cái Bang Rồng"},
    {nMonPhai = 2,  nHeMonPhai = 7,  key = "CBB", name = "Cái Bang Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 8,  key = "TNK", name = "Thiên Nhẫn Kích"},
    {nMonPhai = 2,  nHeMonPhai = 8,  key = "TND", name = "Thiên Nhẫn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 9,  key = "VDK", name = "Võ Đang Khí"},
    {nMonPhai = 1,  nHeMonPhai = 9,  key = "VDQ", name = "Võ Đang Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 10, key = "CLD", name = "Côn Lôn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 10, key = "CLK", name = "Côn Lôn Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 11, key = "MGC", name = "Minh Giáo Chùy"},
    {nMonPhai = 2,  nHeMonPhai = 11, key = "MGK", name = "Minh Giáo Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 12, key = "DTC", name = "Đoàn Thị Chỉ"},
    {nMonPhai = 2,  nHeMonPhai = 12, key = "DTK", name = "Đoàn Thị Kiếm"}
}

local nSoAccLimit = ConfigAll.GioiHanMonPhai -- Giới hạn số lượng acc/phái

local function CheckFactionLimit(faction)
    local tbHwidOld = Lib:LoadTabFile(tbHwidPaths[faction.key])
    local nNum = 0

    for _, tbRowData in ipairs(tbHwidOld) do
        if tonumber(tbRowData.MaMay) == nHardWareId then
            nNum = nNum + 1
        end
    end

    if nNum >= nSoAccLimit then
        local bFound = false
        for _, tbRowData in ipairs(tbHwidOld) do
            if tbRowData.PlayerName == me.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                bFound = true
                break
            end
        end

        if not bFound then
            Dialog:Say(string.format("<color=cyan>Mỗi Máy tính chỉ được vào %d Nhân vật phái %s\nMáy tính của bạn đã gia nhập %d nhân vật <color=green>%s<color><color>",
                nSoAccLimit, faction.name, nNum, faction.name))
            return true
        end
    end
    return false
end

for _, faction in ipairs(tbFactionLimits) do
    if me.nRouteId == faction.nMonPhai and me.nFaction == faction.nHeMonPhai then
        if CheckFactionLimit(faction) then
            return
        end
    end
end
--------End giới hạn--------

----------Gioi Han Tai Phu-------------
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu then
	Dialog:Say(ConfigAll.ThongBaoGioiHan)
	return 0;
	end
	end
----------------------------------------------
	local nFaction = me.nFaction;
	if nFaction <= 0 then
		Dialog:Say("Bạn chưa gia nhập phái");
		return 0;
	end

	if(me.nTeamId > 0)then
		Dialog:Say("Hoạt động này không cho phép tổ đội<enter><enter><color=yellow>Hãy rời tổ đội!<color>");
		return 0;
	end

	local nDateTuan = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(3140,25) ~= nDateTuan then
		me.SetTask(3140,25, nDateTuan);
		me.SetTask(3140,26, 0);
		me.SetTask(3141,1, 0);
		
	end 

	if me.GetTask(3140,27) ~= nDateTuan then
		me.SetTask(3140,27, nDateTuan);
		me.SetTask(3140,28, 0);
	end 

	if me.GetTask(3140,29) ~= nDateTuan then
		me.SetTask(3140,29, nDateTuan);
		me.SetTask(3140,30, 0);
	end 

	if me.GetTask(3140,31) ~= nDateTuan then
		me.SetTask(3140,31, nDateTuan);
		me.SetTask(3140,32, 0);
	end 

	if me.GetTask(3140,33) ~= nDateTuan then
		me.SetTask(3140,33, nDateTuan);
		me.SetTask(3140,34, 0);
	end 

	local szMsg =  [[
	<color=green>Hoa Sơn Luận Kiếm -- Truy Tìm Minh Chủ<color>
	<color=red>LƯU Ý: MỘT PC CHỈ VÀO ĐƯỢC MỘT HỆ PHÁI<color>
	<color=yellow>Thời Gian Báo Danh:<color> 20h00 - 20h15
	<color=yellow>Bắt Đầu PK Ngũ Hành:<color> 20h15
	<color=yellow>Rút Đại Hoàng Kỳ Đệ Nhất Hệ Phái:<color> 20h15
	<color=yellow>Bắt Đầu PK Minh Chủ:<color> 20h30
	<color=yellow>Rút Đại Hoàng Kỳ Minh Chủ:<color> 20h30
	<color=yellow>Thời Gian Kết Thúc:<color> 20h50					  
	<color=yellow>THƯỞNG<color>
	<color=pink>Thắng Thua Đều Có Thưởng<color>
		]]

    local tbOpt =     {}
	
	local nCurTime = tonumber(GetLocalDate("%H%M"));
    table.insert(tbOpt, {"Báo danh vòng ngũ hành",self.MenuDiChuyen,self});
    table.insert(tbOpt, {"Nhận Thưởng Tham Gia",self.nhanthuongthuong,self});
	table.insert(tbOpt, {"Nhận Thưởng Đệ Nhất Ngũ Hành",self.nhanthuongdenhatnguhanh,self});
	table.insert(tbOpt, {"Nhận Thưởng Võ Lâm Minh Chủ",self.NhanThuongminhchu,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end

function tbVlmc:MenuDiChuyen()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));

	if nWeekDay ~= 3 then 
	Dialog:Say("Người chơi có thể tham gia hoạt động lúc 20h thứ 4 hàng tuần");
		return 0;
	end

	local szMsg = "Sau khi vào báo danh hoạt động bạn sẽ được di chuyển vào bản đồ thi đấu, trong bản đồ thi đấu nếu bạn thoát game hoặc di chuyển ra ngoài sẽ không thể di chuyển vào bản đồ được nữa";
	local tbOpt = 
	{
		{"Ta muốn báo danh", self.baodanh, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbVlmc:resetBaoDanh()
    local szFile = "\\script\\ChucNang\\taotuviet\\baodanh.txt"
	KFile.WriteFile(szFile, "");	
end

function tbVlmc:baodanh()
	local nCurTimer = tonumber(GetLocalDate("%H%M"));
	if (nCurTimer < 2000) or (nCurTimer > 2015) then
		Dialog:Say("Thời gian báo danh từ 20h00 đến 20h15");
		return 0;
	end
	local nBaoDanh = me.GetTask(3140,26)
	if nBaoDanh > 0 then
		Dialog:Say("Nhân vật này đã báo danh tham gia, không được phép tham gia nữa");
		return 0;
	end

	if me.CountFreeBagCell() < 5 then
		Dialog:Say("Cần 5 ô trống hành trang!");
		return 0;
	end    

	local sIdMap = 0;
if me.nSeries == 1 then
	sIdMap = 2016;
elseif me.nSeries == 2 then
	sIdMap = 2017;
elseif me.nSeries == 3 then
	sIdMap = 2018;
elseif me.nSeries == 4 then
	sIdMap = 2019;
elseif me.nSeries == 5 then
	sIdMap = 2020;
end 

	local pPlayer = me;
    pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
    pPlayer.NewWorld(sIdMap,1618,3175);
	pPlayer.SetTask(3140,26,1);
	if ConfigAll.GioiHanKhongTrungPhai_HoaSon  == 1 then 
	CampBattle:GioiHanMonPhai(pPlayer)
	end 
	local logMessage = string.format("%s", pPlayer.szName)
    local logFilePath = "\\script\\ChucNang\\taotuviet\\baodanh.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function tbVlmc:nhanthuongthuong()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
local nTime = GetTime()
local nWeekDay = tonumber(os.date("%w", nTime))
local nCurTime = tonumber(os.date("%H%M", nTime))

if (nWeekDay == 3 and nCurTime >= 2050) or (nWeekDay == 4 and nCurTime <= 1000) then
    local nVoLam = me.GetTask(3140, 28)
    if nVoLam >= 1 then
        Dialog:Say("Bạn Là Đệ Nhất Ngũ Hành Nơi Đây Không Có Thưởng Cho Bạn")
        return 0
    end

    local nMinhChu = me.GetTask(3140, 32)
    if nMinhChu >= 1 then
        Dialog:Say("Bạn Là Võ Lâm Minh Chủ Nơi Đây Không Có Thưởng Cho Bạn")
        return 0
    end

	local thamgia = me.GetTask(3141,1);
	if thamgia >= 2 then
	Dialog:Say("Bạn đã nhận thưởng tham gia rồi");
		return 0;
	end
    local logFilePath = "\\script\\ChucNang\\taotuviet\\baodanh.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    local playerList = {}
    if szData then
        for playerName in szData:gmatch("([^\r\n]+)") do
            table.insert(playerList, playerName)
        end
    end
    local isPlayerInList = false
    for _, playerName in pairs(playerList) do
        if playerName == me.szName then
            isPlayerInList = true
            break
        end
    end
    if isPlayerInList then
ConfigAll.ThuongThamGia_NguHanh()
CampBattle:RemovePlayerGioiHan_MonPhai(me);
	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThamGia_HoaSon	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(3141,1,2);
        local szMessage = string.format("<color=cyan>Bạn đã nhận được thưởng vì tham gia trận đấu.")
        me.Msg(szMessage)
    else
        Dialog:Say("Ta nhớ ngươi chưa từng đến đây báo danh")
        return 0
    end
else 
        Dialog:Say("<color=yellow>Hãy nhận thưởng sau 20h50 và thời hạn cuối cùng lãnh thưởng hết 10h00 sáng thứ 7")
end
end 

function tbVlmc:nhanthuongdenhatnguhanh()
	if me.CountFreeBagCell() < 5 then
		Dialog:Say("Cần 5 ô trống hành trang!");
		return 0;
	end
	local check = me.GetTask(3140,28)
	if check < 1 then
	Dialog:Say("Bạn Không Phải Đệ Nhất Ngũ Hành");
		return 0;
	end
	local nCountt = me.GetTask(3140,30)
	if nCountt > 0 then
		Dialog:Say(string.format("Bạn đã nhận thưởng rồi"));
		return 0;
	end
CampBattle:RemovePlayerGioiHan_MonPhai(me);
		ConfigAll.DeNhat_NguHanh()
			local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_VoDichNguHanh_HoaSon	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(3140,30, 1);

end

function tbVlmc:NhanThuongminhchu()
	if me.CountFreeBagCell() < 5 then
		Dialog:Say("Cần 5 ô trống hành trang!");
		return 0;
	end
	local check = me.GetTask(3140,32)
	if check < 1 then
	Dialog:Say("Bạn Không Phải Là Võ Lâm Minh Chủ");
	return 0;
	end	
	local nCountt = me.GetTask(3140,34)
	if nCountt >= 1 then
		Dialog:Say(string.format("Bạn đã nhận thưởng rồi"));
		return 0;
	end
CampBattle:RemovePlayerGioiHan_MonPhai(me);
		ConfigAll.Thuong_VoLam_MinhChu()
					local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_VoDichVLMC_HoaSon	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(3140,34, nCountt + 1);
end