-- date:22/12/2023
-- by:TCQGaming
-------------------------------------------------------
local tbQuaTruongThanh ={};
SpecialEvent.tbQuaTruongThanh= tbQuaTruongThanh;

-- Hàm tính số ngày trong tháng
function  tbQuaTruongThanh:tinhsongaytrongthang(year, month)
    local nextMonth = month < 12 and month + 1 or 1
    local nextYear = nextMonth == 1 and year + 1 or year

    local nextMonthFirstDay = os.time{year = nextYear, month = nextMonth, day = 1}
    local lastDayOfMonth = os.date("*t", nextMonthFirstDay - 86400)

    return lastDayOfMonth.day
end

function tbQuaTruongThanh:OnDialog()
    local nThang = tonumber(GetLocalDate("%m")) 
    local nQuaTruongThanh = me.GetTask(9181, 1) -- Số lần mua gói
    local nNgayHienTai = me.GetTask(9181, 3)
    local nNgayKeTiep = nNgayHienTai + 1
    local nTaskGioiHanNgay = me.GetTask(9181, 4)
    local nNgayHienTai_SoSanh = tonumber(GetLocalDate("%d")) -- Ngày hiện tại để so sánh
    local nTaskLuu_NgayMuaQua_1 = me.GetTask(9181, 5)
    local nTaskLuu_NgayMuaQua_2 = me.GetTask(9181, 6)
	local nTongSoLanNhan = me.GetTask(9181,7)
    local nBienDemSoNgayBoQua = nNgayHienTai_SoSanh - nTaskLuu_NgayMuaQua_1
    local nSoNgayConLai = 30 - nNgayHienTai -- Số ngày còn lại trong tháng
	local nTaskThangDauTienNhan = me.GetTask(9181,8)
	local Nam = tonumber(GetLocalDate("%Y"));
	local year = Nam
	local month = nTaskThangDauTienNhan -- Tháng cần kiểm tra
	local daysInMonth = tbQuaTruongThanh:tinhsongaytrongthang(year, month)
    local szMsg = ""
    if nTaskThangDauTienNhan > 0 and nTaskThangDauTienNhan ~= nThang and nTongSoLanNhan <= 30 and nQuaTruongThanh > 0  then
		local nBienDemSoNgayBoQua = (daysInMonth - nTaskLuu_NgayMuaQua_1) + nNgayHienTai_SoSanh
		    local nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
if nBienDemSoNgayBoQua > nTongSoLanNhan then 
    nBienDemSoNgayBoQua = nTongSoLanNhan
	nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
end 
        szMsg = string.format(
            "Bạn đã bỏ qua: <color=yellow>%d <color>ngày chưa nhận lợi tức\nNgày đầu tiên bắt đầu nhận quà từ ngày %d\nNgày nhận quà gần đây nhất từ ngày %d\nLợi tức hiện nay là : <color=yellow>%d Kim Nguyên Bảo - %d Điểm Hoạt Động<color>\n<color=red>Lưu Ý:\nNgày đầu tiên sau khi mua gói cần kích hoạt gói trưởng thành tốn 500 KNB<color>\nBạn có đồng ý mua?\nTổng Số Lượt Nhận Quà Còn Lại Là :"..nTongSoLanNhan.."",
            nBienDemSoNgayBoQua, nTaskLuu_NgayMuaQua_2, nTaskLuu_NgayMuaQua_1, nSoLoiIchNhanLai_SauKhiBoQua, nSoLoiIchNhanLai_SauKhiBoQua)
	elseif nTaskThangDauTienNhan > 0 and nTaskThangDauTienNhan == nThang and nTongSoLanNhan <= 30 and nQuaTruongThanh > 0 and nTongSoLanNhan >= 30 - nTongSoLanNhan and nBienDemSoNgayBoQua > 1 then
			local nBienDemSoNgayBoQua= nNgayHienTai_SoSanh - nTaskLuu_NgayMuaQua_1
		    local nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
if nBienDemSoNgayBoQua > nTongSoLanNhan then 
    nBienDemSoNgayBoQua = nTongSoLanNhan
	nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
end 
        szMsg = string.format(
            "Bạn đã bỏ qua: <color=yellow>%d <color>ngày chưa nhận lợi tức\nNgày đầu tiên bắt đầu nhận quà từ ngày %d\nNgày nhận quà gần đây nhất từ ngày %d\nLợi tức hiện nay là : <color=yellow>%d Kim Nguyên Bảo - %d Điểm Hoạt Động<color>\n<color=red>Lưu Ý:\nNgày đầu tiên sau khi mua gói cần kích hoạt gói trưởng thành tốn 500 KNB<color>\nBạn có đồng ý mua?\nTổng Số Lượt Nhận Quà Còn Lại Là :"..nTongSoLanNhan.."",
            nBienDemSoNgayBoQua, nTaskLuu_NgayMuaQua_2, nTaskLuu_NgayMuaQua_1, nSoLoiIchNhanLai_SauKhiBoQua, nSoLoiIchNhanLai_SauKhiBoQua)
	else 
        if nQuaTruongThanh == 0 then
				    local nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
        szMsg = string.format(
            "Ngày đầu tiên bắt đầu nhận quà từ ngày %d\nNgày nhận quà gần đây nhất từ ngày %d\n1.000.000 VNĐ nhận tổng lợi tức : <color=yellow>3400 Kim Nguyên Bảo - 3400 Điểm Hoạt Động<color>\n<color=red>Lưu Ý:\nNgày đầu tiên sau khi mua gói cần kích hoạt gói trưởng thành tốn 500 KNB<color>\nBạn có đồng ý mua?\nTổng Số Lượt Nhận Quà Còn Lại Là :"..nTongSoLanNhan.."",
            nTaskLuu_NgayMuaQua_2, nTaskLuu_NgayMuaQua_1)
			else
					    local nSoLoiIchNhanLai_SauKhiBoQua = 100
            szMsg = string.format(
            "Ngày đầu tiên bắt đầu nhận quà từ ngày %d\nNgày nhận quà gần đây nhất từ ngày %d\nLợi tức hiện nay là : <color=yellow>%d Kim Nguyên Bảo - %d Điểm Hoạt Động<color>\n<color=red>Lưu Ý:\nNgày đầu tiên sau khi mua gói cần kích hoạt gói trưởng thành tốn 500 KNB<color>\nBạn có đồng ý mua?\nTổng Số Lượt Nhận Quà Còn Lại Là :"..nTongSoLanNhan.."",
            nTaskLuu_NgayMuaQua_2, nTaskLuu_NgayMuaQua_1, nSoLoiIchNhanLai_SauKhiBoQua, nSoLoiIchNhanLai_SauKhiBoQua)
        end
    end

    local tbOpt = {}
    if nQuaTruongThanh == 0 then
        table.insert(tbOpt, {"Ta muốn mua quà trưởng thành<color>", self.muaquatruongthanh_1, self})
    elseif nQuaTruongThanh > 0 and nNgayHienTai == 0 then
        table.insert(tbOpt, {"Kích Hoạt Thưởng Ngày 1<color>\n<color=green>(Tốn 500 KNB và Được 500 Điểm HĐ)", self.nhanquatruongthanhngay1, self})
    elseif nQuaTruongThanh > 0 and nNgayHienTai <= 30 then
    if nTaskThangDauTienNhan ~= nThang and nTongSoLanNhan <= 30 then
			local nBienDemSoNgayBoQua = (daysInMonth - nTaskLuu_NgayMuaQua_1) + nNgayHienTai_SoSanh
			if nBienDemSoNgayBoQua > nTongSoLanNhan then 
				nBienDemSoNgayBoQua = nTongSoLanNhan
			end 
            if nTaskGioiHanNgay == 0 then
                table.insert(tbOpt, {"Nhận toàn bộ quà của " .. nBienDemSoNgayBoQua .. " ngày chưa nhận<color>", self.nhanqua_neuboqua, self})
            end
	elseif nTaskThangDauTienNhan > 0 and nTaskThangDauTienNhan == nThang and nTongSoLanNhan <= 30 and nQuaTruongThanh > 0 and nTongSoLanNhan >= 30 - nTongSoLanNhan and nBienDemSoNgayBoQua > 1 then
			local nBienDemSoNgayBoQua= nNgayHienTai_SoSanh - nTaskLuu_NgayMuaQua_1
			if nBienDemSoNgayBoQua > nTongSoLanNhan then 
				nBienDemSoNgayBoQua = nTongSoLanNhan
			end 
		    local nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
			      table.insert(tbOpt, {"Nhận toàn bộ quà của " .. nBienDemSoNgayBoQua .. " ngày chưa nhận<color>", self.nhanqua_neuboqua, self})
        else
            if nTaskGioiHanNgay == 0 then
                table.insert(tbOpt, {"Nhận thưởng quà trưởng thành ngày "..nNgayKeTiep.."<color>\n<color=green>(100 KNB- 100 Điểm HĐ)", self.nhanthuongtiep, self})
            end
        end
        table.insert(tbOpt, {"Hiện tại ta chưa muốn"})
    end
    Dialog:Say(szMsg, tbOpt)
end


function tbQuaTruongThanh:nhanqua_neuboqua()
    local nQuaTruongThanh = me.GetTask(9181, 1) -- Số lần mua gói
    local nThang = tonumber(GetLocalDate("%m")) -- Ngày hiện tại
    local nThuongNgay = me.GetTask(9181, 3)
    local nTaskThang = me.GetTask(9181, 1) -- Lấy số lần mua gói
    local nDiem_Hoat_Dong = me.GetTask(9177, 1)
    local nTaskGioiHanNgay = me.GetTask(9181, 4)
    local nNgayHienTai_SoSanh = tonumber(GetLocalDate("%d")) -- Ngày hiện tại để so sánh
    local nTaskLuu_NgayMuaQua_1 = me.GetTask(9181, 5)
	local nTaskThangDauTienNhan = me.GetTask(9181,8)
	local year = 2023 -- Năm cần kiểm tra
	local month = nTaskThangDauTienNhan -- Tháng cần kiểm tra
	local daysInMonth = tbQuaTruongThanh:tinhsongaytrongthang(year, month)
	local nBienDemSoNgayBoQua = (daysInMonth - nTaskLuu_NgayMuaQua_1) + nNgayHienTai_SoSanh
    local nKimNhanDuoc = 100 * nBienDemSoNgayBoQua -- Số kim nguyên bảo nhận được
	local nTongSoLanNhan = me.GetTask(9181,7)
    local nDiemHDNhanDuoc = 100 * nBienDemSoNgayBoQua -- Số điểm hoạt động nhận được
	if  nTaskThangDauTienNhan > 0 and nTaskThangDauTienNhan == nThang and nTongSoLanNhan < 30 and nQuaTruongThanh > 0 and nTongSoLanNhan >= 30 - nTongSoLanNhan then
			local nBienDem= nNgayHienTai_SoSanh - nTaskLuu_NgayMuaQua_1
			local nBienDemSoNgayBoQua= nNgayHienTai_SoSanh - nTaskLuu_NgayMuaQua_1
		    local nSoLoiIchNhanLai_SauKhiBoQua = 100 * nBienDemSoNgayBoQua
			local nKimNhanDuoc = 100 * nBienDemSoNgayBoQua -- Số kim nguyên bảo nhận được
			local nDiemHDNhanDuoc = 100 * nBienDemSoNgayBoQua -- Số điểm hoạt động nhận được
		if nBienDemSoNgayBoQua > nTongSoLanNhan then
            nBienDemSoNgayBoQua = nTongSoLanNhan
            nKimNhanDuoc = 100 * nBienDemSoNgayBoQua
            nDiemHDNhanDuoc = 100 * nBienDemSoNgayBoQua
      end
    if nTaskGioiHanNgay > 0 then 
        me.Msg("<color=yellow>Hôm nay ngươi đã nhận quà rồi mà<color>")
        return 0
    end 

    if nThuongNgay >= 30 then
        me.Msg("<color=yellow>Bạn đã nhận hết quà trưởng thành trong tháng này<color>")
        return 0
    else
		me.SetTask(9177,1,nDiem_Hoat_Dong + nDiemHDNhanDuoc)
        me.AddJbCoin(nKimNhanDuoc * 10000)
			me.SetTask(9181,4,1)
        me.SetTask(9181, 3, nThuongNgay + nBienDemSoNgayBoQua) -- Cập nhật số ngày nhận quà
        me.SetTask(9181, 5, nNgayHienTai_SoSanh) -- Cập nhật ngày mua quà lại bằng ngày hiện tại
		me.SetTask(9181,7,nTongSoLanNhan - nBienDemSoNgayBoQua)
		me.SetTask(9181,8,nThang)
        local szMsg = string.format("<color=yellow>Nhận quà thành công Bạn đã bỏ qua %d ngày. Tổng số nhận hiện nay: %d kim nguyên bảo và %d điểm hoạt động<color>", nBienDemSoNgayBoQua, nKimNhanDuoc, nDiemHDNhanDuoc)
        me.Msg(szMsg)
				local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
		local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã nhận thưởng quà trưởng thành bỏ qua %s ngày, Thời gian: %s", me.szName, me.szAccount,nBienDemSoNgayBoQua, szDate)
		local logFilePath = "\\script\\global\\tcqgaming\\npc\\log_qua_truong_thanh\\nhanthuongquatruongthanh_boqua.txt"
		local szData = KFile.ReadTxtFile(logFilePath)
		szData = szData and (szData .. "\n" .. logMessage) or logMessage
		KFile.WriteFile(logFilePath, szData)
    end 
	else 
		if nBienDemSoNgayBoQua > nTongSoLanNhan then
            nBienDemSoNgayBoQua = nTongSoLanNhan
            nKimNhanDuoc = 100 * nBienDemSoNgayBoQua
            nDiemHDNhanDuoc = 100 * nBienDemSoNgayBoQua
      end
	    if nThuongNgay >= 30 then
        me.Msg("<color=yellow>Bạn đã nhận hết quà trưởng thành trong tháng này<color>")
        return 0
		else 
		me.AddJbCoin(nKimNhanDuoc * 10000)
	me.SetTask(9177,1,nDiem_Hoat_Dong + nDiemHDNhanDuoc)
		me.SetTask(9181,4,1)
        me.SetTask(9181, 3, nThuongNgay + nBienDemSoNgayBoQua) -- Cập nhật số ngày nhận quà
        me.SetTask(9181, 5, nNgayHienTai_SoSanh) -- Cập nhật ngày mua quà lại bằng ngày hiện tại
		me.SetTask(9181,7,nTongSoLanNhan - nBienDemSoNgayBoQua)
		me.SetTask(9181,8,nThang)
        local szMsg = string.format("<color=yellow>Nhận quà thành công Bạn đã bỏ qua %d ngày. Tổng số nhận hiện nay: %d kim nguyên bảo và %d điểm hoạt động<color>", nBienDemSoNgayBoQua, nKimNhanDuoc, nDiemHDNhanDuoc)
        me.Msg(szMsg)
		local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
		local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã nhận thưởng quà trưởng thành bỏ qua %s ngày, Thời gian: %s", me.szName, me.szAccount,nBienDemSoNgayBoQua, szDate)
		local logFilePath = "\\script\\global\\tcqgaming\\npc\\log_qua_truong_thanh\\nhanthuongquatruongthanh_boqua.txt"
		local szData = KFile.ReadTxtFile(logFilePath)
		szData = szData and (szData .. "\n" .. logMessage) or logMessage
		KFile.WriteFile(logFilePath, szData)
		end 
	end 
end



function tbQuaTruongThanh:muaquatruongthanh_1()
 local szMsg = "<color=cyan>Hãy xác nhận lại\n<color><bclr=red><color=yellow>Nếu bấm mua sẽ không nhận được đặc quyền như nạp thẻ thông thường , đây là QUÀ TRƯỞNG THÀNH KIM<bclr><color><color=yellow>\nYêu cầu nạp 1.000.000 VNĐ để tiến hành mua\nNếu bạn nạp dưới 1.000.000 VNĐ mà bấm vào đây thì sẽ chỉ nhận được đồng mà không hề nhận thêm gì khác kể cả Quà trưởng thành cũng như tích nạp , điểm hoạt động , vv"
    local tbOpt = {}
	        table.insert(tbOpt, {"Ta chắc chắn mua gói này và \nđã nạp đủ<color=gold> 1.000.000 VNĐ<color>", self.muaquatruongthanhthoi, self})
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"})
	    Dialog:Say(szMsg, tbOpt)
end
function tbQuaTruongThanh:nhanquatruongthanhngay1()
    local nThang = tonumber(GetLocalDate("%m")) -- Ngày hiện tại
local nThuongNgay = me.GetTask(9181,3)
local nNgayMuaQua = tonumber(GetLocalDate("%d")) -- Ngày hiện tại
local nTaskLuu_NgayMuaQua_1 = me.GetTask(9181,5)
local nTaskLuu_NgayMuaQua_2 = me.GetTask(9181,6)
local nTongSoLanNhan = me.GetTask(9181,7)
local nTaskThangDauTienNhan = me.GetTask(9181,8)
local nTaskGioiHanNgay = me.GetTask(9181,4)	
	local nDiem_Hoat_Dong = me.GetTask(9177,1);
if nTaskGioiHanNgay > 0 then 
    me.Msg("<color=yellow>Hôm nay ngươi đã nhận quà rồi mà<color>")
return 0
end 
	me.AddJbCoin(-500*10000)
	me.SetTask(9181,3,1)
	me.SetTask(9181,4,1)
	me.SetTask(9181,5,nNgayMuaQua)
	me.SetTask(9181,6,nNgayMuaQua)
	me.SetTask(9181,8,nThang)
	me.SetTask(9181,7,nTongSoLanNhan + 29)
	me.SetTask(9177,1,nDiem_Hoat_Dong + 500)
	me.Msg("<color=yellow>Bạn đã nhận thưởng ngày 1 thành công Tốn 500 Vạn đồng ,và nhận được 500 điểm hoạt động<color>")
		local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
		local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã nhận thưởng quà trưởng thành lần thứ %s , Thời gian: %s", me.szName, me.szAccount,nThuongNgay, szDate)
		local logFilePath = "\\script\\global\\tcqgaming\\npc\\log_qua_truong_thanh\\nhanthuongquatruongthanh.txt"
		local szData = KFile.ReadTxtFile(logFilePath)
		szData = szData and (szData .. "\n" .. logMessage) or logMessage
		KFile.WriteFile(logFilePath, szData)
end

function tbQuaTruongThanh:nhanthuongtiep()
    local nNgayMuaQua = tonumber(GetLocalDate("%d")) -- Ngày hiện tại
	local nThuongNgay = me.GetTask(9181,3)
	 local nTaskThang = me.GetTask(9181, 1) -- Lấy số lần mua gói
	 local nTongSoLanNhan = me.GetTask(9181,7)
	 	local nDiem_Hoat_Dong = me.GetTask(9177,1);
    local nSoNgayConLai = 30 - nThuongNgay
local nTaskGioiHanNgay = me.GetTask(9181,4)	
local nTaskLuu_NgayMuaQua_1 = me.GetTask(9181,5)
if nTaskGioiHanNgay > 0 then 
    me.Msg("<color=yellow>Hôm nay ngươi đã nhận quà rồi mà<color>")
return 0
end 
if nThuongNgay >= 30 then
    me.Msg("<color=yellow>Bạn đã nhận hết quà trưởng thành trong tháng này<color>")
    return 0
else
	me.AddJbCoin(100*10000)
	me.SetTask(9181,3,nThuongNgay + 1)
	me.SetTask(9181,4,1)
	me.SetTask(9181,5,nNgayMuaQua)
	me.SetTask(9181,7,nTongSoLanNhan - 1)
	me.SetTask(9177,1,nDiem_Hoat_Dong + 100)
	 me.Msg("<color=yellow>Nhận quà thành công nhận được 100 điểm hoạt động , 100 kim nguyên bảo<color>")
	 	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
		local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã nhận thưởng quà trưởng thành lần thứ %s , Thời gian: %s", me.szName, me.szAccount,nThuongNgay, szDate)
		local logFilePath = "\\script\\global\\tcqgaming\\npc\\log_qua_truong_thanh\\nhanthuongquatruongthanh.txt"
		local szData = KFile.ReadTxtFile(logFilePath)
		szData = szData and (szData .. "\n" .. logMessage) or logMessage
		KFile.WriteFile(logFilePath, szData)
end 
end

function tbQuaTruongThanh:muaquatruongthanhthoi()
    local nThangHienTai = tonumber(GetLocalDate("%m"))
    local nTaskThang = me.GetTask(9181, 1) -- Lấy số lần mua gói
    if nTaskThang == 0 then -- Giới hạn số lần mua gói trong khoảng từ 1 đến 12
        local nRet = me.GetUserPayCoin()
		local nSoDongNhan = math.floor(nRet/10000);
        if nRet >= 1000 * 10000 then
            me.Msg("<color=yellow>Bạn đã mua thành công quà trưởng thành tháng này<color>")
            me.SetTask(9181, 1, 1) -- Lưu thông tin tháng mua gói
            me.SetTask(9181, 2, nThangHienTai) -- Tháng hiện tại để so sánh
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Đã mua thành công gói Quà Trưởng Thành lợi tức 300% quá đã");
		local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
		local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Mua Quà Trưởng Thành 1tr, Thời gian: %s", me.szName, me.szAccount, szDate)
		local logFilePath = "\\script\\global\\tcqgaming\\npc\\log_qua_truong_thanh\\quatruongthanh.txt"
		local szData = KFile.ReadTxtFile(logFilePath)
		szData = szData and (szData .. "\n" .. logMessage) or logMessage
		KFile.WriteFile(logFilePath, szData)
        else
            me.Msg("<color=cyan>Bạn đang không có 1000 vạn đồng làm sao mà mua gói này<color>\nSố đồng nhận được là "..nSoDongNhan.." vạn đồng\nNếu bạn không nạp đủ 1.000.000VNĐ mà bấm vào đây nên chỉ nhận được đồng mà không nhận được bất kỳ đặc quyền nào khác , xin hãy chú ý những lần sau")
        end
    else
        me.Msg("<color=cyan>Tháng này bạn đã mua rồi<color>")
    end
end