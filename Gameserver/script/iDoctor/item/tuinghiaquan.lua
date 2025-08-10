local tbRuongDongKhoa= Item:GetClass("tuinghiaquan");
function tbRuongDongKhoa:OnUse()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(2024,89) < nDate then
		me.SetTask(2024,89, nDate);
		me.SetTask(2024,90, 0);
	end
	local nCount = me.GetTask(2024,90)
	if nCount >= 6 then
	me.Msg("Mỗi ngày chỉ có thể mở tối đa <color=yellow>6<color> túi đồng khóa");
	return 0;
	end
	if me.CountFreeBagCell() < 1 then
	me.Msg("Túi của bạn đã đầy, cần ít nhất 1 ô trống.");
	return 0;
	end
	me.SetTask(2024,90,nCount + 1);
	me.AddBindCoin(50000);
	me.SendMsgToFriend("Hảo hữu của bạn " .. me.szName .. " mở túi đồng khóa bao vạn đồng nhận được 5 vạn đồng khóa");
	return 1;
end
