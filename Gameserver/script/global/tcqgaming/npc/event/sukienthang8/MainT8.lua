-- date:30/07/2023
-- by:TCQGaming
-------------------------------------------------------
local tbThang8 ={};
SpecialEvent.tbThang8= tbThang8;

function tbThang8:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 8<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn chép bài ca Mười Chín Tháng 8<color>",self.ghimuoichinthang8, self};
		{"<color=yellow>Ta muốn chép bài ca Tiến Quân Ca<color>",self.ghitienquanca, self};
		-- {"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		-- {"<color=yellow>Mua Full Event Tháng 8\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end


function tbThang8:resetevent()
	local nCount = me.GetTask(9170,99)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9170,1, 0)
	me.SetTask(9170,2, 0)
	me.SetTask(9170,99, nCount + 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event kỷ niệm ngày cách mạng tháng 8 thành công Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbThang8:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2030,3,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2030,4,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua Max Event Tại NPC Sứ Giả Sự Kiện<color>");
end
 
function tbThang8:ghimuoichinthang8()
	local szMsg = "<color=yellow>Để ghi bài ca Mười Chín Tháng Tám cần: \n<color=yellow>Bút Lông Và Quyển Tập\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành chép bài ca Mười Chín Tháng Tám",self.naughimuoichinthang8, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang8:ghitienquanca()
	local szMsg = "<color=yellow>Để ghi bài ca Tiến Quân Ca cần: \n<color=yellow>1 Bút Lông\n1Quyển Tập\n1 Vạn Đồng Thường";
	local tbOpt = 
	{
			{"Tiến Hành chép bài ca Tiến Quân Ca",self.naughitienquanca, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThang8:naughitienquanca()
local nCount = me.GetJbCoin()
local nButLong = me.GetItemCountInBags(18,1,2030,1) 
local nQuyenTap = me.GetItemCountInBags(18,1,2030,2) 

local nSoDu = 0
if nButLong < 1 then
	Dialog:Say("Bạn thiếu Bút Lông rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nQuyenTap < 1 then
	Dialog:Say("Bạn thiếu Quyển Tập rồi \n hãy mang nó tới đây gặp ta")
return 
end

    local arr = {nQuyenTap, nButLong}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu1, self.naughitienquanca1, self)
end 
 

function tbThang8:naughitienquanca1(szHoaDacBiet)
local nButLong = me.GetItemCountInBags(18,1,2030,1) 
local nQuyenTap = me.GetItemCountInBags(18,1,2030,2) 

local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbButLong	= {18,1,2030,1,0,0}; 
	local tbQuyenTap	= {18,1,2030,2,0,0}; 
	if (nButLong < 1*szHoaDacBiet) or (nQuyenTap < 1*szHoaDacBiet)  or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành ghi chép "..szHoaDacBiet.." Tiến Quân Ca cần Tối thiểu "..1*szHoaDacBiet.." Bút Lông và Quyển Tập\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nButLong.." Bút Lông \n"..nQuyenTap.." Quyển Tập<color=gold>\n"..SoDong.." Vạn Đồng Thường")
	return  
	end
	me.AddStackItem(18,1,2030,4,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbButLong, szHoaDacBiet);
		Task:DelItem(me, tbQuyenTap, szHoaDacBiet);
end

function tbThang8:naughimuoichinthang8()
local nCount = me.GetJbCoin()
local nButLong = me.GetItemCountInBags(18,1,2030,1) 
local nQuyenTap = me.GetItemCountInBags(18,1,2030,2) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nButLong < 1 then
	Dialog:Say("Bạn thiếu Bút Lông rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nQuyenTap < 1 then
	Dialog:Say("Bạn thiếu Quyển Tập rồi \n hãy mang nó tới đây gặp ta")
return 
end

    local arr = {nQuyenTap, nButLong}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu1, self.naughimuoichinthang81, self)
end 

 
function tbThang8:naughimuoichinthang81(szHoaThuong)
local nButLong = me.GetItemCountInBags(18,1,2030,1) 
local nQuyenTap = me.GetItemCountInBags(18,1,2030,2) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbButLong	= {18,1,2030,1,0,0}; 
	local tbQuyenTap	= {18,1,2030,2,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nButLong < 1*szHoaThuong) or (nQuyenTap < 1*szHoaThuong)  then 
		Dialog:Say("Để tiến hành ghi chép "..szHoaThuong.." bài ca Mười Chín Tháng Tám cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Bút Lông và 1 Quyển Tập\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nButLong.." Bút Lông\n"..nQuyenTap.." Quyển Tập")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2030,3,nil,szHoaThuong)
		Task:DelItem(me, tbButLong, szHoaThuong);
		Task:DelItem(me, tbQuyenTap, szHoaThuong);
	end

