
local tbItem = Item:GetClass("sao_tiemnang")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,2030,16,0,0};
	
	local nTask = me.GetTask(9169,5);
	if nTask < 2 then 	
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 5 điểm tiềm năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,5,nTask + 1)
	Task:DelItem(me, tbGiftId1, 1);
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Sao Tiềm Năng");
end
end 


