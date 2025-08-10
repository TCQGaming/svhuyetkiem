-- date:13/02/2023
-- by:TCQGaming
-------------------------------------------------------
local tbMainSuKienMuaHe ={};
SpecialEvent.tbMainSuKienMuaHe= tbMainSuKienMuaHe;

function tbMainSuKienMuaHe:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienmuahe\\MainMuaHe.lua");

	local szMsg = "<color=yellow>Sự Kiện Mùa Hè\nMáy Chủ Thần Long<color>";
	local tbOpt = 
	{
		{"<color=yellow>Nấu Chè Đỗ Đen<color>",self.chedoden, self};
		{"<color=yellow>Nếu Chè Thập Cẩm<color>",self.chethapcam, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thường Và Đặc Biệt\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienMuaHe:resetevent()
	local nCount = me.GetTask(9161,12)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9161,1, 0)
	me.SetTask(9161,2, 0)
	me.SetTask(9161,12, nCount + 1);
	me.AddJbCoin(-200*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Chè Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbMainSuKienMuaHe:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2027,4,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2027,5,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Chè Thập Cẩm và 500 Chè Đỗ Đen Mùa Hè Tại NPC Sứ Giả Sự Kiện<color>");
	end
 
function tbMainSuKienMuaHe:chedoden()
	local szMsg = "<color=yellow>Để nấu Chè Đỗ Đen cần: \n<color=yellow>*1 Bình Nước \n*1 Đậu Xanh\n*200 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Nấu Chè Đỗ Đen",self.nauchedoden, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienMuaHe:chethapcam()
	local szMsg = "<color=yellow>Để nấu Chè Thập Cẩm cần: \n<color=yellow>*1 Bình Nước \n*1 Đậu Xanh\n*1 Vạn Đồng Thường<color>";
	local tbOpt = 
	{
			{"Tiến Hành Nấu Chè Thập Cẩm",self.nauchethapcam, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienMuaHe:nauchethapcam()
local nCount = me.GetJbCoin()
local nBinhNuoc = me.GetItemCountInBags(18,1,2027,2) 
local nHatDau = me.GetItemCountInBags(18,1,2027,3) 
local nSoDu = 0
if nBinhNuoc < 1 then
	Dialog:Say("Bạn thiếu Bình Nước rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHatDau < 1 then
	Dialog:Say("Bạn thiếu Gạo Nếp rồi \n hãy mang nó tới đây gặp ta")
return 
end

if nBinhNuoc < nHatDau then
nSoDu = nBinhNuoc
elseif  nHatDau < nBinhNuoc then
nSoDu = nHatDau
end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.nauchethapcam1, self);
end
 
function tbMainSuKienMuaHe:nauchethapcam1(szHoaDacBiet)
local nBinhNuoc = me.GetItemCountInBags(18,1,2027,2) 
local nHatDau = me.GetItemCountInBags(18,1,2027,3) 
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbBinhNuoc	= {18,1,2027,2,0,0}; 
	local tbHatDau	= {18,1,2027,3,0,0}; 
	if (nBinhNuoc < 1*szHoaDacBiet) or (nHatDau < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Chè Thập Cẩm cần tối thiểu "..10000*szHoaDacBiet.." Đồng Thường\nTối thiểu "..1*szHoaDacBiet.." Bình Nước Hạt Đậu\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..SoDong.." Vạn Đồng Thường<color=gold>\n"..nBinhNuoc.." Bình Nước / "..nHatDau.."")
	return  
	end
	me.AddStackItem(18,1,2027,5,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbBinhNuoc, szHoaDacBiet);
		Task:DelItem(me, tbHatDau, szHoaDacBiet);
	end

function tbMainSuKienMuaHe:nauchedoden()
local nCount = me.GetJbCoin()
local nBinhNuoc = me.GetItemCountInBags(18,1,2027,2) 
local nHatDau = me.GetItemCountInBags(18,1,2027,3) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 200
local nGioiHanHoatLuc = 200
if (nTinhLuc < 200) or (nHoatLuc < 200) then 
	Dialog:Say("Để tiến hành nấu Chè Đỗ Đen cần tối thiểu 200 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nBinhNuoc < 1 then
	Dialog:Say("Bạn thiếu Bình Nước rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nHatDau < 1 then
	Dialog:Say("Bạn thiếu Hạt Đậu rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nBinhNuoc < nHatDau then
nSoDu1 = nBinhNuoc
elseif  nHatDau < nBinhNuoc  then
nSoDu1 = nHatDau
end

Dialog:AskNumber("Số lượng đổi", nSoDu1, self.nauchedoden1, self);
end 

 
function tbMainSuKienMuaHe:nauchedoden1(szHoaThuong)
local nBinhNuoc = me.GetItemCountInBags(18,1,2027,2) 
local nHatDau = me.GetItemCountInBags(18,1,2027,3) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbBinhNuoc	= {18,1,2027,2,0,0}; 
	local tbHatDau	= {18,1,2027,3,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nBinhNuoc < 1*szHoaThuong) or (nHatDau < 1*szHoaThuong)  then 
		Dialog:Say("Để tiến hành làm "..szHoaThuong.." Chè Đỗ Đen cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Bình Nước Và 1 Hạt Đậu\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nBinhNuoc.." Bình Nước / "..nHatDau.."")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2027,4,nil,szHoaThuong)
		Task:DelItem(me, tbBinhNuoc, szHoaThuong);
		Task:DelItem(me, tbHatDau, szHoaThuong);
	end

