-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("hop_moc_nap");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\hopquamocnap.lua");

		 	local TichNap = me.GetTask(3028,1)
me.SetTask(3028,1,TichNap + 100)
me.Msg("Bạn vừa nhận thêm 100 vạn đồng tích nạp mốc \nNâng tổng mốc nạp thành "..TichNap.." vạn đồng")
return 1;-----Xóa vật phẩm sau khi sử dụng
end

