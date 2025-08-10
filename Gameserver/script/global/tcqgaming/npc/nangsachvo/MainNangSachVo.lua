----Dev TCQGaming
----02/02/2023 4:13
--- fb.com/xboy.hd

local NangSachVo ={};
SpecialEvent.NangSachVo= NangSachVo;

function NangSachVo:OnDialog() 
-- DoScript("\\script\\global\\tcqgaming\\npc\\nangsachvo\\MainNangSachVo.lua");
	local szMsg = "Các hạ muốn tìm ta có chuyện gì ?\n\n<color=cyan>  ";
	local tbOpt =
	{
		{"<color=yellow>Nâng Cấp VLMT<color>", self.vlmt,self},
		{"<color=yellow>Nâng Cấp Tẩy Tủy Kinh<color>", self.ttk,self},
		{"<color=yellow>Nâng Cấp Lệnh Bài Đồ Hải Tặc<color>", self.haitac,self},
		-- {"<color=yellow>Lãnh Nguyên Liệu Nâng VLMT<color>", self.layvlmt,self},
		-- {"<color=yellow>Lãnh Nguyên Liệu Nâng TTK<color>", self.layttk,self},

		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end
function NangSachVo:haitac()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc\n<color=red>Miễn Phí<color>",self.haitac1mienphi,self};
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc\n<color=red>Tốn Phí<color>",self.haitac1traphi,self};
			{"<color=yellow>Ta muốn nâng Lệnh Bài Vũ Khí Hải Tặc\n<color=red>50 Vạn Đồng<color>",self.haitac_vukhitraphi,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function NangSachVo:haitac_vukhitraphi()
	local szMsg = "\n<color=cyan>Hãy tắt AutoPK trước khi bấm";
	local tbOpt = 
	{
			{"<color=yellow>Ta đã tắt AutoPK",self.nang_vukhi_haitac,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:nang_vukhi_haitac()
local nCount = me.GetJbCoin()
local nLenhBaiCap3 = me.GetItemCountInBags(18,1,2025,12) 
local nMyCoin = me.nCoin;
if (nMyCoin < 50*10000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
end
local nSoDu = 0
if nLenhBaiCap3 < 1 then
	Dialog:Say("Bạn thiếu Lệnh Bài Đồ Hải Tặc Cấp 3 rồi \n hãy mang nó tới đây gặp ta")
return 
end

Dialog:AskNumber("Số lượng đổi", nLenhBaiCap3, self.nang_vukhi_haitac1, self);
end 

function NangSachVo:nang_vukhi_haitac1(szHoaDacBiet)
local nLenhBaiCap3 = me.GetItemCountInBags(18,1,2025,12) 

local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbLenhBai3	= {18,1,2025,12,0,0}; 
	if (nLenhBaiCap3 < 1*szHoaDacBiet) or (nDong < (50*10000)*szHoaDacBiet) then
	Dialog:Say("Để tiến chế tạo "..szHoaDacBiet.." Lệnh Bài Vũ Khí cần Tối thiểu "..1*szHoaDacBiet.." Lệnh Bài Đồ Hải Tặc Cấp 3 và Tối thiểu "..50*szHoaDacBiet.." vạn đồng \n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nLenhBaiCap3.." Lệnh Bài Đồ Hải Tặc Cấp 3<color=gold>\nĐồng hiện nay có là "..SoDong.." vạn")
	return  
	end
	me.AddStackItem(18,1,2033,13,nil,szHoaDacBiet)
	me.AddJbCoin(-50*(szHoaDacBiet*10000))
		Task:DelItem(me, tbLenhBai3, szHoaDacBiet);
end

function NangSachVo:haitac1traphi()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc Cấp 2\n<color=green>(30 vạn)",self.haitactraphicap2,self};
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc Cấp 3\n<color=green>(50 vạn)<color>",self.haitactraphicap3,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:haitac1mienphi()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi\n <color=red> Miễn phí thì cần 2 lệnh bài cấp thấp hơn ta sẽ đổi cho ngươi 1 cái cao hơn";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc Cấp 2",self.haitacmienphi2,self};
			{"<color=yellow>Ta muốn nâng Lệnh Bài Đồ Hải Tặc Cấp 3<color>",self.haitacmienphi3,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:haitacmienphi2()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi\n <color=red> Miễn phí thì cần 2 lệnh bài cấp thấp hơn ta sẽ đổi cho ngươi 1 cái cao hơn";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng 1 Lệnh Bài Đồ Hải Tặc Cấp 2",self.haitacmienphi2_1lan,self};
			{"<color=yellow>Ta muốn nâng 10 Lệnh Bài Đồ Hải Tặc Cấp 2<color>",self.haitacmienphi2_10lan,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:haitacmienphi2_1lan()

if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,10,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,10)  --  Lệnh bài cấp 1
if nSoLuongSach < 2 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn Cần Có 2 Lệnh Bài Đồ Hải Tặc Cấp 1 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddStackItem(18,1,2025,11,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Đổi Thành Công  <color=green>Lệnh Bài Đồ Hải Tặc Cấp 2 Tiêu Tốn 2 Lệnh Bài Cấp 1<color>");	
Task:DelItem(me, tbSach, 2);
end
function NangSachVo:haitacmienphi2_10lan()

if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,10,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,10)  --  Lệnh bài cấp 1
if nSoLuongSach < 20 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn Cần Có 20 Lệnh Bài Đồ Hải Tặc Cấp 1 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddStackItem(18,1,2025,11,{bForceBind=1},10)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Đổi Thành Công  <color=green>10 Lệnh Bài Đồ Hải Tặc Cấp 2 Tiêu Tốn 20 Lệnh Bài Cấp 1<color>");	
Task:DelItem(me, tbSach, 20);
end

function NangSachVo:haitacmienphi3()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi\n <color=red> Miễn phí thì cần 2 lệnh bài cấp thấp hơn ta sẽ đổi cho ngươi 1 cái cao hơn";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng 1 Lệnh Bài Đồ Hải Tặc Cấp 3",self.haitacmienphi3_1lan,self};
			{"<color=yellow>Ta muốn nâng 10 Lệnh Bài Đồ Hải Tặc Cấp 2<color>",self.haitacmienphi3_10lan,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:haitacmienphi3_1lan()

if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,11,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,11)  --  Lệnh bài cấp 1
if nSoLuongSach < 2 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 3 Bạn Cần Có 2 Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddStackItem(18,1,2025,12,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Đổi Thành Công  <color=green>Lệnh Bài Đồ Hải Tặc Cấp 3 Tiêu Tốn 2 Lệnh Bài Cấp 2<color>");	
Task:DelItem(me, tbSach, 2);
end

function NangSachVo:haitacmienphi3_10lan()

if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,11,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,11)  --  Lệnh bài cấp 1
if nSoLuongSach < 20 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 3 Bạn Cần Có 20 Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddStackItem(18,1,2025,12,{bForceBind=1},10)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Đổi Thành Công  <color=green>10 Lệnh Bài Đồ Hải Tặc Cấp 3 Tiêu Tốn 20 Lệnh Bài Cấp 2<color>");	
Task:DelItem(me, tbSach, 20);
end

function NangSachVo:haitactraphicap2()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi\n <color=red>\nNâng Cấp Lệnh Bài Cấp 2 Trả Phí 1 Lần Tiêu Tốn :\n<color=cyan>*30 Vạn Đồng\n*1 Lệnh Bài Cấp 1";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng 1 Lệnh Bài Đồ Hải Tặc Cấp 2",self.haitactraphicap2_1lan,self};
			{"<color=yellow>Ta muốn nâng 10 Lệnh Bài Đồ Hải Tặc Cấp 2<color>",self.haitactraphicap2_10lan,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end


function NangSachVo:haitactraphicap2_1lan()
local nCount = me.GetJbCoin()
     if nCount < 300000 then
     Dialog:Say("Trong người ngươi Không đủ 30 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,10,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,10)  --  Lệnh bài cấp 1
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn Cần Có 1 Lệnh Bài Đồ Hải Tặc Cấp 1 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddJbCoin(-300000)
me.AddStackItem(18,1,2025,11,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Lệnh Bài Đồ Hải Tặc Cấp 2 Tiêu Tốn 1 LB Cấp 1 Và 30 Vạn Đồng Thường<color>");	
Task:DelItem(me, tbSach, 1);
end

function NangSachVo:haitactraphicap2_10lan()
local nCount = me.GetJbCoin()
     if nCount < 3000000 then
     Dialog:Say("Trong người ngươi Không đủ 300 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,10,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,10)  --  Lệnh bài cấp 1
if nSoLuongSach < 10 then
Dialog:Say("Để Nâng Cấp 10 Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn Cần Có 10 Lệnh Bài Đồ Hải Tặc Cấp 1 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddJbCoin(-3000000)
me.AddStackItem(18,1,2025,11,{bForceBind=1},10)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>10 Lệnh Bài Đồ Hải Tặc Cấp 2 Tiêu Tốn 10 LB Cấp 1 Và 300 Vạn Đồng Thường<color>");	
Task:DelItem(me, tbSach, 10);
end

function NangSachVo:haitactraphicap3()
	local szMsg = "\n<color=cyan>Ngươi tìm tới ta ắt hẳn có chuyện cần nhờ !! Nói đi\n <color=red>\nNâng Cấp Lệnh Bài Cấp 3 Trả Phí 1 Lần Tiêu Tốn :\n<color=cyan>*50 Vạn Đồng\n*1 Lệnh Bài Cấp 2";
	local tbOpt = 
	{
			{"<color=yellow>Ta muốn nâng 1 Lệnh Bài Đồ Hải Tặc Cấp 3",self.haitactraphicap3_1lan,self};
			{"<color=yellow>Ta muốn nâng 10 Lệnh Bài Đồ Hải Tặc Cấp 3<color>",self.haitactraphicap3_10lan,self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function NangSachVo:haitactraphicap3_1lan()
local nCount = me.GetJbCoin()
     if nCount < 500000 then
     Dialog:Say("Trong người ngươi Không đủ 50 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,11,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,11)  --  Lệnh bài cấp 1
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Lệnh Bài Đồ Hải Tặc Cấp 3 Bạn Cần Có 1 Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddJbCoin(-500000)
me.AddStackItem(18,1,2025,12,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Lệnh Bài Đồ Hải Tặc Cấp 3 Tiêu Tốn 1 Lệnh Bài Cấp 2 Và 50 Vạn Đồng Thường<color>");	
Task:DelItem(me, tbSach, 1);
end

function NangSachVo:haitactraphicap3_10lan()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,2025,11,0,0}; -- Lệnh bài cấp 1
local nSoLuongSach = me.GetItemCountInBags(18,1,2025,11)  --  Lệnh bài cấp 1
if nSoLuongSach < 10 then
Dialog:Say("Để Nâng Cấp 10 Lệnh Bài Đồ Hải Tặc Cấp 3 Bạn Cần Có 10 Lệnh Bài Đồ Hải Tặc Cấp 2 Bạn chỉ có "..nSoLuongSach.." Cái.")
return
end
me.AddJbCoin(-5000000)
me.AddStackItem(18,1,2025,12,{bForceBind=1},10)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>10 Lệnh Bài Đồ Hải Tặc Cấp 3 Tiêu Tốn 10 Lệnh Bài Cấp 2 Và 500 Vạn Đồng Thường<color>");	
Task:DelItem(me, tbSach, 10);
end

function NangSachVo:layvlmt()
me.AddStackItem(18,1,191,2,nil,10);
me.AddStackItem(18,1,190,1,nil,3000);
me.AddStackItem(18,1,114,8,nil,10);
me.AddJbCoin(3000000); 
end
function NangSachVo:layttk()
me.AddStackItem(18,1,192,1,nil,1);
me.AddStackItem(18,1,190,1,nil,100);
me.AddStackItem(18,1,114,7,nil,1);
me.AddJbCoin(3000000); 
end
function NangSachVo:vlmt()
	local szMsg = "Nguyên Liệu Cần Nâng Cấp :\nSách Trung:\n<color=yellow>*1 Cuốn VLMT Sơ \n*30 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 7\n*100 Danh Bổ Lệnh<color>\nNâng Sách Cao :\n<color=yellow>*1 Cuốn VLMT Trung \n*30 Vạn Đồng Thường\n*2 Viên Huyền Tinh Cấp 8\n*300 Danh Bổ Lệnh<color=red>\n*Lưu Ý : Thất bại mất toàn bộ nguyên liệu\nSách Không Mất<color>\n<color=cyan>";
	local tbOpt = 
	{
			{"<color=yellow>Nâng Cấp Võ Lâm Mật Tịch Trung<color>",self.vlmttrung,self};
			{"<color=yellow>Nâng Cấp Võ Lâm Mật Tịch Cao<color>",self.vlmtcao,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function NangSachVo:ttk()
	local szMsg = "Nguyên Liệu Cần Nâng Cấp :\nSách Trung:\n<color=yellow>*1 Cuốn TTK Sơ \n*30 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 7\n*100 Danh Bổ Lệnh<color>\nNâng Sách Cao :\n<color=yellow>*1 Cuốn TTK Trung \n*30 Vạn Đồng Thường\n*2 Viên Huyền Tinh Cấp 8\n*300 Danh Bổ Lệnh<color=red>\n*Lưu Ý : Thất bại mất toàn bộ nguyên liệu\nSách Không Mất<color>\n<color=cyan>";
	local tbOpt = 
	{
			{"<color=yellow>Nâng Cấp Tẩy Tủy Kinh Trung<color>",self.ttktrung,self};
			{"<color=yellow>Nâng Cấp Tẩy Tủy Kinh Cao<color>",self.ttkcao,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function NangSachVo:vlmttrung()
local nCount = me.GetJbCoin()
     if nCount < 30*10000 then
     Dialog:Say("Trong người ngươi Không đủ 30 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,191,1,0,0}; -- TTK Sơ
local nSoLuongSach = me.GetItemCountInBags(18,1,191,1)  -- TTK Sơ
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Trung Bạn Cần Có 1 Cuốn VLMT Sơ. Bạn chỉ có "..nSoLuongSach.." Cuốn.")
return
end
local tbItemDanhBoLenh	= {18,1,190,1,0,0}; 
local nSoLuongDanhBoLenh = me.GetItemCountInBags(18,1,190,1)  -- Danh Bổ Lệnh
if nSoLuongDanhBoLenh < 100 then
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Trung Bạn Cần Có 100 Danh Bổ Lệnh. Bạn chỉ có "..nSoLuongDanhBoLenh.." cái danh bổ lệnh.")
return
end

local tbHuyenTinh	= {18,1,114,7}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,7}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,7) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,7) -- Huyền Tinh 9
if nSoLuongHT >= 1 then



local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,191,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Võ Lâm Mật Tịch Trung<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Võ Lâm Mật Tịch Trung <color> !<color>");	
end
elseif nSoLuongHT1 >= 1 then
local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,191,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Võ Lâm Mật Tịch Trung<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Trung<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Võ Lâm Mật Tịch Trung <color> !<color>");	
end
else
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Trung Bạn Cần 1 Huyền Tinh 7 Và hiện tại bạn chỉ có "..nSoLuongHT.." Viên.")
		return 0;
end
end

function NangSachVo:vlmtcao()
local nCount = me.GetJbCoin()
     if nCount < 30*10000 then
     Dialog:Say("Trong người ngươi Không đủ 30 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,191,2,0,0}; -- TTK Trung
local nSoLuongSach = me.GetItemCountInBags(18,1,191,2)  -- TTK Trung
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Cao Bạn Cần Có 1 Cuốn VLMT Trung. Bạn chỉ có "..nSoLuongSach.." Cuốn.")
return
end
local tbItemDanhBoLenh	= {18,1,190,1,0,0}; 
local nSoLuongDanhBoLenh = me.GetItemCountInBags(18,1,190,1)  -- Danh Bổ Lệnh
if nSoLuongDanhBoLenh < 100 then
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Cao Bạn Cần Có 100 Danh Bổ Lệnh. Bạn chỉ có "..nSoLuongDanhBoLenh.." cái danh bổ lệnh.")
return
end

local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8) -- Huyền Tinh 9
if nSoLuongHT >= 2 then



local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,2029,1,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Võ Lâm Mật Tịch Cao<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Võ Lâm Mật Tịch Cao <color> !<color>");	
end
elseif nSoLuongHT1 >= 1 then
local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,191,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Võ Lâm Mật Tịch Cao<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Võ Lâm Mật Tịch Cao<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Võ Lâm Mật Tịch Cao <color> !<color>");	
end
else
Dialog:Say("Để Nâng Cấp Võ Lâm Mật Tịch Cao Bạn Cần 2 Huyền Tinh 8")
		return 0;
end
end


function NangSachVo:ttktrung()
local nCount = me.GetJbCoin()
     if nCount < 30*10000 then
     Dialog:Say("Trong người ngươi Không đủ 30 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,192,1,0,0}; -- TTK Sơ
local nSoLuongSach = me.GetItemCountInBags(18,1,192,1)  -- TTK Sơ
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Trung Bạn Cần Có 1 Cuốn TTK Sơ. Bạn chỉ có "..nSoLuongSach.." Cuốn.")
return
end
local tbItemDanhBoLenh	= {18,1,190,1,0,0}; 
local nSoLuongDanhBoLenh = me.GetItemCountInBags(18,1,190,1)  -- Danh Bổ Lệnh
if nSoLuongDanhBoLenh < 100 then
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Trung Bạn Cần Có 100 Danh Bổ Lệnh. Bạn chỉ có "..nSoLuongDanhBoLenh.." cái danh bổ lệnh.")
return
end

local tbHuyenTinh	= {18,1,114,7}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,7}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,7) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,7) -- Huyền Tinh 9
if nSoLuongHT  >= 1 then

local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,192,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Tẩy Tủy Kinh Trung<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Tẩy Tủy Kinh Trung <color> !<color>");	
end 

elseif nSoLuongHT1  >= 1 then
local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,192,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Tẩy Tủy Kinh Trung<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Trung<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
Task:DelItem(me, tbHuyenTinh1, 1);
Task:DelItem(me, tbItemDanhBoLenh, 100);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Tẩy Tủy Kinh Trung <color> !<color>");	
end 
else 
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Trung Bạn Cần 1 Huyền Tinh 7 Và hiện tại bạn chỉ có "..nSoLuongHT1.." Viên.")
return 0;
end
end


function NangSachVo:ttkcao()
local nCount = me.GetJbCoin()
     if nCount < 30*10000 then
     Dialog:Say("Trong người ngươi Không đủ 30 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbSach	= {18,1,192,2,0,0}; -- TTK Trung
local nSoLuongSach = me.GetItemCountInBags(18,1,192,2)  -- TTK Trung
if nSoLuongSach < 1 then
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Cao Bạn Cần Có 1 Cuốn TTK Trung. Bạn chỉ có "..nSoLuongSach.." Cuốn.")
return
end
local tbItemDanhBoLenh	= {18,1,190,1,0,0}; 
local nSoLuongDanhBoLenh = me.GetItemCountInBags(18,1,190,1)  -- Danh Bổ Lệnh
if nSoLuongDanhBoLenh < 300 then
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Cao Bạn Cần Có 300 Danh Bổ Lệnh. Bạn chỉ có "..nSoLuongDanhBoLenh.." cái danh bổ lệnh.")
return
end

local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8) -- Huyền Tinh 9
if nSoLuongHT  >= 1 then

local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,2029,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Tẩy Tủy Kinh Cao<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
-- Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Tẩy Tủy Kinh Cao <color> !<color>");	
end 

elseif nSoLuongHT1  >= 1 then
local ngaunhien = MathRandom(1,100)
if ngaunhien < 30 then
me.AddJbCoin(-30*10000)
me.AddStackItem(18,1,192,2,{bForceBind=1},1)
me.Msg("Nâng cấp Thành Công <color=yellow>Tẩy Tủy Kinh Cao<color>")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng cấp Thành Công <color=green>Tẩy Tủy Kinh Cao<color> sức mạnh vô biên !<color>");	
Task:DelItem(me, tbSach, 1);
Task:DelItem(me, tbHuyenTinh1, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
elseif  ngaunhien < 100 then
me.AddJbCoin(-30*10000)
Task:DelItem(me, tbHuyenTinh1, 2);
Task:DelItem(me, tbItemDanhBoLenh, 300);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> nâng cấp thất bại <color=green>Tẩy Tủy Kinh Cao <color> !<color>");	
end 
else 
Dialog:Say("Để Nâng Cấp Tẩy Tủy Kinh Cao Bạn Cần 2 Huyền Tinh 8")
return 0;
end
end

