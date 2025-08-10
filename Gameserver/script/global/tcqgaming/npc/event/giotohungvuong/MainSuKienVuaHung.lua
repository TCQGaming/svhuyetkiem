-- date:13/02/2023
-- by:TCQGaming
-------------------------------------------------------
local tbMainSuKienVuaHung ={};
SpecialEvent.tbMainSuKienVuaHung= tbMainSuKienVuaHung;

function tbMainSuKienVuaHung:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\giotohungvuong\\MainSuKienVuaHung.lua");

	local szMsg = "<color=yellow>Sự Kiện Vua Hùng\nMáy Chủ Thần Ưng<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ghép Bánh Dày Vua Hùng<color>",self.banhday, self};
		{"<color=yellow>Ghép Bánh Chưng Vua Hùng<color>",self.banhchung, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thường Và Đặc Biệt\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienVuaHung:resetevent()
	local nCount = me.GetTask(9156,63)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9156,43, 0)
	me.SetTask(9156,42, 0)
	me.SetTask(9156,63, nCount + 1);
	me.AddJbCoin(-200*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event bánh chưng và bánh dày Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbMainSuKienVuaHung:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2025,7,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2025,6,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Bánh Dày và 500 Bánh Chưng Event Vua HùngTại NPC Sứ Giả Sự Kiện<color>");
end
 
function tbMainSuKienVuaHung:banhday()
	local szMsg = "<color=yellow>Để ghép Bánh Dày Vua Hùng cần: \n<color=yellow>*1 Bình Nước \n*1 Gạo Nếp\n*1 Lá Dong\n*1 Khuôn Làm Bánh\n*1 Vạn Đồng Thường<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Bánh Dày",self.lambanhday, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienVuaHung:banhchung()
	local szMsg = "<color=yellow>Để ghép Bánh Dày Vua Hùng cần: \n<color=yellow>*1 Bình Nước \n*1 Gạo Nếp\n*1 Lá Dong\n*1 Khuôn Làm Bánh\n*200 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Bánh Chưng",self.lambanhchung, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKienVuaHung:lambanhday()
local nCount = me.GetJbCoin()
local nBinhNuoc = me.GetItemCountInBags(18,1,2025,2) 
local nGaoNep = me.GetItemCountInBags(18,1,2025,3) 
local nLaRong = me.GetItemCountInBags(18,1,2025,4) 
local nKhuon = me.GetItemCountInBags(18,1,2025,5) 
local nSoDu = 0
if nBinhNuoc < 1 then
	Dialog:Say("Bạn thiếu Bình Nước rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nGaoNep < 1 then
	Dialog:Say("Bạn thiếu Gạo Nếp rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nLaRong < 1 then
	Dialog:Say("Bạn thiếu Gạo Nếp rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nKhuon < 1 then
	Dialog:Say("Bạn thiếu Gạo Nếp rồi \n hãy mang nó tới đây gặp ta")
return 
end

    local nSoDu = math.min(nBinhNuoc, nGaoNep,nLaRong,nKhuon)

    if nSoDu < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu rồi")
        return
    end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.lambanhday1, self);
end 
 
function tbMainSuKienVuaHung:lambanhday1(szHoaDacBiet)
local nBinhNuoc = me.GetItemCountInBags(18,1,2025,2) 
local nGaoNep = me.GetItemCountInBags(18,1,2025,3) 
local nLaRong = me.GetItemCountInBags(18,1,2025,4) 
local nKhuon = me.GetItemCountInBags(18,1,2025,5) 
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbBinhNuoc	= {18,1,2025,2,0,0}; 
	local tbGaoNep	= {18,1,2025,3,0,0}; 
	local tbLaRong	= {18,1,2025,4,0,0}; 
	local tbKhuon	= {18,1,2025,5,0,0}; 
	if (nBinhNuoc < 1*szHoaDacBiet) or (nLaRong < 1*szHoaDacBiet) or (nGaoNep < 1*szHoaDacBiet) or (nKhuon < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Bánh Dày cần tối thiểu "..10000*szHoaDacBiet.." Đồng Thường\nTối thiểu "..1*szHoaDacBiet.." Bình Nước Gạo Nếp Lá Dong Và Khuôn\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..SoDong.." Vạn Đồng Thường<color=gold>\n"..nBinhNuoc.." Bình Nước / "..nGaoNep.." Gạo Nếp / "..nLaRong.." Lá Rong / "..nKhuon.." Khuôn Bánh")
	return  
	end
	me.AddStackItem(18,1,2025,6,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbBinhNuoc, szHoaDacBiet);
		Task:DelItem(me, tbGaoNep, szHoaDacBiet);
		Task:DelItem(me, tbLaRong, szHoaDacBiet);
		Task:DelItem(me, tbKhuon, szHoaDacBiet);
	end

function tbMainSuKienVuaHung:lambanhchung()
local nCount = me.GetJbCoin()
local nBinhNuoc = me.GetItemCountInBags(18,1,2025,2) 
local nGaoNep = me.GetItemCountInBags(18,1,2025,3) 
local nLaRong = me.GetItemCountInBags(18,1,2025,4) 
local nKhuon = me.GetItemCountInBags(18,1,2025,5) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành làm bó hoa thường cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
if nBinhNuoc < 1 then
	Dialog:Say("Bạn thiếu Bình Nước rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nGaoNep < 1 then
	Dialog:Say("Bạn thiếu Gạo Nếp rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nLaRong < 1 then
	Dialog:Say("Bạn thiếu Lá Rong rồi \n hãy mang nó tới đây gặp ta")
return 
end
if nKhuon < 1 then
	Dialog:Say("Bạn thiếu Khuôn Làm Bánh 1 rồi \n hãy mang nó tới đây gặp ta")
return 
end
    local nSoDu = math.min(nBinhNuoc, nGaoNep,nLaRong,nKhuon)

    if nSoDu < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu rồi")
        return
    end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.lambanhchung1, self);
end 

 
function tbMainSuKienVuaHung:lambanhchung1(szHoaThuong)
local nBinhNuoc = me.GetItemCountInBags(18,1,2025,2) 
local nGaoNep = me.GetItemCountInBags(18,1,2025,3) 
local nLaRong = me.GetItemCountInBags(18,1,2025,4) 
local nKhuon = me.GetItemCountInBags(18,1,2025,5) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbBinhNuoc	= {18,1,2025,2,0,0}; 
	local tbGaoNep	= {18,1,2025,3,0,0}; 
	local tbLaRong	= {18,1,2025,4,0,0}; 
	local tbKhuon	= {18,1,2025,5,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nBinhNuoc < 1*szHoaThuong) or (nGaoNep < 1*szHoaThuong) or (nLaRong < 1*szHoaThuong) or (nKhuon < 1*szHoaThuong) then 
		Dialog:Say("Để tiến hành làm "..szHoaThuong.." Bánh Chưng cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Bình Nước Gạo Nếp Lá Dong Và Khuôn\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nBinhNuoc.." Bình Nước / "..nGaoNep.." Gạo Nếp / "..nLaRong.." Lá Rong / "..nKhuon.." Khuôn Bánh")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2025,7,nil,szHoaThuong)
		Task:DelItem(me, tbBinhNuoc, szHoaThuong);
		Task:DelItem(me, tbGaoNep, szHoaThuong);
		Task:DelItem(me, tbLaRong, szHoaThuong);
		Task:DelItem(me, tbKhuon, szHoaThuong);
	end

