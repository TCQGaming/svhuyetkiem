-----Dev : TCQGaming
-----Time : 28/12/2023 10:38 PM
local KnbBiz = Item:GetClass("tuinguyenlieu_tetamlich");

function KnbBiz:OnUse()	
	-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\tuinguyenlieu.lua");
	if me.CountFreeBagCell() < 5 then
		local szAnnouce = "Hành trang của bạn không đủ 5 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	

local ngaunhien = MathRandom(1,200)
local tbItemId	= {18,1,2034,14,0,0};  -- Gio hoa
if ngaunhien < 50 then 
me.AddStackItem(18,1,2034,15,nil,1)
elseif ngaunhien < 100 then 
me.AddStackItem(18,1,2034,16,nil,1)
elseif ngaunhien < 150 then 
me.AddStackItem(18,1,2034,17,nil,1)
elseif ngaunhien < 200 then 
me.AddStackItem(18,1,2034,18,nil,1)
end
return 1;-----Xóa vật phẩm sau khi sử dụng
end

