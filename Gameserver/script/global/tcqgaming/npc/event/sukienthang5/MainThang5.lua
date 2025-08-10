-- date:13/02/2023
-- by:TCQGaming
-------------------------------------------------------
local tbSuKienThanHoaT7 ={};
SpecialEvent.tbSuKienThanHoaT7= tbSuKienThanHoaT7;

function tbSuKienThanHoaT7:OnDialog()

	local szMsg = "<color=yellow>Sự Kiện Tháng 5 \nMáy Chủ Thần Hổ<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn chế tạo đá Thiên Hỏa<color>",self.chetaothienhoa, self};
		{"<color=yellow>Ta muốn chế tạo đá Thần Hỏa<color>",self.chetaothanhoa, self};
		{"<color=yellow>Ta muốn mua Nguyên Tố Bảo Thạch<color>\n<color=green>(1 Vạn Đồng/1)",self.muanguyento, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event Thiên Hỏa Và Thần Hỏa\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKienThanHoaT7:resetevent()
	local nCount = me.GetTask(9186,10)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9186,11, 0)
	me.SetTask(9186,12, 0)
	me.SetTask(9186,10, nCount + 1);
	me.AddJbCoin(-200*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Thần Hỏa Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbSuKienThanHoaT7:muanguyento()
local nDong = me.GetJbCoin()
if nDong < 1*10000 then 
	Dialog:Say("Hành trang bạn không có nổi 1 vạn đồng ư ?")
return 
end
local nSoDu = 0
nSoDu = nDong/10000
Dialog:AskNumber("Số lượng đổi", nSoDu, self.muanguyento1, self);
end 
function tbSuKienThanHoaT7:muanguyento1(nMuaNguyenTo)
local nDong = me.GetJbCoin()
	if (nDong < 10000*nMuaNguyenTo) then
	Dialog:Say("Thiếu đồng rồi bạn ơi")
	return  
	end
	me.AddStackItem(18,1,2028,18,nil,nMuaNguyenTo)
	me.AddJbCoin(-1*(nMuaNguyenTo*10000))
end
	
function tbSuKienThanHoaT7:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2028,24,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2028,25,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Thần Hỏa và 500 Thiên Hỏa Tháng 5 Tại NPC Sứ Giả Sự Kiện<color>");
	end
 
function tbSuKienThanHoaT7:chetaothienhoa()
	local szMsg = "<color=yellow>Để chế đá Thiên Hỏa cần: \n<color=yellow>5 loại đá ngũ hành\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành chế tạo đá Thiên Hỏa",self.nauchetaothienhoa, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKienThanHoaT7:chetaothanhoa()
	local szMsg = "<color=yellow>Để nấu Thần Hỏa cần: \n<color=yellow>5 loại Đá Ngũ Hành\n1 Nguyên Tố Bảo Thạch<color>\nđể làm vật dẫn thiên nhóm lên ngọn lửa thần hỏa";
	local tbOpt = 
	{
			{"Tiến Hành chế tạo đá Thần Hỏa",self.nauchetaothanhoa, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKienThanHoaT7:nauchetaothanhoa()
    local nCount = me.GetJbCoin()
    local nKimHe = me.GetItemCountInBags(18, 1, 2028, 19) 
    local nMocHe = me.GetItemCountInBags(18, 1, 2028, 20) 
    local nThuyHe = me.GetItemCountInBags(18, 1, 2028, 21) 
    local nHoaHe = me.GetItemCountInBags(18, 1, 2028, 22) 
    local nThoHe = me.GetItemCountInBags(18, 1, 2028, 23) 
    local nNguyenToBaoThach = me.GetItemCountInBags(18, 1, 2028, 18) 
    local nSoDu = 0

    if nKimHe < 1 or nMocHe < 1 or nThuyHe < 1 or nHoaHe < 1 or nThoHe < 1 or nNguyenToBaoThach < 1 then
        Dialog:Say("Bạn thiếu một số loại Bảo Thạch, hãy kiểm tra và mang đủ số lượng đến đây")
        return 
    end

    local arr = {nKimHe, nMocHe, nThuyHe, nHoaHe, nThoHe, nNguyenToBaoThach}
    table.sort(arr)
    nSoDu = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu, self.nauchetaothanhoa1, self)
end 

 
function tbSuKienThanHoaT7:nauchetaothanhoa1(szHoaDacBiet)
local nKimHe = me.GetItemCountInBags(18,1,2028,19) 
local nMocHe = me.GetItemCountInBags(18,1,2028,20) 
local nThuyHe = me.GetItemCountInBags(18,1,2028,21) 
local nHoaHe = me.GetItemCountInBags(18,1,2028,22) 
local nThoHe = me.GetItemCountInBags(18,1,2028,23) 
local nNguyenToBaoThach = me.GetItemCountInBags(18,1,2028,18) 
	local tbKimHe	= {18,1,2028,19,0,0}; 
	local tbMocHe	= {18,1,2028,20,0,0}; 
	local tbThuyHe	= {18,1,2028,21,0,0}; 
	local tbHoaHe	= {18,1,2028,22,0,0}; 
	local tbThoHe	= {18,1,2028,23,0,0}; 
	local tbNguyenTo	= {18,1,2028,18,0,0}; 
	
	if (nKimHe < 1*szHoaDacBiet) or (nMocHe < 1*szHoaDacBiet) or (nThuyHe < 1*szHoaDacBiet) or (nHoaHe < 1*szHoaDacBiet) or (nThoHe < 1*szHoaDacBiet) or (nNguyenToBaoThach < 1*szHoaDacBiet) then
	Dialog:Say("Để tiến hành chế tạo "..szHoaDacBiet.." đá Thần Hỏa cần Tối thiểu "..1*szHoaDacBiet.." Đá Ngũ Hành và Đá Nguyên Tố\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nKimHe.." Kim Hệ Bảo Thạch\n"..nMocHe.." Mộc Hệ Bảo Thạch\n"..nThuyHe.." Thủy Hệ Bảo Thạch\n"..nHoaHe.." Hỏa Hệ Bảo Thạch\n"..nThoHe.." Thổ Hệ Bảo Thạch")
	return  
	end
	me.AddStackItem(18,1,2028,25,nil,szHoaDacBiet)
		Task:DelItem(me, tbKimHe, szHoaDacBiet);
		Task:DelItem(me, tbMocHe, szHoaDacBiet);
		Task:DelItem(me, tbThuyHe, szHoaDacBiet);
		Task:DelItem(me, tbHoaHe, szHoaDacBiet);
		Task:DelItem(me, tbThoHe, szHoaDacBiet);
		Task:DelItem(me, tbNguyenTo, szHoaDacBiet);
	end

function tbSuKienThanHoaT7:nauchetaothienhoa()
    local nCount = me.GetJbCoin()
    local nKimHe = me.GetItemCountInBags(18, 1, 2028, 19) 
    local nMocHe = me.GetItemCountInBags(18, 1, 2028, 20) 
    local nThuyHe = me.GetItemCountInBags(18, 1, 2028, 21) 
    local nHoaHe = me.GetItemCountInBags(18, 1, 2028, 22) 
    local nThoHe = me.GetItemCountInBags(18, 1, 2028, 23) 
    local nTinhLuc = me.dwCurGTP
    local nHoatLuc = me.dwCurMKP
    local nGioiHanTinhLuc = 500
    local nGioiHanHoatLuc = 500
    
    if nTinhLuc < nGioiHanTinhLuc or nHoatLuc < nGioiHanHoatLuc then 
        Dialog:Say("Để tiến hành nấu Thiên Hỏa cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
        return
    end
    
    if nKimHe < 1 or nMocHe < 1 or nThuyHe < 1 or nHoaHe < 1 or nThoHe < 1 then
        Dialog:Say("Bạn thiếu Bảo Thạch của một trong các Hệ. Hãy mang nó tới đây gặp ta.")
        return
    end

    local arr = {nKimHe, nMocHe, nThuyHe, nHoaHe, nThoHe}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu1, self.nauchetaothienhoa1, self)
end


 
function tbSuKienThanHoaT7:nauchetaothienhoa1(szHoaThuong)
local nKimHe = me.GetItemCountInBags(18,1,2028,19) 
local nMocHe = me.GetItemCountInBags(18,1,2028,20) 
local nThuyHe = me.GetItemCountInBags(18,1,2028,21) 
local nHoaHe = me.GetItemCountInBags(18,1,2028,22) 
local nThoHe = me.GetItemCountInBags(18,1,2028,23) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbKimHe	= {18,1,2028,19,0,0}; 
	local tbMocHe	= {18,1,2028,20,0,0}; 
	local tbThuyHe	= {18,1,2028,21,0,0}; 
	local tbHoaHe	= {18,1,2028,22,0,0}; 
	local tbThoHe	= {18,1,2028,23,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nKimHe < 1*szHoaThuong) or (nMocHe < 1*szHoaThuong) or (nThuyHe < 1*szHoaThuong) or (nHoaHe < 1*szHoaThuong)   or (nThoHe < 1*szHoaThuong)  then 
		Dialog:Say("Để tiến hành chế tạo "..szHoaThuong.." Thiên Hỏa cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 bộ đá ngũ hành\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nKimHe.." Kim Hệ Bảo Thạch\n"..nMocHe.." Mộc Hệ Bảo Thạch\n"..nThuyHe.." Thủy Hệ Bảo Thạch\n"..nHoaHe.." Hỏa Hệ Bảo Thạch\n"..nThoHe.." Thổ Hệ Bảo Thạch")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2028,24,nil,szHoaThuong)
		Task:DelItem(me, tbKimHe, szHoaThuong);
		Task:DelItem(me, tbMocHe, szHoaThuong);
		Task:DelItem(me, tbThuyHe, szHoaThuong);
		Task:DelItem(me, tbHoaHe, szHoaThuong);
		Task:DelItem(me, tbThoHe, szHoaThuong);
	end

