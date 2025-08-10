-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("chethapcam");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienmuahe\\chethapcam.lua");
local ngaunhien = MathRandom(1,200)
local ngaunhienlbhaitac = MathRandom(1,3)
local nNgauNhienCapLB = MathRandom(10,12)
local ngaunhientiendulong = MathRandom(1,5)
local tbItemId	= {18,1,2027,5,0,0};  -- Chè thập cẩm
local SoLuongSuDung = me.GetTask(9161,1)

local nCap = 0
if nNgauNhienCapLB == 10 then
 nCap = 1
elseif nNgauNhienCapLB == 11 then
 nCap = 2
elseif nNgauNhienCapLB == 12 then
 nCap = 3
end

if SoLuongSuDung >= 1000 then 
me.Msg("Bạn đã sử dụng tối đa<color=yellow> 1000 Chè Thập Cẩm <color>rồi<color>");
return 0
end
    local nNeedBag = 90;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>50 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>150 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end 
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>300 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end
if SoLuongSuDung == 500 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>500 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end
if SoLuongSuDung == 600 then
me.AddStackItem(18,1,114,8,{bForceBind=1},2)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>600 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 700 then
me.AddStackItem(18,1,114,8,{bForceBind=1},2)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>700 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 800 then
me.AddStackItem(18,1,114,8,{bForceBind=1},2)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>800 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 900 then
me.AddStackItem(18,1,114,8,{bForceBind=1},2)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)--100-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>900 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 999 then
me.AddStackItem(18,1,114,9,{bForceBind=1},2)
me.AddBindMoney(150000);---15v bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},500)--100-Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,2026,1,{bForceBind=1},30)---Thất Sắc Hồn
me.AddStackItem(18,1,543,2,{bForceBind=1},1)---Sách Kinh nghiệm Đồng Hành truyền thuyết
me.AddStackItem(18,1,543,2,{bForceBind=1},1)---Sách Kinh nghiệm Đồng Hành truyền thuyết
me.AddStackItem(18,1,543,2,{bForceBind=1},1)---Sách Kinh nghiệm Đồng Hành truyền thuyết
me.AddStackItem(18,1,543,2,{bForceBind=1},1)---Sách Kinh nghiệm Đồng Hành truyền thuyết
me.AddStackItem(18,1,543,2,{bForceBind=1},1)---Sách Kinh nghiệm Đồng Hành truyền thuyết
me.AddStackItem(18,1,543,1,{bForceBind=1},40)---Sách Kinh nghiệm Đồng Hành
me.AddExp(200000000);-----200tr Exp
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>1000 Chè Thập Cẩm<color><color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 9\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n500 Tiền Du Long\n1 Bổ Tu Lệnh");
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>1000 Chè Thập Cẩm<color><color=gold>\nPhần Thưởng : \n 40 Sách EXP Đồng Hành\n5 Sách EXP Đồng Hành Truyền Thuyết\n30 Thất Sắc Hồn <color>");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận sử dụng tối đa 1000 Chè Thập Cẩm xin chúc mừng<color>");
end

if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Thập Cẩm đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Thập Cẩm đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 7");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Thập Cẩm đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Thập Cẩm đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 5 then
me.AddStackItem(18,1,553,1,{bForceBind=1},ngaunhientiendulong)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Thập Cẩm đã may mắn nhận được<color><color=gold>\n "..ngaunhientiendulong.." Tiền Du Long");
end


local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9161,1, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." Chè Thập Cẩm<color>");
Task:DelItem(me, tbItemId, 1);
end

