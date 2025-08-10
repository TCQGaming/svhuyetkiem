-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbMapTho = Map:GetClass(2020);

-- 定义玩家进入事件
function tbMapTho:OnEnter(szParam)
	if HslkTho.MapBoss_CheckNumAccount == 1 then
		if HslkTho:CheckValidHardware(me) == 0 then
		HslkTho:WriteZeroHardWare(me);
		end
		
		local nCheck,nNum,Msg = HslkTho:CheckHardWare(me);
		if nCheck ~= 1 then
		KDialog.MsgToGlobal("<color=pink> Chú Ý 1 PC Không Thể Vào Cùng Hệ Trong Thi Đấu Lộn Xộn Phái,KICK OUT ...");
		me.KickOut();
		return 0;
		end
	end
	me.SetTask(3140,26, 1);
	if HslkTho.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkTho:CheckHardWare(me);
	HslkTho:WriteNewHardWare(me,nNumOld);
	end
	me.SetFightState(0);
	self:_SetState(me);
end;

-- 定义玩家离开事件
function tbMapTho:OnLeave(szParam)
	local pPlayer = me;
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	

	self:_ResetState(me);
	
	Dialog:ShowBattleMsg(me, 0, 0);
	local pPlayer = me;

	if HslkTho.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkTho:CheckHardWare(pPlayer);
	HslkTho:TruNewHardWare(pPlayer,nNumOld);
	end
end;

function tbMapTho:_SetState(pPlayer)
	
	-- 设置为帮会模式
	--pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	
	-- 禁止摆摊
	pPlayer.DisabledStall(1);	
	
	-- 禁止切换战斗状态
	pPlayer.nForbidChangePK	= 1;
	pPlayer.TeamDisable(1);
end

function tbMapTho:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end
