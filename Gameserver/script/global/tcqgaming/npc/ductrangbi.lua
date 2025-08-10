----Dev TCQGaming
----02/02/2023 4:13
--- fb.com/xboy.hd

local tbDucTrangBi ={};
SpecialEvent.DucTrangBi= tbDucTrangBi;

function tbDucTrangBi:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\ductrangbi.lua");
	local szMsg = "Gặp ta để chế tạo mọi thứ liên quan đồng hành<color=cyan>  ";
	local tbOpt =
	{
		{"<color=yellow>Chế Tạo Trang Bị Đồng Hành<color>", self.chetaotrangbidonghanh,self},
		{"<color=yellow>Trùng Luyện Thuộc Tính<color>", self.trungluyentrangbi,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbDucTrangBi:chetaotrangbidonghanh()
	local szMsg = "Hello Bạn cần gì<color>";
	local tbOpt = 
	{
			{"<color=yellow>Chế Tạo Trang Bị Đồng Hành Cấp 1<color>",self.chetaotrangbidonghanhcap1,self};
			{"<color=yellow>Nâng Cấp Trang Bị Đồng Hành 1 Lên 2<color>", self.nangcaptrangbidonghanh,self},
			{"<color=yellow>Chế Tạo Trang Bị Đồng Hành Cấp 3<color>",self.chetaotrangbidonghanhcap3,self};
			 {"<color=yellow>Chế Tạo Trang Bị Đồng Hành Cấp 4<color>",self.chetaotrangbidonghanhcap4,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:chetaotrangbidonghanhcap1()
	local szMsg = "Nguyên Liệu Cần Chế Tạo :\n<color=yellow>*100 Mảnh \n*100 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 9<color>\n<color=red>*Lưu Ý : Thất bại mất toàn bộ nguyên liệu<color>";
	local tbOpt = 
	{
			{"<color=yellow>Chế Tạo Bích Huyết Chi Nhẫn (VK)<color>",self.DoiVuKhi_Cap1,self};
			{"<color=yellow>Chế Tạo Bích Huyết Chiến Y<color>",self.CheAo_Cap1,self};
			{"<color=yellow>Chế Tạo Bích Huyết Giới Chỉ<color>",self.CheNhan_Cap1,self};
			{"<color=yellow>Chế Tạo Bích Huyết Hộ Uyển<color>",self.DoiHoUyen_Cap1TCQ,self};
			{"<color=yellow>Chế Tạo Bích Huyết Hộ Thân Phù<color>",self.CheHoThanPhu_Cap1,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbDucTrangBi:nangcaptrangbidonghanh()
	local szMsg = "Nguyên Liệu Nâng Cấp :\n<color=yellow>*100 Mảnh\n*Một Trang Bị Cấp 1\n*100 Danh Bổ Lệnh\n*100 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 10<color>\n<color=red>Lưu Ý:Thất Bại Mất Hết Nguyên Liệu nhưng không mất Trang Bị Cấp 1\n*Thành Công Sẽ trừ hết\n<color>";
	local tbOpt = 
	{
			{"<color=yellow>Nâng Cấp Bích Huyết Chi Nhẫn<color>",self.nangvukhi2,self};
			{"<color=yellow>Nâng Cấp Bích Huyết Chiến Y<color>",self.nangao2,self};
			{"<color=yellow>Nâng Cấp Bích Huyết Giới Chỉ<color>",self.nangnhan2,self};
			{"<color=yellow>Nâng Cấp Bích Huyết Hộ Uyển<color>",self.nangtay2,self};
			{"<color=yellow>Nâng Cấp Bích Huyết Hộ Thân Phù<color>",self.nangphu2,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:chetaotrangbidonghanhcap4()
if me.nLevel < 149 then 
Dialog:Say("<color=yellow>Đẳng cấp của bạn chưa đủ cấp 149 không thể chế tạo trang bị đồng hành cấp 4")
return 
end 
	local szMsg = "Nguyên Liệu Cần Chế Tạo :\n<color=yellow>*1 Trang Bị Cấp 1 , 1 Trang Bị Cấp 3\n*3000 Mảnh Ghép TB\n*500 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 11<color>\n<color=red>*Lưu Ý : Tỉ Lệ 100% Thành Công<color>";
	local tbOpt = 
	{
			{"<color=yellow>Chế Tạo Hào Kiệt Chi Nhẫn<color>",self.chevukhicap4,self};
			{"<color=yellow>Chế Tạo Hào Kiệt Chiến Y<color>",self.cheaocap4,self};
			{"<color=yellow>Chế Tạo Hào Kiệt Chi Giới<color>",self.chenhancap4,self};
			{"<color=yellow>Chế Tạo Hào Kiệt Hộ Uyển<color>",self.chebaotaycap4,self};
			{"<color=yellow>Chế Tạo Hào Kiệt Hộ Thân Phù<color>",self.chehothanphucap4,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:chetaotrangbidonghanhcap3()
	local szMsg = "Nguyên Liệu Cần Chế Tạo :\n<color=yellow>*1 Cặp Đồ Cấp 1 Và 2 \n*500 Vạn Đồng Thường\n*1 Viên Huyền Tinh Cấp 10<color>\n<color=red>*Lưu Ý : Tỉ Lệ 100% Thành Công<color>";
	local tbOpt = 
	{
			{"<color=yellow>Chế Tạo Đơn Tâm Chi Nhẫn<color>",self.chevukhicap3,self};
			{"<color=yellow>Chế Tạo Đơn Tâm Chiến Y<color>",self.cheaocap3,self};
			{"<color=yellow>Chế Tạo Đơn Tâm Giới Chỉ<color>",self.chenhancap3,self};
			{"<color=yellow>Chế Tạo Đơn Tâm Hộ Uyển<color>",self.chebaotaycap3,self};
			{"<color=yellow>Chế Tạo Đơn Tâm Hộ Thân Phù<color>",self.chehothanphucap3,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:trungluyentrangbi()
	local szMsg = "Nguyên Liệu Trùng Luyện Thuộc Tính :\n<color=yellow>*1 Viên HT10\n*100 Vạn Đồng Thường<color>\n<color>";
	local tbOpt = 
	{
			{"<color=yellow>Trùng Luyện Trang Bị Cấp 2<color>",self.trungluyentrangbicap2,self};
			{"<color=yellow>Trùng Luyện Trang Bị Cấp 3<color>",self.trungluyentrangbicap3,self};
			{"<color=yellow>Trùng Luyện Trang Bị Cấp 4<color>",self.trungluyentrangbicap4,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:trungluyentrangbicap2()
	local szMsg = "Nguyên Liệu Trùng Luyện Thuộc Tính :\n<color=yellow>*1 Viên HT10\n*100 Vạn Đồng Thường<color>\n<color>";
	local tbOpt = 
	{
			-- {"<color=yellow>Trùng Luyện Bích Huyết Chi Nhẫn<color>",self.trungluyenvukhi,self};
			-- {"<color=yellow>Trùng Luyện Bích Huyết Chiến Y<color>",self.trungluyenao,self};
			{"<color=yellow>Trùng Luyện Kim Lân Giới Chỉ<color>",self.trungluyennhan,self};
			{"<color=yellow>Trùng Luyện Kim Lân Hộ Uyển<color>",self.trungluyentay,self};
			-- {"<color=yellow>Trùng Luyện Bích Huyết Hộ Thân Phù<color>",self.trungluyenphu,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:trungluyentrangbicap3()
	local szMsg = "Nguyên Liệu Trùng Luyện Thuộc Tính :\n<color=yellow>*1 Viên HT10\n*100 Vạn Đồng Thường<color>\n<color>";
	local tbOpt = 
	{
			{"<color=yellow>Trùng Luyện Đơn Tâm Chi Nhẫn Vũ Khí Cấp 3<color>",self.trungluyenvukhi3,self};
			{"<color=yellow>Trùng Luyện Đơn Tâm Chiến Y Cấp 3<color>",self.trungluyenao3,self};
			{"<color=yellow>Trùng Luyện Đơn Tâm Giới Chỉ Nhẫn Cấp 3<color>",self.trungluyennhan3,self};
			{"<color=yellow>Trùng Luyện Đơn Tâm Hộ Uyển Cấp 3<color>",self.trungluyentay3,self};
			{"<color=yellow>Trùng Luyện Đơn Tâm Hộ Thân Phù Cấp 3<color>",self.trungluyenngocboi3,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:trungluyentrangbicap4()
	local szMsg = "Nguyên Liệu Trùng Luyện Thuộc Tính :\n<color=yellow>*1 Viên HT10\n*200 Vạn Đồng Thường<color>\n<color>";
	local tbOpt = 
	{
			{"<color=yellow>Trùng Luyện Hào Kiệt Chi Nhẫn Cấp 4<color>",self.trungluyenvukhi4,self};
			{"<color=yellow>Trùng Luyện Hào Kiệt Chiến Y Cấp 4<color>",self.trungluyenao4,self};
			{"<color=yellow>Trùng Luyện Hào Kiệt Chi Giới Cấp 4<color>",self.trungluyennhan4,self};
			{"<color=yellow>Trùng Luyện Hào Kiệt Hộ Uyển Cấp 4<color>",self.trungluyentay4,self};
			{"<color=yellow>Trùng Luyện Hào Kiệt Hộ Thân Phù Cấp 4<color>",self.trungluyenngocboi4,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbDucTrangBi:DoiVuKhi_Cap1()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,1,0,0}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,1876,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 100 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 1) cần 100 Mảnh Vũ Khí. Bạn chỉ có "..nCount1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 9
local nCount4 = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
if nCount4 < 1 then
Dialog:Say("Để Chế Tạo Bích Huyết Chi Nhẫn Bạn Cần 1 Huyền Tinh 9 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,19,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Chi Nhẫn<color> tiêu hao 100 Mảnh Vũ Khí Đồng Hành")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Vũ Khí Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Vũ Khí Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Vũ Khí Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Vũ Khí Đồng Hành luyện hóa thất bại <color=green>Bích Huyết Chi Nhẫn<color> !<color>");	
end
end

function tbDucTrangBi:CheAo_Cap1()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,2,0,0}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,1876,2) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 100 then
Dialog:Say("Để Chế Tạo Bích Huyết Chiến Y (Cấp 1) cần 100 Mảnh Áo. Bạn chỉ có "..nCount1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 9
local nCount4 = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
if nCount4 < 1 then
Dialog:Say("Để Chế Tạo Bích Huyết Chiến Y Bạn Cần 1 Huyền Tinh 9 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if me.szAccount == "minhquan" then 


if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,20,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Chi Nhẫn<color> tiêu hao 100 Mảnh Áo Đồng Hành")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thất bại <color=green>Bích Huyết Chiến Y<color> !<color>");	
end


else 


if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,20,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Chi Nhẫn<color> tiêu hao 100 Mảnh Áo Đồng Hành")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Áo Đồng Hành luyện hóa thất bại <color=green>Bích Huyết Chiến Y<color> !<color>");	
end

end

end 

function tbDucTrangBi:CheNhan_Cap1()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,3,0,0}; -- Mảnh Bích Huyết Giới Chỉ
local nCount1 = me.GetItemCountInBags(18,1,1876,3) -- Mảnh Bích Huyết Giới Chỉ
if nCount1 < 100 then
Dialog:Say("Để Chế Tạo Bích Huyết Giới Chỉ (Cấp 1) cần 100 Mảnh Bích Huyết Giới Chỉ. Bạn chỉ có "..nCount1.." Mảnh.")
return
end

local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 9
local nCount4 = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
if nCount4 < 1 then
Dialog:Say("Để Chế Tạo Bích Huyết Giới Chỉ (Cấp 1) Bạn Cần 1 Huyền Tinh 9 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,21,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Giới Chỉ<color> tiêu hao 100 Mảnh Bích Huyết Giới Chỉ")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Giới Chỉ luyện hóa thành 1 <color=green>Bích Huyết Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Giới Chỉ luyện hóa thành 1 <color=green>Bích Huyết Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Giới Chỉ Hành luyện hóa thành 1 <color=green>Bích Huyết Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else 
me.AddJbCoin(-1000000)
Task:DelItem(me, tbHuyenTinh, 1);
Task:DelItem(me, tbItemId1, 100);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Giới Chỉ luyện hóa thất bại <color=green>Bích Huyết Giới Chỉ<color> !<color>");	
end
end

function tbDucTrangBi:CheHoThanPhu_Cap1()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,5,0,0}; -- Mảnh Bích Huyết Giới Chỉ 
local nCount1 = me.GetItemCountInBags(18,1,1876,5) -- Mảnh Bích Huyết Giới Chỉ
if nCount1 < 100 then
Dialog:Say("Để Chế Tạo Bích Huyết Hộ Thân Phù (Cấp 1) cần 100 Mảnh Bích Huyết Hộ Thân Phù. Bạn chỉ có "..nCount1.." Mảnh.")
return
end

local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 9
local nCount4 = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
if nCount4 < 1 then
Dialog:Say("Để Chế Tạo Bích Huyết Hộ Thân Phù (Cấp 1) Bạn Cần 1 Huyền Tinh 9 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,23,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Giới Chỉ<color> tiêu hao 100 Mảnh Bích Huyết Hộ Thân Phù")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Hộ Thân Phù luyện hóa thành 1 <color=green>Bích Huyết Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Hộ Thân Phù luyện hóa thành 1 <color=green>Bích Huyết Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Hộ Thân Phù Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Bích Huyết Hộ Thân Phù luyện hóa thất bại <color=green>Bích Huyết Hộ Thân Phù<color> !<color>");	
end
end

function tbDucTrangBi:DoiHoUyen_Cap1TCQ()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,4,0,0}; -- Mảnh Hộ Uyển Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,1876,4) -- Mảnh Hộ Uyển Đồng Hành
if nCount1 < 100 then
Dialog:Say("Để Chế Tạo Bích Huyết Hộ Uyển (Cấp 1) cần 100 Mảnh Hộ Uyển Đồng Hành. Bạn chỉ có "..nCount1.." Mảnh.")
return
end

local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 9
local nCount4 = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
if nCount4 < 1 then
Dialog:Say("Để Chế Tạo Bích Huyết Hộ Uyển (Cấp 1) Bạn Cần 1 Huyền Tinh 9 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if  (me.szAccount == "cayquoc")  then 
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,22,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Hộ Uyển<color> tiêu hao 100 Mảnh Hộ Uyển Đồng Hành")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thất bại <color=green>Bích Huyết Hộ Uyển<color> !<color>");	
end
else 
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,22,1,1,{bForceBind=1},1)
me.Msg("Ghép thành công <color=yellow>Bích Huyết Hộ Uyển<color> tiêu hao 100 Mảnh Hộ Uyển Đồng Hành")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thành 1 <color=green>Bích Huyết Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 100 Mảnh Hộ Uyển Đồng Hành luyện hóa thất bại <color=green>Bích Huyết Hộ Uyển<color> !<color>");	
end
end 
end

function tbDucTrangBi:nangvukhi2()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,1}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,1876,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 100 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 1) cần 100 Mảnh Vũ Khí. Bạn chỉ có "..nCount1.." Mảnh.")
		return 0;
end
local tbVuKhi1	= {5,19,1,1}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,19,1,1) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Để Nâng Cấp Vũ Khí 2 Bạn Cần Có 1 Vũ Khí Đồng Hành Cấp 1. Bạn chỉ có "..nCount2.." Cái.")
		return 0;
end

local tbDanhBoLenh	= {18,1,190,1}; -- Danh Bộ Lệnh
local nCount3 = me.GetItemCountInBags(18,1,190,1) -- Danh Bộ Lệnh
if nCount3 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Chi Nhẫn Bạn Cần 100 Danh Bổ Lệnh Và hiện tại bạn chỉ có "..nCount3.." Cái Danh Bổ Lệnh.")
		return 0;
end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Chi Nhẫn Bạn Cần 1 Huyền Tinh 10 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end
local ngaunhien = MathRandom(1,100)

if (me.szAccount == "aducbva")  then 


if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,19,1,2,{bForceBind=1},1)
me.Msg("Nâng Cấp <color=yellow>Bích Huyết Chi Nhẫn thành Kim Lân Chi Nhẫn<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else 
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Bích Huyết Chi Nhẫn thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Vũ Khí 1<color> !<color>");	
end

else 

if ngaunhien < 15 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,19,1,2,{bForceBind=1},1)
me.Msg("Nâng Cấp <color=yellow>Bích Huyết Chi Nhẫn thành Kim Lân Chi Nhẫn<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chi Nhẫn<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else 
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Bích Huyết Chi Nhẫn thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Vũ Khí 1<color> !<color>");	
end

end 

end

function tbDucTrangBi:nangao2()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,2}; -- Mảnh Áo
local nCount1 = me.GetItemCountInBags(18,1,1876,2) -- Mảnh Áo
if nCount1 < 100 then
Dialog:Say("Để Nâng Cấp Áo (Cấp 2) cần 100 Mảnh Áo. Bạn chỉ có "..nCount1.." Mảnh.")
		return 0;
end
local tbVuKhi1	= {5,20,1,1}; --  Áo Cấp 1
local nCount2 = me.GetItemCountInBags(5,20,1,1) -- Áo Cấp 1
if nCount2 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Chiến Y Bạn Cần Có 1 Bích Huyết Chiến Y. Hiện Tại Bạn chỉ có "..nCount2.." Cái.")
		return 0;
end

local tbDanhBoLenh	= {18,1,190,1}; -- Danh Bộ Lệnh
local nCount3 = me.GetItemCountInBags(18,1,190,1) -- Danh Bộ Lệnh
if nCount3 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Chiến Y Bạn Cần 100 Danh Bổ Lệnh Và hiện tại bạn chỉ có "..nCount3.." Cái Danh Bổ Lệnh.")
		return 0;
end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Chiến Y Bạn Cần 1 Huyền Tinh 10 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if (me.szAccount == "aducbva")  then 
if ngaunhien < 25 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,20,1,2,{bForceBind=1},1)
me.Msg("Nâng Cấp <color=red>Bích Huyết Chiến Y<color> thành <color=yellow>Kim Lân Chiến Y<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else 
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Chiến Y thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Chiến Y<color> !<color>");	
end
else 
if ngaunhien < 15 then
me.AddJbCoin(-1000000)
me.AddStackItem(5,20,1,2,{bForceBind=1},1)
me.Msg("Nâng Cấp <color=red>Bích Huyết Chiến Y<color> thành <color=yellow>Kim Lân Chiến Y<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Chiến Y<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
else 
me.AddJbCoin(-1000000)
Task:DelItem(me, tbItemId1, 100);
Task:DelItem(me, tbDanhBoLenh, 100);
Task:DelItem(me, tbHuyenTinh, 1);
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Chiến Y thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Chiến Y<color> !<color>");	
end
end 
end

function tbDucTrangBi:nangnhan2()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,3}; -- Mảnh Nhẫn
local nCount1 = me.GetItemCountInBags(18,1,1876,3) -- Mảnh Nhẫn
if nCount1 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Giới Chỉ (Cấp 2) cần 100 Mảnh Nhẫn. Bạn chỉ có "..nCount1.." Mảnh.")
		return 0;
end
local tbVuKhi1	= {5,21,1,1}; --  Nhẫn Cấp 1
local nCount2 = me.GetItemCountInBags(5,21,1,1) -- Nhẫn Cấp 1
if nCount2 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Giới Chỉ Bạn Cần Có 1 Bích Huyết Chiến Y. Hiện Tại Bạn chỉ có "..nCount2.." Cái.")
		return 0;
end

local tbDanhBoLenh	= {18,1,190,1}; -- Danh Bộ Lệnh
local nCount3 = me.GetItemCountInBags(18,1,190,1) -- Danh Bộ Lệnh
if nCount3 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Giới Chỉ Bạn Cần 100 Danh Bổ Lệnh Và hiện tại bạn chỉ có "..nCount3.." Cái Danh Bổ Lệnh.")
		return 0;
end

local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Giới Chỉ Bạn Cần 1 Huyền Tinh 10 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if (me.szAccount == "aducbva")  then 
				if ngaunhien < 25 then
				me.AddJbCoin(-1000000)
				me.AddStackItem(5,21,1,2,{bForceBind=1},1)
				me.Msg("Nâng Cấp <color=red>Bích Huyết Giới Chỉ<color> thành <color=yellow>Kim Lân Giới Chỉ<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
				GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
				KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
				KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
				Task:DelItem(me, tbItemId1, 100);----Mảnh 
				Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
				Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
				Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
				else 
				me.AddJbCoin(-1000000)
				Task:DelItem(me, tbItemId1, 100);
				Task:DelItem(me, tbHuyenTinh, 1);
				Task:DelItem(me, tbDanhBoLenh, 100);
				-- Task:DelItem(me, tbItemId2, 1);
				KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Giới Chỉ thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Giới Chỉ<color> !<color>");	
				end
else 
				if ngaunhien < 15 then
				me.AddJbCoin(-1000000)
				me.AddStackItem(5,21,1,2,{bForceBind=1},1)
				me.Msg("Nâng Cấp <color=red>Bích Huyết Giới Chỉ<color> thành <color=yellow>Kim Lân Giới Chỉ<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
				GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
				KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
				KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Giới Chỉ<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
				Task:DelItem(me, tbItemId1, 100);----Mảnh 
				Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
				Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
				Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
				else 
				me.AddJbCoin(-1000000)
				Task:DelItem(me, tbItemId1, 100);
				Task:DelItem(me, tbHuyenTinh, 1);
				Task:DelItem(me, tbDanhBoLenh, 100);
				-- Task:DelItem(me, tbItemId2, 1);
				KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Giới Chỉ thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Giới Chỉ<color> !<color>");	
				end
end
end 

function tbDucTrangBi:nangtay2()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,4}; -- Mảnh Uyển
local nCount1 = me.GetItemCountInBags(18,1,1876,4) -- Mảnh Uyển
if nCount1 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Uyển (Cấp 2) cần 100 Mảnh Nhẫn. Bạn chỉ có "..nCount1.." Mảnh.")
		return 0;
end
local tbVuKhi1	= {5,22,1,1}; --  Uyển Cấp 1
local nCount2 = me.GetItemCountInBags(5,22,1,1) -- Uyển Cấp 1
if nCount2 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Uyển (Cấp 2) Bạn Cần Có 1 Bích Huyết Hộ Uyển. Hiện Tại Bạn chỉ có "..nCount2.." Cái.")
		return 0;
end

local tbDanhBoLenh	= {18,1,190,1}; -- Danh Bộ Lệnh
local nCount3 = me.GetItemCountInBags(18,1,190,1) -- Danh Bộ Lệnh
if nCount3 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Uyển (Cấp 2) Bạn Cần 100 Danh Bổ Lệnh Và hiện tại bạn chỉ có "..nCount3.." Cái Danh Bổ Lệnh.")
		return 0;
end

local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Uyển (Cấp 2) Bạn Cần 1 Huyền Tinh 10 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if (me.szAccount == "aducbva")  then 
					if ngaunhien < 25 then
					me.AddJbCoin(-1000000)
					me.AddStackItem(5,22,1,2,{bForceBind=1},1)
					me.Msg("Nâng Cấp <color=red>Bích Huyết Hộ Uyển<color> thành <color=yellow>Kim Lân Hộ Uyển<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
					GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
					KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
					Task:DelItem(me, tbItemId1, 100);----Mảnh 
					Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
					Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
					Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
					else 
					me.AddJbCoin(-1000000)
					Task:DelItem(me, tbItemId1, 100);
					Task:DelItem(me, tbHuyenTinh, 1);
					Task:DelItem(me, tbDanhBoLenh, 100);
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Hộ Uyển thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Hộ Uyển<color> !<color>");	
					end
else 
					if ngaunhien < 15 then
					me.AddJbCoin(-1000000)
					me.AddStackItem(5,22,1,2,{bForceBind=1},1)
					me.Msg("Nâng Cấp <color=red>Bích Huyết Hộ Uyển<color> thành <color=yellow>Kim Lân Hộ Uyển<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
					GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
					KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Uyển<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
					Task:DelItem(me, tbItemId1, 100);----Mảnh 
					Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
					Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
					Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
					else 
					me.AddJbCoin(-1000000)
					Task:DelItem(me, tbItemId1, 100);
					Task:DelItem(me, tbHuyenTinh, 1);
					Task:DelItem(me, tbDanhBoLenh, 100);
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Hộ Uyển thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Hộ Uyển<color> !<color>");	
					end
end 
end

function tbDucTrangBi:nangphu2()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,1876,5}; -- Mảnh Phù
local nCount1 = me.GetItemCountInBags(18,1,1876,5) -- Mảnh Phù
if nCount1 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Thân Phù (Cấp 2) cần 100 Mảnh Phù. Bạn chỉ có "..nCount1.." Mảnh.")
		return 0;
end
local tbVuKhi1	= {5,23,1,1}; --  Uyển Cấp 1
local nCount2 = me.GetItemCountInBags(5,23,1,1) -- Uyển Cấp 1
if nCount2 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Thân Phù (Cấp 2) Bạn Cần Có 1 Bích Huyết Hộ Thân Phù. Hiện Tại Bạn chỉ có "..nCount2.." Cái.")
		return 0;
end

local tbDanhBoLenh	= {18,1,190,1}; -- Danh Bộ Lệnh
local nCount3 = me.GetItemCountInBags(18,1,190,1) -- Danh Bộ Lệnh
if nCount3 < 100 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Thân Phù (Cấp 2) Bạn Cần 100 Danh Bổ Lệnh Và hiện tại bạn chỉ có "..nCount3.." Cái Danh Bổ Lệnh.")
		return 0;
end

local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Để Nâng Cấp Kim Lân Hộ Thân Phù (Cấp 2) Bạn Cần 1 Huyền Tinh 10 Và hiện tại bạn chỉ có "..nCount4.." Viên.")
		return 0;
end

local ngaunhien = MathRandom(1,100)
if (me.szAccount == "aducbva")  then 
					if ngaunhien < 25 then
					me.AddJbCoin(-1000000)
					me.AddStackItem(5,23,1,2,{bForceBind=1},1)
					me.Msg("Nâng Cấp <color=red>Bích Huyết Hộ Thân Phù<color> thành <color=yellow>Kim Lân Hộ Thân Phù (Cấp 2)<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
					GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
					KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
					Task:DelItem(me, tbItemId1, 100);----Mảnh 
					Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
					Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
					Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
					else 
					me.AddJbCoin(-1000000)
					Task:DelItem(me, tbItemId1, 100);
					Task:DelItem(me, tbHuyenTinh, 1);
					Task:DelItem(me, tbDanhBoLenh, 100);
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Hộ Thân Phù thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Hộ Thân Phù<color> !<color>");	
					end
else 
					if ngaunhien < 15 then
					me.AddJbCoin(-1000000)
					me.AddStackItem(5,23,1,2,{bForceBind=1},1)
					me.Msg("Nâng Cấp <color=red>Bích Huyết Hộ Thân Phù<color> thành <color=yellow>Kim Lân Hộ Thân Phù (Cấp 2)<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
					GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>"});
					KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Thành Công <color=green>Kim Lân Hộ Thân Phù<color> gia tăng sức mạnh cho bạn đồng hành !<color>");	
					Task:DelItem(me, tbItemId1, 100);----Mảnh 
					Task:DelItem(me, tbVuKhi1, 1);----- Trang Bị Cấp 1
					Task:DelItem(me, tbHuyenTinh, 1);----Huyền Tinh
					Task:DelItem(me, tbDanhBoLenh, 100);----Danh Bổ Lệnh
					else 
					me.AddJbCoin(-1000000)
					Task:DelItem(me, tbItemId1, 100);
					Task:DelItem(me, tbHuyenTinh, 1);
					Task:DelItem(me, tbDanhBoLenh, 100);
					KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Nâng Cấp Kim Lân Hộ Thân Phù thất bại <color=green>Mất Hết Nguyên Liệu Chỉ Còn Lại Bích Huyết Hộ Thân Phù<color> !<color>");	
					end
end 
end

-----------Trùng Luyện ----------
function tbDucTrangBi:trungluyenvukhi()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10.")
		return 0;
end

local tbVuKhi1	= {5,19,1,2}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,19,1,2) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Vũ Khí Cấp 2 đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
me.AddStackItem(5,19,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Kim Lân Chi Nhẫn<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
end
function tbDucTrangBi:trungluyenao()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10.")
		return 0;
end

local tbVuKhi1	= {5,20,1,2}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,20,1,2) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Kim Lân Chiến Y đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
me.Msg("Trùng Luyện <color=yellow>Kim Lân Chiến Y<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,20,1,2,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyennhan()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10.")
		return 0;
end

local tbVuKhi1	= {5,21,1,2}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,21,1,2) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Kim Lân Giới Chỉ đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Kim Lân Giới Chỉ<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,21,1,2,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyentay()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10.")
		return 0;
end

local tbVuKhi1	= {5,22,1,2}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,22,1,2) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Kim Lân Hộ Uyển đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Kim Lân Hộ Uyển<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Kim Lân Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,22,1,2,{bForceBind=1},1)
end

----Trùng luyện đồ cấp 3 
function tbDucTrangBi:trungluyenvukhi3()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,19,1,3}; -- Vũ Khí Cấp 3
local nCount2 = me.GetItemCountInBags(5,19,1,3) -- Vũ Khí Cấp 3
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Vũ Khí Cấp 3 đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
me.Msg("Trùng Luyện <color=yellow>Đơn Tâm Chi Nhẫn<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,19,1,3,{bForceBind=1},1)
end
function tbDucTrangBi:trungluyenao3()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,20,1,3}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,20,1,3) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Đơn Tâm Chiến Y đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
me.Msg("Trùng Luyện <color=yellow>Đơn Tâm Chiến Y<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,20,1,3,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyennhan3()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,21,1,3}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,21,1,3) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Đơn Tâm Giới Chỉ đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Đơn Tâm Giới Chỉ<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Giới Chỉ<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,21,1,3,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyentay3()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,22,1,3}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,22,1,3) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Đơn Tâm Hộ Uyển đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Đơn Tâm Hộ Uyển<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,22,1,3,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyenngocboi3()
local nCount = me.GetJbCoin()
     if nCount < 1000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,23,1,3}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,23,1,3) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Đơn Tâm Hộ Thân Phù đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-1000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Đơn Tâm Hộ Thân Phù<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Đơn Tâm Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,23,1,3,{bForceBind=1},1)
end

---end trùng luyện dấp 3

----Trùng luyện đồ cấp 4
function tbDucTrangBi:trungluyenvukhi4()
local nCount = me.GetJbCoin()
     if nCount < 2000000 then
     Dialog:Say("Trong người ngươi Không đủ 200 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,19,1,4}; -- Vũ Khí Cấp 3
local nCount2 = me.GetItemCountInBags(5,19,1,4) -- Vũ Khí Cấp 3
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Vũ Khí Cấp 4 đặt tại hành trang đi bạn.")
		return 0;
end

me.Msg("Trùng Luyện <color=yellow>Hào Kiệt Chi Nhẫn<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Nhẫn<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddJbCoin(-2000000)
me.AddStackItem(5,19,1,4,{bForceBind=1},1)
end
function tbDucTrangBi:trungluyenao4()
local nCount = me.GetJbCoin()
     if nCount < 2000000 then
     Dialog:Say("Trong người ngươi Không đủ 200 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,20,1,4}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,20,1,4) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Hào Kiệt Chiến Y đặt tại hành trang đi bạn.")
		return 0;
end

me.Msg("Trùng Luyện <color=yellow>Hào Kiệt Chiến Y<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chiến Y<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddJbCoin(-2000000)
me.AddStackItem(5,20,1,4,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyennhan4()
local nCount = me.GetJbCoin()
     if nCount < 2000000 then
     Dialog:Say("Trong người ngươi Không đủ 200 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,21,1,4}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,21,1,4) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Hào Kiệt Chi Giới đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-2000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Hào Kiệt Chi Giới<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Giới<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Giới<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Chi Giới<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,21,1,4,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyentay4()
local nCount = me.GetJbCoin()
     if nCount < 2000000 then
     Dialog:Say("Trong người ngươi Không đủ 100 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,22,1,4}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,22,1,4) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Hào Kiệt Hộ Uyển đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-2000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Hào Kiệt Hộ Uyển<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Uyển<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,22,1,4,{bForceBind=1},1)
end

function tbDucTrangBi:trungluyenngocboi4()
local nCount = me.GetJbCoin()
     if nCount < 2000000 then
     Dialog:Say("Trong người ngươi Không đủ 200 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end

local tbVuKhi1	= {5,23,1,4}; -- Vũ Khí Cấp 1
local nCount2 = me.GetItemCountInBags(5,23,1,4) -- Vũ Khí Cấp 1
if nCount2 < 1 then
Dialog:Say("Trùng Luyện Thì hãy mang Hào Kiệt Hộ Thân Phù đặt tại hành trang đi bạn.")
		return 0;
end

me.AddJbCoin(-2000000)
-- me.AddStackItem(5,21,1,2,{bForceBind=1},1)
me.Msg("Trùng Luyện <color=yellow>Hào Kiệt Hộ Thân Phù<color> Thành Công Tiêu Hao Tất Cả Nguyên Liệu")
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Trùng Luyện Thành Công <color=green>Hào Kiệt Hộ Thân Phù<color> Thuộc Tính Đã Thay Đổi !<color>");	
Task:DelItem(me, tbVuKhi1, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,23,1,4,{bForceBind=1},1)
end

---end trùng luyện dấp 4


function tbDucTrangBi:chevukhicap3()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,19,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 3) cần 1 Vũ Khí Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,19,1,2,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,19,1,2) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 3) cần 1 Vũ Khí Đồng Hành Cấp 2")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,19,1,3,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Vũ Khí Đồng Hành Cấp 1\n1 Vũ Khí Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n1 Viên HT Cấp 10\nNâng Cấp Thành Công <color=gold>Đơn Tâm Chi Nhẫn<color> !<color>");	
end

function tbDucTrangBi:cheaocap3()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,20,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 3) cần 1 Áo Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,20,1,2,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,20,1,2) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 3) cần 1 Áo Đồng Hành Cấp 2")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,20,1,3,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Áo Đồng Hành Cấp 1\n1 Áo Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n1 Viên HT Cấp 10\nNâng Cấp Thành Công <color=gold>Đơn Tâm Chiến Y<color> !<color>");	
end

function tbDucTrangBi:chebaotaycap3()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,22,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Hộ Uyển Đồng Hành (Cấp 3) cần 1 Hộ Uyển Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,22,1,2,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,22,1,2) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Hộ Uyển Đồng Hành (Cấp 3) cần 1 Hộ Uyển Đồng Hành Cấp 2")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,22,1,3,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Hộ Uyển Đồng Hành Cấp 1\n1 Hộ Uyển Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n1 Viên HT Cấp 10\nNâng Cấp Thành Công <color=gold>Đơn Tâm Hộ Uyển<color> !<color>");	
end

function tbDucTrangBi:chenhancap3()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,21,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 3) cần 1 Nhẫn Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,21,1,2,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,21,1,2) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 3) cần 1 Nhẫn Đồng Hành Cấp 2")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,21,1,3,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Nhẫn Đồng Hành Cấp 1\n1 Nhẫn Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n1 Viên HT Cấp 10\nNâng Cấp Thành Công <color=gold>Đơn Tâm Chi Nhẫn<color> !<color>");	
end

function tbDucTrangBi:chehothanphucap3()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 10 Hãy Lấy Viên Có ID là 18,1,114,10 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,23,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Hộ Thân Phù Đồng Hành (Cấp 3) cần 1 Hộ Thân Phù Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,23,1,2,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,23,1,2) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Hộ Thân Phù Đồng Hành (Cấp 3) cần 1 Hộ Thân Phù Đồng Hành Cấp 2")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,23,1,3,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Hộ Thân Phù Đồng Hành Cấp 1\n1 Hộ Thân Phù Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n1 Viên HT Cấp 10\nNâng Cấp Thành Công <color=gold>Đơn Tâm Hộ Thân Phù<color> !<color>");	
end


--------Đồ Cấp 4 
function tbDucTrangBi:chevukhicap4()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 11
local nCount4 = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 11
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 11 Hãy Lấy Viên Có ID là 18,1,114,11 để tiến hành.")
		return 0;
end

local n_ManhGhep	= {18,1,1876,1,0,0}; -- Mảnh Vũ Khí Đồng Hành
local n_ManhGhep1 = me.GetItemCountInBags(18,1,1876,1) -- Mảnh Vũ Khí Đồng Hành
if n_ManhGhep1 < 3000 then
Dialog:Say("Để Chế Tạo Hào Kiệt Chi Nhẫn (Cấp 4) cần 3000 Mảnh Vũ Khí. Bạn chỉ có "..n_ManhGhep1.." Mảnh.")
return
end

local tbItemId1	= {5,19,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,19,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 4) cần 1 Vũ Khí Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,19,1,3,0,0}; -- Trang Bị Cấp 3
local nCount2 = me.GetItemCountInBags(5,19,1,3) -- Trang Bị Cấp 3
if nCount2 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 4) cần 1 Vũ Khí Đồng Hành Cấp 3")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, n_ManhGhep, 3000);
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,19,1,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Vũ Khí Đồng Hành Cấp 1\n1 Vũ Khí Đồng Hành Cấp 3\n500 Vạn Đồng Thường\n3000 Mảnh Ghép Vũ Khí Đồng Hành\n1 Viên HT Cấp 11\nNâng Cấp Thành Công <color=gold>Hào Kiệt Chi Nhẫn<color> !<color>");	
end

function tbDucTrangBi:cheaocap4()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
	local n_ManhGhep	= {18,1,1876,2,0,0}; -- Mảnh Vũ Khí Đồng Hành
local n_ManhGhep1 = me.GetItemCountInBags(18,1,1876,2) -- Mảnh Vũ Khí Đồng Hành
if n_ManhGhep1 < 3000 then
Dialog:Say("Để Chế Tạo Hào Kiệt Chiến Y (Cấp 4) cần 3000 Mảnh Áo. Bạn chỉ có "..n_ManhGhep1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 11
local nCount4 = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 11
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 11 Hãy Lấy Viên Có ID là 18,1,114,11 để tiến hành.")
		return 0;
end
local tbItemId1	= {5,20,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,20,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 3) cần 1 Áo Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,20,1,3,0,0}; -- Trang Bị Cấp 3
local nCount2 = me.GetItemCountInBags(5,20,1,3) -- Trang Bị Cấp 3
if nCount2 < 1 then
Dialog:Say("Để đổi Áo Đồng Hành (Cấp 4) cần 1 Áo Đồng Hành Cấp 3")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, n_ManhGhep, 3000);
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,20,1,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Trang Bị Áo Đồng Hành Cấp 1\n1 Trang Bị Áo Đồng Hành Cấp 3\n500 Vạn Đồng Thường\n3000 Mảnh Ghép Áo Đồng Hành\n1 Viên HT Cấp 11\nNâng Cấp Thành Công <color=gold>Hào Kiệt Chiến Y<color> !<color>");	
end

function tbDucTrangBi:chebaotaycap4()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
		local n_ManhGhep	= {18,1,1876,4,0,0}; -- Mảnh Vũ Khí Đồng Hành
local n_ManhGhep1 = me.GetItemCountInBags(18,1,1876,4) -- Mảnh Vũ Khí Đồng Hành
if n_ManhGhep1 < 3000 then
Dialog:Say("Để Chế Tạo Hào Kiệt Hộ Uyển (Cấp 4) cần 3000 Mảnh Hộ Uyển. Bạn chỉ có "..n_ManhGhep1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 11 Hãy Lấy Viên Có ID là 18,1,114,11 để tiến hành.")
		return 0;
end
local tbItemId1	= {5,22,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,22,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Vũ Khí Đồng Hành (Cấp 3) cần 1 Vũ Khí Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,22,1,3,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,22,1,3) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Hộ Uyển Đồng Hành (Cấp 4) cần 1 Hộ Uyển Đồng Hành Cấp 3")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, n_ManhGhep, 3000);
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,22,1,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Hộ Uyển Đồng Hành Cấp 1\n1 Hộ Uyển Đồng Hành Cấp 2\n500 Vạn Đồng Thường\n3000 Mảnh Ghép Hộ Uyển Đồng Hành\n1 Viên HT Cấp 11\nNâng Cấp Thành Công <color=gold>Hào Kiệt Hộ Uyển<color> !<color>");	
end

function tbDucTrangBi:chenhancap4()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
			local n_ManhGhep	= {18,1,1876,3,0,0}; -- Mảnh Vũ Khí Đồng Hành
local n_ManhGhep1 = me.GetItemCountInBags(18,1,1876,3) -- Mảnh Vũ Khí Đồng Hành
if n_ManhGhep1 < 3000 then
Dialog:Say("Để Chế Tạo Hào Kiệt Chi Giới (Cấp 4) cần 3000 Mảnh Nhẫn. Bạn chỉ có "..n_ManhGhep1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 11 Hãy Lấy Viên Có ID là 18,1,114,11 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,21,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,21,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 4) cần 1 Vũ Khí Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,21,1,3,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,21,1,3) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Nhẫn Đồng Hành (Cấp 4) cần 1 Vũ Khí Đồng Hành Cấp 3")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, n_ManhGhep, 3000);
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,21,1,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Nhẫn Đồng Hành Cấp 1\n1 Nhẫn Đồng Hành Cấp 3\n500 Vạn Đồng Thường\n3000 Mảnh Ghép Hộ Uyển Đồng Hành\n1 Viên HT Cấp 11\nNâng Cấp Thành Công <color=gold>Hào Kiệt Chi Giới<color> !<color>");	
end

function tbDucTrangBi:chehothanphucap4()
local nCount = me.GetJbCoin()
     if nCount < 5000000 then
     Dialog:Say("Trong người ngươi Không đủ 500 Vạn đồng, có đủ rồi hãy quay lại.")
     return 0;
     end
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
				local n_ManhGhep	= {18,1,1876,5,0,0}; -- Mảnh Vũ Khí Đồng Hành
local n_ManhGhep1 = me.GetItemCountInBags(18,1,1876,5) -- Mảnh Vũ Khí Đồng Hành
if n_ManhGhep1 < 3000 then
Dialog:Say("Để Chế Tạo Hào Kiệt Hộ Thân Phù (Cấp 4) cần 3000 Mảnh Hộ Thân Phù. Bạn chỉ có "..n_ManhGhep1.." Mảnh.")
return
end
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 10
local nCount4 = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 10
if nCount4 < 1 then
Dialog:Say("Bạn Còn Thiếu 1 Huyền Tinh 11 Hãy Lấy Viên Có ID là 18,1,114,11 để tiến hành trùng Luyện.")
		return 0;
end
local tbItemId1	= {5,23,1,1,0,0}; -- Trang Bị Cấp 1
local nCount1 = me.GetItemCountInBags(5,23,1,1) -- Trang Bị Cấp 1
if nCount1 < 1 then
Dialog:Say("Để đổi Hộ Thân Phù Đồng Hành (Cấp 4) cần 1 Hộ Thân Phù Đồng Hành Cấp 1")
return
end
local tbItemId2	= {5,23,1,3,0,0}; -- Trang Bị Cấp 2
local nCount2 = me.GetItemCountInBags(5,23,1,3) -- Trang Bị Cấp 2
if nCount2 < 1 then
Dialog:Say("Để đổi Hộ Thân Phù Đồng Hành (Cấp 4) cần 1 Hộ Thân Phù Đồng Hành Cấp 3")
return
end

me.AddJbCoin(-5000000)
Task:DelItem(me, n_ManhGhep, 3000);
Task:DelItem(me, tbItemId1, 1);
Task:DelItem(me, tbItemId2, 1);
Task:DelItem(me, tbHuyenTinh, 1);
me.AddStackItem(5,23,1,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 1 Hộ Thân Phù Đồng Hành Cấp 1\n1 Hộ Thân Phù Đồng Hành Cấp 3\n500 Vạn Đồng Thường\n3000 Mảnh Ghép Hộ Uyển Đồng Hành\n1 Viên HT Cấp 11\nNâng Cấp Thành Công <color=gold>Hào Kiệt Hộ Thân Phù<color> !<color>");	
end