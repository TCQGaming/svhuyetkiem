-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbMapPet = Map:GetClass(2022);

-- 定义玩家进入事件
function tbMapPet:OnEnter(szParam)
-- VIEETS NGU
-- local tbLocalPlayer = KPlayer.GetAllPlayer();
    -- for _, pPlayer in pairs(tbLocalPlayer) do
        -- local nMapId = pPlayer.GetWorldPos();  
			-- pPlayer.nInBattleState	= 1;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			-- pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
			-- pPlayer.SetFightState(1);
			-- Dialog:SendBlackBoardMsg(pPlayer, "Khu Vực PK - Người Chơi Hãy Cẩn Thận!!!");
        -- end
	-- self:_SetState(me);
	me.nPkModel = Player.emKPK_STATE_BUTCHER;
	me.DisabledStall(1);	
	me.TeamDisable(1);							-- 禁止队伍操作
	me.nForbidChangePK	= 1;
	Player:AddProtectedState(me, 5);
end;

-- 定义玩家离开事件
function tbMapPet:OnLeave(szParam)
-- WIN OC CHO
	-- local pPlayer = me;
	-- pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	
	-- self:_ResetState(me);
	
	-- Dialog:ShowBattleMsg(me, 0, 0);
	me.DisabledStall(0);
	me.TeamDisable(0);							-- 禁止队伍操作
	me.nForbidChangePK	= 0;
end;

