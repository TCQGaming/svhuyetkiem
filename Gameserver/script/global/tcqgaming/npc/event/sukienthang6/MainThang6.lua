-- date:13/02/2023
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_Thang6 ={};
SpecialEvent.tbSuKien_Thang6= tbSuKien_Thang6;

function tbSuKien_Thang6:OnDialog()

	local szMsg = "<color=yellow>Sự Kiện Tháng 6 \nMáy Chủ Thần Hổ<color>";
	local tbOpt = 
	{
		{"<color=yellow>Ta muốn viết Tập Vở<color>",self.viet_tap_vo, self};
		{"<color=yellow>Ta muốn ghi lại Lưu Bút<color>",self.chetaothanhoa, self};
		-- {"<color=yellow>Ta muốn mua Nguyên Tố Bảo Thạch<color>\n<color=green>(1 Vạn Đồng/1)",self.muanguyento, self};
		{"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent, self};
		-- {"<color=yellow>Mua Full Event Thiên Hỏa Và Thần Hỏa\n<color=green>(1500 Vạn đồng)<color>",self.muaevent, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang6:resetevent()
	local nCount = me.GetTask(9186,72)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9186,41, 0)
	me.SetTask(9186,42, 0)
	me.SetTask(9186,72, nCount + 1);
	me.AddJbCoin(-200*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Tháng 6 Tại NPC Sứ Giả Sự Kiện<color>");
	end
	
function tbSuKien_Thang6:muanguyento()
local nDong = me.GetJbCoin()
if nDong < 1*10000 then 
	Dialog:Say("Hành trang bạn không có nổi 1 vạn đồng ư ?")
return 
end
local nSoDu = 0
nSoDu = nDong/10000
Dialog:AskNumber("Số lượng đổi", nSoDu, self.muanguyento1, self);
end 
function tbSuKien_Thang6:muanguyento1(nMuaNguyenTo)
local nDong = me.GetJbCoin()
	if (nDong < 10000*nMuaNguyenTo) then
	Dialog:Say("Thiếu đồng rồi bạn ơi")
	return  
	end
	me.AddStackItem(18,1,2028,18,nil,nMuaNguyenTo)
	me.AddJbCoin(-1*(nMuaNguyenTo*10000))
end
	
function tbSuKien_Thang6:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1327,4,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,1327,5,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
			KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua 1000 Thần Hỏa và 500 Thiên Hỏa Tháng 5 Tại NPC Sứ Giả Sự Kiện<color>");
	end
 
function tbSuKien_Thang6:viet_tap_vo()
	local szMsg = "<color=yellow>Để ghi lại kiến thức vào Tập vở cần: \n<color=yellow>*1 Bút Lông\n*1 Giấy trắng\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành viết Tập Vở",self.tienhanh_viettapvo, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang6:chetaothanhoa()
	local szMsg = "<color=yellow>Để viết vào Lưu Bút cần: \n<color=yellow>*1 Bút Lông\n*1 Giấy Trắng\n*1 Vạn đồng<color>";
	local tbOpt = 
	{
			{"Tiến Hành ghi lại Lưu Bút",self.nauchetaothanhoa, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbSuKien_Thang6:nauchetaothanhoa()
    local nCount = me.GetJbCoin()
    local nButLong = me.GetItemCountInBags(18, 1, 1327, 2) 
    local nGiayTrang = me.GetItemCountInBags(18, 1, 1327, 3) 
		local nDong = me.GetJbCoin()
	local SoDong = math.floor(nDong/10000)
    local nSoDu = 0
    if nButLong < 1 or nGiayTrang < 1 or (nDong < 1*10000) then
			Dialog:Say("Để tiến hành ghi kỷ niệm vào lưu bút cần tối thiểu 1 vạn đồng thường và 1  Bút Lông cũng như giấy trắng bạn không đủ rồi")
        return 
    end

    local arr = {nButLong, nGiayTrang}
    table.sort(arr)
    nSoDu = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu, self.nauchetaothanhoa1, self)
end 

 
function tbSuKien_Thang6:nauchetaothanhoa1(szHoaDacBiet)
local nButLong = me.GetItemCountInBags(18,1,1327,2) 
local nGiayTrang = me.GetItemCountInBags(18,1,1327,3) 
	local tbButLong	= {18,1,1327,2,0,0}; 
	local tbGiayTrang	= {18,1,1327,3,0,0}; 
	local nDong = me.GetJbCoin()
	local SoDong = math.floor(nDong/10000)

	if (nButLong < 1*szHoaDacBiet) or (nGiayTrang < 1*szHoaDacBiet) or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành ghi lại "..szHoaDacBiet.." Lưu Bút cần Tối thiểu "..1*szHoaDacBiet.." 1 Bút Lông 1 Vạn Đồng và 1 Giấy Trắng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nButLong.." Bút Lông\n"..nGiayTrang.."Giấy Trắng\n"..SoDong.." Vạn đồng")
	return  
	end
	me.AddStackItem(18,1,1327,5,nil,szHoaDacBiet)
		me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbButLong, szHoaDacBiet);
		Task:DelItem(me, tbGiayTrang, szHoaDacBiet);
	end

function tbSuKien_Thang6:tienhanh_viettapvo()
    local nButLong = me.GetItemCountInBags(18, 1, 1327, 2) 
    local nGiayTrang = me.GetItemCountInBags(18, 1, 1327, 3) 
    local nTinhLuc = me.dwCurGTP
    local nHoatLuc = me.dwCurMKP
    local nGioiHanTinhLuc = 500
    local nGioiHanHoatLuc = 500
    
    if nTinhLuc < nGioiHanTinhLuc or nHoatLuc < nGioiHanHoatLuc then 
        Dialog:Say("Để tiến hành viết tập vở cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
        return
    end
    
    if nButLong < 1 or nGiayTrang < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu rồi. Hãy mang đầy đủ tới đây gặp ta.")
        return
    end

    local arr = {nButLong, nGiayTrang}
    table.sort(arr)
    local nSoDu1 = arr[1] -- Chọn số lượng ít nhất của các loại Bảo Thạch hiện có
    Dialog:AskNumber("Số lượng đổi", nSoDu1, self.tienhanh_viettapvo1, self)
end


 
function tbSuKien_Thang6:tienhanh_viettapvo1(szHoaThuong)
local nButLong = me.GetItemCountInBags(18,1,1327,2) 
local nGiayTrang = me.GetItemCountInBags(18,1,1327,3) 
local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
	local tbButLong	= {18,1,1327,2,0,0}; 
	local tbGiayTrang	= {18,1,1327,3,0,0}; 

	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nButLong < 1*szHoaThuong) or (nGiayTrang < 1*szHoaThuong) then 
		Dialog:Say("Để tiến hành ghi lại kiến thức vào "..szHoaThuong.." Tập Vở cần tối thiểu "..500*szHoaThuong.." tinh hoạt lực\nTối thiểu 1 bộ Bút Lông và Giấy Trắng\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực<color=gold>\n"..nButLong.." Bút Lông\n"..nGiayTrang.."Giấy Trắng")
	return
	end 
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,1327,4,nil,szHoaThuong)
		Task:DelItem(me, tbButLong, szHoaThuong);
		Task:DelItem(me, tbGiayTrang, szHoaThuong);
	end

