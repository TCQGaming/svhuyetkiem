-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T2_TetNguyenDan ={};
SpecialEvent.SuKienT2_NguyenDan= tbSuKien_NapTien_T2_TetNguyenDan;


function tbSuKien_NapTien_T2_TetNguyenDan:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tết Nguyên Đán<color>";
	local nLan = Config_Event_Bank.thang2_tetamlich
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025 22/1-29/01<color>" , self.tichluy_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025 Lần 2 - 08/02-15/02<color>" , self.tichluy_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025Lần 3 - 26/07-01/08<color>" , self.tichluy_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025Lần 4 - 02/08-09/08<color>" , self.tichluy_lan4, self});
		elseif nLan == 5 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025Lần 5 - 09/08-16/08<color>" , self.tichluy_lan5, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhddddddddd")  then
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Nguyên Đán 2025 28/12-11/01<color>" , self.tichluy_lan1, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end	

function tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
	local nDongRut = me.GetTask(9186,197)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n08/02-15/02<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
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

function tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
	local nDongRut = me.GetTask(9186,190)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n22/01-29/01<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
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


function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_100k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,191)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,191, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end

function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_200k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,192)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,192, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_300k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,193)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,193, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_400k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,194)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,194, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,195)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,195, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Tết Nguyên Đán 2025 Lần 1\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end

function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_1000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,196)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,190)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,196, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Tết Nguyên Đán 2025 Lần 1\nNhận được<color=gold>  :\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan1() 
end


function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,198)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,198, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end

function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,199)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,199, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,203)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,203, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,200)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,200, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end
function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,201)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,201, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Tết Nguyên Đán 2025 Lần 2\nNhận được<color=gold>  :\n500 Tiền Du Long\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end

function tbSuKien_NapTien_T2_TetNguyenDan:CachMangThang8_1000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,202)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,197)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,202, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},1000)--1000-Tiền Du Long
me.AddStackItem(18,1,114,8,{bForceBind=1},5)
me.AddStackItem(18,1,114,9,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,200,1,nil,50)
me.AddStackItem(18,1,1327,14,{bForceBind=1},2)
me.AddStackItem(18,1,1875,1,nil,300); --- Rương tb đồng hành
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000K Sự Kiện Tết Nguyên Đán 2025 Lần 2\nNhận được<color=gold>  :\n300 Rương TB Đồng Hành\n2 Bùa Chuyển Cường Hóa\n50 Huyễn Ảnh Thương (NL TDC )\n1000 Tiền Du Long\n3 Huyền Tinh 9\n5 Huyền Tinh 8\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T2_TetNguyenDan:tichluy_lan2() 
end

