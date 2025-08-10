-- 文件名　：console.lua
-- 創建者　：sunduoliang
-- 創建時間：2009-04-27 16:05:55
-- 描  述  ：
Require("\\script\\mission\\dragonboat\\dragonboat_def.lua");

Esport.DragonBoatConsole = Console:New(Console.DEF_DRAGON_BOAT);
local tbBoat = Esport.DragonBoatConsole;

function tbBoat:Start()
	self.tbCfg ={
		--[准備場Id] = {tbInPos={進入准備場的點},tbOutPos={離開准備場到的地圖和點}};
		tbMap 			= {[1532]={tbInPos={1619,3224}},[1533]={tbInPos={1619,3224}},[1534]={tbInPos={1619,3224}}}; --准備場Id,可以多組;	
		nDynamicMap		= 1535;						--動態地圖模版Id
		nMaxDynamic 	= 20;				 		--比賽場動態地圖加載數量;
		nMaxPlayer  	= 160;						--每個准備場人數上限;
		nMinDynPlayer 	= 6;						--每個比賽場進4人才能開
		nMaxDynPlayer 	= 8;						--每個比賽場最多多少人
		nReadyTime		= 270*18;					--准備場時間(秒);
		tbDyInPos		= Esport.DragonBoat.MAP_POS_START;
	};
	self.tbMissionList = {};
	self.tbPlayerCfg   = {};
	self.tbPlayerMis = self.tbPlayerMis or {};		--玩家Id索引，記錄mission﹔
end

-- tbBoat:Start()


function tbBoat:OnMySignUp()
	
	if self.tbMissionList then
		for _, tbWaitList in pairs(self.tbMissionList) do
			for _, tbMis in pairs(tbWaitList) do
				if tbMis:IsOpen() == 1 then
					tbMis:OnGameOver();
				end
			end
		end
	end
	self.tbMissionList = {};
	self.tbPlayerMis = {};
	self.tbPlayerCfg   = {};
	KDialog.NewsMsg(0, Env.NEWSMSG_NORMAL, "端午節劃龍舟比賽已經開始報名了，請盡快去各新手村秦窪處報名參加。報名時間4分30秒！");
	--end
end

--進入活動場後開始活動
function tbBoat:OnMyStart(tbCfg)

	
	--開啟前先關閉未關閉的mission
	
	local nWaitMapId	= tbCfg.nWaitMapId;		--准備場Id
	local nDyMapId 	 	= tbCfg.nDyMapId;		--活動場Id
	local tbGroupLists 	= tbCfg.tbGroupLists;	--隊伍列表
	self.tbMissionList = self.tbMissionList or {};
	self.tbMissionList[nWaitMapId] = self.tbMissionList[nWaitMapId] or {};	
	self.tbMissionList[nWaitMapId][nDyMapId] = Lib:NewClass(Esport.DragonBoatMission);
	local tbMission = self.tbMissionList[nWaitMapId][nDyMapId];
	tbMission:OnStart(nDyMapId);
	for nGroupId, tbGroup in pairs(tbGroupLists) do
		local nMaxPos = #self.tbCfg.tbDyInPos;
		local tbPos = self.tbCfg.tbDyInPos[MathRandom(1, nMaxPos)];
		tbMission:SetGroupJoinPos(nGroupId, nDyMapId, unpack(tbPos));	
		tbMission:SetGroupLeavePos(nGroupId, self:GetLeaveMapPos());
		for _, nPlayerId in pairs(tbGroup.tbList) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then	
				tbMission.tbSkillList[pPlayer.nId] = self.tbSkillList[pPlayer.nId];
				self.tbPlayerMis[pPlayer.nId] = tbMission;
				self.tbPlayerCfg[pPlayer.nId] = {1};
				tbMission:JoinPlayer(pPlayer, nGroupId);
			end
		end
	end
	tbMission:UpdataAllUi();
end

--分組邏輯
function tbBoat:OnGroupLogic(tbCfg)
	local nGroupDivide  = 0;
	local tbKickPlayerList = {};
	for nGroup, tbGroup in ipairs(tbCfg.tbGroupLists) do
		if nGroupDivide == 0 then
			--判斷是否夠4人
			if not tbCfg.tbGroupLists[nGroup + (self.tbCfg.nMinDynPlayer-1)] then
				--後面不夠4組，踢出賽場﹔
				for nKickGroup = nGroup, #tbCfg.tbGroupLists do
					for _, nPlayerId in pairs(tbCfg.tbGroupLists[nKickGroup]) do
						local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
						if pPlayer then
							table.insert(tbKickPlayerList, pPlayer);
						end
					end
				end
				break;
			end
		end
		for _, nPlayerId in pairs(tbGroup) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			--對象，分配動態地圖索引，組號﹔
			if pPlayer then
				self:OnDyJoin(pPlayer, tbCfg.nDyMapIndex, nGroup);
				nGroupDivide = nGroupDivide + 1;
			end
		end
		if nGroupDivide >= self.tbCfg.nMaxDynPlayer then
			nGroupDivide = 0;
			tbCfg.nDyMapIndex = tbCfg.nDyMapIndex + 1;
		end
	end
	for _, pPlayer in pairs(tbKickPlayerList) do
		self:KickPlayer(pPlayer);
		local szMsg = "你被隨機分配到的組中不夠6人，不能開啟比賽，請下場再次參賽。";
		Dialog:SendBlackBoardMsg(pPlayer, szMsg);
		pPlayer.Msg(string.format("<color=green>%s<color>",szMsg));
	end
end

--進入准備場地後
function tbBoat:OnJoinWaitMap()
	--print("OnJoinWaitMap", me.szName);
	local tbFind = me.FindItemInBags(unpack(Esport.DragonBoat.ITEM_BOAT_ID));
	if #tbFind < 1 then
		me.Msg("你身上沒有龍舟");
		self:KickPlayer(me);
		return 0;
	end
	local pItem = tbFind[MathRandom(1,#tbFind)].pItem;
	self.tbSkillList = self.tbSkillList or {};
	self.tbSkillList[me.nId] = pItem.dwId;
	
	me.ClearSpecialState()			--清除特殊狀態
	me.RemoveSkillStateWithoutKind(Player.emKNPCFIGHTSKILLKIND_CLEARDWHENENTERBATTLE) --清除狀態
	me.DisableChangeCurCamp(1);		--設置與幫會有關的變量，不允許在競技場戰改變某個幫會陣營的操作
	me.SetFightState(0);	  		--設置戰斗狀態
	me.SetLogoutRV(1);				--玩家退出時，保存RV並，在下次等入時用RV(城市重生點，非退出點)
	me.ForbidEnmity(1);				--禁止仇殺
	me.ForbidExercise(1);			--禁止切磋
	me.DisabledStall(1);			--擺攤
	me.ForbitTrade(1);				--交易
	me.nPkModel = Player.emKPK_STATE_PRACTISE;--關閉PK開關
	me.TeamDisable(1);				--禁止組隊
	me.TeamApplyLeave();			--離開隊伍
	me.nForbidChangePK	= 1;	
	
	local szMsg = "<color=green>比賽開始剩余時間：<color=white>%s<color>";
	local nLastFrameTime = self:GetRestTime();
	self:OpenSingleUi(me, szMsg, nLastFrameTime);
	local szBoatMsg = "\n<color=white>你參賽龍舟情況<color>";
	local szTip = Item:GetClass("dragonboat"):GetSkillTip(pItem);
	szBoatMsg = szBoatMsg .. szTip;
	self:UpdateMsgUi(me, szBoatMsg);
	Dialog:SendBlackBoardMsg(me, "您報名參加端午節龍舟比賽，請等待比賽開始！");
	me.SetTask(Esport.DragonBoat.TSK_GROUP, Esport.DragonBoat.TSK_RANK, 0);	--清楚上次排名
end

--離開准備場地後
function tbBoat:OnLeaveWaitMap()
	if self.tbPlayerCfg[me.nId] and self.tbPlayerCfg[me.nId][1] == 1 then
		return 0;
	end
	if self.tbPlayerMis[me.nId] and self.tbPlayerMis[me.nId]:IsOpen() == 1 then
		if self.tbPlayerMis[me.nId]:GetPlayerGroupId(me) > 0 then
			self.tbPlayerMis[me.nId]:KickPlayer(me);
			self.tbPlayerMis[me.nId] = nil;
		end
	end
	self.tbPlayerCfg[me.nId] = nil;
	me.SetFightState(0);
	me.SetCurCamp(me.GetCamp());
	me.DisableChangeCurCamp(0);
	me.nPkModel = Player.emKPK_STATE_PRACTISE;--關閉PK開關
	me.nForbidChangePK	= 0;
	me.DisabledStall(0);	--擺攤
	if me.IsDisabledTeam() == 1 then
		me.TeamDisable(0);--禁止組隊
	end	
	me.ForbitTrade(0);		--交易
	me.ForbidEnmity(0);
	me.ForbidExercise(0);
	me.SetLogOutState(0);			--設置還原狀態	
end

--進入活動場地
function tbBoat:OnJoin()
	--print("OnJoin", me.szName)
	--me.SetFightState(1);	  		--設置戰斗狀態
	me.SetCurCamp(1);
	Dialog:SendBlackBoardMsg(me, "10秒後比賽開始，請將龍舟技能放到快捷欄，准備比賽！");
end

--離開活動場地
function tbBoat:OnLeave()
	--print("OnLeave", me.szName);
	--Esport.DragonBoat:LogOutRV();
	--me.SetLogOutState(0);			--設置還原狀態	
	
	if self.tbPlayerMis[me.nId] and self.tbPlayerMis[me.nId]:IsOpen() == 1 then
		if self.tbPlayerMis[me.nId]:GetPlayerGroupId(me) > 0 then
			self.tbPlayerMis[me.nId]:KickPlayer(me);
			self.tbPlayerMis[me.nId] = nil;
		end
	end
end
