-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbMapVoLam = Map:GetClass(2023);
tbMapVoLam.MapID = 2023;
-- 定义玩家进入事件
function tbMapVoLam:OnEnter(szParam)
	me.SetFightState(0);
	self:_SetState(me);
end;

-- 定义玩家离开事件
function tbMapVoLam:OnLeave(szParam)
	local pPlayer = me;
	    Map:RegisterMapForbidReviveType(tbMapVoLam.MapID, 0, 1, "Mỗi người chỉ có 1 mạng mà thôi!")
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	self:_ResetState(me);
	Dialog:ShowBattleMsg(me, 0, 0);
end;

function tbMapVoLam:_SetState(pPlayer)
	
	-- 设置为帮会模式
	--pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	pPlayer.nPkModel = Player.emKPK_STATE_PRACTISE -- PK luyen cong
	
	-- 禁止摆摊
	pPlayer.DisabledStall(1);	
	
	-- 禁止切换战斗状态
	pPlayer.nForbidChangePK	= 1;
	pPlayer.TeamDisable(1);
end

function tbMapVoLam:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end
