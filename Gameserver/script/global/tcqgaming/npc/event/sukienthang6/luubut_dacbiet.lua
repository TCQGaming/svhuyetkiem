-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local tbLuuBut = Item:GetClass("luubut_thang6");

tbLuuBut.Level_Exp = 99;

function tbLuuBut:OnUse()	
local ngaunhien = MathRandom(1,200)
local ngaunhientiendulong = MathRandom(1,5)
-- local tbItemId	= {18,1,2028,25,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9186,42)

if SoLuongSuDung >= 1000 then 
me.Msg("Bạn đã đọc tối đa<color=yellow> 1000 lần Lưu Bút <color>rồi<color>");
return 0
end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>50 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>150 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end 
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>300 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end
if SoLuongSuDung == 500 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>500 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n4 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");

end
if SoLuongSuDung == 600 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)---Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>600 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 700 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)---Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>700 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 800 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)---Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>800 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 900 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)---Tiền Du Long
me.Msg("Bạn đã đọc <color=yellow>600 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 999 then
me.AddStackItem(18,1,2033,9,nil,50)--VP Đua TOP
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},400)---Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
-- me.AddStackItem(18,1,2033,9,nil,20)---Đua TOP Tháng 12
me.Msg("Bạn đã đọc <color=yellow>1000 lần Lưu Bút<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n1 Bổ Tu Lệnh Khóa");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã đọc tối đa 1000 lần Lưu Bút xin chúc mừng<color>");
end

if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>lần Lưu Bút đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>lần Lưu Bút đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 4");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>lần Lưu Bút đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>lần Lưu Bút đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 5 then
me.AddStackItem(18,1,553,1,{bForceBind=1},ngaunhientiendulong)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>lần Lưu Bút đã may mắn nhận được<color><color=gold>\n "..ngaunhientiendulong.." Tiền Du Long");
end

if me.nLevel < self.Level_Exp then
me.AddExp(1000000);-----5tr Exp
end
local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9186,42, DemSoLuong)
me.Msg("Bạn đã đọc <color=gold>"..DemSoLuong.." lần Lưu Bút<color>");
-- Task:DelItem(me, tbItemId, 1);
return 1;
end

