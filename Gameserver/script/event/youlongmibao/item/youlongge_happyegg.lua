-- 文件名　：youlongge_happyegg.lua
-- 创建者　：sunduoliang
-- 创建时间：2009-11-11 09:08:59
-- 描  述  ：这个是游龙开心蛋，还有个盛夏开心蛋

local tbItem = Item:GetClass("youlongge_happyegg");
tbItem.TSK_GROUP = 2106;
tbItem.TSK_COUNT = 4;
tbItem.TSK_DATE	 = 5;
tbItem.DEF_BINDMONEY	= 200000;
tbItem.DEF_BINDCOIN		= 100000;
tbItem.DEF_MAXCOUNT 	= 1;

function tbItem:OnUse()
	self:OnLoginDay(1);
	local nCount = me.GetTask(self.TSK_GROUP, self.TSK_COUNT);
	if nCount > self.DEF_MAXCOUNT or nCount < 0 then
		me.SetTask(self.TSK_GROUP, self.TSK_COUNT, 0);
		nCount = 0;
	end
	local szMsg = string.format("<color=yellow>Trứng Du Long<color>\n\nHãy chọn lấy phần thưởng mà ngươi muốn!", nCount);
	local tbOpt = {
		{string.format("<color=yellow>100000 Đồng khóa<color>"), self.GetItem, self, it.dwId, 1},
		{"<color=yellow>200000 Bạc Khóa<color>", self.GetItem, self, it.dwId, 2},
		{"Ta sẽ nhận sau"},
		};
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbItem:GetItem(nItemId, nType)
	local pItem = KItem.GetObjById(nItemId);
	if not pItem then
		return 0;
	end
	local nCount= me.GetTask(self.TSK_GROUP, self.TSK_COUNT);
	if nCount <= 0 then
		Dialog:Say("Số lần mở trứng du long hôm nay đã hết.");
		return 0;
	end

	if nType == 2 then
		if me.GetBindMoney() + self.DEF_BINDMONEY > me.GetMaxCarryMoney() then
			Dialog:Say("Hành trang của bạn đã mang quá số tiền cho phép.");
			return 0;
		end
	end
	
	if me.DelItem(pItem) == 1 then
		if nType == 1 then
			me.AddBindCoin(self.DEF_BINDCOIN, Player.emKBINDCOIN_ADD_HAPPYEGG);
			me.SendMsgToFriend(string.format("Hảo hữu của bạn[%s] mở trứng du long nhận được %s Đồng Khóa", me.szName, self.DEF_BINDCOIN, IVER_g_szCoinName));
			Player:SendMsgToKinOrTong(me, string.format(" mở trứng du long nhận được %s Đồng Khóa", self.DEF_BINDCOIN, IVER_g_szCoinName), 1);
		end
		if nType == 2 then
			me.AddBindMoney(self.DEF_BINDMONEY, Player.emKBINDMONEY_ADD_HAPPYEGG);
			me.SendMsgToFriend(string.format("Hảo hữu của bạn[%s] mở trứng du long nhận được %s Bạc Khóa", me.szName, self.DEF_BINDMONEY));
			Player:SendMsgToKinOrTong(me, string.format(" mở trứng du long nhận được %s Bạc khóa", self.DEF_BINDMONEY), 1);
		end
		me.AddKinReputeEntry(2);
		me.SetTask(self.TSK_GROUP, self.TSK_COUNT, nCount - 1);
		return 1;
	end
end

function tbItem:OnLoginDay(nUse)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	local nCurDay  =Lib:GetLocalDay();
	if me.GetTask(self.TSK_GROUP, self.TSK_DATE) == 0 then
		me.SetTask(self.TSK_GROUP, self.TSK_DATE, nCurDay);
		me.SetTask(self.TSK_GROUP, self.TSK_COUNT, 1);
		return 0;
	end
	
	local nDayCount = nCurDay - me.GetTask(self.TSK_GROUP, self.TSK_DATE);
	if nDayCount <= 0 then
		return 0;
	end
	
	local nDayCount = nDayCount + me.GetTask(self.TSK_GROUP, self.TSK_COUNT);
	if nDayCount > self.DEF_MAXCOUNT then
		nDayCount = self.DEF_MAXCOUNT;
	end
	
	me.SetTask(self.TSK_GROUP, self.TSK_COUNT, nDayCount);
	me.SetTask(self.TSK_GROUP, self.TSK_DATE, nCurDay);
	return 1;
end

PlayerEvent:RegisterOnLoginEvent(tbItem.OnLoginDay, tbItem);
