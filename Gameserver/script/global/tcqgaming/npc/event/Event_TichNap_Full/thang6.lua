-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T6 ={};
SpecialEvent.SuKienT6= tbSuKien_NapTien_T6;


function tbSuKien_NapTien_T6:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 6<color>";
	local nLan = Config_Event_Bank.Thang6
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùa Hạ 14/06-21/06<color>" , self.tichluy_thang6_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùa Hạ Lần 2 - 21/06-28/06<color>" , self.tichluy_thang6_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùa Hạ Lần 3 - 28/05-05/07<color>" , self.tichluy_thang6_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùa Hạ 05/07-12/07<color>" , self.tichluy_thang6_lan4, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhdd12312312")  then
					-- table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 1 Thời gian 17/05-24/05<color>" , self.tichluy_thang6_lan1, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		


function tbSuKien_NapTien_T6:tichluy_thang6_lan1() 
	local nDongRut = me.GetTask(9186,40)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n14/06-21/06<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thanhoa4_100k,self};
		{"Tích Nạp Sự Kiện 200k",self.thanhoa4_200k,self};
		{"Tích Nạp Sự Kiện 300k",self.thanhoa4_300k,self};
		{"Tích Nạp Sự Kiện 400k",self.thanhoa4_400k,self};
		{"Tích Nạp Sự Kiện 500k",self.thanhoa4_500k,self};
		{"Tích Nạp Sự Kiện 600k",self.thanhoa4_600k,self};
		{"Tích Nạp Sự Kiện 700k",self.thanhoa4_700k,self};
		{"Tích Nạp Sự Kiện 1000k",self.thanhoa4_1000k,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T6:tichluy_thang6_lan2() 
	local nDongRut = me.GetTask(9186,51)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n21/06-28/06<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thanhoa4_100k_lan2,self};
		{"Tích Nạp Sự Kiện 200k",self.thanhoa4_200k_lan2,self};
		{"Tích Nạp Sự Kiện 300k",self.thanhoa4_300k_lan2,self};
		{"Tích Nạp Sự Kiện 400k",self.thanhoa4_400k_lan2,self};
		{"Tích Nạp Sự Kiện 500k",self.thanhoa4_500k_lan2,self};
		{"Tích Nạp Sự Kiện 600k",self.thanhoa4_600k_lan2,self};
		{"Tích Nạp Sự Kiện 700k",self.thanhoa4_700k_lan2,self};
		{"Tích Nạp Sự Kiện 1000k",self.thanhoa4_1000k_lan2,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T6:tichluy_thang6_lan3() 
	local nDongRut = me.GetTask(9186,61)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n28/06-05/07<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thanhoa4_100k_lan3,self};
		{"Tích Nạp Sự Kiện 200k",self.thanhoa4_200k_lan3,self};
		{"Tích Nạp Sự Kiện 300k",self.thanhoa4_300k_lan3,self};
		{"Tích Nạp Sự Kiện 400k",self.thanhoa4_400k_lan3,self};
		{"Tích Nạp Sự Kiện 500k",self.thanhoa4_500k_lan3,self};
		{"Tích Nạp Sự Kiện 600k",self.thanhoa4_600k_lan3,self};
		{"Tích Nạp Sự Kiện 700k",self.thanhoa4_700k_lan3,self};
		{"Tích Nạp Sự Kiện 1000k",self.thanhoa4_1000k_lan3,self};
		{"Tích Nạp Sự Kiện 1500k",self.thanhoa4_1500k_lan3,self};
		{"Tích Nạp Sự Kiện 2000k",self.thanhoa4_2000k_lan3,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T6:tichluy_thang6_lan4() 
	local nDongRut = me.GetTask(9186,73)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n05/07-12/07<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thanhoa4_100k_lan4,self};
		{"Tích Nạp Sự Kiện 200k",self.thanhoa4_200k_lan4,self};
		{"Tích Nạp Sự Kiện 300k",self.thanhoa4_300k_lan4,self};
		{"Tích Nạp Sự Kiện 400k",self.thanhoa4_400k_lan4,self};
		{"Tích Nạp Sự Kiện 500k",self.thanhoa4_500k_lan4,self};
		{"Tích Nạp Sự Kiện 600k",self.thanhoa4_600k_lan4,self};
		{"Tích Nạp Sự Kiện 700k",self.thanhoa4_700k_lan4,self};
		{"Tích Nạp Sự Kiện 1000k",self.thanhoa4_1000k_lan4,self};
		{"Tích Nạp Sự Kiện 1500k",self.thanhoa4_1500k_lan4,self};
		{"Tích Nạp Sự Kiện 2000k",self.thanhoa4_2000k_lan4,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T6:thanhoa4_100k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,74)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,74, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_200k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,75)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,75, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_300k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,76)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,76, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_400k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,77)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,77, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_500k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,78)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,78, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_600k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,79)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,79, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T6:thanhoa4_700k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,80)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,80, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_1000k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,81)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,81, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Mùa Hè Lần 4\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_1500k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,82)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,82, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Mùa Hè Lần 4\nNhận được<color=gold>  :\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_2000k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,83)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,73)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,83, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Mùa Hè Lần 4\nNhận được<color=gold>  :\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_100k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,62)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,62, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_200k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,63)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,63, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_300k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,64)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,64, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_400k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,65)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,65, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_500k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,66)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,66, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_600k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,67)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,67, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T6:thanhoa4_700k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,68)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,68, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_1000k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,69)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,69, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Mùa Hè Lần 3\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_1500k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,70)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,70, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Mùa Hè Lần 3\nNhận được<color=gold>  :\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_2000k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,71)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,61)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,71, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Mùa Hè Lần 3\nNhận được<color=gold>  :\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,52)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,52, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,53)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,53, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,54)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,54, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,55)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,55, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,56)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,56, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_600k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,57)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,57, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T6:thanhoa4_700k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,58)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,58, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_1000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,59)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,51)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,59, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Mùa Hè Lần 2\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T6:thanhoa4_100k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,43)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,43, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_200k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,44)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,44, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_300k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,45)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,45, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_400k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,46)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,46, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_500k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,47)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,47, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T6:thanhoa4_600k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,48)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,48, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T6:thanhoa4_700k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,49)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,49, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T6:thanhoa4_1000k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,50)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,40)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,50, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Mùa Hè Lần 1\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung\n50 Vật phẩm đua top tháng 6");
end 