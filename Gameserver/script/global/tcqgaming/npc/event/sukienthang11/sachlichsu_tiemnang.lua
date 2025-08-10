
local tbItem = Item:GetClass("sachlichsu_tcq_tiemnang")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,2033,7,0,0};
	
	local nTask = me.GetTask(9169,9);
	if nTask < 2 then 	
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 5 điểm tiềm năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,9,nTask + 1)
	Task:DelItem(me, tbGiftId1, 1);
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Sách Lịch Sử Tiềm Năng");
end
end 


