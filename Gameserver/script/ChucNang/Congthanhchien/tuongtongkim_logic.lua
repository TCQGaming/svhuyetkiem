if not MODULE_GAMESERVER then
	return;
end
function famnpc:tuongtongkim()
local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("<color=yellow><color=pink>Tượng Top 1 TK đã được xây<<color><color>");
local pNpc = KNpc.Add2(3656, 200, 0, 24, 1757, 3517)
end
function famnpc:xoatuongtongkim()
local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(24, "Tượng bất diệt");
end
