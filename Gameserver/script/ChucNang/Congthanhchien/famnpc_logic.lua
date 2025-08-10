if not MODULE_GAMESERVER then
	return;
end
function famnpc:thongbaofamnpc_gs()
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Hoạt Động Cổ Thành Bắt Đầu, tại NPC Cổ Thành Phượng Tường <color>"});
KDialog.MsgToGlobal("<color=yellow><color=pink>Hoạt Động Cổ Thành Bắt Đầu, tại NPC Cổ Thành Phượng Tường<<color><color>");
end
function famnpc:bossxuathien_gs()
local nMapIndex = SubWorldID2Idx(1721);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>BOSS CỔ THÀNH XUẤT HIỆN TẠI KHU VỰC CHÍNH <color>"});
KDialog.MsgToGlobal("<color=yellow><color=pink>BOSS CỔ THÀNH XUẤT HIỆN TẠI KHU VỰC CHÍNH<<color><color>");
local pNpc = KNpc.Add2(11605, 200, 0, 1721, 1826, 3484)
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function famnpc:xoabosscothanh_gs()
local nMapIndex = SubWorldID2Idx(1721);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Cổ Thành Thiên Cổ Đã Rời Đi<color>"});
ClearMapNpcWithName(1721, "Cổ Thành Thiên Cổ");
end
function famnpc:ketthuc_gs()
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>kết thúc cổ thành <color>"});
KDialog.MsgToGlobal("<color=yellow><color=pink>hoạt động cổ thành kết thúc<<color><color>");
	local nMapIndex = SubWorldID2Idx(1721);
		if nMapIndex < 0 then
			return;
		end
	local tbLocalPlayer = KPlayer.GetAllPlayer();
		for _, pPlayer in pairs(tbLocalPlayer) do
			local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
			if nMapId == 1721 then
				pPlayer.NewWorld(24,1802,3486) --Phượng Tường Phủ
				pPlayer.SetFightState(0); --Trạng Thái Phi Chiến Đấu
			end
		end
end
