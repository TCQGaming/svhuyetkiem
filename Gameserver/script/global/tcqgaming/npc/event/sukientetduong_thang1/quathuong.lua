--Pháo Hoa Quốc Khánh
--TCQGaming - 28/8/2023

local tbItem = Item:GetClass("quathuong_tetduong");

tbItem.Level_Exp = 109;

function tbItem:OnUse()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukientetduong_thang1\\quathuong.lua");
	
	if me.nFightState ~= 0 then
		me.Msg("Chỉ sử dụng trong thôn trấn hoặc thành thị");
		return 0;
	end	

local ngaunhien = MathRandom(1,200)
	-- local tbItemId	= {18,1,2034,2,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9178,28)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã sử dụng<color=yellow>tối đa 500 Hộp Quà Tết Dương Thường<color>rồi<color>");
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
-- me.Msg("Bạn đã sử dụng 300<color>");
end
if SoLuongSuDung == 400 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 400<color>");
end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
me.AddExp(150000000);
me.AddStackItem(18,1,2034,7,nil,1)---Pháo Kỹ Năng
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã sử dụng Hộp Quà Tết Dương Thường 500 Lần xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Pháo Tết 2025 Kỹ Năng\n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n150 Triệu Kinh Nghiệm");
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
me.SetTask(9178,28, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." lần Hộp Quà Tết Dương Thường<color>");
-- Task:DelItem(me, tbItemId, 1);
return 1;-----Xóa vật phẩm sau khi sử dụng
end
