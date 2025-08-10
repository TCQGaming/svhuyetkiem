-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T3 ={};
SpecialEvent.SuKien_T3= tbSuKien_NapTien_T3;


function tbSuKien_NapTien_T3:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Mùng 8 Tháng 3<color>";
	local nLan = Config_Event_Bank.Thang3
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025 22/02-29/02<color>" , self.tichluy_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025 Lần 2 - 01/03-08/03<color>" , self.tichluy_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025Lần 3 - 08/03-22/03<color>" , self.tichluy_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025Lần 4 - 22/03-05/04<color>" , self.tichluy_lan4, self});
		elseif nLan == 5 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025Lần 5 - 09/08-16/08<color>" , self.tichluy_lan5, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhddddddddd")  then
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Mùng 8 Tháng 3 2025 28/12-11/01<color>" , self.tichluy_lan1, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		

function tbSuKien_NapTien_T3:tichluy_lan1() 
	local nDongRut = me.GetTask(9186,210)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n22/02-29/02<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan1,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan1,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan1,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan1,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan1,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan1,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T3:tichluy_lan2() 
	local nDongRut = me.GetTask(9186,211)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n01/03-08/03<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan2,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan2,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan2,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan2,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan2,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan2,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T3:tichluy_lan3() 
	local nDongRut = me.GetTask(9186,218)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n08/03-15/03<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan3,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan3,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan3,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan3,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan3,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan3,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T3:tichluy_lan4() 
	local nDongRut = me.GetTask(9186,225)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n22/03-05/04<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan4,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan4,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan4,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan4,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan4,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan4,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T3:CachMangThang8_100k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,226)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,226, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan4() 
end

function tbSuKien_NapTien_T3:CachMangThang8_200k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,227)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,227, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan4() 
end
function tbSuKien_NapTien_T3:CachMangThang8_300k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,228)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,228, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan4() 
end
function tbSuKien_NapTien_T3:CachMangThang8_400k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,229)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,229, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan4() 
end
function tbSuKien_NapTien_T3:CachMangThang8_500k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,230)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,230, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Mùng 8 Tháng 3 2025 Lần 3\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan4() 
end

function tbSuKien_NapTien_T3:CachMangThang8_1000k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,231)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,225)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,231, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
me.AddStackItem(18,1,2034,13,nil,5)---Lệnh bài boss tdc
me.AddStackItem(18,1,1327,13,nil,100)-- mảnh ghép hòa thị ngọc thô
me.AddStackItem(18,1,1303,5,nil,10)-- rương ngọc vỡ  cấp 5
 me.AddStackItem(18,1,402,1,nil,500)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
me.AddStackItem(18,1,2026,1,nil,100)---Thất Sắc Hồn
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Mùng 8 Tháng 3 2025 Lần 3\nNhận được<color=gold>  :\n100 Thất Sắc Hồn\n500 Chân Nguyên Tu Luyện Đơn\n100 MG Hòa Thị Ngọc thô\n10 Rương ngọc vỡ cấp 5\n5 Lệnh Bài Triệu Hồi Boss TDC\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan4() 
end


function tbSuKien_NapTien_T3:CachMangThang8_100k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,219)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,219, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan3() 
end

function tbSuKien_NapTien_T3:CachMangThang8_200k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,220)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,220, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan3() 
end
function tbSuKien_NapTien_T3:CachMangThang8_300k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,221)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,221, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan3() 
end
function tbSuKien_NapTien_T3:CachMangThang8_400k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,222)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,222, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan3() 
end
function tbSuKien_NapTien_T3:CachMangThang8_500k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,223)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,223, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Mùng 8 Tháng 3 2025 Lần 3\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan3() 
end

function tbSuKien_NapTien_T3:CachMangThang8_1000k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,224)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,218)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,224, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
me.AddStackItem(18,1,2034,13,nil,5)---Lệnh bài boss tdc
me.AddStackItem(18,1,1327,13,nil,100)-- mảnh ghép hòa thị ngọc thô
me.AddStackItem(18,1,1303,5,nil,10)-- rương ngọc vỡ  cấp 5
 me.AddStackItem(18,1,402,1,nil,500)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Mùng 8 Tháng 3 2025 Lần 3\nNhận được<color=gold>  :\n25 Thất Sắc Hồn\n500 Chân Nguyên Tu Luyện Đơn\n100 MG Hòa Thị Ngọc thô\n10 Rương ngọc vỡ cấp 5\n5 Lệnh Bài Triệu Hồi Boss TDC\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan3() 
end


function tbSuKien_NapTien_T3:CachMangThang8_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,212)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,212, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan2() 
end

function tbSuKien_NapTien_T3:CachMangThang8_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,213)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,213, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan2() 
end
function tbSuKien_NapTien_T3:CachMangThang8_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,214)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,214, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan2() 
end
function tbSuKien_NapTien_T3:CachMangThang8_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,215)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,215, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan2() 
end
function tbSuKien_NapTien_T3:CachMangThang8_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,216)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,216, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Mùng 8 Tháng 3 2025 Lần 2\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan2() 
end

function tbSuKien_NapTien_T3:CachMangThang8_1000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,217)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,211)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,217, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
me.AddStackItem(18,1,2034,13,nil,5)---Lệnh bài boss tdc
me.AddStackItem(18,1,1327,13,nil,100)-- mảnh ghép hòa thị ngọc thô
me.AddStackItem(18,1,1303,5,nil,10)-- rương ngọc vỡ  cấp 5
 me.AddStackItem(18,1,402,1,nil,500)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Mùng 8 Tháng 3 2025 Lần 2\nNhận được<color=gold>  :\n25 Thất Sắc Hồn\n500 Chân Nguyên Tu Luyện Đơn\n100 MG Hòa Thị Ngọc thô\n10 Rương ngọc vỡ cấp 5\n5 Lệnh Bài Triệu Hồi Boss TDC\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan2() 
end




function tbSuKien_NapTien_T3:CachMangThang8_100k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,204)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,204, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan1() 
end

function tbSuKien_NapTien_T3:CachMangThang8_200k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,205)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,205, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan1() 
end
function tbSuKien_NapTien_T3:CachMangThang8_300k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,206)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,206, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan1() 
end
function tbSuKien_NapTien_T3:CachMangThang8_400k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,207)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,207, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T3:tichluy_lan1() 
end
function tbSuKien_NapTien_T3:CachMangThang8_500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,208)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,208, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Mùng 8 Tháng 3 2025 Lần 1\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan1() 
end

function tbSuKien_NapTien_T3:CachMangThang8_1000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,209)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,210)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,209, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
me.AddStackItem(18,1,2034,13,nil,5)---Lệnh bài boss tdc
me.AddStackItem(18,1,1327,13,nil,100)-- mảnh ghép hòa thị ngọc thô
me.AddStackItem(18,1,1303,5,nil,10)-- rương ngọc vỡ  cấp 5
 me.AddStackItem(18,1,402,1,nil,500)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Mùng 8 Tháng 3 2025 Lần 1\nNhận được<color=gold>  :\n25 Thất Sắc Hồn\n500 Chân Nguyên Tu Luyện Đơn\n100 MG Hòa Thị Ngọc thô\n10 Rương ngọc vỡ cấp 5\n5 Lệnh Bài Triệu Hồi Boss TDC\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T3:tichluy_lan1() 
end

