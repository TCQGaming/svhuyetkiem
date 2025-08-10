local ruongexpne = Item:GetClass("baoruongexp");
ruongexpne.TASK_GROUP = 4028;
ruongexpne.TASK_DAY = 1;
function ruongexpne:OnUse()
DoScript("\\script\\baibaoxiang\\item\\baoruongexp.lua");
	local nWeekOpen = me.GetTask(ruongexpne.TASK_GROUP, ruongexpne.TASK_DAY)
	local nTuan = 17;
	local nNgayMoSV = Youlongmibao:GetServerOpenDay();
	local nMaxDuLong = 10 * nNgayMoSV;
	if me.nLevel > 124 then
        Dialog:Say(string.format("rương chỉ sử dụng dưới cấp 124"));
        return 0;
    end
    if nWeekOpen >= nMaxDuLong then
        Dialog:Say(string.format("MỖI NGÀY 10 RƯƠNG máy chủ đã mở "..nNgayMoSV.." ngày\đã nhai nuốt, ăn giộng "..nWeekOpen.."/"..nMaxDuLong.."\nKhông thể tiếp tục", nMaxDuLong));
        return 0;
    end
	if nTuan == 0 then
		me.Msg("exp");
		return 0;
	end
	if me.CountFreeBagCell() < 1 then
		me.Msg("Túi của bạn đã đầy, cần ít nhất 1 ô trống.");
		return 0;
	end
	me.AddExp(5000000);
	me.Msg("rương có thể nuốt..."..nMaxDuLong.."<color=yellow>....<color>"..nWeekOpen.."<color=yellow>đã ăn giộng<color>");
	me.SetTask(ruongexpne.TASK_GROUP, ruongexpne.TASK_DAY, nWeekOpen + 1);
	return 1;
end
