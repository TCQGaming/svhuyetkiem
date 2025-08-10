
local tbItem = Item:GetClass("vlmt_cao")
function tbItem:OnUse()
	-- local tbGiftId1	= {18,1,2029,1,0,0};
		local nTask = me.GetTask(9169,2);
	if nTask < 15 then 	
	me.AddFightSkillPoint(1);
	local szMsg = string.format("<color=yellow> Bạn đã đọc kỹ Võ Lâm Mật Tịch - Cao đã giác ngộ, , nhận được 1 điểm kỹ năng hiện nay đã sử dụng "..nTask.." cuốn ");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,2,nTask + 1)
else 
	me.Msg("Bạn đã sử dụng tối đa 15 cuốn Võ Lâm Mật Tịch - Cao");
	return 0;
end
return 1;-----Xóa vật phẩm sau khi sử dụng
end