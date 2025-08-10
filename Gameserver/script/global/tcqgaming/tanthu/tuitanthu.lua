local tbGift = Item:GetClass("tanthutcqgaming"); 
tbGift.Cap_Ho_Tro = 150;
tbGift.Cap_Nhan_Exp = 60;
tbGift.TASKGROUP            = 3105;-- taskgroupID
tbGift.TASKLASTTIME_ID        = 1;            -- task
tbGift.TASKREMAINTIME_ID    = 2;            -- task
tbGift.SKILL_ID_EXP            = 1994;            -- 1994 id skill
tbGift.SKILL_ID_EXP_LEVEL    = 10;            -- Cấp độ của skill.Cấp 10 sẽ là + thêm 100% kinh nghiệm.Cấp 20 là cộng 200%(tương đương x3)
tbGift.nWeaponLevel		= 9;					-- cấp vũ khí
tbGift.nArmor_Level		= 10;					-- cấp trang bị
tbGift.CuongHoa			= 10; 					-- cường hóa trang bị 
tbGift.CuongHoa1			= 12; 					-- cường hóa trang bị với vũ khí

tbGift.TASK_NON = 3121;
tbGift.TASK_AO = 3122;
tbGift.TASK_LUNG = 3123;
tbGift.TASK_TAY = 3124;
tbGift.TASK_GIAY = 3125;
tbGift.TASK_PHU = 3126;
tbGift.TASK_BOI = 3127;
tbGift.TASK_NHAN = 3128;
tbGift.TASK_LIEN = 3129;
tbGift.TASK_RutCuongHoa = 3130;
-------tbGift.TASK_VU = 3130;
tbGift.tbEffect = {   
 [1] = 1;--(Thời gian hiệu nghiệm của thẻ.Đơn vị tính bằng Giờ)
}


function tbGift:OnUse()
-- DoScript("\\script\\global\\tcqgaming\\tanthu\\tuitanthu.lua");
	------------------------------------------------------------------------------------
	-- local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	-- if nDate < ConfigAll.TimeOpenSever then
		-- Dialog:Say(SpecialEvent.ConfigAll.ThongBao)
	-- return 0 
	-- end 


	local nDateNVngay = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(9055,1) < nDateNVngay then
		me.SetTask(9055,1, nDateNVngay);
		me.SetTask(9055,2, 0);
		me.SetTask(9055,3, 0);
		me.SetTask(9055,4, 0);
		me.SetTask(9055,5, 0);
		-- me.SetTask(5014,4, 0);-----nhiem vu ngay
		me.SetTask(9055,6, 0);
		me.SetTask(9055,7, 0);
	end 
	------------------------------------------------------------------------------------
	local nNgayMoSV = DietQuai:NgayMoMayChu();
	local nHardWareId_p = me.dwHardWareId;
	local nDiem_Hoat_Dong = me.GetTask(9177,1);
 
	local szMsg = "Xin chào: <color=yellow>"..me.szName.." <color>\n<bclr=whitle><color=cyan>Chào Mừng Bạn Đến Với Phiên bản Kiếm Thế 2009<color>\n Máy Chủ Đã Mở "..nNgayMoSV.." ngày\n<color=gold>Trang Chủ<color> : <color=yellow>HuyetKiem2009.Net<color>\nMáy Chủ : <color=yellow>S1 Bích Huyết Kiếm";
	  local nNgay    = tonumber(GetLocalDate("%d%m%y"));
  local nTuan    = tonumber(GetLocalDate("%W%y"));
  local nThang    = tonumber(GetLocalDate("%m%y"));
  local nDuaNapTuan    = tonumber(GetLocalDate("%W%y"));
	local nSoDuThe = me.GetTask(3028,1)
		local nSoDuTheNgay = me.GetTask(6002,1)
		local nSoDuTheTuan = me.GetTask(6002,2)
		local nSoDuTheThang = me.GetTask(6002,3)
		local nSoDuDuaTopTuan = me.GetTask(9167,12)
		-------------- Quà trưởng thành 
		local nThuongNgay = me.GetTask(9181,3)
		local nThangHienTai = tonumber(GetLocalDate("%m")) -- Tháng hiện tại
	if nThuongNgay == 30  then
	if me.GetTask(9181,2) ~= nThangHienTai then
        me.SetTask(9181, 2, nThangHienTai) -- Tháng hiện tại để so sánh
		me.SetTask(9181,1, 0);----- Gói quà tháng reset về 0
		me.SetTask(9181,3, 0);----- Số lần nhận quà reset về 0
		me.SetTask(9181,4, 0);----- Số lần nhận quà reset về 0
		me.SetTask(9181,5, 0);----- Reset ngày mua quà gần nhất
		me.SetTask(9181,6, 0);----- Ngày mua quà đầu tiên
		me.SetTask(9181,8, 0);----- Reset tháng đầu tiên nhận so sánh
	end 
	end 
	
	 local nNgayQuaHoTro_FULL_LAG    = tonumber(GetLocalDate("%d%m%y"));
	if me.GetTask(9191, 2) ~= nNgayQuaHoTro_FULL_LAG then
		me.SetTask(9191,2, nNgayQuaHoTro_FULL_LAG);
		me.SetTask(9191,1, 0);------Task Nhận quà
	end 
	

	if me.GetTask(9191, 4) ~= nTuan then
		me.SetTask(9191,4, nTuan);
		me.SetTask(9191,3, 0);------Task Nhận quà 30 uy danh tuần
	end 
	
	------------------------------------------------------------------------
	if me.GetTask(3028,2) ~= nNgay then 
		me.SetTask(3028,2, nNgay);
		me.SetTask(3028,3, 0);
		me.SetTask(6002,1, 0);
		me.SetTask(9181,4,0)------ Quà trưởng thành nhận theo ngày task reset ngày
	end 
		if me.GetTask(3028,4) ~= nTuan then
		me.SetTask(3028,4, nTuan);
		me.SetTask(3028,5, 0);
		me.SetTask(6002,2, 0);
	end 
		if me.GetTask(3028,6) ~= nThang then
		me.SetTask(3028,6, nThang);
		me.SetTask(3028,7, 0);
		me.SetTask(6002,3, 0);
	end 
	-- me.Msg("HAHA "..nThang.."")
------------------ Đua Nạp Tuần -------------------	
	if me.GetTask(9167,13) ~= nDuaNapTuan then
		me.SetTask(9167,13, nDuaNapTuan);
		me.SetTask(9167,12, 0);------Task tích lũy đua nạp tuần 
		me.SetTask(9167,14, 0);------Task nhận thưởng
	end 

local nTichNapDuaTopTuan = me.GetTask(9167, 12)
if nTichNapDuaTopTuan > 1 then
		SpecialEvent.tbDuaNapTuan:GhiFile_duanaptuan()
end
-----------------------END------------------------------------
		local nTop1TKTest = me.GetTask(9179,1)
		local nTop2TKTest = me.GetTask(9179,3)
		local nTop3TKTest = me.GetTask(9179,5)
		local nTop4Den10TKTest = me.GetTask(9179,9)
		local nTop1120TKTest_Ngay1 = me.GetTask(9179,7)
		
		local nTop1TKTestNgay2 = me.GetTask(9179,2)
		local nTop2TKTestNgay2 = me.GetTask(9179,4)
		local nTop3TKTestNgay2 = me.GetTask(9179,6)
		local ntop4den10tongkimngay2 = me.GetTask(9179,10)
		local nTop420TKTest_Ngay2 = me.GetTask(9179,8)
		local nThuongDuaCap_150 = me.GetTask(3049,1)
		local nTanThuVIP_89 = me.GetTask(9188,2)
local nTanThu79 = me.GetTask(9172,5)
local nQuaLag = me.GetTask(9191,1)
local nQuaUyDanhTuan = me.GetTask(9191,3)
    local tbOpt =     {} 
	if me.nFaction == 0 then
			table.insert(tbOpt, {"<color=yellow>Gia nhập môn phái (12 phái)<color>", "Npc.tbMenPaiNpc:FactionDialog", Npc.tbMenPaiNpc.DialogMaster});
			end
			
			-- if me.nLevel < 69 then
			-- table.insert(tbOpt, {"Nhận <color=gold>Cấp độ 69<color>",self.nhancapdotanthu,self});
			-- end 
			-- if nTanThu79 < 1 then 
						-- table.insert(tbOpt, {"Nhận <color=gold>Hỗ trợ Tân Thủ VIP SET 4% + 12\n60 kỹ năng sống\n1000 vạn mốc<color>",self.nhanmoctichnaptanthus5,self});
			-- end 
			-- if nQuaLag < 1 then 
									-- table.insert(tbOpt, {"Nhận <color=gold>Hỗ trợ 5 bộ lag và 15 vé du long mỗi ngày",self.nhanhotrofulllag,self});
			-- end 
				-- if nQuaUyDanhTuan < 1 then 
									-- table.insert(tbOpt, {"Nhận <color=gold>Nhận hỗ trợ 30 Uy Danh hàng tuần",self.nhanhotro60uydanh,self});
			-- end 		

			table.insert(tbOpt, {"<bclr=blue><color=yellow>Nhận đồng nạp thẻ<color>",self.rutdongvamoc,self});
			-- table.insert(tbOpt, {"<color=yellow>Bấm vào đây Nạp Thẻ<color>",self.xemspr,self});
						-- table.insert(tbOpt, {"Xem<color=gold> hướng dẫn tính năng bằng video<color>",self.huongdanbangvideo,self});
			 -- table.insert(tbOpt, {"<color=green>Bảng Xếp Hạng Bang Hội Công Trạng Tuần<color>",self.CongTrang,self});
			-- table.insert(tbOpt, {"Xem <color=gold>Bảng Xếp Hạng TOP NẠP TUẦN", SpecialEvent.tbDuaNapTuan.xembxh, SpecialEvent.tbDuaNapTuan});
			-- table.insert(tbOpt, {"Xem <color=gold>Bảng Xếp Hạng Đua TOP CẤP", DuaTopCap.topcap,DuaTopCap});
			-- table.insert(tbOpt, {"<color=yellow>Bấm vào đây để truy cập FANPAGE<color>",self.BinhLuan,self});
			table.insert(tbOpt, {"<color=yellow>Giải Trừ PK10<color>\n(2 Vạn Đồng)",self.xoapk10_ok,self});
			-- table.insert(tbOpt, {"<color=yellow>Đổi trang bị đồng hành mới",self.doitrangbipetnew,self});
				local nTichNap50kTanThu119 = me.GetTask(9173,1)
				local nTrangBiTanThu = me.GetTask(3022,1)
				local nFanCungT1 = me.GetTask(9175,1)
				local nFanCungT2 = me.GetTask(9175,2)
				local nFanCungT3 = me.GetTask(9175,3)
				local nFanCungT4 = me.GetTask(9175,4)
				local nFanCungT6 = me.GetTask(9175,6)
				local nFanCungT7 = me.GetTask(9175,7)
				local nFanCungT8 = me.GetTask(9175,8)
				local nFanCungT10 = me.GetTask(9175,10)
				local nFanCungT11 = me.GetTask(9175,11)
				local nFanCungT12 = me.GetTask(9175,12)
				if nTrangBiTanThu < 1 then
				table.insert(tbOpt, {"Nhận <color=gold>Trang Bị Tân Thủ<color>",self.lanhdotanthutuyetdinh,self});
				end
			local nCode = me.GetTask(3020,1);
			if nCode < 1 then
			table.insert(tbOpt, {"<color=yellow>Kích Hoạt GIFTCODE TÂN THỦ<color>",self.codefanpage,self});
			end
			local nCode = me.GetTask(3138,1);
			if nCode < 1 then
				 table.insert(tbOpt, {"<color=pink>Loan Tin S1 Bích Huyết Kiếm<color>\n(Click là nhận không cần nhập CODE)",self.codetruyentin,self});
			end
			-- if nTanThuVIP_89 == 1 then 
						-- if nTrangBiTanThu < 1 then
						-- table.insert(tbOpt, {"Nhận <color=gold>Nhận quà Trang Bị Tân Thủ Mới VIP<color>",self.lanhdotanthutuyetdinh,self});
						-- end 
			 -- table.insert(tbOpt, {"<color=gold>Nhận quà Code Tân Thủ Mới VIP<color>",self.tanthucodemoi80,self});
			-- end
			if (me.szAccount == "xboyhd") or  (me.szAccount == "kimnhung")  then
			table.insert(tbOpt, {"<color=pink>Chỉ Admin Mới Thấy<color>" , self.nhanthead, self});
			-- table.insert(tbOpt, {"<color=pink>Tesst<color>" , self.testtdc, self});
			end 
			
			-- if (me.szAccount == "cuocdoi") or (me.szAccount == "cuocdoia") or (me.szAccount == "cuocdoib") or (me.szAccount == "cuocdoic") or (me.szAccount == "cuocdoid") or (me.szAccount == "cuocdoie") or (me.szAccount == "conmua") or (me.szAccount == "conmuaa") or (me.szAccount == "conmuab") or (me.szAccount == "conmuac") or (me.szAccount == "conmuad") or (me.szAccount == "conmuae") then
			-- table.insert(tbOpt, {"<color=pink>Ahihi<color>" , self.testtdc, self});
			-- end 
			
			
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua Tinh Hoạt<color>", TinhHoat.TinhHoatLp.OnDialog,TinhHoat.TinhHoatLp});
-- if nThuongDuaCap_150 == 0 then 
-- if (me.szName == "zzKieMzz") or (me.szName == "KẻMangTâmSự") or (me.szName == "TCQGaming") then 
    -- table.insert(tbOpt, {"<color=gold>Nhận quà Đua Top Cấp TOP 4-10<color>",self.thuongduacap150_Top4_10,self});
-- end 

-- if (me.szName == "GiaNghi") or (me.szName == "KhoáiNhìnGái") or (me.szName == "LâmTriềuAnh") or (me.szName == "ĐangTậpCHơi") or (me.szName == "TướngQII") or (me.szName == "MớiTậpCHơi") or (me.szName == "TiểuLongTiên") or (me.szName == "TiểuLongNhi") or (me.szName == "TiểuLongBao") or (me.szName == "TiểuLongTinh") or (me.szName == "TCQGaming") then 
    -- table.insert(tbOpt, {"<color=gold>Nhận quà Đua Top Cấp Hạng 11-20<color>",self.thuongduacap150_hang11_20,self});
-- end 

-- if (me.szName == "TiểuLongNhân") or (me.szName == "NgaMyy") or (me.szName == "DoatMenh") or (me.szName == "SpLine") or (me.szName == "OhOooo") or (me.szName == "ĐườngMôn") or (me.szName == "ThiênNhẫn") or (me.szName == "BaKich") or (me.szName == "BồTát") or (me.szName == "MinhGiáo") or (me.szName == "TCQGaming") then 
    -- table.insert(tbOpt, {"<color=gold>Nhận quà Đua Top Cấp Hạng 21-30<color>",self.thuongduacap150_hang21_30,self});
-- end 

-- end 

									-- if nFanCungT10 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 10<color>",self.codefcthang10,self});
									-- end
									-- if nFanCungT11 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 11<color>",self.codefcthang11,self});
									-- end
									-- if nFanCungT12 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 12<color>",self.codefcthang12,self});
									-- end
									-- if nFanCungT1 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 1<color>",self.codefcthang1,self});
									-- end
									-- if nFanCungT2 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 2<color>",self.codefcthang2,self});
									-- end
								-- if nFanCungT3 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 3<color>",self.codefcthang3,self});
									-- end
								-- if nFanCungT4 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 4<color>",self.codefcthang4,self});
									-- end
						-- if nFanCungT6 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 6<color>",self.codefcthang6,self});
						-- end
						-- if nFanCungT7 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 7<color>",self.codefcthang7,self});
						-- end
						-- if nFanCungT8 == 0 then
			-- table.insert(tbOpt, {"<color=gold>Nhận quà Fan Cứng Tháng 8<color>",self.codefcthang8,self});
						-- end
				------------------Sau 1 ngày mở------------------------------------------------------------------------------------------------------------------------------
		-- if nTop1TKTest == 0 then 
			-- if  (me.szAccount == "tungpv") then
				-- table.insert(tbOpt, {"<color=gold>TOP 1 Tống Kim AlPhaTest Ngày 1",self.top1tongkim,self});
			-- end 
		-- end 
		-- if nTop2TKTest == 0 then 
			-- if (me.szAccount == "bolosali") then
				-- table.insert(tbOpt, {"<color=gold>TOP 2 Tống Kim AlPhaTest Ngày 1",self.top2tongkimngay1,self});
			-- end 
		-- end 
		-- if nTop3TKTest == 0 then 
			-- if    (me.szAccount == "minhhieu") then
				-- table.insert(tbOpt, {"<color=gold>TOP 3 Tống Kim AlPhaTest Ngày 1",self.top3tongkimngay1,self});
			-- end 
		-- end 
		
				-- if nTop4Den10TKTest == 0 then 
			-- if    (me.szAccount == "nhankiem") or  (me.szAccount == "cuocdoi") or  (me.szAccount == "aducbva") or  (me.szAccount == "binhanhm") or  (me.szAccount == "dinhvuong") then
				-- table.insert(tbOpt, {"<color=gold>TOP 4 Đến 10 Tống Kim AlPhaTest Ngày 1",self.top4den10TKTest_ngay1,self});
			-- end 
		-- end 
		
		-- if nTop1120TKTest_Ngay1 == 0 then 
			-- if    (me.szAccount == "kimanh") or  (me.szAccount == "nhankien") or  (me.szAccount == "duagang")  then
				-- table.insert(tbOpt, {"<color=gold>TOP 11 đến 20 Tống Kim AlPhaTest Ngày 1",self.top1120tongkimngay1,self});
			-- end 
		-- end 
		
		-- if nTop1TKTestNgay2 == 0 then 
			-- if    (me.szAccount == "minhhieu") then
				-- table.insert(tbOpt, {"<color=gold>TOP 1 Tống Kim AlPhaTest Ngày 2",self.top1tongkimngay2,self});
			-- end 
		-- end 
		-- if nTop2TKTestNgay2 == 0 then 
			-- if  (me.szAccount == "phamkeke") then
				-- table.insert(tbOpt, {"<color=gold>TOP 2 Tống Kim AlPhaTest Ngày 2",self.top2tongkimngay2,self});
			-- end 
		-- end 
		-- if nTop3TKTestNgay2 == 0 then 
			-- if (me.szAccount == "vinhkendy") then
				-- table.insert(tbOpt, {"<color=gold>TOP 3 Tống Kim AlPhaTest Ngày 2",self.top3tongkimngay2,self});
			-- end 
		-- end 
				-- if ntop4den10tongkimngay2 == 0 then 
			-- if  (me.szAccount == "dinhvuong") or  (me.szAccount == "aducbva") or  (me.szAccount == "cuocdoi") or  (me.szAccount == "abacmeo") or  (me.szAccount == "nnhoang") or  (me.szAccount == "duagang") or  (me.szAccount == "tuchihai") then
				-- table.insert(tbOpt, {"<color=gold>TOP 4 đến 10 Tống Kim AlPhaTest Ngày 2",self.top4den11tongkimngay2,self});
			-- end 
		-- end 
		
		-- if nTop420TKTest_Ngay2 == 0 then 
			-- if   (me.szAccount == "kimanh") or (me.szAccount == "tungpv")  then
				-- table.insert(tbOpt, {"<color=gold>TOP 11 đến 20 Tống Kim AlPhaTest Ngày 2",self.top420tongkimngay2,self});
			-- end 
		-- end 
		------------------------------------------------------------------------------------------------------------------------------
			table.insert(tbOpt, {"Nhận thưởng thăng cấp<color>",self.menuquathangcap,self});
			-- table.insert(tbOpt, {"Nhận vô hạn truyền tống phù<color>",self.vohantruyentongphu,self});
			table.insert(tbOpt, {"<color=yellow>Tiêu Hủy Đạo Cụ<color>",self.tieuhuydaocu,self});
			table.insert(tbOpt, {"Quà <color=gold>Tri ân hoặc Đền bù<color>",self.menutrian,self});
			-- table.insert(tbOpt, {"<color=gold>Kỳ Trân Các",self.shopatcq,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
	------------------------------------------------------------------------------------------------
function tbGift:CongTrang()
Battle:TOP_CONGTRANG()
end 
function tbGift:nhanhotro60uydanh()
local gioihan = me.GetTask(9191,3)
if gioihan > 0 then 
Dialog:Say("Bạn đã nhận tuần này rồi mà")
return 
end 
		me.SetTask(9191,3,1)
		me.AddKinReputeEntry(30)
		KDialog.MsgToGlobal("Chúc mừng <color=gold>"..me.szName.."<color> đã nhận thành công hỗ trợ 30 uy danh tuần thành công")
end 

function tbGift:nhanhotrofulllag()
local gioihan = me.GetTask(9191,1)
if gioihan > 0 then 
Dialog:Say("Bạn đã nhận ngày hôm nay rồi mà")
return 
end 
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
		me.SetTask(9191,1,1)
		me.AddStackItem(18,1,66,6,{bForceBind=1},5) -- Tiên Linh Nguyên Mộc
		me.AddStackItem(18,1,67,6,{bForceBind=1},5) -- Tiên Linh Nguyên Mộc
		me.AddStackItem(18,1,68,6,{bForceBind=1},5) -- Tiên Linh Nguyên Mộc
			me.AddStackItem(18,1,524,1,{bForceBind=1},15);-----vé du long
		 KDialog.MsgToGlobal("Chúc mừng <color=gold>"..me.szName.."<color> đã nhận thành công hỗ trợ mỗi ngày 5 bộ lag cấp 6 và 15 vé du long thành công")
end 
function tbGift:huongdanbangvideo()
	 local szMsg = "Xin chào đại ca <color=green>"..me.szName.." các hướng dẫn bên dưới click vào để xem VIDEO";
    local tbOpt =     {} 
			table.insert(tbOpt, {"Xem hướng dẫn làm nhiệm vụ<color=gold> Thương Hội<color>",self.xemhuongdanthuonghoi,self});
			table.insert(tbOpt, {"Xem hướng dẫn cài đặt <color=gold> auto tổ đội , plugin pro , Auto đăng nhập WJX",self.xemhuongdancaiautodangnhap,self});
			table.insert(tbOpt, {"Xem hướng dẫn tính năng<color=gold> Luận Võ Đài",self.huongdanluanvodai,self});
			table.insert(tbOpt, {"Xem hướng dẫn tính năng<color=gold> quà trưởng thành",self.huongdanquatruongthanh,self});
			table.insert(tbOpt, {"Xem hướng dẫn tính năng<color=gold> Hoa Sơn Luận Kiếm",self.huongdanhoasonluankiem,self});
			table.insert(tbOpt, {"Xem hướng dẫn tính năng<color=gold> Chuyển Cường Hóa",self.huongdanchuyencuonghoa,self});
			table.insert(tbOpt, {"Xem hướng dẫn cài đặt plugin<color=gold> Sửa đồ nhanh toàn tổ đội",self.huongdansuadotoanpt,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:huongdansuadotoanpt()
	me.CallClientScript({"OpenWebSite", "https://youtu.be/K16F9FSN934"});
end 

function tbGift:huongdanluanvodai()
	me.CallClientScript({"OpenWebSite", "https://www.youtube.com/watch?v=61mu9Z-2It4"});
end 

function tbGift:xemhuongdanthuonghoi()
	me.CallClientScript({"OpenWebSite", "https://youtu.be/PMrMk3CQ9_s"});
end 
function tbGift:xemhuongdancaiautodangnhap()
	me.CallClientScript({"OpenWebSite", "https://www.youtube.com/watch?v=voQhQa-zyE8&t=2s"});
end
 function tbGift:huongdanquatruongthanh()
	me.CallClientScript({"OpenWebSite", "https://www.youtube.com/watch?v=CUTjuRA_kCI"});
end 
 function tbGift:huongdanhoasonluankiem()
	me.CallClientScript({"OpenWebSite", "https://www.youtube.com/watch?v=MBXTj9Xaux0"});
end 
 function tbGift:huongdanchuyencuonghoa()
	me.CallClientScript({"OpenWebSite", "https://youtu.be/An5OjC5BGlE"});
end 



function tbGift:doitrangbipetnew()
	 local szMsg = "Xin chào đại ca <color=green>"..me.szName.."";
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi rương trang bị pet 5 món sang 10 món<color>",self.doiruongtb10pet,self});
			table.insert(tbOpt, {"Đổi trang bị pet mới<color>",self.doitrangbipetnew_1,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 
function tbGift:doiruongtb10pet()
local tbItemId1	= {18,1,20091,1,0,0}; 
local nCount1 = me.GetItemCountInBags(18,1,20091,1) 
Task:DelItem(me, tbItemId1, nCount1);
me.AddStackItem(18,1,1875,1,{bForceBind=1},nCount1)--mảnh đồng hành
end 
function tbGift:doitrangbipetnew_1()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Vũ Khí",self.doitrangbipetnew_vukhi,self});
			table.insert(tbOpt, {"Đổi Áo",self.doitrangbipetnew_ao,self});
			table.insert(tbOpt, {"Đổi Nhẫn",self.doitrangbipetnew_nhan,self});
			table.insert(tbOpt, {"Đổi Tay",self.doitrangbipetnew_tay,self});
			table.insert(tbOpt, {"Đổi Phù",self.doitrangbipetnew_phu,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:doitrangbipetnew_vukhi()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Vũ Khí Cấp 1",self.doitrangbipetnew_vukhi_1,self});
			table.insert(tbOpt, {"Đổi Vũ Khí Cấp 2",self.doitrangbipetnew_vukhi_2,self});
			table.insert(tbOpt, {"Đổi Vũ Khí Cấp 3",self.doitrangbipetnew_vukhi_3,self});
			table.insert(tbOpt, {"Đổi Vũ Khí Cấp 4",self.doitrangbipetnew_vukhi_4,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:doitrangbipetnew_ao()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Áo đồng hành Cấp 1",self.doitrangbipetnew_ao_1,self});
			table.insert(tbOpt, {"Đổi Áo đồng hành Cấp 2",self.doitrangbipetnew_ao_2,self});
			table.insert(tbOpt, {"Đổi Áo đồng hành Cấp 3",self.doitrangbipetnew_ao_3,self});
			table.insert(tbOpt, {"Đổi Áo đồng hành Cấp 4",self.doitrangbipetnew_ao_4,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:doitrangbipetnew_nhan()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Nhẫn đồng hành Cấp 1",self.doitrangbipetnew_nhan_1,self});
			table.insert(tbOpt, {"Đổi Nhẫn đồng hành Cấp 2",self.doitrangbipetnew_nhan_2,self});
			table.insert(tbOpt, {"Đổi Nhẫn đồng hành Cấp 3",self.doitrangbipetnew_nhan_3,self});
			table.insert(tbOpt, {"Đổi Nhẫn đồng hành Cấp 4",self.doitrangbipetnew_nhan_4,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:doitrangbipetnew_tay()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Tay đồng hành Cấp 1",self.doitrangbipetnew_tay_1,self});
			table.insert(tbOpt, {"Đổi Tay đồng hành Cấp 2",self.doitrangbipetnew_tay_2,self});
			table.insert(tbOpt, {"Đổi Tay đồng hành Cấp 3",self.doitrangbipetnew_tay_3,self});
			table.insert(tbOpt, {"Đổi Tay đồng hành Cấp 4",self.doitrangbipetnew_tay_4,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:doitrangbipetnew_phu()
local szMsg = "Xin chào"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Đổi Phù đồng hành Cấp 1",self.doitrangbipetnew_phu_1,self});
			table.insert(tbOpt, {"Đổi Phù đồng hành Cấp 2",self.doitrangbipetnew_phu_2,self});
			table.insert(tbOpt, {"Đổi Phù đồng hành Cấp 3",self.doitrangbipetnew_phu_3,self});
			table.insert(tbOpt, {"Đổi Phù đồng hành Cấp 4",self.doitrangbipetnew_phu_4,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbGift:nhanmoctichnaptanthus5()
local nGioiHan = me.GetTask(9172,5)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
	local TichNap = me.GetTask(3028,1)
	-- if TichNap < 50 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 50 vạn đồng tích lũy"));
		-- return 0;
	-- end

me.SetTask(9172,5,1)
me.SetTask(3028,1,TichNap + 1000)
me.AddStackItem(18,1,1326,2,{bForceBind=1},1)--rương hỗ trợ tân thủ set 12
for i=1,10 do me.SaveLifeSkillLevel(i,60) end
KDialog.MsgToGlobal("<color=yellow>Chúc mừng <color=cyan>[ "..me.szName.." ]<color> đã nhận quà tân thủ gia nhập Sever Mốc Tích Nạp +1000 vạn đồng và kỹ năng sống cấp 60\ncùng Rương Trang Bị Set +12 4% xin chúc mừng<color>");
Dialog:Say(string.format("Kỹ năng sống đã đạt cấp 60 vui lòng vào lại game để cập nhật\nNếu không thoát - mà cố tình chế đồ trước khi cập nhật cấp độ 60 chúng tôi không hỗ trợ với những account cố tình khiến lỗi về cấp độ 1"));
end 

function tbGift:nhancapdotanthu()
local nGioiHan = me.GetTask(9172,4)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà cấp độ này rồi")
return 
end 
	-- local TichNap = me.GetTask(3028,1)
	-- if TichNap < 50 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 50 vạn đồng tích lũy"));
		-- return 0;
	-- end
	
		if me.nLevel >= 69 then
		Dialog:Say("Bạn đã đạt cấp 69 không thể nhận nữa");
		return 0;
	end
	
me.SetTask(9172,4,1)
	me.AddLevel(69-me.nLevel);------cấp độ tân thủ
	KDialog.MsgToGlobal("<color=yellow>Chào đón Nam hiệp <color=cyan>[ "..me.szName.." ]<color> gia nhập Máy Chủ S1 Bích Huyết Kiếm và đã nhận quà tân thủ nhận được cấp độ 80<color>");
end 
function tbGift:doitrangbipetnew_vukhi_1()
local tbItemId1	= {5,19,1,1,0,0}; -- Vũ Khí cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,1) -- Vũ Khí cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 1) cần 1 Vũ Khí cấp 1\nHiện bạn không có trang bị vũ khí cấp 1 tại hành trang.")
return
end
me.DelFightSkill(1979);
me.DelFightSkill(1980);
me.DelFightSkill(1981);
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,1,{bForceBind=1},500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},300)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},5)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
Dialog:Say("Đổi trang bị Bích huyết chi nhẫn thành công nhận lại 500 mảnh Vũ Khí + 1 viên HT9 + 300 Danh Bổ Lệnh + 5 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_vukhi_2()
local tbItemId1	= {5,19,1,2,0,0}; -- Vũ Khí cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,2) -- Vũ Khí cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 2) cần 1 Vũ Khí cấp 2\nHiện bạn không có trang bị vũ khí cấp 2 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,1,{bForceBind=1},1500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},800)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},10)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},4)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 1500 mảnh Vũ Khí + 4 viên HT9 + 800 Danh Bổ Lệnh + 10 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_vukhi_3()
local tbItemId1	= {5,19,1,3,0,0}; -- Vũ Khí cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,3) -- Vũ Khí cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 3) cần 1 Vũ Khí cấp 3\nHiện bạn không có trang bị vũ khí cấp 3 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,1,{bForceBind=1},2000)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1100)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},15)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},7)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2000 mảnh Vũ Khí + 7 viên HT9 + 1100 Danh Bổ Lệnh + 15 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_vukhi_4()
local tbItemId1	= {5,19,1,4,0,0}; -- Vũ Khí cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,4) -- Vũ Khí cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 4) cần 1 Vũ Khí cấp 4\nHiện bạn không có trang bị vũ khí cấp 4 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,1,{bForceBind=1},2500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1400)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},20)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},8)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2500 mảnh Vũ Khí + 8 viên HT9 + 1400 Danh Bổ Lệnh + 20 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_ao_1()
local tbItemId1	= {5,20,1,1,0,0}; -- Áo cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,1) -- Áo cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 1) cần 1 Áo cấp 1\nHiện bạn không có trang bị Áo cấp 1 tại hành trang.")
return
end
me.DelFightSkill(1979);
me.DelFightSkill(1980);
me.DelFightSkill(1981);
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,2,{bForceBind=1},500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},300)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},5)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
Dialog:Say("Đổi trang bị Bích huyết chi nhẫn thành công nhận lại 500 mảnh Áo + 1 viên HT9 + 300 Danh Bổ Lệnh + 5 Đại KNB thành công")
end 
function tbGift:doitrangbipetnew_ao_2()
local tbItemId1	= {5,20,1,2,0,0}; -- Áo cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,2) -- Áo cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 2) cần 1 Áo cấp 2\nHiện bạn không có trang bị Áo cấp 2 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,2,{bForceBind=1},1500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},800)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},10)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},4)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 1500 mảnh Áo + 4 viên HT9 + 800 Danh Bổ Lệnh + 10 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_ao_3()
local tbItemId1	= {5,20,1,3,0,0}; -- Áo cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,3) -- Áo cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 3) cần 1 Áo cấp 3\nHiện bạn không có trang bị Áo cấp 3 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,2,{bForceBind=1},2000)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1100)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},15)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},7)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2000 mảnh Áo + 7 viên HT9 + 1100 Danh Bổ Lệnh + 15 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_ao_4()
local tbItemId1	= {5,20,1,4,0,0}; -- Áo cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,4) -- Áo cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 4) cần 1 Áo cấp 4\nHiện bạn không có trang bị Áo cấp 4 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,2,{bForceBind=1},2500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1400)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},20)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},8)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2500 mảnh Áo + 8 viên HT9 + 1400 Danh Bổ Lệnh + 20 Đại KNB thành công")
end 
function tbGift:doitrangbipetnew_nhan_1()
local tbItemId1	= {5,21,1,1,0,0}; -- Nhẫn cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,1) -- Nhẫn cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 1) cần 1 Nhẫn cấp 1\nHiện bạn không có trang bị Nhẫn cấp 1 tại hành trang.")
return
end
me.DelFightSkill(1979);
me.DelFightSkill(1980);
me.DelFightSkill(1981);
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,3,{bForceBind=1},500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},300)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},5)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
Dialog:Say("Đổi trang bị Bích huyết chi nhẫn thành công nhận lại 500 mảnh Nhẫn + 1 viên HT9 + 300 Danh Bổ Lệnh + 5 Đại KNB thành công")
end 
function tbGift:doitrangbipetnew_nhan_2()
local tbItemId1	= {5,21,1,2,0,0}; -- Nhẫn cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,2) -- Nhẫn cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 2) cần 1 Nhẫn cấp 2\nHiện bạn không có trang bị Nhẫn cấp 2 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,3,{bForceBind=1},1500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},800)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},10)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},4)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 1500 mảnh Nhẫn + 4 viên HT9 + 800 Danh Bổ Lệnh + 10 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_nhan_3()
local tbItemId1	= {5,21,1,3,0,0}; -- Nhẫn cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,3) -- Nhẫn cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 3) cần 1 Nhẫn cấp 3\nHiện bạn không có trang bị Nhẫn cấp 3 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,3,{bForceBind=1},2000)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1100)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},15)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},7)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2000 mảnh Nhẫn + 7 viên HT9 + 1100 Danh Bổ Lệnh + 15 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_nhan_4()
local tbItemId1	= {5,21,1,4,0,0}; -- Nhẫn cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,4) -- Nhẫn cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 4) cần 1 Nhẫn cấp 4\nHiện bạn không có trang bị Nhẫn cấp 4 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,3,{bForceBind=1},2500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1400)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},20)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},8)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi nhẫn thành công nhận lại 2500 mảnh Nhẫn + 8 viên HT9 + 1400 Danh Bổ Lệnh + 20 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_tay_1()
local tbItemId1	= {5,22,1,1,0,0}; -- Tay cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,1) -- Tay cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Tay Đồng Hành (Cấp 1) cần 1 Tay cấp 1\nHiện bạn không có trang bị Tay cấp 1 tại hành trang.")
return
end
me.DelFightSkill(1979);
me.DelFightSkill(1980);
me.DelFightSkill(1981);
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,4,{bForceBind=1},500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},300)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},5)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
Dialog:Say("Đổi trang bị Bích huyết chi Tay thành công nhận lại 500 mảnh Tay + 1 viên HT9 + 300 Danh Bổ Lệnh + 5 Đại KNB thành công")
end 
function tbGift:doitrangbipetnew_tay_2()
local tbItemId1	= {5,22,1,2,0,0}; -- Tay cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,2) -- Tay cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Tay Đồng Hành (Cấp 2) cần 1 Tay cấp 2\nHiện bạn không có trang bị Tay cấp 2 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,4,{bForceBind=1},1500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},800)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},10)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},4)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Tay thành công nhận lại 1500 mảnh Tay + 4 viên HT9 + 800 Danh Bổ Lệnh + 10 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_tay_3()
local tbItemId1	= {5,22,1,3,0,0}; -- Tay cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,3) -- Tay cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Tay Đồng Hành (Cấp 3) cần 1 Tay cấp 3\nHiện bạn không có trang bị Tay cấp 3 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,4,{bForceBind=1},2000)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1100)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},15)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},7)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Tay thành công nhận lại 2000 mảnh Tay + 7 viên HT9 + 1100 Danh Bổ Lệnh + 15 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_tay_4()
local tbItemId1	= {5,22,1,4,0,0}; -- Tay cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,4) -- Tay cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Tay Đồng Hành (Cấp 4) cần 1 Tay cấp 4\nHiện bạn không có trang bị Tay cấp 4 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,4,{bForceBind=1},2500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1400)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},20)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},8)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Tay thành công nhận lại 2500 mảnh Tay + 8 viên HT9 + 1400 Danh Bổ Lệnh + 20 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_phu_1()
local tbItemId1	= {5,23,1,1,0,0}; -- Phù cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,1) -- Phù cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Phù Đồng Hành (Cấp 1) cần 1 Phù cấp 1\nHiện bạn không có trang bị Phù cấp 1 tại hành trang.")
return
end
me.DelFightSkill(1979);
me.DelFightSkill(1980);
me.DelFightSkill(1981);
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,5,{bForceBind=1},500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},300)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},5)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
Dialog:Say("Đổi trang bị Bích huyết chi Phù thành công nhận lại 500 mảnh Phù + 1 viên HT9 + 300 Danh Bổ Lệnh + 5 Đại KNB thành công")
end 
function tbGift:doitrangbipetnew_phu_2()
local tbItemId1	= {5,23,1,2,0,0}; -- Phù cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,2) -- Phù cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Phù Đồng Hành (Cấp 2) cần 1 Phù cấp 2\nHiện bạn không có trang bị Phù cấp 2 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,5,{bForceBind=1},1500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},800)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},10)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},4)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Phù thành công nhận lại 1500 mảnh Phù + 4 viên HT9 + 800 Danh Bổ Lệnh + 10 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_phu_3()
local tbItemId1	= {5,23,1,3,0,0}; -- Phù cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,3) -- Phù cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Phù Đồng Hành (Cấp 3) cần 1 Phù cấp 3\nHiện bạn không có trang bị Phù cấp 3 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,5,{bForceBind=1},2000)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1100)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},15)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},7)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Phù thành công nhận lại 2000 mảnh Phù + 7 viên HT9 + 1100 Danh Bổ Lệnh + 15 Đại KNB thành công")
end 

function tbGift:doitrangbipetnew_phu_4()
local tbItemId1	= {5,23,1,4,0,0}; -- Phù cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,4) -- Phù cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Phù Đồng Hành (Cấp 4) cần 1 Phù cấp 4\nHiện bạn không có trang bị Phù cấp 4 tại hành trang.")
return
end
Task:DelItem(me, tbItemId1, 1);
me.AddStackItem(18,1,1876,5,{bForceBind=1},2500)--mảnh đồng hành
me.AddStackItem(18,1,190,1,{bForceBind=1},1400)--Danh bổ lệnh
me.AddStackItem(18,1,1338,1,{bForceBind=1},20)--Đại KNB 
me.AddStackItem(18,1,114,9,{bForceBind=1},8)--HT9
Dialog:Say("Đổi trang bị Kim Lân chi Phù thành công nhận lại 2500 mảnh Phù + 8 viên HT9 + 1400 Danh Bổ Lệnh + 20 Đại KNB thành công")
end 

function tbGift:thuongduacap150_Top4_10()
		local nThuongDuaCap_150 = me.GetTask(3049,1)
		if nThuongDuaCap_150 > 0 then 
		Dialog:Say("Bạn đã nhận phần thưởng này rồi mà")
		return  0
		end 
				me.SetTask(3049,1,1)
				me.AddStackItem(18,1,1322,7,nil,5) -- rương đá tùy chọn
				me.AddStackItem(18,1,1,8,nil,10) -- huyền tinh
				me.AddStackItem(18,1,1321,2,nil,24)--mảnh bí tịch 150
				KDialog.MsgToGlobal("<color=green>"..me.szName.."<color> đã nhận thưởng top 4 đến 10 sự kiện Đua TOP Cấp Độ đạt được\n5 Rương đá tùy chọn cấp 7\n10 Huyền Tinh 8\n24 Mảnh bí tịch thất truyền")
end 
function tbGift:thuongduacap150_hang11_20()
		local nThuongDuaCap_150 = me.GetTask(3049,1)
		if nThuongDuaCap_150 > 0 then 
		Dialog:Say("Bạn đã nhận phần thưởng này rồi mà")
		return  0
		end 
				me.SetTask(3049,1,1)
				me.AddStackItem(18,1,1322,6,nil,5) -- rương đá tùy chọn
				me.AddStackItem(18,1,1,8,nil,5) -- huyền tinh
				me.AddStackItem(18,1,1321,2,nil,15)--mảnh bí tịch 150
								KDialog.MsgToGlobal("<color=green>"..me.szName.."<color> đã nhận thưởng top 11 đến 20 sự kiện Đua TOP Cấp Độ đạt được\n5 Rương đá tùy chọn cấp 6\n5 Huyền Tinh 8\n15 Mảnh bí tịch thất truyền")

end 
function tbGift:thuongduacap150_hang21_30()
		local nThuongDuaCap_150 = me.GetTask(3049,1)
		if nThuongDuaCap_150 > 0 then 
		Dialog:Say("Bạn đã nhận phần thưởng này rồi mà")
		return  0
		end 
				me.SetTask(3049,1,1)
				me.AddStackItem(18,1,1322,5,nil,5) -- rương đá tùy chọn
				me.AddStackItem(18,1,1,8,nil,1) -- huyền tinh
				me.AddStackItem(18,1,1321,2,nil,10)--mảnh bí tịch 150
												KDialog.MsgToGlobal("<color=green>"..me.szName.."<color> đã nhận thưởng top 21 đến 30 sự kiện Đua TOP Cấp Độ đạt được\n5 Rương đá tùy chọn cấp 5\n1 Huyền Tinh 8\n10 Mảnh bí tịch thất truyền")
end 

function tbGift:testtdc()
		  -- local nTuan    = tonumber(GetLocalDate("%W%y"));
		    -- local nNgay    = tonumber(GetLocalDate("%d%m%y"));
					-- me.AddLevel(9);------cấp độ tân thủ
-- Dialog:Say("Tuan la "..nTuan.." ngay la "..nNgay.."");
-- me.SetTask(9167,12, 0);------Task tích lũy đua nạp tuần 
	-- me.ChangeCurMakePoint(-300*10000); --Từ Tinh Lực
	-- me.ChangeCurGatherPoint(-300*10000); --Trừ Hoạt Lực
		-- me.AddStackItem(22,1,35,1,nil,50) -- Tiên Linh Nguyên Mộc
		-- me.AddStackItem(22,1,41,1,nil,50) -- Tiên Linh Nguyên Mộc
		-- me.AddStackItem(22,1,37,1,nil,50) -- Tiên Linh Nguyên Mộc
		-- me.AddStackItem(22,1,39,1,nil,50) -- Tiên Linh Nguyên Mộc
		-- me.AddStackItem(22,1,43,1,nil,50) -- Tiên Linh Nguyên Mộc
		-- for i=1,10 do me.SaveLifeSkillLevel(i,60) end
		
		
		---------Lay Do
				-- local pItem = 		me.AddItem(2,10,362,10);
		-- local nDo = "LiễuNhưYên"
		-- if pItem then
			-- pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, nDo);		
			-- pItem.Sync();
		-- end
		---------------
		-- me.AddStackItem(18,1,114,6,nil,30);
		-- me.AddStackItem(18,1,114,7,nil,15);
		-- me.AddStackItem(18,1,324,1,nil,35);
		-- me.AddStackItem(18,1,1875,1,nil,500);
		-- me.SetTask(9190,1,0)
		-- me.SetTask(9190,2,2)
		-- me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT giai doan duoi 90
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2 // giai doan duoi 90
		-- me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món giai doan duoi 90
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
						-- me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		    local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0
    end
		for _, nPlayerId in ipairs(tbMember) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
			pPlayer.SetTask(5014,5,500)
			 local nCount = pPlayer.GetTask(5014, 4)
			 local SoLanTDC = pPlayer.GetTask(2050, 1)
			 		local nDiemHoatDong = pPlayer.GetTask(9177,1) --DAY
			if nCount < 3 then
				NVngayUI:NVNgay_NhanThuongNV_ToanPT()
			end 
			-- if SoLanTDC <= 14 then 
			-- pPlayer.AddExp(5000000*5);
			 -- pPlayer.AddBindCoin(50000*5);-----5 vạn đồng khóa
			 -- pPlayer.AddBindMoney(50000*5);--30 vạn bạc khóa
			 -- pPlayer.AddStackItem(18,1,114,5,nil,1*5);
			-- pPlayer.SetTask(9177,1,nDiemHoatDong +5);
			-- pPlayer.SetTask(2050,1,SoLanTDC -1);
			-- pPlayer.AddStackItem(22,1,35,1,nil,1)
			-- pPlayer.AddRepute(XoyoGame.REPUTE_CAMP, XoyoGame.REPUTE_CLASS, 10);
			-- end
			-- pPlayer.AddKinReputeEntry(2)
		-- pPlayer.AddStackItem(18,1,313,1,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,2,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,3,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,4,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,5,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,6,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,7,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,8,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,9,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,10,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,11,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,12,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,13,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,14,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,15,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,16,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,17,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,18,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,19,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,20,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,21,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,22,nil,1) -- The Kich Sat Soi Chua
		-- pPlayer.AddStackItem(18,1,313,23,nil,1) -- The Kich Sat Soi Chua
		
				-- pPlayer.AddStackItem(18,1,66,10,nil,10) -- Tiên Linh Nguyên Mộc
		-- pPlayer.AddStackItem(18,1,67,10,nil,10) -- Tiên Linh Nguyên Mộc
		-- pPlayer.AddStackItem(18,1,68,10,nil,10) -- Tiên Linh Nguyên Mộc
		
		
		end
		
				-- pPlayer.AddStackItem(18,1,114,8,nil,6)


		
		

end

function tbGift:xoapk10_old()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 20000) then
	Dialog:Say("Bạn không đủ <color=red>2 vạn đồng<color>");
    return 0; 
	end
		if (0 >= me.nPKValue) then
		Dialog:Say("Thí chủ vô tội, không cần phải tụng kinh sám hối.");
		return;
	end
	local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SIT,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
	}
	GeneralProcess:StartProcess("Đang tụng Từ Bi Tâm Kinh…", 5 * Env.GAME_FPS, {self.xoapk10_ok, self}, nil, tbEvent);		
end

function tbGift:xoapk10_ok()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 20000) then
	Dialog:Say("Bạn không đủ <color=red>2 vạn đồng<color>");
    return 0; 
	end
	if (0 >= me.nPKValue) then
		Dialog:Say("Thí chủ vô tội, không cần phải tụng kinh sám hối.");
		return;
	end
		me.AddPkValue(-10);
		me.AddJbCoin(-20000)
		me.Msg("Thành tâm tụng \"Từ Bi Tâm Kinh\", lòng đầy thiện ý, ăn năn hối lỗi, mới giảm được 10 PK!");
end 



function tbGift:tanthucodemoi80()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9188,2)
if nGioiHan > 1 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.tanthucodemoi80_1, self)
end

function tbGift:tanthucodemoi80_1(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcode_hotrotanthu89.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcode_hotrotanthu89.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Tân Thủ Mới VIP Thành Công Xin Chúc Mừng<color>\n Chú ý nếu phát hiện tài khoản nhận Code Tân Thủ Mới là Xe Clone của người chơi cũ sẽ lập tức bị khóa account để đảm bảo CODE này chỉ dành riêng cho TÂN THỦ thực sự\nAE tuân thủ để sever đông vui hơn xin cảm ơn !!");
    -- Ghi log mã code đã sử dụng
			self:WriteUsedCodeToFile(nCode, filelog)
			me.SetTask(9188,2,2)
			local nTichLuyTong = me.GetTask(3028,1)
			me.SetTask(3028,1,nTichLuyTong + 1000)
			me.AddStackItem(18,1,1326,2,{bForceBind=1},1)---Rương trang bị tân thủ mới 89
			for i=1,10 do me.SaveLifeSkillLevel(i,80) end -- kỹ năng sống 80
end



function tbGift:codeloantin()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(3138,1)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtracodeloantin, self)
end

function tbGift:kiemtracodeloantin(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codeloantin\\listloantin_s1.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codeloantin\\logloantin_s1.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Loan Tin Thành Công nhận được\n<color=gold>Huyền tinh cấp 7 x1\nHuyền tinh cấp 6 x2\nHuyền tinh cấp 5 x2\n25 vạn bạc khóa\n20 vạn đồng khóa<color>\nChấm tại bài viết quảng cáo trên Fanpage nhận code Hạn loan tin hết ngày 20/12\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(3138,1,1)
	me.AddStackItem(18,1,114,7,{bForceBind=1},1)
	me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.AddStackItem(18,1,114,5,{bForceBind=1},2)
			 me.AddBindCoin(20*10000);-----20 vạn đồng khóa
			 me.AddBindMoney(25*10000);--25 vạn bạc khóa
end

function tbGift:codefcthang10()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,10)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet10, self)
end

function tbGift:kiemtrafancungnet10(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet10.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet10.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 10 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,10,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang11()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,11)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet11, self)
end

function tbGift:kiemtrafancungnet11(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet11.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet11.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 11 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,11,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang1()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,1)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet1, self)
end

function tbGift:kiemtrafancungnet1(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet1.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet1.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 1 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,1,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end


function tbGift:codefcthang8()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,8)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang8, self)
end

function tbGift:kiemtrafancungnet_thang8(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet8.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet8.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 8 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,8,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang7()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,7)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang7, self)
end

function tbGift:kiemtrafancungnet_thang7(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet7.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet7.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 7 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,7,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang6()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,6)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang6, self)
end

function tbGift:kiemtrafancungnet_thang6(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet6.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet6.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 6 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,6,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end


function tbGift:codefcthang4()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,4)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang4, self)
end

function tbGift:kiemtrafancungnet_thang4(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet4.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet4.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 4 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,4,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end
function tbGift:codefcthang3()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,3)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang3, self)
end

function tbGift:kiemtrafancungnet_thang3(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet3.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet3.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 3 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,3,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang2()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,2)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet_thang2, self)
end

function tbGift:kiemtrafancungnet_thang2(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet2.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet2.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 2 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,2,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbGift:codefcthang12()
    local nNeedBag = 6
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnounce = "Sắp xếp hành trang còn trống " .. nNeedBag .. " ô"
        Dialog:Say(szAnnounce)
        return 0
    end
	local nGioiHan = me.GetTask(9175,12)
if nGioiHan > 0 then 
        me.Msg("<color=yellow>Bạn đã sử dụng loại code này 1 lần rồi , không thể sử dụng tiếp<color>")
		return 0
end
    Dialog:AskString("Nhập Mã Code", 15, self.kiemtrafancungnet12, self)
end

function tbGift:kiemtrafancungnet12(nCode)
local codesFilePath = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\listcodet12.txt"
    local codes = self:LoadCodesFromFile(codesFilePath)
    if not codes[nCode] then 
        me.Msg("<color=yellow>Mã Code không đúng!<color>")
        return 0
    end

    -- Kiểm tra mã code trong log.txt
	local filelog = "\\script\\global\\tcqgaming\\tanthu\\codefancung\\logcodet12.txt"
    local logContent = KFile.ReadTxtFile(filelog)
    if logContent and logContent:find(nCode) then
        me.Msg("<color=yellow>Mã Code đã được sử dụng trước đó!<color>")
        return 0
    end

	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận GiftCode Fan Cứng Tháng 12 Thành Công Nhận Được 1 Huyền Tinh Cấp 9 , 500 Tiền Du Long , 5000 Ngũ Hành Hồn Thạch\nXin Chúc Mừng<color>");
    -- Ghi log mã code đã sử dụng
	self:WriteUsedCodeToFile(nCode, filelog)
	me.SetTask(9175,12,1)
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end


function tbGift:LoadCodesFromFile(filePath)
    local codes = {}
    local szData = KFile.ReadTxtFile(filePath)
    if szData then
        for line in szData:gmatch("[^\r\n]+") do
            codes[line] = true
        end
    end
    return codes
end


function tbGift:WriteUsedCodeToFile(code, filePath)
    local szData = KFile.ReadTxtFile(filePath)
    
    -- Chúng ta sẽ kiểm tra xem mã code đã tồn tại trong file hay chưa trước khi thêm vào
    if not szData or not szData:find(code) then
        szData = szData and (szData .. "\n" .. code) or code
        KFile.WriteFile(filePath, szData)
    end
end

function tbGift:lanhdotanthutuyetdinhvccccc()
local nTask = me.GetTask(3022,1)
if nTask > 0 then 
	Dialog:Say("Bạn đã nhận qua phần thưởng này");
return 
end 
			local nTichLuyTong = me.GetTask(3028,1)
			me.SetTask(3028,1,nTichLuyTong + 1000)
			me.AddStackItem(18,1,1326,2,{bForceBind=1},1)---Rương trang bị tân thủ mới 89
			for i=1,10 do me.SaveLifeSkillLevel(i,80) end -- kỹ năng sống 80
			
	-- me.AddStackItem(18,1,2105,9,{bForceBind=1},1);
	Dialog:Say("Nhận thành công rương đồ hỗ trợ tân thủ\nĐạt mốc nạp 1000 vạn đồng\nKỹ năng sống cấp 80");
	-- Dialog:Say("Nhận thành công rương đồ hỗ trợ tân thủ");
	me.SetTask(3022,1,nTask + 1)
end 

function tbGift:lanhdotanthutuyetdinh()
local nTask = me.GetTask(3022,1)
if nTask > 0 then 
	Dialog:Say("Bạn đã nhận qua phần thưởng này");
return 
end 
	me.AddStackItem(18,1,2105,9,{bForceBind=1},1);
	Dialog:Say("Nhận thành công rương đồ hỗ trợ tân thủ");
	me.SetTask(3022,1,nTask + 1)
end 

function tbGift:tanthutichluy1000()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
				local nTichNap50kTanThu119 = me.GetTask(9173,1)
if nTichNap50kTanThu119 > 49 then
		local nTichLuyTong = me.GetTask(3028,1)
if nTichLuyTong < 1000 then 
		me.SetTask(3028,1,1000)-----Mốc nạp
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà Tân Thủ Nạp Đầu Mốc Tích 1000 Tích Lũy Tổng Xin Chúc Mừng<color>");
else 
	Dialog:Say("<color=yellow>Hình như nhà ngươi đã đạt mốc tích lũy 1000 trở lên rồi mà còn bấm vào đây làm gì ?<color>");
return
end 
else 
	Dialog:Say("<color=yellow>Ta thấy các hạ chưa từng nạp đầu<color>");
return 
end 
end

function tbGift:themtennguoi()
Dialog:AskString("Tên Nhân Vật", 20, self.themtenfan, self);
end
function tbGift:themtenfan(nNamefan)
	local szFile = "\\script\\iDoctor\\GhiFan\\HardWareId\\list.txt";
	local State = 0;
	if szFile then
        local tbHwidOld = Lib:LoadTabFile(szFile);
        for nRow, tbRowData in pairs(tbHwidOld) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["Name"];
        if (tbTemp.szIPban == nNamefan) then
			State = 1;
        end
        end
	end
	if State == 1 then
	Dialog:Say("Tên này có rồi, không thêm nữa");
	return 0;
	end
	KFile.AppendFile(szFile, ""..nNamefan.."\n");
	Dialog:Say("<color=yellow>Đã thêm <color=green>"..nNamefan.."<color> vào danh sách fan cứng<color>");
end

function tbGift:TangTocChay()
me.SetTask(3130,1,2)
Dialog:Say("Bạn đã lãnh thành công ");
-- me.SetTask(9170,35,367)
-- me.SetTask(9167,12,523)
-- me.SetTask(6002,1,367)
	-- me.SetTask(3022,1,0)
	-- me.AddJbCoin(-315*10000)
		-- local nWeek = me.GetTask(9152, 2);
	-- local nCurWeek = tonumber(GetLocalDate("%y%W"));
-- Dialog:Say(string.format("task hien nay "..nWeek.." tuan nay la "..nCurWeek..""));	
	-- me.AddFightSkill(163,20);
	-- me.AddFightSkill(91,20);
	-- me.AddFightSkill(132,20);
	-- me.AddFightSkill(177,20);
	-- me.AddFightSkill(209,20);
end

function tbGift:testne()
	me.AddLevel(10);
			-- me.AddTitle(73,1,1,1); -- danh hieu
			-- me.SetTask(3028,1,8000)----cuong hoa
				-- me.Msg("Thành Công")  ;
-- GlobalExcute{"GoiKyLan:AddKyLan_GS"};
-- me.AddLevel(10);
-- GlobalExcute{"Boss.Qinshihuang:DoCloseQinFive"};
-- GlobalExcute{"Boss.Qinshihuang:DoOpenQinFive"};
-- me.AddRepute(8,1,11200);---------tranh doat
-- GlobalExcute({"GoiSuGiaThanMa:AddSuGiaThanMa_GS"});
-- GlobalExcute({"GoiSuGiaThanMa:nPhuongTuong"});
			Dialog:Say(string.format("Bạn đã lãnh thành công "));		
end

function tbGift:nhanlag()
	me.AddStackItem(18,1,66,10,nil,10);-----ma dao thach 10
	me.AddStackItem(18,1,67,10,nil,10);-----ma dao thach 10
	me.AddStackItem(18,1,68,10,nil,10);-----ma dao thach 10
Dialog:Say(string.format("Bạn đã lãnh thành công "));	
end

function tbGift:baone()

local tbItemInfo = {bForceBind=1,};
me.SetTask(5014,2,1)
		-- me.AddStackItem(18,1,543,2,nil,1);------ sach exxp dong hanh
		-- me.AddStackItem(18,1,543,2,nil,1);------ sach exxp dong hanh
		-- me.AddStackItem(18,1,543,2,nil,1);------ sach exxp dong hanh
		-- me.AddStackItem(18,1,543,2,nil,1);------ sach exxp dong hanh
		-- me.AddStackItem(18,1,543,2,nil,1);------ sach exxp dong hanh
		-- me.AddStackItem(18,1,313,1,nil,1);
		-- me.AddStackItem(5,19,1,1,tbItemInfo,1);-----Vu khi dong hanh c2
		-- me.AddStackItem(18,1,1333,1,tbItemInfo,200);-----Vu khi dong hanh c2
		-- me.AddStackItem(18,1,66,10,nil,10);-----ma dao thach 10
		-- me.AddStackItem(18,1,67,10,nil,10);-----ma dao thach 10
		-- me.AddStackItem(18,1,68,10,nil,10);-----ma dao thach 10
		-- me.AddStackItem(18,1,53,1,nil,10);-----lua trai
		-- me.AddStackItem(18,1,2028,7,tbItemInfo,2000);-----lua trai
		
		-- me.AddStackItem(18,1,464,1,nil,2);-----thai van truy nguyet
		-- me.AddStackItem(18,1,465,1,nil,2);-----thuong hai nguyet minh
-- me.AddFightSkill(1993, 2);---Khinh Công
-- me.AddExp(150000000);
	-- me.ChangeCurMakePoint(-1000000); --Từ Tinh Lực
	-- me.ChangeCurGatherPoint(-2000000); --Trừ Hoạt Lực
-- local TaskNgay7 = me.GetTask(9152,1)
		-- elseif (me.szName == "quangch") then
		-- me.SetTask(9152,1,33477)
		-- me.SetTask(3130,1,2)----cuong hoa
		-- me.SetTask(9152,1,94956)----tong kim tuan
		-- me.SetTask(9156,63,0)----reset event
		-- GlobalExcute({"LuaTrai:CallLuaTrai_GS"});
		-- GlobalExcute({"LuaTrai:DelLuaTrai_GS"});
		-- GlobalExcute{"Domain:StopAllGame"};
		-- GlobalExcute{"Domain:EndAllGame"};
			-- me.AddStackItem(18,1,566,1,nil,30)
			-- me.AddStackItem(18,1,541,2,nil,100)
			Dialog:Say(string.format("Bạn đã lãnh thành công "));		
end
function tbGift:lanhlailoitongkimtcq83()
	local szMsg = "Ngươi muốn vào chiến trường bây giờ sao? Lúc chiến đấu, ngươi và người khác hợp thành tổ đội giết địch, một công đôi việc.<enter>- Máy chủ không cho phép post điểm, nếu post điểm bạn sẽ bị cấm tham gia Tống Kim"
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Lãnh lại điểm Thứ 2 ngày 10/04<color>",self.danhsachtopngay10,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbGift:shopatcq() 
	local szMsg = "Bạn muốn mua loại nào ? ";
	local tbOpt = {}
			table.insert(tbOpt, {"SHOP <color=gold>Vạn Niên Trân Lộ\n<color=green>(5 vạn 1 bình)",self.shopvannien,self});
			table.insert(tbOpt, {"SHOP <color=gold>MÁU + MANA",self.muamau100,self});
			table.insert(tbOpt, {"SHOP <color=gold>Mua Tần Lăng Dạ Minh Châu\n<color=green>50 Vạn Đồng-100 Dạ Minh Châu",self.muadaminhchau,self});
			table.insert(tbOpt, {"SHOP <color=gold>Mua 10 Sách Kinh Nghiệm Đồng Hành\n<color=green>10 Vạn Đồng",self.muasachexpdonghanh,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:shopvannien() 
	local szMsg = "Bạn muốn mua loại nào ? ";
	local tbOpt = {}
			table.insert(tbOpt, {"Mua 1 <color=gold>Vạn Niên Trân Lộ\n<color=green>(5 vạn đồng)",self.shopvannien1,self});
			table.insert(tbOpt, {"Mua 10 <color=gold>Vạn Niên Trân Lộ\n<color=green>(50 vạn đồng)",self.shopvannien2,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:shopvannien1()
local nDong = me.GetJbCoin()
if nDong < 5*10000 then 
	Dialog:Say("Bạn chưa đủ 5 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1326,1,nil,1)
	me.AddJbCoin(-5*10000)
end

function tbGift:shopvannien2()
local nDong = me.GetJbCoin()
if nDong < 50*10000 then 
	Dialog:Say("Bạn chưa đủ 50 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1326,1,nil,10)
	me.AddJbCoin(-50*10000)
end

function tbGift:muamau100() 
	local szMsg = "Bạn muốn mua loại nào ? ";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Trung Cấp\n<color=green>20Vạn/10 Rương",self.muamautrung,self};
		{"Cao Cấp\n<color=green>30Vạn/10 Rương",self.muamau100ne,self};
		-- {"Bản Đồ Vạn Hoa Cốc\n<color=green>150Vạn/1",self.shop_mua_vhc,self};
		-- {"Bản Đồ Thiên Quỳnh Cung\n<color=green>150Vạn/1",self.shop_mua_tqc,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:shop_mua_vhc()
local nDong = me.GetJbCoin()
if nDong < 150*10000 then 
	Dialog:Say("Bạn chưa đủ 150 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,245,1,nil,1)
	me.AddJbCoin(-150*10000)
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã mua 1 bản đồ Vạn Hoa Cốc Thời gian: %s", me.szName, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function tbGift:shop_mua_tqc()
local nDong = me.GetJbCoin()
if nDong < 150*10000 then 
	Dialog:Say("Bạn chưa đủ 150 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,186,1,nil,1)
	me.AddJbCoin(-150*10000)
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã mua 1 bản đồ Thiên Quỳnh Cung Thời gian: %s", me.szName, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function tbGift:muamautrung()
local nDong = me.GetJbCoin()
if nDong < 20*10000 then 
	Dialog:Say("Bạn chưa đủ 20 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,37,1,nil,10)
	me.AddJbCoin(-20*10000)
end

function tbGift:muamau100ne() 
	local szMsg = "Bạn muốn mua loại nào ? ";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Máu <color=gold>Linh Chi Tục Mệnh Hoàn\n<color=green>30Vạn/10 Rương",self.muamaune,self};
		{"Mana <color=gold>Tuyết Tam Phản Khí Hoàn\n<color=green>30Vạn/10 Rương",self.muamanane,self};
		{"Mana + Máu <color=gold>Đao Trì Đại Hoàn Đơn\n<color=green>30Vạn/10 Rương",self.maumanane,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:muamaune()
local nDong = me.GetJbCoin()
if nDong < 30*10000 then 
	Dialog:Say("Bạn chưa đủ 30 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,241,1,nil,10)
	me.AddJbCoin(-30*10000)
end

function tbGift:muamanane()
local nDong = me.GetJbCoin()
if nDong < 30*10000 then 
	Dialog:Say("Bạn chưa đủ 30 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,242,1,nil,10)
	me.AddJbCoin(-30*10000)
end

function tbGift:maumanane()
local nDong = me.GetJbCoin()
if nDong < 30*10000 then 
	Dialog:Say("Bạn chưa đủ 30 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,243,1,nil,10)
	me.AddJbCoin(-30*10000)
end


function tbGift:muasachexpdonghanh()
local nDong = me.GetJbCoin()
if nDong < 10*10000 then 
	Dialog:Say("Bạn chưa đủ 10 vạn đồng thường rồi")
return 
end
me.AddStackItem(18,1,543,1,{bForceBind=1},10)
	me.AddJbCoin(-10*10000)
end

function tbGift:muadaminhchau()
local nDong = me.GetJbCoin()
if nDong < 50*10000 then 
	Dialog:Say("Bạn chưa đủ 50 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,357,1,nil,100)
	me.AddJbCoin(-50*10000)
end



function tbGift:checkid() 
	local nFollowUid = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TRUUYDANH);
					Dialog:Say(string.format("Uy Danh "..nFollowUid.."!"));				
end 

function tbGift:top1tongkim()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 

	local nCheck = me.GetTask(9179,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,1, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,5);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 500)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 500)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 1 Tống Kim AlPhaTest Ngày 1 Đạt 500 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top1tongkimngay2()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,2)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,2, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,5);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 500)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 500)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 1 Tống Kim AlPhaTest Ngày 2 Đạt 500 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top2tongkimngay1()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,3)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,3, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,4);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 300)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 300)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 2 Tống Kim AlPhaTest Ngày 1 Đạt 400 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top2tongkimngay2()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,4)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,4, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,4);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 300)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 300)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 2 Tống Kim AlPhaTest Ngày 2 Đạt 400 Kim Nguyên Bảo xin chúc mừng<color>");
end



function tbGift:top4den10TKTest_ngay1()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,9)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		-- local nTichLuyTong = me.GetTask(3028,1)
		-- local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,9, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,2);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 200)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 200)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 4 Đến 10 Tống Kim AlPhaTest Ngày 1 Đạt 200 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top3tongkimngay1()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,5)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		-- local nTichLuyTong = me.GetTask(3028,1)
		-- local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,5, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,3);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 200)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 200)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 3 Tống Kim AlPhaTest Ngày 1 Đạt 300 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top3tongkimngay2()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,6)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,6, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,3);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 200)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 200)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 3 Tống Kim AlPhaTest Ngày 2 Đạt 300 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top4den11tongkimngay2()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
		local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,10)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,10, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,2);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 200)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 200)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 4 Đến 10 Tống Kim AlPhaTest Ngày 2 Đạt 200 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top1120tongkimngay1()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,7)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,7, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,1);----Đại Kim Nguyên Bảo
		-- me.SetTask(3028,1,nTichLuyTong + 100)-----Mốc nạp
		-- me.SetTask(9177,1,nDiem_Hoat_Dong + 100)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 11 đến 20 Tống Kim AlPhaTest Ngày 1 Đạt 100 Kim Nguyên Bảo xin chúc mừng<color>");
end

function tbGift:top420tongkimngay2()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
if  nCurTime < 1900 or nCurTime > 2000 then 
	Dialog:Say("Đúng <color=yellow>19h00 đến 20h00<color> hôm nay mới được nhận thưởng!!")
return 0;
end 
	local nCheck = me.GetTask(9179,8)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
		local nTichLuyTong = me.GetTask(3028,1)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
		me.SetTask(9179,8, nCheck + 1);
		me.AddStackItem(18,1,1338,1,nil,1);----Đại Kim Nguyên Bảo
		me.SetTask(3028,1,nTichLuyTong + 100)-----Mốc nạp
		me.SetTask(9177,1,nDiem_Hoat_Dong + 100)-----Mốc nạp Ngày
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 11 đến 20 Tống Kim AlPhaTest Ngày 2 Đạt 100 Kim Nguyên Bảo xin chúc mừng<color>");
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tbGift:vohantruyentongphu()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
local nCount = me.GetItemCountInBags( 18, 1, 235, 1);
		if (nCount == 0) then
			me.AddItem(18,1,235,1).Bind(1);--Vô Hạn Truyền Tống Phù
			me.Msg("Nhận được Vô Hạn Truyền Tống Phù !");			
		else
			Dialog:Say("<color=red> Bạn đã có Vô Hạn Truyền Tống Phù <color>");
		end	
end

function tbGift:Rand()
me.DropRateItem(Wanted.DROPRATE[95], 50, 500, -1);
	me.Msg("Thành Công")  ;
end
function tbGift:openloanchien()
GlobalExcute{"FactionBattle:StartFactionBattle_GS"};--s 30 , 4,3
end
function tbGift:BatDauTDLoanPhai()
	GlobalExcute{"FactionBattle:StartSignUp"};
	 -- GlobalExcute{"FactionBattle:GetRandomPoint"};

end 
function tbGift:KTLoanPhai()
	GlobalExcute{"FactionBattle:LoadArenaRange"};
end 

---------------------------------------------------------------------------------------------------------------------------------------
function tbGift:tieuhuydaocu()
	local pItem1 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_WEAPON, 0);
	local pItem2 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_BODY, 0);
	local pItem3 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_RING, 0);
	local pItem4 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_CUFF, 0);
	local pItem5 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_AMULET, 0);
	local PItems = pItem1 or pItem2 or pItem3 or pItem4 or pItem5;
	if not PItems then
	Dialog:OpenGift("<color=white>Hãy đặt vào vật phẩm muốn tiêu hủy<color>", nil ,{self.OnOpenGiftOk, self});
	return;
	else 
	Dialog:Say("<color=yellow>Để Tiêu Hủy Vật Phẩm<color>\n<color=red>Lưu Ý Cần Tháo Trang Bị Pet xuống hành trang mới có thể thực hiện thao tác<color>");
	end
		-- print(PItems.nGenre, PItems.nDetail, PItems.nParticular, PItems.nLevel);
end
  
function tbGift:OnOpenGiftOk(tbGMCardObj)
	for _, pItem in pairs(tbGMCardObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------

function tbGift:menutinhhoat()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(3118,63) < nDate then
		me.SetTask(3118,63, nDate);
		me.SetTask(3118,64, 0);
	end 

	if me.GetTask(3118,65) < nDate then
		me.SetTask(3118,65, nDate);
		me.SetTask(3118,66, 0);
	end 

	if me.GetTask(3118,67) < nDate then
		me.SetTask(3118,67, nDate);
		me.SetTask(3118,68, 0);
	end 

	local szMsg = "Tính năng mua Tinh Hoạt Lực";
	local tbOpt = {
		{"Ta muốn mua Tinh Hoạt",TinhHoat.TinhHoatLp.OnDialog,TinhHoat.TinhHoatLp};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbGift:NhanLaiHoatDong()
local tbNhanlaihoatdong	= Npc:GetClass("mualaihoatdong");
	tbNhanlaihoatdong:OnDialog()
end

function tbGift:xemspr()
	local szMsg = ("<pic:\\image\\maquet.spr><color=green>VietComBank Mã QR \nSTK : 0341007166174\nChủ Thẻ : Tiêu Công Quyền<color>\n<color=red>Hãy pm fanpage hoặc facebook ADMIN trước khi chuyển khoản!\n<color=yellow>Nội dung chuyển khoản là tên tài khoản đăng nhập vào game\n<color=cyan>Ví dụ nội dung CK: taikhoan01")
  local tbOpt =     {}
			table.insert(tbOpt, {"Ta muốn xem mốc nạp và tỉ lệ nạp đồng\n<color=blue>Click vào sẽ tự mở web",self.xemmocnap,self});
			table.insert(tbOpt, {"Kết thúc đối thoại"});
 Dialog:Say(szMsg, tbOpt)
end

function tbGift:xemmocnap()
	me.CallClientScript({"OpenWebSite", "https://tuyetdinhkt2009.com/nap-the-va-phuc-loi-nap.html"});
end

function tbGift:BinhLuan()
	me.CallClientScript({"OpenWebSite", "https://www.facebook.com/kiemhieptruyenky.net"});
end
function tbGift:nhantestcp()
	me.AddItem(2, 6, 252, 10,nil,16);
	me.AddItem(2, 6, 253, 10,nil,16);
	me.AddItem(2, 6, 254, 10,nil,16);
	me.AddItem(2, 6, 255, 10,nil,16);
	me.AddItem(2, 6, 256, 10,nil,16);
end
function tbGift:nhantestmocnap()
local nCount = me.GetTask(3028,1);
if nCount < 400000 then
me.Msg("<color=yellow>Nhận thành công tích lũy nạp 400.000 Vạn đồng<color>");
me.SetTask(3028,1,nCount + 400000)
else
me.Msg("<color=yellow>Bạn đã có rồi mà<color>");
end
end

function tbGift:dnnhandong()

  local nNgay    = tonumber(GetLocalDate("%d"));
  local nTuan    = tonumber(GetLocalDate("%w"));
  local nThang    = tonumber(GetLocalDate("%m"));
  local nDuaTopTuan    = tonumber(GetLocalDate("%w"));
local nRet = me.GetUserPayCoin();
if nRet > 0 then	
local SoDong = math.floor(nRet/10000);
local nDiemThuong = math.floor(nRet/10000); 
me.Msg("<color=yellow>Bạn đã rút thành công "..SoDong.." vạn đồng<color>");
local nCount = me.GetTask(3028,1);
local TichLuyCuongHoa = me.GetTask(3129,1);
local nDiem_Hoat_Dong = me.GetTask(9177,1);
	local nNgay = me.GetTask(6002,1)
	local nTuan = me.GetTask(6002,2)
	local nThang = me.GetTask(6002,3)
	local nDuaTopTuan = me.GetTask(9167,12)
	local nTichNapThucTe = me.GetTask(9173,1)
local nTime = GetTime()
local nWeekDay = tonumber(os.date("%w", nTime)) -- Lấy ngày trong tuần (0 là Chủ nhật)
local nCurTime = tonumber(os.date("%H%M", nTime)) -- Lấy thời gian hiện tại dưới dạng HHMM

-- Kiểm tra điều kiện để cộng task
if nWeekDay ~= 0 or (nWeekDay == 0 and nCurTime < 2200) then
    -- Nếu không phải là Chủ nhật hoặc nếu là Chủ nhật và trước 22h00, cho phép cộng task
    me.SetTask(9167, 12, nDuaTopTuan + nDiemThuong)
end

me.SetTask(3129,1,TichLuyCuongHoa + nDiemThuong)
me.SetTask(9177,1,nDiem_Hoat_Dong + nDiemThuong)
me.SetTask(3028,1,nCount + nDiemThuong)
me.SetTask(6002,1,nNgay + nDiemThuong)
me.SetTask(6002,2,nTuan + nDiemThuong)
me.SetTask(6002,3,nThang + nDiemThuong) 

me.SetTask(9173,1,nTichNapThucTe + nDiemThuong)

local nDiemTich_Event_Task = Config_Event_Bank.Task_Event
local nDiemTich_Event_Task_Group = Config_Event_Bank.Task_Event_Group
local nTichNap_Event = me.GetTask(nDiemTich_Event_Task,nDiemTich_Event_Task_Group)

me.SetTask(nDiemTich_Event_Task,nDiemTich_Event_Task_Group,nTichNap_Event + nDiemThuong)

else
me.Msg("<color=cyan>Bạn không có đồng ở đây, hãy kiểm tra lại<color>");
end
end

---------------------------TICH LUY Ngay Tuan Thang Nap The -------------------------self.dnnhandong,self});
function tbGift:rutdongvamoc()
	local nSoDuThe = me.GetTask(3028,1)
		local nSoDuTheNgay = me.GetTask(6002,1)
		local nSoDuTheTuan = me.GetTask(6002,2)
		local nSoDuTheThang = me.GetTask(6002,3)
		local nDuaNapTuan = me.GetTask(9167,12)
		local nDiem_Hoat_Dong = me.GetTask(9177,1);
			local nTichNapThucTe = me.GetTask(9173,1)
		local nThangEventHienTai = Config_Event_Bank.EventMonth
	local szMsg = "\n<color=yellow>Đã ủng hộ:<color><color=red> "..nTichNapThucTe.." VNĐ<color>\nMốc tích lũy nạp của bạn hiện tại:\n<color=yellow>"..nSoDuThe.." vạn đồng<color>";
    local tbOpt =     {}
            table.insert(tbOpt, {"<color=yellow>Nhận Đồng Nạp Thẻ<color>",self.dnnhandong,self});
			table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp<color>",self.tichluy,self});
										-- if  nThangEventHienTai == 5 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa<color>",SpecialEvent.SuKienT5.OnDialog,SpecialEvent.SuKienT5});
										-- end 
										-- if  nThangEventHienTai  == 6 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùa Hè Tháng 6<color>",SpecialEvent.SuKienT6.OnDialog,SpecialEvent.SuKienT6});
										-- end 
										-- if  nThangEventHienTai  == 7 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ 27/7<color>",SpecialEvent.SuKienT7.OnDialog,SpecialEvent.SuKienT7});
										-- end 
										-- if  nThangEventHienTai  == 8 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Cách Mạng Mười Chín Tháng 8<color>",SpecialEvent.SuKienT8.OnDialog,SpecialEvent.SuKienT8});
										-- end 
										-- if  nThangEventHienTai  == 11 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Phụ Nữ Việt Nam Lần 1<color>",SpecialEvent.SuKienT11.OnDialog,SpecialEvent.SuKienT11});
										-- end 	
										-- if  nThangEventHienTai  == 1 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch Lần 2<color>",SpecialEvent.SuKienT1.OnDialog,SpecialEvent.SuKienT1});
										-- end 	
										-- if  nThangEventHienTai  == 2 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán Lần 1<color>",SpecialEvent.SuKienT2_NguyenDan.OnDialog,SpecialEvent.SuKienT2_NguyenDan});
										-- end 	
																				-- if  nThangEventHienTai  == 3 then 
							-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Quốc Tế Phụ Nữ 8/3<color>",SpecialEvent.SuKien_T3.OnDialog,SpecialEvent.SuKien_T3});
										-- end 	
										
						 -- table.insert(tbOpt, {"<color=yellow>Quà Trưởng Thành Tháng<color>\n<color=green>(1tr VNĐ nhận Thưởng X300%)",SpecialEvent.tbQuaTruongThanh.OnDialog,SpecialEvent.tbQuaTruongThanh});
			table.insert(tbOpt, {"<bclr=red><color=yellow>Rút và kiểm tra lượt cường hóa<color>",self.CheckRut,self}); 
            -- table.insert(tbOpt, {"<color=cyan>Mua Quà Ưu Đãi Ngày\n<color=green>(10 Viên HT6)<color>",self.quangay,self});
			-- table.insert(tbOpt, {"<color=cyan>Mua Quà Ưu Đãi Tuần\n<color=green>(HT7 x10)<color>",self.quatuanne,self});
            -- table.insert(tbOpt, {"<color=cyan>Mua Quà Ưu Đãi Ưu Đãi Tháng\n<color=green>(5 Viên HT8)<color>",self.quathang,self});
            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:CheckRut()
	local nCount = me.GetTask(3130,1)
	local TichCHRutNap = me.GetTask(3129,1)
	local szMsg = "Tích lũy sau khi rút hiện nay là<color=yellow> "..TichCHRutNap.." vạn đồng<color>\n <color=red>Lưu ý : Đây là mốc tích lũy cường hóa cứ mỗi 1000 Vạn đồng bạn sẽ rút lần chuyển được , sau khi rút tích lũy sẽ về 0<color>\nLượt rút Cường Hóa của bạn còn: <color=cyan>"..nCount.."<color>";
	local tbOpt = 
	{
		{"Rút", self.laychuyen, self},
		{"Trở lại", self.OnDialog, self},
   		{"Kết thúc đối thoại"}
	};
	Dialog:Say(szMsg,tbOpt)
end
function tbGift:laychuyen()
local TichCHRutNap = me.GetTask(3129,1)
local nCount = me.GetTask(3130,1)
if TichCHRutNap >= 1000 then
me.Msg("<color=yellow>Bạn đã rút ra thành công 12 lần chuyển cường hóa<color>");
me.SetTask(3130,1,nCount + 12)
me.SetTask(3129,1,TichCHRutNap - 1000)
else
    Dialog:Say("<color=yellow>Hiện tại tích nạp của bạn "..TichCHRutNap.."/ 1000 vạn đồng\n Bạn còn nạp thiếu hãy mau mau nạp đủ 1000 vạn đồng \n <color=red>Lưu ý : Đây là mốc tích lũy cường hóa cứ mỗi 1000 Vạn đồng bạn sẽ rút 12 lần chuyển được , sau khi rút tích lũy sẽ bị trừ 1000 điểm<color>");
end
end

function tbGift:quatuan1tr() 
		local nSoDuTheTuan = me.GetTask(6002,2)
	local szMsg = "Tổng tích tuần này<color> của bạn hiện tại là: <color=yellow>"..nSoDuTheTuan.." vạn đồng<color>\n Chọn 1 Trong 2 \n<color=red>Nếu nhận cả 2 tích lũy phải đạt 1000 vạn";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Ta muốn nhận 10 viên HT Cấp 7",self.quatuan,self};
		{"Ta muốn nhận 4 Trứng Rồng",self.quatuan4trung,self};
		{"Ta muốn nhận cả 10 HT7 và 4 Trứng Rồng",self.quatuantatca,self};
		{"Hiện tại ta chưa muốn"},
	}; 
	Dialog:Say(szMsg, tbOpt);
end
----------------------------------------------------------------------------------------
function tbGift:quangay()
  local nNgay    = tonumber(GetLocalDate("%d"));
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nGioiHanNgay = me.GetTask(3028,3)
	local nCount = 1;
	if nGioiHanNgay + nCount > 1 then
		Dialog:Say(string.format("Ngày hôm nay Đã nhận quà, sao lại đến nữa "));
    return 0; 
	end
	
			local nDiem_Hoat_Dong = me.GetTask(9177,1);
			if nDiem_Hoat_Dong < 50 then 
					Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này hiện nay Điểm Hoạt Động còn lại :<color=yellow>"..nDiem_Hoat_Dong.." Điểm<color>"));
					return 0;
			end 
	-- local nCountt = me.GetTask(6002,1)
	-- if nCountt < 10 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		-- return 0;
	-- end
me.SetTask(9177,1,nDiem_Hoat_Dong - 50);
me.SetTask(3028,3,nGioiHanNgay + nCount);
me.AddStackItem(18,1,114,6,nil,10)---10 Viên HT 6 Khóa
local nSoLuong = 1
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Người mua: %s, Gói quà ngày 50 điểm: %d, Thời gian: %s", me.szName , nSoLuong, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\quangay.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

----------------------
function tbGift:quatuanne() 
	local nTuan = me.GetTask(3028,5)
	if nTuan  > 0 then
		Dialog:Say(string.format("Tuần Này bạn đã mua quà này, sao lại đến nữa"));
    return 0; 
	end
			local nDiem_Hoat_Dong = me.GetTask(9177,1);
	local szMsg = "Tổng Điểm Hoạt Động của bạn hiện tại là: <color=yellow>"..nDiem_Hoat_Dong.." Điểm<color>\nTổng Điểm 1000 nhận thưởng : 10 Viên HT7";
    local tbOpt =     {}
	table.insert(tbOpt, {"<color=yellow>Ta muốn mua quà tuần 1000 Điểm<color>\n<color=green>(10 HT7)",self.quatuan,self});
	-- table.insert(tbOpt, {"<color=yellow>Ta muốn mua quà tuần 1000 Điểm<color>\n<color=green>(10 HT7 + 4 Trứng Rồng)",self.quatuantatca,self});
            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:quatuan()
  local nTuan    = tonumber(GetLocalDate("%w"));
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
		local nTuan = me.GetTask(3028,5)
	if nTuan  > 0 then
		Dialog:Say(string.format("Tuần Này đã nhận quà, sao lại đến nữa"));
    return 0; 
	end
	-- local nCountt = me.GetTask(6002,2)
	-- if nCountt < 500 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		-- return 0;
	-- end
			local nDiem_Hoat_Dong = me.GetTask(9177,1);
			if nDiem_Hoat_Dong < 1000 then 
					Dialog:Say(string.format("Phải Đạt 1000 Điểm Hoạt Động\nHiện nay Chưa đạt điều kiện nhận phần thưởng này hiện nay Điểm Hoạt Động còn lại :<color=yellow>"..nDiem_Hoat_Dong.." Điểm<color>"));
					return 0;
			end 
me.SetTask(9177,1,nDiem_Hoat_Dong - 1000);
me.SetTask(3028,5,nTuan + 1);
me.AddStackItem(18,1,114,7,nil,10)----10 viên HT7 Khóa
local nSoLuong = 1
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Người mua: %s, Gói quà tuần 1000 điểm: %d, Thời gian: %s", me.szName , nSoLuong, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\quatuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function tbGift:quatuantatca()
  local nTuan    = tonumber(GetLocalDate("%w"));
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
		local nTuan = me.GetTask(3028,5)
	if nTuan  > 0 then
		Dialog:Say(string.format("Tuần Này đã nhận quà, sao lại đến nữa"));
    return 0; 
	end
	-- local nCountt = me.GetTask(6002,2)
	-- if nCountt < 1000 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		-- return 0;
	-- end
			local nDiem_Hoat_Dong = me.GetTask(9177,1);
			if nDiem_Hoat_Dong < 1000 then 
					Dialog:Say(string.format("Phải Đạt 1000 Điểm Hoạt Động\nHiện nay Chưa đạt điều kiện nhận phần thưởng này hiện nay Điểm Hoạt Động còn lại :<color=yellow>"..nDiem_Hoat_Dong.." Điểm<color>"));
					return 0;
			end 
me.SetTask(9177,1,nDiem_Hoat_Dong - 1000);
me.SetTask(3028,5,nTuan + 1);
me.AddStackItem(18,1,114,7,nil,10)----10 viên HT7 Khóa
me.AddStackItem(18,1,20400,1,{bForceBind = 1},4);---Trứng Rồng
local nSoLuong = 1
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Người mua: %s, Gói quà tuần 1000 điểm: %d, Thời gian: %s", me.szName , nSoLuong, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\quatuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end
------------------------------------------------------------------------------------------------------------------------

function tbGift:quathang()
  local nThang    = tonumber(GetLocalDate("%m"));
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local nThang = me.GetTask(3028,7)
	local nCount = 1;
if nThang + nCount  > 1 then
		Dialog:Say(string.format("Tháng này Đã nhận quà, sao lại đến nữa"));
    return 0; 
end
	
	-- local nCountt = me.GetTask(6002,3)
	-- if nCountt < 1000 then
		-- Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		-- return 0;
	-- end
			local nDiem_Hoat_Dong = me.GetTask(9177,1);
			if nDiem_Hoat_Dong < 1000 then 
					Dialog:Say(string.format("Phải Đạt 1000 Điểm Hoạt Động\nHiện nay Chưa đạt điều kiện nhận phần thưởng này hiện nay Điểm Hoạt Động còn lại :<color=yellow>"..nDiem_Hoat_Dong.." Điểm<color>"));
					return 0;
			end 
me.SetTask(9177,1,nDiem_Hoat_Dong - 1000);
me.SetTask(3028,7,nThang + nCount);
me.AddStackItem(18,1,114,8,nil,5)----5 viên HT8 Khóa
local nSoLuong = 1
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Người mua: %s, Gói quà tháng 1000 điểm: %d, Thời gian: %s", me.szName , nSoLuong, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\quathang.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end
---------------------------TICH LUY NAP THE -------------------------

function tbGift:tichluy()
	local nSoDuThe = me.GetTask(3028,1)
	local szMsg = "Tổng tích lũy rút của bạn hiện tại là: <color=cyan>"..nSoDuThe.." vạn đồng<color>";
    local tbOpt =     {}
			local nQuaDau = me.GetTask(3130,4)
			if nQuaDau < 1 and nSoDuThe >= 200 then
            table.insert(tbOpt, {"<color=cyan>Tích lũy 200 vạn đồng<color>",self.qua50,self});
			end
			if nSoDuThe >= 3000 then
            table.insert(tbOpt, {"<color=yellow>Mở khóa Mã bài<color>",self.doinguatam,self});
            table.insert(tbOpt, {"<color=yellow>Mở khóa Mặt Nạ<color>",self.doimatna,self});
			end
			if nQuaDau >= 1 then
            table.insert(tbOpt, {"<color=cyan>Tích lũy nạp thẻ<color>",self.tichluynap,self});
            table.insert(tbOpt, {"Ngoại trang ưu đãi nạp thẻ",SpecialEvent.NgoaiTrangNapThe.OnDialog,SpecialEvent.NgoaiTrangNapThe});
			end
            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end
-----TICHNAP_TCQGAMING
function tbGift:tichluynap()
	local nDongRut = me.GetTask(3028,1)
				local nNgayMoSV = DietQuai:NgayMoMayChu();
	local szMsg = "Tổng tích lũy rút của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	local szMsg = "Hiện nay Máy Chủ Thần Tài Đã Open Được "..nNgayMoSV.." ngày";
	    local tbOpt =     {}
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 50 vạn đồng",self.qua100,self});
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 150 vạn đồng",self.qua300,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>500 vạn đồng",self.qua500,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 1000 vạn đồng",self.qua1000,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>1500 vạn đồng",self.qua1500,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>3000 vạn đồng",self.qua3000,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>5000 vạn đồng",self.qua5000,self});
			-- if nNgayMoSV > 7 then 
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>7000 vạn đồng",self.qua7000,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 10.000 vạn đồng",self.qua10000,self});
			-- end 
			-- if nNgayMoSV > 30 then
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>14.000 vạn đồng",self.qua14000,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>18.000 vạn đồng",self.qua18000,self});
			-- end 
			-- if nNgayMoSV > 50 then
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>22.000 vạn đồng",self.qua22000,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>26.000 vạn đồng",self.qua26000,self});
            table.insert(tbOpt, {"Quà nạp mốc <color=gold>30.000 vạn đồng",self.qua30000,self});
			-- end 
			-- if nNgayMoSV > 90 then			
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 35.000 vạn đồng",self.qua35000,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 40.000 vạn đồng",self.qua40000,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 45.000 vạn đồng",self.qua45000,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 50.000 vạn đồng",self.qua50000,self});
            table.insert(tbOpt, {"Quà nạp mốc<color=gold> 60.000 vạn đồng",self.qua60000,self});
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 45875 vạn đồng<color>\n<color=green>(Sv Open 50 ngày)",self.qua75000,self});
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 64625 vạn đồng<color>\n<color=green>(Sv Open 60 ngày)",self.qua100tr,self});
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 84625 vạn đồng<color>\n<color=green>(Sv Open 90 ngày)",self.qua125tr,self});
            -- table.insert(tbOpt, {"Quà nạp mốc <color=gold>104625 vạn đồng<color>\n<color=green>(Sv Open 90 ngày)",self.qua150tr,self});
            -- table.insert(tbOpt, {"Quà nạp mốc<color=gold> 124625 vạn đồng<color>\n<color=green>(Sv Open 120 ngày)",self.qua175tr,self});
			-- end
            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGift:qua50()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3130,4)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(3028,1)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3130,4, nCount + 1);
	 me.AddTitle(43,1,1,1); -- danh hieu thành viên thân thiết
	me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
	me.AddItem(18,1,216,1).Bind(1); -- lb mo rong ruong 2
end

function tbGift:qua500()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3031,2)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(3028,1)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3031,2, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},300)---Tiền Du Long
	 me.AddStackItem(18,1,205,1,{bForceBind = 1},500);---Ngũ Hành Hồn Thạch
	 	 me.AddItem(18,1,216,2).Bind(1); -- lb mo rong ruong 3
		 	me.AddItem(21,9,1,1).Bind(1); -- túi 24 ô
						 me.AddBindMoney(150*10000);--bạc khóa

end


function tbGift:qua1000()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3032,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end

	me.SetTask(3032,1, nCount + 1);
 me.AddBindMoney(150*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},300)---Tiền Du Long
	 	me.AddStackItem(1,13,180,10,{bForceBind=1},1)---Mặt nạ
		me.AddItem(18,1,216,3).Bind(1); -- lb mo rong ruong lv4
		me.AddItem(21,9,1,1).Bind(1); -- túi 24 ô
end

function tbGift:qua1500()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3033,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3033,1, nCount + 1);
	-- local LuotChuyenCH = me.GetTask(3130,1)
	-- me.SetTask(3130,1,LuotChuyenCH + 4)
 me.AddBindMoney(150*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
			 me.AddStackItem(18,1,205,1,{bForceBind = 1},1000);---Ngũ Hành Hồn Thạch
	 	me.AddStackItem(1,12,20540,10,{bForceBind=1},1)---xích thố huyết kiếm

		
			local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 2 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,2,1); -- nhà tài trợ đồng
    end
end

function tbGift:qua3000()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3035,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 3000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3035,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(150*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
	 	me.AddStackItem(1,13,181,10,{bForceBind=1},1)---Mặt nạ
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
					 	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 3 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,3,1); -- nhà tài trợ bạc
    end
end

function tbGift:qua5000()
	local nNeedBag = 8;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3036,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 5000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3036,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(150*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
	 	me.AddStackItem(1,12,20541,10,{bForceBind=1},1)---Bôn tiêu huyết kiếm
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
					 		local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 4 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,4,1); -- nhà tài trợ vàng
    end
end


function tbGift:qua7000()
	local nNeedBag = 10;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3038,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 7000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(3038,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
	 	me.AddStackItem(1,13,182,10,{bForceBind=1},1)---mặt nạ huyết kiếm
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch

end

function tbGift:qua10000()

	local nNeedBag = 15;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3075,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 10000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 10.000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3075,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
	 	me.AddStackItem(1,12,20542,10,{bForceBind=1},1)---ngựa phiên vũ huyết kiếm
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
end

function tbGift:qua14000()

	local nNeedBag = 50;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3042,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 14000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần tích lũy 14.000 vạn đồng"));
		return 0;
	end
	me.SetTask(3042,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},500)---Tiền Du Long
	 	me.AddStackItem(1,13,183,10,{bForceBind=1},1)---mặt nạ
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
					 		local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 5 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,5,1); -- nhà tài trợ bạch kim
    end
end

function tbGift:qua18000()

	local nNeedBag = 10;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3034,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(3028,1)
	if nCountt < 18000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 18.000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3034,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,12,20543,10,{bForceBind=1},1)---tuyết hồn huyết kiếm
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
					 	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 6 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	 me.AddTitle(43,1,6,1); -- nhà tài trợ Kim Cương 
    end
end

function tbGift:qua22000()

	local nNeedBag = 15;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3074,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 22000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 22000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3074,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,13,184,10,{bForceBind=1},1)---mặt nạ tuyệt
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch

end


function tbGift:qua26000()

	local nNeedBag = 15;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3043,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 26000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 26000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3043,1, nCount + 1);
		local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,12,20544,10,{bForceBind=1},1)---Kim mã huyết kiếm
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 7 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,7,1); -- nhà tài trợ Kim Cương 
    end
end


function tbGift:qua30000()

	local nNeedBag = 15;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3037,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 30000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 30000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3037,1, nCount + 1);
			local LuotChuyenCH = me.GetTask(3130,1)
	me.SetTask(3130,1,LuotChuyenCH + 4)
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,13,185,10,{bForceBind=1},1)---mặt nạ cực
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 8 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,8,1); -- nhà tài trợ Kim Cương  3
    end
end


function tbGift:qua35000()

	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3044,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 35000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 35000 Vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3044,1, nCount + 1);
		-- me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,12,20545,10,{bForceBind=1},1)---Ngựa hỏa ưng
					 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch

	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 9 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,9,1); -- nhà tài trợ kim cuong 3
	-- me.AddTitle(43,1,13,1); -- Thiên Hạ Vô Song
    end
end

function tbGift:qua40000()

	local nNeedBag = 10;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3029,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 40000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 40000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3029,1, nCount + 1);
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,13,186,10,{bForceBind=1},1)---Mặt nạ tuyệt phẩm
		 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
end

function tbGift:qua45000()

	local nNeedBag = 10;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3153,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 45000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 45000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3153,1, nCount + 1);
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,12,20546,10,{bForceBind=1},1)---Thanh loan
		 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
		 	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 11 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,11,1); -- Đại phú hào
	-- me.AddTitle(43,1,13,1); -- Thiên Hạ Vô Song
    end
end


function tbGift:qua50000()

	local nNeedBag = 50;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3154,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 50000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 50000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3154,1, nCount + 1);
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,13,187,10,{bForceBind=1},1)---Mặt nạ cực phẩm
		 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
end





function tbGift:qua60000()

	local nNeedBag = 10;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3030,2)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 60000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 60000 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3030,2, nCount + 1);
		me.AddBindMoney(250*10000);--bạc khóa
	 	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	 	me.AddStackItem(1,12,20547,10,{bForceBind=1},1)---Ngựa Thần Thú Huyết Kiếm
		 me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
end



function tbGift:doimatna()
	local szMsg = "Mở khóa các loại Mã bài dành cho người chơi đạt mốc tích lũy nhất định";
	local tbOpt = {
		{"Mở khóa Mặt Nạ Mốc 1000 vạn\n<color=yellow>(Yêu Cầu Đạt 3000 Vạn Đồng Tích Lũy)",self.momatna2m,self};
		{"Mở khóa Mặt Nạ Mốc 3000 vạn\n<color=yellow>(Yêu Cầu Đạt 7000 Vạn Đồng Tích Lũy)",self.momatna10m,self};
		{"Mở khóa Mặt Nạ Mốc 7000 vạn\n<color=yellow>(Yêu Cầu Đạt 14000 Vạn Đồng Tích Lũy)",self.momatna15m,self};
		{"Mở khóa Mặt Nạ Mốc 14000 vạn\n<color=yellow>(Yêu Cầu Đạt 22000 Vạn Đồng Tích Lũy)",self.momatna20m,self};
		-- {"Mở khóa Mặt Nạ Mốc 28375 vạn\n<color=yellow>(Yêu Cầu Đạt 64625 Vạn Đồng Tích Lũy)",self.momatna50m,self};
		-- {"Mở khóa Mặt Nạ Mốc 64625 vạn\n<color=yellow>(Yêu Cầu Đạt 84625 Vạn Đồng Tích Lũy)",self.momatna100m,self};
		-- {"Mở khóa Mặt Nạ Mốc 84625 vạn\n<color=yellow>(Yêu Cầu Đạt 104625 Vạn Đồng Tích Lũy)",self.momatna125m,self};
		-- {"Mở khóa Mặt Nạ Mốc 104625 vạn \n<color=yellow>(Yêu Cầu Đạt 124625 Vạn Đồng Tích Lũy)",self.momatna150m,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:momatna2m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 3000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 3000 vạn đồng");
		return 0;
	end
			local nNgua = me.GetItemCountInBags(1,13,180,110) 
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 1000v");
		return 0;
	end
	local tbItemId1	= {1,13,180,10,0,0}; 
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,180,10);
end

function tbGift:momatna10m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 7000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 7000 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,181,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 10tr");
		return 0;
	end
	local tbItemId1	= {1,13,181,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,181,10);
end

function tbGift:momatna15m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 14000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 14000 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,182,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 15tr");
		return 0;
	end
	local tbItemId1	= {1,13,182,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,182,10);
end

function tbGift:momatna20m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 22000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 22000 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,183,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 20tr");
		return 0;
	end
	local tbItemId1	= {1,13,183,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,183,10);
end

function tbGift:momatna50m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 64625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 64625 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,170,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 50tr");
		return 0;
	end
	local tbItemId1	= {1,13,170,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,170,10);
end

function tbGift:momatna100m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 84625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 84625 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,172,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 100tr");
		return 0;
	end
	local tbItemId1	= {1,13,172,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,172,10);
end

function tbGift:momatna125m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 104625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 104625 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,173,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 125tr");
		return 0;
	end
	local tbItemId1	= {1,13,173,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,173,10);
end
function tbGift:momatna150m()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 124625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 124625 vạn đồng");
		return 0;
	end
		local nNgua = me.GetItemCountInBags(1,13,174,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Mặt Nạ Mốc 150tr");
		return 0;
	end
	local tbItemId1	= {1,13,174,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,13,174,10);
end


function tbGift:doinguatam()
	local szMsg = "Mở khóa các loại Mã bài dành cho người chơi đạt mốc tích lũy nhất định";
	local tbOpt = {
		{"Mở khóa Xích Thố Mốc 1500 vạn đồng\n<color=yellow>(Yêu Cầu Đạt 5000 Vạn Đồng Tích Lũy)",self.moxichtho,self};
		{"Mở khóa Bôn Tiêu 5000 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 10000 Vạn Đồng Tích Lũy) ",self.moc10tr,self};
		{"Mở khóa Phiên vũ 10000 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 18.000 Vạn Đồng Tích Lũy)",self.mophienvu_huyetkiem,self};
		{"Mở khóa Tuyết hồn Mốc 18000 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 26000 Vạn Đồng Tích Lũy)",self.motuyethon_huyetkiem,self};
		-- {"Mở khóa Ngựa Mốc 16375 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 28.375 Vạn Đồng Tích Lũy)",self.mocnguamokhoa50tr,self};
		-- {"Mở khóa Ngựa Mốc 28375 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 45.875 Vạn Đồng Tích Lũy)",self.mocnguamokhoa75tr,self};
		-- {"Mở khóa Ngựa Mốc 45875 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 64.625 Vạn Đồng Tích Lũy)",self.mocnguamokhoa100tr,self};
		-- {"Mở khóa Ngựa Mốc 64625 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 84.625 Vạn Đồng Tích Lũy)",self.mocnguamokhoa125tr,self};
		-- {"Mở khóa Ngựa Mốc 84625 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 104.625 Vạn Đồng Tích Lũy)",self.mocnguamokhoa150tr,self};
		-- {"Mở khóa Ngựa Mốc 104625 vạn đồng\n<color=yellow> (Yêu Cầu Đạt 124.625 Vạn Đồng Tích Lũy)",self.mocnguamokhoa180tr,self};
		-- {"Mở khóa Ngựa Mốc 180tr\n<color=yellow> (Yêu Cầu Đạt 200.000 Vạn Đồng Tích Lũy)",self.mocnguamokhoa200tr,self};
		-- {"Mở khóa Ngựa Mốc 200tr\n<color=yellow> (Yêu Cầu Đạt 250.000 Vạn Đồng Tích Lũy)",self.mocnguamokhoa250tr,self};

		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:mophienvu_huyetkiem()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 18000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 18000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3157,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20542,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Phiên vũ Mốc 10.000");
		return 0;
	end
	me.SetTask(3157,1, nCount + 1);
	local tbItemId1	= {1,12,20542,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20542,10);-----hỷ hỷ
end

function tbGift:mocnguamokhoa20tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 5150 vạn dành cho người chơi đạt mốc tích lũy rút 10625 vạn đồng";
	local tbOpt = {
		{"Mở khóa Tuyết Hồn",self.motuyethon,self};
		{"Mở khóa Hỷ Hỷ ",self.mohyhy,self};
		{"Mở khóa Hổ Cát Tường",self.mohocattuong,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa30tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 10625 vạn đồng dành cho người chơi đạt mốc tích lũy rút 16.375 vạn đồng";
	local tbOpt = {
		{"Mở khóa Phiên Vũ",self.mophienvu,self};
		-- {"Mở khóa Ngọc Tiêu Dao ",self.mongoctieudao,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa50tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 16375 vạn đồng dành cho người chơi đạt mốc tích lũy rút 28.375 vạn đồng";
	local tbOpt = {
		{"Mở khóa Lăng Thiên",self.molangthien,self};
		-- {"Mở khóa Kỵ Sĩ Bóng Đêm",self.mokysi,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa75tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 28375 vạn đồng dành cho người chơi đạt mốc tích lũy rút 45.875 vạn đồng";
	local tbOpt = {
		-- {"Mở khóa Trục Nhật",self.motrucnhat,self};
		{"Mở khóa Ức Vân",self.moucvan,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa100tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 45875 dành cho người chơi đạt mốc tích lũy rút 64.625 vạn đồng";
	local tbOpt = {
		{"Mở khóa Bạch Mã Hoàng Kim Kỵ",self.motuquy,self};
		-- {"Mở khóa Viêm Long Tử",self.moviemlongtu,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa125tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 100tr dành cho người chơi đạt mốc tích lũy rút 169.250 vạn đồng";
	local tbOpt = {
		-- {"Mở khóa Tuyệt Đỉnh Tuyết Vũ",self.motuyetvu,self};
		{"Mở khóa Kim Lang Vương VIP",self.motuyetvu,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa150tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 84625 vạn đồng dành cho người chơi đạt mốc tích lũy rút 104625 vạn đồng";
	local tbOpt = {
		{"Mở khóa Bạch Ngọc Kỳ Lân VIP",self.mohoakylan,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa180tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 104625 vạn đồng dành cho người chơi đạt mốc tích lũy rút 124625 vạn đồng";
	local tbOpt = {
		{"Mở khóa Thanh Loan Kim Mã VIP",self.mohackylan,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa200tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 180tr dành cho người chơi đạt mốc tích lũy rút 200.000 vạn đồng";
	local tbOpt = {
		{"Mở khóa Lam Kỳ Lân",self.molamkylan,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:mocnguamokhoa250tr()
	local szMsg = "Mở khóa các loại Mã bài Mốc 200tr dành cho người chơi đạt mốc tích lũy rút 250.000 vạn đồng";
	local tbOpt = {
		{"Mở khóa Mạch Thượng Phi Sương",self.momanhthuongphisuong,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:mohocattuong()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 10625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 10625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3157,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,27,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Hổ Cát Tường Mốc 10.000");
		return 0;
	end
	me.SetTask(3157,1, nCount + 1);
	local tbItemId1	= {1,12,27,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,27,4);-----hổ
end
function tbGift:motuyethon()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 10625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 10625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3157,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,28,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Tuyết Hồn Mốc 10.000");
		return 0;
	end
	me.SetTask(3157,1, nCount + 1);
	local tbItemId1	= {1,12,28,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,28,4);-----hổ
end
function tbGift:motuyethon_huyetkiem()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 26000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 26000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3159,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20543,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Tuyết Hồn Mốc 26000 Vạn Đồng");
		return 0;
	end
	me.SetTask(3159,1, nCount + 1);
	local tbItemId1	= {1,12,20543,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20543,10);
end
function tbGift:mongoctieudao()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 30000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 30.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3159,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,30,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Ngọc Tiêu Dao Mốc 20.000 Vạn Đồng");
		return 0;
	end
	me.SetTask(3159,1, nCount + 1);
	local tbItemId1	= {1,12,30,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,30,4);
end

function tbGift:molangthien()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 28375 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 28375 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3158,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,31,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Lăng Thiên Mốc 16375 Vạn Đồng");
		return 0;
	end
	me.SetTask(3158,1, nCount + 1);
	local tbItemId1	= {1,12,31,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,31,4);
end
function tbGift:mokysi()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 50000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 50.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3158,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,32,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Kỵ Sĩ Bóng Đêm Mốc 30.000 Vạn Đồng");
		return 0;
	end
	me.SetTask(3158,1, nCount + 1);
	local tbItemId1	= {1,12,32,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,32,4);
end

function tbGift:motrucnhat()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 75000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 100.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3160,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,33,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Trục Nhật Mốc 50.000 Vạn Đồng");
		return 0;
	end
	me.SetTask(3160,1, nCount + 1);
	local tbItemId1	= {1,12,33,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,33,4);
end

function tbGift:moucvan()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 45875 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 45875 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3160,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,33,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Ức Vân Mốc 28375 Vạn Đồng");
		return 0;
	end
	me.SetTask(3160,1, nCount + 1);
	local tbItemId1	= {1,12,33,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,33,4);
end
function tbGift:motuquy()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 64625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 64.625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3161,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,36,4) -- 1,12,36,4
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Bạch Mã Hoàng Kim Kỵ Mốc 45.875 vạn đồng");
		return 0;
	end
	me.SetTask(3161,1, nCount + 1);
	local tbItemId1	= {1,12,36,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,36,4);
end
function tbGift:moviemlongtu()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 125000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 100.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3161,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,36,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Viêm Long Tử Mốc 75.000");
		return 0;
	end
	me.SetTask(3161,1, nCount + 1);
	local tbItemId1	= {1,12,36,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,36,4);
end
function tbGift:motuyetvu()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 84625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 84.625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3162,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20522,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Kim Lang Vương VIP 1");
		return 0;
	end
	me.SetTask(3162,1, nCount + 1);
	local tbItemId1	= {1,12,20522,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20522,4);
end

function tbGift:mohoakylan()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 104625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 104.625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3163,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20523,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Bạch Ngọc Kỳ Lân VIP");
		return 0;
	end
	me.SetTask(3163,1, nCount + 1);
	local tbItemId1	= {1,12,20523,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20523,4);
end


function tbGift:mohackylan()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 124625 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 124625 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3164,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20525,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Thanh Loan Kim Mã");
		return 0;
	end
	me.SetTask(3164,1, nCount + 1);
	local tbItemId1	= {1,12,20525,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20525,4);
end

function tbGift:molamkylan()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 200000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 200.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3165,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,40,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có thần thú Lam Kỳ Lân");
		return 0;
	end
	me.SetTask(3165,1, nCount + 1);
	local tbItemId1	= {1,12,40,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,40,4);
end

function tbGift:momanhthuongphisuong()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 250000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 250.000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3166,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,41,4) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có thần thú Mạch Thượng Phi Sương");
		return 0;
	end
	me.SetTask(3166,1, nCount + 1);
	local tbItemId1	= {1,12,41,4,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,41,4);
end


function tbGift:moc10tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 10000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 10000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3156,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20541,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Bôn Tiêu Mốc 5.000");
		return 0;
	end
	me.SetTask(3156,1, nCount + 1);
	local tbItemId1	= {1,12,20541,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20541,10);
end

function tbGift:moxichtho()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	local nDongRut = me.GetTask(3028,1)
	if nDongRut < 5000 then
		Dialog:Say("Bạn chưa đạt mốc tích lũy 5000 vạn đồng");
		return 0;
	end
	local nCount = me.GetTask(3155,1)
	if nCount >= 1 then
		Dialog:Say(string.format("Mỗi loại Mã bài bạn chỉ được mở khóa một lần"));
		return 0;
	end
	local nNgua = me.GetItemCountInBags(1,12,20540,10) -- ngũ hành hồn thạch
	if nNgua < 1 then
    	Dialog:Say("Trong hành trang không có Xích Thố");
		return 0;
	end
	me.SetTask(3155,1, nCount + 1);
	local tbItemId1	= {1,12,20540,10,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1);
	me.AddItem(1,12,20540,10);
end




function tbGift:qua200tr()
	local nNeedBag = 50;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3130,2)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 294250 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 294250 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3130,2, nCount + 1);
	me.AddItem(1,12,41,4).Bind(1);--Mốc nạp 200tr thú cưỡi Mạch Thượng Phi Sương KTC 260 Kỹ năng phái 1 cấp tăng exp 100% Tài phú 12960
	me.AddItem(18,1,479,1).Bind(1); -- bổ tu lệnh
me.AddStackItem(18,1,284,1,nil,5);----10 thỏi bạc tiểu bang hội
me.AddStackItem(18,1,284,2,nil,5);----10 thỏi bạcđại bang hội
	local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 12 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,12,1); -- Vang Danh Thiên Hạ
    end
end
function tbGift:qua250tr()
	local nNeedBag = 50;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(3130,3)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 394250 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này cần 394250 vạn đồng tích lũy"));
		return 0;
	end
	me.SetTask(3130,3, nCount + 1);
	me.AddItem(1,12,42,4).Bind(1);--Mốc nạp 250tr thú cưỡi Tuyết Vũ Thiên Hương KTC 280 Kỹ năng phái 1 cấp tăng exp 100% Tài phú 12960
	me.AddItem(18,1,479,1).Bind(1); -- bổ tu lệnh
	me.AddStackItem(18,1,284,1,nil,5);----10 thỏi bạc tiểu bang hội
	me.AddStackItem(18,1,284,2,nil,5);----10 thỏi bạcđại bang hội
		local nDanhHieu = 0;
	local tbTitles = me.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			local szTitleGenre = pTitle.byTitleGenre;
			local szTitleDetail = pTitle.byTitleDetailType;
			local szTitleLevel = pTitle.byTitleLevel;
			--local szTitleParam = pTitle.dwTitleParam;
			if szTitleGenre == 43 and szTitleDetail == 1 and szTitleLevel < 13 then
				nDanhHieu = 1;
				break;
			end
		end
	end
	if nDanhHieu == 1 then
	me.AddTitle(43,1,13,1); -- Thiên Hạ Vô Song
    end
end

function tbGift:nhanthead()

-- me.AddItem(18,1,1876,1);
-- me.AddItem(18,1,400,1);
me.AddItem(18,1,2028,17);
-- me.AddItem(18,1,22222,1);
end

function tbGift:quatrungthuvuive()
	local nCapCap = me.GetTask(3110,1)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3110,1, nCapCap + 1);
	me.AddStackItem(18,1,114,8,{bForceBind=1},2)--HT8
	me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận Quà tặng nâng cấp máy chủ nhận được\n2 Huyền Tinh Cấp 8 , 50 Sách kinh nghiệm chân nguyên Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:codetanthu()
local nNeedBag = 6;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
local nCount = me.GetTask(3117,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận Giftcode rồi, không thể nhận thêm");
return 0; 
end
Dialog:AskString("Nhập Mã Code", 15, self.kiemtratanthu, self);
end

function tbGift:kiemtratanthu(nCodet1)
local nCount = me.GetTask(3117,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận Giftcode rồi, không thể nhận thêm");
return 0; 
end
if (nCodet1=="TANTHULP68") then -------- Mã Gift Code
me.Msg("<color=yellow>Chúc mừng bạn đã nhập mã GiftCode thành công<color>")
me.SetTask(3117,1, nCount + 1);
me.AddStackItem(18,1,114,7,nil,3);--- 1 huyền tinh cấp 8
me.AddItem(21,7,1,1).Bind(1);
else 
me.Msg("<color=yellow>Mã Code không đúng!<color>")
end
end

function tbGift:NguaChin()
	local szMsg = "Để mua Dây Cương Thần Bí, sử dụng nhận được<color=green> 1 ngựa cấp độ 90<color> (hạn sử dụng 1 tháng), cần chuẩn bị <color=yellow>1 vạn Đồng thường<color>, nhà ngươi chắc chắn muốn mua?";
	local tbOpt = {
		{"Đồng ý",self.MuaNguaChin,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:MuaNguaChin()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 10000) then
	Dialog:Say("Bạn không đủ <color=red>1 vạn đồng<color>");
    return 0; 
	end
	me.AddJbCoin(-10000);
    me.AddItem(18,1,237,1);
end

--------------------------------------------------
function tbGift:tangexptrain()

	--if me.GetSkillState(332) > 0 then
		--Dialog:Say("Bạn đang trong thời gian hiệu quả<color=gold> Tu luyện châu<color>, không thể sử dụng");
		--return 0;
	--end

	if me.GetSkillState(1994) > 0 then
		Dialog:Say("Bạn đang trong thời gian hiệu quả<color=gold> cộng thêm exp<color>, không thể sử dụng cộng dồn");
		return 0;
	end

	if me.nLevel >= self.Cap_Nhan_Exp then
		Dialog:Say("Cấp độ của bạn đã vượt quá<color=gold> "..self.Cap_Nhan_Exp.."<color>, không thể sử dụng");
		return 0;
	end

    self:Update();
        local nRemainTime = self:GetRemainTime();
        local nExpSkillLevel, nExpStateType, nExpEndTime, bExpIsNoClearOnDeath            = me.GetSkillState(self.SKILL_ID_EXP);
        local nNewExpTime        = 0;
         if (not nExpEndTime) then 
           nExpEndTime = 0;
        end
        nRemainTime = nRemainTime - self.tbEffect[1];
        nNewExpTime            = self.tbEffect[1] * 18 * 3600 + nExpEndTime;
        me.AddSkillState(self.SKILL_ID_EXP, self.SKILL_ID_EXP_LEVEL, 1, nNewExpTime, 1);
        me.Msg(string.format("Bạn nhận được <color=yellow>%s giờ <color> nhân đôi kinh nghiệm.",self.tbEffect[1]))    
end
function tbGift:Update()
    local nLastTime        = me.GetTask(self.TASKGROUP, self.TASKLASTTIME_ID);
    local nNowTime        = GetTime(); 
   local nDays            = self:CalculateDay(nLastTime, nNowTime); 
   local nRemainTime    = nDays * 1.5 + self:GetRemainTime();
    if (nRemainTime < 0.1) then        
		nRemainTime = 0;
    end
        if (nLastTime <= 0) then
        nRemainTime = 1.5;
    end
        me.SetTask(self.TASKGROUP, self.TASKLASTTIME_ID, nNowTime);    me.SetTask(self.TASKGROUP, self.TASKREMAINTIME_ID, nRemainTime * 10); -- 存的是小时的十倍
end
-- 计算离上次更新时间过了多少天
function tbGift:CalculateDay(nLastTime, nNowTime)
    local nLastDay     = Lib:GetLocalDay(nLastTime);
    local nNowDay    = Lib:GetLocalDay(nNowTime); 
   local nDays        = nNowDay - nLastDay;    if (nDays < 0) then
        nDays = 0; 
   end
    return nDays;
end
function tbGift:GetRemainTime() 
   return me.GetTask(self.TASKGROUP, self.TASKREMAINTIME_ID) / 10;
end  
--------------------------------------------------

function tbGift:codetruyentin()
local nNeedBag = 10;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
local nCount = me.GetTask(3138,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận rồi");
return 0; 
end
me.Msg("<color=yellow>Chúc mừng bạn đã nhận quà Open Sever thành công<color>")
me.SetTask(3138,1, nCount + 1);
	-- me.AddStackItem(18,1,114,7,{bForceBind=1},2)
	-- me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.AddStackItem(18,1,114,8,{bForceBind=1},2)
		me.AddItem(21,9,1,1).Bind(1); -- túi 24 ô
			local nMocNap = me.GetTask(3028,1)
			me.SetTask(3028,1, nMocNap + 250);
			 me.AddBindCoin(20*10000);-----20 vạn đồng khóa
			 me.AddBindMoney(50*10000);--25 vạn bạc khóa
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận quà truyền tin Open Sever thành công nhận được \n<color=gold>Huyền tinh cấp 8 x2\n50 vạn bạc khóa\n20 vạn đồng khóa\n1 Túi 24 Ô\n250 vạn tích lũy mốc nạp thẻ<color>");
end

function tbGift:menutrian()
	local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"<color=yellow>Tri ân người chơi<color>",self.danhstrian,self};
		{"<color=yellow>Quà bảo trì đột xuất<color>",self.dasachdebu,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:danhstrian()----- task 3116,40 
	local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		-- {"<color=yellow>Quà Mở sever Cấp 79<color>",self.quamocap79ne,self};
		-- {"<color=yellow>Quà Mở sever Cấp 89<color>",self.quamocap89ne,self};
		-- {"<color=yellow>Quà Mở sever Cấp 99<color>",self.quasevermocap99ne,self};
		-- {"<color=yellow>Quà Mở sever Cấp 109<color>",self.quasevermocap109ne,self};
		-- {"<color=yellow>Quà Mở sever Cấp 119<color>",self.quasevermocap119ne,self};
		-- {"<color=yellow>Quà Mở sever Cấp 129<color>",self.quamocap129ne,self};
		 -- {"<color=yellow>Quà Mở sever Cấp 149<color>",self.quamocap139,self};
		-- {"<color=yellow>Quà tặng Đêm giáng sinh 2025<color>",self.quatrian2thang,self};
		-- {"<color=yellow>Quà tặng tri ân mừng Tết Dương Lịch 2025<color>",self.quacachmangthang8,self};
		-- {"<color=yellow>Quà tặng Mừng đội tuyển VN Chiến thắng Chung kết lượt đi ASEAN Mitsubishi Electric Cup<color>",self.qua1506,self};
		-- {"<color=yellow>Quà tặng Tết Nguyên Đán 2025<color>",self.quatetduong2024,self};
		-- {"<color=yellow>Quà tặng nâng cấp máy chủ<color>",self.quatrungthuvuive,self};
		-- {"<color=yellow>Quà Tất Niên 06/02/2024<color>",self.quaphunu20thang10,self};
		-- {"<color=yellow>Quà Sự Kiện Quốc tế phụ nữ mùng 8 tháng 3<color>",self.quocte8thang3,self};
		-- {"<color=yellow>Quà tặng mừng sinh nhật muộn Cụm KHTK 1 Tuổi<color>",self.mungsinhnhatkhtk,self};
		-- {"<color=yellow>Quà tặng mừng Mừng S3 Thần Tài Sang Tháng Thứ 5<color>",self.mungs3thang5,self};
		-- {"<color=yellow>Quà tặng Event Giổ Tổ Hùng Vương<color>",self.quagiotothang4,self};
		-- {"<color=yellow>Quà tặng 1 Cấp Toàn Máy Chủ Mừng Giai Đoạn Mới 150<color>",self.qua1cap150,self};
		-------------------------Bên trên dòng này là ok đã biết task-------------------------
		-----------------------Dưới là chưa biết task như thế nào --------------------------
		-- {"<color=yellow>Tri ân người chơi 07/04<color>",self.QuaBtLag,self};
		-- {"<color=yellow>Tống Kim 22h50<color>",self.Tonhjnhai,self};
		-- {"<color=yellow>Tri ân người chơi 12/05<color>",self.trianvjet,self};
		-------------------------------------------------------------------------------------------------------
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:qua1cap150()
	local nCapCap = me.GetTask(9173,13)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,13, nCapCap + 1);
	me.AddLevel(1);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng 1 Cấp độ Chúc mừng giai đoạn cấp 150 toàn máy chủ ! Hi vọng giai đoạn này AE vui vẻ!!<color>");
end
function tbGift:quagiotothang4()
	local nCapCap = me.GetTask(9173,10)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,10, nCapCap + 1);
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng Sự Kiện Giổ Tổ Hùng Vương 1 Huyền Tinh Cấp 9 Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:mungs3thang5()
	local nCapCap = me.GetTask(9173,9)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,9, nCapCap + 1);
	me.AddStackItem(18,1,114,10,{bForceBind=1},1)--HT9
	me.AddStackItem(18,1,1333,1,{bForceBind=1},500)---Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng S3 Thần Tài Sang Tháng Thứ 5 1 Huyền Tinh Cấp 10 , 500 Sách kinh nghiệm chân nguyên\nCảm ơn toàn thể quý bằng hữu , Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:mungsinhnhatkhtk()
	local nCapCap = me.GetTask(9173,4)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,4, nCapCap + 1);
	me.AddStackItem(18,1,114,10,{bForceBind=1},1)--HT9
	me.AddStackItem(18,1,1333,1,{bForceBind=1},500)---Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng mừng sinh nhật cụm sever 1 năm vận hành thành công 1 Huyền Tinh Cấp 10 , 500 Sách kinh nghiệm chân nguyên\nCảm ơn toàn thể quý bằng hữu , anh em đã ủng hộ suốt chặng đường 1 năm ạ Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:quocte8thang3()
	local nCapCap = me.GetTask(9173,3)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,3, nCapCap + 1);
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)--HT9
	me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng Sự Kiện Quốc tế phụ nữ mùng 8 tháng 3 1 Huyền Tinh Cấp 9 , 50 Sách kinh nghiệm chân nguyên Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:quaphunu20thang10()
	local nCapCap = me.GetTask(9173,2)
	if nCapCap > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,2, nCapCap + 1);
	me.AddStackItem(18,1,114,10,{bForceBind=1},1)--HT9
	me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Quà Tặng Sự Kiện Tất Niên ADM Tặng AE Vui Vẻ Đền Bù niềm vui 1 Huyền Tinh Cấp 10 , 50 Sách kinh nghiệm chân nguyên Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:quatetduong2024()
	local nTask = me.GetTask(3116,39)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,39, nTask + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)--Rương quà
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--Rương quà
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Tết Nguyên Đán 2025 :\n1 Huyền Tinh Cấp 9 , 500 Tiền Du Long Chúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:qua1506()
	local nTask = me.GetTask(3116,38)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,38, nTask + 1);
		 me.AddStackItem(18,1,324,1,{bForceBind=1},3);--- 5 rương vừa đẹp vừa cao quy
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Mừng đội tuyển VN Chiến thắng Chung kết lượt đi ASEAN Mitsubishi Electric Cup 3 Rương vừa đẹp vừa cao quý\nChúc Anh Em Chơi Game Vui Vẻ!<color>");
end

function tbGift:quacachmangthang8()
	local nCapCap = me.GetTask(9156,53)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9156,53, nCapCap + 1);
		 me.AddStackItem(18,1,324,1,{bForceBind=1},7);--- 5 rương vừa đẹp vừa cao quy
		 	local TichNap = me.GetTask(3028,1)
me.SetTask(3028,1,TichNap + 500)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mừng tết dương lịch 2025 đạt được 7 Rương vừa đẹp vừa cao quý\n500 vạn tích nạp mốc\nở Túi Tân Thủ mục tri ân\nChúc quý nhân sĩ năm mới nhiều sức khỏe tài lộc bình an\nCảm ơn sự ủng hộ trong năm 2024 vừa qua<color>");
end

function tbGift:quasevermocap119ne()
	local nCapCap = me.GetTask(9164,1)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9164,1, nCapCap + 1);
		me.AddStackItem(18,1,114,10,{bForceBind=1},1)
		me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		me.AddStackItem(18,1,20400,1,{bForceBind=1},10)--100-Tiền Du Long
	me.AddStackItem(18,1,377,1,{bForceBind=1},1)--Tần lăng hòa thị bích khóa
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 119 đạt được 1 viên Huyền Tinh 10\n1000 tiền du long\n10 trứng rồng\n1 Hòa Thị Bích(Khóa) ở Túi Tân Thủ<color>");
end

function tbGift:quasevermocap109ne()
	local nCapCap = me.GetTask(9161,1)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9161,1, nCapCap + 1);
		me.AddStackItem(18,1,114,9,{bForceBind=1},1)
		me.AddStackItem(18,1,553,1,{bForceBind=1},300)--100-Tiền Du Long
		-- me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 109 đạt được 1 viên Huyền Tinh 9\n300Tiền Du Long ở Túi Tân Thủ<color>");
end

function tbGift:quasevermocap99ne()
	local nCapCap = me.GetTask(3116,35)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,35, nCapCap + 1);
		me.AddStackItem(18,1,114,9,{bForceBind=1},1)
		me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,205,1,{bForceBind = 1},5000);---Ngũ Hành Hồn Thạch
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 99 đạt được 1 viên Huyền Tinh 9 và 1000 Tiền Du Long ở Túi Tân Thủ<color>");
end

function tbGift:quamocap79ne()
	local nCapCap = me.GetTask(3055,1)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3055,1, nCapCap + 1);
    me.AddItem(18,1,114,7);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 79 đạt được 1 viên Huyền Tinh 7 ở Túi Tân Thủ<color>");
end

function tbGift:quatrian2thang()
	local nCapCap = me.GetTask(3116,31)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,31, nCapCap + 1);
		me.AddStackItem(18,1,114,7,{bForceBind=1},1)
		 me.AddStackItem(18,1,324,1,{bForceBind=1},1);--- 5 rương vừa đẹp vừa cao quy
		 me.AddBindCoin(50*10000);  ---50 vạn đồng khóa
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận Quà tặng Đêm giáng sinh 2025 đạt được\n1 viên Huyền Tinh 7\n1 rương 6677\n50 Vạn đồng khóa\nở Túi Tân Thủ xin chúc mừng<color>");
end

function tbGift:quamocap89ne()
	local nCapCap = me.GetTask(3116,30)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,30, nCapCap + 1);
    me.AddItem(18,1,114,7);----huyềntinh
    me.AddItem(18,1,114,7);----huyềntinh
        me.AddStackItem(18,1,1327,14,{bForceBind=1},3)---Bùa chuyển cường hóa
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 89 đạt được 2 viên Huyền Tinh 7 và 3 bùa lượt chuyển cường hóa ở Túi Tân Thủ mục tri ân<color>");
end

function tbGift:quamocap99ne()
	local nCapCap = me.GetTask(3116,31)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,31, nCapCap + 1);
    me.AddItem(18,1,114,8);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 99 đạt được 1 viên Huyền Tinh 8 ở Túi Tân Thủ<color>");
end

function tbGift:quamocap109ne()
	local nCapCap = me.GetTask(3116,32)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,32, nCapCap + 1);
    me.AddItem(18,1,114,8);----huyềntinh
    me.AddItem(18,1,114,8);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 109 đạt được 2 viên Huyền Tinh 8 ở Túi Tân Thủ<color>");
end

function tbGift:quamocap119ne()
	local nCapCap = me.GetTask(3116,33)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,33, nCapCap + 1);
    me.AddItem(18,1,114,9);----huyềntinh
    -- me.AddItem(18,1,114,8);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 119 đạt được 1 viên Huyền Tinh 9 ở Túi Tân Thủ<color>");
end

function tbGift:quamocap129ne()
	local nCapCap = me.GetTask(3116,34)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,34, nCapCap + 1);
    me.AddItem(18,1,114,9);----huyềntinh
    me.AddItem(18,1,114,9);----huyềntinh
    -- me.AddItem(18,1,114,8);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
    -- me.AddItem(18,1,114,7);----huyềntinh
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà mở cấp 129 đạt được 2 viên Huyền Tinh 9 ở Túi Tân Thủ<color>");
end
----------Task Tri Ân đã sử dụng den 3116,40
function tbGift:dasachdebu()
	local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		-- {"<color=yellow>Quà Đền bù quà Admin ngu chỉnh giờ bảo trì<color>",self.loingay8thang8,self};
		 -- {"<color=yellow>Quà bảo trì đột xuất 22h20 23/01<color>",self.loitongkim,self};
		-- {"<color=yellow>Quà Lỗi sự cố lâu lan cổ thành 8h30 ngày 24/01<color>",self.loi23h40,self};
		-- {"<color=yellow>Quà bảo trì 25/01<color>",self.loituitanthu,self};
		-- {"<color=yellow>Đền Bù Lỗi 26/01<color>",self.loidata,self};
		-- {"<color=yellow>Đền Bù lỗi 01/02<color>",self.denbutk195,self};
		-- {"<color=yellow>Bảo trì đột xuất 23/01<color>",self.baotri25ne,self};
		-- {"<color=yellow>Bảo trì đột xuất 22/03<color>",self.baotri22ne3,self};
		-- {"<color=yellow>Bảo trì TDLT 24/03<color>",self.baotri24ne3,self};
		-- {"<color=yellow>Bảo trì TDLT 30/03<color>",self.baotri30ne3,self};
		-- {"<color=yellow>Bảo trì TDLT 31/03<color>",self.baotri31ne3,self};
		-- {"<color=yellow>Bảo trì CTC 08/04<color>",self.baotrictc0804,self};
		-- {"<color=yellow>Bảo trì đột xuất 15/04<color>",self.baotrictc1504,self};
		-- {"<color=yellow>Đền Bù CTC 25/04<color>",self.baotrictcdenbu2504,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGift:baotrictcdenbu2504()
	local nTask = me.GetTask(9173,14)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,14, nTask + 1);
	me.AddItem(18,1,114,8);
	-- me.AddItem(18,1,114,7);
    me.AddStackItem(18,1,553,1,{bForceBind=1},200)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà CTC 25/04 1 Viên Huyền Tinh Cấp 8 + 200 Tiền Du Long<color>");
end

function tbGift:baotrictc1504()
	local nTask = me.GetTask(9173,12)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,12, nTask + 1);
	me.AddItem(18,1,114,8);
	-- me.AddItem(18,1,114,7);
    me.AddStackItem(18,1,553,1,{bForceBind=1},200)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì 15/04 1 Viên Huyền Tinh Cấp 8 + 200 Tiền Du Long<color>");
end
function tbGift:baotrictc0804()
	local nTask = me.GetTask(9173,11)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,11, nTask + 1);
	me.AddItem(18,1,114,9);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì CTC 08/04 1 Viên Huyền Tinh Cấp 9<color>");
end

function tbGift:baotri31ne3()
	local nTask = me.GetTask(9173,8)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,8, nTask + 1);
	me.AddItem(18,1,114,9);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì TDLT 31/03 1 Viên Huyền Tinh Cấp 9<color>");
end

function tbGift:baotri30ne3()
	local nTask = me.GetTask(9173,7)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,7, nTask + 1);
	me.AddItem(18,1,114,9);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì TDLT 30/03 1 Viên Huyền Tinh Cấp 9<color>");
end

function tbGift:baotri24ne3()
	local nTask = me.GetTask(9173,6)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,6, nTask + 1);
	me.AddItem(18,1,114,9);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì TDLT 24/03 1 Viên Huyền Tinh Cấp 9<color>");
end

function tbGift:baotri22ne3()
	local nTask = me.GetTask(9173,5)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(9173,5, nTask + 1);
	me.AddItem(18,1,114,10);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì đột xuất 22/03 1 Viên Huyền Tinh Cấp 10<color>");
end

function tbGift:baotri25ne()
	local nTask = me.GetTask(3116,37)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,37, nTask + 1);
	me.AddItem(18,1,114,7);
	-- me.AddItem(18,1,114,7);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Bảo trì đột xuất 23/01 1 Viên Huyền Tinh Cấp 7<color>");
end

function tbGift:denbutk195()
	local nTask = me.GetTask(3116,36)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,36, nTask + 1);
	 me.AddStackItem(18,1,114,8,{bForceBind=1},2)
	 me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà lỗi 01/02 2 Viên Huyền Tinh Cấp 8 Và 1000 Tiền Du Long\nXin lỗi anh em vì gián đoạn ạ");
end

function tbGift:loidata()
	local nTask = me.GetTask(3116,22)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,22, nTask + 1);
	me.AddItem(18,1,114,9);
	-- me.AddStackItem(18,1,553,1,{bForceBind=1},500)--50-Tiền Du Long
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Lỗi 26/01 1 Viên Huyền Tinh Cấp 9<color>");
end

function tbGift:loituitanthu()
	local nTask = me.GetTask(3116,21)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,21, nTask + 1);
	me.AddItem(18,1,114,8);
	me.AddItem(18,1,114,8);
		me.AddStackItem(18,1,553,1,{bForceBind=1},500)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà bảo trì 25/01 2 Viên Huyền Tinh Cấp 8 Và 500 Tiền Du Long<color>");
end

function tbGift:loi23h40()
	local nTask = me.GetTask(3116,18)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,18, nTask + 1);
	me.AddItem(18,1,114,7);
		me.AddStackItem(18,1,553,1,{bForceBind=1},50)--50-Tiền Du Long
		KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà Lỗi sự cố lâu lan cổ thành ngày 24/01 1 Viên Huyền Tinh Cấp 7 + 50 Tiền Du Long<color>");
end

function tbGift:trianvjet()
	local nTrivi = me.GetTask(3181,1)
	if nTrivi >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3181,1, nTrivi + 1);
    me.AddItem(18,1,114,8);----huyềntinh
    me.AddItem(18,1,114,8);----huyềntinh
	KDialog.MsgToGlobal("<color=pink>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận Quà 12/05 ở Túi Tân Thủ<color>");
end

function tbGift:Tonhjnhai()
	local nTask = me.GetTask(3179,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 8;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3179,1, nTask + 1);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,5);
	me.AddBindCoin(120000);
	me.AddBindMoney(600000);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=gold>[ "..me.szName.." ]<color> đã nhận Quà Tống Kim 22h50 ở Túi Tân Thủ<color>");
end

function tbGift:muoidbnam()
	local nTask = me.GetTask(3178,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3178,1, nTask + 1);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,5);
	me.AddBindCoin(120000);
	me.AddBindMoney(600000);
end

function tbGift:CanhDong()
	local nTask = me.GetTask(3175,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3175,1, nTask + 1);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,5);
	me.AddBindCoin(120000);
	me.AddBindMoney(600000);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=gold>[ "..me.szName.." ]<color> đã nhận Quà 05/05 ở Túi Tân Thủ<color>");
end

function tbGift:DiTongJin()
	local nTask = me.GetTask(3174,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3174,1, nTask + 1);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,5);
	me.AddBindCoin(120000);
	me.AddBindMoney(600000);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận Quà 04/05 ở Túi Tân Thủ<color>");
end

function tbGift:quamocap139()
	local nTask = me.GetTask(3116,40)
	if nTask > 0 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,40, nTask + 1);
	me.AddItem(18,1,114,11);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận Quà Mở sever Cấp 149 ở Túi Tân Thủ 1v HT11<color>");
end

function tbGift:Denbugls()
	local nTask = me.GetTask(3151,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3151,1, nTask + 1);
	me.AddItem(18,1,114,7);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà bảo trì đột xuất 28/04 ở Túi Tân Thủ<color>");
end

function tbGift:loitongkim()
	local nTask = me.GetTask(3116,19)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3116,19, nTask + 1);
	me.AddStackItem(18,1,114,8,nil,1);
	me.AddStackItem(18,1,553,1,nil,200);
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà bảo trì đột xuất 23/01 1v HT8 + 200 tiền du long ở Túi Tân Thủ<color>");
end

function tbGift:QuaBtctc()
	local nTask = me.GetTask(3114,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3114,1, nTask + 1);
	me.AddItem(18,1,114,6);
	me.AddItem(18,1,114,6);
end




function tbGift:MyMyyyyy()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	local nCheck = me.GetTask(3117,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end

	me.SetTask(3117,1, nCheck + 1);
	me.AddStackItem(18,1,114,8,nil,3);
end

function tbGift:loingay8thang8()
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	local nCheck = me.GetTask(3116,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end

	me.SetTask(3116,1, nCheck + 1);
	me.AddStackItem(18,1,114,7,nil,1);
	-- me.AddBindMoney(500000);---Bạc Khóa
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà Quà Đền bù quà Admin ngu chỉnh giờ bảo trì ở Túi Tân Thủ đạt được 1 viên Huyền Tinh 7<color>");
end

function tbGift:DenBuTkk()
    local nNeedBag = 10;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	local nCheck = me.GetTask(3048,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end

	local nCheck = me.GetTask(2024,82)
	if nCheck >= 1 then
		Dialog:Say("Bạn không có số lượt tham gia Bạch Hổ Đường");
		return 0;
	end

	me.SetTask(3048,1, nCheck + 1);
	me.AddStackItem(18,1,114,5,nil,6);
	me.AddBindCoin(150000);
	me.AddBindMoney(150000);
	me.AddExp(15000000);
end

function tbGift:NhanLaiTuMa()

    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 600 then
    	Dialog:Say("<color=green>Cần 600 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 600);

	local pItem = me.AddItem(1,18,2,2);
	if pItem then
	me.SetItemTimeout(pItem, 7*24*60, 0);
	end
end

function tbGift:NhanLaiAn()

    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 3000 then
    	Dialog:Say("<color=green>Cần 3000 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 3000);

	local pItem = me.AddItem(1,18,2,4);
	if pItem then
	me.SetItemTimeout(pItem, 7*24*60, 0);
	end
end

function tbGift:luyenhoado()
	local szMsg = "Thiếu hiệp muốn lấy gì";
	local tbOpt = 
	{
	    {"Bộ Trục Lộc", self.trucloc, self},
	    {"Bộ Tiêu Dao", self.tieudao, self},
	    {"Sách Luyện Hóa Vũ Khí", self.luyenhoavktl, self},
		{"Để ta suy nghĩ đã!"};
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:luyenhoavktl()
	me.AddItem(18,2,385,1); --vũ khí thanh đồng luyện hóa đồ
end

function tbGift:trucloc()
	me.AddItem(18,2,3,1); --Trục Lộc Mạo Tử Luyện Hóa Đồ
	me.AddItem(18,2,3,2); --Trục Lộc Yêu Đái Luyện Hóa Đồ
	me.AddItem(18,2,3,3); --Trục Lộc Hạng Liên Luyện Hóa Đồ
end

function tbGift:tieudao()
	me.AddItem(18,2,1,1); --Tiêu Dao Hộ Uyển Luyện Hóa Đồ
	me.AddItem(18,2,1,2); --Tiêu Dao Yêu Trụy Luyện Hóa Đồ
	me.AddItem(18,2,1,3); --Tiêu Dao Hài Tử Luyện Hóa Đồ
end

function tbGift:MoCpCap()
	local nCapCap = me.GetTask(3051,1)
	if nCapCap >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3051,1, nCapCap + 1);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,7);
	me.AddItem(18,1,114,7);
end

function tbGift:NhanReBiee()
	local nTask = me.GetTask(3090,1)
	if nTask < 1 then
		Dialog:Say(string.format("Bạn không phải tân thủ mới"));
		return 0;
	end
	
    local nNeedBag = 50;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
	local nCheck = me.GetTask(3064,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà tân thủ rồi!"));
		return 0;
	end
	me.SetTask(3064,1, nCheck + 1);
	me.AddStackItem(18,1,114,5,nil,26);
	me.AddStackItem(18,1,114,6,nil,15);
	me.AddStackItem(18,1,114,7,nil,6);
end

function tbGift:QuaBTDX()
	local nTask = me.GetTask(3088,1)
	if nTask >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà bảo trì rồi!"));
		return 0;
	end
	
    local nNeedBag = 5;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	me.SetTask(3088,1, nTask + 1);
	me.AddItem(18,1,114,7);
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận quà bảo trì đột xuất ở Túi Tân Thủ<color>");
end

function tbGift:HoTroCapDo()
	local szMsg = "Bạn có muốn thăng lên cấp độ <color=gold>"..self.Cap_Ho_Tro.."<color>\nSau khi thăng cấp sẽ không thể trở về cấp độ trước đó?";
	local tbOpt = 
	{
	    {"<color=yellow>Tôi đồng ý<color>", self.OkThangCap, self},
		{"Để ta suy nghĩ đã!"};
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbGift:OkThangCap()
	if me.nLevel >= self.Cap_Ho_Tro then
		me.Msg("Bạn đã đạt cấp "..self.Cap_Ho_Tro..", không thể nhận");
		return 0;
	end
	
	if me.nLevel < self.Cap_Ho_Tro then
		me.AddLevel(self.Cap_Ho_Tro-me.nLevel);------cấp độ tân thủ
	end
end

------------------------ QUÀ THĂNG CẤP ---------------------

function tbGift:menuquathangcap()
	local szMsg = "Xin chào <color=yellow>"..me.szName.." !<color>\nMời chọn quà muốn nhận?";
	    local tbOpt =     {}
-- if me.nLevel == 59 then
			-- table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 59<color>",self.quacap59,self});
-- end
-- if me.nLevel == 69 then
			-- table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 69<color>",self.quacap69,self});
-- end
-- if me.nLevel == 79 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 79<color>",self.quacap79,self});
-- end
-- if me.nLevel == 89 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 89<color>",self.quacap89,self});
-- end
-- if me.nLevel == 99 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 99<color>",self.quacap99,self});
-- end
-- if me.nLevel == 109 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 109<color>",self.quacap109,self});
-- end
-- if me.nLevel == 119 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 119<color>",self.quacap119,self});
-- end
-- if me.nLevel == 129 then
			table.insert(tbOpt, {"<color=yellow>Thưởng thăng cấp 129<color>",self.quacap129,self});
-- end
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});

	Dialog:Say(szMsg, tbOpt);
end	

function tbGift:quacap119()
if me.CountFreeBagCell() < 15 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 15 ô trống.");
return 0;
end	

local nCount = me.GetTask(3083,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 119 rồi"));
	return 0;
end

if me.nLevel < 119 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 119"));
	return 0;
end

me.SetTask(3083,1, nCount + 1);
-- me.AddStackItem(18,1,553,1,nil,500); -- 500 tiền du long
me.AddStackItem(18,1,114,10,nil,2); -- 1 huyền tinh cấp 10
-- me.AddBindCoin(1000000);	-- 100v đồng khóa
me.AddBindMoney(500*10000);--bac khoa 200 vạn
-- me.AddStackItem(18,1,377,1,{bForceBind=1},1)--Tần lăng hòa thị bích khóa
end

function tbGift:quacap129()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end	

local nCount = me.GetTask(3063,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 129 rồi"));
	return 0;
end

if me.nLevel < 129 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 129"));
	return 0;
end

me.SetTask(3063,1, nCount + 1);
me.AddStackItem(18,1,553,1,nil,3000); -- 3000 tiền du long
me.AddStackItem(18,1,114,10,nil,3); -- 3 huyền tinh cấp 10
me.AddBindCoin(1000000);	-- 100v đồng khóa
me.AddBindMoney(2000000);--bac khoa 200 vạn
end

function tbGift:quacap59()
local nNeedBag = 20;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    Dialog:Say(szAnnouce);
    return 0;    
end
local nCount = me.GetTask(3023,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 59 rồi"));
	return 0;
end

if me.nLevel < 59 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 59"));
	return 0;
end

me.SetTask(3023,1, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3);
me.AddBindMoney(2000000);--bac khoa 200 vạn
--me.AddStackItem(18,1,553,1,{bForceBind=1},2000);-----Tiền Du Long
--me.AddBindCoin(2000000, Player.emKBINDCOIN_ADD_EVENT)
end

function tbGift:quacap80()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end	

local nCount = me.GetTask(3024,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 80 rồi"));
	return 0;
end

if me.nLevel < 80 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 80"));
	return 0;
end

me.SetTask(3024,1, nCount + 1);
me.AddItem(18,1,114,8);
end

function tbGift:quacap69()
if me.CountFreeBagCell() < 5 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 5 ô trống.");
return 0;
end	

local nCount = me.GetTask(3025,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 69 rồi"));
	return 0;
end

if me.nLevel < 69 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 69"));
	return 0;
end

me.SetTask(3025,1, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5);
me.AddBindMoney(2000000);--bac khoa 200 vạn
end

function tbGift:quacap79()
if me.CountFreeBagCell() < 12 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 12 ô trống.");
return 0;
end	

local nCount = me.GetTask(3026,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 79 rồi"));
	return 0;
end

if me.nLevel < 79 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 79"));
	return 0;
end

me.SetTask(3026,1, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},10);
-- me.AddBindMoney(2000000);--bac khoa 200 vạn
end

function tbGift:quacap89()
if me.CountFreeBagCell() < 12 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 12 ô trống.");
return 0;
end	

local nCount = me.GetTask(3027,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 89 rồi"));
	return 0;
end

if me.nLevel < 89 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 89"));
	return 0;
end

me.SetTask(3027,1, nCount + 1);
-- me.AddStackItem(18,1,114,8,{bForceBind=1},2);
me.AddStackItem(18,1,114,7,{bForceBind=1},10);
me.AddBindMoney(2000000);--bac khoa 200 vạn
end

function tbGift:quacap99()
if me.CountFreeBagCell() < 15 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 15 ô trống.");
return 0;
end	

local nCount = me.GetTask(3039,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 99 rồi"));
	return 0;
end

if me.nLevel < 99 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 99"));
	return 0;
end

me.SetTask(3039,1, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},2);
-- me.AddBindCoin(1000000);	-- 100v đồng khóa
me.AddBindMoney(300*10000);--bac khoa 200 vạn
--me.AddStackItem(18,1,553,1,{bForceBind=1},20000);
--me.AddBindCoin(20000000, Player.emKBINDCOIN_ADD_EVENT)
end

function tbGift:quacap109()
if me.CountFreeBagCell() < 6 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 6 ô trống.");
return 0;
end	

local nCount = me.GetTask(3040,1)
if nCount >= 1 then
	Dialog:Say(string.format("Bạn đã nhận quà cấp độ 109 rồi"));
	return 0;
end

if me.nLevel < 109 then
	Dialog:Say(string.format("Bạn chưa đạt cấp 109"));
	return 0;
end

me.SetTask(3040,1, nCount + 1);
me.AddStackItem(18,1,114,10,{bForceBind=1},1);
-- me.AddStackItem(18,1,553,1,{bForceBind=1},150);----150 tiền du long
me.AddBindMoney(400*10000);--bac khoa 200 vạn
-- me.AddBindCoin(1000000);	-- 100v đồng khóa
--me.AddBindCoin(30000000, Player.emKBINDCOIN_ADD_EVENT)
end

--------------------GIFTCODE----------------------
function tbGift:codefanpage()
local nNeedBag = 6;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
local nCount = me.GetTask(3020,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận Giftcode rồi, không thể nhận thêm");
return 0; 
end
Dialog:AskString("Nhập Mã Code", 15, self.kiemtragc, self);
end

function tbGift:kiemtragc(nCount1)
local nCount = me.GetTask(3020,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận Giftcode rồi, không thể nhận thêm");
return 0; 
end
if (nCount1=="BICHHUYETKIEM") then -------- Mã Gift Code
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận được Phần Thưởng Gift Code TÂN THỦ ! Chúc các bạn có những phút giây chơi game vui vẻ\nMã Code Tân Thủ :<color=pink> BICHHUYETKIEM<color>");
me.SetTask(3020,1, nCount + 1);
-- me.AddItem(21,9,1,1).Bind(1);---Túi 24 Ô
 me.AddStackItem(18,1,114,7,{bForceBind = 1},1);---HT6
 			local nMocNap = me.GetTask(3028,1)
			me.SetTask(3028,1, nMocNap + 250);
me.AddBindCoin(15*10000);---Đồng Khóa
me.AddBindMoney(20*10000);---Bạc Khóa

else 
me.Msg("<color=yellow>Mã GiftCode bạn nhập không chính xác!<color>")
end
end

------------------------------NHẬN TRANG BỊ TÂN THỦ-------------------------------------
function tbGift:NhanDoTanThu()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Thiếu Lâm", self.tl,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
	if tbInfo.nSex == 1 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Nga My", self.nm,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
end
function tbGift:tv()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.tvt,self},
			{"Thiên vương Chùy", self.tvc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:tl()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiếu Lâm Đao", self.tld,self},
			{"Thiếu Lâm Bỗng", self.tlb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:dm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:nd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:mg()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:dt()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đoàn Thị Kiếm", self.dtk,self},
			{"Đoàn Thị Chỉ", self.dtc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:nm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Nga My Chưởng", self.nmc,self},
			{"Nga My Kiếm", self.nmk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:ty()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thúy Yên Đao", self.tyd,self},
			{"Thúy Yên Kiếm", self.tyk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:cb()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.cbr,self},
			{"Cái Bang Bỗng", self.cbb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:tn()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ma Nhẫn", self.tnd,self},
			{"Chiến Nhẫn", self.tnt,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:vd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Võ Đang Khí", self.vdkhi,self},
			{"Võ Đang Kiếm", self.vdkiem,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:cl()

	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Côn Lôn Kiếm", self.clk,self},
			{"Côn Lôn Đao", self.cld,self},
		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGift:tvt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 571-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,632-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,9,630-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,8,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,10,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,4,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,11,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 571-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 622-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 620-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 322-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 322-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:tvc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 581-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,632-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,9,630-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,8,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,10,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,4,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,11,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 581-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 622-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 620-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 322-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 322-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:tld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item1 = me.AddItem(2,1,551-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,632-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,9,630-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,8,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,10,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,4,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,11,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
end
function tbGift:tlb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
		local item1 = me.AddItem(2,  1, 561-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,632-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,9,630-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,8,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,10,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,4,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,11,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
end
function tbGift:dmtt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  2,  80-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  2,  80-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:dmht()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  2,  70-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  2,  70-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:ndd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 591-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 591-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
		
end
function tbGift:ndc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 601-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 601-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:mgk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 981-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 981-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:mgc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 971-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 652-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 650-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 971-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 662-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 660-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 171-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:dtk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 641-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 712-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 710-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 641-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:dtc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 621-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 712-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 710-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 621-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:nmc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item11 = me.AddItem(2,  1, 631-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
function tbGift:nmk()
		local item11 = me.AddItem(2,  1, 641-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
function tbGift:tyd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 611-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 712-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 710-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 611-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:tyk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 641-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 712-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 710-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 352-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 350-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 641-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 722-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 720-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 362-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 360-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 181-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:cbr()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 671-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 752-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 950-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 671-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 762-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 760-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:cbb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 651-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 752-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 950-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 651-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 762-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 760-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:tnd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 681-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 752-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 950-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 681-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 762-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 760-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:tnt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 661-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 752-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 950-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 370-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 661-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 762-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 760-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 380-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 191-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:vdkhi()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 711-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 792-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 790-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 711-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 802-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 800-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:vdkiem()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		me.SetTask(3022,1,1);
		local item1 = me.AddItem(2,  1, 701-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 792-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 790-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 701-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 802-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 800-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:clk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 711-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 792-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 790-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 711-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 802-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 800-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
	
end
function tbGift:cld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 691-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 792-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 790-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 392-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 691-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 802-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 800-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 402-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 201-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		me.SetTask(3022,1,1);
	end
end
----------------------CHECK TÊN NHÂN VẬT NHẬN GIFTCODE TOP 1-------------------------------
function tbGift:top1()
local nNeedBag = 10;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
local nCount = me.GetTask(3182,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận thưởng rồi");
return 0; 
end
me.Msg("<color=yellow>Chúc mừng bạn đã nhận được Phần Thưởng Đua TOP thành công ! Chúc bạn có những phút giây chơi game vui vẻ<color>")
me.SetTask(3182,1, nCount + 1);
me.AddStackItem(18,1,114,7,nil,6);--- 6 huyền tinh cấp 7
me.AddStackItem(18,1,244,2,nil,5);--- 5 rương NHHT 1000
me.AddStackItem(18,1,324,1,nil,5);--- 5 rương vừa đẹp vừa cao quy
me.AddJbCoin(500000); ---- 50 vạn đồng thường
me.Earn(100000,0); -- 10 vạn bạc thường
me.AddBindCoin(300000);  ---30 vạn đồng khóa
me.AddBindMoney(500000);  ---- 50 vạn bạc khóa
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận được Phần Thưởng Đua TOP thành công ! Chúc các bạn có những phút giây chơi game vui vẻ<color>");
end

----------------------CHECK TÊN NHÂN VẬT NHẬN GIFTCODE TOP 2-------------------------------
function tbGift:top2()
local nNeedBag = 10;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
if (me.szName ~= "QuânTửKiếm") and (me.szName ~= "50centimet") then
me.Msg("Nhân vật này không nằm trong danh sách nhận thưởng TOP");
return 0;
end
local nCount = me.GetTask(3183,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận thưởng rồi");
return 0; 
end
me.Msg("<color=yellow>Chúc mừng bạn đã nhận được Phần Thưởng Đua TOP thành công ! Chúc bạn có những phút giây chơi game vui vẻ<color>")
me.SetTask(3183,1, nCount + 1);
me.AddStackItem(18,1,114,7,nil,4);--- 4 huyền tinh cấp 7
me.AddStackItem(18,1,244,2,nil,3);--- 3 rương NHHT 1000
me.AddStackItem(18,1,324,1,nil,3);--- 3 rương vừa đẹp vừa cao quy
me.AddJbCoin(350000); ---- 35 vạn đồng thường
me.Earn(80000,0); -- 8 vạn bạc thường
me.AddBindCoin(250000);  ---25 vạn đồng khóa
me.AddBindMoney(400000);  ---- 40 vạn bạc khóa
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận được Phần Thưởng Đua TOP thành công ! Chúc các bạn có những phút giây chơi game vui vẻ<color>");
end

----------------------CHECK TÊN NHÂN VẬT NHẬN GIFTCODE TOP 3-------------------------------
function tbGift:top3()
local nNeedBag = 10;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
if (me.szName ~= "LêChiêu") and (me.szName ~= "KhanhHung") then
me.Msg("Nhân vật này không nằm trong danh sách nhận thưởng TOP");
return 0;
end
local nCount = me.GetTask(3184,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận thưởng rồi");
return 0; 
end
me.Msg("<color=yellow>Chúc mừng bạn đã nhận được Phần Thưởng Đua TOP thành công ! Chúc bạn có những phút giây chơi game vui vẻ<color>")
me.SetTask(3184,1, nCount + 1);
me.AddStackItem(18,1,114,7,nil,3);--- 3 huyền tinh cấp 7
me.AddStackItem(18,1,244,2,nil,2);--- 2 rương NHHT 1000
me.AddStackItem(18,1,324,1,nil,2);--- 2 rương vừa đẹp vừa cao quy
me.AddJbCoin(250000); ---- 25 vạn đồng thường
me.Earn(50000,0); -- 5 vạn bạc thường
me.AddBindCoin(150000);  ---15 vạn đồng khóa
me.AddBindMoney(300000);  ---- 30 vạn bạc khóa
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận được Phần Thưởng Đua TOP thành công ! Chúc các bạn có những phút giây chơi game vui vẻ<color>");
end

function tbGift:DoCuoi16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Set Trang Bị Nam",self.DoNam16,self};
        {"Set Trang Bị Nữ",self.DoNu16,self },
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:DoNam16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Hệ Kim",self.HeKim16,self};
        {"Hệ Mộc",self.HeMoc16,self};
        {"Hệ Thuỷ",self.HeThuy16,self};
        {"Hệ Hỏa",self.HeHoa16,self};
        {"Hệ Thổ",self.HeTho16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:DoNu16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Hệ Kim",self.HeKim161,self};
        {"Hệ Mộc",self.HeMoc161,self};
        {"Hệ Thuỷ",self.HeThuy161,self};
        {"Hệ Hỏa",self.HeHoa161,self};
        {"Hệ Thổ",self.HeTho161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeKim16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.KimNgoai16,self};
        {"Đồ Nội",self.KimNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeKim161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.KimNgoai161,self};
        {"Đồ Nội",self.KimNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeMoc16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.MocNgoai16,self};
        {"Đồ Nội",self.MocNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeMoc161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.MocNgoai161,self};
        {"Đồ Nội",self.MocNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeThuy16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThuyNgoai16,self};
        {"Đồ Nội",self.ThuyNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeThuy161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThuyNgoai161,self};
        {"Đồ Nội",self.ThuyNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeHoa16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.HoaNgoai16,self};
        {"Đồ Nội",self.HoaNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeHoa161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.HoaNgoai161,self};
        {"Đồ Nội",self.HoaNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeTho16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThoNgoai16,self};
        {"Đồ Nội",self.ThoNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:HeTho161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThoNgoai161,self};
        {"Đồ Nội",self.ThoNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbGift:KimNgoai16()
    me.AddGreenEquip(10,20211,10,5,16); --Th?y Hoàng H?ng Hoang Uy?n
    me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:KimNgoai161()
    me.AddGreenEquip(10,20212,10,5,16);
    me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:KimNoi16()
    me.AddGreenEquip(10,20213,10,5,16);
    me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:KimNoi161()
    me.AddGreenEquip(10,20214,10,5,16);
    me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:MocNgoai16()
    me.AddGreenEquip(10,20215,10,5,16);
    me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:MocNgoai161()
    me.AddGreenEquip(10,20216,10,5,16);
    me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:MocNoi16()
    me.AddGreenEquip(10,20217,10,5,16);
    me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:MocNoi161()
    me.AddGreenEquip(10,20218,10,5,16);
    me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThuyNgoai16()
    me.AddGreenEquip(10,20219,10,5,16);
    me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThuyNgoai161()
    me.AddGreenEquip(10,20220,10,5,16);
    me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThuyNoi16()
    me.AddGreenEquip(10,20221,10,5,16);
    me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThuyNoi161()
    me.AddGreenEquip(10,20222,10,5,16);
    me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:HoaNgoai16()
    me.AddGreenEquip(10,20223,10,5,16);
    me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:HoaNgoai161()
    me.AddGreenEquip(10,20224,10,5,16);
    me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:HoaNoi16()
    me.AddGreenEquip(10,20225,10,5,16);
    me.AddGreenEquip(4,20168,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:HoaNoi161()
    me.AddGreenEquip(10,20226,10,5,16);
    me.AddGreenEquip(4,20168,10,5,16);--V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThoNgoai16()
    me.AddGreenEquip(10,20227,10,5,16);
    me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThoNgoai161()
    me.AddGreenEquip(10,20228,10,5,16);
    me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThoNoi16()
    me.AddGreenEquip(10,20229,10,5,16);
    me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbGift:ThoNoi161()
    me.AddGreenEquip(10,20230,10,5,16);
    me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

----------------------CHECK TÊN NHÂN VẬT NHẬN GIFTCODE TOP 4 > 10-------------------------------
function tbGift:top4den10()
local nNeedBag = 10;
if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
end
if (me.szName ~= "yokaka") and (me.szName ~= "TứThiên") and (me.szName ~= "NgaHoàng") and (me.szName ~= "olDaiCalo") and (me.szName ~= "Gái1ConNè") and (me.szName ~= "AnhCHoiratLay") and (me.szName ~= "TL2009") and (me.szName ~= "ChymĐangSun") and (me.szName ~= "SharkTank") and (me.szName ~= "imFury1") and (me.szName ~= "Caothu") and (me.szName ~= "TheThienHanhDao") then
me.Msg("Nhân vật này không nằm trong danh sách nhận thưởng TOP");
return 0;
end
local nCount = me.GetTask(3185,1);
if nCount >= 1 then
Dialog:Say("Bạn đã nhận thưởng rồi");
return 0; 
end
me.Msg("<color=yellow>Chúc mừng bạn đã nhận được Phần Thưởng Đua TOP thành công ! Chúc bạn có những phút giây chơi game vui vẻ<color>")
me.SetTask(3185,1, nCount + 1);
me.AddStackItem(18,1,114,7,nil,2);--- 2 huyền tinh cấp 7
me.AddStackItem(18,1,244,2,nil,2);--- 2 rương NHHT 1000
me.AddStackItem(18,1,324,1,nil,1);--- 1 rương vừa đẹp vừa cao quy
me.AddJbCoin(150000); ---- 25 vạn đồng thường
me.AddBindCoin(100000);  ---15 vạn đồng khóa
me.AddBindMoney(250000);  ---- 30 vạn bạc khóa
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> nhận được Phần Thưởng Đua TOP thành công ! Chúc các bạn có những phút giây chơi game vui vẻ<color>");
end

function tbGift:NhanDoTanThuTCQ8x()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Thiếu Lâm", self.tl,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
	if tbInfo.nSex == 1 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Nga My", self.nm,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
end
function tbGift:tv()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.tvt,self},
			{"Thiên vương Chùy", self.tvc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:tl()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiếu Lâm Đao", self.tld,self},
			{"Thiếu Lâm Bỗng", self.tlb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:dm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:nd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:mg()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:dt()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đoàn Thị Kiếm", self.dtk,self},
			{"Đoàn Thị Chỉ", self.dtc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:nm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Nga My Chưởng", self.nmc,self},
			{"Nga My Kiếm", self.nmk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:ty()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thúy Yên Đao", self.tyd,self},
			{"Thúy Yên Kiếm", self.tyk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:cb()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.cbr,self},
			{"Cái Bang Bỗng", self.cbb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:tn()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ma Nhẫn", self.tnd,self},
			{"Chiến Nhẫn", self.tnt,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:vd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Võ Đang Khí", self.vdkhi,self},
			{"Võ Đang Kiếm", self.vdkiem,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbGift:cl()

	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Côn Lôn Kiếm", self.clk,self},
			{"Côn Lôn Đao", self.cld,self},
		}
		Dialog:Say(szMsg,tbOpt);
end 

function tbGift:tvt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 211-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,212-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,7,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,10,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,9,210-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,4,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 211-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 222-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 240-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 120-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 122-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 122-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 120-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:tvc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 221-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,212-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,7,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,10,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,9,210-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,4,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 221-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 222-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 240-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 120-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 122-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 122-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 120-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:tld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item1 = me.AddItem(2,1,191-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,212-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,7,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,10,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,9,210-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,4,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
end
function tbGift:tlb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
		local item1 = me.AddItem(2,  1, 201-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,212-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,7,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,10,112-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,9,210-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,110-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,4,60-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,61-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
end
function tbGift:dmtt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  2,  40-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  2,  40-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:dmht()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  2,  30-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  2,  30-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:ndd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
 
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 231-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 231-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
		
end
function tbGift:ndc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 241-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 241-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:mgk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 941-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 941-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:mgc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 931-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 252-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 250-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 132-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 130-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 931-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 262-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 260-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 142-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 70-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 140-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 =  me.AddItem(2,  6, 71-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:dtk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 281-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 292-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 290-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 281-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:dtc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 261-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 292-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 290-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 261-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:nmc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item11 = me.AddItem(2,  1, 261-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
function tbGift:nmk()
		local item11 = me.AddItem(2,  1, 281-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
function tbGift:tyd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 251-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 292-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 290-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 251-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:tyk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 281-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 292-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 290-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 152-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 150-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 281-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 302-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 320-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 162-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 80-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 81-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:cbr()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 311-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 311-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:cbb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 291-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 291-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:tnd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 321-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 321-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:tnt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 301-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 332-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 330-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 172-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 170-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 301-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 342-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 340-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 182-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 90-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 180-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 91-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:vdkhi()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 361-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 361-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:vdkiem()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		me.SetTask(3022,1,1);
		local item1 = me.AddItem(2,  1, 341-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 341-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:clk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 361-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 361-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
end
function tbGift:cld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,  1, 331-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,  3, 372-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,  9, 390-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,  8, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,  7, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2, 10, 192-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2, 11, 190-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
	
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,  1, 331-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item11.Bind(1);
		local item12 = me.AddItem(2,  3, 382-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item12.Bind(1);
		local item13 = me.AddItem(2,  9, 400-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item13.Bind(1);
		local item14 = me.AddItem(2,  8, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item14.Bind(1);
		local item15 = me.AddItem(2,  7, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item15.Bind(1);
		local item16 = me.AddItem(2, 10, 202-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item16.Bind(1);
		local item17 = me.AddItem(2,  5, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item17.Bind(1);
		local item18 = me.AddItem(2,  4, 100-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item18.Bind(1);
		local item19 = me.AddItem(2, 11, 200-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item19.Bind(1);
		local item20 = me.AddItem(2,  6, 101-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item20.Bind(1);
		-- me.AddStackItem(18,1,114,9,{bForceBind=1},5)
		-- me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--100-Tiền Du Long
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
		 me.SetTask(3022,1,1);
	end
end