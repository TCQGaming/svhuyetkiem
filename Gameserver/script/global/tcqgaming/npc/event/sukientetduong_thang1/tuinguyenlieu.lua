-----Dev : TCQGaming
-----Time : 28/12/2023 10:38 PM
local KnbBiz = Item:GetClass("tuinguyenlieu_tetduong");

function KnbBiz:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukiencachmangthang8\\ruongnguyenlieu.lua");
local ngaunhien = MathRandom(1,100)
local tbItemId	= {18,1,2034,3,0,0};  -- Gio hoa
if ngaunhien < 50 then 
me.AddStackItem(18,1,2034,4,nil,1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,2034,5,nil,1)
end
Task:DelItem(me, tbItemId, 1);
end

