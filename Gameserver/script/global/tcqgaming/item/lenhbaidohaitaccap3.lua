-----Dev : TCQGaming
-----Time : 07/04/2023 4:51 PM
local KnbBiz = Item:GetClass("lenhbaihaitaccap3");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\lenhbaidohaitaccap3.lua"); 
-- local tbItemId	= {18,1,2025,12,0,0};  -- Rương bạc
local ngaunhien = MathRandom(10,20)
local ngaunhien1 = MathRandom(300,500)
me.DropRateItem(Wanted.DROPRATE[95], ngaunhien, ngaunhien1, -1);
me.Msg("Bạn nhận được <color=gold>Trang Bị Hải Tặc Hãy Mau Lụm Hết kẻo kẻ khác lụm<color>");
-- Task:DelItem(me, tbItemId, 1); 
return 1;-----Xóa vật phẩm sau khi sử dụng
end