-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("ruongvangtangbaodo");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\ruongvangtangbaodo.lua");
-- local tbItemId	= {18,1,290,3,0,0};  -- Rương vàng
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
me.Msg("Bạn nhận được <color=gold>1 viên Huyền Tinh 5<color>");
return 1;-----Xóa vật phẩm sau khi sử dụng
end

