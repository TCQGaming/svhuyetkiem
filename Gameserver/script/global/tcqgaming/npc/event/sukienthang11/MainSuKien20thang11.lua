-- date:13/02/2031
-- by:TCQGaming
-------------------------------------------------------
local tbMainSuKien2011 ={};
SpecialEvent.tbMainSuKien2011= tbMainSuKien2011;

function tbMainSuKien2011:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang11\\MainSuKien20thang11.lua");

	local szMsg = "<color=yellow>Sự Kiện Kỷ Niệm Ngày Nhà Giáo Việt Nam 20 Tháng 11\nMáy Chủ Thần Tài<color>";
	local tbOpt = 
	{
		{"<color=yellow>Viết Sách Lịch Sử<color>",self.sachlichsu, self};
		{"<color=yellow>Viết Sách Địa Lý<color>",self.sachdialy, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thường Và Đặc Biệt\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbMainSuKien2011:resetevent()
	local nCount = me.GetTask(9170,85)
	if nCount >  0 then
		Dialog:Say(string.format("Bạn đã làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9170,83, 0)
	me.SetTask(9170,84, 0)
	me.SetTask(9170,85, 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Kỷ Niệm Ngày Nhà Giáo Việt Nam thành công Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbMainSuKien2011:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2033,5,nil,1000)-------Event đặc biệt
	me.AddStackItem(18,1,2033,6,nil,500)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Sách Lịch Sử và 500 Sách Địa Lý Event 20/11 Tại NPC Sứ Giả Sự Kiện<color>");
	end

function tbMainSuKien2011:sachlichsu()
	local szMsg = "<color=yellow>Để hoàn tất cuốn Sách Lịch Sử cần: \n<color=yellow>*1 Bút Lông Đặc Biệt \n*1 Quyển Tập\n*1 Vạn Đồng Thường<color>";
	local tbOpt = 
	{
			{"Tiến Hành",self.lamsachlichsu, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien2011:sachdialy()
	local szMsg = "<color=yellow>Để Viết Sách Địa Lý cần: \n<color=yellow>*1 Quyển Tập \n*1 Bút Lông Thường\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Hoa",self.lamhoathuong, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien2011:lamsachlichsu()
local nCount = me.GetJbCoin()
local nButLong = me.GetItemCountInBags(18,1,2033,2) -- Bút Lông Đặc Biệt
local nQuyenTap = me.GetItemCountInBags(18,1,2033,4) -- Quyển tập
local nSoDu = 0
if nButLong < 1 then
	Dialog:Say("Bạn thiếu Bút Lông Đặc Biệt rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nQuyenTap < 1 then
	Dialog:Say("Bạn thiếu Quyển Tập rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nButLong < nQuyenTap then
nSoDu = nButLong
else 
nSoDu = nQuyenTap
end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.lamsachlichsu1, self);
end
 
function tbMainSuKien2011:lamsachlichsu1(szHoaDacBiet)
local nButLong = me.GetItemCountInBags(18,1,2033,2) -- Bút Lông Đặc Biệt
local nQuyenTap = me.GetItemCountInBags(18,1,2033,4) 
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbGiftId1	= {18,1,2033,2,0,0}; 
	local tbGiftId2	= {18,1,2033,4,0,0}; 
	if (nButLong < 1*szHoaDacBiet) or (nQuyenTap < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Sách Lịch Sử cần tối thiểu "..10000*szHoaDacBiet.." Đồng Thường\nTối thiểu "..1*szHoaDacBiet.." Bút Lông Đặc Biệt và Quyển Tập\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..SoDong.." Vạn Đồng Thường<color=gold>\n"..nButLong.." Bút Lông Đặc Biệt / "..nQuyenTap.." Quyển Tập")
	return  
	end
	me.AddStackItem(18,1,2033,5,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
	Task:DelItem(me, tbGiftId1, szHoaDacBiet);
		Task:DelItem(me, tbGiftId2, szHoaDacBiet);
	end

function tbMainSuKien2011:lamhoathuong()
local nCount = me.GetJbCoin()
local nButLong = me.GetItemCountInBags(18,1,2033,3) -- Bút Lông Thường
local nQuyenTap = me.GetItemCountInBags(18,1,2033,4) -- Quyển Tập
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành Viết Cuốn Sách Địa Lý cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nButLong < 1 then
	Dialog:Say("Bạn thiếu Bút Lông Thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nQuyenTap < 1 then
	Dialog:Say("Bạn thiếu Quyển Tập rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nButLong < nQuyenTap then
nSoDu1 = nButLong
else
nSoDu1 = nQuyenTap
end
Dialog:AskNumber("Số lượng đổi", nSoDu1, self.lamhoathuong1, self);
end 

 
function tbMainSuKien2011:lamhoathuong1(szHoaThuong)
local nQuyenTap = me.GetItemCountInBags(18,1,2033,3) -- Bút Lông Đặc Biệt
local nButLong = me.GetItemCountInBags(18,1,2033,4) -- hồng trắng
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;

	local tbGiftId1	= {18,1,2033,3,0,0};
	local tbGiftId2	= {18,1,2033,4,0,0}; 
	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nQuyenTap < 1*szHoaThuong) or (nButLong < 1*szHoaThuong) then 
	Dialog:Say("Để tiến hành viết "..szHoaThuong.." Sách Địa Lý cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\ntối thiểu "..1*szHoaThuong.." Bút Lông Thường Và Quyển Tập\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nQuyenTap.." Quyển Tập / "..nButLong.." Bút Lông Thường")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2033,6,nil,szHoaThuong)
	Task:DelItem(me, tbGiftId1, szHoaThuong);
	Task:DelItem(me, tbGiftId2, szHoaThuong);
	end
