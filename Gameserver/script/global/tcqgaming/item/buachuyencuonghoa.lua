-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("buachuyencuonghoatcq");

function KnbBiz:OnUse()	
local nCount = me.GetTask(3130,1)
me.SetTask(3130,1,nCount + 1)
me.Msg("Bạn nhận được <color=gold>1 lượt chuyển cường hóa<color>");
return 1;-----Xóa vật phẩm sau khi sử dụng
end

