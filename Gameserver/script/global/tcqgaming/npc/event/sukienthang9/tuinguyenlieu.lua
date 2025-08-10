-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("tuinguyenlieu2thang9");

function KnbBiz:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukiencachmangthang8\\ruongnguyenlieu.lua");
local ngaunhien = MathRandom(1,100)
local tbItemId	= {18,1,2030,13,0,0};  -- Gio hoa
if ngaunhien < 50 then 
me.AddStackItem(18,1,2030,14,nil,1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,2030,15,nil,1)
end
Task:DelItem(me, tbItemId, 1);
end

