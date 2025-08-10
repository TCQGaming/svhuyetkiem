
local tbItem = Item:GetClass("sachdialy_tcq_kynang")
function tbItem:OnUse()
	local tbGiftId1	= {18,1,2033,8,0,0};
	
		local nTask = me.GetTask(9169,10);
	if nTask < 2 then 	
	me.AddFightSkillPoint(1);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 1 điểm kỹ năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,10,nTask + 1)
		Task:DelItem(me, tbGiftId1, 1);
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Sách Địa Lý Kỹ Năng");
end
end


