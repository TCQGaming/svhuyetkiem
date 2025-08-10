-------------------------------------------------------
-- văn kiện danh 　：army_supplybag.lua
-- sang xây người 　：zhangjinpin@kingsoft
-- sang xây thời gian ：2009-09-08 14:41:59
-- văn kiện miêu tả ：
-------------------------------------------------------

local tbItem = Item:GetClass("army_supplybag");

function tbItem:OnUse()
	
	local nShengWang = 300;
	
	local nTimes = tonumber(it.GetExtParam(1));
	if nTimes> 0 then
		nShengWang = nShengWang * nTimes;
	end
	
	local nFlag = Player:AddRepute(me, 1, 2, nShengWang);
	
	if (0 == nFlag) then
		return;
	elseif (1 == nFlag) then
		me.Msg("ngài đích quân doanh thanh ngắm đã đạt tới hạn mức cao nhất ！");
		return;
	end
	
	return 1;	
end;
