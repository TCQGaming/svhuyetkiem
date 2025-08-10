-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("sachdialy_tcq_20_11");

function KnbBiz:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang11\\sachdialy.lua");
	if me.nFightState ~= 0 then
		me.Msg("Chỉ sử dụng trong thôn trấn hoặc thành thị");
		return 0;
	end	
	if me.CountFreeBagCell() < 4 then
		local szAnnouce = "Hành trang của bạn không đủ 4 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	


local ngaunhien = MathRandom(1,200)
	local tbItemId	= {18,1,2033,6,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9170,84)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã đọc<color=yellow>tối đa 500 Sách Địa Lý<color>rồi<color>");
return 0
end
    local nNeedBag = 10;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(50*10000);---50vBạc Khóa
me.AddBindCoin(150*10000);	-- 15v đồng khóa
me.AddExp(150000000);
me.AddStackItem(18,1,2033,8,nil,1)---Sách Địa Lý Kỹ Năng
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã Đọc Sách Địa Lý 500 Lần xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Sách Địa Lý Kỹ Năng\n1 Huyền Tinh Cấp 8\n50 Van Bạc Khóa\n150 Vạn Đồng Khóa\n150 Triệu Kinh Nghiệm");
end

me.AddStackItem(18,1,553,1,{bForceBind=1},1)--1-Tiền Du Long

if ngaunhien == 1 then
me.AddStackItem(18,1,114,3,{bForceBind=1},1)
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9170,84, DemSoLuong)
me.Msg("Bạn đã đọc <color=gold>"..DemSoLuong.." Sách Địa Lý<color>");
return 1;
end

