
local tbItem = Item:GetClass("tiendan5d")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,1058,1,0,0};
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 5 điểm tiềm năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	return 1;
end


