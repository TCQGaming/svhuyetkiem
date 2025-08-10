
local tbEventDacBiet = Item:GetClass("eventdacbiet");
tbEventDacBiet.Use_Max = 10;

function tbEventDacBiet:OnUse()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(3107,1) < nDate then
		me.SetTask(3107,1, nDate);
		me.SetTask(3107,2, 0);
	end 

	local nCountt = me.GetTask(3107,2)
	if nCountt >= self.Use_Max then
		Dialog:Say(string.format("Hôm nay bạn đã sử dụng <color=yellow>"..self.Use_Max.."<color> lần, Ngày mai hãy sử dụng tiếp nhé"));
		return 0;
	end

	if me.CountFreeBagCell() < 3 then
	me.Msg("Túi của bạn đã đầy, cần ít nhất 3 ô trống.");
	return 0;
	end	
	local nCount = me.GetTask(3107,2)
	me.SetTask(3107,2, nCount + 1);
	me.AddItem(18,1,114,1);
-------
	return 1;
end
