
local tbItem = Item:GetClass("FollowPartner");

function tbItem:GetTip()
	local nNpcId = tonumber(it.GetExtParam(1));
	local nType = tonumber(it.GetExtParam(2));
	local nOnlyOne = tonumber(it.GetExtParam(6));
	local nLastCallTime = me.GetTask(2112, 7);
	local nAwardType = me.GetTask(2112, 8);
	local nAwardTotalPlayer = me.GetTask(2112, 9);
	local nRelTime = me.GetTask(2112, 10);
	if nLastCallTime > 0 then
		nRelTime = nRelTime - (GetTime() - nLastCallTime);
	end
	local nAwardTotalItem = it.GetGenInfo(1);
	local nState = it.GetGenInfo(2);
	local nGetAwardTime = it.GetGenInfo(3);
	local tbType = Npc.tbFollowPartner.tbFollowPartner[nType];
	local szClientTip = Npc.tbFollowPartner.tbClientTip[nType];
	
	if nGetAwardTime > 0 and nOnlyOne >= 1 then
		return "<color=green>Đang gọi thú cưng...<color>\n\n<color=red>Phần thưởng thú cưng đã nhận, không thể tích lũy phần thưởng nữa<color>";
	end
		
	if nNpcId > 0 and nType > 0 and tbType and szClientTip then
		local nAwardTotal = tbType[6];
		local szEventMsg = "";
		
		if tonumber(GetLocalDate("%Y%m%d")) <= 20131101 then
			if nOnlyOne and nOnlyOne >= 1  then
				szEventMsg =  "\n<color=gold>Hoạt động sinh nhật thú cưng, phần thưởng nhận được sau khi tích lũy đủ cấp sẽ khác nhau.<color>";
			end
		end
		
		if tbType[5] == 2 then
			nAwardTotalItem = me.GetBaseAwardExp() * nAwardTotalItem;
			nAwardTotalPlayer = me.GetBaseAwardExp() * nAwardTotalPlayer;
			nAwardTotal = me.GetBaseAwardExp() * nAwardTotal;
		end
		if nState <= 0 then			
			return "<color=red>Chưa triệu hồi thú cưng<color>\n\n"..string.format(szClientTip, nAwardTotalItem, nAwardTotal)..szEventMsg;	
		elseif nState == 1 and nLastCallTime > 0 and nRelTime > 0 then
			return "<color=green>Đang triệu hồi thú cưng...<color>\n\n"..string.format(szClientTip, nAwardTotalPlayer, nAwardTotal)..szEventMsg;
		end
	end
	return "";
end

