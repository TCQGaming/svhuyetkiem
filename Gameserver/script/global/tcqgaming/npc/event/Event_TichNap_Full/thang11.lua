-- date:17/05/2024
-- by:TCQGaming
-------------------------------------------------------
local tbSuKien_NapTien_T11 ={};
SpecialEvent.SuKienT11= tbSuKien_NapTien_T11;


function tbSuKien_NapTien_T11:OnDialog()
	local szMsg = "<color=yellow>Sự Kiện Tháng 11<color>";
	local nLan = Config_Event_Bank.Thang8
	    local tbOpt =     {} 
		if nLan == 1 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt Nam 29/10-29/11<color>" , self.tichluy_lan1, self});
		elseif nLan == 2 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt Nam Lần 2 - 23/08-30/08<color>" , self.tichluy_lan2, self});
		elseif nLan == 3 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt NamLần 3 - 26/07-01/08<color>" , self.tichluy_lan3, self});
		elseif nLan == 4 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt NamLần 4 - 02/08-09/08<color>" , self.tichluy_lan4, self});
		elseif nLan == 5 then 
					table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt NamLần 5 - 09/08-16/08<color>" , self.tichluy_lan5, self});
		end 
		------Dành cho người chơi muốn mua lại event-------
if (me.szAccount == "xboyhddddddddd")  then
				table.insert(tbOpt, {"<color=yellow>Tích Lũy Thẻ Nạp Sự Kiện Nhà Giáo Việt NamLần 3 - 26/07-01/08<color>" , self.tichluy_lan3, self});

end 
-----------------------------------------------------------------------------------------
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end		

function tbSuKien_NapTien_T11:tichluy_lan1() 
	local nDongRut = me.GetTask(9186,167)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n29/10-29/11<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan1,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan1,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan1,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan1,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan1,self};
		{"Tích Nạp Sự Kiện 600k",self.CachMangThang8_600k_lan1,self};
		{"Tích Nạp Sự Kiện 700k",self.CachMangThang8_700k_lan1,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan1,self};
		{"Tích Nạp Sự Kiện 1500k",self.CachMangThang8_1500k_lan1,self};
		{"Tích Nạp Sự Kiện 2000k",self.CachMangThang8_2000k_lan1,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbSuKien_NapTien_T11:tichluy_lan2() 
	local nDongRut = me.GetTask(9186,156)
	local szMsg = "Tổng tích lũy nạp sự kiện từ ngày<color=gold>\n23/08-30/08<color> của bạn hiện tại là: <color=yellow>"..nDongRut.." vạn đồng<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Tích Nạp Sự Kiện 100k",self.CachMangThang8_100k_lan2,self};
		{"Tích Nạp Sự Kiện 200k",self.CachMangThang8_200k_lan2,self};
		{"Tích Nạp Sự Kiện 300k",self.CachMangThang8_300k_lan2,self};
		{"Tích Nạp Sự Kiện 400k",self.CachMangThang8_400k_lan2,self};
		{"Tích Nạp Sự Kiện 500k",self.CachMangThang8_500k_lan2,self};
		{"Tích Nạp Sự Kiện 600k",self.CachMangThang8_600k_lan2,self};
		{"Tích Nạp Sự Kiện 700k",self.CachMangThang8_700k_lan2,self};
		{"Tích Nạp Sự Kiện 1000k",self.CachMangThang8_1000k_lan2,self};
		{"Tích Nạp Sự Kiện 1500k",self.CachMangThang8_1500k_lan2,self};
		{"Tích Nạp Sự Kiện 2000k",self.CachMangThang8_2000k_lan2,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbSuKien_NapTien_T11:CachMangThang8_100k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,168)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,168, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},3)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end

function tbSuKien_NapTien_T11:CachMangThang8_200k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,169)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,169, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},3)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end
function tbSuKien_NapTien_T11:CachMangThang8_300k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,170)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,170, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end
function tbSuKien_NapTien_T11:CachMangThang8_400k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,171)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,171, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end
function tbSuKien_NapTien_T11:CachMangThang8_500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,172)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,172, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end
function tbSuKien_NapTien_T11:CachMangThang8_600k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,173)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,173, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
 tbSuKien_NapTien_T11:tichluy_lan1() 
end

function tbSuKien_NapTien_T11:CachMangThang8_700k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,174)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,174, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
	me.AddStackItem(18,1,1875,1,nil,30);
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 700k Sự Kiện Nhà Giáo Việt Nam Lần 1\nNhận được<color=gold>  :\n1 Huyền Tinh Cấp 7\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Bổ Tu Lệnh\n30 Rương trang bị đồng hành");
 tbSuKien_NapTien_T11:tichluy_lan1() 
end

function tbSuKien_NapTien_T11:CachMangThang8_1000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,175)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,175, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,2029,1,{bForceBind=1},1)--VLMT Cao
me.AddStackItem(18,1,2029,2,{bForceBind=1},1)--TTK Cao
me.AddStackItem(18,1,2030,8,nil,1)--Tín vật minh chủ
	me.AddStackItem(18,1,1875,1,nil,30);
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Nhà Giáo Việt Nam Lần 1\nNhận được<color=gold>  :\n1 Huyền Tinh Cấp 8\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Cao\n30 Rương trang bị đồng hành");
 tbSuKien_NapTien_T11:tichluy_lan1() 
end 

function tbSuKien_NapTien_T11:CachMangThang8_1500k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,176)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,176, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,30);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Nhà Giáo Việt Nam Lần 1\nNhận được<color=gold>  :\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n30 Rương trang bị đồng hành");
 tbSuKien_NapTien_T11:tichluy_lan1() 
end 

function tbSuKien_NapTien_T11:CachMangThang8_2000k_lan1()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,177)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,167)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,177, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,30);----ruongw tb dong hanh
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Nhà Giáo Việt Nam Lần 1\nNhận được<color=gold>  :\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n30 Rương trang bị đồng hành");
 tbSuKien_NapTien_T11:tichluy_lan1() 
end 


function tbSuKien_NapTien_T11:CachMangThang8_100k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,157)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 50 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,157, nCount + 1);
me.AddStackItem(18,1,114,5,{bForceBind=1},5)
me.AddBindMoney(50000);---25v Bạc Khóa
me.AddBindCoin(150000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T11:CachMangThang8_200k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,158)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 200 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,158, nCount + 1);
me.AddStackItem(18,1,114,6,{bForceBind=1},15)
me.AddBindMoney(100000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T11:CachMangThang8_300k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,159)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 300 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,159, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T11:CachMangThang8_400k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,160)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 400 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,160, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},3)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--200-Tiền Du Long
end
function tbSuKien_NapTien_T11:CachMangThang8_500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,161)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,161, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},5)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end
function tbSuKien_NapTien_T11:CachMangThang8_600k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,162)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 600 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,162, nCount + 1);
me.AddStackItem(18,1,114,7,{bForceBind=1},6)
me.AddBindMoney(50000);---5v Bạc Khóa
me.AddBindCoin(15*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--200-Tiền Du Long
end

function tbSuKien_NapTien_T11:CachMangThang8_700k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,163)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 700 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,163, nCount + 1);
me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddStackItem(18,1,553,1,{bForceBind=1},250)--250-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddBindMoney(5*10000);---25v Bạc Khóa
me.AddBindCoin(30*10000);	-- 25v đồng khóa
end

function tbSuKien_NapTien_T11:CachMangThang8_1000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,164)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 1000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,164, nCount + 1);
-- me.AddStackItem(18,1,114,7,{bForceBind=1},4)
-- me.AddStackItem(18,1,114,8,{bForceBind=1},3)
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,2025,10,{bForceBind=1},10)--LB Đồ Hải Tặc cấp 1
me.AddStackItem(18,1,191,2,{bForceBind=1},1)--VLMT Trung
me.AddStackItem(18,1,192,2,{bForceBind=1},1)--TTK Trung
me.AddStackItem(18,1,2030,8,{bForceBind=1},1)--Tín vật minh chủ
me.AddStackItem(18,1,1327,13,nil,50)-- mảnh ghép hòa thị ngọc thô
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1000k Sự Kiện Nhà Giáo Việt Nam Lần 2\nNhận được<color=gold>  :\n50 MG Hòa Thị Ngọc thô\n10 Lệnh bài đồ hải tặc cấp 1\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Tín Vật Minh Chủ\n1 Cặp VLMT TTK Trung");
end 

function tbSuKien_NapTien_T11:CachMangThang8_1500k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,165)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 1500 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	me.SetTask(9186,165, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
me.AddStackItem(18,1,1327,13,nil,100)-- mảnh ghép hòa thị ngọc thô
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 1500k Sự Kiện Nhà Giáo Việt Nam Lần 2\nNhận được<color=gold>  :\n100 MG Hòa Thị Ngọc thô\n25 thất sắc hồn\n10 Rương Ngọc Cấp 1\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 

function tbSuKien_NapTien_T11:CachMangThang8_2000k_lan2()
	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local nCount = me.GetTask(9186,166)
	if nCount >= 1 then
		Dialog:Say(string.format("Đã nhận quà, sao lại đến nữa"));
		return 0;
	end

	local nCountt = me.GetTask(9186,156)
	if nCountt < 2000 then
		Dialog:Say(string.format("Chưa đạt điều kiện nhận phần thưởng này"));
		return 0;
	end
	local ChuyenCuongHoa = me.GetTask(3130,1)
	me.SetTask(3130,1,ChuyenCuongHoa + 1)
	me.SetTask(9186,166, nCount + 1);
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,2033,13,nil,10);
	me.AddStackItem(18,1,1875,1,nil,200);
me.AddBindMoney(5*10000);---5v Bạc Khóa
me.AddBindCoin(30*10000);	-- 30 đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--500-Tiền Du Long
me.AddStackItem(18,1,1303,1,nil,10)
me.AddStackItem(18,1,2026,1,nil,25)---Thất Sắc Hồn
 me.AddStackItem(18,1,2034,13,nil,5);--Lệnh bài gọi boss TDC
 me.AddStackItem(18,1,1327,13,nil,150)-- mảnh ghép hòa thị ngọc thô
 	me.AddStackItem(18,1,402,1,nil,500)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> nhận mốc tích lũy nạp thẻ 2000k Sự Kiện Nhà Giáo Việt Nam Lần 2\nNhận được<color=gold>  :\n500 Chân Nguyên Tu Luyện Đơn\n5 Lệnh bài triệu hồi Boss Tiêu Dao Cốc\n25 thất sắc hồn\n150 MG Hòa Thị Ngọc (thô)\n10 Rương Ngọc Cấp 1\n10 Lệnh bài vũ khí hải tặc\n1 lượt chuyền cường hóa\n1 Huyền Tinh 9\n5 Vạn Bạc Khóa\n30 Vạn Đồng Khóa\n200 Rương trang bị đồng hành\n500 Tiền Du Long");
end 
