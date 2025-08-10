-- date:24/07/2018
-- by:iDoctor
-------------------------------------------------------
local tbThuongHoi ={};
SpecialEvent.ThuongHoi= tbThuongHoi;
tbThuongHoi.Num_Coin = 10005;
tbThuongHoi.Num_Lenh = 2000;

function tbThuongHoi:OnDialog()
    if me.CountFreeBagCell() < 5 then
        local szAnnouce = "Hành trang không đủ <color=yellow> 5 ô trống<color>";
		Dialog:SendBlackBoardMsg(me, szAnnouce);
        return 0;    
    end

	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
        return 0;    
	end

	local szMsg = "Chọn vật phẩm muốn mua";
	local tbOpt = 
	{ 
						-- if (me.szAccount == "xboyhd")  then
		-- {"Cửa tiệm mua <color=red>KHÔNG ĐƯỢC UY DANH<color>",self.menukouyd,self},
		-- end
		{"Cửa tiệm mua <color=red>Lệnh Bài Thương Hội<color>",self.menulenhbai,self},
		-- {"Mua <color=yellow>Lệnh bài Bạch Hổ Đường (Sơ)<color>",self.buybhdsmall,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThuongHoi:menulenhbai()
	local szMsg = "Giá 1 Lệnh Bài : \n<color=yellow>Tống Kim Thống Lĩnh Phó Tướng<color> : 5000 Đồng\n<color=yellow>Đại Tướng <color>: 3 Vạn Đồng<color>\n<color=yellow>Tiêu Dao Cốc<color> : 2000 Đồng\n<color=yellow>Bạch Hổ Đường 1 2 3<color> : 2000 Đồng\n<color=yellow>Nghĩa Quân<color> : 2000 Đồng\n<color=yellow>Thi Đấu Môn Phái <color>: 5000 Đồng\n<color=yellow>Bạch Hổ Đường Sơ <color>: 5000 Đồng<color=yellow>\nGia Tộc Sơ :<color>5000 Đồng ?";
	local tbOpt = 
	{
		{"Lệnh bài Tống Kim",self.menutongkim1,self},
		{"Lệnh bài Tiêu Dao Cốc",self.menutieudao,self},
		{"Lệnh bài Bạch Hổ Đường",self.menubhd,self},
		{"Lệnh bài Nghĩa Quân",self.menunghiaquan,self},
		{"Lệnh bài Thi Đấu Môn Phái",self.thidaumonphai,self},
		{"Lệnh bài Gia Tộc Sơ",self.giatocso,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThuongHoi:menubhd()
	local szMsg = "Bạn muốn mua bao nhiêu <color=yellow>Cứ gặp ta <color> ?";
	local tbOpt = 
	{
		{"Lệnh bài Bạch Hổ Đường Sơ",self.bhdsone,self},
		{"Lệnh bài Bạch Hổ Đường Cấp 1",self.bhd1,self},
		{"Lệnh bài Bạch Hổ Đường Cấp 2",self.bhd2,self},
		{"Lệnh bài Bạch Hổ Đường Cấp 3",self.bhd3,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThuongHoi:bhd1()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Bạch Hổ Đường Cấp 1<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.bhd1ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:bhd1ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,6,nil,3); --Lệnh Bài BHD 1
end
function tbThuongHoi:bhd2()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Bạch Hổ Đường Cấp 2<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.bhd2ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:bhd2ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,5,nil,3); --Lệnh Bài BHD 2
end
--
function tbThuongHoi:bhd3()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Bạch Hổ Đường Cấp 3<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.bhd3ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:bhd3ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,4,nil,3); --Lệnh Bài BHD 3
end
function tbThuongHoi:bhdso()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Bạch Hổ Đường Cấp 3<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.bhd3ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:bhdsone()
if me.CountFreeBagCell() < 50 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 50 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,111,1) -- BHĐ Sơ
if nCount < 5000 then
	Dialog:Say("Bạn không có đủ ít nhất 5000 đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
-- local Check = nCount/5000
Dialog:AskNumber("Số lượng đổi", 50, self.muaslbhd, self);
end
 
function tbThuongHoi:muaslbhd(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*5000) then
	Dialog:Say("Để mua được "..szSoDong.." Lệnh Bài BHĐ Sơ bạn cần có thêm ".. szSoDong*5000 - nCount .."<color> Đồng)")
	return
	end
	me.AddStackItem(18,1,111,1,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*5000))
end
---------
function tbThuongHoi:menunghiaquan()
if me.CountFreeBagCell() < 50 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 50 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,84,1) -- LB nghĩa quân
if nCount < 2000 then
	Dialog:Say("Bạn không có đủ ít nhất 2000 đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
Dialog:AskNumber("Số lượng đổi", 50, self.lbnghiaquan1, self);
end
 
function tbThuongHoi:lbnghiaquan1(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*2000) then
	Dialog:Say("Để mua được "..szSoDong.." Lệnh Bài Nghĩa Quân bạn cần có thêm ".. szSoDong*2000 - nCount .."<color> Đồng)")
	return
	end
	me.AddStackItem(18,1,84,1,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*2000))
end
----
function tbThuongHoi:thidaumonphai()
if me.CountFreeBagCell() < 50 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 50 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,81,1) -- LB nghĩa quân
if nCount < 5000 then
	Dialog:Say("Bạn không có đủ ít nhất 5000 đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
Dialog:AskNumber("Số lượng đổi", 50, self.thidaumonphai1, self);
end
 
function tbThuongHoi:thidaumonphai1(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*5000) then
	Dialog:Say("Để mua được "..szSoDong.." Lệnh Bài Thi Đấu Môn Phái Sơ bạn cần có thêm ".. szSoDong*5000 - nCount .."<color> Đồng)")
	return
	end
	me.AddStackItem(18,1,81,1,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*5000))
end

--
function tbThuongHoi:giatocso()
if me.CountFreeBagCell() < 50 then
me.Msg("Túi của bạn đã đầy, cần ít nhất 50 ô trống.");
return 0;
end
local nCount = me.GetJbCoin()
local nDaiKim = me.GetItemCountInBags(18,1,110,1) -- LB nghĩa quân
if nCount < 5000 then
	Dialog:Say("Bạn không có đủ ít nhất 5000 đồng thường rồi \n hãy mang nó tới đây gặp ta")
return 
end
Dialog:AskNumber("Số lượng đổi", 50, self.giatocso1, self);
end
 
function tbThuongHoi:giatocso1(szSoDong)
	local nCount = me.GetJbCoin()
	if nCount < (szSoDong*5000) then
	Dialog:Say("Để mua được "..szSoDong.." Lệnh Bài Gia Tộc Sơ bạn cần có thêm ".. szSoDong*5000 - nCount .."<color> Đồng)")
	return
	end 
	me.AddStackItem(18,1,110,1,nil,szSoDong)
	me.AddJbCoin(-1*(szSoDong*5000))
end

function tbThuongHoi:menutieudao()
	local szMsg = "Bạn muốn mua bao nhiêu <color=yellow>Cứ gặp ta <color> ?";
	local tbOpt = 
	{
		{"Lệnh bài Tiêu Dao Cốc Cấp 2",self.tdc2,self},
		{"Lệnh bài Tiêu Dao Cốc Cấp 3",self.tdc3,self},
		{"Lệnh bài Tiêu Dao Cốc Cấp 4",self.tdc4,self},
		{"Lệnh bài Tiêu Dao Cốc Cấp 5",self.tdc5,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThuongHoi:tdc2()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Tiêu Dao Cốc Cấp 2<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.tdc2ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:tdc2ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,10,nil,3); -- TIêu Dao Cốc 2
end
function tbThuongHoi:tdc3()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Tiêu Dao Cốc Cấp 3<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.tdc3ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:tdc3ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,9,nil,3); --TIêu Dao Cốc 3
end
function tbThuongHoi:tdc4()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Tiêu Dao Cốc Cấp 4<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.tdc4ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:tdc4ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,8,nil,3); --TIêu Dao Cốc 4
end
function tbThuongHoi:tdc5()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 6000 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Tiêu Dao Cốc Cấp 5<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.tdc5ne,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:tdc5ne()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 6000) then
	Dialog:Say("Bạn không đủ <color=yellow> 6000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-6000);
  me.AddStackItem(18,1,289,7,nil,3); --TIêu Dao Cốc 5
end
function tbThuongHoi:photuong()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 2 Vạn Đồng Thường<color> để mua <color=yellow>2 Lệnh Bài Phó Tướng<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.photuong1,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:menutongkim1()
	local szMsg = "Bạn muốn mua bao nhiêu <color=yellow>Cứ gặp ta <color> ?";
	local tbOpt = 
	{
		{"Lệnh bài Thống Lĩnh",self.thonglinh,self},
		{"Lệnh bài Phó Tướng",self.photuong,self},
		{"Lệnh bài Đại Tướng",self.daituong,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbThuongHoi:thonglinh()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 1 Vạn 5 Đồng Thường<color> để mua <color=yellow>3 Lệnh Bài Thống Lĩnh<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.thonglinh1,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:thonglinh1()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 15000) then
	Dialog:Say("Bạn không đủ <color=yellow> 15000 Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-15000);
	me.AddStackItem(18,1,289,3,nil,3); --thống lĩnh 
end
function tbThuongHoi:photuong()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 2 Vạn Đồng Thường<color> để mua <color=yellow>2 Lệnh Bài Phó Tướng<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.photuong1,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:photuong1()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 20000) then
	Dialog:Say("Bạn không đủ <color=yellow> 2 Vạn Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-20000);
  me.AddStackItem(18,1,289,2,nil,2);-- phó tướng
end
function tbThuongHoi:daituong()
 	local szMsg = "Bạn có chắc chắn muốn tiêu hao <color=yellow> 3 Vạn Đồng Thường<color> để mua <color=yellow>1 Lệnh Bài Đại Tướng<color> không ?";
	local tbOpt = 
	{
		{"Đồng ý",self.daituong1,self},
		{"Hiện tại ta chưa muốn"},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbThuongHoi:daituong1()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 10000) then
	Dialog:Say("Bạn không đủ <color=yellow> 1 Vạn Đồng Thường<color>");
    return 0; 
	end
	me.AddJbCoin(-10000);
  me.AddStackItem(18,1,289,1,nil,1);-- Đại tướng TK
end