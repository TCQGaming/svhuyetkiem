-- date:28/12/2023
-- by:TCQGaming
-------------------------------------------------------
local tbThang1 ={};
SpecialEvent.tbThang1= tbThang1;

function tbThang1:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukientetduong_thang1\\MainT1.lua");

	local szMsg = "<color=yellow>Sự Kiện Tết Dương Lịch 2025<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn làm Hộp Quà Tết Dương Thường<color>",self.lamhopquathuong, self};
		{"<color=yellow>Ta muốn làm Hộp Quà Tết Dương Đặc Biệt<color>",self.lamhopquadacbiet, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Tết Dương 2025\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end


function tbThang1:resetevent()
	local nCount = me.GetTask(9178,29)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9178,27, 0)
	me.SetTask(9178,28, 0)
	me.SetTask(9178,29, nCount + 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Tết Dương 2025 thành công Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbThang1:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2034,2,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2034,1,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua Max Event Tết Dương Tại NPC Sứ Giả Sự Kiện<color>");
end
 
function tbThang1:lamhopquathuong()
	local szMsg = "<color=yellow>Để làm Hộp quà thường cần: \n<color=yellow>Dây Buộc Quà Và Giấy Gói Quà\n*200 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành làm Hộp Quà Tết Dương Thường",self.naulamhopquathuong, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang1:lamhopquadacbiet()
	local szMsg = "<color=yellow>Để làm Hộp quà đặc biệt cần: \n<color=yellow>1 Dây Buộc Quà\n1Giấy Gói Quà\n1 Vạn Đồng Thường";
	local tbOpt = 
	{
			{"Tiến Hành làm Hộp Quà Tết Dương Đặc Biệt",self.naulamhopquadacbiet, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang1:naulamhopquadacbiet()
local nCount = me.GetJbCoin()
local nDayBuoc = me.GetItemCountInBags(18,1,2034,5) 
local nGiayGoiQua = me.GetItemCountInBags(18,1,2034,4) 

local nSoDu = 0
if nDayBuoc < 1 then
	Dialog:Say("Bạn thiếu Dây Buộc Quà rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nGiayGoiQua < 1 then
	Dialog:Say("Bạn thiếu Giấy Gói Quà rồi \n hãy mang nó tới đây gặp ta")
return 
end

if nDayBuoc < nGiayGoiQua then
nSoDu = nDayBuoc
elseif  nGiayGoiQua < nDayBuoc  then
nSoDu = nGiayGoiQua
end
if nDayBuoc == nGiayGoiQua then 
nSoDu = nGiayGoiQua
end 
Dialog:AskNumber("Số lượng đổi", nSoDu, self.naulamhopquadacbiet1, self);
end 
 

function tbThang1:naulamhopquadacbiet1(szHoaDacBiet)
local nDayBuoc = me.GetItemCountInBags(18,1,2034,5) 
local nGiayGoiQua = me.GetItemCountInBags(18,1,2034,4) 

local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbNgoiNo	= {18,1,2034,5,0,0}; 
	local tbThuocPhao	= {18,1,2034,4,0,0}; 
	if (nDayBuoc < 1*szHoaDacBiet) or (nGiayGoiQua < 1*szHoaDacBiet)  or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Hộp Quà Tết Dương Đặc Biệt cần Tối thiểu "..1*szHoaDacBiet.." Dây Buộc Quà và Giấy Gói Quà\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nDayBuoc.." Dây Buộc Quà \n"..nGiayGoiQua.." Giấy Gói Quà<color=gold>\n"..SoDong.." Vạn Đồng Thường")
	return  
	end
	me.AddStackItem(18,1,2034,1,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbNgoiNo, szHoaDacBiet);
		Task:DelItem(me, tbThuocPhao, szHoaDacBiet);
end

function tbThang1:naulamhopquathuong()
local nCount = me.GetJbCoin()
local nDayBuoc = me.GetItemCountInBags(18,1,2034,5) 
local nGiayGoiQua = me.GetItemCountInBags(18,1,2034,4) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 200
local nGioiHanHoatLuc = 200
if (nTinhLuc < 200) or (nHoatLuc < 200) then 
	Dialog:Say("Để tiến hành cần tối thiểu 200 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nDayBuoc < 1 then
	Dialog:Say("Bạn thiếu Dây Buộc Quà rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nGiayGoiQua < 1 then
	Dialog:Say("Bạn thiếu Giấy Gói Quà rồi \n hãy mang nó tới đây gặp ta")
return 
end
    local arr = {nDayBuoc, nGiayGoiQua}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có

Dialog:AskNumber("Số lượng đổi", nSoDu1, self.naulamhopquathuong1, self);
end 

 
function tbThang1:naulamhopquathuong1(szHoaThuong)
local nDayBuoc = me.GetItemCountInBags(18,1,2034,5) 
local nGiayGoiQua = me.GetItemCountInBags(18,1,2034,4) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbNgoiNo	= {18,1,2034,5,0,0}; 
	local tbThuocPhao	= {18,1,2034,4,0,0}; 

	if (nTinhLuc < 200*szHoaThuong) or (nHoatLuc < 200*szHoaThuong) or (nDayBuoc < 1*szHoaThuong) or (nGiayGoiQua < 1*szHoaThuong)  then 
		Dialog:Say("Để tiến hành làm "..szHoaThuong.." Hộp Quà Tết Dương thường cần tối thiểu "..200*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Dây Buộc Quà và 1 Giấy Gói Quà\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nDayBuoc.." Dây Buộc Quà\n"..nGiayGoiQua.." Giấy Gói Quà")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*200)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*200)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2034,2,nil,szHoaThuong)
		Task:DelItem(me, tbNgoiNo, szHoaThuong);
		Task:DelItem(me, tbThuocPhao, szHoaThuong);
	end

