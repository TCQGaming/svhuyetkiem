-------------------------------------------------------------------
--File: tuiguangyuan.lua
--Author: TCQGaming
-------------------------------------------------------------------

local tbTuiGuangYuan = Npc:GetClass("tuiguangyuan");
tbTuiGuangYuan.TaskGourp = 3026;
tbTuiGuangYuan.TaskGourp1 = 3028;
tbTuiGuangYuan.TaskId_TanThu = 1;
tbTuiGuangYuan.VNDtoJB = 1;--10000VND = 200000 Đồng
tbTuiGuangYuan.tbItemInfo = {bForceBind=1,};
function tbTuiGuangYuan:OnDialog()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))
	-----------------------------------------------RS-----------Nhiệm vụ ngày hoàng kim TCQGaming------------------------------------------------------------------------------------	
	local nDateNVngay = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(9055,1) < nDateNVngay then
		me.SetTask(9055,1, nDateNVngay);
		me.SetTask(9055,2, 0);
		me.SetTask(9055,3, 0);
		me.SetTask(9055,4, 0);
		me.SetTask(9055,5, 0);
		me.SetTask(9055,6, 0);
		me.SetTask(9055,7, 0);
	end 
	 local nNgay_LuanVoDai    = tonumber(GetLocalDate("%d%m%y"));
	if me.GetTask(9190, 5) ~= nNgay_LuanVoDai then
		me.SetTask(9190,5, nNgay_LuanVoDai);
		me.SetTask(9190,1, 0);------Task Map luận võ đài 
		me.SetTask(9190,2, 0);------Task lượt đi 
		me.SetTask(9190,3, 0);------Task thưởng tham gia
		me.SetTask(9190,4, 0);------Task nhận thưởng top
	end 
	local nMapId, nPosX, nPosY = me.GetWorldPos();
	local tbOpt = {}
	-- table.insert(tbOpt, {"<pic=135><color=yellow>Phó Bản Thiên Tầng Tháp", self.ThienTangThap, self});
	-- table.insert(tbOpt, {"Thần Trùng Trấn", self.TTTran, self});	
	-- table.insert(tbOpt, {"Thời Quang Điện", self.ThoiQuangD, self});--,	
	table.insert(tbOpt, {"<pic=135>Đổi <color=yellow>Kim Nguyên Bảo", self.muadaiknb, self});
-- if (me.szAccount == "xboyhd") then
	-- if nMapId == 8 then 
		-- table.insert(tbOpt, {"Ta muốn tham gia<color=gold> Luận Võ Đài",self.LuanVoDai,self});
	-- end 
-- end 
	-- table.insert(tbOpt, {"<color=yellow>Nhiệm Vụ Ngày", NVngayUI.NhanNVNgay_ondialog, NVngayUI});
	table.insert(tbOpt, {"<pic=135>Mua <color=yellow>Bổ Tu Lệnh", self.shop_botu_chuyencuong, self});
		-- table.insert(tbOpt, {"<pic=135>Đăng Ký <color=yellow>Nhân Vật Săn Boss VLCT", self.dangkybossvlct, self});

	-- table.insert(tbOpt, {"<pic=135>Mua <color=yellow>Cuốn Trục Dịch Chuyển<color>\n<color=green>(HSD 7 ngày)", self.shop_cuon_truc_tele, self});
	-- table.insert(tbOpt, {"<pic=135>Đổi <color=yellow>Môn Phái Chính<color>\n<color=green>(700v đồng)", self.DoiPhaiMain, self});
	-- table.insert(tbOpt, {"<pic=135>Kiểm tra <color=yellow> Nhận Thưởng<color>\n<color=gold>(Tích Lũy Vỏ Sò Vàng)", self.kiemtraVSV, self});
	-- table.insert(tbOpt, {"<pic=135>Ta muốn <color=yellow>thoát Account ra khỏi game<color>", self.KickOutPlayer_On, self});
	table.insert(tbOpt, {"Kết Thúc Đối Thoại"});
	Dialog:Say("Nhân Chi Sơ, Tính Bổn Thiện. Chúc bạn một ngày tốt lành",tbOpt);
end

function tbTuiGuangYuan:LuanVoDai()
	if(me.nTeamId > 0)then
		Dialog:Say("Hoạt động này không cho phép tổ đội<enter><enter><color=yellow>Hãy rời tổ đội!<color>");
		return 0;
	end
 local nNgay_LuanVoDai    = tonumber(GetLocalDate("%d%m%y"));
	if me.GetTask(9190, 5) ~= nNgay_LuanVoDai then
		me.SetTask(9190,5, nNgay_LuanVoDai);
		me.SetTask(9190,1, 0);------Task Map luận võ đài 
		me.SetTask(9190,2, 0);------Task lượt đi 
		me.SetTask(9190,3, 0);------Task thưởng tham gia
		me.SetTask(9190,4, 0);------Task nhận thưởng top
	end 
local nMap = 	me.GetTask(9190,1)----Task bản đồ
local soluotdi = 	me.GetTask(9190,2)----Task số lượt tham gia
local thuongthamgia = 	me.GetTask(9190,3)----Task số lượt tham gia
		local nGioiHanSoNguoiThamGia = KGblTask.SCGetDbTaskInt(DBTASD_GIOIHANLUANVODAI)
local szMsg = "CHÚ Ý : <color=red>HÃY LƯU RƯƠNG TẠI BA LĂNG HUYỆN TRƯỚC KHI LUẬN VÕ  ĐỂ PHÒNG NẾU BẠN BỊ CRASH GAME - THÌ SẼ TRỞ LẠI ĐƯỢC VÀO MAP BẰNG KHÔNG HÔM SAU BẠN MỚI CÓ THỂ ĐI TIẾP<color>\n<color=red>Nếu trong quá trình luận võ mà bạn rớt mạng , mất điện thì ngày hôm sau mới có thể tham gia lại<color>\n<color=yellow>Tóm lại khi chiến đấu phải buộc phải chiến đấu tới khi hệ thống ghi nhận kết quả, nếu thoát ra thì ngày hôm sau mới có thể tham gia tiếp<color>\nHôm nay bạn đã tham gia <color=yellow>"..soluotdi.." lần Luận Võ Đài\nMỗi ngày sẽ tham gia từ 00h00 đến 21h00\n22h00 - 23h59 trả thưởng\n<color=gold>Số người đang Luận Võ Hiện nay "..nGioiHanSoNguoiThamGia.."/18"

    local tbOpt =     {} 
	if soluotdi < 3 then 
	if nMap == 0 then 
			table.insert(tbOpt, {"Tiến vào <color=gold>Luận Võ Đài", LuanVoDai.StartLuanVoDaiEvent, LuanVoDai, me});
	else 
			table.insert(tbOpt, {"Tiến vào trận đấu trước", LuanVoDai.RestorePlayerState, LuanVoDai, me, nMap})
	end 
	end 
	if thuongthamgia < 1 then 
	if soluotdi > 2 then 
				table.insert(tbOpt, {"Ta muốn <color=yellow>nhận phần thưởng tham gia đủ 3 trận Luận Võ Đài", LuanVoDai.NhanPhanThuongThamGia, LuanVoDai, me});
	end 
	end 
			table.insert(tbOpt, {"Xem <color=gold>Bảng Xếp Hạng", SpecialEvent.tbLuanVoDai.xembxh, SpecialEvent.tbLuanVoDai});
						table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end


function tbTuiGuangYuan:dangkybossvlct()
    local nHardWareId = me.GetTask(2406, 1)
		local szMsg = "Xin chào "..me.szName.."";
    local tbOpt = {}

    -- Thêm tùy chọn đăng ký nhân vật
    table.insert(tbOpt, {"<pic=135>Ta muốn <color=yellow>Đăng ký nhân vật này: "..me.szName.."<color>", self.dangkybossvlct_1, self})
		table.insert(tbOpt, {"<pic=135>Ta muốn <color=yellow>Xóa Đăng Ký Săn Boss : "..me.szName.."<color>", self.xoaDangKySanhBoss, self});

 --   table.insert(tbOpt, {"Kết Thúc Đối Thoại"})
--	   Dialog:Say(szMsg, tbOpt)
    -- Hiển thị danh sách nhân vật đã đăng ký theo mã máy
     local characterListMsg = self:ShowRegisteredCharacters(nHardWareId)
     Dialog:Say("Danh sách nhân vật đăng ký hiện nay của ngươi là :\n" .. characterListMsg, tbOpt)
	----------------end----------------
end

function tbTuiGuangYuan:xoaDangKySanhBoss()
    local szHwidOld = "\\script\\global\\tcqgaming\\gioihanmapboss\\gioihannhanvat.txt"
    local szData = KFile.ReadTxtFile(szHwidOld) or ""
    local newData = {}

    if szData == "" then
        Dialog:Say("Không có nhân vật nào được đăng ký để xóa.")
        return
    end

    local found = false

	-- Đọc từng dòng và xóa dòng tương ứng với tên nhân vật
	for line in string.gmatch(szData, "[^\r\n]+") do
		-- Lấy ra tên nhân vật từ mỗi dòng
		local name, num, hwid = string.match(line, "([^\t]+)\t(%d+)\t(%-?%d+)")

		-- So sánh chỉ với tên nhân vật
		if name ~= me.szName then
			table.insert(newData, line)  -- Nếu không phải nhân vật đang xóa, thêm vào danh sách mới
		else
			found = true  -- Đánh dấu rằng đã tìm thấy nhân vật để xóa
		end
	end

	


    -- Ghi lại dữ liệu mới vào file
    if found then
        KFile.WriteFile(szHwidOld, table.concat(newData, "\n"))
        Dialog:Say("Đã xóa đăng ký săn boss cho nhân vật: " .. me.szName)
    else
        Dialog:Say("Không tìm thấy nhân vật: " .. me.szName .. " để xóa.")
    end
end

function tbTuiGuangYuan:ShowRegisteredCharacters(nHardWareId)
    local szHwidOld = "\\script\\global\\tcqgaming\\gioihanmapboss\\gioihannhanvat.txt"  -- Đường dẫn file
    local szData = KFile.ReadTxtFile(szHwidOld) or ""  -- Đọc nội dung file

    if szData == "" then
        return "Không có nhân vật nào được đăng ký."
    end

    local characterList = {}

    -- Đọc từng dòng và lấy danh sách nhân vật theo nHardWareId
    for line in string.gmatch(szData, "[^\r\n]+") do
        local name, num, hwid = string.match(line, "([^\t]+)\t(%d+)\t(%-?%d+)")  -- Nhận mã máy âm hoặc dương
        if hwid and tonumber(hwid) == tonumber(nHardWareId) then
            table.insert(characterList, "<color=yellow>" .. name .. "<color> (Số thứ tự: " .. num .. ")")
        end
    end

    -- Kiểm tra nếu không có nhân vật nào được đăng ký
    if #characterList == 0 then
        return "Không có nhân vật nào được đăng ký cho mã máy này."
    end

    -- Kết hợp danh sách nhân vật thành chuỗi
    return table.concat(characterList, "\n")
end



function tbTuiGuangYuan:dangkybossvlct_1()
    local nHardWareId = me.GetTask(2406, 1)  -- Lấy Hardware ID từ task

    -- Kiểm tra nếu Hardware ID là 0
    if nHardWareId == 0 then
        Dialog:Say("<color=red>Hãy Chạy Autoupdate và thoát nhân vật sau đó vào lại game để tiến hành đăng ký.<color>")
        return
    end

    local szHwidOld = "\\script\\global\\tcqgaming\\gioihanmapboss\\gioihannhanvat.txt"  -- Đường dẫn file
    local szData = KFile.ReadTxtFile(szHwidOld) or ""  -- Đọc nội dung file, nếu rỗng thì gán chuỗi trống

    -- Xóa ký tự xuống dòng ở cuối nếu có
    szData = szData:gsub("%s+$", "")

    -- Đếm số thứ tự cho nhân vật mới
    local nNum = 0
    for line in string.gmatch(szData, "[^\r\n]+") do
        local name, num, hwid = string.match(line, "([^\t]+)\t(%d+)\t(%-?%d+)")  -- Chấp nhận mã máy âm hoặc dương
        if hwid and tonumber(hwid) == tonumber(nHardWareId) then
            nNum = nNum + 1  -- Tăng số thứ tự cho nhân vật mới
        end
    end

    -- Kiểm tra giới hạn số lượng nhân vật (tối đa 6)
    local nSoAccMax = ConfigAll.GioiHanSoAccHoatDong
    if nNum >= nSoAccMax then
        Dialog:Say("<color=cyan>Mỗi địa chỉ IP chỉ được đăng ký tối đa "..nSoAccMax.." nhân vật.\nHiện tại, máy của bạn đã đăng ký "..nNum.." nhân vật.<color>")
        return
    end

    -- Tạo mã đăng ký với tên nhân vật, số thứ tự và Hardware ID
    nNum = nNum + 1  -- Tăng số thứ tự lên cho nhân vật mới
    local code = me.szName .. "\t" .. nNum .. "\t" .. nHardWareId

    -- Kiểm tra xem nhân vật đã đăng ký trước đó chưa (chỉ kiểm tra tên nhân vật)
    local isRegistered = false
    for line in string.gmatch(szData, "[^\r\n]+") do
        local name = string.match(line, "([^\t]+)")
        if name == me.szName then
            isRegistered = true
            break
        end
    end

    -- Nếu chưa đăng ký, thêm nhân vật vào file và ghi lại
    if not isRegistered then
        if szData ~= "" then
            szData = szData .. "\n" .. code  -- Thêm dấu xuống dòng nếu file không rỗng
        else
            szData = code  -- Nếu file rỗng, chỉ ghi dữ liệu mà không thêm dòng trống
        end
        KFile.WriteFile(szHwidOld, szData)  -- Ghi dữ liệu vào file
        Dialog:Say("<color=green>Nhân vật "..me.szName.." đã được đăng ký thành công!<color>")
    else
        Dialog:Say("<color=yellow>Nhân vật "..me.szName.." đã được đăng ký trước đó.<color>")
    end
end


function tbTuiGuangYuan:kiemtraVSV()
		local nTichLuySo = me.GetTask(9189,3)
		local szMsg = "Hiện nay bạn đã quay tích lũy vỏ sò vàng tổng <color=yellow>:\n"..nTichLuySo.." vỏ sò vàng<color>\n<color=red>Chỉ khi đạt tổng tích lũy 50.000 VSV nhận thưởng<color>\n14 <color=gold> Rương Vừa Đẹp Vừa Cao Quý"
		    local tbOpt = {}
    table.insert(tbOpt, {"<color=yellow>Lãnh thưởng<color>", self.nhan14ruong6677, self});
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbTuiGuangYuan:nhan14ruong6677()
		local nTichLuySo = me.GetTask(9189,3)
		if nTichLuySo >= 50000 then 
			me.AddStackItem(18,1,324,1,{bForceBind=1},14)
			me.SetTask(9189,3,0)
			KDialog.MsgToGlobal("<color=green>"..me.szName.."<color>đã lãnh thưởng tích lũy <color=green> 50.000 VSV <color>nhận được\n<color=gold> Rương Vừa Đẹp Vừa Cao Quý X14 <color>khóa\nXin chúc mừng");
		else 
		Dialog:Say("Bạn chưa tích lũy đủ 50.000 sò hiện nay mới tích lũy được "..nTichLuySo.."")
		end 
end
function tbTuiGuangYuan:KickOutPlayer_On()
    local szMsg = "Hướng dẫn\n<color=red>*Nhân vật A Mật Khẩu 12345\n*Nhân Vật B Không cần mật khẩu\n*Khi kích nhân vật sử dụng pass 12345<color>\nMật khẩu dài 5 số<color>\n<color=yellow>Để tránh kẻ xấu trục lợi dò pass này nên yêu cầu người kích có mốc đồng tích nạp trên 1000 vạn\nCó thể thay đổi thoải mái\nMật khẩu đặt miễn phí\n<color><color=red>Khi bạn có việc đi xa hãy đặt mật khẩu bằng không hãy bấm xóa mật khẩu để không ai làm gì được bạn dù có dò"
    local tbOpt = {}
    table.insert(tbOpt, {"<color=yellow>Thiết Lập Mật Khẩu<color>", self.KickOutPlayer_On_SetPass, self});
	table.insert(tbOpt, {"<color=yellow>Xóa Mật Khẩu<color>", self.KickOutPlayer_On_NoPass, self});
    table.insert(tbOpt, {"<color=yellow>Ta muốn Kích Acc<color>", self.KickOutPlayer_On_ok, self});
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTuiGuangYuan:KickOutPlayer_On_NoPass()
        me.SetTask(9167, 2, 0)
		 Dialog:Say("Đã xóa mật khẩu kích ngoại tuyến thành công.")
end 

function tbTuiGuangYuan:KickOutPlayer_On_SetPass()
    Dialog:AskString("Nhập Số Pass (5 số):", 5, self.KickOutPlayer_On_SetPass_1, self);
end 

function tbTuiGuangYuan:KickOutPlayer_On_SetPass_1(szPassword)
    local isValid = string.match(szPassword, "^%d%d%d%d%d$") ~= nil
    if isValid then
        local nPassword = tonumber(szPassword)
        me.SetTask(9167, 2, nPassword)
        Dialog:Say("Thiết lập mật khẩu thành công. Mật khẩu của bạn là: <color=cyan>" .. nPassword .. "<color>")
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã thiết lập mật khẩu kích acc: %s", me.szName, nPassword)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\matkhaukichacc.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
    else
        Dialog:Say("Số không hợp lệ. Vui lòng nhập mật khẩu có 5 số.")
    end
end

function tbTuiGuangYuan:KickOutPlayer_On_ok()
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 1000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 1000 vạn đồng không thể dùng tính năng này");
		return 0;
	end
	 Dialog:AskString("Đối Phương:", 16, self.KickOutPlayer_On_1, self);
end 

function tbTuiGuangYuan:KickOutPlayer_On_1(szRoleName)
    local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
    if (not nPlayerId) then
        Dialog:Say("Tên này không tồn tại!", {"Nhập lại", self.KickOutPlayer_On_ok, self}, {"Kết thúc đối thoại"});
        return;
    end
		Dialog:AskNumber("Nhập Số Pass (5 số):", 99999, tbTuiGuangYuan.KickOutPlayer_On_2, tbTuiGuangYuan, nPlayerId);
end

function tbTuiGuangYuan:KickOutPlayer_On_2(nPlayerId, szPassword)
        GlobalExcute({"DietQuai:ConfirmKickOut", me.nId, nPlayerId, szPassword})
end

function tbTuiGuangYuan:DoiPhaiMain()
	if (me.nFaction == 0) then
	me.Msg("Chưa nhập môn phái!");
	return 0;
	end
		local nMyCoin = me.nCoin;
	if (nMyCoin < 700*10000) then
	Dialog:Say("Bạn không đủ <color=red>700 vạn đồng<color>");
    return 0; 
	end
    local me = KPlayer.GetPlayerObjById(me.nId);
    local nMainFaction = me.nFaction;

    if not nMainFaction or nMainFaction == 0 then
        Dialog:Say("Chưởng môn: Ngươi đã là đệ tử của môn phái khác, không thể gia nhập bổn phái.");
        return;
    end

    -- Lưu các môn phái phụ hiện tại
    local tbUsedFactionsBackup = {};
    for nTskId = 100, 100 + 3 - 1 do
        local nUsedFactionId = me.GetTask(7, nTskId);
        table.insert(tbUsedFactionsBackup, nUsedFactionId);
    end
    local tbFactionOptions = {
        {nFactionId = 1, szFactionName = "Thiếu Lâm"},
        {nFactionId = 2, szFactionName = "Thiên Vương"},
        {nFactionId = 3, szFactionName = "Đường Môn"},
        {nFactionId = 4, szFactionName = "Ngũ Độc"},
        {nFactionId = 5, szFactionName = "Nga My"},
        {nFactionId = 6, szFactionName = "Thúy Yên"},
        {nFactionId = 7, szFactionName = "Cái Bang"},
        {nFactionId = 8, szFactionName = "Thiên Nhẫn"},
        {nFactionId = 9, szFactionName = "Võ Đang"},
        {nFactionId = 10, szFactionName = "Côn Lôn"},
        {nFactionId = 11, szFactionName = "Minh Giáo"},
        {nFactionId = 12, szFactionName = "Đoàn Thị"},
    };

    -- Hiển thị hộp thoại chọn môn phái mới
    local tbOpt = {};
    for _, tbFaction in ipairs(tbFactionOptions) do
        table.insert(tbOpt, {tbFaction.szFactionName, self.OnSelectNewFaction, self, tbFaction.nFactionId});
    end
    table.insert(tbOpt, {"Không đổi"});

    Dialog:Say("Đệ tử: Hãy Chọn môn phái mới", tbOpt);
end

function tbTuiGuangYuan:OnSelectNewFaction(nNewFaction)
    local me = KPlayer.GetPlayerObjById(me.nId);

    -- Đổi môn phái chính
    me.JoinFaction(nNewFaction);
    me.SetTask(2, 1, 1);

    -- Giữ nguyên các môn phái phụ tu
    local tbUsedFactionsBackup = {};
    for nTskId = 100, 100 + 3 - 1 do
        local nUsedFactionId = me.GetTask(7, nTskId);
        table.insert(tbUsedFactionsBackup, nUsedFactionId);
    end

    for i, nUsedFactionId in ipairs(tbUsedFactionsBackup) do
        local nTskId = 100 + i - 1;
        if i == 1 then
            me.SetTask(7, nTskId, 0);
        else
            me.SetTask(7, nTskId, nUsedFactionId);
        end
    end
	me.UnAssignPotential();
	me.ResetFightSkillPoint();
	Faction:InitChangeFaction(me);
	me.AddJbCoin(-700*10000)
    me.Msg("Đã đổi môn phái chính và giữ nguyên các môn phái phụ tu");
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã chuyển môn phái main tốn 700 knb", me.szName)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 

function tbTuiGuangYuan:shop_cuon_truc_tele()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 200*10000) then
	Dialog:Say("Bạn không đủ <color=red>200 vạn đồng<color>");
    return 0; 
	end
			me.AddJbCoin(-200*10000)
	local pItem =   me.AddItem(18, 1, 2034, 12); 
   	me.SetItemTimeout(pItem, 7*24*60, 0);
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã mua cuốn trục dịch chuyển 200knb", me.szName)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop_trucdichchuyen.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 

function tbTuiGuangYuan:shop_botu_chuyencuong()
	local szMsg = "Xin chào: <color=yellow>"..me.szName.." <color>\n<color=cyan>Hãy chắc chắn với quyết định của mình";

    local tbOpt =     {} 
	table.insert(tbOpt, {"<pic=135>Mua <color=yellow>Bổ Tu Lệnh<color>\n<color=green>(100 Vạn Đồng)", self.mua_BoTuLenh, self});
	-- table.insert(tbOpt, {"<pic=135>Mua <color=yellow>1 Lần Chuyển Cường Hóa<color>\n<color=green>(500 Vạn Đồng)", self.mua_chuyencuonghoa, self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbTuiGuangYuan:mua_BoTuLenh()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 100*10000) then
	Dialog:Say("Bạn không đủ <color=red>100 vạn đồng<color>");
    return 0; 
	end
		me.AddJbCoin(-100*10000)
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		me.Msg("<color=yellow>Mua thành công 1 bổ tu lệnh");
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã mua 1 bổ tu lệnh 500knb", me.szName)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 

function tbTuiGuangYuan:mua_chuyencuonghoa()
local nLanChuyen = me.GetTask(3130,1)
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500*10000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
me.AddJbCoin(-500*10000)
me.Msg("<color=yellow>Bạn đã mua thành công 1 lượt chuyển cường hóa<color> vui lòng vào túi tân thủ để kiểm tra");
me.SetTask(3130,1,nLanChuyen + 1)
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã mua 1 lượt chuyển cường hóa 500 KNB", me.szName)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
--------------------------------------------------------Mua KNB------------------------------------------------------------------------------------------------
function tbTuiGuangYuan:muaknb()
	local szMsg = "Để mua được <color=yellow>Tiểu Kim Nguyên Bảo<color> cần có <color=green>1 vạn Đồng thường<color>";
    local nNeedBag = 2;

    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
        return 0;    
	end

	local tbOpt = {
	{"Mua<color=yellow> 1 Kim Nguyên Bảo<color><enter><color=green>Giá : 1 vạn Đồng",self.on1,self};
	{"Mua<color=yellow> 5 Kim Nguyên Bảo<color><enter><color=green>Giá : 5 vạn Đồng",self.on5,self};
	{"Mua<color=yellow> 10 Kim Nguyên Bảo<color><enter><color=green>Giá : 10 vạn Đồng",self.on10,self};
	{"Mua<color=yellow> 20 Kim Nguyên Bảo<color><enter><color=green>Giá : 20 vạn Đồng",self.on20,self};
	{"Mua<color=yellow> 50 Kim Nguyên Bảo<color><enter><color=green>Giá : 50 vạn Đồng",self.on50,self};
	{"Mua<color=yellow> 100 Kim Nguyên Bảo<color><enter><color=green>Giá : 100 vạn Đồng",self.on100,self};
	{"Mua<color=yellow> 200 Kim Nguyên Bảo<color><enter><color=green>Giá : 200 vạn Đồng",self.on200,self};
	{"Mua<color=yellow> 300 Kim Nguyên Bảo<color><enter><color=green>Giá : 300 vạn Đồng",self.on300,self};
	{"Mua<color=yellow> 500 Kim Nguyên Bảo<color><enter><color=green>Giá : 500 vạn Đồng",self.on500,self};
   	{"Hiện tại ta chưa muốn"}
	};
	Dialog:Say(szMsg, tbOpt);
end
--------------------------------------------------------Mua KNB------------------------------------------------------------------------------------------------
function tbTuiGuangYuan:muadaiknb()
	local szMsg = "Để mua được <color=yellow>Đại Kim Nguyên Bảo<color> cần có <color=green>\ntối thiểu 100 vạn Đồng thường<color>";
    local nNeedBag = 2;

    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
        return 0;    
	end

	local tbOpt = {
	{"Mua<color=yellow> Tiểu Kim Nguyên Bảo<color><enter><color=green>Giá  1 Tiểu KNB = 1 vạn Đồng",self.doitieukim,self};
	{"Mua<color=yellow> Đại Kim Nguyên Bảo<color><enter><color=green>Giá  1 Đại KNB = 100 vạn Đồng",self.doidaikim,self};
	{"Mua<color=yellow> 80 vạn đồng khóa<color><enter><color=green>Giá 80 vạn Đồng",self.doidongkhoane,self};
	{"Bán<color=yellow> Tiểu Kim Nguyên Bảo<color>",self.bankimthoi,self};
   	{"Hiện tại ta chưa muốn"}
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbTuiGuangYuan:bankimthoi() 
	local szMsg = "Mại zô Mại zô \nCác Hạ muốn bán như nào ?";
	local tbOpt = {
	{"Bán<color=yellow>100 Tiểu Kim Nguyên Bảo<color><enter><color=green>Nhận 100 Vạn Đồng",self.bantieukim,self};
	{"Bán<color=yellow>500 Tiểu Kim Nguyên Bảo<color><enter><color=green>Nhận 500 Vạn Đồng",self.ban500tieukim,self};
	{"Bán<color=yellow>1000 Tiểu Kim Nguyên Bảo<color><enter><color=green>Nhận 1000 Vạn Đồng",self.ban1000tieukim,self};
   	{"Hiện tại ta chưa muốn"}
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbTuiGuangYuan:bantieukim()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nTieuKim = me.GetItemCountInBags(18,1,1338,2) -- Tiểu Kim
local tbKim	= {18,1,1338,2,0,0}; 
if nTieuKim < 100 then 
	Dialog:Say("Bạn không có đủ ít nhất 100 Tiểu Kim Nguyên Bảo Rồi")
	return 
end
	Task:DelItem(me, tbKim, 100);
	me.AddJbCoin(100*10000)
		Dialog:Say("Các hạ đã bán<color=yellow> \n100 Tiểu Kim Nguyên Bảo Đạt Được 100 Vạn Đồng Thường")
end 

function tbTuiGuangYuan:ban500tieukim()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nTieuKim = me.GetItemCountInBags(18,1,1338,2) -- Tiểu Kim
local tbKim	= {18,1,1338,2,0,0}; 
if nTieuKim < 500 then 
	Dialog:Say("Bạn không có đủ ít nhất 500 Tiểu Kim Nguyên Bảo Rồi")
	return 
end
	Task:DelItem(me, tbKim, 500);
	me.AddJbCoin(500*10000)
		Dialog:Say("Các hạ đã bán<color=yellow> \n100 Tiểu Kim Nguyên Bảo Đạt Được 500 Vạn Đồng Thường")
end 

function tbTuiGuangYuan:ban1000tieukim()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nTieuKim = me.GetItemCountInBags(18,1,1338,2) -- Tiểu Kim
local tbKim	= {18,1,1338,2,0,0}; 
if nTieuKim < 1000 then 
	Dialog:Say("Bạn không có đủ ít nhất 1000 Tiểu Kim Nguyên Bảo Rồi")
	return 
end
	Task:DelItem(me, tbKim, 1000);
	me.AddJbCoin(1000*10000)
		Dialog:Say("Các hạ đã bán<color=yellow> \n100 Tiểu Kim Nguyên Bảo Đạt Được 1000 Vạn Đồng Thường")
end 

function tbTuiGuangYuan:doitieukim()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,1338,2) -- Tiểu Kim
if nCount < 10000 then
	Dialog:Say("Bạn không có đủ ít nhất 1 vạn đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
local Check = nCount/10000
local nC = 10
Dialog:AskNumber("Số lượng đổi", Check, self.doitieukim1, self);
end
 
function tbTuiGuangYuan:doitieukim1(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*10000) then
	Dialog:Say("Để đổi được "..szSoDong.." Tiểu Kim Nguyên Bảo bạn cần có thêm ".. szSoDong*10000 - nCount .."<color> Đồng)")
	return
	end
	me.AddStackItem(18,1,1338,2,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*10000))
end

function tbTuiGuangYuan:doidaikim()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,1338,1) -- Đại Kim
if nCount < 1000000 then
	Dialog:Say("Bạn không có đủ 100 Vạn đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
local Check = nCount/1000000
local nC = 10
Dialog:AskNumber("Số lượng đổi", Check, self.doidaikim1, self);
end
 
function tbTuiGuangYuan:doidaikim1(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*1000000) then
	Dialog:Say("Để đổi được "..szSoDong.." Đại Kim Nguyên Bảo bạn cần có thêm ".. szSoDong*1000000 - nCount .."<color> Đồng)")
	return
	end
	me.AddStackItem(18,1,1338,1,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*1000000))
end


function tbTuiGuangYuan:doidongkhoane()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()

if nCount < 80*10000 then
	Dialog:Say("Bạn không có đủ 80 Vạn đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
	me.AddBindCoin(80*10000);	--  đồng khóa
	me.AddJbCoin(-80*10000)
end


function tbTuiGuangYuan:on300()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 3000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>300 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-3000000);
    me.AddStackItem(18,1,1338,2,nil,300);
end

function tbTuiGuangYuan:on200()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>200 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-2000000);
    me.AddStackItem(18,1,1338,2,nil,200);
end

function tbTuiGuangYuan:on500()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>500 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-5000000);
    me.AddStackItem(18,1,1338,2,nil,500);
end

function tbTuiGuangYuan:on300()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 3000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>300 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-3000000);
    me.AddStackItem(18,1,1338,2,nil,300);
end

function tbTuiGuangYuan:on200()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>200 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-2000000);
    me.AddStackItem(18,1,1338,2,nil,200);
end

function tbTuiGuangYuan:on1()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 10000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>1 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-10000);
    me.AddItem(18,1,1338,2);
end

function tbTuiGuangYuan:on5()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 50000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>5 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-50000);
    me.AddStackItem(18,1,1338,2,nil,5);
end

function tbTuiGuangYuan:on10()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 100000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>10 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-100000);
    me.AddStackItem(18,1,1338,2,nil,10);
end

function tbTuiGuangYuan:on20()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 200000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>20 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-200000);
    me.AddStackItem(18,1,1338,2,nil,20);
end

function tbTuiGuangYuan:on50()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>50 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-500000);
    me.AddStackItem(18,1,1338,2,nil,50);
end

function tbTuiGuangYuan:on100()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 1000000) then
	Dialog:Say("Hãy chuẩn bị <color=yellow>100 vạn đồng<color>.");
    return 0; 
	end
	me.AddJbCoin(-1000000);
    me.AddStackItem(18,1,1338,2,nil,100);
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbTuiGuangYuan:TTTran()
	local tbHotro = Npc:GetClass("chenchongzhen_npc");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:ThoiQuangD()
	local tbHotro = Npc:GetClass("crosstimeroom_npc");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:ThienTangThap()
	local tbHotro = Npc:GetClass("qiancengtower_sign_npc");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_ThanhDo()
	local tbHotro = Npc:GetClass("ctcTTDchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_LamAn()
	local tbHotro = Npc:GetClass("ctcLAchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_DaiLy()
	local tbHotro = Npc:GetClass("ctcDLchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_PhuongTuong()
	local tbHotro = Npc:GetClass("ctcPTchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_DuongChau()
	local tbHotro = Npc:GetClass("ctcDCchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_TuongDuong()
	local tbHotro = Npc:GetClass("ctcTDchefu");
	tbHotro:OnDialog();
end
function tbTuiGuangYuan:CTC_BienKinh()
	local tbHotro = Npc:GetClass("ctcBKchefu");
	tbHotro:OnDialog();
end

function tbTuiGuangYuan:NhanThuongGift_THK()
-- if me.szName ~= "TuHoiKiem" then
-- return
-- end
self:TestThuGiftCOde()
end
function tbTuiGuangYuan:Dong()
	local nRet = me.GetUserPayCoin();
	if nRet > 0 then
		Dialog:Say("Nhận đồng nạp thẻ thành công, số lượng:"..nRet.."");
	else
		Dialog:Say("Không có đồng để nhận");
	end
end
function tbTuiGuangYuan:mocthuong()
	local nRet = me.GetUser();
	if nRet > 1000 then
		Dialog:Say("Nhận đồng nạp thẻ thành công, số lượng:"..nRet.."");
	else
		Dialog:Say("Không có đồng để nhận "..nRet.."");
	end
end
function tbTuiGuangYuan:GMKichHoat()
Dialog:AskString("Nhập Giftcode", 20, self.CheckGM, self);
end

-------------------


function tbTuiGuangYuan:PhucLoi()	
local msg = 
""
local tbOpt = {
{"Nhận <color=pink>MỐC 200.000 VNĐ<color>",self.moc200k,self};
{"Nhận <color=pink>MỐC 500.000 VNĐ<color>",self.moc500k,self};
{"Nhận <color=pink>MỐC 1000.000 VNĐ<color>",self.moc1TR,self};
{"Nhận <color=green>MỐC 2 TRIỆU<color>",self.moc2TR,self};
{"Nhận <color=green>MỐC 5 TRIỆU<color>",self.moc5TR,self};
--{"Nhận <color=green>MỐC 10 TRIỆU<color>",self.moc10TR,self};
--{"Nhận <color=green>MỐC 15 TRIỆU<color>",self.moc15TR,self};
}
Dialog:Say(msg,tbOpt)
end


function tbTuiGuangYuan:moc200k()
if me.CountFreeBagCell() < 10 then
Dialog:Say("Phải Có 10 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 3000000)then
	if me.GetTask(4008,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4008,1,1);
	me.AddItem(21,9,1,1).Bind(1); --Túi thiên tằm 24 ô
	me.AddItem(21,9,1,1).Bind(1); --Túi thiên tằm 24 ô
	me.AddItem(21,9,1,1).Bind(1); --Túi thiên tằm 24 ô
	-- danh hieu
	me.AddTitle(23,1,1,1);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 200k đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end

end
function tbTuiGuangYuan:moc500k()
if me.CountFreeBagCell() < 25 then
Dialog:Say("để trống 25 ô");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 7500000)then
if me.GetTask(4009,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4009,1,1);
	
	me.AddTitle(23,2,2,1);
	me.AddItem(1,13,30047,10).Bind(1);
	--- ngoại trang
	me.AddItem(1,25,72,1);
	me.AddItem(1,25,73,1);
	me.AddItem(1,26,85,1);
	me.AddItem(1,26,86,1);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 500k đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
function tbTuiGuangYuan:moc1TR()
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 15000000)then
if me.GetTask(4010,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4010,1,1);
	me.AddTitle(23,3,3,1);
	--NGUA
	me.AddItem(1,12,7105,4).Bind(1);
	me.AddStackItem(18,1,553,1,nil,10000);
	---ngoaitrang
	me.AddItem(1,25,68,1);
	me.AddItem(1,25,69,1);
	me.AddItem(1,26,81,1);
	me.AddItem(1,26,82,1);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 1 TRIỆU đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
function tbTuiGuangYuan:moc2TR()
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 30000000)then
if me.GetTask(4011,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4011,1,1);
	me.AddItem(1,13,3147,8);
	me.AddStackItem(18,1,553,1,nil,10000);
	me.AddTitle(23,4,4,1);
	--ngoaitrang
	me.AddItem(1,25,70,1);
	me.AddItem(1,25,71,1);
	me.AddItem(1,26,83,1);
	me.AddItem(1,26,84,1);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 2 TRIỆU đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
function tbTuiGuangYuan:moc5TR()
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 75000000)then
if me.GetTask(4012,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4012,1,1);
	me.AddTitle(23,5,5,1);
	-- me.AddItem(1,12,25,4);
	 me.AddItem(1,13,66,10).Bind(1);
	me.AddItem(1,12,7112,4);
	me.AddItem(1,12,7113,4);
	--ngoaitrang
	me.AddItem(1,26,79,1);
	me.AddItem(1,26,80,1);
	me.AddItem(1,25,66,1);
	me.AddItem(1,25,67,1);
	
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 5 TRIỆU đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
function tbTuiGuangYuan:moc10TR()
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 100000000)then
if me.GetTask(4013,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4013,1,1);
	me.AddTitle(23,6,6,1);
	me.AddItem(1,13,67,10).Bind(1);
	me.AddItem(1,12,30020,4).Bind(1);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 10 TRIỆU đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
function tbTuiGuangYuan:moc15TR()
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nCount = me.GetTask(self.TaskGourp, 2);

if (nCount >= 150000000)then
if me.GetTask(4014,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	me.SetTask(4014,1,1);
	me.AddTitle(23,7,7,1);
	
	me.AddItem(1,12,20045,4);
	--Thêm phần thưởng ở đây--
	Dialog:Say("Mốc 15 TRIỆU đã đc nhận");
else
Dialog:Say("Chưa có phần thưởng để nhận");
end
end
----
function tbTuiGuangYuan:NhanXuNapThe_OK()
if me.CountFreeBagCell() < 1 then
Dialog:Say("Phải Có 1 Ô Trống Trong Túi Hành Trang");
return 0;
end
local nRet = me.GetUserPayCoin();
me.SetTask(self.TaskGourp,2,me.GetTask(self.TaskGourp, 2)+(nRet/self.VNDtoJB));
--local xemdiem = me.SetTask(self.TaskGourp,2,me.GetTask(self.TaskGourp, 2)+(nRet/self.VNDtoJB));
if nRet ~= 0  then
local nCount1 = me.GetTask(self.TaskGourp, self.TaskId_TanThu);
Dialog:Say("Nhận đồng nạp thẻ thành công, số lượng:"..nRet.."");
else
		Dialog:Say("Không có đồng để nhận ");
end
end
----
function tbTuiGuangYuan:NhanXuNapThe_OK_Lan1()
local nRet = me.GetUserPayCoin();
local nSoXu = math.floor(nRet/10000);
local nCount1 = me.GetTask(self.TaskGourp, self.TaskId_TanThu);
me.AddJbCoin(-1*nRet)
if me.CountFreeBagCell() < 25 then
Dialog:Say("Phải Có 25 Ô Trống Trong Túi Hành Trang");
return 0;
end
me.AddJbCoin(-1*nRet)
me.AddExp(30000000) -- 30tr EXp
me.AddStackItem(18,1,2100,1,self.tbItemInfo,5) -- 5 Cuốc
me.AddStackItem(18,1,402,1,self.tbItemInfo,20) -- 20 Chân Nguyên Tu Luyện Đơn
me.AddStackItem(18,1,1334,1,self.tbItemInfo,20) -- 20 Thanh Long Bí Bảo Bảo Hạp Hồn
me.AddStackItem(18,1,1331,4,self.tbItemInfo,3) -- 3 Tinh Thạch Thánh Hỏa
me.AddStackItem(18,1,2076,1,self.tbItemInfo,2) -- 2 Gậy Đập Bóng (Đặc Biệt)
me.AddStackItem(18,1,20326,1,self.tbItemInfo,1) -- 1 Đá Cường Hóa +15
KDialog.MsgToGlobal("<color=yellow>\nNgười chơi <color=green>"..me.szName.."<color> <color=red>|<color> Nhận được quà nạp thẻ lần đầu !");	
me.Msg("<color=yellow>Số <color=green>Kim Nguyên Bảo<color> nhận được là <color=cyan>"..nSoXu.."<color>\nNhận Quà Nạp Lần Đầu")
me.SetTask(self.TaskGourp, self.TaskId_TanThu, nCount1 + 1);
end
function tbTuiGuangYuan:NhanXuNapThe_OK_Lan2TroDi()
local nRet = me.GetUserPayCoin();
local nSoXu = math.floor(nRet/10000);
me.Msg("<color=yellow>Số <color=green>Kim Nguyên Bảo<color> nhận được là <color=cyan>"..nSoXu.."<color>")
KDialog.MsgToGlobal("<color=yellow>\nNgười chơi <color=green>"..me.szName.."<color> <color=red>|<color> Nhận được <color=green>"..nSoXu.."<color> Kim Nguyên Bảo.");	
self:NhanPhucLoiMuc1()
end
function tbTuiGuangYuan:NhanPhucLoiMuc1()

end
function tbTuiGuangYuan:NhanPhucLoiMuc2()
me.AddExp(70000000)
me.AddStackItem(18,1,2072,1,self.tbItemInfo,3) -- 3 300 Bài Hát Thiếu Nhi
me.AddStackItem(18,1,2100,1,self.tbItemInfo,5) -- 5 Cuốc
me.AddStackItem(18,1,2076,1,self.tbItemInfo,1) -- 2 Gậy Đập Bóng (Đặc Biệt)
me.AddStackItem(18,1,1331,4,self.tbItemInfo,2) -- 2 Tinh Thạch Thánh Hỏa
me.AddStackItem(18,1,2009,1,self.tbItemInfo,10) -- 10 Rương Mảnh Trang Bị Đồng Hành
end
function tbTuiGuangYuan:NhanPhucLoiMuc2()
me.AddExp(70000000)
me.AddStackItem(18,1,2072,1,self.tbItemInfo,3) -- 3 300 Bài Hát Thiếu Nhi
me.AddStackItem(18,1,2100,1,self.tbItemInfo,5) -- 5 Cuốc
me.AddStackItem(18,1,2076,1,self.tbItemInfo,1) -- 2 Gậy Đập Bóng (Đặc Biệt)
me.AddStackItem(18,1,1331,4,self.tbItemInfo,2) -- 2 Tinh Thạch Thánh Hỏa
me.AddStackItem(18,1,2009,1,self.tbItemInfo,10) -- 10 Rương Mảnh Trang Bị Đồng Hành
end
function tbTuiGuangYuan:NhanPhucLoiMuc3()
me.AddExp(100000000)
me.AddStackItem(18,1,2072,1,self.tbItemInfo,5) -- 5 300 Bài Hát Thiếu Nhi
me.AddStackItem(18,1,2100,1,self.tbItemInfo,7) -- 7 Cuốc
me.AddStackItem(18,1,2076,1,self.tbItemInfo,5) -- 5 Gậy Đập Bóng (Đặc Biệt)
me.AddStackItem(18,1,1331,4,self.tbItemInfo,4) -- 4 Tinh Thạch Thánh Hỏa
me.AddStackItem(18,1,2009,1,self.tbItemInfo,15) -- 15 Rương Mảnh Trang Bị Đồng Hành
me.AddStackItem(18,1,1,10,self.tbItemInfo,1) -- 1 Huyền Tinh 10
me.AddStackItem(18,1,20326,1,self.tbItemInfo,1) -- 1 Đá Cường Hóa 15
end
-------------------------------------------

---admin
function tbTuiGuangYuan:CheckGM(szCode)

if szCode=="ttcntt@@2000##" then
	me.AddItem(18,1,5129,1);
end
end
---
function tbTuiGuangYuan:codechiase()
if me.CountFreeBagCell() < 15 then
Dialog:Say("Phải Có 15 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4015,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
end
		Dialog:Say("\<color=green>Nhận Thành Công");
		me.AddItem(18,1,114,8);
		me.AddItem(18,1,114,9);
		me.AddStackItem(18,1,114,11,nil,4);
		me.AddStackItem(18,1,553,1,nil,9000);--dulong
		me.AddStackItem(18,1,20348,1,{bForceBind=1},1000);
		me.AddStackItem(18,1,20349,1,{bForceBind=1},1000);
		me.AddStackItem(18,1,2004,1,{bForceBind=1},80);
		me.AddStackItem(18,1,2005,1,{bForceBind=1},80);
		me.AddStackItem(18,1,2006,1,{bForceBind=1},80);
		me.AddStackItem(18,1,2007,1,{bForceBind=1},80);
		me.AddStackItem(18,1,2008,1,{bForceBind=1},80);
		me.AddBindCoin(500000);
		me.SetTask(4015,1,1);
end
function tbTuiGuangYuan:codehaithang9()
if me.CountFreeBagCell() < 15 then
Dialog:Say("Phải Có 15 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(9053,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
end
		KDialog.MsgToGlobal("\<color=green> "..me.szName.." Code 2.9 tại cổ phong hà phượng tường");
		me.AddItem(18,1,114,10);
		me.AddItem(18,1,114,10);
		me.AddStackItem(18,1,553,1,nil,2000);--dulong
		me.AddBindMoney(3000000);
		me.AddStackItem(18,1,190,1,{bForceBind=1},900);
		me.SetTask(9053,1,1);
end
function tbTuiGuangYuan:checkcodechiase(szCode)
local OUTPUT_FILE_PATH = "\\dstop\\codechiase.txt";
	local tbFileOut = Lib:LoadTabFile(OUTPUT_FILE_PATH);
	
    for _, tbRowOut in pairs(tbFileOut) do
     
        local szName = tbRowOut["sZname"] or "";
		local taikhoan = tbRowOut["taikhoan"] or "";
        if szCode==szName and taikhoan == me.szAccount then
		
if me.CountFreeBagCell() < 10 then
Dialog:Say("Phải Có 10 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
	
	if me.GetTask(4015,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
		Dialog:Say("\<color=green>Nhận Thành Công");
		me.AddItem(18,1,114,8);
		me.AddItem(18,1,114,9);
		
		me.AddBindCoin(500000);
		me.SetTask(4015,1,1);
		
		end
		--
		if szCode ~= szName and taikhoan ~= me.szAccount then
		Dialog:Say("..");
		end
    end
   
end
---
function tbTuiGuangYuan:codeopen()
if me.CountFreeBagCell() < 10 then
Dialog:Say("Phải Có 10 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4016,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	Dialog:Say("\<color=green>Nhận Thành Công");
	me.AddItem(1,12,20016,4).Bind(1);
	me.AddRepute(9,2,600);
	me.SetTask(4016,1,1);

end
function tbTuiGuangYuan:denbu()
if me.CountFreeBagCell() < 10 then
Dialog:Say("Phải Có 10 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4018,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
end
	Dialog:Say("\<color=green>Nhận Thành Công");
	me.AddStackItem(18,1,553,1,nil,300);
	me.AddItem(18,1,114,8);
	--me.AddItem(18,1,377,8).Bind(1);
	me.SetTask(4018,1,1);

end
function tbTuiGuangYuan:thieunhi()
if me.CountFreeBagCell() < 20 then
Dialog:Say("Phải Có 20 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4019,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	Dialog:Say("\<color=green>Nhận Thành Công");
	me.AddStackItem(18,1,2009,1,nil,50);
	me.AddStackItem(18,1,541,2,nil,30);
	me.AddItem(18,1,377,1).Bind(1);
	me.SetTask(4019,1,1);

end
function tbTuiGuangYuan:hotronguoichoi()
	local szMsg = "hổ trợ người chơi sẽ được phát theo tuần, tính cả người chơi mới và người chơi củ";
	local tbOpt = {
		{"lần 1",self.lan1,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbTuiGuangYuan:lan1()
if me.CountFreeBagCell() < 20 then
Dialog:Say("Phải Có 20 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4020,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
	end
	KDialog.MsgToGlobal("\<color=green> "..me.szName.." Nhận Thành Công hổ trợ người chơi lần 1");
	me.AddStackItem(18,1,2009,1,nil,50);
	me.AddStackItem(18,1,553,1,nil,5000);
	me.SetTask(4020,1,1);

end

function tbTuiGuangYuan:denbutk()
	if me.CountFreeBagCell() < 20 then
Dialog:Say("Phải Có 20 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
if me.GetTask(4021,1) == 1 then
		Dialog:Say("\NHẬN RỒI <color=green>");
		return;
end
	KDialog.MsgToGlobal("\<color=green> "..me.szName.." Nhận Thành Công quà đền bù tk");
	me.AddStackItem(18,1,2009,1,nil,30);
	me.AddItem(18,1,114,9);
	me.SetTask(4021,1,1);

end
function tbTuiGuangYuan:freepet()
me.AddItem(18,1,666,5);
end