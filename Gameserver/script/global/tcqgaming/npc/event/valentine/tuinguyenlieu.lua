-----Dev : TCQGaming
local KnbBiz = Item:GetClass("tuinguyenlieu_valentine");

function KnbBiz:OnUse()	
	if me.CountFreeBagCell() < 5 then
		local szAnnouce = "Hành trang của bạn không đủ 5 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	
   local nIndex = MathRandom(29,30)
	me.AddStackItem(18,1,2034,nIndex,nil,1)
return 1;-----Xóa vật phẩm sau khi sử dụng
end

