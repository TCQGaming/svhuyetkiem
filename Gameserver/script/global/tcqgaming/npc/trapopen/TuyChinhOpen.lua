
-- if not SpecialEvent.ConfigAll then
	-- SpecialEvent.ConfigAll = {};
-- end
-- local ConfigAll = SpecialEvent.ConfigAll;

	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	local nWeekDay = tonumber(os.date("%w", nTime));

ConfigAll.TimeOpenSever	= 202412211900
ConfigAll.ThongBao = "Sáng nay<color=yellow> vào lúc 19h00 <color>mới bắt đầu chính thức Open Chính Thức mới có thể lãnh vô hạn truyền tống\n<color=red>Hãy chạy Autoupdate mới nhất để tránh sai hiển thị kỹ năng , trang bị."

ConfigAll.TimeMoShopFF	= 202412212000
ConfigAll.ThongBaoFF = "Trưa nay<color=yellow> vào lúc 20h00 <color>mới bắt đầu có thể mua Phi phong nhanh."

ConfigAll.TimeDuaTOP	= 202407141830
ConfigAll.ThongBaoDuaTOP = "Sự Kiện <color=yellow>Đua TOP Tháng 6 Đã Kết Thúc Rồi"
--============================================================================================================--
												--										Mở cấp giai đoạn						  --
--============================================================================================================--

ThietLap.capdo = 119;

ConfigAll.SoLuongTocTrongBangHoi = 4           -- số tộc trong bang
ConfigAll.GioiHanThanhVienToc = 36           -- số thành viên trong tộc

--============================================================================================================--
												--										Giới Hạn Môn Phái Tống Kim							  --
--============================================================================================================--

ConfigAll.GioiHanKhongTrungPhai_HoaSon = 1           -- 1 là có chặn , 0 là bỏ 
ConfigAll.GioiHanKhongTrungPhai_TongKim = 1           -- 1 là có chặn , 0 là bỏ 
ConfigAll.GioiHanKhongTrungPhai_ThiDauMonPhai = 1           -- 1 là có chặn , 0 là bỏ 
ConfigAll.GioiHanKhongTrungPhaiCTC_Ngai = 1           -- 1 là có chặn , 0 là bỏ 
ConfigAll.GioiHanMonPhai = 1           -- 1 là 1 nhân vật cho 1 môn phái
ConfigAll.GioiHanTongAccPC = 6           -- 6 là 6 nhân vật cho 1 PC
ConfigAll.GioiHanSoAccHoatDong = 12           -- 1 là 1 acc tham gia

--============================================================================================================--
												--										Máu Boss	nhân với 0.9 Phải Bảo Trì								  --
--============================================================================================================--


ConfigAll.Boss_55 = 60375000
ConfigAll.Boss_75 = 150000000
ConfigAll.Boss_95 = 450000000

------Sau khi X8
-- ConfigAll.Boss_55 = 140875000
-- ConfigAll.Boss_75 = 250000000
-- ConfigAll.Boss_95 = 400000000
--============================================================================================================--
												--										Tính năng Đua TOP Cấp Độ  								  --
--============================================================================================================--
ConfigAll.OpenDuaTOP	= 0 --- 0 đóng , 1 mở
ConfigAll.MapCoLuaTrai = 132 ---  ID Máp có thể mở lửa trại

--============================================================================================================--
												--										Tính năng Khảm Nạm 								  --
--============================================================================================================--

ConfigAll.OpenKham	= 0 --- 0 đóng , 1 mở
--------Thưởng rương nhiệm vụ ngày
ConfigAll.nSoRuong_NhiemVuNgay	= 1 --- Số lượng rương
--------Thưởng rương BVD
ConfigAll.nSoRuong_NV_BVD	= 1 --- Số lượng rương
---------Vận Tiêu 
ConfigAll.nSoRuong_TieuTim	= 1 --- Số lượng rương tím
ConfigAll.nSoRuong_TieuCam	= 2 --- Số lượng rương cam
--------Hoa sơn luân kiếm
ConfigAll.nSoRuong_ThamGia_HoaSon	= 3 --- Số lượng rương 
ConfigAll.nSoRuong_VoDichNguHanh_HoaSon	= 7 --- Số lượng rương
ConfigAll.nSoRuong_VoDichVLMC_HoaSon	= 20 --- Số lượng rương
-------- Thất thành đại chiến 
ConfigAll.nSoRuong_ThatThanh_LA	= 50 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_BK	= 45 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_PT	= 10 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_DC	= 10 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_TuongDuong	= 10 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_ThanhDo	= 10 --- Số lượng rương
ConfigAll.nSoRuong_ThatThanh_DaiLy	= 10 --- Số lượng rương
-------- CTC Ngai vàng 
--Bang chủ
ConfigAll.nSoRuong_BC_TOP1 = 20 --- Số lượng rương
ConfigAll.nSoRuong_BC_TOP2 = 10 --- Số lượng rương
ConfigAll.nSoRuong_BC_TOP3 = 5 --- Số lượng rương
ConfigAll.nSoRuong_BC_TOP4 = 2 --- Số lượng rương
--Thành viên 
ConfigAll.nSoRuong_TV_TOP1 = 10 --- Số lượng rương
ConfigAll.nSoRuong_TV_TOP2 = 5 --- Số lượng rương
ConfigAll.nSoRuong_TV_TOP3 = 2 --- Số lượng rương
ConfigAll.nSoRuong_TV_TOP4 = 1 --- Số lượng rương
-------- Tống Kim 21:00
ConfigAll.nSoRuong_TK_TOP1 = 6 --- Số lượng rương
ConfigAll.nSoRuong_TK_TOP2 = 4 --- Số lượng rương
ConfigAll.nSoRuong_TK_TOP3den10 = 3 --- Số lượng rương
ConfigAll.nSoRuong_TK_TOP11den20 = 2 --- Số lượng rương
ConfigAll.nSoRuong_TK_ThamGia = 1 --- Số lượng rương
-----Loạn phái
ConfigAll.nSoRuong_LoanPhai_TOP1 = 10 --- Số lượng rương
ConfigAll.nSoRuong_LoanPhai_TOP2 = 7 --- Số lượng rương
ConfigAll.nSoRuong_LoanPhai_TOP3va4 = 5 --- Số lượng rương
ConfigAll.nSoRuong_LoanPhai_TOP5va8 = 2 --- Số lượng rương
ConfigAll.nSoRuong_LoanPhai_TOP9va16 = 1 --- Số lượng rương
-----Nhiệm vụ ngày hoàng kim
ConfigAll.nSoRuong_NhiemVuNgayHK = 5 --- Số lượng rương
-----Giết Tần Thủy Hoàng - Hỏa kỳ lân
ConfigAll.nSoRuong_KetLieu_TTH = 20 --- Số lượng rương
ConfigAll.nSoRuong_KetLieu_HKL = 50 --- Số lượng rương
-------Lôi Đài Bang Hội 16 vs 16
ConfigAll.nSoRuong_loidaibanghoi = 1 --- Số lượng rương
-------Boss BHĐ Đặc biệt
ConfigAll.nSoRuong_Boss_BHD_DacBiet = 20 --- Số lượng rương

--============================================================================================================--

--============================================================================================================--
												--										Phụ Tu Môn Phái								  --
--============================================================================================================--

 Faction.MAX_USED_FACTION			= 3

--============================================================================================================--
												--										Điểm Hoạt Động										  --
--============================================================================================================--
 function ConfigAll.DiemHoatDong()
	local nDiemHoatDong = me.GetTask(9177,1) --DAY
		me.SetTask(9177,1,nDiemHoatDong +1);
		me.Msg("<color=yellow>Nhận thành công (+1 điểm hoạt động)<color>");
end 
 function ConfigAll.DiemHoatDong5Diem()
	local nDiemHoatDong = me.GetTask(9177,1) --DAY
	me.SetTask(9177,1,nDiemHoatDong +5);
	me.Msg("<color=yellow>Nhận thành công (+5 điểm hoạt động)<color>");
end 

--============================================================================================================--
												--										Đóng Mở Tính Năng - 0 là đóng 1 là mở									  --
--============================================================================================================--
ConfigAll.VanTieu = 1
ConfigAll.HoatDongNguHanh = 1
ConfigAll.HoatDongLoiDai16 = 0
ConfigAll.NpcMinhChuVoLam = 0
ConfigAll.TieuDuLong = 0-- Tiểu Du Long 0 là đóng , 1 là mở bán thương gia tiêu dao
ConfigAll.XuatHienBossDacBiet_BHD = 0 ---- 0 là sơ , 1 là cao
ConfigAll.GioiHanEXP = 119
--============================================================================================================--
												--										Liên quan Event Nguyên Liệu Ra Tống Kim	18,1,2034,3								  --
--============================================================================================================--

ConfigAll.KhoiDong_NL_Event_TongKim	= 1 ----- 0 là đóng --- 1 là mở ra nguyên liệu event trong top TK
ConfigAll.KhoiDong_VatPham_DuaTOP_TongKim	= 0 ----- 0 là đóng --- 1 là mở ra nguyên liệu đua top event trong top TK
ConfigAll.NguyenLieu_Event = {18,1,2023,2} ----- Nguyên liệu này phát thưởng top tống kim các trận
ConfigAll.VatPham_DuaTOP = {18, 1, 2033, 9} ----- Vật Phẩm Đua TOP
--============================================================================================================--
												--	Liên quan đến giai đoạn mở đồng hành thiệp pet phát tâm tâm tương ánh phù trong tống kim								  --
--============================================================================================================--

ConfigAll.KhoiDong_NL_TamTamTuongAnhPhu	= 0 ----- 0 là đóng --- 1 là mở ra nguyên liệu event trong top TK
ConfigAll.NguyenLieu_TamTamTuongAnhPhu = {18,1,1327,15} ----- Nguyên liệu này phát thưởng top tống kim các trận
--============================================================================================================--
												--										Config thưởng TOP Tống Kim Tuần 								  --
--============================================================================================================--

ConfigAll.ThuongTop_Tuan_TK_GiaiDoan	= 0 --- 0 Là giai đoạn dưới 119 , 1 là trên 119 có thủy long vương

--============================================================================================================--
												--			Config thưởng TOP Nạp Tuần _ Có Cho Thủy Long Vương ( Kỹ Năng 1 Cấp ) hay không 		  --
--============================================================================================================--

ConfigAll.ThuongTop_Tuan_Nap	= 0 --- 0 là không cho , 1 là có cho thưởng dành cho TOP 1
ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x	= 0 --- 0 là dưới 12x , 1 là trên 12x


--============================================================================================================--
												--	----Config thưởng TOP Tống Kim 21h00 giai đoạn --- 0 là dưới 119 , 1 là trên 120 		  --
--============================================================================================================--

ConfigAll.TongKim21h00_GiaiDoan70_119 = 0

--============================================================================================================--
												--										Giới Hạn Tài Phú Các Hoạt Động									  --
--============================================================================================================--
------Giới Hạn Tài Phú CTC , tranh đoạt lãnh thổ , Ngũ Hành Phái
ConfigAll.GioiHanTaiPhu	= 0
ConfigAll.ThongBaoGioiHan = "Bạn không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu.." <color>điểm Tài Phú để tham gia hoạt động này<color>"
------Giới Hạn Tài Phú Nhiệm vụ ngày cổ phong hà 
ConfigAll.GioiHanTaiPhuNVN	= 0
------Giới Hạn Tài Phí Tiêu Dao Cốc 
ConfigAll.GioiHanTaiPhuTDC	= 0
------Giới Hạn Tài Phú Vận Tiêu 
ConfigAll.GioiHanTaiPhu_VanTieu	= 0
------Giới Hạn Tài Phú BHĐ 
ConfigAll.GioiHanTaiPhu_BHD	= 0
ConfigAll.GioiHanTaiPhu_LauLan	= 0 -----Lâu lan 
ConfigAll.GioiHanTaiPhu_LienDau	= 0 -----Liên Đấu 
------Giới Hạn Tài Phú Theo Cấp Phi Phong Tần Lăng
ConfigAll.GioiHanTaiPhu_TanLang	= 6 -----6 là hỗn thiên

--============================================================================================================--
												--										Cấp Độ Tân Thủ Login 										  --
--============================================================================================================--
ConfigAll.CapDoTanThu	= 119 ------player.lua
function ConfigAll.playerevent_login()
	-- me.AddItem(1,27,1,1).Bind(1);-----Long hồn rồng
	me.AddStackItem(21,8,1,1,{bForceBind = 1},2);---Túi Da Chồn
	-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},15);---trung rong
	me.AddItem(18,1,236,1).Bind(1);--Lệnh Bài 20 Uy Danh
	me.AddItem(1,12,1,1).Bind(1);----Táo Hồng
	me.AddItem(1,12,4,2).Bind(1);----ô truy 60
	me.AddFightSkill(10, 20);---Khinh Công
--------------------------5 viên ht5------------------------
	me.AddStackItem(18,1,114,5,{bForceBind=1},5);-----5 Viên ht5
	-- me.AddStackItem(18,1,114,10,{bForceBind=1},5);-----1 Viên ht9 - ho tro
	-- me.AddStackItem(18,1,524,1,{bForceBind=1},900);-----vé du long
	 me.AddItem(19,3,1,6)-- ngọc trúc hoa mai tháng 79
me.AddBindCoin(15*10000);---Đồng Khóa
me.AddBindMoney(200*10000);---Bạc Khóa
	-- me.AddItem(19,3,1,7).Bind(1);---Ngọc Trúc Hoa Mai Thức Ăn Tháng 90
	 me.AddStackItem(18,1,205,1,{bForceBind = 1},1000);---Ngũ Hành Hồn Thạch
	        me.AddStackItem(18,1,1327,14,{bForceBind=1},12)---Bùa chuyển cường hóa
	me.AddItem(18,1,235,1).Bind(1);--Vô Hạn Truyền Tống Phù
	for i=1,10 do me.SaveLifeSkillLevel(i,70) end---- kỹ năng sống
	KDialog.MsgToGlobal("<color=yellow>Chúc mừng <color=cyan>[ "..me.szName.." ]<color> đã nhận quà tân thủ gia nhập Sever kỹ năng sống cấp 70 vui lòng thoát game đăng nhập lại trước khi chế tạo đồ F8<color>");
	Dialog:Say(string.format("Kỹ năng sống đã đạt cấp 70 vui lòng vào lại game để cập nhật\nNếu không thoát - mà cố tình chế đồ trước khi cập nhật cấp độ 70 chúng tôi không hỗ trợ với những account cố tình khiến lỗi về cấp độ 1"));
	------Hỗ trợ tân thủ s4 giai đoạn 89
	-- me.SetTask(9188,2,1)
end 

--============================================================================================================--
												--										Công Thành Chiến										  --
--============================================================================================================--
ConfigAll.GiaiDoanCTC_NgaiVang	= 1 -----1 là dưới 100 , 0 là trên 100
			------Thưởng Mốc Tích Nạp TOP CTC-----
	local nMocTichNapCTCTOP1 = 100
	local nMocTichNapCTCTOP2 = 50
	local nMocTichNapCTCTOP3 = 25
	local nMocTichNapCTCTOP4 = 25
	local nTichNapCTC_ThanhVien_TOP1 = 50
	local nTichNapCTC_ThanhVien_TOP2 = 25
	local nTichNapCTC_ThanhVien_TOP3 = 25
	local nTichNapCTC_ThanhVien_TOP4 = 25
------------Bang Chủ Lãnh Thưởng -----------------
function ConfigAll.BangChu_CTC_Bang_TOP1()
		me.AddStackItem(18,1,114,8,{bForceBind=1},2);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},250);----Tiền Du Long
me.AddBindCoin(100*10000);---Đồng Khóa
    -- me.AddJbCoin(25*10000); -- Đồng thường
me.AddBindMoney(500*10000);---Bạc Khóa
		
end 	
		
function ConfigAll.BangChu_CTC_Bang_TOP2()
		me.AddStackItem(18,1,114,8,{bForceBind=1},1);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},200);----Tiền Du Long
me.AddBindCoin(80*10000);---Đồng Khóa
    -- me.AddJbCoin(20*10000); -- Đồng thường
me.AddBindMoney(400*10000);---Bạc Khóa
end 

function ConfigAll.BangChu_CTC_Bang_TOP3()
		me.AddStackItem(18,1,114,7,{bForceBind=1},2);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},150);----Tiền Du Long
me.AddBindCoin(60*10000);---Đồng Khóa
    me.AddJbCoin(15*10000); -- Đồng thường
me.AddBindMoney(300*10000);---Bạc Khóa
end 
function ConfigAll.BangChu_CTC_Bang_TOP4()
		me.AddStackItem(18,1,114,7,{bForceBind=1},1);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},100);----Tiền Du Long
me.AddBindCoin(40*10000);---Đồng Khóa
    -- me.AddJbCoin(10*10000); -- Đồng thường
me.AddBindMoney(200*10000);---Bạc Khóa
end 


------------Thành Viên Lãnh Thưởng -----------------
function ConfigAll.ThanhVien_CTC_Bang_TOP1()
		me.AddStackItem(18,1,114,8,{bForceBind=1},2);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},250);----Tiền Du Long
me.AddBindCoin(100*10000);---Đồng Khóa
    -- me.AddJbCoin(25*10000); -- Đồng thường
me.AddBindMoney(500*10000);---Bạc Khóa
		
end 	

function ConfigAll.ThanhVien_CTC_Bang_TOP2()
		me.AddStackItem(18,1,114,8,{bForceBind=1},1);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},200);----Tiền Du Long
me.AddBindCoin(80*10000);---Đồng Khóa
    -- me.AddJbCoin(20*10000); -- Đồng thường
me.AddBindMoney(400*10000);---Bạc Khóa
end 

function ConfigAll.ThanhVien_CTC_Bang_TOP3()
		me.AddStackItem(18,1,114,7,{bForceBind=1},2);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},150);----Tiền Du Long
me.AddBindCoin(60*10000);---Đồng Khóa
    -- me.AddJbCoin(15*10000); -- Đồng thường
me.AddBindMoney(300*10000);---Bạc Khóa
end 

function ConfigAll.ThanhVien_CTC_Bang_TOP4()
		me.AddStackItem(18,1,114,7,{bForceBind=1},1);-------Huyền tinh 8 X3
		me.AddStackItem(18,1,553,1,{bForceBind=1},100);----Tiền Du Long
me.AddBindCoin(40*10000);---Đồng Khóa
    -- me.AddJbCoin(10*10000); -- Đồng thường
me.AddBindMoney(200*10000);---Bạc Khóa
end 

--============================================================================================================--
												--										Liên đấu										  --
--============================================================================================================--
function ConfigAll.ThuongThangTranLienDau()
		me.AddStackItem(18,1,114,6,{bForceBind=1},1);
me.AddBindCoin(10*10000);---Đồng Khóa
end 
function ConfigAll.ThuongTop1LienDau()
		me.AddStackItem(18,1,114,9,{bForceBind=1},3);
end 

function ConfigAll.ThuongTop2LienDau()
		me.AddStackItem(18,1,114,9,{bForceBind=1},2);
end 

function ConfigAll.ThuongTop3LienDau()
		me.AddStackItem(18,1,114,9,{bForceBind=1},1);
end 
function ConfigAll.ThuongTop4Den10LienDau()
		me.AddStackItem(18,1,114,8,{bForceBind=1},1);
end 

--============================================================================================================--
												--										Bạch Hổ Đường										  --
--============================================================================================================--
 function ConfigAll.ThuongQuaAiBachHoDuong()
 	local nEvent = ConfigAll.KhoiDong_NL_Event_TongKim
			local NguyenLieu_Event = ConfigAll.NguyenLieu_Event
		me.AddBindCoin(10000);	----- Đồng khóa 5 vạn
		me.AddExp(200000);
	    me.AddBindMoney(10000);
		me.AddItem(18,1,114,5);
		me.AddStackItem(18,1,553,1,{bForceBind=1},5)  --Tiền Du Long
		me.AddStackItem(18,1,2028,7,{bForceBind=1},2)-- sao chiến tích 
		me.AddKinReputeEntry(1);---Uy Danh qua trap
		 			local nMocNap = me.GetTask(3028,1)
			me.SetTask(3028,1, nMocNap + 5);
		-- ConfigAll.DiemHoatDong()
					 me.Msg("Chúc mừng bạn đã nhận được 1 vạn đồng khóa\n1 vạn bạc khóa \n200k exp\n5 tiền du long\n1 uy danh\n1 sao chiến tích \n5 vạn mốc nạp\n1 Huyền tinh 5 khi qua tầng BHĐ")
		if nEvent == 1 then 
		me.AddStackItem(NguyenLieu_Event[1], NguyenLieu_Event[2], NguyenLieu_Event[3], NguyenLieu_Event[4],nil,15);----50 Giỏ Event
		end 
end 
--============================================================================================================--
												--										Loạn Phái									  --
--============================================================================================================--
-- ====================== CẤU HÌNH DANH HIỆU MÔN PHÁI ======================
local tbFactionTitle = {
    [1] = 1,  -- Thiếu Lâm
    [2] = 2,  -- Thiên Vương
    [3] = 3,  -- Đường Môn
    [4] = 4,  -- Ngũ Độc
    [5] = 5,  -- Nga My
    [6] = 6,  -- Thúy Yên
    [7] = 7,  -- Cái Bang
    [8] = 8,  -- Thiên Nhẫn
    [9] = 9,  -- Võ Đang
    [10] = 10,-- Côn Lôn
    [11] = 11,-- Minh Giáo
    [12] = 12 -- Đoàn Thị
};

local function AddTanNhanVuongTitle(pPlayer)
    if not pPlayer or not pPlayer.nFaction then
        return 0;
    end
    local nFaction = pPlayer.nFaction;
    local nLevel = tbFactionTitle[nFaction];
    if nLevel then
        pPlayer.AddTitle(4, 1, nLevel, 1);  -- Danh hiệu Tân Nhân Vương cho từng phái
    end
end

-- ====================== HÀM GHI LOG ======================
local function WriteLog(szFile, szMsg)
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime());
    local logMessage = szMsg .. ", Thời gian: " .. szDate;
    local szData = KFile.ReadTxtFile(szFile);
    if szData then
        szData = szData .. "\n" .. logMessage;
    else
        szData = logMessage;
    end
    KFile.WriteFile(szFile, szData);
end

-- ====================== HÀM TRAO THƯỞNG CHUNG ======================
local function AddReward(nHTItem, nHTCount, nJbCoin, nUyDanh, nMocNapAdd, szMsg, szLogFile, szLogTitle)
    me.AddStackItem(18, 1, 114, nHTItem, {bForceBind=1}, nHTCount); -- Huyền Tinh
    me.AddJbCoin(nJbCoin * 10000); -- Đồng thường
    me.AddKinReputeEntry(nUyDanh); -- Uy danh
    local nMocNap = me.GetTask(3028,1);
    me.SetTask(3028,1, nMocNap + nMocNapAdd);
    me.Msg(szMsg .. "\nTổng mốc tích nạp hiện nay là: <color=gold>".. nMocNap .."<color>");
    WriteLog(szLogFile, string.format("Nhân Vật: %s, Tài Khoản: %s, %s", me.szName, me.szAccount, szLogTitle));
end

-- ====================== HÀM XỬ LÝ TOP1 ======================
function ConfigAll.LoanPhaiTOP1()
    local nWeek = tonumber(GetLocalDate("%w"));
    if nWeek == 2 then  -- Thứ 3 Loạn Phái
        me.AddTitle(44,1,1,1); -- Danh hiệu Quán Quân Đại Hội
        AddReward(8, 1, 300, 30, 300, 
            "Bạn nhận thưởng Quán Quân Loạn Phái:\n+1 Huyền Tinh 8\n+30 điểm uy danh\n+300 vạn đồng thường\n+300 mốc tích nạp", 
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt", 
            "Đã Nhận Thưởng Loạn Phái TOP 1");
    elseif nWeek == 5 then -- Thứ 6 Thi Đấu Môn Phái
        AddTanNhanVuongTitle(me);
        AddReward(7, 1, 50, 10, 200, 
            "Bạn nhận thưởng Tân Nhân Vương:\n+1 Huyền Tinh 7\n+10 điểm uy danh\n+50 vạn đồng thường\n+200 mốc tích nạp", 
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongmonphai.txt", 
            "Đã Nhận Thưởng Môn Phái TOP 1");
    end
end

-- ====================== TOP 2 ======================
function ConfigAll.LoanPhaiTOP2()
    local nWeek = tonumber(GetLocalDate("%w"));
    if nWeek == 2 then
        me.AddTitle(44,1,2,1);
        AddReward(7, 2, 200, 20, 200, 
            "Bạn nhận thưởng Á Quân Loạn Phái:\n+2 Huyền Tinh 7\n+20 điểm uy danh\n+200 vạn đồng thường\n+200 mốc tích nạp", 
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt", 
            "Đã Nhận Thưởng Loạn Phái TOP 2");
    elseif nWeek == 5 then
        AddReward(7, 1, 25, 7, 150, 
            "Bạn nhận thưởng Á Quân Môn Phái:\n+1 Huyền Tinh 7\n+7 điểm uy danh\n+25 vạn đồng thường\n+150 mốc tích nạp", 
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongmonphai.txt", 
            "Đã Nhận Thưởng Môn Phái TOP 2");
    end
end

-- ====================== TOP 3 ======================
function ConfigAll.LoanPhaiTOP3()
    local nWeek = tonumber(GetLocalDate("%w"));
    if nWeek == 2 then
        AddReward(7, 2, 100, 10, 150, 
            "Bạn nhận thưởng Bán Kết Loạn Phái:\n+2 HT7\n+10 uy danh\n+100 vạn đồng thường\n+150 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt",
            "Đã Nhận Thưởng Loạn Phái TOP 3");
    elseif nWeek == 5 then
        AddReward(7, 1, 10, 5, 100, 
            "Bạn nhận thưởng Bán Kết Môn Phái:\n+1 HT7\n+5 uy danh\n+10 vạn đồng thường\n+100 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongmonphai.txt",
            "Đã Nhận Thưởng Môn Phái TOP 3");
    end
end

-- ====================== TOP 4 ======================
function ConfigAll.LoanPhaiTOP4()
    local nWeek = tonumber(GetLocalDate("%w"));
    if nWeek == 2 then
        AddReward(7, 1, 50, 10, 100, 
            "Bạn nhận thưởng Tứ Kết Loạn Phái:\n+1 HT7\n+10 uy danh\n+50 vạn đồng thường\n+100 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt",
            "Đã Nhận Thưởng Loạn Phái TOP 4");
    elseif nWeek == 5 then
        AddReward(6, 2, 0, 3, 50, 
            "Bạn nhận thưởng Tứ Kết Môn Phái:\n+2 HT6\n+3 uy danh\n+50 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongmonphai.txt",
            "Đã Nhận Thưởng Môn Phái TOP 4");
    end
end
-- ====================== TOP 5-16 ======================
function ConfigAll.LoanPhaiTOP_5_16()
    local nWeek = tonumber(GetLocalDate("%w"));
    if nWeek == 2 then
        AddReward(7, 1, 0, 6, 50, 
            "Bạn nhận thưởng Vòng Loại Loạn Phái:\n+1 HT7\n+6 uy danh\n+50 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt",
            "Đã Nhận Thưởng Loạn Phái TOP 5-16");
    elseif nWeek == 5 then
        AddReward(6, 1, 0, 2, 30, 
            "Bạn nhận thưởng Vòng Loại Môn Phái:\n+1 HT6\n+2 uy danh\n+30 mốc nạp",
            "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongmonphai.txt",
            "Đã Nhận Thưởng Môn Phái TOP 5-16");
    end
end

------=====Thưởng Báo Danh Tham Gia Loạn Phái=====------
function ConfigAll.ThuongBaoDanh(nWeekDay)
    me.AddItem(18,1,114,7);
	local nMocNap = me.GetTask(3028,1)
	me.SetTask(3028,1, nMocNap + 20);
	me.Msg("Chúc mừng bạn nhận được 1 Huyền Tinh 7 và 20 vạn đồng tích nạp thẻ\nTổng mốc tích nạp hiện nay là<color=gold> : "..nMocNap.."")
    me.SetTask(3118,50, 0);    
    -- me.SetTask(3118,49, 1);    -- Giới hạn thưởng tuần
    
    -- Đánh dấu đã nhận thưởng theo ngày
    if nWeekDay == 2 then      -- Thứ 3
        me.SetTask(3118,51, 1) -- Đánh dấu đã nhận thưởng Thứ 3
    else                       -- Thứ 6
        me.SetTask(3118,52, 1) -- Đánh dấu đã nhận thưởng Thứ 6
    end
    
 --  ConfigAll.DiemHoatDong5Diem()
    
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Tham Gia Loạn Phái (%s), Thời gian: %s", 
        me.szName, me.szAccount, nWeekDay == 2 and "Thứ 3" or "Thứ 6", szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloanphai.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

--============================================================================================================--
												--										Thưởng Top Tống Kim Tuần										  --
--============================================================================================================--
function ConfigAll.TOP_1_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
		-- me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},50);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},2000);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tống Kim hàng tuần<color>: <color=yellow>3 Trứng Rồng Và 2 Viên Huyền Tinh 8\n2000 VSV<color> thành công");
		me.AddStackItem(18,1,114,9,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,500);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},2000);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 9\n2000 VSV\n500 Rương trang bị đồng hành<color> thành công");

else 
		local nThuyLongVuong = me.AddItem(1,12,20520,4);
		nThuyLongVuong.Bind(1);
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},100);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,9,{bForceBind = 1},1);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},2000);-----VSV
		--------------------------------
		me.SetItemTimeout(nThuyLongVuong, 6*24*60, 0);
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tống Kim hàng tuần<color>: <color=yellow>1 Viên Huyền Tinh 9\n100 Sách EXP Chân Nguyên\n2000 VSV\n1 Thú Cưỡi Thủy Long Vương HSD 1 Tuần<color> thành công");
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 1 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_2_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
		-- me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},2);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},40);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},1500);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7 và 2 Trứng Rồng\n1500 VSV<color> thành công");	
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},2);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,250);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},1500);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 8\n1500 VSV\n250 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},80);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
				me.AddStackItem(18,1,325,1,{bForceBind = 1},1500);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 9\n80 Sách EXP Chân Nguyên\n1500 VSV<color> thành công");
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 2 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_3_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,7,{bForceBind = 1},1);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},1000);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tống Kim hàng tuần<color>: <color=yellow>1 Huyền Tinh Cấp 7 và 1 Trứng Rồng\n1000 VSV<color> thành công");	
			me.AddStackItem(18,1,114,8,{bForceBind = 1},1);     --HT
		me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,200);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},1000);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tống Kim hàng tuần<color>: <color=yellow>1 Huyền Tinh Cấp 8\n1000 VSV\n200 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},50);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,9,{bForceBind = 1},1);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
				me.AddStackItem(18,1,325,1,{bForceBind = 1},1000);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tống Kim hàng tuần<color>: <color=yellow>1 Viên Huyền Tinh 9\n50 Sách EXP Chân Nguyên\n1000 VSV<color> thành công");
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 3 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_4_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},500);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n500 VSV<color> thành công");	
			me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,150);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n500 VSV\n150 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n500 VSV<color> thành công");
		--------------------------------
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 4 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_5_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 5 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
		me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 5 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 5 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
		----------------------------------
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 5 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_6_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
				-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 6 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
				me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 6 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 6 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 6 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_7_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 7 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
				me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 7 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 7 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
		----------------------------------
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 7 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_8_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 8 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
				me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 8 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 8 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 8 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_9_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành	
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 9 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
				me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 9 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 9 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
		--------------------------------
end 
						local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 9 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.TOP_10_TongKim_Tuan()
 local nEvent = ConfigAll.ThuongTop_Tuan_TK_GiaiDoan
 if nEvent == 0 then 
	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		-- me.AddStackItem(18,1,1875,1,{bForceBind = 1},30);-----rương tb đồng hành
		-- me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 10 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 6 và 1 Trứng Rồng\n250 VSV<color> thành công");	
				me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},1);---Trứng Rồng
		me.AddStackItem(18,1,1875,1,nil,100);-----rương tb đồng hành
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 10 Tống Kim hàng tuần<color>: <color=yellow>2 Huyền Tinh Cấp 7\n250 VSV\n100 Rương trang bị đồng hành<color> thành công");	
else 
		me.AddStackItem(18,1,1333,1,{bForceBind = 1},30);-----Sach Exp Chan Nguyen
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
		me.AddStackItem(18,1,325,1,{bForceBind = 1},250);-----VSV
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 10 Tống Kim hàng tuần<color>: <color=yellow>2 Viên Huyền Tinh 8\n30 Sách EXP Chân Nguyên\n250 VSV<color> thành công");
end 
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 10 Tống Kim Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongtongkimtuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
--============================================================================================================--
												--										Thưởng Lôi Đài 16 Vs 16 Bang										  --
--============================================================================================================--
function ConfigAll.LoiDai16Thuong()
        me.AddStackItem(18, 1, 114, 8, nil, 2) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 200); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
		ConfigAll.DiemHoatDong5Diem()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Lôi Đài 16 Thắng, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongloidai16win.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
--============================================================================================================--
												--										Thưởng Hoa Sơn Luận Kiếm Ngũ Hành Phái										  --
--============================================================================================================--
 function ConfigAll.ThuongThamGia_NguHanh()
        me.AddStackItem(18, 1, 114, 6, {bForceBind=1}, 1) --
		me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 100); -- tiendulong
		-- me.AddStackItem(18,1,1333,1,{bForceBind=1},20)---Sách kinh nghiệm chân nguyên
		me.AddBindCoin(25000);
		me.AddBindMoney(25000);
		    local nMocNap = me.GetTask(3028,1);
    me.SetTask(3028,1, nMocNap + 10);
		-- ConfigAll.DiemHoatDong5Diem()
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Tham Gia Hoa Sơn, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuonghoason.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function ConfigAll.DeNhat_NguHanh()
        me.AddStackItem(18, 1, 114, 7, {bForceBind=1}, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 150); -- tiendulong
		-- me.AddStackItem(18,1,1333,1,{bForceBind=1},50)---Sách kinh nghiệm chân nguyên
		me.AddBindCoin(25000);
		me.AddBindMoney(25000);
		-- ConfigAll.DiemHoatDong5Diem()
				    local nMocNap = me.GetTask(3028,1);
    me.SetTask(3028,1, nMocNap + 10);
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Đệ Nhất Ngũ Hành, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuonghoason.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Thuong_VoLam_MinhChu()
         me.AddStackItem(18, 1, 114, 8, {bForceBind=1}, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 250); -- tiendulong
		-- me.AddStackItem(18,1,1333,1,{bForceBind=1},100)---Sách kinh nghiệm chân nguyên
		me.AddBindCoin(25000);
		me.AddBindMoney(25000);
		-- ConfigAll.DiemHoatDong5Diem()
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Võ Lâm Minh Chủ Hoa Sơn, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuonghoason.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 


--============================================================================================================--
												--										Thưởng Top Nap Tuần										  --
--============================================================================================================--
 function ConfigAll.Top_1_NapTuan()
  local nThuyLongVuong = ConfigAll.ThuongTop_Tuan_Nap
  local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
 if nThuyLongVuong == 1 then 
 		local nThuyLongVuong = me.AddItem(1,12,20520,4);
		nThuyLongVuong.Bind(1);
		me.SetItemTimeout(nThuyLongVuong, 6*24*60, 0);
end 	
if nGioiHanGiaiDoan == 0 then 
		-- me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT giai doan duoi 90
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2 // giai doan duoi 90
		-- me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món giai doan duoi 90
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tích Lũy Nạp Tuần<color>: <color=yellow>10 Lệnh Bài Đồ Hải Tặc Cấp 2\n1 Bổ Tu Lệnh\n2 Viên Huyền Tinh 8\n100 Rương trang bị đồng hành\n"..nThuyLongVuong.." Thú Cưỡi Thủy Long Vương<color> thành công");

		me.AddStackItem(18,1,114,9,{bForceBind = 1},2);     --HT giai doan tren 90
		me.AddStackItem(18,1,2025,12,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 3 // giai doan tren 90
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		me.AddStackItem(18,1,1875,1,nil,500)---Ruong đồng hành 10 món giai doan tren 90
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tích Lũy Nạp Tuần<color>: <color=yellow>10 Lệnh Bài Đồ Hải Tặc Cấp 3\n1 Bổ Tu Lệnh\n2 Viên Huyền Tinh 9\n500 Rương trang bị đồng hành\n"..nThuyLongVuong.." Thú Cưỡi Thủy Long Vương<color> thành công");
else 
		me.AddStackItem(18,1,114,9,{bForceBind = 1},3);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},2000);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},20)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},5)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 1 Tích Lũy Nạp Tuần<color>: <color=yellow>2000 Vỏ Sò Vàng\n5 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n20 Cờ Chiến Công\n3 Viên Huyền Tinh 9\n"..nThuyLongVuong.." Thú Cưỡi Thủy Long Vương<color> thành công");
	end 
			me.AddTitle(72,1,1,1); -- Tuyệt Đỉnh Phú Hào -Danh Hiệu nạp tuần TOP 1
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 1 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_2_NapTuan()
   local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
 		-- me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT giai doan duoi 90
		-- me.AddStackItem(18,1,1875,1,nil,70)---Ruong đồng hành 10 món
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 2\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 7\n70 Rương trang bị đồng hành<color> thành công");	
 		me.AddStackItem(18,1,114,9,{bForceBind = 1},1);     --HT giai doan tren 90
		me.AddStackItem(18,1,2025,12,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		me.AddStackItem(18,1,1875,1,nil,500)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 3\n1 Bổ Tu Lệnh\n1 Huyền Tinh Cấp 9\n500 Rương trang bị đồng hành<color> thành công");	
	else 
		me.AddStackItem(18,1,114,9,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},1500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},15)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},3)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 2 Tích Lũy Nạp Tuần<color>: <color=yellow>1500 Vỏ Sò Vàng\n3 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n15 Cờ Chiến Công\n2 Viên Huyền Tinh 9 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 2 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_3_NapTuan()
    local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
 	-- me.AddStackItem(18,1,114,7,{bForceBind = 1},1);     --HT
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
						-- me.AddStackItem(18,1,1875,1,nil,50)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 2\n1 Bổ Tu Lệnh\n1 Huyền Tinh Cấp 7\n50 Rương trang bị đồng hành<color> thành công");	
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT tren 90
		me.AddStackItem(18,1,2025,12,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 3 tren 90
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh tren 90
		me.AddStackItem(18,1,1875,1,nil,500)---Ruong đồng hành 10 món tren 90
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 3\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 8\n500 Rương trang bị đồng hành<color> thành công");
		else 
		me.AddStackItem(18,1,114,9,{bForceBind = 1},1);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},1000);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},10)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},2)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 3 Tích Lũy Nạp Tuần<color>: <color=yellow>1000 Vỏ Sò Vàng\n2 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n10 Cờ Chiến Công\n1 Viên Huyền Tinh 9 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 3 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_4_NapTuan()
     local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
		-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
						-- me.AddStackItem(18,1,1875,1,nil,30)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 2\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 6\n30 Rương trang bị đồng hành<color> thành công");	
		me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT tren 90
		me.AddStackItem(18,1,2025,12,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 3 tren 90
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh tren 90
						me.AddStackItem(18,1,1875,1,nil,200)---Ruong đồng hành 10 món tren 90
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 3\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 7\n200 Rương trang bị đồng hành<color> thành công");	
				else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 4 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_5_NapTuan()
      local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
		-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,2025,11,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 2
		-- me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
						-- me.AddStackItem(18,1,1875,1,nil,30)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 5 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 2\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 6\n30 Rương trang bị đồng hành<color> thành công");	
		me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT tren 90
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng tren 90
		me.AddStackItem(18,1,2025,12,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 3 tren 90
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh tren 90
						me.AddStackItem(18,1,1875,1,nil,150)---Ruong đồng hành 10 món tren 90
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 5 Tích Lũy Nạp Tuần<color>: <color=yellow> 10 Lệnh Bài Đồ Hải Tặc Cấp 3\n1 Bổ Tu Lệnh\n2 Huyền Tinh Cấp 7\n150 Rương trang bị đồng hành<color> thành công");	
						else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 5 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_6_NapTuan()
      local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
 	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
						-- me.AddStackItem(18,1,1875,1,nil,15)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 6 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 6\n15 Rương trang bị đồng hành<color> thành công");	
		 	me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
						me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 6 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 7\n100 Rương trang bị đồng hành<color> thành công");	
								else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 6 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_7_NapTuan()
       local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
 	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
								-- me.AddStackItem(18,1,1875,1,nil,15)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 7 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 6\n15 Rương trang bị đồng hành<color> thành công");	
				 	me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
						me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 7 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 7\n100 Rương trang bị đồng hành<color> thành công");	
								else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 7 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_8_NapTuan()
       local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
		-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
								-- me.AddStackItem(18,1,1875,1,nil,15)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 8 Tích Lũy Nạp Tuần<color>: <color=yellow>  2 Huyền Tinh Cấp 6\n15 Rương trang bị đồng hành<color> thành công");	
				 	me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
		-- me.AddStackItem(18,1,20400,1,{bForceBind = 1},3);---Trứng Rồng
						me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 8 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 7\n100 Rương trang bị đồng hành<color> thành công");	
									else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 8 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_9_NapTuan()
        local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
 	-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
								-- me.AddStackItem(18,1,1875,1,nil,15)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 9 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 6\n15 Rương trang bị đồng hành<color> thành công");	
				 	me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
						me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 9 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 7\n100 Rương trang bị đồng hành<color> thành công");	
										else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 9 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 function ConfigAll.Top_10_NapTuan()
        local nGioiHanGiaiDoan = ConfigAll.ThuongTop_Tuan_NapGiaiDoan12x
if nGioiHanGiaiDoan == 0 then 
		-- me.AddStackItem(18,1,114,6,{bForceBind = 1},2);     --HT
								-- me.AddStackItem(18,1,1875,1,nil,15)---Ruong đồng hành 10 món
		-- Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 10 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 6\n15 Rương trang bị đồng hành<color> thành công");	
				 	me.AddStackItem(18,1,114,7,{bForceBind = 1},2);     --HT
						me.AddStackItem(18,1,1875,1,nil,100)---Ruong đồng hành 10 món
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 10 Tích Lũy Nạp Tuần<color>: <color=yellow> 2 Huyền Tinh Cấp 7\n100 Rương trang bị đồng hành<color> thành công");	
												else 
		me.AddStackItem(18,1,114,8,{bForceBind = 1},2);     --HT
		me.AddStackItem(18,1,325,1,{bForceBind = 1},500);---VSV
		me.AddStackItem(18,1,2032,11,{bForceBind=1},5)--Cờ chiến công
		me.AddStackItem(18,1,1303,3,{bForceBind=1},1)--Rương ngọc hoàn chỉnh cấp 3
		me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
		Dialog:Say("Chúc mừng bạn nhận thưởng <color=gold>Hạng 4-10 Tích Lũy Nạp Tuần<color>: <color=yellow>500 Vỏ Sò Vàng\n1 Rương Ngọc Cấp 3\n1 Bổ Tu Lệnh\n5 Cờ Chiến Công\n2 Viên Huyền Tinh 8 thành công");
	end 
			local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng TOP 10 Nạp Tuần, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\npc\\trapopen\\thuongnaptuan.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
 end 
 
 
 --============================================================================================================--
												--										Thưởng Cá Nhân Thất Thành Đại Chiến										  --
--============================================================================================================--
 function ConfigAll.Thuong_Chiem_PT_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(100000);---10 vạn đồng khóa
		me.SetTask(9182,2,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Phượng Tường, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanphuongtuong.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_BK_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 2) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(200000);---10 vạn đồng khóa
		me.SetTask(9182,3,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Biện Kinh, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanbienkinh.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_DC_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(100000);---10 vạn đồng khóa
		me.SetTask(9182,4,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Dương Châu, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanduongchau.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_LamAn_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 2) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(200000);---10 vạn đồng khóa
		me.SetTask(9182,5,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Lâm An, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanlaman.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_TuongDuong_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(100000);---10 vạn đồng khóa
		me.SetTask(9182,6,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Tương Dương, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhantuongduong.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_DaiLy_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(100000);---10 vạn đồng khóa
		me.SetTask(9182,7,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Đại Lý, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhantuongduong.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
 function ConfigAll.Thuong_Chiem_ThanhDo_CaNhan()
        me.AddStackItem(18, 1, 114, 7, nil, 1) -- 1 huyền tính cấp 7
		me.AddStackItem(18, 1, 553, 1, nil, 100); -- tiendulong
		me.AddStackItem(18,1,1333,1,{bForceBind=1},10)--20 Sách kinh nghiệm chân nguyên
		me.AddBindCoin(100000);---10 vạn đồng khóa
		me.SetTask(9182,8,1);
		ConfigAll.DiemHoatDong()
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Nhân Vật: %s,Tài Khoản : %s ,Đã Nhận Thưởng Thất Thành Đại Chiến Thành Thành Đô, Thời gian: %s", me.szName, me.szAccount, szDate)
    local logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\thuongcanhanthanhdo.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 






--============================================================================================================--
												--										Thưởng Top Hàng ngày luận võ đài										  --
--============================================================================================================--
 function ConfigAll.Top_1_LuanVoDai()
	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,30);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,50);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 1 Luận Võ Đài!")
 end 
 function ConfigAll.Top_2_LuanVoDai()
 	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,25);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,40);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 2 Luận Võ Đài!")
 end 
 function ConfigAll.Top_3_LuanVoDai()
  	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,20);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,30);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 3 Luận Võ Đài!")
 end 
 function ConfigAll.Top_4_LuanVoDai()
   	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,15);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,20);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 4 Luận Võ Đài!")
 end 
 function ConfigAll.Top_5_LuanVoDai()
 	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,10);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,10);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 5 Luận Võ Đài!")
 end 
 function ConfigAll.Top_6Den10_LuanVoDai()
 	me.AddStackItem(18,1,114,6,{bForceBind = 1},1);     --HT
	me.AddRepute(11,1,5);--Danh vọng đại hội võ lâm ( nhẫn )
	me.AddStackItem(18,1,1338,2,nil,5);     --KNB
	 -- KDialog.MsgToGlobal("Chúc mừng "..pPlayer.szName.." đã nhận được phần thưởng TOP 6-10 Luận Võ Đài!")
 end 