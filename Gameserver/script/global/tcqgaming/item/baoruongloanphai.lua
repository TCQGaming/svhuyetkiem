-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("baoruongloanphai");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\baoruongloanphai.lua");
local ngaunhien = MathRandom(1,7)
-- local tbItemId	= {18,1,78,1,0,0};  -- Rương
if ngaunhien == 1 then
me.AddStackItem(18,1,81,1,{bForceBind=1},1)
elseif ngaunhien == 2 then
me.AddStackItem(18,1,81,2,{bForceBind=1},1)
elseif ngaunhien == 3 then
me.AddStackItem(18,1,81,3,{bForceBind=1},1)
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
elseif ngaunhien == 5 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
elseif ngaunhien == 6 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
elseif ngaunhien == 7 then
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
end
return 1;-----Xóa vật phẩm sau khi sử dụng
end

