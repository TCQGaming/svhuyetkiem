-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("tuinguyenlieumuahe");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienmuahe\\tuinguyenlieu.lua");
local ngaunhien = MathRandom(1,100)
local tbItemId	= {18,1,2027,1,0,0};  -- Gio hoa
if ngaunhien < 50 then 
me.AddStackItem(18,1,2027,2,{bForceBind=1},1)
else 
me.AddStackItem(18,1,2027,3,{bForceBind=1},1)
end
Task:DelItem(me, tbItemId, 1);
end

