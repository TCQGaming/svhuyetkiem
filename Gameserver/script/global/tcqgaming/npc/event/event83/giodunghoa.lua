-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("giohoahongtcq");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\npc\\event\\event83\\giodunghoa.lua");
local ngaunhien = MathRandom(1,5)
local nRandom = MathRandom(3,6)
local tbItemId	= {18,1,2023,2,0,0};  -- Gio hoa
if ngaunhien == 1 then
me.AddStackItem(18,1,2023,3,{bForceBind=1},1)
elseif ngaunhien == 2 then
me.AddStackItem(18,1,2023,4,{bForceBind=1},1)
elseif ngaunhien == 3 then
me.AddStackItem(18,1,2023,5,{bForceBind=1},1)
elseif ngaunhien == 4 then
me.AddStackItem(18,1,2023,6,{bForceBind=1},1)
elseif ngaunhien == 5 then
me.AddStackItem(18,1,2023,nRandom,{bForceBind=1},1)
end
	-- me.Msg("Bạn nhận được <color=gold>số ngẫu nhiên là "..ngaunhien.."<color>");
Task:DelItem(me, tbItemId, 1);
end

