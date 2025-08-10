-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("ruongdanguhanheventthang7");

function KnbBiz:OnUse()	
local ngaunhien = MathRandom(1,100)
local tbItemId	= {18,1,2028,26,0,0};  -- Gio hoa
if ngaunhien < 20 then 
me.AddStackItem(18,1,2028,19,{bForceBind=1},1)
elseif ngaunhien < 40 then 
me.AddStackItem(18,1,2028,20,{bForceBind=1},1)
elseif ngaunhien < 60 then 
me.AddStackItem(18,1,2028,21,{bForceBind=1},1)
elseif ngaunhien < 80 then 
me.AddStackItem(18,1,2028,22,{bForceBind=1},1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,2028,23,{bForceBind=1},1)
end
Task:DelItem(me, tbItemId, 1);
end

