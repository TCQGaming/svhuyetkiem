
local tbItem = Item:GetClass("ttk_cao")
function tbItem:OnUse()
	-- local tbGiftId1	= {18,1,2029,2,0,0};
	
	local nTask = me.GetTask(9169,1);
	if nTask < 15 then 	
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ "..nTask.." cuốn Tẩy Tủy Kinh - Cao");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9169,1,nTask + 1)
	-- Task:DelItem(me, tbGiftId1, 1);
else 
	me.Msg("Bạn đã sử dụng tối đa 15 cuốn Tẩy Tủy Kinh - Cao");
	return 0;
end
return 1;-----Xóa vật phẩm sau khi sử dụng
end 


