
local tbItem = Item:GetClass("canghaiyueming")
tbItem.tbBook =
{
  2, 2040, 21, 1,
}
function tbItem:OnUse()
	local tbParam = self.tbBook;
	if not tbParam then
		return 0;
	end
	local nUse =  me.GetTask(tbParam[2], tbParam[3]);
	if nUse >= tbParam[1] then
		me.Msg(string.format("<color=yellow>Bạn đã sử dụng %s %s không thể sử dụng thêm", tbParam[1], it.szName));
		Dialog:SendInfoBoardMsg(me, string.format("<color=yellow>Bạn đã sử dụng tối đa %s", it.szName))
		return 0;
	end
	
	me.AddFightSkillPoint(tbParam[4]);
	me.SetTask(tbParam[2], tbParam[3], nUse +1)
	
	PlayerHonor:UpdataMaxWealth(me);		-- canh tân tài phú cực đại 
	local szMsg = string.format("<color=yellow>Bạn đã sử dụng %s nhận được %s điểm tiềm năng", it.szName, tbParam[4]);
	Dialog:SendInfoBoardMsg(me, szMsg)
	szMsg = string.format("Bạn đã sử dụng tối đa %s", it.szName);
	me.Msg(szMsg);
	
	return 1;
end

function tbItem:GetTip()
	local szTip = "";
	local tbParam = self.tbBook;
	local nUse =  me.GetTask(tbParam[2], tbParam[3]);
	szTip = szTip.. string.format("<color=green>dĩ dùng ăn %s/%smột <color>", nUse, self.tbBook[1]);
	return szTip;
end
