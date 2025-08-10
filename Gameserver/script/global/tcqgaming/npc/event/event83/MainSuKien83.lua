-- date:08/03/2024
-- by:TCQGaming
-------------------------------------------------------
local tbMainSuKien83 ={};
SpecialEvent.tbMainSuKien83= tbMainSuKien83;

function tbMainSuKien83:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\event83\\MainSuKien83.lua");

	local szMsg = "<color=yellow>Sự Kiện Mùng 8 Tháng 3 Quốc Tế Phụ Nữ\nMáy Chủ Đại Mộc Kiếm<color>";
	local tbOpt = 
	{
		 {"<color=yellow>Ghép Bó Hồng Đặc Biệt<color>",self.bohongdacbiet, self};
		 {"<color=yellow>Ghép Bó Hồng Thường<color>",self.bohongthuong, self};
		 {"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thường Và Đặc Biệt\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		-- {"<color=yellow>Nhận lại 1000 Tiền Du Long khi sử dụng max Bó Hồng Đặc Biệt<color>",self.nhanlaitienmoc1000, self};

		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien83:nhanlaitienmoc1000()
	local nCount = me.GetTask(9178,156)
	local SoLuongSuDung = me.GetTask(9178,153)
if SoLuongSuDung > 999 then 
	if nCount == 0 then 
	me.SetTask(9178,156,1)
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)---Tiền Du Long
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận lại 1000 tiền du long tại Sự Kiện Sử Dụng Max Bó Hồng Đặc Biệt<color>");
	else 
	Dialog:Say("Bạn đã nhận lại rồi mà")
	end 
else 
	Dialog:Say("Bạn chưa sử dụng 1000 Bó Hồng Đặc Biệt rồi")
end 

end 
function tbMainSuKien83:resetevent()
	local nCount = me.GetTask(9178,155)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9178,153, 0)--Event thường 
	me.SetTask(9178,154, 0)--Event đặc biệt
	me.SetTask(9178,155, nCount + 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event mùng 8 tháng 3 tại Sứ Giả Sự Kiện<color>");
	end
	
function tbMainSuKien83:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2023,7,nil,1000)-------Event đặc biệt
	me.AddStackItem(18,1,2023,8,nil,500)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Bó Hoa Đặc Biệt và 500 Bó Hoa Thường Event 8/3 Tại NPC Sứ Giả Sự Kiện<color>");
	end

function tbMainSuKien83:bohongdacbiet()
	local szMsg = "<color=yellow>Để ghép bó hồng đặc biệt cần: \n<color=yellow>*1 Hoa Hồng Đỏ \n*1 Hoa Hồng Trắng\n*1 Vạn Đồng Thường<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Hoa",self.lamhoadacbiet, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien83:bohongthuong()
	local szMsg = "<color=yellow>Để ghép bó hồng thường cần: \n<color=yellow>*1 Hoa Hồng Xanh \n*1 Hoa Hồng Vàng\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành Làm Hoa",self.lamhoathuong, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbMainSuKien83:lamhoadacbiet()
local nCount = me.GetJbCoin()
local nHoaDo = me.GetItemCountInBags(18,1,2023,3) -- Hoa hồng đỏ
local nHoaTrang = me.GetItemCountInBags(18,1,2023,4) -- hồng trắng
local nSoDu = 0
    local nHoaDo = me.GetItemCountInBags(18, 1, 2023, 3) 
    local nHoaTrang = me.GetItemCountInBags(18, 1, 2023, 4) 

    local nSoDu = math.min(nHoaDo, nHoaTrang)

    if nSoDu < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu để làm Bó Hoa Đặc Biệt rồi xin hãy kiểm tra lại")
        return
    end
Dialog:AskNumber("Số lượng đổi", nSoDu, self.lamhoadacbiet1, self);
end 
 
function tbMainSuKien83:lamhoadacbiet1(szHoaDacBiet)
local nHoaDo = me.GetItemCountInBags(18,1,2023,3) -- Hoa hồng đỏ
local nHoaTrang = me.GetItemCountInBags(18,1,2023,4) -- hồng trắng
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbGiftId1	= {18,1,2023,3,0,0}; 
	local tbGiftId2	= {18,1,2023,4,0,0}; 
	if (nHoaDo < 1*szHoaDacBiet) or (nHoaTrang < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Bó Hoa Đặc Biệt cần tối thiểu "..10000*szHoaDacBiet.." Đồng Thường\nTối thiểu "..1*szHoaDacBiet.." Hoa Đỏ và Hoa Trắng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..SoDong.." Vạn Đồng Thường<color=gold>\n"..nHoaDo.." Hoa Đỏ / "..nHoaTrang.." Hoa Trắng")
	return  
	end
	me.AddStackItem(18,1,2023,7,nil,szHoaDacBiet)
	me.AddJbCoin(-1*(szHoaDacBiet*10000))
	Task:DelItem(me, tbGiftId1, szHoaDacBiet);
	Task:DelItem(me, tbGiftId2, szHoaDacBiet);
end

function tbMainSuKien83:lamhoathuong()
local nCount = me.GetJbCoin()
local nHoaVang = me.GetItemCountInBags(18,1,2023,5) -- Hoa hồng đỏ
local nHoaXanh = me.GetItemCountInBags(18,1,2023,6) -- hồng trắng
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành làm bó hoa thường cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end

local nSoDu1 = 0
    local nHoaVang = me.GetItemCountInBags(18, 1, 2023, 5) 
    local nHoaXanh = me.GetItemCountInBags(18, 1, 2023, 6) 

    local nSoDu1 = math.min(nHoaVang, nHoaXanh)

    if nSoDu1 < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu để làm Bó Hoa Thường rồi xin hãy kiểm tra lại")
        return
    end
Dialog:AskNumber("Số lượng đổi", nSoDu1, self.lamhoathuong1, self);
end 

 
function tbMainSuKien83:lamhoathuong1(szHoaThuong)
local nHoaXanh = me.GetItemCountInBags(18,1,2023,5) -- Hoa hồng đỏ
local nHoaVang = me.GetItemCountInBags(18,1,2023,6) -- hồng trắng
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;

	local tbGiftId1	= {18,1,2023,5,0,0};
	local tbGiftId2	= {18,1,2023,6,0,0}; 
	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nHoaXanh < 1*szHoaThuong) or (nHoaVang < 1*szHoaThuong) then 
	Dialog:Say("Để tiến hành làm "..szHoaThuong.." bó hoa thường cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\ntối thiểu "..1*szHoaThuong.." Hoa Xanh và Hoa Vàng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nHoaXanh.." Hoa Xanh / "..nHoaVang.." Hoa Vàng")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2023,8,nil,szHoaThuong)
	Task:DelItem(me, tbGiftId1, szHoaThuong);
	Task:DelItem(me, tbGiftId2, szHoaThuong);
	end
