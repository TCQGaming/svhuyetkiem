-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("hop_dongbac_khoa");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\hopqua_dongbac_khoa.lua");
-- local tbItemId	= {18,1,2033,12,0,0};  -- Rương bạc
me.AddBindCoin(50*10000);---Đồng Khóa
me.AddBindMoney(50*10000);---Bạc Khóa
me.Msg("Bạn nhận được <color=gold>50 Vạn Đồng Khóa\n50 Vạn Bạc Khóa<color>");
-- Task:DelItem(me, tbItemId, 1); 
return 1;-----Xóa vật phẩm sau khi sử dụng
end

