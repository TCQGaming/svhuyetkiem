
local tbMapBienKinhCTC = Map:GetClass(2169); -- µØÍ¼Id


function tbMapBienKinhCTC:OnEnter(szParam)
	local nCurTimer = tonumber(GetLocalDate("%H%M"))
	if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
	me.SetFightState(0);
		me.NewWorld(24,1765,3491);
	else 
	me.SetFightState(1);
	end 
	self:_SetState(me);
end;

function tbMapBienKinhCTC:OnLeave(szParam)
		local pPlayer = me;
	    Map:RegisterMapForbidReviveType(2169, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	self:_ResetState(me);
	Dialog:ShowBattleMsg(me, 0, 0);
end;

function tbMapBienKinhCTC:_SetState(pPlayer)
	pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	pPlayer.DisabledStall(1);	
	pPlayer.nForbidChangePK	= 1;
	-- pPlayer.TeamDisable(1);
end

function tbMapBienKinhCTC:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end

local tbTrapMapPT	= tbMapBienKinhCTC:GetTrapClass("to_duongchau")----Long Môn Trấn
function tbTrapMapPT:OnPlayer()
	me.NewWorld(2164, 1450,3335);
end;
 
local tbMapDaiLy_LamAn	= tbMapBienKinhCTC:GetTrapClass("to_laman")
function tbMapDaiLy_LamAn:OnPlayer()
	me.NewWorld(2165, 1790,4156);
end;

local tbTrapMapDuongChau_PT	= tbMapBienKinhCTC:GetTrapClass("to_tuongduong")
function tbTrapMapDuongChau_PT:OnPlayer()
	me.NewWorld(2166, 1778,2996);
end;


