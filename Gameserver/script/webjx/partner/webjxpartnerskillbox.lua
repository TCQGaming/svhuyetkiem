
local tbItem = Item:GetClass("RuongPetVip");

tbItem.tbSkillList={
	[1] = {1,12,18,20,22,24,26},
	[2] = {2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,19,21,23,25,27,28,29,30,31,32},
}

function tbItem:OnUse()
	local SkillType = tonumber(it.GetExtParam(1));
	local nSkillTypeList = tbItem.tbSkillList[SkillType];
	local len = #nSkillTypeList;
	local nRandom = MathRandom(1,len);
	local tbOpt = {};
	local nLevel = nSkillTypeList[nRandom];
	
	if (me.CountFreeBagCell() < 1) then
		local szMsg = "Hành trang không đủ 1 ổ trống";
		table.insert(tbOpt, {"Kết thúc đối thoại"});
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	
	local pItem = me.AddItem(18,1,1001,nLevel);
	local szMsg = string.format("Xin chúc mừng bạn đã mở <color=green>%s<color> nhận được 1 kĩ năng <color=green>%s<color>",it.szName,pItem.szName);
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	return 1;
end