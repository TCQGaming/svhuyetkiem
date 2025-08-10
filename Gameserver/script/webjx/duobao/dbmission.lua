--//夺宝奇兵 Mission主文件脚本
-- //处理开启Mission，关闭Mission，角色加入/离开Mission 后的回掉
Require("\\script\\webjx\\duobao\\dbhead.lua");

local tbTest = DuoBao.tbMisBase or Mission:New();	-- 支持重载

-- 当Mission被开启“后”被调用
function tbTest:OnOpen()	--InitMission()
	self.pBoxPlayer = nil;
	self.pBoxPlayerIndex = nil;
	self.pBoxItem = nil;
	self.pBoxItemId = nil;
	
	self.nState		= 1;	-- 0:休息状态 1:BOSS状态 2:PK状态
	self:OnBwStartToFight(1);
	self:AddBoss();
	self.tbTimer1		= self:CreateTimer(DuoBao.TIMER_1, self.OnSmallTimer, self);	-- 定时公告
	self.tbTimer2		= self:CreateTimer(DuoBao.TIMER_2, self.OnTotalTimer, self);	-- 擂台总时间
	local tbAllPlayer = self:GetPlayerList();
	for _, pPlayer in pairs(tbAllPlayer) do
		self:ShowTimeInfo(pPlayer);
	end
end;

-- 在Mission被关闭“前”被调用
function tbTest:OnClose()	--EndMission()
	ClearMapNpc(DuoBao.MAP_INFO[self.nType]); 
	local szMsg;
	if self.pBoxPlayer then
		szMsg = string.format("Rớt <color=yellow>[%s]<color>",self.pBoxPlayer.szName);
	else
		szMsg = string.format("Kết thúc hoạt động Đấu trường 100, các hiệp khách hãy kiên nhẫn chờ đợi lượt báo danh lần kế tiếp");
	end
	KDialog.MsgToGlobal(szMsg);
	DuoBao:GameOver(self);	--仅仅将角色送出擂台
	--DuoBao.tbMission[1]	= nil;	--直接注销吧 都不记得用了哪些了
end;

-- 开启Mission
function tbTest:Open()
	DuoBao.NowType = self.nType;
	local szMsg = string.format("<color=yellow> Đấu trường - %s <color> đã được mở, <color=yellow>Bảo vật<color> sẽ xuất hiện chứa nhiều phần thưởng giá trị các hiệp khách hãy mau đăng kí tham gia tại <color=red>Tuyết Băng Tâm<color> <color=green><color>",self.szType);
	KDialog.MsgToGlobal(szMsg);	
	self.tbTimers	= {};	-- [nTimerId]	= tbTimer;
	self:OnOpen();
end

-- 关闭Mission
function tbTest:Close()
	Dbg:Output("Mission", "Close", self);
	
	self:_MustOpen();
	
	self:OnClose();

	local tbPlayer, nCount	= self:GetPlayerList(nGroupId);
	for _, pPlayer in ipairs(tbPlayer) do
		self:KickPlayer(pPlayer);
	end
	
	for nRegisterId, tbTimer in pairs(self.tbTimers) do
		Lib:CallBack({tbTimer.Close, tbTimer});
	end
	DuoBao.NowType = 0;
	self.tbGroups			= {};
	self.tbPlayers			= {};
	self.tbTimers			= {};
	self.nStateJour			= 0;
	self.pBoxPlayer = nil;
	self.pBoxPlayerIndex = nil;
	self.pBoxItem = nil;
	self.pBoxItemId = nil;
end

-- 当玩家加入Mission“后”被调用
function tbTest:OnJoin(nGroupId)
	DuoBao:SetStateJoinin(self.nState,self.nType);--加入后 设置状态
end;

-- 当玩家离开Mission“后”被调用
function tbTest:OnLeave(nGroupId)	--OnLeave(RoleIndex)
	local pPlayer = me;
	if (self.nState == 1 or self.nState == 2) then
		local szMsg = me.szName.." lên đấu trường.";
		self:BroadcastMsg(szMsg);
	end;
	self:DeleteTimeInfo(pPlayer);
	DuoBao:LeaveGame();
end;

--添加BOSS
function tbTest:AddBoss()
	local nWorldIdx = SubWorldID2Idx(DuoBao.MAP_INFO[self.nType]);
	if (nWorldIdx >= 0 ) then
		local pNpc = KNpc.Add2(DuoBao.BOSS_TEMPID[self.nType], 120, -1, DuoBao.MAP_INFO[self.nType], unpack(DuoBao.BOSS_POS));
		Npc:RegPNpcOnDeath(pNpc, self.OnDeath_Boss, self);
	end
end

-- 退出触发
function tbTest:_OnLogout()
	self:DropBox(me,0);
	self:KickPlayer(me, "Logout");
end

-- 丢弃宝盒
function tbTest:DropBox(pPlayer,nDropType)
	local szMsg = "";
	if self.pBoxPlayerIndex and (self.pBoxPlayerIndex == me.nPlayerIndex) then
		if self.pBoxItem ~= nil then
			me.RemoveSkillState(DuoBao.SkillId);
			me.RemoveSkillState(DuoBao.VIPSkillId);
			if pPlayer.DelItem(self.pBoxItem) ~= 1 then
				return
			end
			local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
			local pItem = KItem.AddItemInPos(nMapId, nPosX, nPosY, DuoBao.BoxGDPL[self.nType][1],DuoBao.BoxGDPL[self.nType][2],DuoBao.BoxGDPL[self.nType][3],DuoBao.BoxGDPL[self.nType][4],0, 0, 0, nil, nil, 0, 0);
			self.pBoxItem = pItem;
			self.pBoxItemId = pItem.dwId;
			self.pBoxPlayer = nil;
			self.pBoxPlayerIndex = nil;
			if nDropType == nil then nDropType = 0 end
			if nDropType == 0 then
				szMsg = string.format("<color=yellow>[%s]<color> rời khỏi,<color=yellow>[Đấu trường] - %s<color> kết thúc",me.szName,self.szType);
			elseif nDropType == 1 then
				szMsg = string.format("<color=yellow>[%s]<color> bị hạ gục <color=yellow>[Đấu trường] - %s<color> kết thúc",me.szName,self.szType);
			end
			KDialog.MsgToGlobal(szMsg);	
		end
	end
end

--BOSS死亡触发
function tbTest:OnDeath_Boss(pNpc)
	local pKillerPlayer = pNpc.GetPlayer();
	local szMsg = "";
	if (pKillerPlayer) then
		--杀死BOSS的玩家处理
		local RandJB = MathRandom(unpack(DuoBao.RandJBCoin[self.nType]));
		local nTeamId	= pKillerPlayer.nTeamId;
		if (nTeamId ~= 0) then
			local tbPlayerId, nMemberCount	= KTeam.GetTeamMemberList(nTeamId);
			RandJB = math.floor(RandJB/nMemberCount);
			for i, nPlayerId in pairs(tbPlayerId) do
				local pPlayer	= KPlayer.GetPlayerObjById(nPlayerId);
				if (pPlayer and pPlayer.nMapId == him.nMapId) then
					pPlayer.AddJbCoin(RandJB);
					szMsg = "<color=yellow>"..pPlayer.szName.."<color> <color=yellow> Đấu trường - " .. self.szType .. " hạ gục BOSS <color>, nhận được phần thưởng ngẫu nhiên: <color=yellow>"..RandJB.."<color> đồng";
					KDialog.MsgToGlobal(szMsg);	
				end
			end
		else
			pKillerPlayer.AddJbCoin(RandJB);
			szMsg = "<color=yellow>"..pKillerPlayer.szName.."<color> giết <color=yellow> Đấu trường - ".. self.szType .." hạ gục BOSS <color>, nhận được phần thưởng ngẫu nhiên: <color=yellow>"..RandJB.."<color> đồng";
			KDialog.MsgToGlobal(szMsg);	
		end
	end
	local nMapId, nPosX, nPosY = him.GetWorldPos();
	local pItem = KItem.AddItemInPos(nMapId, nPosX, nPosY, DuoBao.BoxGDPL[self.nType][1],DuoBao.BoxGDPL[self.nType][2],DuoBao.BoxGDPL[self.nType][3],DuoBao.BoxGDPL[self.nType][4],0, 0, 0, nil, nil, 0, 0);
	self.pBoxItem = pItem;
	self.pBoxItemId = pItem.dwId;
	szMsg = string.format("<color=yellow> Đấu trường - %s <color> bước vào giai đoạn PK, <color=yellow>đồng thưởng<color> có thể bị giảm.",self.szType);
	KDialog.MsgToGlobal(szMsg);	
	self.nState=2;
	--切换全部攻击模式状态
	self:OnBwStartToFight(2);
end

-- 初始化活动
function tbTest:InitGame(nType)
	-- 设定可选配置项
	self.tbMisCfg	= {
		tbEnterPos		= {	[1] = DuoBao.MAP_INPOS[nType]},	-- 进入坐标
--		tbDeathRevPos	= {	[1] = DuoBao.MAP_INPOS},	-- 进入坐标
		tbLeavePos		= { [1] = DuoBao.LeavePos},		-- 离开坐标
--		nFightState	= 1,						-- 战斗状态
		nPkState		= Player.emKPK_STATE_PRACTISE,			-- 加入时禁止切换PK模式
		nDeathPunish	= 1,		-- 加入时禁止死亡惩罚
		tbCamp			= {[1] = 1},		-- 分别设定阵营
		nOnDeath		= 1,	-- 开启玩家死亡回调 self.OnDeath
	};
	if nType == 1 then
		self.tbMisCfg.nForbidTeam		= 1;		-- 加入时退出队伍、禁止组队
		self.tbMisCfg.nInBattleState	= 1;	-- 战场模式
	end
	self.nMapId			= DuoBao.MAP_INFO[nType];
	self.szMapName		= GetMapNameFormId(DuoBao.MAP_INFO[nType]);
	self.nWorldIdx		= SubWorldID2Idx(DuoBao.MAP_INFO[nType]);
	self.nType			= nType;
	self.nState			= 0;
	if nType == 1 then
		self.szType			= " Cá nhân";
	elseif nType == 2 then
		self.szType			= " Chiến đội";
	end	
	self.tbGroups	= {};	-- [nGroupId]	= {nPlayerId, nPlayerId, ...}-- 特别的，nGroupId 为 0 表示全部	
	self.tbPlayers	= {};	-- [nPlayerId]	= tbPlayerInfo;
	self.tbTimers	= {};	-- [nTimerId]	= tbTimer;
	self.nStateJour = 0;
end

-- 开启活动
function tbTest:GSOpenGame()
	self:Open();		-- 开启Mission
end

-- //SmallTimer的定时调用
function tbTest:OnSmallTimer()

	local oldWorld = SubWorld;
	--SubWorld = self.nIdx

	if not self.nState or self.nState == 0 then
		return 0
	end;

	if (self.nState == 1) then 	--BOSS阶段
		self:OnKillBossState();
	elseif (self.nState == 2) then --PK阶段
		self:OnPKState();
	elseif (self.nState == 0) then  --休息阶段
		--self:BroadcastMsg("战斗结束！");
		self:OnBwStartToFight(0);
		return 0;	--关闭Timer1
	end;
	--SubWorld = oldWorld;
end;

function tbTest:OnKillBossState()
	local szMsg = string.format("Tại <color=yellow> Đấu trường - %s <color> <color=yellow>, BOSS <color> đã xuất hiện , hãy mau hạ gục nó để nhận bảo vật!",self.szType);
	--KDialog.MsgToGlobal(szMsg);	
end

function tbTest:OnPKState()
	local szMsg = "";
	if (self.pBoxPlayer ~= nil) then
		local szPName = self.pBoxPlayer.szName;
		szMsg = string.format("Tại <color=yellow> Đấu trường - %s <color> <color=yellow>bước vào giai đoạn tranh chấp<color>, các hiệp sĩ mau giết <color=yellow>[%s]<color> để giành bảo vật",self.szType,szPName);
	else
		szMsg = string.format("Tại <color=yellow>Đấu trường - %s <color> <color=yellow> bước vào giai đoạn giao tranh <color>",self.szType);
	end
	KDialog.MsgToGlobal(szMsg);	
end

-- //TotalTimer的定时调用
function tbTest:OnTotalTimer()
	self.nState = 0;
	self:OnBwStartToFight(0);
	self.tbTimer3	= self:CreateTimer(DuoBao.TIMER_3, self.OnLastTimer, self);	-- 擂台5秒后送出选手
	return 0;	-- 关闭Timer
end;

-- //结束后5秒计时
function tbTest:OnLastTimer()
	self:Close();		--结束 将场内选手送出
	return 0;	-- 关闭Timer
end;

--将一个组的人都变成战斗状态
function tbTest:OnBwStartToFight(nState)

	local nType		= self.nType;	--参加比赛的类型
	local PTab,PCount = self:GetPlayerList()
	local pOldPlayer = PlayerIndex;
	local pOldMe = me;
	
	for i = 1, PCount do
		me = PTab[i];
		PlayerIndex = me.nPlayerIndex;
		if nState == 0 then 							--休息状态
			me.SetFightState(0);						--设置战斗状态
			me.nPkModel = Player.emKPK_STATE_PRACTISE;	--练功模式
		elseif nState == 1 then 						--击杀BOSS阶段
			me.SetFightState(1);						--设置战斗状态
			me.nPkModel = Player.emKPK_STATE_PRACTISE;	--练功模式
		elseif nState == 2 then 						--PK阶段
			me.SetFightState(1);						--设置战斗状态
			if self.nType == 1 then
				me.nPkModel = Player.emKPK_STATE_BUTCHER;	--屠杀模式
			elseif self.nType == 2 then
				me.nPkModel = Player.emKPK_STATE_TONG;		--帮会模式
			end
		end
	end;
	PlayerIndex = pOldPlayer;
	me = pOldMe;
end;

-- //擂台中角色死亡时处理
function tbTest:OnDeath(pKillerNpc)
	local pKillerPlayer = pKillerNpc.GetPlayer();
	
	local szDeathName = me.szName;
	local szMsg;
	
	if (pKillerPlayer) then
		local szKillerName = pKillerPlayer.szName--GetName();
		szMsg  = string.format("Tại <color=yellow>Đấu trường - %s <color> <color=yellow>%s<color> hạ gục <color=yellow>%s<color>.", 
						self.szType,szKillerName, szDeathName);
		KDialog.MsgToGlobal(szMsg);	
	end;
	self:DropBox(me,1);
	self:KickPlayer(me);
	me.Revive(0);
end;


function tbTest:DuoBaoWindowMsg(szMsg)
	local tbPlayer, nCount	= self:GetPlayerList();
	local pPlayerOld	= me;
	for _, pPlayer in ipairs(tbPlayer) do
		me	= pPlayer;
		me.CallClientScript({"Ui:ServerCall", "UI_INFOBOARD", "OnOpen", szMsg});
	end
	me	= pPlayerOld;
end;

-- //显示即时信息：Thời gian còn
function tbTest:ShowTimeInfo(pPlayer)
	Dialog:ShowBattleMsg(pPlayer, 1, 0);
	Dialog:SendBattleMsg(pPlayer, "")
	local nRemainFrame		= Timer:GetRestTime(self.tbTimer2.nRegisterId);
	local szMsgFormat		= "<color=green>Thời gian còn lại: <color> <color=white>%s<color>";
	Dialog:SetBattleTimer(pPlayer, szMsgFormat, nRemainFrame);
end;


function tbTest:DeleteTimeInfo(pPlayer)
	Dialog:ShowBattleMsg(pPlayer, 0, Env.GAME_FPS);
end;

DuoBao.tbMisBase = tbTest;
DuoBao:InitGame(1);	-- 初始化个人战
DuoBao:InitGame(2);	-- 初始化帮会战