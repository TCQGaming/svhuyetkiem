-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T5 ={};
SpecialEvent.SuKienT5= tbSuKien_NapTien_T5;


function tbSuKien_NapTien_T5:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 5<color>";
	local nLan = Config_Event_Bank.Thang5
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 1 Thời gian 17/05-24/05<color>" , self.tichluythanhoathang7, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 2 Thời gian 24/05-31/05<color>" , self.tichluythanhoa2thang7, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 3 Thời gian 31/05-07/06<color>" , self.tichluythanhoa3thang7, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 4 Thời gian 07/06-14/06<color>" , self.tichluythanhoa4thang7, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhdd12312312")  then
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 1 Thời gian 17/05-24/05<color>" , self.tichluythanhoathang7, self});
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 2 Thời gian 24/05-31/05<color>" , self.tichluythanhoa2thang7, self});
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 3 Thời gian 31/05-07/06<color>" , self.tichluythanhoa3thang7, self});
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thần Hỏa 4 Thời gian 07/06-14/06<color>" , self.tichluythanhoa4thang7, self});
end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		


function tbSuKien_NapTien_T5:tichluythanhoathang7() 
	local nDongRut = me.GetTask(9186,1)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n17/05-24/05<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 50k",self.thang7lan1qua50kevent,self};
		{"Tích Nạp Sự Kiện 100k",self.thang7lan1qua100kevent,self};
		{"Tích Nạp Sự Kiện 200k",self.thang7lan1qua200kevent,self};
		{"Tích Nạp Sự Kiện 300k",self.thang7lan1qua300kevent,self};
		{"Tích Nạp Sự Kiện 400k",self.thang7lan1qua400kevent,self};
		{"Tích Nạp Sự Kiện 500k",self.thang7lan1qua500kevent,self};
		{"Tích Nạp Sự Kiện 600k",self.thang7lan1qua600kevent,self};
		{"Tích Nạp Sự Kiện 700k",self.thang7lan1qua700kevent,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T5:tichluythanhoa2thang7() 
	local nDongRut = me.GetTask(9186,13)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n24/05-31/05<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 50k",self.thang7lan2qua50kevent,self};
		{"Tích Nạp Sự Kiện 100k",self.thang7lan2qua100kevent,self};
		{"Tích Nạp Sự Kiện 200k",self.thang7lan2qua200kevent,self};
		{"Tích Nạp Sự Kiện 300k",self.thang7lan2qua300kevent,self};
		{"Tích Nạp Sự Kiện 400k",self.thang7lan2qua400kevent,self};
		{"Tích Nạp Sự Kiện 500k",self.thang7lan2qua500kevent,self};
		{"Tích Nạp Sự Kiện 600k",self.thang7lan2qua600kevent,self};
		{"Tích Nạp Sự Kiện 700k",self.thang7lan2qua700kevent,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T5:tichluythanhoa3thang7()
	local nDongRut = me.GetTask(9186,22)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n31/05-07/06<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 50k",self.thang8lan1qua50kevent,self};
		{"Tích Nạp Sự Kiện 200k",self.thang8lan1qua200kevent,self};
		{"Tích Nạp Sự Kiện 300k",self.thang8lan1qua300kevent,self};
		{"Tích Nạp Sự Kiện 400k",self.thang8lan1qua400kevent,self};
		{"Tích Nạp Sự Kiện 500k",self.thang8lan1qua500kevent,self};
		{"Tích Nạp Sự Kiện 600k",self.thang8lan1qua600kevent,self};
		{"Tích Nạp Sự Kiện 700k",self.thang8lan1qua700kevent,self};
		{"Tích Nạp Sự Kiện 1000K",self.thang8lan1qua1000kevent,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T5:tichluythanhoa4thang7()
	local nDongRut = me.GetTask(9186,31)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n07/06-14/06<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 50k",self.thanhoa4_50k,self};
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

function tbSuKien_NapTien_T5:thanhoa4_50k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,32)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,32, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(250000);---25v Bạc Khóa
me.AddBindCoin(250000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T5:thanhoa4_200k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,33)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,33, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thanhoa4_300k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,34)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,34, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thanhoa4_400k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,35)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,35, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thanhoa4_500k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,36)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,36, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thanhoa4_600k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,37)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,37, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T5:thanhoa4_700k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,38)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,38, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--500-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T5:thanhoa4_1000k()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,39)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,31)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,39, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thần Hỏa Lần 4\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T5:thang8lan1qua50kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,23)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,23, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(250000);---25v Bạc Khóa
me.AddBindCoin(250000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T5:thang8lan1qua200kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,25)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,25, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang8lan1qua300kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,26)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,26, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang8lan1qua400kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,27)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,27, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang8lan1qua500kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,28)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,28, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang8lan1qua600kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,29)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,29, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T5:thang8lan1qua700kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,24)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,24, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--500-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T5:thang8lan1qua1000kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,30)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,22)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,30, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thần Hỏa Lần 3\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T5:thang7lan2qua50kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,14)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,14, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
end

function tbSuKien_NapTien_T5:thang7lan2qua100kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,15)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 100 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,15, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
end
function tbSuKien_NapTien_T5:thang7lan2qua200kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,16)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,16, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},10)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan2qua300kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,17)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,17, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan2qua400kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,18)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,18, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan2qua500kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,19)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,19, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan2qua600kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,20)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,20, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan2qua700kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,21)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,13)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,21, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--500-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
--me.AddStackItem(18,1,2033,9,nil,50)---Đua TOP Tháng 12
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 700k Sự Kiện Thần Hỏa 2\nNhận được<color=gold>  :\n4 Huyền Tinh 7\n250 Tiền Du Long\n1 Bổ Tu Lệnh\n3 Huyền Tinh 8\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa");
end 

function tbSuKien_NapTien_T5:thang7lan1qua50kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,2)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,2, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
end

function tbSuKien_NapTien_T5:thang7lan1qua100kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,3)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 100 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,3, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
end
function tbSuKien_NapTien_T5:thang7lan1qua200kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,4)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,4, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},10)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan1qua300kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,5)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,5, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan1qua400kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,6)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,6, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan1qua500kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,7)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,7, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan1qua600kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,8)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,8, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T5:thang7lan1qua700kevent()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,9)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,1)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,9, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(300000);	-- 30v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--500-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
--me.AddStackItem(18,1,2033,9,nil,50)---Đua TOP Tháng 12
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 700k Sự Kiện Thần Hỏa 1\nNhận được<color=gold>  :\n4 Huyền Tinh 7\n250 Tiền Du Long\n1 Bổ Tu Lệnh\n3 Huyền Tinh 8\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa");
end 