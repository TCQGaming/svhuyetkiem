
local tbItem = Item:GetClass("phao_tiemnang_tet")

function tbItem:OnUse()
	local tbGiftId1	= {18,1,2034,6,0,0};
	
	local nTask = me.GetTask(9169,11);
	if nTask < 2 then 	
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 5 điểm tiềm năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,11,nTask + 1)
	me.CastSkill(391, 1, -1, me.GetNpc().nIndex);
	me.CastSkill(1331, 1, -1, me.GetNpc().nIndex);
	Task:DelItem(me, tbGiftId1, 1);
	
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Pháo Tiềm Năng");
end
end 


