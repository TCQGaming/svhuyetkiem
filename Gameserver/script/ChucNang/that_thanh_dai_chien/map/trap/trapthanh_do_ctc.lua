
local tbMapThanhDoCTC = Map:GetClass(2167); -- µØÍ¼Id


function tbMapThanhDoCTC:OnEnter(szParam)
	local nCurTimer = tonumber(GetLocalDate("%H%M"))
	if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
	me.SetFightState(0);
		me.NewWorld(24,1765,3491);
	else 
	me.SetFightState(1);
	end 
	self:_SetState(me);
end;

function tbMapThanhDoCTC:OnLeave(szParam)
		local pPlayer = me;
	    Map:RegisterMapForbidReviveType(2167, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	self:_ResetState(me);
	Dialog:ShowBattleMsg(me, 0, 0);
end;

function tbMapThanhDoCTC:_SetState(pPlayer)
	pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	pPlayer.DisabledStall(1);	
	pPlayer.nForbidChangePK	= 1;
	-- pPlayer.TeamDisable(1);
end

function tbMapThanhDoCTC:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end

local tbTrapMapPT	= tbMapThanhDoCTC:GetTrapClass("to_phuongtuong")----Long Môn Trấn
function tbTrapMapPT:OnPlayer()
	me.NewWorld(2168, 1594,3215);
end;
 
local tbTrapMapTD_TuongDuong	= tbMapThanhDoCTC:GetTrapClass("to_tuongduong")
function tbTrapMapTD_TuongDuong:OnPlayer()
	me.NewWorld(2166, 1476,3291);
end;

