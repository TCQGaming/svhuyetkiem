-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbMapThuy = Map:GetClass(2018);

-- 定义玩家进入事件
function tbMapThuy:OnEnter(szParam)
	if HslkThuy.MapBoss_CheckNumAccount == 1 then
		if HslkThuy:CheckValidHardware(me) == 0 then
		HslkThuy:WriteZeroHardWare(me);
		end
		
		local nCheck,nNum,Msg = HslkThuy:CheckHardWare(me);
		if nCheck ~= 1 then
		KDialog.MsgToGlobal("<color=pink> Chú Ý 1 PC Không Thể Vào Cùng Hệ Trong Thi Đấu Lộn Xộn Phái,KICK OUT ...");
		me.KickOut();
		return 0;
		end
	end
	me.SetTask(3140,26, 1);
	if HslkThuy.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkThuy:CheckHardWare(me);
	HslkThuy:WriteNewHardWare(me,nNumOld);
	end

	me.SetFightState(0);
	self:_SetState(me);
end;

-- 定义玩家离开事件
function tbMapThuy:OnLeave(szParam)
	local pPlayer = me;
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	

	self:_ResetState(me);
	
	Dialog:ShowBattleMsg(me, 0, 0);
	local pPlayer = me;

	if HslkThuy.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkThuy:CheckHardWare(pPlayer);
	HslkThuy:TruNewHardWare(pPlayer,nNumOld);
	end
end;

function tbMapThuy:_SetState(pPlayer)
	
	-- 设置为帮会模式
	--pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	
	-- 禁止摆摊
	pPlayer.DisabledStall(1);	
	
	-- 禁止切换战斗状态
	pPlayer.nForbidChangePK	= 1;
	pPlayer.TeamDisable(1);
end

function tbMapThuy:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end
