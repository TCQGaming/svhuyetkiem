-- date:30/07/2023
-- by:TCQGaming
-------------------------------------------------------
local tbThang9 ={};
SpecialEvent.tbThang9= tbThang9;

function tbThang9:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang9\\MainT9.lua");

	local szMsg = "<color=yellow>Sự Kiện Tháng 9 \nMáy Chủ Thần Ma<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn chế tạo Pháo Tiểu Quốc Khánh<color>",self.chetaophaotieu, self};
		{"<color=yellow>Ta muốn chế tạo Pháo Đại Quốc Khánh<color>",self.chetaophaodai, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Tháng 9\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end


function tbThang9:resetevent()
	local nCount = me.GetTask(9170,32)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9170,34, 0)
	me.SetTask(9170,33, 0)
	me.SetTask(9170,32, nCount + 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Lễ Quốc Khánh Mùng 2 Tháng 9 thành công Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbThang9:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2030,12,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2030,11,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua Max Event Tại NPC Sứ Giả Sự Kiện<color>");
end
 
function tbThang9:chetaophaotieu()
	local szMsg = "<color=yellow>Để Chế Tạo Pháo Tiểu cần: \n<color=yellow>Ngòi Nổ Và Thuốc Pháo\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Chế Tạo Pháo Tiểu",self.nauchetaophaotieu, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang9:chetaophaodai()
	local szMsg = "<color=yellow>Để Chế tạo Pháo Đại cần: \n<color=yellow>1 Ngòi Nổ\n1Thuốc Pháo\n1 Vạn Đồng Thường";
	local tbOpt = 
	{
			{"Tiến Hành Chế Tạo Pháo Đại Quốc Khánh",self.nauchetaophaodai, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang9:nauchetaophaodai()
local nCount = me.GetJbCoin()
local nNgoiNo = me.GetItemCountInBags(18,1,2030,15) 
local nThuocPhao = me.GetItemCountInBags(18,1,2030,14) 

local nSoDu = 0
if nNgoiNo < 1 then
	Dialog:Say("Bạn thiếu Ngòi Nổ rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nThuocPhao < 1 then
	Dialog:Say("Bạn thiếu Thuốc Pháo rồi \n hãy mang nó tới đây gặp ta")
return 
end

if nNgoiNo < nThuocPhao then
nSoDu = nNgoiNo
elseif  nThuocPhao < nNgoiNo  then
nSoDu = nThuocPhao
end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.nauchetaophaodai1, self);
end 
 

function tbThang9:nauchetaophaodai1(szHoaDacBiet)
local nNgoiNo = me.GetItemCountInBags(18,1,2030,15) 
local nThuocPhao = me.GetItemCountInBags(18,1,2030,14) 

local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbNgoiNo	= {18,1,2030,15,0,0}; 
	local tbThuocPhao	= {18,1,2030,14,0,0}; 
	if (nNgoiNo < 1*szHoaDacBiet) or (nThuocPhao < 1*szHoaDacBiet)  or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành ghi chép "..szHoaDacBiet.." Tiến Quân Ca cần Tối thiểu "..1*szHoaDacBiet.." Ngòi Nổ và Thuốc Pháo\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nNgoiNo.." Ngòi Nổ \n"..nThuocPhao.." Thuốc Pháo<color=gold>\n"..SoDong.." Vạn Đồng Thường")
	return  
	end
	me.AddStackItem(18,1,2030,11,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbNgoiNo, szHoaDacBiet);
		Task:DelItem(me, tbThuocPhao, szHoaDacBiet);
end

function tbThang9:nauchetaophaotieu()
local nCount = me.GetJbCoin()
local nNgoiNo = me.GetItemCountInBags(18,1,2030,15) 
local nThuocPhao = me.GetItemCountInBags(18,1,2030,14) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nNgoiNo < 1 then
	Dialog:Say("Bạn thiếu Ngòi Nổ rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nThuocPhao < 1 then
	Dialog:Say("Bạn thiếu Thuốc Pháo rồi \n hãy mang nó tới đây gặp ta")
return 
end

if nNgoiNo < nThuocPhao then
nSoDu1 = nNgoiNo
elseif  nThuocPhao < nNgoiNo  then
nSoDu1 = nThuocPhao
end
Dialog:AskNumber("Số lượng đổi", nSoDu1, self.nauchetaophaotieu1, self);
end 

 
function tbThang9:nauchetaophaotieu1(szHoaThuong)
local nNgoiNo = me.GetItemCountInBags(18,1,2030,15) 
local nThuocPhao = me.GetItemCountInBags(18,1,2030,14) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbNgoiNo	= {18,1,2030,15,0,0}; 
	local tbThuocPhao	= {18,1,2030,14,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nNgoiNo < 1*szHoaThuong) or (nThuocPhao < 1*szHoaThuong)  then 
		Dialog:Say("Để tiến hành chế tạo "..szHoaThuong.." Pháo Tiểu cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Ngòi Nổ và 1 Thuốc Pháo\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nNgoiNo.." Ngòi Nổ\n"..nThuocPhao.." Thuốc Pháo")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2030,12,nil,szHoaThuong)
		Task:DelItem(me, tbNgoiNo, szHoaThuong);
		Task:DelItem(me, tbThuocPhao, szHoaThuong);
	end

