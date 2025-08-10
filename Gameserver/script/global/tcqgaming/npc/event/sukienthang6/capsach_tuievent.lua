-----Dev : TCQGaming
-----Time : 14/06/2023 3:53 PM
local KnbBiz = Item:GetClass("capsach_thang6");

function KnbBiz:OnUse()	
local ngaunhien = MathRandom(1,100)

if ngaunhien < 50 then 
me.AddStackItem(18,1,1327,2,{bForceBind=1},1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,1327,3,{bForceBind=1},1)
end
return 1;
end

