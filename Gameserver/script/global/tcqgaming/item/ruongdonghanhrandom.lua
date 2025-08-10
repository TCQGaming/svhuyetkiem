-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("ruongdonghanhrandom");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\ruongdonghanhrandom.lua");
local ngaunhien = MathRandom(1,10)

me.AddStackItem(18,1,1876,ngaunhien,{bForceBind=1},1)

return 1;-----Xóa vật phẩm sau khi sử dụng
end

