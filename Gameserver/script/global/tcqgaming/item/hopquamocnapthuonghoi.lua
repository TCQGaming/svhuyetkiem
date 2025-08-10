-----Dev : TCQGaming
-----Time : 17/07/2025 2:38 PM
local KnbBiz = Item:GetClass("hop_moc_nap_thuonghoi");

function KnbBiz:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\item\\hopquamocnapthuonghoi.lua");

		 	local TichNap = me.GetTask(3028,1)
me.SetTask(3028,1,TichNap + 150)
me.Msg("Bạn vừa nhận thêm 150 vạn đồng tích nạp mốc \nNâng tổng mốc nạp thành "..TichNap.." vạn đồng")
return 1;-----Xóa vật phẩm sau khi sử dụng
end

