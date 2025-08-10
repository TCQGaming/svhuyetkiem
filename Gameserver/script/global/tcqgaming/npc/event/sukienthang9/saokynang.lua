
local tbItem = Item:GetClass("sao_kynang")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,2030,17,0,0};
	
		local nTask = me.GetTask(9169,6);
	if nTask < 2 then 	
	me.AddFightSkillPoint(1);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 1 điểm kỹ năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,6,nTask + 1)
		Task:DelItem(me, tbGiftId1, 1);
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Sao Kỹ Năng");
end
end


