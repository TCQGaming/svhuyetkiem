-----Dev TCQGaming
-----date : 28/09/2023
local tbLoiDaiBang = Npc:GetClass("loidaibanghoi");
tbLoiDaiBang.ISOPEN = 1;
tbLoiDaiBang.HONOR_CLASS_MONEY		= 8;	
tbLoiDaiBang.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbLoiDaiBang.HONOR_CLASS_MONEY,
	},
};
function tbLoiDaiBang:OnDialog()
-- DoScript("\\script\\ChucNang\\loidaibanghoi\\bdvlmc.lua");
	local nMoHoatDong = ConfigAll.HoatDongLoiDai16
	if nMoHoatDong == 0 then 
	Dialog:Say("Tính năng chưa mở");
	return 0;
	end 
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

	local nDateTuan = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(9174,5) < nDateTuan then
		me.SetTask(9174,5, nDateTuan);
		me.SetTask(9174,1, 0);------Lưu điểm 
		me.SetTask(9174,2, 0);------Ký Hiệu Chiến Thắng Lôi Đài Thưởng Cho thành viên tham gia
		me.SetTask(9174,3, 0);------Thưởng Lôi Đài
		-- me.SetTask(9174,4, 0);
		
	end 
	local szMsg =  [[
	<color=green>Lôi Đài Bang Hội<color>
		]]
    local tbOpt =     {}
	
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	table.insert(tbOpt, {"Báo danh Lôi Đài Bang Hội 16 Vs 16",self.MenuDiChuyen,self});
	table.insert(tbOpt, {"Ta muốn vào giai đoạn 1<color=red>\nLôi Đài Bang Hội 16 Vs 16",self.thamgialoidai,self});
	table.insert(tbOpt, {"Ta muốn vào giai đoạn 2 chiến đấu<color=red>\nHỏa Kỳ Lân",self.thamgiagiaidoan2,self});
    table.insert(tbOpt, {"Nhận Thưởng",self.chiathuong,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end

function tbLoiDaiBang:chiathuong()
	local thanhvienthamchien = me.GetTask(9174,2)
	local szMsg =  [[
	<color=green>Phần thưởng Dành cho Bang Hội Chiến Thắng Toàn Bang Như Nhau<color>
		]]

    local tbOpt =     {}
    table.insert(tbOpt, {"<color=cyan>Bang Thắng<color>",self.nhanthuongthuong,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end 

function tbLoiDaiBang:thamgiagiaidoan2()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
    if nCurTimer < 2030 or nCurTimer > 2300 then
        Dialog:Say("Thời gian tham gia từ 20h30 đến 23h00")
        return
    end
	local thu = LOIDAI16.WEEKDAY
    if nWeekDay ~= thu then
        Dialog:Say("Người chơi có thể tham gia hoạt động vào thứ "..thu.." hàng tuần")
        return 0
    end
    local pPlayer = me
    local szTongName = pPlayer.dwTongId and KTong.GetTong(pPlayer.dwTongId).GetName() or ""
    local szWinFileName = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquawin.txt"
    local szWinContent = KFile.ReadTxtFile(szWinFileName)

    if szWinContent and string.find(szWinContent, szTongName) then
        pPlayer.NewWorld(2029, 1859, 3476)
        me.Msg("Bạn đã bước vào giai đoạn 2 chiến đấu Hỏa Kỳ Lân")
    else
        me.Msg("Bang hội của bạn không được phép tham chiến ở giai đoạn 2.")
    end
end
function tbLoiDaiBang:thamgialoidai()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end

    local nCurTimer = tonumber(GetLocalDate("%H%M"))

    if nCurTimer < 1950 or nCurTimer > 2000 then
        Dialog:Say("Thời gian tham gia từ 19h50 đến 20h00")
        return
    end
	local thu = LOIDAI16.WEEKDAY
    if nWeekDay ~= thu then
        Dialog:Say("Người chơi có thể tham gia hoạt động lúc 19h50 thứ "..thu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= LOIDAI16.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..LOIDAI16.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
            self:ghilogthanhvienthamgia(szTongName, me.szName)
            local pPlayer = me
            pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
            pPlayer.NewWorld(2028, 1656, 3269)
            Dialog:Say("Chào mừng bạn tham gia Lôi Đài!")
        else
            local pPlayer = me
            pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
            pPlayer.NewWorld(2028, 1656, 3269)
            Dialog:Say("Chào mừng bạn tham gia Lôi Đài!")
        end
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Lôi Đài tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, LOIDAI16.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh hoặc không đủ điều kiện tham gia Lôi Đài.")
    end
		table.insert(LOIDAI16.PlayerList,me.nId);
end


function tbLoiDaiBang:ghilogthanhvienthamgia(szTongName, szPlayerName)
    local szMemberFile = "\\script\\ChucNang\\loidaibanghoi\\thanhvienthamgia.txt"
    local logMessage = ""..szTongName.."\t"..szPlayerName.."\r\n"
    KFile.AppendFile(szMemberFile, logMessage)
end

function tbLoiDaiBang:MenuDiChuyen()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
    if nCurTimer < 1950 or nCurTimer > 2000 then
        Dialog:Say("Thời gian báo danh tham gia từ 19h50 đến 20h00")
        return
    end
	local thu = LOIDAI16.WEEKDAY
    if nWeekDay ~= thu then
        Dialog:Say("Người chơi có thể tham gia hoạt động lúc 19h50 thứ "..thu.." hàng tuần")
        return 0
    end
    local nTongId = me.dwTongId;
    local checkResult = self:CheckDeclareWarRight(nTongId);

    if checkResult == 0 then
        return 0; -- Người chơi không có quyền tuyên chiến, dừng menu
    end

	local szMsg = "Giai đoạn ghi danh bang chủ mới có thể tiến hành";
	local tbOpt = 
	{
		{"Ta muốn báo danh", self.baodanhloidai, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbLoiDaiBang:CheckDeclareWarRight(nTongId)
    local nSelfKinId, nSelfMemberId = me.GetKinMember();
    local nMasterCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_MASTER);
    local nGeneralCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_WAR);

    if nGeneralCheck ~= 1 then
        Dialog:Say("<color=yellow>Ngươi không có quyền báo danh lôi đài 16 vs 16\nChỉ bang chủ mới được báo danh.");
        return 0;
    end
    return 1; -- Người chơi có quyền tuyên chiến
end


function tbLoiDaiBang:baodanhbanghoi(pPlayer)
    if not pPlayer then 
        return;
    end
    
    local pTong = KTong.GetTong(pPlayer.dwTongId);
    local szTongName = pTong.GetName();
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\baodanh.txt";
    
    local logMessage = ""..szTongName.."\r\n";
    KFile.AppendFile(szFile, logMessage);
end

function tbLoiDaiBang:baodanhloidai()
    DoScript("\\script\\ChucNang\\loidaibanghoi\\bdvlmc.lua")
    
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)  
    local tbRegisteredBangHois = {}
    if szData then
        for line in szData:gmatch("[^\r\n]+") do
            table.insert(tbRegisteredBangHois, line)
        end
        if #tbRegisteredBangHois < LOIDAI16.SoLuongBangBaoDanh then
            local bTongExistsInLog = false
            for _, registeredTongName in ipairs(tbRegisteredBangHois) do
                if registeredTongName == szTongName then
                    bTongExistsInLog = true
                    break
                end
            end

            if not bTongExistsInLog then
                table.insert(tbRegisteredBangHois, szTongName)
                local updatedLogContent = table.concat(tbRegisteredBangHois, "\n")
                KFile.WriteFile(szFile, updatedLogContent, false)
				KDialog.MsgToGlobal("Bang Hội <color=yellow>"..szTongName.." <color>Báo danh Lôi Đài Bang Hội 16 Vs 16 thành công")
            else
                Dialog:Say("Bang hội đã báo danh trước đó rồi.")
            end
        else
            Dialog:Say("Đã đạt đến số lượng tối đa (10) bang hội đã báo danh bạn đến đây quá trễ.")
        end
    else
        local logMessage = ""..szTongName.."\n"
        KFile.WriteFile(szFile, logMessage)
		KDialog.MsgToGlobal("Bang Hội <color=yellow>"..szTongName.." <color>Báo danh Lôi Đài Bang Hội 16 Vs 16 thành công")
    end
end




function tbLoiDaiBang:nhanthuongthuong()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
local nTime = GetTime()
local nWeekDay = tonumber(os.date("%w", nTime))
local nCurTime = tonumber(os.date("%H%M", nTime))
	local thu = LOIDAI16.WEEKDAY
    if nWeekDay ~= thu then
        Dialog:Say("Người chơi có thể tham gia nhận thưởng vào thứ "..thu.." hàng tuần")
        return 0
    end
if (nWeekDay == thu and nCurTime >= 2030) or (nWeekDay == thu and nCurTime <= 2300) then

	local thamgia = me.GetTask(9174,3);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng bang hội Chiến Thắng Lôi Đài rồi mà ?");
		return 0;
	end
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquawin.txt"

    -- Kiểm tra xem tên của bang hội có trong log đã báo danh hay chưa
    local szData = KFile.ReadTxtFile(szFile)
    if szData and string.find(szData, szTongName) then
	ConfigAll.LoiDai16Thuong()
		local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_loidaibanghoi	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(9174,3,1);
        local szMessage = string.format("<color=cyan>Chúc mừng bạn đã nhận phần quà Lôi Đài Bang Hội chiến thắng thành công.")
        me.Msg(szMessage)
    else
        Dialog:Say("<color=yellow> Hầy , xem ra nhà ngươi chưa cập nhật tin tức , bang của nhà ngươi đã thua cuộc hoặc chưa từng tham chiến Lôi Đài 16 Vs 16 Tuần này")
        return 0
    end
else 
        Dialog:Say("<color=yellow>Hãy nhận thưởng sau 20h30 và thời hạn cuối cùng lãnh thưởng hết 23h00 cùng ngày")
end
end 

function tbLoiDaiBang:nhanthuongthanhvienthamchienwin()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
local nTime = GetTime()
local nWeekDay = tonumber(os.date("%w", nTime))
local nCurTime = tonumber(os.date("%H%M", nTime))

if (nWeekDay == 4 and nCurTime >= 2030) or (nWeekDay == 4 and nCurTime <= 2300) then

	local nguoitructiep = me.GetTask(9174,2);
	if nguoitructiep < 2 then
	Dialog:Say("Ngươi đâu có tham chiến ?");
		return 0;
	end

	local thamgia = me.GetTask(9174,3);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng bang hội Chiến Thắng Lôi Đài rồi mà ?");
		return 0;
	end
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\loidaibanghoi\\KetQua\\ketquawin.txt"

    -- Kiểm tra xem tên của bang hội có trong log đã báo danh hay chưa
    local szData = KFile.ReadTxtFile(szFile)
    if szData and string.find(szData, szTongName) then
        me.AddStackItem(18, 1, 114, 8, nil, 2) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 200); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
		me.SetTask(9174,3,1);
        local szMessage = string.format("<color=cyan>Chúc mừng bạn đã nhận phần quà Lôi Đài Bang Hội chiến thắng thành công.")
        me.Msg(szMessage)
    else
        Dialog:Say("<color=yellow> Hầy , xem ra nhà ngươi chưa cập nhật tin tức , bang của nhà ngươi đã thua cuộc hoặc chưa từng tham chiến Lôi Đài 16 Vs 16 Tuần này")
        return 0
    end
else 
        Dialog:Say("<color=yellow>Hãy nhận thưởng sau 20h30 và thời hạn cuối cùng lãnh thưởng hết 23h00 cùng ngày")
end
end 
