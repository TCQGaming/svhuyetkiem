-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("ruongthietthaphuyenvu");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\ruongthietthaphuyenvu.lua");
-- local checkhv	= {18,1,2218,4,0,0}; 
me.AddStackItem(18,1,114,7,{bForceBind=1},1)
return 1;-----Xóa vật phẩm sau khi sử dụng
end

