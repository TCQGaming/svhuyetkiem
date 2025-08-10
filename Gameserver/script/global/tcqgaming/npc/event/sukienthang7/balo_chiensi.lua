-----Dev : TCQGaming
-----Time : 14/07/2024 17:01 PM
local KnbBiz = Item:GetClass("balochiensi_thang7");

function KnbBiz:OnUse()	
local ngaunhien = MathRandom(1, 150)

if ngaunhien < 50 then 
    me.AddStackItem(18, 1, 1327, 7, {bForceBind=1}, 1)
elseif ngaunhien < 100 then  -- Điều kiện thứ hai nên là < 100
    me.AddStackItem(18, 1, 1327, 8, {bForceBind=1}, 1)
elseif ngaunhien <= 150 then  -- Điều kiện cuối cùng nên là <= 150
    me.AddStackItem(18, 1, 1327, 9, {bForceBind=1}, 1)
end

return 1;
end

