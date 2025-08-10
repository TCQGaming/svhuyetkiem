-----Dev : TCQGaming
local tbThienHoa = Item:GetClass("muoichinthang8");

function tbThienHoa:OnUse()	
local ngaunhien = MathRandom(1,200)
-- local tbItemId	= {18,1,2028,24,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9186,143)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã hát tối đa<color=yellow> 500 lần bài Mười Chín Tháng Tám <color>rồi<color>");
return 0
end
    local nNeedBag = 30;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},25)--25-Tiền Du Long
-- me.Msg("Bạn đã hát 50<color>");
end
if SoLuongSuDung == 100 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},25)--25-Tiền Du Long
-- me.Msg("Bạn đã hát 100<color>");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},25)--25-Tiền Du Long
-- me.Msg("Bạn đã hát 150<color>");
end
if SoLuongSuDung == 200 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},25)--25-Tiền Du Long
-- me.Msg("Bạn đã hát 200<color>");
end
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--50-Tiền Du Long
-- me.Msg("Bạn đã hát 300<color>");
end
if SoLuongSuDung == 400 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--50-Tiền Du Long
-- me.Msg("Bạn đã hát 400<color>");
end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--50-Tiền Du Long
me.AddExp(150000000);
me.AddStackItem(18,1,1303,1,nil,25)
me.AddStackItem(18,1,2030,6,nil,1)---Lá Cờ Kỹ Năng
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã ca bài ca Cách Mạng Tháng Tám 500 Lần xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Lá Cờ Kỹ Năng\n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long\n150 Triệu Kinh Nghiệm\n25 Rương Ngọc Vỡ Cấp 1");
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
me.SetTask(9186,143, DemSoLuong)
me.Msg("Bạn đã ca <color=gold>"..DemSoLuong.." lần bài Mười Chín Tháng Tám<color>");
-- Task:DelItem(me, tbItemId, 1);
return 1;
end


