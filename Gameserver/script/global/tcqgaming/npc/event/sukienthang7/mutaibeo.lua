-----Dev : TCQGaming
local tbTapVo = Item:GetClass("nontaibeo_thang7");

function tbTapVo:OnUse()	
local nTask = me.GetTask(9186,86);
if nTask < 2 then 	
	me.AddPotential(5);
	local szMsg = string.format("<color=yellow> Bạn đã lĩnh ngộ tuyệt học võ công : + 5 điểm tiềm năng");
	Dialog:SendInfoBoardMsg(me, szMsg)
	me.Msg(szMsg);
	me.SetTask(9186,86,nTask + 1)
	me.CastSkill(391, 1, -1, me.GetNpc().nIndex);
	me.CastSkill(1331, 1, -1, me.GetNpc().nIndex);
else 
	me.Msg("Bạn đã sử dụng tối đa 2 Nón Tai Bèo Tiềm Năng");
	return 0;
end
return 1;-----Xóa vật phẩm sau khi sử dụng
end


