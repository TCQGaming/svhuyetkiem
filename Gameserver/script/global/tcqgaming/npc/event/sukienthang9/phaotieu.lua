--Pháo Hoa Quốc Khánh
--TCQGaming - 28/8/2023

local tbItem = Item:GetClass("phaotieu");

tbItem.nSkillBuffId 	= 1331;	--skill phao hoa
tbItem.Level_Exp = 119;
-- function tbItem:InitGenInfo()
	--set mac dinh 1 phao hoa ton tai trong 24h
	-- it.SetTimeOut(0, (GetTime() + 24 * 3600));
	-- return	{ };
-- end

function tbItem:OnUse()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang9\\phaotieu.lua");
	
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
	local tbItemId	= {18,1,2030,12,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9170,34)
if SoLuongSuDung >= 500 then 
me.Msg("Bạn đã đốt<color=yellow>tối đa 500 Pháo Tiểu Quốc Khánh<color>rồi<color>");
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
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 50<color>");
end
if SoLuongSuDung == 100 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 100<color>");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 150<color>");
end
if SoLuongSuDung == 200 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},50)--25-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 200<color>");
end
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 300<color>");
end
if SoLuongSuDung == 400 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
-- me.Msg("Bạn đã sử dụng 400<color>");
end
if SoLuongSuDung == 499 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--50-Tiền Du Long
me.AddExp(150000000);
me.AddStackItem(18,1,2030,17,{bForceBind=1},1)---Sao Chiến Thắng Kỹ Năng
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã đốt Pháo Tiểu Quốc Khánh 500 Lần xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Sao Chiến Thắng Kỹ Năng\n1 Huyền Tinh Cấp 8\n50 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n150 Triệu Kinh Nghiệm");
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
me.SetTask(9170,34, DemSoLuong)
me.Msg("Bạn đã đốt <color=gold>"..DemSoLuong.." lần Pháo Tiểu Quốc Khánh<color>");
Task:DelItem(me, tbItemId, 1);
		me.CastSkill(307, 1, -1, me.GetNpc().nIndex);
	me.CastSkill(self.nSkillBuffId, 1, -1, me.GetNpc().nIndex);
end
