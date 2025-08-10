
local tbItem = Item:GetClass("tiendanskill")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,1057,1,0,0};
	me.AddFightSkillPoint(1);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 1 điểm kỹ năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	return 1;
end


