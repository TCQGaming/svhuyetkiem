-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("hop_trung_rong");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\hopqua_trungrong.lua");
-- local tbItemId	= {18,1,2033,11,0,0};  -- Rương bạc
me.AddStackItem(18,1,20400,1,{bForceBind = 1},10);---Trứng Rồng
me.Msg("Bạn nhận được <color=gold>10 Trứng Rồng<color>");
-- Task:DelItem(me, tbItemId, 1); 
return 1;-----Xóa vật phẩm sau khi sử dụng
end

