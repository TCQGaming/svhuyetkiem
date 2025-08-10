-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbMapKim = Map:GetClass(2016);

-- 定义玩家进入事件
function tbMapKim:OnEnter(szParam)
	if HslkKim.MapBoss_CheckNumAccount == 1 then
		if HslkKim:CheckValidHardware(me) == 0 then
		HslkKim:WriteZeroHardWare(me);
		end
		
		local nCheck,nNum,Msg = HslkKim:CheckHardWare(me);
		if nCheck ~= 1 then
		KDialog.MsgToGlobal("<color=pink> Chú Ý 1 PC Không Thể Vào Cùng Hệ Trong Thi Đấu Lộn Xộn Phái,KICK OUT ...");
		me.KickOut();
		return 0;
		end
	end
	me.SetTask(3140,26, 1);
	if HslkKim.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkKim:CheckHardWare(me);
	HslkKim:WriteNewHardWare(me,nNumOld);
	end

	me.SetFightState(0);
	self:_SetState(me);
end;

-- 定义玩家离开事件
function tbMapKim:OnLeave(szParam)
	local pPlayer = me;
	pPlayer.nInBattleState	= 0;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
	self:_ResetState(me);
	
	Dialog:ShowBattleMsg(me, 0, 0);
	local pPlayer = me;

	if HslkKim.MapBoss_CheckNumAccount == 1 then
	local _,nNumOld,_ = HslkKim:CheckHardWare(pPlayer);
	HslkKim:TruNewHardWare(pPlayer,nNumOld);
	end
end;

function tbMapKim:_SetState(pPlayer)
	
	-- 设置为帮会模式
	--pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	
	-- 禁止摆摊
	pPlayer.DisabledStall(1);	
	
	-- 禁止切换战斗状态
	pPlayer.nForbidChangePK	= 1;
	pPlayer.TeamDisable(1);
end

function tbMapKim:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end
