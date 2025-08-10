
DuoBao.MAP_INFO = {
[1] = 2500,	
[2] = 2501,
}
DuoBao.MAP_INPOS = {
	[1]={
		{2500,1631,3178},--地毯左边角
		{2500,1648,3195},--地毯下面角
		{2500,1661,3181},--地毯右边角
		{2500,1644,3164},--地毯上面角
		{2500,1619,3182},--地板左方
		{2500,1644,3210},--地板下方
		{2500,1672,3182},--地板右方
		{2500,1645,3153},--地板上方
	},
	[2]={
		{2501,1631,3178},--地毯左边角
		{2501,1648,3195},--地毯下面角
		{2501,1661,3181},--地毯右边角
		{2501,1644,3164},--地毯上面角
		{2501,1619,3182},--地板左方
		{2501,1644,3210},--地板下方
		{2501,1672,3182},--地板右方
		{2501,1645,3153},--地板上方
	},
};

DuoBao.BOSS_POS = {1646,3180};
DuoBao.BOSS_TEMPID = {
[1] = 20148;
[2] = 20148;
}
--DuoBao.BOSS_TEMPID = 343;
DuoBao.BoxGDPL = {
	[1] = {18,1,1011,1},
	[2] = {18,1,1011,1},
}
DuoBao.GiftId = 203;
DuoBao.LeavePos = {
{23,1448,3153},
{25,1630,3168},
{27,1666,3260},
{28,1439,3366},
{26,1641,3129},
{29,1605,3946},
}
DuoBao.VIPSkillId = 17;
DuoBao.SkillId = 18;
DuoBao.NowType = 0;
if (not DuoBao.tbMission) then
	DuoBao.tbMission = {};
end;

DuoBao.RandJBCoin = {
[1]={50000,150000},
[2]={100000,200000},
}	--杀死BOSS随机金币奖励

DuoBao.TSKG_DUOBAO = 2123;		--任务变量组
DuoBao.TSK_SIGNPOSWORLD = 1;	--存储玩家的位置的任务变量 报名时MapID
DuoBao.TSK_SIGNPOSX = 2;		--							报名时Xpos
DuoBao.TSK_SIGNPOSY = 3;		--							报名时Ypos

DuoBao.TIMER_1 = 30 * Env.GAME_FPS;			-- 20秒公布一下战况
DuoBao.TIMER_2 = 30 * 60 * Env.GAME_FPS ;	--交战总时间为30分钟 ,战斗30分钟
DuoBao.TIMER_3 = 5 * Env.GAME_FPS;			-- 5秒后送出选手

--夺宝奇兵对话
function DuoBao:onDialog()
	local OpenTime = 
	Dialog:Say("Bạn có muốn vào đấu trường không?", {
			{"Vào Đấu trường 10 - Cá nhân", self.JoinGame, self, 1},
			{"Vào Đấu trường 100 - Chiến đội", self.JoinGame, self, 2},
			{"Kết thúc đối thoại"},
	});
end

function DuoBao:JoinGame(nType)
	DuoBao:OnJoin(nType);
end

function DuoBao:OnJoin(nType)
	local idx = SubWorldID2Idx(DuoBao.MAP_INFO[nType]);
	if (idx < 0) then
		return
	end;
	self:JoinCamp(nType);
end;


--玩家要求离开游戏
function DuoBao:LeaveGame()
	me.SetFightState(0);
	local nCamp = me.GetCamp();--恢复原始阵营
	me.SetCurCamp(nCamp);
--	ST_StopDamageCounter();	-- 停止伤害计算
	me.DisableChangeCurCamp(0);
--	me.TeamDisableChangeCamp(0);
	me.nPkModel = Player.emKPK_STATE_PRACTISE;--关闭PK开关
	me.nForbidChangePK	= 0;
	me.SetDeathType(0);
	me.RestoreMana();
	me.RestoreLife();
	me.RestoreStamina();
	me.DisabledStall(0);	--摆摊
	me.ForbitTrade(0);	--交易
	me.ForbidEnmity(0);
	me.LeaveTeam();
end;

function DuoBao:GameOver(tbCurBiWuMapDec)		--仅仅将角色送出擂台
	local PTab,PCount = tbCurBiWuMapDec:GetPlayerList()
	
	local pOldPlayer = PlayerIndex;
	local pOldMe = me;
	for i  = 1, PCount do 
		me = PTab[i];
		PlayerIndex = me.nPlayerIndex;
		tbCurBiWuMapDec:KickPlayer(me);
		local nW = me.GetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSWORLD);
		local nX = me.GetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSX);
		local nY = me.GetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSY);
		me.NewWorld(nW, nX, nY);
		me.SetLogoutRV(0);
	end;
	PlayerIndex = pOldPlayer;
	me = pOldMe;
end;

function DuoBao:JoinCamp(nType)
	
	local nW,nX,nY = me.GetWorldPos();
	
	me.SetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSWORLD, nW);
	me.SetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSX, nX);
	me.SetTask(self.TSKG_DUOBAO, self.TSK_SIGNPOSY, nY);
	
	self.tbMission[nType]:JoinPlayer(me, 1)	--将当前玩家加入mission
	local szMsg = string.format("%s đã vào <color=yellow> Đấu trường<color>.",me.szName);
	self.tbMission[nType]:BroadcastMsg(szMsg);	--向全组人发消息
end;

function DuoBao:SetStateJoinin(nState,nType)
	me.DisableChangeCurCamp(1);--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	
	if nState == 0 then 							--休息状态
		me.SetFightState(0);						--设置战斗状态
		me.nPkModel = Player.emKPK_STATE_PRACTISE;	--练功模式
	elseif nState == 1 then 						--击杀BOSS阶段
		me.SetFightState(1);						--设置战斗状态
		me.nPkModel = Player.emKPK_STATE_PRACTISE;	--练功模式
		if self.tbMission[nType] then
			self.tbMission[nType]:ShowTimeInfo(me);
		end
	elseif nState == 2 then 						--PK阶段
		me.SetFightState(1);						--设置战斗状态
		if nType == 1 then
			me.nPkModel = Player.emKPK_STATE_BUTCHER;	--屠杀模式
		elseif nType == 2 then
			me.nPkModel = Player.emKPK_STATE_TONG;	--帮会模式
		end
		if self.tbMission[nType] then
			self.tbMission[nType]:ShowTimeInfo(me);
		end
	end
	me.SetLogoutRV(1);		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	me.ForbidEnmity(1);		--禁止仇杀
	me.DisabledStall(1);	--摆摊
	me.ForbitTrade(1);		--交易
	me.nForbidChangePK	= 1;	--禁止切换PK模式

	--me.SetTask(BiWu.TSKG_DUOBAO, BiWu.TSK_DEATH_STATE, 0);

	me.SetCurCamp(1);
--	ST_StartDamageCounter();	--开始计算伤害
--	me.SetDeathType(-1);		--设置为死亡立即重生
end;

function DuoBao:OpenGame(nType)
	if nType == nil then nType = 1 ; end;
	if DuoBao.NowType == 0 then
		local nWorldIdx = SubWorldID2Idx(DuoBao.MAP_INFO[nType]);
		if (nWorldIdx >= 0 ) then
			self.tbMission[nType]:GSOpenGame();
		end
	else
		print("Dau truong dang duoc tien hanh, khong the mo cac hoat dong khac");
	end
end

function DuoBao:InitGame(nType)
	if nType == nil then nType = 1; end;
	self.tbMission[nType]	=	Lib:NewClass(self.tbMisBase);
	self.tbMission[nType]:InitGame(nType);
end