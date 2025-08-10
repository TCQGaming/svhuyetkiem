-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("hoptien_dulong");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\hopqua_tiendulong.lua");
-- local tbItemId	= {18,1,2033,10,0,0};  -- Rương bạc
me.AddStackItem(18,1,553,1,{bForceBind=1},1000)
me.Msg("Bạn nhận được <color=gold>1000 Tiền Du Long Khóa<color>");
-- Task:DelItem(me, tbItemId, 1); 
return 1;-----Xóa vật phẩm sau khi sử dụng
end

