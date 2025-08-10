-----Dev : TCQGaming
local KnbBiz = Item:GetClass("chedoden");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienmuahe\\chedoden.lua");
local ngaunhien = MathRandom(1,200)
local tbItemId	= {18,1,2027,4,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9161,2)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã sử dụng tối đa<color=yellow> 500 Chè Đỗ Đen<color>rồi<color>");
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
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>50 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 7\n100 Tiền Du Long ");
end
if SoLuongSuDung == 100 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>100 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 7\n100 Tiền Du Long");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>150 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 7\n100 Tiền Du Long");
end
if SoLuongSuDung == 200 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>200 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 7\n100 Tiền Du Long");
end
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},150)--50-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>300 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 9\n150 Tiền Du Long");
end
if SoLuongSuDung == 400 then
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},150)--50-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>400 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 9\n150 Tiền Du Long");
end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,9,{bForceBind=1},1)
me.AddStackItem(18,1,553,1,{bForceBind=1},150)--50-Tiền Du Long
me.AddExp(150000000);
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Bạn đã sử dụng <color=yellow>500 Chè Đỗ Đen<color><color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 9\n150 Tiền Du Long");
end
if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Đỗ Đen đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Đỗ Đen đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Đỗ Đen đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 7");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Chè Đỗ Đen đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9161,2, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." Chè Đỗ Đen<color>");
Task:DelItem(me, tbItemId, 1);
end

