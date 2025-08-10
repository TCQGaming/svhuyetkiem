-----Dev : TCQGaming
-----Time : 20/04/2024 2:42 PM
local KnbBiz = Item:GetClass("ruongmanhbikip150");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\KyNang150\\ruongmanhbikip150.lua");
local nNgauNhien = MathRandom(1,20)
  	me.AddStackItem(18,1,1321,2,nil,nNgauNhien)
return 1;-----Xóa vật phẩm sau khi sử dụng
end

