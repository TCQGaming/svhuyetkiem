-- 文件名　：challengenpc.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-05-28 14:22:07

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");

QianCengTower.RoomBaseMission = QianCengTower.RoomBaseMission or Mission:New();
local RoomBaseMission = QianCengTower.RoomBaseMission;

RoomBaseMission.DEF_GAMESTATE_BEGIN		= 0;
RoomBaseMission.DEF_GAMESTATE_REST		= 1;
RoomBaseMission.DEF_GAMESTATE_DURING	= 2;
RoomBaseMission.DEF_GAMESTATE_FAILED	= 3;
RoomBaseMission.DEF_GAMESTATE_FINISHED	= 4;
RoomBaseMission.DEF_GAMESTATE_END		= 5;

RoomBaseMission.DEF_NPC_TYPE_NORMAL		= 1;
RoomBaseMission.DEF_NPC_TYPE_JING		= 2;
RoomBaseMission.DEF_NPC_TYPE_BOSS		= 3;
RoomBaseMission.DEF_NPC_TYPE_STAR		= 4;
RoomBaseMission.DEF_NPC_TYPE_STAR_DAMAGE1 = 5;
RoomBaseMission.DEF_NPC_TYPE_STAR_DAMAGE2 = 6;
RoomBaseMission.DEF_NPC_TYPE_STAR_BUFF	= 7;
RoomBaseMission.DEF_NPC_TYPE_BOX		= 8;
RoomBaseMission.DEF_NPC_TYPE_BOX_NPC	= 9;
RoomBaseMission.DEF_NPC_TYPE_BOX_BOSS	= 10;

RoomBaseMission.TIME_RANDOM_STAR		= Env.GAME_FPS * 15;
RoomBaseMission.TIME_BUFF_BAD			= Env.GAME_FPS * 5;
RoomBaseMission.TIME_BUFF_GOOD			= Env.GAME_FPS * 60 * 10;
RoomBaseMission.TIME_BUFF_NPC_BUFF		= Env.GAME_FPS * 60 * 3;
RoomBaseMission.tbStarSkill				= {
		[RoomBaseMission.DEF_NPC_TYPE_STAR_DAMAGE1] = 761, -- 1786
		[RoomBaseMission.DEF_NPC_TYPE_STAR_DAMAGE2] = 1477,
		[RoomBaseMission.DEF_NPC_TYPE_STAR_BUFF]	= 1086,
	};

RoomBaseMission.TIME_NORMAL_REST		= Env.GAME_FPS * 5;
RoomBaseMission.TIME_5_STEP_REST		= Env.GAME_FPS * 60 * 1.5;
RoomBaseMission.TIME_10_STEP_REST		= Env.GAME_FPS * 60 * 1.5;

RoomBaseMission.TIME_CHECK_ALL_DEATH	= Env.GAME_FPS * 15; -- 15秒后所有死亡玩家未复活则挑战失败

QianCengTower.DEF_NPC_DROP_ITEM_NORMAL	= 1;
QianCengTower.DEF_NPC_DROP_ITEM_JIN 	= 2;
QianCengTower.DEF_NPC_DROP_ITEM_SMALL_BOSS	= 3;
QianCengTower.DEF_NPC_DROP_ITEM_BIG_BOSS 	= 4;

QianCengTower.nReviveCoin = 100;
QianCengTower.nReviveItemWareId = 678;

QianCengTower.szNpcDropFold = "\\setting\\mission\\qiancengtower\\dropitem\\";
QianCengTower.tbNpcDropItem = {
		[QianCengTower.DEF_NPC_DROP_ITEM_NORMAL] 		= {"nomal_npc_", 	1},
		[QianCengTower.DEF_NPC_DROP_ITEM_JIN] 			= {"jing_", 		3},
		[QianCengTower.DEF_NPC_DROP_ITEM_SMALL_BOSS] 	= {"small_boss_", 	16},
		[QianCengTower.DEF_NPC_DROP_ITEM_BIG_BOSS] 		= {"big_boss_", 	16},
	};

QianCengTower.MAX_REVIVE_COUNT_IN_ONE_GAME = 2;

QianCengTower.MAX_RANDOM_NUM = 10000;
-- 随机物品掉落
QianCengTower.DEF_RANDOM_ITEM_XINGYI 	= 1;
QianCengTower.DEF_RANDOM_ITEM_YUEWU 	= 2;
QianCengTower.DEF_RANDOM_ITEM_YUEJIA 	= 3;

QianCengTower.DEF_SKILL_NPC_REDUCE		= 999;

QianCengTower.tbRandomItemList = {
	[QianCengTower.DEF_RANDOM_ITEM_XINGYI] = {
			nNum	= 1,
			szRandomFile = "xingyiquanfasanye.txt",
		},
	[QianCengTower.DEF_RANDOM_ITEM_YUEWU] = {
			nNum	= 2,
			szRandomFile = "yuewumujicanye.txt",
		},
	[QianCengTower.DEF_RANDOM_ITEM_YUEJIA] = {
			nNum	= 1,
			szRandomFile = "yuejiaqiangfaduanpian.txt",
		},
};

QianCengTower.tbFinishAwardLevel = {
		[1] = {15 * 60, 1.3},
		[2] = {25 * 60, 1.1},
		[3] = {45 * 60, 0.9},
		[4] = {75 * 60, 0.7},
	};

-- 随机boss
QianCengTower.DEF_RANDOM_ADD_AWARD_BOSS = 500;
QianCengTower.tbAwardBossList = {
		[1] = {6600, 11561},
		[2] = {1600, 11562},
		[3] = {1800, 11563},
	};
QianCengTower.tbRandomBossList = {
		[1] = {6600, 11600},
		[2] = {1600, 11601},
		[3] = {1800, 11602},
	};
	
QianCengTower.tbAwardBossItem = {
		[11561] = {"dropitem", "awardboss_xuanjing.txt", 3},
		[11562] = {"dropitem", "awardboss_bindmoney.txt", 3},
		[11563] = {"baseexp", 60},
	};

QianCengTower.DEF_TIME_AWARD_BOSS_LIVE_TIME	= 60 * 18;

QianCengTower.DEF_FINISH_AWARD_EXP_TIME	= 30;
QianCengTower.tbTeamNum2RoomLevel = {
	[1] = {0.85,  0.85},
	[2] = {1, 2},
	[3] = {1.15, 3.45},	
};

QianCengTower.DEF_SKILL_ID_BUFF_BOX = 999;
QianCengTower.DEF_SKILL_LEVEL_BUFF_BOX = 2;
QianCengTower.DEF_SKILL_TIME_BUFF_BOX = Env.GAME_FPS * 10 * 60;

QianCengTower.tbClearSkillId = {1854, 1853, 1419, 999};


QianCengTower.DEF_SKILL_ID_ADD_NPC_FIGHT = 1729;

QianCengTower.tbAddFightSkillLevelRoom = {
	[101] = 8,
	[111] = 18,
	[121] = 28,
	[131] = 38,
	[141] = 48,
	[151] = 60,
};

QianCengTower.szNewPlayerFinishMsg = "\n\n<color=yellow>Mục tiêu: <color=green>Vượt qua thử thách 5 Tầng<color>\n<tut=了解玩法,0,UiManager:OpenWindow('UI_MISSION_GUIDE'| 5)>";

-----------  Func ---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
function RoomBaseMission:init(nMissionId, nRoomNum, bIsNewPlayerApply, nGameMapId)
	self.nGameMapId = nGameMapId;
	self.nMissionId = nMissionId;
	self.nRoomType = nRoomType;
	self.nCurRoomNum = nRoomNum;
	self.nGameState = self.DEF_GAMESTATE_BEGIN;
	self.nRoomLevel = 0;
	self.nStartRoomNum = nRoomNum;
	self.bIsNewPlayerApply = bIsNewPlayerApply or 0; -- 新手副本标记
	
	local tbRoomInfo = QianCengTower:GetRoomInfo(self.nCurRoomNum);
	-- 设定Mission可选配置项
	self.tbMisCfg	= {
		tbEnterPos		= {};
		nInBattleState	= 1,								-- 禁止不同阵营组队
		nDeathPunish	= 1,								-- 无死亡惩罚
		nOnDeath		= 1,								-- 开启玩家死亡回调
		nOnKillNpc		= 1,								-- 开启玩家杀怪回调
		nOnMovement		= 1,								-- 参加某项活动
		nForbidSwitchFaction = 1,							-- 禁止切换门派
		nForbidStall	= 1,								-- 禁止摆摊
		nDisableOffer	= 1,
		nDisableFriendPlane = 1,							-- 禁止好友界面
		nDisableStallPlane	= 1,							-- 禁止交易界面
		nDisableSeriesPK	= 1,							-- 关闭通用连斩
		nReleaseDynMapId = nGameMapId,						-- 是不是动态地图，需不需要释放
	};

	self.tbGroups	= {};
	self.tbPlayers	= {};
	self.tbTimers	= {};	
	
	self.nCurRoomRound = 0;
	self.tbMisEventList = QianCengTower.tbSignUpEventList;
	self.tbNpcList = {};
	self.nStarCount = 0;
	self.nBoxCount = 0;
	self.nRoomType = tbRoomInfo.nRoomType;
	self.nPlayerDeathCount = 0;
	self.nIsEndGame = 0;
	self.nMaxStepCount = 1;
	self.nStarRandomRound = 0;
	self.nFinishBoxNum = 0;
	self.nStarFinishNum = 0;	
	self.nBeginGameTime = 0;
	self.nTotalAddKillNpc = 0;
	self.nCurRoomStartTime = 0;
	
	self.nStateJour = 0;
	self.tbNowStateTimer = nil;
end

function RoomBaseMission:OnOpen()
	self:GoNextState();
	self:AddYaoShangAndYeLianDaShi(self.nCurRoomNum);
end

function RoomBaseMission:GameEnd()
	if (self.nIsEndGame > 0) then
		return;
	end
	
	self.nStateJour = #self.tbMisEventList - 1;
	self:GoNextState();
	return;
end

function RoomBaseMission:GameOver()
	self.nGameState = self.DEF_GAMESTATE_END;
	self:Close();
	QianCengTower:CloseGameMission(self.nMissionId, self.bIsNewPlayerApply);
end

function RoomBaseMission:OnClose()
	if (self.nNeedReleaseDynMapId and self.nNeedReleaseDynMapId > 0) then
	--	Map:UnRegisterMapForbidRemoteRevive(self.nNeedReleaseDynMapId);
		Map:UnRegisterMapForbidReviveType(self.nNeedReleaseDynMapId);		
		ReleaseDynMap(self.nNeedReleaseDynMapId);
		self.nNeedReleaseDynMapId = 0;
	end
end

function RoomBaseMission:ApplyMapSuccessd(nNewMapId)
	self.nNeedReleaseDynMapId = self.nGameMapId;
	self.nGameMapId = nNewMapId;
	self.tbMisCfg.nReleaseDynMapId = nNewMapId;
	return 1;
end

function RoomBaseMission:RevivePlayer()
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		if pPlayer.IsDead() == 1 then
			pPlayer.ReviveImmediately(1);
			pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_MSGBOX"});
			self.nPlayerDeathCount = self.nPlayerDeathCount - 1;
		end
	end
	return 1;
end

function RoomBaseMission:SetPlayersState(bState)
	
end

-- 禁止药箱
function RoomBaseMission:ForbidXiang(nState)
	
end

-- 禁止药箱
function RoomBaseMission:ProcessOtherEvent()
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		pPlayer.GetTempTable("QianCengTower").nFreeFanPai = nil;
	end	
end

function RoomBaseMission:OnInitalGameRoom(nCurRoomNum)
	local tbRoomInfo = self:GetRoomInfo(nCurRoomNum);
	self.tbNpcList = {};
	self.nStarCount = 0;
	self.nBoxCount = 0;
	self.nCurRoomRound = 0;
	self.tbMisEventList = self:GetRoomEventList(nCurRoomNum, tbRoomInfo.nRoomType);
	self.nStateJour = 0;
	self.nRoomType = tbRoomInfo.nRoomType;
	self.nPlayerDeathCount = 0;
	self.nStarRandomRound = 0;
	self.nStarFinishNum = 0;
	self.nFinishBoxNum = 0;
	return 1;
end

function RoomBaseMission:ClearPlayerSkillState(pPlayer)
	for _, nSkillId in pairs(QianCengTower.tbClearSkillId) do
		local nLevel = pPlayer.GetSkillState(nSkillId);
		if (nLevel > 0) then
			pPlayer.RemoveSkillState(nSkillId);
		end
	end
end

function RoomBaseMission:ApplyNewMap(nCurRoomNum)
	local tbRoomInfo = self:GetRoomInfo(nCurRoomNum);
	local nMod = math.fmod(nCurRoomNum, 10);
	if (nMod == 1) then
		local nMapFlag = Map:LoadDynMap(1, tbRoomInfo.nTempMapId, {QianCengTower.OnLoadMapFinish, QianCengTower, nil, nCurRoomNum, self.nMissionId, self.bIsNewPlayerApply});
		assert(nMapFlag == 1);
	end	
end

function RoomBaseMission:GetRoomInfo(nRoomNum)
	return QianCengTower:GetRoomInfo(nRoomNum);
end

function RoomBaseMission:GetNpcAddPos(nTempMapId, nNpcType)
	local tbMapPos = QianCengTower.tbMap2PosCfg[nTempMapId];
	if (self.DEF_NPC_TYPE_NORMAL == nNpcType) then
		return tbMapPos.tbNormalNpcPos;
	end
	
	if (self.DEF_NPC_TYPE_JING == nNpcType) then
		return tbMapPos.tbJingNpcPos;
	end
	
	if (self.DEF_NPC_TYPE_BOSS == nNpcType) then
		return tbMapPos.tbBossNpcPos;
	end
	
	if (self.DEF_NPC_TYPE_STAR == nNpcType) then
		return tbMapPos.tbStarPos, tbMapPos.tbStarTrapName;
	end

	if (self.DEF_NPC_TYPE_BOX == nNpcType) then
		return tbMapPos.tbBoxPos;
	end

	if (self.DEF_NPC_TYPE_BOX_NPC == nNpcType) then
		return tbMapPos.tbBoxNpcPos;
	end

	if (self.DEF_NPC_TYPE_BOX_BOSS == nNpcType) then
		return tbMapPos.tbBoxBossPos;
	end
	
	return;
end

function RoomBaseMission:GetNpcInfo(nCurRoomNum, nNpcType)
	local tbRoomInfo		= self:GetRoomInfo(nCurRoomNum);
	
	if (self.DEF_NPC_TYPE_NORMAL == nNpcType) then
		return tbRoomInfo.nNormalNpc, tbRoomInfo.nNormalLevel, tbRoomInfo.nNormalNum;
	end
	
	if (self.DEF_NPC_TYPE_JING == nNpcType) then
		return tbRoomInfo.nJingNpc, tbRoomInfo.nJingLevel, tbRoomInfo.nJingNum;
	end
	
	if (self.DEF_NPC_TYPE_BOSS == nNpcType) then
		return tbRoomInfo.nBossNpc, tbRoomInfo.nBossLevel, tbRoomInfo.nBossNum;
	end
	
	if (self.DEF_NPC_TYPE_STAR == nNpcType) then
		return tbRoomInfo.nStar, tbRoomInfo.nNpcLevel, tbRoomInfo.nStarNum;
	end

	if (self.DEF_NPC_TYPE_STAR_DAMAGE1 == nNpcType) then
		return tbRoomInfo.nStarDamage1, tbRoomInfo.nNpcLevel, tbRoomInfo.nStarDamage1Num;
	end

	if (self.DEF_NPC_TYPE_STAR_DAMAGE2 == nNpcType) then
		return tbRoomInfo.nStarDamage2, tbRoomInfo.nNpcLevel, tbRoomInfo.nStarDamage2Num;
	end
	
	if (self.DEF_NPC_TYPE_STAR_BUFF == nNpcType) then
		return tbRoomInfo.nStarBuffNpc, tbRoomInfo.nNpcLevel, tbRoomInfo.nStarBuffNpcNum;
	end

	if (self.DEF_NPC_TYPE_BOX == nNpcType) then
		return tbRoomInfo.nBox, tbRoomInfo.nNpcLevel, tbRoomInfo.nBoxNum;
	end
	
	if (self.DEF_NPC_TYPE_BOX_NPC == nNpcType) then
		return tbRoomInfo.nBoxNpc, tbRoomInfo.nNpcLevel, tbRoomInfo.nBoxNpcNum;
	end
	
	if (self.DEF_NPC_TYPE_BOX_BOSS == nNpcType) then
		return tbRoomInfo.nBoxBoss, tbRoomInfo.nNpcLevel, tbRoomInfo.nBoxBossNum;
	end	

	return 0;
end

function RoomBaseMission:GetRoomEventList(nRoomNum, nRoomType)
	local nRestTime = self.TIME_NORMAL_REST;
	local n5Step = math.fmod(self.nCurRoomNum, 5);
	local n10Step = math.fmod(self.nCurRoomNum, 10);	
	local tbMisEventList = {};
	if (nRoomType == QianCengTower.DEF_ROOM_TYPE_NPC_KILL or
		nRoomType == QianCengTower.DEF_ROOM_TYPE_BOSS_KILL) then
		for i=1, 3 do
			tbMisEventList[#tbMisEventList + 1] = {"NpcStepRest", QianCengTower.DEF_TIME_NPC_STEP_REST, "AddStepNpc"};
			
			local nTime = QianCengTower.DEF_TIME_NORMAL_NPC_STEP - QianCengTower.DEF_TIME_NPC_STEP_REST;
			if (3 == i and n5Step == 0) then
				nTime = QianCengTower.DEF_TIME_BOSS_NPC_STEP - QianCengTower.DEF_TIME_NPC_STEP_REST;
			end
			
			tbMisEventList[#tbMisEventList + 1] = {"NpcStepKill", nTime, "KillNpcStepEnd"};
			if (3 == i) then
				tbMisEventList[#tbMisEventList] = {"NpcStepKill", nTime, "NormalGameRoundEnd"};
			end
		end
	end
	
	
	if (nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_STAR) then
		tbMisEventList[#tbMisEventList + 1] = {"StarStepRest", QianCengTower.DEF_TIME_NPC_STEP_REST, "AddStepStar"};
		tbMisEventList[#tbMisEventList + 1] = {"StarStepEnd", QianCengTower.DEF_TIME_CATCH_STAR, "NormalGameRoundEnd"};
	end
	
	if (nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_BOX) then
		tbMisEventList[#tbMisEventList + 1] = {"BoxStepRest", QianCengTower.DEF_TIME_NPC_STEP_REST, "AddStepBox"};
		tbMisEventList[#tbMisEventList + 1] = {"BoxStepEnd", QianCengTower.DEF_TIME_CATCH_BOX, "NormalGameRoundEnd"};
	end
	
	if (n10Step == 0) then
		nRestTime = self.TIME_5_STEP_REST;
	elseif (n5Step == 0) then
		nRestTime = self.TIME_10_STEP_REST;
	end
	tbMisEventList[#tbMisEventList + 1] = {"NormalStepRest", nRestTime, "NormalStepRestEnd"};
	
	return tbMisEventList;
end

function RoomBaseMission:GetPlayerRoomSave(pPlayer)
	local nBestRoomNum = QianCengTower:GetPlayerRoomSave(pPlayer);
	if (self.nCurRoomNum > nBestRoomNum) then
		return self.nCurRoomNum;
	end
	return nBestRoomNum;
end

function RoomBaseMission:UpdatePlayerBestRoom(pPlayer, nCurRoomNum)
	local nBestRoomNum = QianCengTower:GetPlayerRoomSave(pPlayer);
	if (nCurRoomNum > nBestRoomNum) then
		QianCengTower:SetPlayerRoomSave(pPlayer, nCurRoomNum);
	end
	return 1;
end

-- 可复活的机会
function RoomBaseMission:GetPlayerReviveNum(pPlayer)	
	local nAlreadyRevive = pPlayer.GetTempTable("QianCengTower").nAlreadyRevive;
	if (nAlreadyRevive >= QianCengTower.MAX_REVIVE_COUNT_IN_ONE_GAME) then
		return 0;
	end
	
	return QianCengTower.MAX_REVIVE_COUNT_IN_ONE_GAME - nAlreadyRevive;
end

function RoomBaseMission:RevivePlayerByItem(pPlayer)
	local nAlreadyRevive = pPlayer.GetTempTable("QianCengTower").nAlreadyRevive or 0;
	
	if (nAlreadyRevive >= QianCengTower.MAX_REVIVE_COUNT_IN_ONE_GAME) then
		pPlayer.Msg("Ngươi đã sử dụng hết số lần hồi sinh tại Tầng này!");
		return 0;
	end

	if pPlayer.IsDead() ~= 1 then
		return 0;
	end
	
	local nSaveCount = QianCengTower:GetPlayerReviveNum(pPlayer);
	local nReviveCount = math.floor(nSaveCount / 3);
	if (nReviveCount > 0) then
		QianCengTower:SetPlayerReviveNum(pPlayer, nSaveCount - 3);
	else
		if (pPlayer.nCoin < QianCengTower.nReviveCoin) then
			pPlayer.Msg(string.format("Không đủ %s Đồng, không thể hồi sinh!", QianCengTower.nReviveCoin));
			return 0;
		end
		
		local nRet = pPlayer.ApplyAutoBuyAndUse(QianCengTower.nReviveItemWareId, 1);
		if (nRet ~= 1) then
			pPlayer.Msg("Không thể hồi sinh!");
			return 0;
		end
	end
	
	self.nPlayerDeathCount = self.nPlayerDeathCount - 1;
	pPlayer.GetTempTable("QianCengTower").nAlreadyRevive = nAlreadyRevive + 1;
	
	if (self.tbOnAllDeathCheckTimer) then
		self.tbOnAllDeathCheckTimer:Close();
		self.tbOnAllDeathCheckTimer = nil;
		self:UpdateAllPlayerRightInfo(self.nRoomType, self.nCurRoomNum, self:GetStateLastTime());
	end
	
	pPlayer.ReviveImmediately(1);
	self:UpdatePlayerRightUpdateInfo(pPlayer, self.nRoomType, self.nCurRoomNum);
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "revive", pPlayer.nId, string.format("%s", self.nCurRoomNum));
	return 1;
end

function RoomBaseMission:UpdatePlayerReviveInfo(pPlayer)
	if (self.nGameState == self.DEF_GAMESTATE_BEGIN) then
		return;
	end
	self:UpdatePlayerRightUpdateInfo(pPlayer, self.nRoomType, self.nCurRoomNum);
end

function RoomBaseMission:UpdateAllPlayerRightInfo(nRoomType, nCurRoomNum, nTime)
	local szNormalMsg = QianCengTower.MSG_NORMAL_INFO;
	local szMapName = QianCengTower.szDefaultName;
	
	local nIndex = math.ceil(nCurRoomNum / 10);
	if (nIndex <= 10) then
		szMapName = QianCengTower.tbFuBenMapName[nIndex];
	end
	
	nTime = nTime or self.tbMisEventList[self.nStateJour + 1][2];
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		local nBestRoomNum = self:GetPlayerRoomSave(pPlayer);
		local szSengMsg = string.format(szNormalMsg, szMapName, nCurRoomNum, nBestRoomNum);
		szSengMsg = szSengMsg .. QianCengTower.MSG_LAST_TIME;
		QianCengTower:UpdateTimeUi(pPlayer, szSengMsg, nTime);
		self:UpdatePlayerRightUpdateInfo(pPlayer, nRoomType, nCurRoomNum);
	end

	return 1;
end

function RoomBaseMission:UpdatePlayerRightUpdateInfo(pPlayer, nRoomType, nCurRoomNum)
	local nReviveNum = self:GetPlayerReviveNum(pPlayer);
	local nTotalCount = QianCengTower:GetPlayerReviveNum(pPlayer);
	local nFreeCount = math.floor(nTotalCount / 3);
	local szSengMsg = string.format(QianCengTower.MSG_UPDATE_INFO, nReviveNum, nFreeCount);
	if (nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_STAR) then
		szSengMsg = szSengMsg .. string.format(QianCengTower.MSG_STAR_COUNT_INFO, self.nStarCount, self.nStarFinishNum);
	elseif (nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_BOX) then
		local szMsg = QianCengTower.tbBoxTaskMsgInfo[98];
		if (QianCengTower.tbBoxTaskMsgInfo[nCurRoomNum]) then
			szMsg = QianCengTower.tbBoxTaskMsgInfo[nCurRoomNum];
		end
		
		szSengMsg = szSengMsg .. string.format(szMsg, self.nBoxCount, self.nFinishBoxNum);
	elseif (nRoomType == QianCengTower.DEF_ROOM_TYPE_NPC_KILL) then
		local nLastCount = 0;
		if (self.tbNpcList) then
			nLastCount = Lib:CountTB(self.tbNpcList);
		end
		szSengMsg = szSengMsg .. string.format(QianCengTower.MSG_NPC_COUNT_INFO, self.nCurRoomRound, nLastCount, self.nTotalAddKillNpc);
	end

	if (self.bIsNewPlayerApply == 1) then
		szSengMsg = szSengMsg .. QianCengTower.szNewPlayerFinishMsg;
	end
	
	QianCengTower:UpdateMsgUi(pPlayer, szSengMsg);
end

function RoomBaseMission:OnCreateTeam()
	local nCaptionAId = 0;
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		if nCaptionAId == 0 then
			KTeam.CreateTeam(pPlayer.nId);	--建立队伍
			nCaptionAId = pPlayer.nId;
		else
			KTeam.ApplyJoinPlayerTeam(nCaptionAId, pPlayer.nId);	--加入队伍
		end
	end	
end

function RoomBaseMission:OnJoin()
	--me.CallClientScript({"UiManager:OpenWindow","UI_QIANCENGFUBENPANEL"});
	if (me.nTeamId <= 0 and self.bIsNewPlayerApply == 1) then
		KTeam.CreateTeam(me.nId);
	end
	
	me.TeamDisable(1);
	me.nForbidChangePK = 1;					-- 禁止切换状态
	me.nPkModel = Player.emKPK_STATE_PRACTISE;	-- 战斗模式	
	me.SetLogoutRV(1);
	me.ForbidEnmity(1);
	QianCengTower:OpenSingleUi(me, QianCengTower.MSG_SIGN_UP, self:GetStateLastTime());
	QianCengTower:UpdateTimeUi(me, QianCengTower.MSG_SIGN_UP, self:GetStateLastTime());

	local szMsg2 = "<color=green>Hãy chuẩn bị<color>";

	if (self.bIsNewPlayerApply == 1) then
		Task.tbFubenTask:AddJoinQianTimeAndCount(me);
		Task.tbFubenTask:OnPlayerQianCengChaHu(me);
		Task.tbFubenTask:OnGetQianCengCai(me);
		szMsg2 = szMsg2 .. QianCengTower.szNewPlayerFinishMsg;
	end
	
	me.GetTempTable("QianCengTower").nIsInNewQianCeng = self.bIsNewPlayerApply;

	QianCengTower:UpdateMsgUi(me, szMsg2);	
	Dialog:SendBlackBoardMsg(me, "Thử thách Thiên Tầng Tháp sắp bắt đầu, hãy chuẩn bị!");
	me.GetTempTable("QianCengTower").nAlreadyRevive = 0;
	me.GetTempTable("QianCengTower").nFanPaiRound = nil;
end

function RoomBaseMission:LeaveGame(pPlayer)
	self:KickPlayer(pPlayer, 1);
end

function RoomBaseMission:OnLeave()
	me.CallClientScript({"UiManager:CloseWindow","UI_QIANCENGFUBENPANEL"});
	QianCengTower:CloseFanPaiGame(me, self.bIsNewPlayerApply);
	QianCengTower:SetPlayerMissionId(me, 0);
	me.TeamDisable(0);
	me.SetLogoutRV(0);
	me.ForbidEnmity(0);
	me.nForbidChangePK = 0;
	-- 传送点
	QianCengTower:CloseSingleUi(me);
	local nMapId, nMapX, nMapY = QianCengTower:GetPlayerLeavePos(me);
	me.GetTempTable("QianCengTower").tbMission = nil;
	
	if (self.bIsNewPlayerApply == 1) then
		nMapId, nMapX, nMapY = Task.tbFubenTask:GetNewPlayerQianCengOutPos();
		if me.GetTask(Task.tbFubenTask.DEF_TASK_GROUP,Task.tbFubenTask.DEF_TASK_ID_TASK_STEP) >=  Task.tbFubenTask.DEF_NEWTASK_STEP_MAX then
			Task:AskAccept(13, 100)	--询问接受50级任务皇储-惊变
			me.CallClientScript({"Ui:ServerCall", "UI_EVENTGUIDE", "OnEnterGame"});	--开启新服14天乐活动
		end
	end
	
	me.NewWorld(nMapId, nMapX, nMapY);
	--Player:ForbidYaoXiang(me, 0);
	local nRoom = QianCengTower:GetPlayerRoomSave(me);
	self:ClearPlayerSkillState(me);
	
	me.GetTempTable("QianCengTower").nFreeFanPai = nil;
	me.GetTempTable("QianCengTower").nIsInNewQianCeng = nil;

	GCExcute{"QianCengTower:InsertQianCengLadderInfo", me.szName, nRoom};
	
	if (self.nGameState == self.DEF_GAMESTATE_BEGIN) then
		return;
	end
	
	if (self.nIsEndGame == 0) then
		self:StatLeaveLogOnePlayer(me, 3);
	end
	
	local nJoinCount = self:GetPlayerCount(0);
	if (nJoinCount <= 0) then
		if (self.nIsEndGame ~= 1) then
			self.nGameState = self.DEF_GAMESTATE_FAILED;
		end
		self:GameEnd();
		return;
	end
	
	if (me.IsDead() == 1) then
		self.nPlayerDeathCount = self.nPlayerDeathCount - 1;
	end
	
	if (self.nPlayerDeathCount < nJoinCount) then
		return;
	end	
	
	if (self.tbOnAllDeathCheckTimer) then
		return;
	end

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "<color=yellow>Tất cả thành viên đội đều bị thương nặng đang chờ hồi sinh<color>\n<color=green>Thời gian còn lại: <color>%s", self.TIME_CHECK_ALL_DEATH);
		QianCengTower:UpdateMsgUi(pPlayer, "Nếu không hồi sinh, Thiên Tầng Tháp sẽ đóng!");
	end	

	self.tbOnAllDeathCheckTimer = self:CreateTimer(self.TIME_CHECK_ALL_DEATH, self.OnCheckAllDeath, self);

	return;
end

function RoomBaseMission:OnDeath()
	me.CallClientScript({"UiManager:CloseWindow","UI_RENASCENCEPANEL"});
	self.nPlayerDeathCount = self.nPlayerDeathCount + 1;
	local nJoinCount = self:GetPlayerCount(0);
	local nIsEndGame = 0;
	
	local nHaveReviveNum = self:GetPlayerReviveNum(me);
	if (nHaveReviveNum > 0) then
		QianCengTower:OnOpenReviveMsgBox(me);
	end

	if (self.nPlayerDeathCount < nJoinCount) then
		return;
	end
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "<color=yellow>Tất cả thành viên đội đều bị thương nặng đang chờ hồi sinh<color>\n<color=green>Thời gian còn lại: <color>%s", self.TIME_CHECK_ALL_DEATH);
		QianCengTower:UpdateMsgUi(pPlayer, "Nếu không hồi sinh, Thiên Tầng Tháp sẽ đóng!");
	end	
	self.tbOnAllDeathCheckTimer = self:CreateTimer(self.TIME_CHECK_ALL_DEATH, self.OnCheckAllDeath, self);

	return;
end;

function RoomBaseMission:OnCheckAllDeath()
	self.tbOnAllDeathCheckTimer = nil;
	if (self.nIsEndGame > 0) then
		return 0;
	end
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		if (pPlayer.IsDead() ~= 1) then
			return 0;
		end
	end
	
	self.nGameState = self.DEF_GAMESTATE_FAILED;
	self:GameEnd();
	return 0;
end

function RoomBaseMission:OnSignUp()
	local nPlayerCount = self:GetPlayerCount(0);
	if (nPlayerCount <= 0) then
		self:GameOver();		
		return 0;
	end
	self.nStateJour = 0;
	self.tbMisEventList = self:GetRoomEventList(self.nCurRoomNum, self.nRoomType);
	self:OnCreateTeam();
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		if (self.bIsNewPlayerApply ~= 1) then
			local nOrgCount = QianCengTower:GetPlayerTodayJoinCount(pPlayer);
			QianCengTower:SetPlayerTodayJoinCount(pPlayer, nOrgCount - 1);
		end
	end	
	
	self.nRoomLevel = nPlayerCount;
	self.nBeginGameTime = GetTime();

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "<color=green>Thử thách chuẩn bị mở\n<color=yellow>Thời gian mở còn: <color><color=white>%s<color>", self.tbMisEventList[self.nStateJour + 1][2]);

		local szMsg2 = "<color=green>Hãy chuẩn bị<color>";
		if (self.bIsNewPlayerApply == 1) then
			szMsg2 = szMsg2 .. QianCengTower.szNewPlayerFinishMsg
		end
		
		QianCengTower:UpdateMsgUi(pPlayer, szMsg2);
		Dialog:SendBlackBoardMsg(pPlayer, "Thử thách sắp mở, hãy chuẩn bị!");

		pPlayer.CallClientScript({"UiManager:CloseWindow","UI_SHOP"});
		pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_EQUIPENHANCE"});
		pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_XUANJINGCOMPOSE"});
		pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_EQUIPCOMPOSE"});		
	end
	
	self.nCurRoomStartTime = GetTime();
	ClearMapNpc(self.nGameMapId);

	return;
end

function RoomBaseMission:PlayerJoinNextRoom(bNeedNewWorld)
	local tbRoomInfo = self:GetRoomInfo(self.nCurRoomNum);
	if (bNeedNewWorld and bNeedNewWorld == 1) then
		local tbEnterPos = QianCengTower:GetPlayerEnterPos(tbRoomInfo.nTempMapId);
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			pPlayer.NewWorld(self.nGameMapId, tbEnterPos[1], tbEnterPos[2]);
		end
	end
	
	if (self.nNeedReleaseDynMapId and self.nNeedReleaseDynMapId > 0) then
--		Map:UnRegisterMapForbidRemoteRevive(self.nNeedReleaseDynMapId);
		Map:UnRegisterMapForbidReviveType(self.nNeedReleaseDynMapId);		
		--ReleaseDynMap(self.nNeedReleaseDynMapId);
		self.nNeedReleaseDynMapId = 0;
	end	
end

function RoomBaseMission:NormalStepRestEnd()
	if (self.nIsEndGame > 0) then
		self:GameOver();
		return 0;
	end
	
	local bNeedNewWorld = 0;
	local n10Mod = math.fmod(self.nCurRoomNum, 10);
	if (n10Mod == 0) then
		bNeedNewWorld = 1;
	end
	
	local n5Mod = math.fmod(self.nCurRoomNum, 5);
	
	self.nCurRoomNum = self.nCurRoomNum + 1;
	self.nMaxStepCount = self.nMaxStepCount + 1;
	self:OnInitalGameRoom(self.nCurRoomNum);
	self:PlayerJoinNextRoom(bNeedNewWorld);
	ClearMapNpc(self.nGameMapId);
	
	local szBlackMsg = "Thử thách sắp mở, hãy chuẩn bị";
	if (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_STAR) then
		szBlackMsg = "Hãy thu thập Sao Vàng để vượt ải";
	elseif (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_BOX) then
		szBlackMsg = "Đánh bại quái vật nhận đạo cụ hỗ trợ";
	end

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "<color=green>Thử thách chuẩn bị mở\n<color=yellow>Thời gian mở còn: <color><color=white>%s<color>", self.tbMisEventList[self.nStateJour + 1][2]);
		local szReadyMsg = "<color=green>Hãy chuẩn bị<color>";
		if (self.bIsNewPlayerApply == 1) then
			szReadyMsg = szReadyMsg .. QianCengTower.szNewPlayerFinishMsg;
		end
		
		QianCengTower:UpdateMsgUi(pPlayer, szReadyMsg);
		Dialog:SendBlackBoardMsg(pPlayer, szBlackMsg);
		if (n5Mod == 0) then
			QianCengTower:CloseFanPaiGame(pPlayer);
			pPlayer.CallClientScript({"UiManager:CloseWindow","UI_SHOP"});
			pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_EQUIPENHANCE"});
			pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_XUANJINGCOMPOSE"});
			pPlayer.CallClientScript({"UiManager:CloseWindow", "UI_EQUIPCOMPOSE"});
		end
	end	
	self.nCurRoomStartTime = GetTime();
	return;
end

function RoomBaseMission:SendBlackMsg(szMsg)
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		Dialog:SendBlackBoardMsg(pPlayer, szMsg);
	end
end

function RoomBaseMission:ShowPassFirstPlayerMsg(pPlayer, nCurRoomNum)
	if (not pPlayer) then
		return 0;
	end
	
	if (not QianCengTower.tbFirstLadderPlayer) then
		return 0;
	end
	
	if (QianCengTower.tbFirstLadderPlayer[2] and QianCengTower.tbFirstLadderPlayer[2] >= nCurRoomNum) then
		return 0;
	end
	
	local szMsg = string.format("Vượt qua thử thách <color=green>Tháp %s<color> thành công, không thể ngăn cản!", nCurRoomNum);
	if (pPlayer.dwTongId > 0) then
		Player:SendMsgToKinOrTong(pPlayer, szMsg, 1);
	elseif (pPlayer.dwKinId > 0) then
		Player:SendMsgToKinOrTong(pPlayer, szMsg, 0);
	end
	pPlayer.SendMsgToFriend(string.format("Thành viên đội [<color=yellow>%s<color>] %s", pPlayer.szName, szMsg));
	
	if pPlayer.IsCaptain() == 0 then
		return;
	end
	
	KDialog.NewsMsg(1, Env.NEWSMSG_NORMAL, string.format("<color=green>%s<color> đã vượt qua thử thách <color=green>Tháp %s<color> thành công!", pPlayer.szName, nCurRoomNum));
	
	return 1;
end

function RoomBaseMission:GameFailed()
	self.nIsEndGame = 1;
	self:AddFinishNpc();
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "Ngươi sắp rời Thiên Tầng Tháp\nThời gian rời Tháp còn: %s", self.tbMisEventList[self.nStateJour + 1][2]);
		QianCengTower:UpdateMsgUi(pPlayer, " ");
		Dialog:SendBlackBoardMsg(pPlayer, "Đội đã thất bại khi thử thách lên Tầng Tháp");
		pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_QIANCENGSHOWRESULT", 2});
		self:ShowPassFirstPlayerMsg(pPlayer, self.nCurRoomNum);
	end
end

function RoomBaseMission:GameFinished()
	self:SendBlackMsg("Hãy nhận thưởng thử thách thành công và rời Tháp tại Nhạc Lôi!");
	
	local nDetTime = GetTime() - self.nBeginGameTime;
	self.nFinishTime = nDetTime;
	local nMin	= math.floor(nDetTime / 60);
	local nSec	= math.fmod(nDetTime, 60);
	local szMsg = string.format("Chúc mừng ngươi qua Tầng thành công, thời gian còn lại: <color=yellow>%s phút %s giây<color>。", nMin, nSec);
	local nAwardLevel = 0;

	
	if (self.nMaxStepCount >= QianCengTower.MAX_LADDER_NUM) then
		for nIndex, tbInfo in ipairs(QianCengTower.tbFinishAwardLevel) do
			if (nDetTime < tbInfo[1]) then
				nAwardLevel = nIndex;
				break;
			end
		end
	end
	
	self:AddFinishNpc();
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		self:StatLeaveLogOnePlayer(pPlayer, 4);
		pPlayer.Msg(szMsg);
		if (nAwardLevel > 0) then
			QianCengTower:SetPlayerFinishAward(pPlayer, nAwardLevel);
			QianCengTower:SetPlayerFinishAwardStartRoom(pPlayer, self.nStartRoomNum);
		--	if (nAwardLevel == 1 and pPlayer.FindTitle(19,2,1,0) == 0) then
			--	pPlayer.AddTitle(19,2,1,0);
		--	end
		end
		--self:GiveFinishGameAchievement(pPlayer);
		QianCengTower:UpdateTimeUi(pPlayer, "Thử thách kết thúc chuẩn bị rời Tháp\nThời gian còn lại: %s", self.tbMisEventList[self.nStateJour + 1][2]);
		QianCengTower:UpdateMsgUi(pPlayer, " ");
		pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_QIANCENGSHOWRESULT", 1});
		self:ShowPassFirstPlayerMsg(pPlayer, self.nCurRoomNum);
	end	
	
	self.nIsEndGame = 2;
end

function RoomBaseMission:GiveFinishGameAchievement(pPlayer)
	if (self.nMaxStepCount >= QianCengTower.MAX_LADDER_NUM) then
		Achievement:FinishAchievement(pPlayer, 522); -- 完成一次副本
		if (pPlayer.FindTitle(19,1,1,0) == 0) then
			pPlayer.AddTitle(19,1,1,0);
		end
		Achievement:FinishAchievement(pPlayer, 523); -- 完成60次副本
		SpecialEvent.ActiveGift:AddCounts(pPlayer, 52);
	end
end

function RoomBaseMission:GiveFinishRoomAchievement(pPlayer, nType)
	if (1 == nType) then -- 击败大宋皇宫中的史弥远
		Achievement:FinishAchievement(pPlayer, 524);
	elseif (2 == nType) then -- 击败蓬莱仙境中的白离
		Achievement:FinishAchievement(pPlayer, 525);
	elseif (3 == nType) then -- 完成第80层
		Achievement:FinishAchievement(pPlayer, 526);
		if (pPlayer.FindTitle(19,3,1,0) == 0) then
			pPlayer.AddTitle(19,3,1,0);
		end
	elseif (4 == nType) then -- 完成第100层
		Achievement:FinishAchievement(pPlayer, 527);
	elseif (5 == nType) then -- 完成600轮抽奖
		
	end
end

function RoomBaseMission:AddFinishNpc()
	local nNpcId = QianCengTower.DEF_NPC_ID_FINISH_AWARD;
	local tbRoomInfo = self:GetRoomInfo(self.nCurRoomNum);
	local tbNormalPosList = self:GetNpcAddPos(tbRoomInfo.nTempMapId, self.DEF_NPC_TYPE_BOSS)
	local tbNpcPos	= tbNormalPosList[3][1]
	KNpc.Add2(nNpcId, 1, -1, self.nGameMapId, tbNpcPos[1], tbNpcPos[2]);
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do -- Jie add save file
		QianCengTower:Save_File(pPlayer.nId)
	end
end

function RoomBaseMission:StatLeaveLogOnePlayer(pPlayer, nLeaveType)
	local nNowTime	= GetTime();
	local nDetTime	= nNowTime - self.nBeginGameTime;
	local nCengTime	= nNowTime - self.nCurRoomStartTime;
	local nCount	= self:GetPlayerCount(0);
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "kick_out", pPlayer.nId, string.format("%s,%s,%s,%s,%s", self.nCurRoomNum, nLeaveType, nCengTime, nDetTime, nCount));
end

function RoomBaseMission:NormalGameRoundEnd()
	local nMod = math.fmod(self.nCurRoomNum, 5);

	self:RevivePlayer();
	if (nMod == 0) then
		self:SetPlayersState(0);
	end
	ClearMapNpc(self.nGameMapId);

	if (self.tbOnAllDeathCheckTimer) then
		self.tbOnAllDeathCheckTimer:Close();
		self.tbOnAllDeathCheckTimer = nil;
	end

	local nJoinCount = self:GetPlayerCount(0);
	if (self.nPlayerDeathCount >= nJoinCount) then
		self.nGameState = self.DEF_GAMESTATE_FAILED;
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:StatLeaveLogOnePlayer(pPlayer, 2);
		end		
	end
	
	if (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_NPC_KILL) then
		self:NpcGameRoundEnd();
	elseif (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_BOX) then
		self:BoxGameRoundEnd();
	elseif (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_CATCH_STAR) then
		self:StarGameRoundEnd();
	else
		
	end

	if (self.nGameState == self.DEF_GAMESTATE_FAILED) then
		self:GameFailed();
		return;
	end

	local tbRoomLevel = QianCengTower.tbTeamNum2RoomLevel[self.nRoomLevel] or {};
	local nXiShu = tbRoomLevel[1] or 0.85;
	
	local szMsg1	= "<color=green>Chuẩn bị qua Tấng tiếp theo\n<color=yellow>Thời gian qua Tầng còn: <color><color=white>%s<color>";
	
	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		self:UpdatePlayerBestRoom(pPlayer, self.nCurRoomNum);
		self:OnDropSpecialItem(pPlayer, self.nCurRoomNum, self.nRoomType);
		local nAddExp = pPlayer.GetBaseAwardExp() * QianCengTower.DEF_FINISH_AWARD_EXP_TIME / 2 * nXiShu;
		
		-- 判断如果是指引玩家那么会有经验上限
		if (self.bIsNewPlayerApply == 1) then
			Task.tbFubenTask:GivePlayerQianCengExpAward(pPlayer, self.nCurRoomNum);
		else
			pPlayer.AddExp(nAddExp);
		end
		
		if (nMod == 0) then
			self:OpenFanAward(pPlayer);
			if (self.bIsNewPlayerApply == 1) then
				Task.tbFubenTask:ApplyFinishNewPlayerQianCengStep(pPlayer);
			end
		end
		
		
	end
	
	if (self.nMaxStepCount >= QianCengTower.MAX_LADDER_NUM) then
		self.nGameState = self.DEF_GAMESTATE_FINISHED;
		self:GameFinished();
		return;
	end

	local nMaxRoomNum = QianCengTower:GetMaxRoomNum();
	if (self.nCurRoomNum + 1 > nMaxRoomNum) then
		self.nGameState = self.DEF_GAMESTATE_FINISHED;
		self:GameFinished();
		return;		
	end
	
	if (self.bIsNewPlayerApply == 1 and self.nCurRoomNum >= 10) then
		self.nGameState = self.DEF_GAMESTATE_FINISHED;
		self:GameFinished();
		return;		
	end

	if (nMod == 0) then
		self:ForbidXiang(0);
	end

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, szMsg1, self.tbMisEventList[self.nStateJour + 1][2]);
		local szMsg2	= "<color=green>Hãy chuẩn bị<color>";	
		if (self.bIsNewPlayerApply == 1) then
			szMsg2 = szMsg2 .. QianCengTower.szNewPlayerFinishMsg;
		end
		
		QianCengTower:UpdateMsgUi(pPlayer, szMsg2);
		Dialog:SendBlackBoardMsg(pPlayer, "Thử thách thành công chuẩn bị qua Tầng tiếp theo");
	end	
	
	self:RestTimeEvent();
	self.nGameState = self.DEF_GAMESTATE_REST;
	self:ApplyNewMap(self.nCurRoomNum + 1);
	self.tbNpcList = {};	
end

function RoomBaseMission:OnNpcDropItem(pPlayer, pNpc, nCurRoomNum, nNpcType)
	if (not pPlayer or not pNpc) then
		return 0;
	end
	local nDropType = 0;
	if (nNpcType == self.DEF_NPC_TYPE_NORMAL) then
		nDropType = QianCengTower.DEF_NPC_DROP_ITEM_NORMAL;
	elseif (nNpcType == self.DEF_NPC_TYPE_JING) then
		nDropType = QianCengTower.DEF_NPC_DROP_ITEM_JIN;
	elseif (nNpcType == self.DEF_NPC_TYPE_BOSS) then
		nDropType = QianCengTower.DEF_NPC_DROP_ITEM_BIG_BOSS;
		local nMod10 = math.fmod(nCurRoomNum, 10);
		local nMod5 = math.fmod(nCurRoomNum, 5);
		if (nMod5 == 0 and nMod10 ~= 0) then
			nDropType = QianCengTower.DEF_NPC_DROP_ITEM_SMALL_BOSS;
		end
	end
	
	local tbDropInfo = QianCengTower.tbNpcDropItem[nDropType];
	if (not tbDropInfo) then
		return 0;
	end
	
	local szDropFile = QianCengTower.szNpcDropFold .. tbDropInfo[1] .. self.nRoomLevel .. ".txt";
	
	if (self.bIsNewPlayerApply == 1) then
		local nIsCanGetItem = Task.tbFubenTask:IsCanGetNewQianItem(pPlayer)
		if (nIsCanGetItem == 1) then
			pNpc.DropRateItem(szDropFile, tbDropInfo[2])
		end
	else
		pNpc.DropRateItem(szDropFile, tbDropInfo[2], -1, -1, pPlayer.nId)
	end
	
	
	return 1;
end

function RoomBaseMission:RandomItem(pPlayer, tbInfo)	
	local nRandomCount = tbInfo.nNum;
	local szRandomFile = QianCengTower.szNpcDropFold .. tbInfo.szRandomFile;
	pPlayer.DropRateItem(szRandomFile, nRandomCount);
	return 1;
end

function RoomBaseMission:OnDropSpecialItem(pPlayer, nCurRoomNum, nNpcType)
	if (pPlayer.CountFreeBagCell() < 1) then
		return 0;
	end
	
	-- 如果是新手指引的话，就不掉特殊物品
	if (self.bIsNewPlayerApply == 1) then
		return 0;
	end

	self:RandomItem(pPlayer, QianCengTower.tbRandomItemList[QianCengTower.DEF_RANDOM_ITEM_XINGYI]);
	
	if (nCurRoomNum >= 1 and nCurRoomNum <= 40) then
		self:RandomItem(pPlayer, QianCengTower.tbRandomItemList[QianCengTower.DEF_RANDOM_ITEM_YUEJIA]);
	end

	if (nCurRoomNum >= 31 and nCurRoomNum <= 60) then
		self:RandomItem(pPlayer, QianCengTower.tbRandomItemList[QianCengTower.DEF_RANDOM_ITEM_YUEWU]);
	end
	
	return 1;	
end

--------------------- 杀怪 ---------------------------------
function RoomBaseMission:OnKillNpc()
	if (self.nRoomType == QianCengTower.DEF_ROOM_TYPE_NPC_KILL) then
		local nNpcType = self.tbNpcList[him.dwId];
		self:OnNpcDropItem(me, him, self.nCurRoomNum, nNpcType);
		self.tbNpcList[him.dwId] = nil;
		local nLastCount = Lib:CountTB(self.tbNpcList);

		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:UpdatePlayerRightUpdateInfo(pPlayer, self.nRoomType, self.nCurRoomNum);
		end
		
		if (nLastCount <= 0) then
			if (self.DEF_GAMESTATE_DURING == self.nGameState) then
				self:GoNextState();
			end
		end
	end
end

function RoomBaseMission:AddNpcByType(nCurRoomNum, nCurRound, nNpcType)
	local tbRoomInfo		= self:GetRoomInfo(nCurRoomNum);
	local nNpcId, nNpcLevel, nNpcNum = self:GetNpcInfo(nCurRoomNum, nNpcType);
	if (not nNpcId or nNpcId <= 0) then
		return 0;
	end
	
	local tbNormalPosList	= self:GetNpcAddPos(tbRoomInfo.nTempMapId, nNpcType);
	local tbNpcPos			= tbNormalPosList[nCurRound]
	if (not tbNpcPos) then
		return 0;
	end

	local nIndex = 1;
	local nLen = #tbNpcPos;
	for i=1, nNpcNum do
		if (nIndex > nLen) then
			break
		end
		local tbPos = tbNpcPos[nIndex];
		local pNpc = KNpc.Add2(nNpcId, nNpcLevel, -1, self.nGameMapId, tbPos[1], tbPos[2]);
		if (pNpc) then
			self.tbNpcList[pNpc.dwId] = nNpcType;
			nIndex = nIndex + 1;
			local nSkillLevel = 0;
			if (self.nRoomLevel == 2) then
				nSkillLevel = 5;
			elseif (self.nRoomLevel == 3) then
				nSkillLevel = 6;
			end
			
			
			
			if (nCurRoomNum > 100) then
				local nDet = math.floor(nCurRoomNum / 10) * 10 + 1;
				local nLevel = QianCengTower.tbAddFightSkillLevelRoom[nDet];
				if (nLevel) then
					--pNpc.AddSkillState(QianCengTower.DEF_SKILL_ID_ADD_NPC_FIGHT, nLevel, 1, self.TIME_BUFF_NPC_BUFF);
				end
			end
		end		
	end
	
	return 1;
end

function RoomBaseMission:AddStepNpc()
	self.nCurRoomRound = self.nCurRoomRound + 1;
	
	if (self.nCurRoomRound == 2) then
		self:RandomDialogBoss();
	end

	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_NORMAL);
	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_JING);
	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_BOSS);
	self.nTotalAddKillNpc = Lib:CountTB(self.tbNpcList);
	self.nGameState = self.DEF_GAMESTATE_DURING;
	self:SetPlayersState(1);
	self:ForbidXiang(1);
	self:ProcessOtherEvent();
	self:UpdateAllPlayerRightInfo(self.nRoomType, self.nCurRoomNum);
end

function RoomBaseMission:NpcGameRoundEnd()
	local nLastCount = Lib:CountTB(self.tbNpcList);
	if (nLastCount > 0) then
		self.nGameState = self.DEF_GAMESTATE_FAILED;
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:StatLeaveLogOnePlayer(pPlayer, 1);
		end
	end
end

function RoomBaseMission:KillNpcStepEnd()
	self.nGameState = self.DEF_GAMESTATE_REST;

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		QianCengTower:UpdateTimeUi(pPlayer, "<color=green>Chuẩn bị làm mới quái vật\n<color=yellow>Thời gian mở còn: <color><color=white>%s<color>", self.tbMisEventList[self.nStateJour + 1][2]);
		
		local szMsg2 = "<color=green>Hãy chuẩn bị<color>";
		if (self.bIsNewPlayerApply == 1) then
			szMsg2 = szMsg2 .. QianCengTower.szNewPlayerFinishMsg;
		end
		
		QianCengTower:UpdateMsgUi(pPlayer, szMsg2);
	end
end

function RoomBaseMission:AddYaoShangAndYeLianDaShi(nCurRoomNum)
	local tbRoomInfo = self:GetRoomInfo(nCurRoomNum);
	local tbNormalPosList = self:GetNpcAddPos(tbRoomInfo.nTempMapId, self.DEF_NPC_TYPE_BOSS)
	local tbNpcPos	= tbNormalPosList[3][1]
--	KNpc.Add2(QianCengTower.NPC_ID_YAOSHANG, 1, -1, self.nGameMapId, tbNpcPos[1], tbNpcPos[2]).szName= "Tiệm Thuốc";
--	KNpc.Add2(QianCengTower.NPC_ID_YELIANDASHI, 1, -1, self.nGameMapId, tbNpcPos[1] + 2, tbNpcPos[2]);
	
	return 1;
end

function RoomBaseMission:RestTimeEvent()
	
	local nMod = math.fmod(self.nCurRoomNum, 5);
	if (0 == nMod) then
		self:AddYaoShangAndYeLianDaShi(self.nCurRoomNum);
		return 1;
	end
	
	return 0;	
end

--------------------- 地芒阵 -----------------------------------------------------
function RoomBaseMission:AddStepStar()
	self.nCurRoomRound = self.nCurRoomRound + 1;
	self.tbStarPos = {};
	
	local tbRoomInfo = self:GetRoomInfo(self.nCurRoomNum);
	local tbStarPos, tbTrapName	= self:GetNpcAddPos(tbRoomInfo.nTempMapId, self.DEF_NPC_TYPE_STAR);
	
	self.tbStarPos = tbStarPos[1];
	self.tbTrapName = tbTrapName;
	
	self.nStar, self.nStarNpcLevel, self.nStarNum				= self:GetNpcInfo(self.nCurRoomNum, self.DEF_NPC_TYPE_STAR);
	self.nStarDamage1, self.nStarNpcLevel, self.nStarDamage1Num	= self:GetNpcInfo(self.nCurRoomNum, self.DEF_NPC_TYPE_STAR_DAMAGE1);
	self.nStarDamage2, self.nStarNpcLevel, self.nStarDamage2Num	= self:GetNpcInfo(self.nCurRoomNum, self.DEF_NPC_TYPE_STAR_DAMAGE2);
	self.nStarBuffNpc, self.nStarNpcLevel, self.nStarBuffNpcNum	= self:GetNpcInfo(self.nCurRoomNum, self.DEF_NPC_TYPE_STAR_BUFF);

	self.nStarFinishNum = tbRoomInfo.nStarFinishNum;
	
	self.tbTimer_StarRoom = self:CreateTimer(self.TIME_RANDOM_STAR, self.OnTimer_RandomStarNpc, self);
	self:OnTimer_RandomStarNpc();
	self.nGameState = self.DEF_GAMESTATE_DURING;
	self:SetPlayersState(1);
	self:ForbidXiang(1);
	self:ProcessOtherEvent();
	self:UpdateAllPlayerRightInfo(self.nRoomType, self.nCurRoomNum);
	self:SendBlackMsg("Hãy cẩn thận! Cạm bẫy Tinh Tú sẽ được kích hoạt lại!");
end

function RoomBaseMission:OnPlayerTrap(szTrapName)
	if (self.nRoomType ~= QianCengTower.DEF_ROOM_TYPE_CATCH_STAR) then
		return 0;
	end
	
	if (self.nGameState ~= self.DEF_GAMESTATE_DURING) then
		return 0;
	end

	local tbStarNpc = self.tbStarNpcPos2NpcType[szTrapName];
	if (not tbStarNpc) then
		return 0;
	end

	self:OnActiveStarTrap(me, tbStarNpc);
	self.tbStarNpcPos2NpcType[szTrapName] = nil;
	return 1;
end

function RoomBaseMission:AddStarOneTypeNpc(nNpcType, nNpcId, nNpcLevel, nNpcNum, tbPosList, nPosIndex)
	if (not nPosIndex) then
		return;
	end
	local nPosLen = #tbPosList;
	for i=1, nNpcNum do
		if (nPosIndex > nPosLen) then
			return;
		end			
		local tbPos = tbPosList[nPosIndex];
		local nKey = tbPos[1] * 10000 + tbPos[2];
		local szTrapName = self.tbTrapName[nKey];
		if (self.tbStarNpcPos2NpcType[szTrapName]) then
			return;
		end		
		local pNpc = KNpc.Add2(nNpcId, nNpcLevel, -1, self.nGameMapId, tbPos[1], tbPos[2]);
		if (pNpc) then
			self.tbStarNpcPos2NpcType[szTrapName] = { nNpcType = nNpcType, nNpcId = pNpc.dwId };
			nPosIndex = nPosIndex + 1;
		end
	end
	return nPosIndex;
end

function RoomBaseMission:OnTimer_RandomStarNpc()
	ClearMapNpc(self.nGameMapId);

	if (self.nIsEndGame > 0) then
		self.tbTimer_StarRoom = nil;
		return 0;
	end	
	
	if (self.nStarRandomRound >= 12) then
		self.tbTimer_StarRoom = nil;
		return 0;
	end

	self.tbStarNpcPos2NpcType = {};
	local nPosLen	= #self.tbStarPos;
	local nIndex	= 1;
	Lib:SmashTable(self.tbStarPos);
	
	if (self.nStar and self.nStar > 0) then
		nIndex = self:AddStarOneTypeNpc(
			self.DEF_NPC_TYPE_STAR, 
			self.nStar, 
			self.nStarNpcLevel, 
			self.nStarNum, 
			self.tbStarPos,
			nIndex
		);
	end

	if (self.nStarDamage1 and self.nStarDamage1 > 0) then
		nIndex = self:AddStarOneTypeNpc(
			self.DEF_NPC_TYPE_STAR_DAMAGE1, 
			self.nStarDamage1, 
			self.nStarNpcLevel, 
			self.nStarDamage1Num, 
			self.tbStarPos,
			nIndex
		);
	end
	
	if (self.nStarDamage2 and self.nStarDamage2 > 0) then
		nIndex = self:AddStarOneTypeNpc(
			self.DEF_NPC_TYPE_STAR_DAMAGE2, 
			self.nStarDamage2, 
			self.nStarNpcLevel, 
			self.nStarDamage2Num, 
			self.tbStarPos, 
			nIndex
		);
	end

	self.nStarRandomRound = self.nStarRandomRound + 1;
end

function RoomBaseMission:StarGameRoundEnd()
	if (self.tbTimer_StarRoom) then
		self.tbTimer_StarRoom:Close();
		self.tbTimer_StarRoom = nil;
	end

	if (self.nStarCount < self.nStarFinishNum) then
		self.nGameState = self.DEF_GAMESTATE_FAILED;
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:StatLeaveLogOnePlayer(pPlayer, 1);
		end
	end
end

function RoomBaseMission:OnUpdateStarBuffNpc(nStarCount)	
	if (not self.nStarBuffNpc or self.nStarBuffNpc <= 0) then
		return;
	end

	local nRetCode = self:AddStarOneTypeNpc(
		self.DEF_NPC_TYPE_STAR_BUFF, 
		self.nStarBuffNpc, 
		self.nStarNpcLevel, 
		self.nStarBuffNpcNum, 
		self.tbStarPos, 
		#self.tbStarPos
	);
	if (nRetCode and nRetCode > 0) then
		self:SendBlackMsg("Thần Tướng trợ giúp! Nhanh tay chạm vào Tinh Tú Xanh Lá để nhận được sức mạnh to lớn của Nhạc Phi");
	end
end

function RoomBaseMission:OnActiveStarTrap(pPlayer, tbStarNpc)
	local nNpcType = tbStarNpc.nNpcType;
	local nNpcId = tbStarNpc.nNpcId;

	local pNpc = KNpc.GetById(nNpcId);
	if (pNpc) then
		pNpc.Delete();
	end
	
	if (self.DEF_NPC_TYPE_STAR == nNpcType) then
		self.nStarCount = self.nStarCount + 1;
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:UpdatePlayerRightUpdateInfo(pPlayer, self.nRoomType, self.nCurRoomNum);
		end
		
		if (self.nStarCount >= self.nStarFinishNum) then
			self:GoNextState();
			return;
		end
		
		local nShowBuffNpc = math.floor(self.nStarFinishNum / 3);
		local nMod = math.fmod(self.nStarCount, nShowBuffNpc);
		if (0 == nMod) then
			self:OnUpdateStarBuffNpc(self.nStarCount);
		end
		
		-- 刷新随机boss
		local nFloor = math.floor(self.nStarCount / 3);
		if (nFloor == 1) then
			local nMod = math.floor(self.nStarCount, 3);
			if (nMod == 0) then
				self:RandomDialogBoss();
			end
		end
		return 1;
	end

	if (self.DEF_NPC_TYPE_STAR_DAMAGE1 == nNpcType) then
		local nSkillId = self.tbStarSkill[nNpcType];
		local nNowLevel = me.GetSkillState(nSkillId);
		local nSkillLevel = self.nStarNpcLevel;
		if (nNowLevel > 0) then
			local nDet = math.floor(nNowLevel / nSkillLevel);
			nDet = nDet + 1;
			if (nDet > 2) then
				nDet = 2;
			end
			nSkillLevel = nDet * self.nStarNpcLevel;
		end
		pPlayer.AddSkillState(nSkillId, nSkillLevel, 1, self.TIME_BUFF_BAD, 1, 0, 1);
	elseif (self.DEF_NPC_TYPE_STAR_DAMAGE2 == nNpcType) then
		local nSkillId = self.tbStarSkill[nNpcType];
		pPlayer.AddSkillState(nSkillId, self.nStarNpcLevel, 1, self.TIME_BUFF_BAD, 1, 0, 1);
	elseif (self.DEF_NPC_TYPE_STAR_BUFF) then
		local nSkillId = self.tbStarSkill[nNpcType];
		pPlayer.AddSkillState(nSkillId, 2, 1, self.TIME_BUFF_GOOD, 1, 0, 1);		
	end

	return 1;
end

--------------------- 宝箱
function RoomBaseMission:AddStepBox()
	self.nCurRoomRound = self.nCurRoomRound + 1;
	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_BOX);
	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_BOX_NPC);
	self:AddNpcByType(self.nCurRoomNum, self.nCurRoomRound, self.DEF_NPC_TYPE_BOX_BOSS);
	
	local nNpcId, nNpcLevel, nNpcNum = self:GetNpcInfo(self.nCurRoomNum, self.DEF_NPC_TYPE_BOX_BOSS);
	self.nFinishBoxNum	= nNpcNum;
	self.nBoxCount		= 0;
	
	self.nGameState = self.DEF_GAMESTATE_DURING;
	self:SetPlayersState(1);
	self:ForbidXiang(1);
	self:ProcessOtherEvent();
	self:UpdateAllPlayerRightInfo(self.nRoomType, self.nCurRoomNum);	
end

function RoomBaseMission:OnProcessBox(pPlayer, nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if (pNpc) then
		pNpc.Delete();
	end
	self.nBoxCount = self.nBoxCount + 1;

	for _, pPlayer in pairs(self:GetPlayerList(0)) do
		self:UpdatePlayerRightUpdateInfo(pPlayer, self.nRoomType, self.nCurRoomNum);
	end
	
	if (self.nBoxCount >= self.nFinishBoxNum) then
		if (self.nGameState == self.DEF_GAMESTATE_DURING) then
			self:GoNextState();
		end
	end

	local nShowBuffNpc = math.floor(self.nFinishBoxNum / 3);
	local nMod = math.fmod(self.nBoxCount, nShowBuffNpc);
	if (0 == nMod) then
		self:OnAddBoxBuff(pPlayer);
	end

	local nFloor = math.floor(self.nBoxCount / 3);
	if (nFloor == 1) then
		local nMod = math.floor(self.nBoxCount, 3);
		if (nMod == 0) then
			self:RandomDialogBoss();
		end
	end
end

function RoomBaseMission:OnAddBoxBuff(pPlayer)
	pPlayer.AddSkillState(QianCengTower.DEF_SKILL_ID_BUFF_BOX, 
						QianCengTower.DEF_SKILL_LEVEL_BUFF_BOX, 
						1, 
						QianCengTower.DEF_SKILL_TIME_BUFF_BOX, 
						1, 
						0, 
						1);
end

function RoomBaseMission:BoxGameRoundEnd()
	if (self.nBoxCount < self.nFinishBoxNum) then
		self.nGameState = self.DEF_GAMESTATE_FAILED;
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			self:StatLeaveLogOnePlayer(pPlayer, 1);
		end
	end
end

----------------  随机boss  ----------------------
function RoomBaseMission:RandomDialogBoss()
	if (self.bIsNewPlayerApply == 1) then
		return 0;
	end
	
	if (self.nCurRoomRound >= 3) then
		return 0;
	end
	
	local nFlag = math.fmod(self.nCurRoomNum, 5);
	if (0 == nFlag) then
		return 0;
	end
	
	local nRandom = MathRandom(QianCengTower.MAX_RANDOM_NUM);
	if (nRandom > QianCengTower.DEF_RANDOM_ADD_AWARD_BOSS) then
		return 0;
	end
	
	local nBossRandom = MathRandom(QianCengTower.MAX_RANDOM_NUM);
	local nSum = 0;
	local nBossIndex = 1;
	for i, tbInfo in ipairs(QianCengTower.tbRandomBossList) do
		if (nBossRandom <= nSum + tbInfo[1]) then
			nBossIndex = i;
			break;
		end
		nSum = nSum + tbInfo[1];
	end
	local nNpcId = QianCengTower.tbRandomBossList[nBossIndex][2];
	local tbRoomInfo = self:GetRoomInfo(self.nCurRoomNum);	
	local tbNormalPosList = self:GetNpcAddPos(tbRoomInfo.nTempMapId, self.DEF_NPC_TYPE_STAR)
	local tbPosList = tbNormalPosList[1];
	local nRandomNum = MathRandom(#tbPosList);
	local tbNpcPos	= tbPosList[nRandomNum]

	self:SendBlackMsg("Hình như có ai đó xuất hiện trong Tháp! Ngươi có thể nhận thêm phần thưởng khi tiêu diệt hắn!");

	local pNpc = KNpc.Add(nNpcId, self.nRoomLevel, 0, SubWorldID2Idx(self.nGameMapId), tbNpcPos[1] * 32, tbNpcPos[2] * 32);	
	if (not pNpc) then
		return 0;
	end
	pNpc.GetTempTable("QianCengTower").nRandomBossIndex = nBossIndex;
	pNpc.SetLiveTime(QianCengTower.DEF_TIME_AWARD_BOSS_LIVE_TIME);
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "spe_boss", 0, string.format("%s,%s", nNpcId, self.nCurRoomNum));

	return 1;
end

function RoomBaseMission:RandomAwardBoss(nBossIndex)
	local nNpcId = QianCengTower.tbAwardBossList[nBossIndex][2];
	local tbRoomInfo = self:GetRoomInfo(self.nCurRoomNum);	
	local tbNormalPosList = self:GetNpcAddPos(tbRoomInfo.nTempMapId, self.DEF_NPC_TYPE_STAR)
	local tbPosList = tbNormalPosList[1];
	local nRandomNum = MathRandom(#tbPosList);
	local tbNpcPos	= tbPosList[nRandomNum]

	self:SendBlackMsg("Hình như có ai đó xuất hiện trong Tháp! Ngươi có thể nhận thêm phần thưởng khi tiêu diệt hắn!");

	local pNpc = KNpc.Add(nNpcId, self.nRoomLevel, 0, SubWorldID2Idx(self.nGameMapId), tbNpcPos[1] * 32, tbNpcPos[2] * 32);	
	if (not pNpc) then
		return 0;
	end
	pNpc.SetLiveTime(QianCengTower.DEF_TIME_AWARD_BOSS_LIVE_TIME);
	return 1;
end

function RoomBaseMission:OnAwardBossDeath(pDeathNpc, pPlayer)
	local nTempId = pDeathNpc.nTemplateId;
	local tbAward = QianCengTower.tbAwardBossItem[nTempId];
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "kill_boss", pPlayer.nId, string.format("%s,%s", nTempId, self.nCurRoomNum));
	if (not tbAward) then
		return 0;
	end
	
	Dialog:SendBlackBoardMsg(pPlayer, "Ngươi là kẻ bất bại tại nơi này!");

	if (tbAward[1] == "baseexp") then
		for _, pPlayer in pairs(self:GetPlayerList(0)) do
			-- 判断如果是指引玩家那么会有经验上限
			local nAdd = 1;
			if (self.bIsNewPlayerApply == 1) then
				local nIsCanGetPlayerQianExp = Task.tbFubenTask:IsCanGetNewQianExp(pPlayer);
				if (nIsCanGetPlayerQianExp ~= 1) then
					nAdd = 0;
				end
			end
			
			if (nAdd == 1) then
				pPlayer.AddExp(pPlayer.GetBaseAwardExp() * tbAward[2]);
			end
		end		
		return 1;
	end
	
	if (tbAward[1] == "dropitem") then
		local szDropFile = QianCengTower.szNpcDropFold .. tbAward[2];
		pDeathNpc.DropRateItem(szDropFile, tbAward[3], -1, -1, pPlayer.nId)
		return 1;
	end
	
	return 1;
end

function RoomBaseMission:OpenFanAward(pPlayer)
	--local szMsg = "您即将进入八千里路抽奖界面。丰厚奖励，不要走开！";
	----pPlayer.GetTempTable("QianCengTower").nFanPaiRound = 0;
	--QianCengTower:ApplyJoinFanPai(pPlayer, self.nCurRoomNum);
	--Dialog:SendBlackBoardMsg(pPlayer, szMsg);
end

