-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("ruongnguyenlieucachmangthang8");

function KnbBiz:OnUse()	

local ngaunhien = MathRandom(1,100)

if ngaunhien < 50 then 
me.AddStackItem(18,1,2030,1,{bForceBind=1},1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,2030,2,{bForceBind=1},1)
end
return 1;
end

