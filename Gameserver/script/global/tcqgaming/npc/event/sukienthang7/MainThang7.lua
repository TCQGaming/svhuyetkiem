-- date:13/02/2023
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_Thang7 ={};
SpecialEvent.tbSuKien_Thang7= tbSuKien_Thang7;

function tbSuKien_Thang7:OnDialog()

	local szMsg = "<color=yellow>Sự Kiện Tháng 7 \nMáy Chủ Thần Hổ<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn may Quần Chiến Sĩ ( Thường )<color>",self.viet_tap_vo, self};
		{"<color=yellow>Ta muốn may Áo Chiến Sĩ (Đặc Biệt )<color>",self.chetaothanhoa, self};
		-- {"<color=yellow>Ta muốn mua Nguyên Tố Bảo Thạch<color>\n<color=green>(1 Vạn Đồng/1)",self.muanguyento, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		{"<color=yellow>Mua Full Event\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang7:resetevent()
	local nCount = me.GetTask(9186,87)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9186,84, 0)
	me.SetTask(9186,85, 0)
	me.SetTask(9186,87, nCount + 1);
	me.AddJbCoin(-200*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Thần Hỏa Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbSuKien_Thang7:muanguyento()
local nDong = me.GetJbCoin()
if nDong < 1*10000 then 
	Dialog:Say("Hành trang bạn không có nổi 1 vạn đồng ư ?")
return 
end
local nSoDu = 0
nSoDu = nDong/10000
Dialog:AskNumber("Số lượng đổi", nSoDu, self.muanguyento1, self);
end 
function tbSuKien_Thang7:muanguyento1(nMuaNguyenTo)
local nDong = me.GetJbCoin()
	if (nDong < 10000*nMuaNguyenTo) then
	Dialog:Say("Thiếu đồng rồi bạn ơi")
	return  
	end
	me.AddStackItem(18,1,2028,18,nil,nMuaNguyenTo)
	me.AddJbCoin(-1*(nMuaNguyenTo*10000))
end
	
function tbSuKien_Thang7:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1327,12,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,1327,11,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Áo Chiến Sĩ và 500 Quần Chiến Sĩ Tại NPC Sứ Giả Sự Kiện<color>");
	end
 
function tbSuKien_Thang7:viet_tap_vo()
	local szMsg = "<color=yellow>Để may Quần Chiến Sĩ cần: \n<color=yellow>*1 Cuộn Chỉ\n*1 Cây Kim\n*1 Tấm Vải Rằn Ri\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành May Quần Chiến Sĩ",self.tienhanh_viettapvo, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang7:chetaothanhoa()
	local szMsg = "<color=yellow>Để may tấm Áo Chiến Sĩ cần: \n<color=yellow>*1 Cây Kim\n*1 Cuộn Chỉ\n*1 Vạn đồng<color>";
	local tbOpt = 
	{
			{"Tiến May Tấm Áo Chiến Sĩ",self.nauchetaothanhoa, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang7:nauchetaothanhoa()
    local nCount = me.GetJbCoin()
    local nCayKim = me.GetItemCountInBags(18, 1, 1327, 7) 
    local nCuonChi = me.GetItemCountInBags(18, 1, 1327, 8) 
    local nVaiRanRi = me.GetItemCountInBags(18, 1, 1327, 9) 
		local nDong = me.GetJbCoin()
	local SoDong = math.floor(nDong/10000)
    local nSoDu = 0
    if nCayKim < 1 or nCuonChi < 1 or nVaiRanRi < 1 or (nDong < 1*10000) then
			Dialog:Say("Để tiến may Áo Chiến Sĩ cần tối thiểu 1 vạn đồng thường và 1  Cây Kim cũng như Cuộn Chỉ bạn không đủ rồi")
        return 
    end

    local arr = {nCayKim, nCuonChi,nVaiRanRi}
    table.sort(arr)
    nSoDu = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu, self.nauchetaothanhoa1, self)
end 

 
function tbSuKien_Thang7:nauchetaothanhoa1(szHoaDacBiet)
local nCayKim = me.GetItemCountInBags(18,1,1327,7) 
local nCuonChi = me.GetItemCountInBags(18,1,1327,8) 
local nVaiRanRi = me.GetItemCountInBags(18,1,1327,9) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbCayKim	= {18,1,1327,7,0,0}; 
	local tbCuonChi	= {18,1,1327,8,0,0}; 
	local tbVaiRanRi	= {18,1,1327,9,0,0}; 
	local nDong = me.GetJbCoin()
	local SoDong = math.floor(nDong/10000)

	if (nCayKim < 1*szHoaDacBiet) or (nCuonChi < 1*szHoaDacBiet) or (nVaiRanRi < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến may "..szHoaDacBiet.." Áo Chiến Sĩ cần Tối thiểu "..1*szHoaDacBiet.." 1 Cây Kim 1 Vạn Đồng và 1 Cuộn Chỉ\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nCayKim.." Cây Kim\n"..nCuonChi.."Cuộn Chỉ\nn"..nVaiRanRi.." Vải Rằn Ri\n"..SoDong.." Vạn đồng")
	return  
	end
	me.AddStackItem(18,1,1327,11,nil,szHoaDacBiet)
		me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbCayKim, szHoaDacBiet);
		Task:DelItem(me, tbCuonChi, szHoaDacBiet);
		Task:DelItem(me, tbVaiRanRi, szHoaDacBiet);
	end

function tbSuKien_Thang7:tienhanh_viettapvo()
    local nCayKim = me.GetItemCountInBags(18, 1, 1327, 7) 
    local nCuonChi = me.GetItemCountInBags(18, 1, 1327, 8) 
    local nVaiRanRi = me.GetItemCountInBags(18, 1, 1327, 9) 
    local nTinhLuc = me.dwCurGTP
    local nHoatLuc = me.dwCurMKP
    local nGioiHanTinhLuc = 500
    local nGioiHanHoatLuc = 500
    
    if nTinhLuc < nGioiHanTinhLuc or nHoatLuc < nGioiHanHoatLuc then 
        Dialog:Say("Để tiến hành may Quần Chiến Sĩ cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
        return
    end
    
    if nCayKim < 1 or nCuonChi < 1 or nVaiRanRi < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu rồi. Hãy mang đầy đủ tới đây gặp ta.")
        return
    end

    local arr = {nCayKim, nCuonChi,nVaiRanRi}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu1, self.tienhanh_viettapvo1, self)
end


 
function tbSuKien_Thang7:tienhanh_viettapvo1(szHoaThuong)
local nCayKim = me.GetItemCountInBags(18,1,1327,7) 
local nCuonChi = me.GetItemCountInBags(18,1,1327,8) 
local nVaiRanRi = me.GetItemCountInBags(18,1,1327,9) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbCayKim	= {18,1,1327,7,0,0}; 
	local tbCuonChi	= {18,1,1327,8,0,0}; 
	local tbVaiRanRi	= {18,1,1327,9,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nCayKim < 1*szHoaThuong) or (nCuonChi < 1*szHoaThuong) or (nVaiRanRi < 1*szHoaThuong) then 
		Dialog:Say("Để tiến hành may "..szHoaThuong.." Quần Chiến Sĩ cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 Cây Kim và Cuộn Chỉ và Vải Rằn Ri\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nCayKim.." Cây Kim\n"..nCuonChi.."Cuộn Chỉ\n"..nVaiRanRi.." Vải Rằn Ri")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,1327,12,nil,szHoaThuong)
		Task:DelItem(me, tbCayKim, szHoaThuong);
		Task:DelItem(me, tbCuonChi, szHoaThuong);
		Task:DelItem(me, tbVaiRanRi, szHoaThuong);
	end

