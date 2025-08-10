local tbLiGuan = Npc:GetClass("liguan");
function tbLiGuan:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\lequan.lua");

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
-----------------reset diem tong kim tuan-------------------------
	local nWeek = me.GetTask(9152, 2);
	local nCurWeek = tonumber(GetLocalDate("%y%W"));
	if nCurWeek > nWeek then
		me.SetTask(9152, 2, nCurWeek);	
	    me.SetTask(9152, 1, 0);
		me.SetTask(9152, 3, 0);			
	end
		--------------------------------------
		--------------------------------------
			-- me.SetTask(9153, 1, 0); ------- Xóa Task Đua TOP Voucher
		--------------------------------------
local nWeekDay = tonumber(GetLocalDate("%w"))
local nTime = tonumber(os.date("%H%M", GetTime()));
	local nDate = tonumber(GetLocalDate("%Y%m%d")); -- task Doan Hoa Dang
	if (me.GetTask(4001, 2) < nDate) then -- task Doan Hoa Dang
		me.SetTask(4001, 2, nDate); -- task Doan Hoa Dang
		me.SetTask(4001, 1, 0);-- task Doan Hoa Dang
	end

	local szMsg = "Bạn hữu, làm thế nào ta có thể giúp bạn?";
	local tbOpt =
	{
        -- {"Nộp<color=yellow> Voucher Đua TOP AlPhaTest<color>",  Battle.top_15tongkim1, Battle}, 	
		{"<color=red>Nhận Lại Hoạt Động Đã Bỏ Lỡ<color>",Doctor.ReGetTanThu.OnDialog,Doctor.ReGetTanThu};
		{"<color=yellow>Trả Lời Hoa Đăng<color>", self.DoanHoaDang,self},
		-- {"<color=yellow>Nhận thưởng Liệp Sát Boss Võ Lâm Cao Thủ<color>", self.killvlct,self},
		{"<color=yellow>Nhận Nhiệm Vụ Tuần<color>", self.nhiemvutuan,self},
		---{"<color=yellow>Tu luyện nhanh mật tịch<color>", self.dacquyenlq,self},
		-- {"<color=orange>Nhiệm Vụ Ngày Hoàng Kim<color>", SpecialEvent.NhiemVuHangNgay.OnDiaLog,SpecialEvent.NhiemVuHangNgay},
		-- {"<color=gold>Nhận Quà Fan Cứng<color>", self.getfancug,self},
	  -- {"Xem Bảng Xếp Hạng<color=yellow> Tống Kim Tuần<color>",  Battle.top_15tongkim, Battle}, 	
		{"<color=yellow>Nhận túi tân thủ<color>", self.tuitanthu,self},
				-- {"<color=yellow>Kiểm tra sách vở<color>", self.checksachvo,self},
		-- {"<color=yellow>Nhận Lại Vô Hạn Truyền Tống Phù<color>", self.vohan,self},
		-- {"Tiêu hủy vật phẩm", self.KiemTraAdmin,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbLiGuan:nhiemvutuan()	
	 local nTuan    = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(9192,5) ~= nTuan then
	-- me.SetTask(9192, 5, 0); 
	me.SetTask(9192, 6, 0); 
	end 
local nTK = me.GetTask(9192,4)
local nQD = me.GetTask(9192,3)
local nTDC = me.GetTask(9192,2)
local nBHD = me.GetTask(9192,1)
local TaskNhiemVuTuan = me.GetTask(9192,6)
local szMsg = ""
if TaskNhiemVuTuan == 0 then 
 szMsg = "Bạn chưa nhận nhiệm vụ tuần này hãy nhận nhiệm vụ đi"
elseif TaskNhiemVuTuan == 1 then 
	-- local szMsg = "Nhiệm vụ tuần yêu cầu\n:<color><color=cyan>*Tống Kim"..nTK.." /16\n*Vượt Ải BHĐ"..nBHD.."/5\n*Vượt Ải Tiêu Dao Cốc"..nTDC.."/5\n*Quân Doanh "..nQD.."/6<color>";
	 szMsg = "Nhiệm vụ tuần yêu cầu\n<color=cyan>Tống Kim:<color=green> "..nTK.."/16<color>\n<color=cyan>Vượt Ải BHĐ:<color><color=green> "..nBHD.."/10<color>\n<color=cyan>Vượt Ải Tiêu Dao Cốc:<color><color=green> "..nTDC.."/15<color>\n<color=gold>Thưởng 500 Vạn Tích Nạp + 2 HT8<color>";
else 
 szMsg = "Bạn đã nhận thưởng tuần này vui lòng gặp lại ta vào tuần sau"
end 
	    local tbOpt =     {}
if nTK >= 16 and nTDC >= 15 and nBHD >= 10 then 
			table.insert(tbOpt, {"<color=orange>Nhận Thưởng Nhiệm Vụ Tuần<color>",self.nhanthuongnhiemvutuan,self});
end 
if TaskNhiemVuTuan == 0 then 
			table.insert(tbOpt, {"<color=orange>Nhận nhiệm vụ tuần<color>",self.nhannhiemvutuan,self});
end 
            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end

function tbLiGuan:nhannhiemvutuan()	
	 local nTuan    = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(9192,5) ~= nTuan then
		me.SetTask(9192,5, nTuan);
		 me.SetTask(9192, 1, 0);
		 me.SetTask(9192, 2, 0);
		 me.SetTask(9192, 3, 0);
		 me.SetTask(9192, 4, 0);
		 -- me.SetTask(9192, 5, 0);
		 me.SetTask(9192, 6, 1); -- task nhận nhiệm vụ tuần
	end 

			Dialog:Say("Bạn đã nhận thành công")
			-- tbLiGuan:nhiemvutuan()	
end 

function tbLiGuan:nhanthuongnhiemvutuan()	
    local nMocNap = me.GetTask(3028,1);
    me.SetTask(3028,1, nMocNap + 500);
	 me.AddStackItem(18, 1, 114, 8, {bForceBind=1}, 2); -- Huyền Tinh
 me.SetTask(9192, 6, 0);
 			Dialog:Say("Bạn đã nhận thưởng thành công tuần sau gặp lại!!")
end 

function tbLiGuan:killvlct()	
local nSoBossGiet = me.GetTask(9176,1)
local nGioiHanThuong5con = me.GetTask(9176,3)
local nGioiHanThuong10con = me.GetTask(9176,4)
	local szMsg = "Tổng Số Boss Đã Giết Hiện Nay là :"..nSoBossGiet.." Con\n*Quy Tắc :\n<color=yellow>5 Boss Nhận Thưởng :<color><color=red> 2 Huyền Tinh Cấp 5<color>\n<color=yellow>10 Boss Nhận Thưởng :<color><color=red> 1 Huyền Tinh Cấp 6 , 1 Huyền Tinh Cấp 5<color>\n<color=yellow>15 Boss Nhận Thưởng :<color><color=red> 3 Huyền Tinh Cấp 6\nVà Reset Số Boss Về 0<color>";
	    local tbOpt =     {}
		if nGioiHanThuong5con == 0 then 
		if nSoBossGiet >= 5 then 
			table.insert(tbOpt, {"<color=orange>Nhận Thưởng Kill 5 Boss<color>",self.nhanthuonggietbossvlct5boss,self});
		end 
		end 
		if nGioiHanThuong10con == 0 then 
		if nSoBossGiet >= 10 then 
			table.insert(tbOpt, {"<color=orange>Nhận Thưởng Kill 10 Boss<color>",self.nhanthuonggietbossvlct10boss,self});
		end 
		end 
		if  nSoBossGiet >= 15 then 
			table.insert(tbOpt, {"<color=orange>Nhận Thưởng Kill 15 Boss<color>",self.nhanthuonggietbossvlct15boss,self});
		end 

            table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
end
function tbLiGuan:nhanthuonggietbossvlct5boss()
local nSoBossGiet = me.GetTask(9176,1)
local nGioiHanThuong = me.GetTask(9176,3)
		if nGioiHanThuong > 0 then 
		Dialog:Say("Nhà ngươi đã nhận phần thưởng này rồi")
		return 0
		end 
		if nSoBossGiet >= 5 then 
		-- me.AddStackItem(18,1,2032,10,nil,5);
		-- me.AddStackItem(18,1,2032,11,{bForceBind=1},1);
		-- KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 5 Boss Võ Lâm Cao Thủ nhận Được 1 Cờ Chiến Công(Khóa) , 5 Mảnh Lôi Đỉnh Ấn(Không Khóa)\nXin Chúc Mừng<color>");
		me.AddStackItem(18,1,114,5,{bForceBind=1},2);
		KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 5 Boss Võ Lâm Cao Thủ nhận Được 2 Viên Huyền Tinh Cấp 5\nXin Chúc Mừng<color>");
		me.SetTask(9176,3,1)
		else 
				Dialog:Say("Số Boss Hiện Nay Nhà Ngươi Mới Liệp Sát Được :"..nSoBossGiet.." con thôi cố lên");	
		end 
end 
function tbLiGuan:nhanthuonggietbossvlct10boss()
local nSoBossGiet = me.GetTask(9176,1)
local nGioiHanThuong = me.GetTask(9176,4)
		if nGioiHanThuong > 0 then 
		Dialog:Say("Nhà ngươi đã nhận phần thưởng này rồi")
		return 0
		end 
		if nSoBossGiet >= 10 then 
		-- me.AddStackItem(18,1,2032,10,nil,5);
		-- me.AddStackItem(18,1,2032,11,{bForceBind=1},1);
		-- KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 10 Boss Võ Lâm Cao Thủ nhận Được 1 Cờ Chiến Công(Khóa) , 5 Mảnh Lôi Đỉnh Ấn(Không Khóa)\nXin Chúc Mừng<color>");
		me.AddStackItem(18,1,114,5,{bForceBind=1},2);
		me.AddStackItem(18,1,114,6,{bForceBind=1},1);
		KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 10 Boss Võ Lâm Cao Thủ nhận Được 2 Viên Huyền Tinh Cấp 5 Và 1 Viên Huyền Tinh Cấp 6\nXin Chúc Mừng<color>");
		me.SetTask(9176,4,1)
		else 
				Dialog:Say("Số Boss Hiện Nay Nhà Ngươi Mới Liệp Sát Được :"..nSoBossGiet.." con thôi cố lên");	
		end 
end 

function tbLiGuan:nhanthuonggietbossvlct15boss()
local nSoBossGiet = me.GetTask(9176,1)
		if nSoBossGiet >= 15 then 
		-- me.AddStackItem(18,1,2032,10,nil,15);
		-- me.AddStackItem(18,1,2032,11,{bForceBind=1},5);
		-- me.AddStackItem(18,1,20400,1,{bForceBind=1},4);
		-- KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 15 Boss Võ Lâm Cao Thủ nhận Được 1 Cờ Chiến Công(Khóa) , 15 Mảnh Lôi Đỉnh Ấn(Không Khóa), 4 Trứng Rồng (Khóa)\nXin Chúc Mừng<color>");
		me.AddStackItem(18,1,114,6,{bForceBind=1},3);
		KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận thưởng tiêu diệt 15 Boss Võ Lâm Cao Thủ nhận Được 3 Viên Huyền Tinh Cấp 6\nXin Chúc Mừng<color>");
		me.SetTask(9176,1,0)
		me.SetTask(9176,3,0)
		me.SetTask(9176,4,0)
		else 
		Dialog:Say("Số Boss Hiện Nay Nhà Ngươi Mới Liệp Sát Được :"..nSoBossGiet.." con thôi cố lên");	
		end 
end 

function tbLiGuan:checksachvo()	
	local nWeekOpen = me.GetTask(3031, 1)
	local nTuan = 37;
	local nShow = tonumber(GetLocalDate("%W"));
	local nReal = nShow - nTuan;--23-20
	local nNum = nReal * 7;-- số lượng 1 rương của 1 tuần 
local n6677 = me.GetTask(3031,1)
local nVLMTso = me.GetTask(2040,5)
local nVLMT_Trung = me.GetTask(2040,8)
local nVLMT_Cao = me.GetTask(9169,2)
local nThuongHaiNguyetMinh = me.GetTask(2040,21)
local nTTK_So  = me.GetTask(2040,6)
local nTTK_Trung = me.GetTask(2040,9)
local nTTK_Cao = me.GetTask(9169,1)
local nThaiVanTruyNguyet = me.GetTask(2040,20)
local szTitle =	"<color=yellow>Danh sách Sách Vở đã sử dụng<color><enter>\n"..
						"<color=gold>Rương Vừa Đẹp Vừa Cao Quý: <color=white>"..n6677.." Rương / "..nNum.." <color>\n"..
						"<color=gold>VLMT Sơ:<color=white>  "..nVLMTso.."/5 Cuốn<color>\n"..
						"<color=gold>VLMT Trung:<color=white> "..nVLMT_Trung.."/5 Cuốn<color>\n"..
						"<color=gold>VLMT Cao:<color=white> "..nVLMT_Cao.."/15 Cuốn<color>\n"..
						"<color=gold>TTK Sơ:<color=white> "..nTTK_So.."/5 Cuốn<color>\n"..
						"<color=gold>TTK Trung:<color=white> "..nTTK_Trung.."/5 Cuốn<color>\n"..
						"<color=gold>TTK Cao:<color=white> "..nTTK_Cao.."/15 Cuốn<color>\n"..
						"<color=gold>Thái Vân Truy Nguyệt (TN):<color=white> "..nThaiVanTruyNguyet.."/2 Cái<color>\n"..
						"<color=gold>Thương Hải Nguyệt Minh (KN):<color=white> "..nThuongHaiNguyetMinh.."/2 Cái<color>\n"..
						"";
				-- me.Msg(szTitle);			
				-- Dialog:Say(szTitle);	
    local tbOpt =     {}
	table.insert(tbOpt, {"Xem trang sau",self.checksachvotrang2,self});
	Dialog:Say(szTitle, tbOpt)
end

function tbLiGuan:checksachvotrang2()	
local nLaCoTiemNangT8 = me.GetTask(9169,3)
local nLaCoKyNangT8 = me.GetTask(9169,4)
local nSaoTiemNangT9 = me.GetTask(9169,5)
local nSaoKyNangT9 = me.GetTask(9169,6)
local nBongHongTiemNangT10 = me.GetTask(9169,7)
local nBongHongKyNangT10 = me.GetTask(9169,8)
local nSachDiaLyT11 = me.GetTask(9169,10)
local nSachLichSuT11 = me.GetTask(9169,9)
local nPhaoKyNang = me.GetTask(9169,12)
local nPhaoTiemNang = me.GetTask(9169,11)
local nBanhTetKyNang = me.GetTask(9169,13)
local nBanhChungTiemNang = me.GetTask(9169,14)
local nMuTaiBeo = me.GetTask(9186,86)
local szTitle =	"<color=yellow>Danh sách Sách Vở đã sử dụng<color><enter>\n"..
						-- "<color=gold>Lá Cờ Chiến Thắng (TN):<color=white> "..nLaCoTiemNangT8.."/2 Cuốn<color>\n"..
						-- "<color=gold>Lá Cờ Chiến Thắng (KN):<color=white> "..nLaCoKyNangT8.."/2 Cuốn<color>\n"..
						-- "<color=gold>Sao Chiến Thắng (TN):<color=white> "..nSaoTiemNangT9.."/2 Cuốn<color>\n"..
						-- "<color=gold>Sao Chiến Thắng (KN):<color=white> "..nSaoKyNangT9.."/2 Cuốn<color>\n"..
						-- "<color=gold>Bông Hồng (TN):<color=white> "..nBongHongTiemNangT10.."/2 Bông<color>\n"..
						-- "<color=gold>Bông Hồng (KN):<color=white> "..nBongHongKyNangT10.."/2 Bông<color>\n"..
						-- "<color=gold>Sách Lịch Sử (KN):<color=white> "..nSachLichSuT11.."/2 Cuốn<color>\n"..
						-- "<color=gold>Sách Địa Lý (KN):<color=white> "..nSachDiaLyT11.."/2 Cuốn<color>\n"..
						-- "<color=gold>Pháo Tết Dương (KN):<color=white> "..nPhaoKyNang.."/2 Pháo<color>\n"..
						-- "<color=gold>Pháo Tết Dương (TN):<color=white> "..nPhaoTiemNang.."/2 Pháo<color>\n"..
						-- "<color=gold>Bánh Tết (KN):<color=white> "..nBanhTetKyNang.."/2 Bánh<color>\n"..
						-- "<color=gold>Bánh Chưng (TN):<color=white> "..nBanhChungTiemNang.."/2 Bánh<color>\n"..
						"<color=gold>Nón Tai Bèo (TN):<color=white> "..nMuTaiBeo.."/2 Nón<color>\n"..
						"";	
				Dialog:Say(szTitle);	
    -- local tbOpt =     {}
	-- table.insert(tbOpt, {"Xem trang sau",self.oknhandcfan,self});
	    -- Dialog:Say(szTitle, tbOpt)
end

function tbLiGuan:nhiemvuhoangkim()	
local BHD = me.GetTask(2009,1)
local TK = me.GetTask(9157,50)
local NhiemVuNgay = me.GetTask(2009,1) 
local TIEUDAOCOC = me.GetTask(2009,1)
	local szMsg = "Nhiệm vụ hoàng kim trong ngày \n<color=gold>Bạch Hồ Đường đã tham gia: "..BHD.." / 1 lần\nTống Kim đã tham gia : "..TK.."/ 2 Trận";
			-- if BHD == 1 and TK == 2 and NhiemVuNgay == 3 and TIEUDAOCOC == 1 then
	-- local szMsg = "Nhiệm vụ hoàng kim trong ngày \nBạch Hồ Đường đã tham gia "..BHD.." /1 lần\nTống Kim đã tham gia : "..TK.."/ 2 Trận";
    local tbOpt =     {}
	table.insert(tbOpt, {"Ta muốn nhận thưởng",self.oknhandcfan,self});
	table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
	-- else
			-- Dialog:Say(string.format("Hãy kiểm tra lại, hình như ngươi còn thiếu nhiệm vụ chưa hoàn thành"));
	end
	------task nhiệm vụ ngày hoàng kim tống kim 9157,50
-- end

function tbLiGuan:getfancug()	
			-- Dialog:Say("Bạn chưa nằm trong danh sách Fan Cứng Tháng 4 <color=cyan>Xin hãy liên hệ FANPAGE<color>");
	local szFile = "\\script\\iDoctor\\GhiFan\\HardWareId\\list.txt";
    local nHardWareId = me.szName;
	local State = 0;
	if szFile then
        local tbHwidOld = Lib:LoadTabFile(szFile);
        for nRow, tbRowData in pairs(tbHwidOld) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["Name"];
        if (tbTemp.szIPban == nHardWareId) then
			State = 1;
        end
        end
	end
	if State == 0 then
	 local szMsg = "Bạn chưa nằm trong danh sách Fan Cứng Tháng 4 <color=cyan>Xin hãy liên hệ FANPAGE<color>";
	Dialog:Say(szMsg)
	return 0
	 end
	if State == 1 then
	local szMsg = "Danh hiệu fan cứng";
    local tbOpt =     {}
	table.insert(tbOpt, {"Ta muốn nhận quà tháng",self.oknhandcfan,self});
	table.insert(tbOpt, {"Ta muốn nhận quà tuần",self.nhanfantuan,self});
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	-- else
	-- local szMsg = "Bạn chưa nằm trong danh sách Fan Cứng Tháng 4 <color=cyan>Xin hãy liên hệ FANPAGE<color>";
	-- table.insert(tbOpt, {"Kết thúc đối thoại"});
    Dialog:Say(szMsg, tbOpt)
	end
end

function tbLiGuan:oknhandcfan()
	local nThang = me.GetTask(9157, 2);
	local nCurMon = tonumber(GetLocalDate("%y%m"));
	if nThang < nCurMon then
		me.SetTask(9157, 2, nCurMon);	
		me.SetTask(9157, 1, 0);	
		end
	local nCheck = me.GetTask(9157,1)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà FAN CỨNG tháng này rồi!\nTháng sau hãy quay lại gặp ta"));
		return 0;
	end
		local nNgayMoSV = DietQuai:NgayMoMayChu();
		if nNgayMoSV < 7 then 
				Dialog:Say("Máy Chủ Open ít nhất<color=cyan> 7 ngày <color>mới lãnh được quà này \nHiện nay mới chỉ Open được <color=cyan>"..nNgayMoSV.." ngày");
				return 
		end 
	me.SetTask(9157,1, nCheck + 1);
    me.AddTitle(46,1,1,1); -- danh hieu fan cung
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},5000)---Ngũ Hành Hồn Thạch
end

function tbLiGuan:nhanfantuan()
	local nTuan = me.GetTask(9157, 3);
	local nCurTuan = tonumber(GetLocalDate("%y%W"));
	if nTuan < nCurTuan then
		me.SetTask(9157, 3, nCurTuan);	
		me.SetTask(9157, 4, 0);	
	end
	local nCheck = me.GetTask(9157,4)
	if nCheck >= 1 then
		Dialog:Say(string.format("Bạn đã nhận quà FAN CỨNG tuần này rồi!\n Tuần sau hãy quay lại gặp ta"));
		return 0;
	end
			local nNgayMoSV = DietQuai:NgayMoMayChu();
		if nNgayMoSV < 7 then 
				Dialog:Say("Máy Chủ Open ít nhất<color=cyan> 7 ngày <color>mới lãnh được quà này \nHiện nay mới chỉ Open được <color=cyan>"..nNgayMoSV.." ngày");
				return 
		end 
	me.SetTask(9157,4, nCheck + 1);
	me.AddStackItem(18,1,114,7,{bForceBind=1},1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},100)---Tiền Du Long
	me.AddStackItem(18,1,205,1,{bForceBind=1},1000)---Ngũ Hành Hồn Thạch
end

function tbLiGuan:KiemTraAdmin()
	Dialog:AskString("Nhập Mật Khẩu", 15, self.CheckMatMa, self);
end

function tbLiGuan:CheckMatMa(nPass)
	local szMsg = "Tài Khoản:<color=green> "..me.szAccount.."<color>\n\nNhân Vật: <color=green>"..me.szName.."<color>";
	if (nPass=="okbabe") then
	local tbOpt =
	{
		{"Tiêu hủy đạo cụ", self.tieuhuydaocu,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
	end
end

function tbLiGuan:tieuhuydaocu()
	Dialog:OpenGift("Hãy đặt vào", nil ,{self.OnOpenGiftOk, self});
end

function tbLiGuan:OnOpenGiftOk(tbLiGuanObj)
	for _, pItem in pairs(tbLiGuanObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
end
--------------luyen mat tich------------------------------
tbLiGuan.nMijiLevel			= 100;	
tbLiGuan.nAddedKarmaPerTime	= 3000;		
function tbLiGuan:dacquyenlq()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 10000 then
		Dialog:Say("Đặc quyền dành cho người chơi tích lũy rút <color=cyan>10.000 vạn đồng<color>");
		return 0;
	end

	local pItem		= me.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
        Dialog:Say("1. Trang bị mật tịch lên <color=yellow>Thuộc Tính Nhân Vật (F1)<color> mới có thể luyện max mật tịch!", {"Kết thúc đối thoại !"}); 
		return;
	end
	local nLevel = pItem.GetGenInfo(1);
	if nLevel >=  self.nMijiLevel then
		me.Msg("Cấp độ đã đạt mức cao nhất");
		return;
	end
	for i = 1, 1000 do
		local nLevel = pItem.GetGenInfo(1);			-- 秘籍当前等级
		if (nLevel >= self.nMijiLevel) then
			break;
		end
		Item:AddBookKarma(me, self.nAddedKarmaPerTime);
	end
end
----------------------------------------------------------

function tbLiGuan:tuitanthu()
		local nCount = me.GetItemCountInBags(18,1,351,1);
		if (nCount == 0) then
			local tbNewPlayerGiftItem = { 18, 1, 351, 1 }
			local tbBaseProp = KItem.GetItemBaseProp(unpack(tbNewPlayerGiftItem));
			if not tbBaseProp then
				return;
			end
			
			local tbItem =
			{
				nGenre		= tbNewPlayerGiftItem[1],
				nDetail		= tbNewPlayerGiftItem[2],
				nParticular	= tbNewPlayerGiftItem[3],
				nLevel		= tbNewPlayerGiftItem[4],
				nSeries		= (tbBaseProp.nSeries > 0) and tbBaseProp.nSeries or 0,
				bBind		= KItem.IsItemBindByBindType(tbBaseProp.nBindType),
				nCount 		= 1;
			};
		
			if (0 == me.CanAddItemIntoBag(tbItem)) then
				me.Msg("Hành trang đầy");
				return;
			end	
		
			tbNewPlayerGiftItem[5] = tbItem.nSeries;
			me.AddItem(unpack(tbNewPlayerGiftItem));
			me.Msg("Nhận được Túi tân thủ !");			
		else
			Dialog:Say("<color=red> Bạn đã có Túi tân thủ <color>");
		end	
end
function tbLiGuan:vohan()
	me.AddItem(18,1,235,1).Bind(1);--Vô Hạn Truyền Tống Phù
			me.Msg("Nhận được Vô Hạn Truyền Tống Phù!");			

end
----------------Nhiem Vu Doan Hoa Dang -------------------------------
function tbLiGuan:DoanHoaDang()
if me.nFaction == 0 then
Dialog:Say("Chưa gia nhập môn phái không thể tham gia !")
return 
end
   local nTime = GetTime();
		local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay ~= 1 and  nWeekDay ~= 3 then
	Dialog:Say("Hãy quay lại vào thứ 2 hoặc thứ 4 hàng tuần tham gia đoán hoa đăng!")
	return 
	end 
	local nTask = me.GetTask(4001, 1);
	if nTask == 0 then
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>Bích Huyết Kiếm", self.TraLoiHoaDang1, self, 0, 1},
			{"Tuyệt Đỉnh Kiếm Thế", self.TraLoiHoaDang1, self, 0, 2},
			{"Tình Nghĩa Giang Hồ", self.TraLoiHoaDang1, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 1<color> <color=yellow>Tên máy chủ là gì?<color>", tbOpt);
	elseif nTask == 1 then
		tbLiGuan:TraLoiHoaDang1(1, 1);
	elseif nTask == 2 then
		tbLiGuan:TraLoiHoaDang2(1, 2);
	elseif nTask == 3 then
		tbLiGuan:TraLoiHoaDang3(1, 3);
	elseif nTask == 4 then
		tbLiGuan:TraLoiHoaDang4(1, 3);
	elseif nTask == 5 then
		tbLiGuan:TraLoiHoaDang5(1, 1);
	elseif nTask == 6 then
		tbLiGuan:TraLoiHoaDang6(1, 1);
	elseif nTask == 7 then
		tbLiGuan:TraLoiHoaDang7(1, 2);
	elseif nTask == 8 then
		tbLiGuan:TraLoiHoaDang8(1, 3);
	elseif nTask == 9 then
		tbLiGuan:TraLoiHoaDang9(1, 3);
	elseif nTask == 10 then
		tbLiGuan:TraLoiHoaDang10(1, 1);
	elseif nTask == 11 then
		tbLiGuan:TraLoiHoaDang11(1, 2);
	elseif nTask == 12 then
		tbLiGuan:TraLoiHoaDang12(1, 2);
	elseif nTask == 13 then
		tbLiGuan:TraLoiHoaDang13(1, 2);
	elseif nTask == 14 then
		tbLiGuan:TraLoiHoaDang14(1, 1);
	elseif nTask == 15 then
		tbLiGuan:TraLoiHoaDang15(1, 3);
	elseif nTask == 16 then
		tbLiGuan:TraLoiHoaDang16(1, 3);
	elseif nTask == 17 then
		tbLiGuan:TraLoiHoaDang17(1, 3);
	elseif nTask == 18 then
		tbLiGuan:TraLoiHoaDang18(1, 3);
	elseif nTask == 19 then
		tbLiGuan:TraLoiHoaDang19(1, 3);
	elseif nTask == 20 then
		tbLiGuan:TraLoiHoaDang20(1, 3);
	elseif nTask == 21 then
		tbLiGuan:TraLoiHoaDang21(1, 1);
	elseif nTask == 22 then
		tbLiGuan:TraLoiHoaDang22(1, 2);
	elseif nTask == 23 then
		tbLiGuan:TraLoiHoaDang23(1, 3);
	elseif nTask == 24 then
		tbLiGuan:TraLoiHoaDang24(1, 2);
	elseif nTask == 25 then
		tbLiGuan:TraLoiHoaDang25(1, 2);
	elseif nTask == 26 then
		tbLiGuan:TraLoiHoaDang26(1, 2);
	elseif nTask == 27 then
		tbLiGuan:TraLoiHoaDang27(1, 1);
	elseif nTask == 28 then
		tbLiGuan:TraLoiHoaDang28(1, 1);
	elseif nTask == 29 then
		tbLiGuan:TraLoiHoaDang29(1, 2);
	else
		me.Msg("<color=yellow>Hôm nay bạn đã đáp đủ 30 câu hỏi?<color>");
	end
end
function tbLiGuan:DapDung()
			-- me.AddExp(500000); -- 5tr EXP
			 me.AddKinReputeEntry(1);
			me.AddBindCoin(5000);-- 1000 Đồng khóa
			me.AddItem(18,1,114,5); -- 1 Huyen tinh 5
			me.Msg("<color=yellow>Đáp đúng<color>");
end
function tbLiGuan:DapSai()
			me.AddExp(500000); -- 5tr EXP
			-- me.AddBindCoin(100);-- 2000 Đồng khóa
		--	me.AddItem(18,1,114,4); -- 1 Huyen tinh 5
			me.Msg("<color=red>Đáp sai<color>");
end
function tbLiGuan:TraLoiHoaDang1(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"F7", self.TraLoiHoaDang2, self, 0, 1},
			{"<bclr=red><color=yellow>F8", self.TraLoiHoaDang2, self, 0, 2},
			{"F9", self.TraLoiHoaDang2, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 2<color> <color=yellow>Phím chế đồ trong kiếm thế?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 1);
end

function tbLiGuan:TraLoiHoaDang2(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"60", self.TraLoiHoaDang3, self, 0, 1},
			{"<bclr=red><color=yellow>50", self.TraLoiHoaDang3, self, 0, 3},
			{"40", self.TraLoiHoaDang3, self, 0, 2},
		};
		Dialog:Say("<color=green>Câu 3<color> <color=yellow>Cấp bao nhiêu có thể tham gia chiến trường tống kim?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 2);
end

function tbLiGuan:TraLoiHoaDang3(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"60", self.TraLoiHoaDang4, self, 0, 1},
			{"70", self.TraLoiHoaDang4, self, 0, 2},
			{"<bclr=red><color=yellow>80", self.TraLoiHoaDang4, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 4<color> <color=yellow>Cấp bao nhiêu có thể tham gia tiêu dao cốc<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 3);
end

function tbLiGuan:TraLoiHoaDang4(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"70", self.TraLoiHoaDang5, self, 0, 3},
			{"80", self.TraLoiHoaDang5, self, 0, 2},
			{"<bclr=red><color=yellow>90", self.TraLoiHoaDang5, self, 0, 1},
		};
		Dialog:Say("<color=green>Câu 5<color> <color=yellow>Cấp bao nhiêu có thể tham gia quân doanh<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 4);
end

function tbLiGuan:TraLoiHoaDang5(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>F1", self.TraLoiHoaDang6, self, 0, 1},
			{"F2", self.TraLoiHoaDang6, self, 0, 2},
			{"F3", self.TraLoiHoaDang6, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 6<color> <color=yellow>Tổ hợp phím thuộc tính nhân vật là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 5);
end

function tbLiGuan:TraLoiHoaDang6(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"F1", self.TraLoiHoaDang7, self, 0, 1},
			{"<bclr=red><color=yellow>F2", self.TraLoiHoaDang7, self, 0, 2},
			{"F3", self.TraLoiHoaDang7, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 7<color> <color=yellow>Tổ hợp phím hành trang là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 6);
end

function tbLiGuan:TraLoiHoaDang7(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"F1", self.TraLoiHoaDang8, self, 0, 1},
			{"F2", self.TraLoiHoaDang8, self, 0, 2},
			{"<bclr=red><color=yellow>F3", self.TraLoiHoaDang8, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 8<color> <color=yellow>Tổ Hợp Phím kĩ năng võ công là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 7);
end

function tbLiGuan:TraLoiHoaDang8(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"F6", self.TraLoiHoaDang9, self, 0, 1},
			{"F5", self.TraLoiHoaDang9, self, 0, 2},
			{"<bclr=red><color=yellow>F4", self.TraLoiHoaDang9, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 9<color> <color=yellow>Tổ Hợp Phím Bảng Nhiệm Vụ là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 8);
end

function tbLiGuan:TraLoiHoaDang9(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>F6", self.TraLoiHoaDang10, self, 0, 1},
			{"F5", self.TraLoiHoaDang10, self, 0, 2},
			{"F4", self.TraLoiHoaDang10, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 10<color> <color=yellow>Tổ hợp phím bảng gia tộc là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 9);
end

function tbLiGuan:TraLoiHoaDang10(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"60", self.TraLoiHoaDang11, self, 0, 1},
			{"<bclr=red><color=yellow>70", self.TraLoiHoaDang11, self, 0, 2},
			{"80", self.TraLoiHoaDang11, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 11<color> <color=yellow>máy chủ Bích Huyết Kiếm hỗ trợ tân thủ cấp bao nhiêu?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 10);
end

function tbLiGuan:TraLoiHoaDang11(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Có", self.TraLoiHoaDang12, self, 0, 1},
			{"<bclr=red><color=yellow>Không", self.TraLoiHoaDang12, self, 0, 2},
		};
		Dialog:Say("<color=green>Câu 12<color> <color=yellow>máy chủ Bích Huyết Kiếm có chức năng lửa trại vui vẻ không?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 11);
end

function tbLiGuan:TraLoiHoaDang12(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Cấp 4", self.TraLoiHoaDang13, self, 0, 1},
			{"<bclr=red><color=yellow>Cấp 5", self.TraLoiHoaDang13, self, 0, 2},
			{"Cấp 6 ", self.TraLoiHoaDang13, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 13<color> <color=yellow>máy chủ Bích Huyết Kiếm hỗ trợ tân thủ sét đồ cấp mấy?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 12);
end

function tbLiGuan:TraLoiHoaDang13(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>P", self.TraLoiHoaDang14, self, 0, 1},
			{"T", self.TraLoiHoaDang14, self, 0, 2},
			{"D", self.TraLoiHoaDang14, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 14<color> <color=yellow>Phím tổ đội là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 13);
end

function tbLiGuan:TraLoiHoaDang14(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"K", self.TraLoiHoaDang15, self, 0, 1},
			{"T", self.TraLoiHoaDang15, self, 0, 2},
			{"<bclr=red><color=yellow>G", self.TraLoiHoaDang15, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 15<color> <color=yellow>Phím Kỳ Trân Các là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 14);
end

function tbLiGuan:TraLoiHoaDang15(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"D", self.TraLoiHoaDang16, self, 0, 1},
			{"S", self.TraLoiHoaDang16, self, 0, 2},
			{"<bclr=red><color=yellow>H", self.TraLoiHoaDang16, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 16<color> <color=yellow>Phím sư đồ là phím nào?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 15);
end

function tbLiGuan:TraLoiHoaDang16(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Thứ 2.3", self.TraLoiHoaDang17, self, 0, 1},
			{"Thứ 4.5", self.TraLoiHoaDang17, self, 0, 2},
			{"<bclr=red><color=yellow>Thứ 3.6", self.TraLoiHoaDang17, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 17<color> <color=yellow>Sự Kiện Thi Đấu Môn Phái diễn ra vào thứ mấy?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 16);
end

function tbLiGuan:TraLoiHoaDang17(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Thứ 3.4", self.TraLoiHoaDang18, self, 0, 1},
			{"Thứ 5.6", self.TraLoiHoaDang18, self, 0, 2},
			{"<bclr=red><color=yellow>Thứ 7,CN", self.TraLoiHoaDang18, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 18<color> <color=yellow>Sự Kiện Tranh Đoạt Lãnh Thổ Diễn Ra vào Thứ mấy?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 17);
end

function tbLiGuan:TraLoiHoaDang18(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Thứ 2,3,4", self.TraLoiHoaDang19, self, 0, 1},
			{"Thứ 2,4,6", self.TraLoiHoaDang19, self, 0, 2},
			{"<bclr=red><color=yellow>Thứ 2,4", self.TraLoiHoaDang19, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 19<color> <color=yellow>Sự kiện đoán hoa đăng tại Máy Chủ Bích Huyết Kiếm diễn ra lúc nào<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 18);
end

function tbLiGuan:TraLoiHoaDang19(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"10 phút", self.TraLoiHoaDang20, self, 0, 1},
			{"20 phút", self.TraLoiHoaDang20, self, 0, 2},
			{"<bclr=red><color=yellow>15 phút", self.TraLoiHoaDang20, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 20<color> <color=yellow>Sau khi đốt lên , lửa trại sẽ duy trì được bao lâu?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 19);
end

function tbLiGuan:TraLoiHoaDang20(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>80", self.TraLoiHoaDang21, self, 0, 1},
			{"90", self.TraLoiHoaDang21, self, 0, 2},
			{"70", self.TraLoiHoaDang21, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 21<color> <color=yellow>Cấp bao nhiêu được tham gia tiêu dao cốc??<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 20);
end

function tbLiGuan:TraLoiHoaDang21(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"3", self.TraLoiHoaDang22, self, 0, 1},
			{"<bclr=red><color=yellow>4", self.TraLoiHoaDang22, self, 0, 2},
			{"5", self.TraLoiHoaDang22, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 22<color> <color=yellow>Trong Máy Chủ Bích Huyết Kiếm 1 ngày có mấy trận tống kim?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 21);
end

function tbLiGuan:TraLoiHoaDang22(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"11h,13h,21h", self.TraLoiHoaDang23, self, 0, 1},
			{"<bclr=red><color=yellow>11h,17h,21h,23h", self.TraLoiHoaDang23, self, 0, 3},
			{"11h,13h,21h,23h", self.TraLoiHoaDang23, self, 0, 2},
		};
		Dialog:Say("<color=green>Câu 23<color> <color=yellow>Thời gian diễn ra tống kim tại máy chủ Bích Huyết Kiếm? <color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 22);
end

function tbLiGuan:TraLoiHoaDang23(nTask, nValue)
	if (nValue == 3) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"80", self.TraLoiHoaDang24, self, 0, 1},
			{"<bclr=red><color=yellow>90", self.TraLoiHoaDang24, self, 0, 2},
			{"100", self.TraLoiHoaDang24, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 24<color> <color=yellow>Cấp bao nhiêu có thể tham gia được quân doanh?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 23);
end

function tbLiGuan:TraLoiHoaDang24(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Đại Tường Nguyên Soái", self.TraLoiHoaDang25, self, 0, 1},
			{"<bclr=red><color=yellow>Chiến quốc nguyên soái", self.TraLoiHoaDang25, self, 0, 2},
			{"Thủ Lĩnh Nguyên Soái", self.TraLoiHoaDang25, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 25<color> <color=yellow>Danh hiệu trong tống kim khi đạt trên 10k điểm là gì?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 24);
end

function tbLiGuan:TraLoiHoaDang25(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"2", self.TraLoiHoaDang26, self, 0, 1},
			{"<bclr=red><color=yellow>1", self.TraLoiHoaDang26, self, 0, 2},
			{"5", self.TraLoiHoaDang26, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 26<color> <color=yellow>Trứng Du Long 1 ngày ăn tối đa bao quả?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 25);
end

function tbLiGuan:TraLoiHoaDang26(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>7", self.TraLoiHoaDang27, self, 0, 1},
			{"5", self.TraLoiHoaDang27, self, 0, 2},
			{"10", self.TraLoiHoaDang27, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 27<color> <color=yellow>Rương Cao Quý trong Máy Chủ Bích Huyết Kiếm 1 tuần ăn tối đa bao cái?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 26);
end

function tbLiGuan:TraLoiHoaDang27(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>5", self.TraLoiHoaDang28, self, 0, 1},
			{"10", self.TraLoiHoaDang28, self, 0, 2},
			{"20", self.TraLoiHoaDang28, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 28<color> <color=yellow>Tinh Hoạt lực tiểu ăn tối đa 1 ngày bao bình?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 27);
end

function tbLiGuan:TraLoiHoaDang28(nTask, nValue)
	if (nValue == 1) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"<bclr=red><color=yellow>5", self.TraLoiHoaDang29, self, 0, 2},
			{"10", self.TraLoiHoaDang29, self, 0, 1},
			{"20", self.TraLoiHoaDang29, self, 0, 3},
		};
		Dialog:Say("<color=green>Câu 29<color> <color=yellow>Tinh Hoạt Lực trung ăn tối da 1 ngày bao bình?<color>", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 28);
end


function tbLiGuan:TraLoiHoaDang29(nTask, nValue)
	if (nValue == 2) then
		if nTask == 0 then
				tbLiGuan:DapDung()
		end
		local tbOpt = 
		{
			{"Kiếm Thế 2010", self.TraLoiHoaDang30, self, 0, 1},
			{"<bclr=red><color=yellow>Kiếm Thế 2009", self.TraLoiHoaDang30, self, 0, 2},
			{"Kiếm Thế 2011", self.TraLoiHoaDang30, 0, 3},
		};
		Dialog:Say("<color=green>Câu 30<color> bạn có biết <color=yellow>máy chủ Bích Huyết Kiếm<color> là phiên bản gì không?", tbOpt);
	else
		if nTask == 0 then
				tbLiGuan:DapSai()
		end
	end
	me.SetTask(4001, 1, 29);
end
function tbLiGuan:TraLoiHoaDang30(nTask, nValue)
	if (nValue == 2) then
			--tbLiGuan:DapDungCau30()
			me.Msg("<color=red>Hôm nay bạn đã đáp đủ 30 Câu Hỏi <color>");
	else
		if nTask == 0 then
		--	tbLiGuan:DapSai()
			me.Msg("<color=red>Hôm nay bạn đã đáp đủ 30 Câu Hỏi <color>");
		end
	end
	me.SetTask(4001, 1, 30);
end
function tbLiGuan:DapDungCau30()
			me.AddExp(500000); -- 5tr EXP
			me.AddKinReputeEntry(6);
			me.AddBindCoin(1000);-- 2000 Đồng khóa
			me.AddItem(18,1,114,5); -- 1 Huyen tinh 5
			me.AddItem(18,1,114,5); -- 1 Huyen tinh 5
			me.AddItem(18,1,114,5); -- 1 Huyen tinh 5
			me.Msg("<color=yellow>Đáp đúng<color>");
end

