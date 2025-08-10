
local tbMapThanhDoCTC = Map:GetClass(2166); -- µØÍ¼Id


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
	    Map:RegisterMapForbidReviveType(2166, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
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

local tbTrapMapPT	= tbMapThanhDoCTC:GetTrapClass("to_daily")----Long Môn Trấn
function tbTrapMapPT:OnPlayer()
	me.NewWorld(2169,1364,3169);
end;
 
local tbTrapMapTD_TuongDuong	= tbMapThanhDoCTC:GetTrapClass("to_thanhdo")
function tbTrapMapTD_TuongDuong:OnPlayer()
	me.NewWorld(2167, 1720,3328);
end;

