if not MODULE_GAMESERVER then
	return;
end
function LuaTrai:CallLuaTrai_GS(nExistentTime,nBaseMultip)
	local nMapIndex = SubWorldID2Idx(8);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Lửa Trại<color> xuất hiện tại <pos=8,1729,3390>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Lửa Trại<<color> xuất hiện tại <pos=8,1729,3390>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Lửa Trại<<color> xuất hiện tại <pos=8,1729,3390>!<color>");
local nExistentTime = 1800; --- Thời gian duy trì tình bằng giây
local nBaseMultip = 15000;-- kinh nghiệm nhận được
-- local nBaseMultip = 15000;-- kinh nghiệm nhận được
local tbNpc = Npc:GetClass("luatrai");
local pNpc1 = KNpc.Add2(20023, 1, 0, 8,1729,3390)
if pNpc1 then
	tbNpc:InitGouHuo(pNpc1.dwId, 0, nExistentTime, 5, 45, nBaseMultip, 0)
	tbNpc:StartNpcTimer(pNpc1.dwId)
end
end	
function LuaTrai:DelLuaTrai_GS()
		local nMapIndex = SubWorldID2Idx(8);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Hoạt Động Lửa Trại Đã Kết Thúc<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow> Hoạt Động Lửa Trại Đã Kết Thúc<color><color>");
KDialog.MsgToGlobal("<color=yellow> Hoạt Động Lửa Trại Đã Kết Thúc<color>");	
ClearMapNpcWithName(8, "Lửa trại vui vẻ");
	
end