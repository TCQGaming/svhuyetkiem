--Valentine _ 2024
--TCQGaming - 15/02/2024

local tbItem = Item:GetClass("chocolate_thuong");

tbItem.Level_Exp = 119;

function tbItem:OnUse()

	if me.nFightState ~= 0 then
		me.Msg("Chỉ sử dụng trong thôn trấn hoặc thành thị");
		return 0;
	end	
		local nNguyenLieu = {
24,
25,
}

local ngaunhien = MathRandom(1,200)
local SoLuongSuDung = me.GetTask(9178,118)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã sử dụng<color=yellow>tối đa 500 Chocolate Thường<color> rồi<color>");
return 0
end
    local nNeedBag = 15;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 50<color>");
end
if SoLuongSuDung == 100 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 100<color>");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 150<color>");
end
if SoLuongSuDung == 200 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 200<color>");
end
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
end
if SoLuongSuDung == 400 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
me.AddExp(500000000);
me.AddStackItem(18,1,2034,37,nil,1)---Bánh tét Kỹ Năng
me.AddStackItem(18,1,2034,13,nil,2)---Lệnh bài boss tdc
me.AddStackItem(22,1,81,1,nil,1);--Tần lăng hòa thị ngọc thô
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã sử dụng Chocolate Thường 500 Lần xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Bánh Tét Kỹ Năng\n1 Hòa Thị Ngọc(thô)\n2 Lệnh Bài Triệu Hồi Boss TDC\n1 Huyền Tinh Cấp 8\n1Huyền Tinh Cấp 9\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n500 Triệu Kinh Nghiệm");
end
if ngaunhien == 1 then
me.AddStackItem(18,1,114,3,{bForceBind=1},1)
	-- me.Msg("Bạn nhận được <color=gold>1 mảnh vũ khí đồng hành<color>");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
	-- me.Msg("Bạn nhận được <color=gold>1 mảnh áo đồng hành<color>");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
	-- me.Msg("Bạn nhận được <color=gold>1 mảnh nhẫn đồng hành<color>");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
	-- me.Msg("Bạn nhận được <color=gold>1 mảnh tay đồng hành<color>");
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9178,118, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." lần Chocolate Thường<color>");
return 1;-----Xóa vật phẩm sau khi sử dụng
end