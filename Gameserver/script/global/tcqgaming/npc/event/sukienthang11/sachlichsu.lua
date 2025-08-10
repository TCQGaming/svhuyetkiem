-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local tbBoHongDo = Item:GetClass("sachlichsu_tcq_20_11");
tbBoHongDo.Level_Exp = 129;
function tbBoHongDo:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang11\\sachlichsu.lua");
	if me.nFightState ~= 0 then
		me.Msg("Chỉ đọc trong thôn trấn hoặc thành thị");
		return 0;
	end	
	if me.CountFreeBagCell() < 4 then
		local szAnnouce = "Hành trang của bạn không đủ 4 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	
	
local ngaunhien = MathRandom(1,200)
local ngaunhientiendulong = MathRandom(1,5)
	local tbItemId	= {18,1,2033,5,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9170,83)

if SoLuongSuDung >= 1000 then 
me.Msg("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc tối đa<color=yellow> 1000 Sách Lịch Sử <color>rồi<color>");
return 0
end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc <color=yellow>Sách Lịch Sử<color> 50 lần <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 6\n15 Vạn Bạc Khóa\n15 Vạn Đồng Khóa");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc <color=yellow>Sách Lịch Sử<color> 150 lần <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 6\n15 Vạn Bạc Khóa\n15 Vạn Đồng Khóa");
end
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc <color=yellow>Sách Lịch Sử<color> 300 lần <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 7\n15 Vạn Bạc Khóa\n15 Vạn Đồng Khóa");
end
if SoLuongSuDung == 500 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(30*10000);	-- 15v đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc <color=yellow>Sách Lịch Sử<color> 500 lần <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Vạn Bạc Khóa\n30 Vạn Đồng Khóa");
end

if SoLuongSuDung == 700 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(30*10000);	-- 15v đồng khóa
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đọc <color=yellow>Sách Lịch Sử<color> 700 lần <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Vạn Bạc Khóa\n30 Vạn Đồng Khóa");
end

if SoLuongSuDung == 999 then
me.AddStackItem(18,1,114,10,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150*10000);	-- 150v đồng khóa
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,2033,7,{bForceBind=1},1)---Sao Chiến Thắng Tiềm Năng
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã đọc tối đa 1000 lần Sách Lịch Sử xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Sách Lịch Sử Tiềm Năng\n1 Huyền Tinh Cấp 10\n50 Vạn Bạc Khóa\n150 Vạn Đồng Khóa\n1 Bổ Tu Lệnh Khóa");


    -- Điều chỉnh tỷ lệ ngẫu nhiên
    local ngaunhienphanthuong = MathRandom(1,100) -- Sử dụng 1 đến 100 để dễ điều chỉnh tỷ lệ

    -- Bùa chuyển cường hóa (tỷ lệ 10%)
    if ngaunhienphanthuong <= 10 then 
        me.AddStackItem(18,1,1327,14,{bForceBind=1},1)---Bùa chuyển cường hóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được Bùa 1 lần chuyển cường hóa từ mốc phần thưởng 1000 Sách Lịch Sử\nPhần thưởng này là ngẫu nhiên");
    
    -- Huyền Tinh cấp 8 (tỷ lệ 20%)
    elseif ngaunhienphanthuong <= 30 then 
        me.AddStackItem(18,1,114,8,{bForceBind=1},1)
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 1 Huyền Tinh cấp 8 từ mốc phần thưởng 1000 Sách Lịch Sử\nPhần thưởng này là ngẫu nhiên");
    
    -- 50 vạn đồng khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 55 then 
        me.AddBindCoin(50*10000);	-- 50 vạn đồng khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn đồng khóa từ mốc phần thưởng 1000 Sách Lịch Sử\nPhần thưởng này là ngẫu nhiên");

    -- 50 vạn bạc khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 80 then 
        me.AddBindMoney(50*10000);---50v Bạc Khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn bạc khóa từ mốc phần thưởng 1000 Sách Lịch Sử\nPhần thưởng này là ngẫu nhiên");

    -- 300 Tiền Du Long (tỷ lệ 20%)
    else
        me.AddStackItem(18,1,553,1,{bForceBind=1},300)---Tiền Du Long
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 300 Tiền Du Long từ mốc phần thưởng 1000 Sách Lịch Sử\nPhần thưởng này là ngẫu nhiên");
    end 
end

if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>Sách Lịch Sử đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>Sách Lịch Sử đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 4");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>Sách Lịch Sử đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>Sách Lịch Sử đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 5 then
me.AddStackItem(18,1,553,1,{bForceBind=1},ngaunhientiendulong)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đọc <color=yellow>Sách Lịch Sử đã may mắn nhận được<color><color=gold>\n "..ngaunhientiendulong.." Tiền Du Long");
end

if me.nLevel < self.Level_Exp then
me.AddExp(1000000);-----1tr Exp
end

me.AddStackItem(18,1,553,1,{bForceBind=1},3)---Tiền Du Long

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9170,83, DemSoLuong)
me.Msg("Bạn đã đọc <color=gold>"..DemSoLuong.." Sách Lịch Sử<color>");
Task:DelItem(me, tbItemId, 1);
end

