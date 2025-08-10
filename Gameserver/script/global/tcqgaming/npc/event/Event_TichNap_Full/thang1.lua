-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T1 ={};
SpecialEvent.SuKienT1= tbSuKien_NapTien_T1;


function tbSuKien_NapTien_T1:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 1<color>";
	local nLan = Config_Event_Bank.Thang1
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025 28/12-11/01<color>" , self.tichluy_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025 Lần 2 - 11/01-18/01<color>" , self.tichluy_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025Lần 3 - 26/07-01/08<color>" , self.tichluy_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025Lần 4 - 02/08-09/08<color>" , self.tichluy_lan4, self});
		elseif nLan == 5 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025Lần 5 - 09/08-16/08<color>" , self.tichluy_lan5, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhddddddddd")  then
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Tết Dương Lịch 2025 28/12-11/01<color>" , self.tichluy_lan1, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		

function tbSuKien_NapTien_T1:tichluy_lan1() 
	local nDongRut = me.GetTask(9186,178)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n28/12-04/01<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan1,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan1,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan1,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan1,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan1,self};
		-- {"Tích Nạp Sự Kiện 600k",self.CachMangThang8_600k_lan1,self};
		-- {"Tích Nạp Sự Kiện 700k",self.CachMangThang8_700k_lan1,self};
		-- {"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan1,self};
		-- {"Tích Nạp Sự Kiện 1500k",self.CachMangThang8_1500k_lan1,self};
		-- {"Tích Nạp Sự Kiện 2000k",self.CachMangThang8_2000k_lan1,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T1:tichluy_lan2() 
	local nDongRut = me.GetTask(9186,184)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n11/01-18/01<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan2,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan2,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan2,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan2,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan2,self};
		-- {"Tích Nạp Sự Kiện 600k",self.CachMangThang8_600k_lan2,self};
		-- {"Tích Nạp Sự Kiện 700k",self.CachMangThang8_700k_lan2,self};
		-- {"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan2,self};
		-- {"Tích Nạp Sự Kiện 1500k",self.CachMangThang8_1500k_lan2,self};
		-- {"Tích Nạp Sự Kiện 2000k",self.CachMangThang8_2000k_lan2,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T1:CachMangThang8_100k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,179)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,178)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,179, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan1() 
end

function tbSuKien_NapTien_T1:CachMangThang8_200k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,180)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,178)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,180, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan1() 
end
function tbSuKien_NapTien_T1:CachMangThang8_300k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,181)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,178)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,181, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan1() 
end
function tbSuKien_NapTien_T1:CachMangThang8_400k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,182)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,178)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,182, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan1() 
end
function tbSuKien_NapTien_T1:CachMangThang8_500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,183)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,178)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,183, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Tết Dương Lịch 2025 Lần 1\nNhận được<color=gold>  :\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T1:tichluy_lan1() 
end




function tbSuKien_NapTien_T1:CachMangThang8_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,185)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,184)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,185, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan2() 
end

function tbSuKien_NapTien_T1:CachMangThang8_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,186)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,184)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,186, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---5v Bạc Khóa
me.AddBindCoin(50*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan2() 
end
function tbSuKien_NapTien_T1:CachMangThang8_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,187)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,184)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,187, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan2() 
end
function tbSuKien_NapTien_T1:CachMangThang8_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,188)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,184)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,188, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T1:tichluy_lan2() 
end
function tbSuKien_NapTien_T1:CachMangThang8_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,189)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,184)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,189, nCount + 1);
	me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(10*10000);---10v Bạc Khóa
me.AddBindCoin(50*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 500K Sự Kiện Tết Dương Lịch 2025 Lần 2\nNhận được<color=gold>  :\n3 Huyền Tinh 8\n5 Huyền Tinh 7\n10 Vạn Bạc Khóa\n50 Vạn Đồng Khóa\n1 Bổ Tu Lệnh");
 tbSuKien_NapTien_T1:tichluy_lan2() 
end
