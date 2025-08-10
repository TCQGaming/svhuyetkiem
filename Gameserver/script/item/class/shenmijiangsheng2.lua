--神秘疆绳
--sunduoliang
--2008.10.30

local tbItem = Item:GetClass("shenmijiangsheng2");

tbItem.tbHorse = 
{
	{1,12,91,4},	--奇珍阁（乌云踏雪）
	
}

function tbItem:OnUse()
	local szMsg = "Lựa chọn cho mình 1 chú ngựa tốt sẽ giúp  việc đi lại được thuận tiện hơn. chú ý ngựa sau khi lấy sẽ khóa.";
	local tbOpt = {};
	for nId, tbHorse in ipairs(self.tbHorse) do
		local szName = KItem.GetNameById(unpack(tbHorse));
		table.insert(tbOpt, {szName, self.GetHorse, self, it.dwId, nId});
	end
	table.insert(tbOpt, {"Để ta suy nghĩ lại."});
	Dialog:Say(szMsg, tbOpt);
end

function tbItem:GetHorse(nItemId, nId, nFlag)
	local pItem = KItem.GetObjById(nItemId);
	if not pItem then
		return 0;
	end
	if not nFlag then
		local szMsg= string.format("Bạn chọn <color=yellow>%s<color>,      Ngựa sau khi được lấy sẽ <color=red> tự động khóa <color>,  bạn có muốn tiếp tục ?", KItem.GetNameById(unpack(self.tbHorse[nId])));
		local tbOpt = 
		{
			{"Được ta chọn con này", self.GetHorse, self, nItemId, nId, 1},
			{"Để ta suy nghĩ lại."},
		}
		Dialog:Say(szMsg, tbOpt);
		return;
	end
	if me.DelItem(pItem) ~= 1 then
		return
	end
	local pAddItem = me.AddItem(unpack(self.tbHorse[nId]));
	if pAddItem then
		pAddItem.Bind(3);
		me.SetItemTimeout(pAddItem, os.date("%Y/%m/%d/%H/%M/%S", GetTime() + 15 * 24 * 3600), 0);
		me.Msg(string.format("Bạn nhận được <color=yellow>%s<color>", pAddItem.szName));
	end
end
