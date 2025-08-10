-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T7 ={};
SpecialEvent.SuKienT7= tbSuKien_NapTien_T7;


function tbSuKien_NapTien_T7:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 7<color>";
	local nLan = Config_Event_Bank.Thang7
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ  12/07-19/07<color>" , self.tichluy_thang7_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ Lần 2 - 19/07-26/07<color>" , self.tichluy_thang7_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ Lần 3 - 26/07-01/08<color>" , self.tichluy_thang7_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ Lần 4 - 02/08-09/08<color>" , self.tichluy_thang7_lan4, self});
		elseif nLan == 5 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ Lần 5 - 09/08-16/08<color>" , self.tichluy_thang7_lan5, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhddddddddd")  then
				table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Thương Binh Liệt Sĩ Lần 3 - 26/07-01/08<color>" , self.tichluy_thang7_lan3, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		

function tbSuKien_NapTien_T7:tichluy_thang7_lan1() 
	local nDongRut = me.GetTask(9186,88)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n01/08-08/08<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thuongbinhlietsi_100k_lan1,self};
		{"Tích Nạp Sự Kiện 200k",self.thuongbinhlietsi_200k_lan1,self};
		{"Tích Nạp Sự Kiện 300k",self.thuongbinhlietsi_300k_lan1,self};
		{"Tích Nạp Sự Kiện 400k",self.thuongbinhlietsi_400k_lan1,self};
		{"Tích Nạp Sự Kiện 500k",self.thuongbinhlietsi_500k_lan1,self};
		{"Tích Nạp Sự Kiện 600k",self.thuongbinhlietsi_600k_lan1,self};
		{"Tích Nạp Sự Kiện 700k",self.thuongbinhlietsi_700k_lan1,self};
		{"Tích Nạp Sự Kiện 1000k",self.thuongbinhlietsi_1000k_lan1,self};
		{"Tích Nạp Sự Kiện 1500k",self.thuongbinhlietsi_1500k_lan1,self};
		{"Tích Nạp Sự Kiện 2000k",self.thuongbinhlietsi_2000k_lan1,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T7:tichluy_thang7_lan2() 
	local nDongRut = me.GetTask(9186,99)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n19/07-26/07<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thuongbinhlietsi_100k_lan2,self};
		{"Tích Nạp Sự Kiện 200k",self.thuongbinhlietsi_200k_lan2,self};
		{"Tích Nạp Sự Kiện 300k",self.thuongbinhlietsi_300k_lan2,self};
		{"Tích Nạp Sự Kiện 400k",self.thuongbinhlietsi_400k_lan2,self};
		{"Tích Nạp Sự Kiện 500k",self.thuongbinhlietsi_500k_lan2,self};
		{"Tích Nạp Sự Kiện 600k",self.thuongbinhlietsi_600k_lan2,self};
		{"Tích Nạp Sự Kiện 700k",self.thuongbinhlietsi_700k_lan2,self};
		{"Tích Nạp Sự Kiện 1000k",self.thuongbinhlietsi_1000k_lan2,self};
		{"Tích Nạp Sự Kiện 1500k",self.thuongbinhlietsi_1500k_lan2,self};
		{"Tích Nạp Sự Kiện 2000k",self.thuongbinhlietsi_2000k_lan2,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T7:tichluy_thang7_lan3() 
	local nDongRut = me.GetTask(9186,110)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n26/07-01/08<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thuongbinhlietsi_100k_lan3,self};
		{"Tích Nạp Sự Kiện 200k",self.thuongbinhlietsi_200k_lan3,self};
		{"Tích Nạp Sự Kiện 300k",self.thuongbinhlietsi_300k_lan3,self};
		{"Tích Nạp Sự Kiện 400k",self.thuongbinhlietsi_400k_lan3,self};
		{"Tích Nạp Sự Kiện 500k",self.thuongbinhlietsi_500k_lan3,self};
		{"Tích Nạp Sự Kiện 600k",self.thuongbinhlietsi_600k_lan3,self};
		{"Tích Nạp Sự Kiện 700k",self.thuongbinhlietsi_700k_lan3,self};
		{"Tích Nạp Sự Kiện 1000k",self.thuongbinhlietsi_1000k_lan3,self};
		{"Tích Nạp Sự Kiện 1500k",self.thuongbinhlietsi_1500k_lan3,self};
		{"Tích Nạp Sự Kiện 2000k",self.thuongbinhlietsi_2000k_lan3,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T7:tichluy_thang7_lan4() 
	local nDongRut = me.GetTask(9186,121)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n26/07-01/08<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thuongbinhlietsi_100k_lan4,self};
		{"Tích Nạp Sự Kiện 200k",self.thuongbinhlietsi_200k_lan4,self};
		{"Tích Nạp Sự Kiện 300k",self.thuongbinhlietsi_300k_lan4,self};
		{"Tích Nạp Sự Kiện 400k",self.thuongbinhlietsi_400k_lan4,self};
		{"Tích Nạp Sự Kiện 500k",self.thuongbinhlietsi_500k_lan4,self};
		{"Tích Nạp Sự Kiện 600k",self.thuongbinhlietsi_600k_lan4,self};
		{"Tích Nạp Sự Kiện 700k",self.thuongbinhlietsi_700k_lan4,self};
		{"Tích Nạp Sự Kiện 1000k",self.thuongbinhlietsi_1000k_lan4,self};
		{"Tích Nạp Sự Kiện 1500k",self.thuongbinhlietsi_1500k_lan4,self};
		{"Tích Nạp Sự Kiện 2000k",self.thuongbinhlietsi_2000k_lan4,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T7:tichluy_thang7_lan5() 
	local nDongRut = me.GetTask(9186,132)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n09/08-16/08<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.thuongbinhlietsi_100k_lan5,self};
		{"Tích Nạp Sự Kiện 200k",self.thuongbinhlietsi_200k_lan5,self};
		{"Tích Nạp Sự Kiện 300k",self.thuongbinhlietsi_300k_lan5,self};
		{"Tích Nạp Sự Kiện 400k",self.thuongbinhlietsi_400k_lan5,self};
		{"Tích Nạp Sự Kiện 500k",self.thuongbinhlietsi_500k_lan5,self};
		{"Tích Nạp Sự Kiện 600k",self.thuongbinhlietsi_600k_lan5,self};
		{"Tích Nạp Sự Kiện 700k",self.thuongbinhlietsi_700k_lan5,self};
		{"Tích Nạp Sự Kiện 1000k",self.thuongbinhlietsi_1000k_lan5,self};
		{"Tích Nạp Sự Kiện 1500k",self.thuongbinhlietsi_1500k_lan5,self};
		{"Tích Nạp Sự Kiện 2000k",self.thuongbinhlietsi_2000k_lan5,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T7:thuongbinhlietsi_100k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,133)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,133, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_200k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,134)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,134, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_300k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,135)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,135, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_400k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,136)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,136, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_500k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,137)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,137, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_600k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,138)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,138, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_700k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,139)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,139, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_1000k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,140)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,140, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 5\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_1500k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,141)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,141, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 5\nNhận được<color=gold>  :\n25 thất sắc hồn\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_2000k_lan5()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,142)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,132)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,142, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
me.AddStackItem(18,1,1327,13,nil,100)
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
 me.AddStackItem(18,1,2034,13,nil,5);--Lệnh bài gọi boss TDC
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 5\nNhận được<color=gold>  :\n5 Lệnh bài triệu hồi Boss Tiêu Dao Cốc\n25 thất sắc hồn\n100 MG Hòa Thị Ngọc (thô)\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 


function tbSuKien_NapTien_T7:thuongbinhlietsi_100k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,122)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,122, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_200k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,123)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,123, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_300k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,124)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,124, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_400k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,125)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,125, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_500k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,126)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,126, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_600k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,127)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,127, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_700k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,128)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,128, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_1000k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,129)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,129, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 4\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_1500k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,130)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,130, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 4\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_2000k_lan4()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,131)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,121)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,131, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
me.AddStackItem(18,1,1327,13,nil,100)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 4\nNhận được<color=gold>  :\n100 MG Hòa Thị Ngọc (thô)\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 


function tbSuKien_NapTien_T7:thuongbinhlietsi_100k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,111)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,111, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_200k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,112)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,112, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_300k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,113)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,113, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_400k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,114)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,114, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_500k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,115)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,115, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_600k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,116)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,116, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_700k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,117)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,117, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_1000k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,118)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,118, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 3\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_1500k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,119)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,119, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 3\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_2000k_lan3()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,120)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,110)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,120, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 3\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,100)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,100, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,101)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,101, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,102)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,102, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,103)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,103, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,104)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,104, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_600k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,105)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,105, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_700k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,106)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,106, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_1000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,107)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,107, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 2\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_1500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,108)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,108, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 2\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_2000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,109)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,99)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,109, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 2\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 


function tbSuKien_NapTien_T7:thuongbinhlietsi_100k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,89)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,89, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_200k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,90)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,90, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_300k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,91)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,91, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_400k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,92)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,92, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,93)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,93, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T7:thuongbinhlietsi_600k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,94)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,94, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_700k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,95)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,95, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T7:thuongbinhlietsi_1000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,96)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,96, nCount + 1);
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
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 1\nNhận được<color=gold>  :\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_1500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,97)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,97, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 1\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 

function tbSuKien_NapTien_T7:thuongbinhlietsi_2000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,98)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,88)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,98, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
me.AddStackItem(18,1,1303,1,nil,10)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Thương Binh Liệt Sị 27/7 Lần 1\nNhận được<color=gold>  :\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long\n50 Vật phẩm đua top tháng 6");
end 
