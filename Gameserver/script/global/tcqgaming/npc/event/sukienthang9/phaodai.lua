--Pháo Hoa Quốc Khánh
--TCQGaming - 28/8/2023

local tbItem = Item:GetClass("phaodai");

tbItem.nSkillBuffId 	= 1331;	--skill phao hoa
tbItem.nLastTime 		= 3 * 60 * Env.GAME_FPS	--thoi gian cho phep dot lan 2
tbItem.nDelay = 0.5 * Env.GAME_FPS;	--thoi gian chay cay %
tbItem.Level_Exp = 119;
-- function tbItem:InitGenInfo()
	--set mac dinh 1 phao hoa ton tai trong 24h
	-- it.SetTimeOut(0, (GetTime() + 24 * 3600));
	-- return	{ };
-- end

local tbEvent = 
{
	Player.ProcessBreakEvent.emEVENT_MOVE,
	Player.ProcessBreakEvent.emEVENT_ATTACK,
	Player.ProcessBreakEvent.emEVENT_SITE,
	Player.ProcessBreakEvent.emEVENT_USEITEM,
	Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
	Player.ProcessBreakEvent.emEVENT_DROPITEM,
	Player.ProcessBreakEvent.emEVENT_SENDMAIL,
	Player.ProcessBreakEvent.emEVENT_TRADE,
	Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
	Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	Player.ProcessBreakEvent.emEVENT_LOGOUT,
	Player.ProcessBreakEvent.emEVENT_DEATH,
}

function tbItem:OnUse()
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang9\\phaodai.lua");
	
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
local ngaunhientiendulong = MathRandom(1,5)
	local tbItemId	= {18,1,2030,11,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9170,33)

if SoLuongSuDung >= 1000 then 
me.Msg("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt tối đa<color=yellow> 1000 Pháo Đại Quốc Khánh <color>rồi<color>");
return 0
end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow>Pháo Đại Quốc Khánh<color> 50 lần <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow>Pháo Đại Quốc Khánh<color> 150 lần<color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end 
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow>Pháo Đại Quốc Khánh<color> 300 lần<color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");
end
if SoLuongSuDung == 500 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(450000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow> Pháo Đại Quốc Khánh<color> 500 lần<color=gold>\nPhần Thường : \n4 Huyền Tinh Cấp 7\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n50 Tiền Du Long");

end
if SoLuongSuDung == 600 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow> Pháo Đại Quốc Khánh<color> 600 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 700 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow> Pháo Đại Quốc Khánh<color> 700 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 800 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow> Pháo Đại Quốc Khánh<color> 800 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 900 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow> Pháo Đại Quốc Khánh<color> 900 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 999 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(1500000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},800)---Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,2030,16,{bForceBind=1},1)---Sao Chiến Thắng Tiềm Năng
-- me.Msg("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã đốt <color=yellow>1000 Pháo Đại Quốc Khánh<color> <color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n1 Bổ Tu Lệnh Khóa");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã đốt tối đa 1000 lần Pháo Đại Quốc Khánh xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Sao Tiềm Năng\n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long\n1 Bổ Tu Lệnh Khóa");
end

if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đốt <color=yellow>Pháo Đại Quốc Khánh đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đốt <color=yellow>Pháo Đại Quốc Khánh đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 4");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đốt <color=yellow>Pháo Đại Quốc Khánh đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đốt <color=yellow>Pháo Đại Quốc Khánh đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 5 then
me.AddStackItem(18,1,553,1,{bForceBind=1},ngaunhientiendulong)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã đốt <color=yellow>Pháo Đại Quốc Khánh đã may mắn nhận được<color><color=gold>\n "..ngaunhientiendulong.." Tiền Du Long");
end

if me.nLevel < self.Level_Exp then
me.AddExp(1000000);-----5tr Exp
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9170,33, DemSoLuong)
me.Msg("Bạn đã đốt <color=gold>"..DemSoLuong.." Pháo Đại Quốc Khánh<color>");
Task:DelItem(me, tbItemId, 1);
me.CastSkill(391, 1, -1, me.GetNpc().nIndex);
me.CastSkill(self.nSkillBuffId, 1, -1, me.GetNpc().nIndex);
end
