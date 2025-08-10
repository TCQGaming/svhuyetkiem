
local tbMapPhuongTuongCTC = Map:GetClass(2168); -- µØÍ¼Id

 tbMapPhuongTuongCTC.MapID = 2168;
-- 定义玩家进入事件
function tbMapPhuongTuongCTC:OnEnter(szParam)
	local nCurTimer = tonumber(GetLocalDate("%H%M"))
	if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
	me.SetFightState(0);
		me.NewWorld(24,1765,3491);
	else 
	me.SetFightState(1);
	end 
	self:_SetState(me);
end;

-- 定义玩家离开事件
function tbMapPhuongTuongCTC:OnLeave(szParam)
	local pPlayer = me;
	    Map:RegisterMapForbidReviveType(tbMapPhuongTuongCTC.MapID, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	self:_ResetState(me);
	Dialog:ShowBattleMsg(me, 0, 0);
end;

function tbMapPhuongTuongCTC:_SetState(pPlayer)
	pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	-- pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
	pPlayer.DisabledStall(1);	
	pPlayer.nForbidChangePK	= 1;
	-- pPlayer.TeamDisable(1);
end

function tbMapPhuongTuongCTC:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end

local tbTrapMapThanhDo	= tbMapPhuongTuongCTC:GetTrapClass("to_thanhdo")----Long Môn Trấn
function tbTrapMapThanhDo:OnPlayer()
	me.NewWorld(2167, 1698,3097);
end;
 
local tbMapBienKinh	= tbMapPhuongTuongCTC:GetTrapClass("to_bienkinh")
function tbMapBienKinh:OnPlayer()
	me.NewWorld(2163, 1637,2899);
end;

local tbMapDuongChau	= tbMapPhuongTuongCTC:GetTrapClass("to_duongchau")
function tbMapDuongChau:OnPlayer()
	me.NewWorld(2164, 1667,3070);
end;

