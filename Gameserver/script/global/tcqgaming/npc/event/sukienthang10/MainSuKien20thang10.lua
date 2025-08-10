-- date:13/02/2031
-- by:TCQGaming
-------------------------------------------------------
local tbMainSuKien2010 ={};
SpecialEvent.tbMainSuKien2010= tbMainSuKien2010;

function tbMainSuKien2010:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang10\\MainSuKien20thang10.lua");

	local szMsg = "<color=yellow>Sự Kiện Kỷ Niệm Ngày Phụ Nữ Việt Nam 20 Tháng 10\nMáy Chủ Thần Tài<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ghép Bó Hồng Đặc Biệt<color>",self.bohongdacbiet, self};
		{"<color=yellow>Ghép Bó Hồng Thường<color>",self.bohongthuong, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thường Và Đặc Biệt\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbMainSuKien2010:resetevent()
	local nCount = me.GetTask(9170,71)
	if nCount >  0 then
		Dialog:Say(string.format("Bạn đã làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9170,58, 0)
	me.SetTask(9170,59, 0)
	me.SetTask(9170,71, 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Kỷ Niệm Ngày Phụ Nữ Việt Nam thành công Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbMainSuKien2010:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2031,6,nil,1000)-------Event đặc biệt
	me.AddStackItem(18,1,2031,7,nil,500)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Bó Hoa Đặc Biệt và 500 Bó Hoa Thường Event 20/10 Tại NPC Sứ Giả Sự Kiện<color>");
	end

function tbMainSuKien2010:bohongdacbiet()
	local szMsg = "<color=yellow>Để ghép bó hồng đặc biệt cần: \n<color=yellow>*1 Hoa Hồng Đỏ \n*1 Hoa Hồng Trắng\n*1 Vạn Đồng Thường<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Hoa",self.lamhoadacbiet, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien2010:bohongthuong()
	local szMsg = "<color=yellow>Để ghép bó hồng thường cần: \n<color=yellow>*1 Hoa Hồng Xanh \n*1 Hoa Hồng Vàng\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Hoa",self.lamhoathuong, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien2010:lamhoadacbiet()
local nCount = me.GetJbCoin()
local nHoaDo = me.GetItemCountInBags(18,1,2031,2) -- Hoa hồng đỏ
local nHoaTrang = me.GetItemCountInBags(18,1,2031,3) -- hồng trắng
local nSoDu = 0
if nHoaDo < 1 then
	Dialog:Say("Bạn thiếu Hoa Hồng Đỏ rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHoaTrang < 1 then
	Dialog:Say("Bạn thiếu Hoa Hồng Trắng rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHoaDo < nHoaTrang then
nSoDu = nHoaDo
else 
nSoDu = nHoaTrang
end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.lamhoadacbiet1, self);
end
 
function tbMainSuKien2010:lamhoadacbiet1(szHoaDacBiet)
local nHoaDo = me.GetItemCountInBags(18,1,2031,2) -- Hoa hồng đỏ
local nHoaTrang = me.GetItemCountInBags(18,1,2031,3) -- hồng trắng
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbGiftId1	= {18,1,2031,2,0,0}; 
	local tbGiftId2	= {18,1,2031,3,0,0}; 
	if (nHoaDo < 1*szHoaDacBiet) or (nHoaTrang < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Bó Hoa Đặc Biệt cần tối thiểu "..10000*szHoaDacBiet.." Đồng Thường\nTối thiểu "..1*szHoaDacBiet.." Hoa Đỏ và Hoa Trắng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..SoDong.." Vạn Đồng Thường<color=gold>\n"..nHoaDo.." Hoa Đỏ / "..nHoaTrang.." Hoa Trắng")
	return  
	end
	me.AddStackItem(18,1,2031,6,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
	Task:DelItem(me, tbGiftId1, szHoaDacBiet);
		Task:DelItem(me, tbGiftId2, szHoaDacBiet);
	end

function tbMainSuKien2010:lamhoathuong()
local nCount = me.GetJbCoin()
local nHoaVang = me.GetItemCountInBags(18,1,2031,5) -- Hoa hồng đỏ
local nHoaXanh = me.GetItemCountInBags(18,1,2031,4) -- hồng trắng
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành làm bó hoa thường cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nHoaVang < 1 then
	Dialog:Say("Bạn thiếu Hoa Hồng Xanh rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHoaXanh < 1 then
	Dialog:Say("Bạn thiếu Hoa Hồng Vàng rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHoaVang < nHoaXanh then
nSoDu1 = nHoaVang
else
nSoDu1 = nHoaXanh
end
Dialog:AskNumber("Số lượng đổi", nSoDu1, self.lamhoathuong1, self);
end 

 
function tbMainSuKien2010:lamhoathuong1(szHoaThuong)
local nHoaXanh = me.GetItemCountInBags(18,1,2031,4) -- Hoa hồng đỏ
local nHoaVang = me.GetItemCountInBags(18,1,2031,5) -- hồng trắng
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;

	local tbGiftId1	= {18,1,2031,4,0,0};
	local tbGiftId2	= {18,1,2031,5,0,0}; 
	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nHoaXanh < 1*szHoaThuong) or (nHoaVang < 1*szHoaThuong) then 
	Dialog:Say("Để tiến hành làm "..szHoaThuong.." bó hoa thường cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\ntối thiểu "..1*szHoaThuong.." Hoa Xanh và Hoa Vàng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nHoaXanh.." Hoa Xanh / "..nHoaVang.." Hoa Vàng")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2031,7,nil,szHoaThuong)
	Task:DelItem(me, tbGiftId1, szHoaThuong);
	Task:DelItem(me, tbGiftId2, szHoaThuong);
	end
