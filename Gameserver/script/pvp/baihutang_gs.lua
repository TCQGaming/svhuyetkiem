-------------------------------------------------------------------
--File		: baihutang_gs.lua
--Author	: ZouYing
--Date		: 2008-1-8 14:16
--Describe	: 白虎堂活动脚本
-------------------------------------------------------------------
if not MODULE_GAMESERVER then
	return;
end

BaiHuTang.tbFactionChu	= {};
BaiHuTang.tbFactionGao	= {};
BaiHuTang.tbKillerChu	= {};
BaiHuTang.tbDeathChu	= {};
BaiHuTang.tbKillerGao	= {};
BaiHuTang.tbDeathGao	= {};
--BaiHuTang.TIMER_ADD_boss1		= Env.GAME_FPS * 60 * 1;	-- 护卫大将、元帅奖分间隔
--BaiHuTang.TIMER_ADD_boss2		= Env.GAME_FPS * 60 * 2;	-- 护卫大将、元帅奖分间隔
--BaiHuTang.TIMER_ADD_boss3		= Env.GAME_FPS * 60 * 3;	-- 护卫大将、元帅奖分间隔

--	self.tbSysMsg[1] = "Hoạt động Bạch Hổ Đường chính thức bắt đầu.";
--	self.tbSysMsg[2] = "Bạch hổ đường ngừng đăng ký, hoạt động bắt đầu";

--	BaiHuTang.tbSysMsg[1] = "Bạch hổ đường thủ lĩnh tầng 1 đã xuất hiện.";
--	BaiHuTang.tbSysMsg[2] = "Bạch hổ đường thủ lĩnh tầng 2 đã xuất hiện.";
--	BaiHuTang.tbSysMsg[3] = "Bạch hổ đường thủ lĩnh tầng 3 đã xuất hiện.";
	--self.tbSysMsg[6] = "Chúc mừng bạn đã khiêu chiến thành công Bạch Hổ Đường";
	--self.tbSysMsg[7] = "Thời gian, bạn khiêu chiến Bạch Hổ Đường";
--PK活动开始
function BaiHuTang:PKStart_GS(nTaskId)----------------------------
	self.nTaskId	= nTaskId;
	self.nActionState = self.FIGHTSTATE;
	self.nRegisterIdLeft  = Timer:Register(self.TIMELEFT, self.OnTimerLeft, self);
	KDialog.Msg2SubWorld(self.tbSysMsg[2]);
	self:BroadcastMsg(1);
	self:ProcessFightStart(self.ChuJi);
	self:ProcessFightStart(self.GaoJi);
	self:ProcessFightStart(self.Goldlen);
	self:AddNpc();
	
end
	
function BaiHuTang:OnTimerLeft()
	return 0;
end


--开始报名
function BaiHuTang:ApplyStart_GS()
	self.nActionState = self.APPLYSTATE;
	KDialog.NewsMsg(0, Env.NEWSMSG_NORMAL, self.szApplyMsg);
	BaiHuTang:MissionStop();
	self:CreateMissions();
	self:Open();	
	self:ClearAwardCount();	
	self.nRegisterIdLeft = Timer:Register(self.TIMELEFT, self.OnTimerLeft, self);
	self.nStateJour = 0;
	self:TimerStart();
	self.tbNumber	= {};
end

--PK活动结束
function BaiHuTang:PKStop_GS()
	self:BroadcastMsg(7);
	self:ProcessFightStop(self.GaoJi);
	self:ProcessFightStop(self.ChuJi);
	self:ProcessFightStop(self.Goldlen);
	self:MissionStop();
	self.nActionState = self.RESTSTATE;
	self.nStateJour = 7;
	self:TimerStart();
end

--白虎堂活动下一轮开始
function BaiHuTang:NextPvpStart_GS()
	self:PKStop_GS();
	self:ApplyStart_GS();
end

--对PK结束状态的修改
function BaiHuTang:ProcessFightStop(nLevel) 
	self.tbIsOpen = {};--将所有传送们关闭	
	for _, tbMapId in ipairs(self.tbBatte[nLevel].MapId) do
		for _, nMapId in ipairs(tbMapId) do
			ClearMapObj(nMapId);
			ClearMapNpc(nMapId); 
		end
	end
end

function BaiHuTang:AddNpc()
	self.nBossNo = 1; --设置BOSS的出现
	self:_AddNpc(1);
	self:_AddNpc(2);
	self:_AddNpc(3);
    self.nTimerxID = Timer:Register(5 * 60 * Env.GAME_FPS, self.boss1, self);--5
    self.nTimerxxID = Timer:Register(12 * 60 * Env.GAME_FPS, self.boss2, self);--12
    self.nTimerxxxID = Timer:Register(19 * 60 * Env.GAME_FPS, self.boss3, self);--19	
end

-- 师徒成就：白虎堂
function BaiHuTang:GetAchievement(pPlayer)
	if (not pPlayer) then
		return;
	end
	
	local nAchievementId = 0;
	local nMapLevel = BaiHuTang:GetLevelByMapId(pPlayer.nMapId);
	if (1 == nMapLevel) then
		nAchievementId = Achievement.BAIHUTANG_CHUJI;
	elseif (2 == nMapLevel) then
		nAchievementId = Achievement.BAIHUTANG_GAOJI;
	-- elseif (3 == nMapLevel) then
	-- 如果需要再成就系统里面添加黄金白虎堂的话，可以在这里添加
	end
	
	Achievement:FinishAchievement(pPlayer.nId, nAchievementId);
end

--PK开始状态的修改
function BaiHuTang:ProcessFightStart(nLevel) 
	for _, nIndex in ipairs(self.tbBatte[nLevel].MapId[1]) do
		local tbPlayList = KPlayer.GetMapPlayer(nIndex);
		
		if (tbPlayList) then
			for _, pPlayer in ipairs(tbPlayList) do
				
				if pPlayer.dwUnionId ~= 0 and BaiHuTang:GetLevelByMapId(pPlayer.nMapId) > 1 then
					pPlayer.nPkModel = Player.emKPK_STATE_UNION;
				else
					pPlayer.nPkModel = Player.emKPK_STATE_TONG;
				end
				
				self:AddFriendFavor(pPlayer, tbPlayList, 10); -- 添加亲密度
				pPlayer.SetFightState(1);	--设置战斗状态
				Dialog:ShowBattleMsg(pPlayer, 0, 0);
	   			self:ShowTimeInfo(pPlayer, 1);
	   			self:_SetPKTimes(pPlayer);
	   		--	self:AddRepute(pPlayer, 40); -- 添加声望
	   			pPlayer.AddOfferEntry(20, WeeklyTask.GETOFFER_TYPE_BAIHUTANG); -- 增加贡献度
	   			if (pPlayer.GetTrainingTeacher()) then	-- 如果玩家现在的身份是徒弟，师徒任务当中的白虎堂次数加1
	   				-- local tbItem = Item:GetClass("teacher2student");
	   				local nNeed_BaiHuTang = pPlayer.GetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_BAIHUTANG) + 1;
	   				pPlayer.SetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_BAIHUTANG, nNeed_BaiHuTang);
	   			end
	   			
	   			-- 师徒成就：白虎堂
	   			self:GetAchievement(pPlayer);
	   			
	   			local nBaiHuLevel = BaiHuTang:GetLevelByMapId(pPlayer.nMapId);
	   			local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("BaiHuTang", pPlayer, nBaiHuLevel, 0);
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
				
	   			-- 关闭popo
	   			pPlayer.CallClientScript({"PopoTip:HidePopo", 18});
	   		end
	   	end
	end
end

--添加小怪
function BaiHuTang:_AddXiaoGuai(nLevel, nNumber)
	local tbMapId = self.tbBatte[nLevel].MapId[nNumber];
	local nTmpId = self.tbBatte[nLevel].tbNpcTemp[nNumber];
	if(nLevel == self.GaoJi)then
		nNumber = nNumber + 3;
	end
	if(nLevel == self.Goldlen)then
		nNumber = nNumber + 6;
	end	
	for _, nMapId in ipairs(tbMapId) do
		local nWorldIdx = SubWorldID2Idx(nMapId);
		if (nWorldIdx >= 0) then
			for _, tbPos in ipairs(self.tbAnimalPos) do
				KNpc.Add2(nTmpId, self.tbNpcLevel[nNumber], -1, nMapId, tbPos.nX / 32, tbPos.nY / 32, 1); --小怪重生
			end
		end	
	end
end

--添加BOSS
function BaiHuTang:_AddBoss(nLevel, nNumber)
	local tbMapId = self.tbBatte[nLevel].MapId[nNumber];
	local nTempId = self.tbBatte[nLevel].tbBossTemp[nNumber];
	
	if(nLevel == self.GaoJi)then
		nNumber = nNumber + 3;
	end
	if(nLevel == self.Goldlen)then
		nNumber = nNumber + 6;
	end
	
	for _, nMapId in ipairs(tbMapId) do
		local nWorldIdx = SubWorldID2Idx(nMapId);
		if (nWorldIdx >= 0 ) then
			local pNpc = KNpc.Add2(nTempId, self.tbNpcLevel[nNumber], -1, nMapId, 1578, 3146);
			Npc:RegPNpcOnDeath(pNpc, self.OnDeath_Boss, self);
		end
	end
end


function BaiHuTang:OnDeath_Boss(pNpc)
	local pKillerPlayer = pNpc.GetPlayer();
	if (pKillerPlayer) then
		--self:AddRepute(pKillerPlayer, 10);
		--self:AwardWeiWang(pKillerPlayer, 2, 10);
		self:AwardXinDe(pKillerPlayer, 100000);
	   	
	   	local nMapId = pKillerPlayer.nMapId
	   	local nBaiHuLevel = BaiHuTang:GetLevelByMapId(nMapId);
	   	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("BaiHuTangBoss", pKillerPlayer, nBaiHuLevel, BaiHuTang:GetFloor(nMapId));
		SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
		
		local nTeamId	= pKillerPlayer.nTeamId;
		if (0 == nTeamId) then
			return;
		end
		local tbPlayerId, nMemberCount	= KTeam.GetTeamMemberList(nTeamId);
		for i, nPlayerId in pairs(tbPlayerId) do
			local pPlayer	= KPlayer.GetPlayerObjById(nPlayerId);
			if (pPlayer and  pPlayer.nId ~= pKillerPlayer.nId and pPlayer.nMapId == him.nMapId) then
				--self:AwardWeiWang(pPlayer, 2);
				self:AwardXinDe(pPlayer, 100000);
				--self:AddRepute(pPlayer, 10);
	   			local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("BaiHuTangBoss", pPlayer, nBaiHuLevel, BaiHuTang:GetFloor(nMapId));
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);				
			end
		end
	end
end

function BaiHuTang:AwardWeiWang(pPlayer, nWeiWang)
	pPlayer.AddKinReputeEntry(nWeiWang, "baihutang");
end

function BaiHuTang:AwardXinDe(pPlayer, nXinDe)
	if (nXinDe > 0) then
		Setting:SetGlobalObj(pPlayer);
		Task:AddInsight(nXinDe);
		Setting:RestoreGlobalObj();
	end
end

--对不同级别添加NPC
function BaiHuTang:_AddNpc(nNumber, IsBoss)
	if (IsBoss == nil) then
		self:_AddXiaoGuai(self.GaoJi, nNumber);
		self:_AddXiaoGuai(self.ChuJi, nNumber);
		self:_AddXiaoGuai(self.Goldlen, nNumber);
	else
		self:_AddBoss(self.ChuJi, nNumber);
		self:_AddBoss(self.GaoJi, nNumber);
		self:_AddBoss(self.Goldlen, nNumber);	
		self:BroadcastMsg(self.tbBossShowMsg[nNumber]); --提示BOSS的出现
	end
	
	--额外事件，活动接口	
	local tbMapLevel = {
		[1] = self.ChuJi,
		[2] = self.GaoJi,
		[3] = self.Goldlen,
	}
	for nLevel, nMapLevel in pairs(tbMapLevel) do
		local tbMapId = self.tbBatte[nMapLevel].MapId[nNumber];
		for _, nMapId in ipairs(tbMapId) do
			local nWorldIdx = SubWorldID2Idx(nMapId);
			if (nWorldIdx >= 0 ) then
				SpecialEvent.ExtendEvent:DoExecute("CallNpc_BaiHuTang", nMapId, nLevel, nNumber, (IsBoss or 0));
			end
		end
	end
end


--设置进入战斗状态
function BaiHuTang:_SetPKState(pPlayer)
	pPlayer.DisabledStall(1);	--摆摊
	pPlayer.nForbidChangePK	= 1;
end	

--设置离开战斗状态
function BaiHuTang:_SetLeaveFightState(pPlayer)
	Dialog:ShowBattleMsg(pPlayer, 0, 0); --取消时间显示
	pPlayer.DisabledStall(0);	--摆摊
	pPlayer.nForbidChangePK	= 0;
	pPlayer.SetFightState(1);
end

--设置PK次数
function BaiHuTang:_SetPKTimes(pPlayer)
	if (pPlayer) then
		local nOldTimes = pPlayer.GetTask(self.TSKG_PVP_ACT, self.TSK_BaiHuTang_PKTIMES);
		if (nOldTimes> 0) then
			nOldTimes = nOldTimes + 1;
		else
			local szNowDate = GetLocalDate("%y%m%d");
			local nNowDate = tonumber(szNowDate) * 10 + 1;
			nOldTimes = nNowDate;
		end
		pPlayer.SetTask(self.TSKG_PVP_ACT, self.TSK_BaiHuTang_PKTIMES, nOldTimes);
		Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_BAIHUTANG, 1);
	end
end

-- 分阶段定时开始
function BaiHuTang:TimerStart(szFunction)
	local nRet;
	if szFunction then
		local fncExcute = self[szFunction];
		if fncExcute then
			nRet = fncExcute(self);
			if nRet and nRet == 0 then	
				--self:ShutUp();	-- 关闭活动
				return 0;
			end
		end
	end
	-- 状态转换
	self.nStateJour = self.nStateJour + 1;
	if (self.nStateJour >= self.END) then
		return 0;
	end
	self.nState = self.STATE_TRANS[self.nStateJour][1];
	if self.nState == nil or self.nState >= self.END then	-- 未必开启或者已经结束
		--self:ShutUp();	-- 关闭活动
		return 0;
	end
	-- 下一阶段定时
	local tbTimer = self.STATE_TRANS[self.nStateJour];
	if not tbTimer then
		print("[Error]")
		return 0;
	end
	Dbg:WriteLogEx(2, "BaiHuTang", tbTimer[2], tbTimer[3], self.nStateJour, GetLocalDate("%H:%M-%S"));
	Timer:Register(
		tbTimer[2],
		self.TimerStart,
		self,
		tbTimer[3]
	);	-- 开启新的定时
	return 0
end



function BaiHuTang:ShowGongGao()
	Dbg:Output("BaiHuTang", "ShowGongGao", GetLocalDate("%H:%M %S"));
	KDialog.NewsMsg(0, Env.NEWSMSG_NORMAL, self.szApplyMsg);

end
function BaiHuTang:boss1()
--local nMapId, nPosX, nPosY = me.GetWorldPos();
KNpc.Add2(2663, 80, 0, 234, 1578, 3146)
KNpc.Add2(2663, 80, 0, 235, 1578, 3146)
KNpc.Add2(2663, 80, 0, 236, 1578, 3146)
KNpc.Add2(2663, 80, 0, 237, 1578, 3146)
KNpc.Add2(2663, 80, 0, 226, 1578, 3146)
KNpc.Add2(2663, 80, 0, 227, 1578, 3146)
KNpc.Add2(2663, 80, 0, 228, 1578, 3146)
KNpc.Add2(2663, 80, 0, 229, 1578, 3146)

-- local szMsg = "<color=red>Bạch hổ đường thủ lĩnh tầng 1 đã xuất hiện.<color>";
		 -- KDialog.MsgToGlobal(szMsg)
--local szMsg = self.tbSysMsg[1];		
--KDialog.Msg2SubWorld(self.tbSysMsg[1]);
Timer:Close(self.nTimerxID);
end
function BaiHuTang:boss2()
--local nMapId, nPosX, nPosY = me.GetWorldPos();
KNpc.Add2(2684, 80, 0, 238, 1578, 3146)
KNpc.Add2(2684, 80, 0, 239, 1578, 3146)
KNpc.Add2(2684, 80, 0, 230, 1578, 3146)
KNpc.Add2(2684, 80, 0, 231, 1578, 3146)
-- local szMsg = "<color=red>Bạch hổ đường thủ lĩnh tầng 2 đã xuất hiện.<color>";
       -- KDialog.MsgToGlobal(szMsg);
        Timer:Close(self.nTimerxxID);
end
function BaiHuTang:boss3()
local nTime = GetTime()
local nCurTime = tonumber(os.date("%H%M", nTime))
local nXuatHienBossDacBiet_BHD = ConfigAll.XuatHienBossDacBiet_BHD
KNpc.Add2(2688, 80, 0, 240, 1578, 3146)
KNpc.Add2(2688, 80, 0, 232, 1578, 3146)
---------BOSS BHĐ Đặc Biệt
-- if nCurTime >= 2200 and nCurTime <= 2250 then
-- if nXuatHienBossDacBiet_BHD == 0 then 
-- KNpc.Add2(10372, 90, 0, 232, 1578, 3146);--------Sơ
-- elseif nXuatHienBossDacBiet_BHD == 1 then
-- KNpc.Add2(10372, 90, 0, 240, 1578, 3146);-------- Cao
-- end 
-- local szMsg = "<color=yellow>Bạch hổ đường thủ lĩnh tầng 3 Đặc Biệt đã xuất hiện.<color>";
 -- KDialog.MsgToGlobal(szMsg);
-- end
-------------------------------------------
	   Timer:Close(self.nTimerxxxID);
end
function BaiHuTang:CallBoss()
	local nLevel = 0;
	if (self.nBossNo == 1)then
		self.nBossNo = 2;
		nLevel = 1;
	elseif(self.nBossNo == 2) then
		self.nBossNo = 3;
		nLevel = 2;
	elseif(self.nBossNo == 3)then
		nLevel = 3;
	end
	Dbg:Output("BaiHuTang", "CallBoss", GetLocalDate("%H:%M %S"));
	if (nLevel ~= 0) then
		self:_AddNpc(nLevel, 1);		
	end
end
-- 显示即时信息：剩余时间
function BaiHuTang:ShowTimeInfo(pPlayer, IsPK)
	Dialog:SendBattleMsg(pPlayer, "")
	local nRemainFrame		= Timer:GetRestTime(self.nRegisterIdLeft);
	local szMsgFormat		= "";
	if (IsPK == 1) then
		szMsgFormat = "<color=green>Thời gian còn lại: <color> <color=white>%s<color>";
	else
		szMsgFormat = "<color=green>Thời gian chuẩn bị còn: <color><color=white>%s<color>";
	end
	Dialog:SetBattleTimer(pPlayer, szMsgFormat, nRemainFrame);
	Dialog:ShowBattleMsg(pPlayer, 1, 0);
end;
--对玩家的广播
function BaiHuTang:BroadcastMsg(nIndex)
	if (nIndex <= 7 and nIndex >= 1) then
		self:_SendSysMsg(nIndex, self.ChuJi);
		self:_SendSysMsg(nIndex, self.GaoJi);
		self:_SendSysMsg(nIndex, self.Goldlen);
	end
end

--发送信息
function BaiHuTang:_SendSysMsg(nIndex, nLevel)	
	local szMsg = self.tbSysMsg[nIndex];
	local tbMapList = self.tbBatte[nLevel].MapId;
	for _, Map in ipairs(tbMapList) do
		for _, nMapId in ipairs(Map) do
			local tbPlayer, nCount = KPlayer.GetMapPlayer(nMapId);
			if (nCount > 0 ) then
				KDialog.Msg2PlayerList(tbPlayer, szMsg, "Hệ thống nhắc nhở ");
			end
		end
	end
end

function BaiHuTang:AddRepute(pPlayer, nValue)
	pPlayer.AddRepute(self.BAIHUTANG_REPUTE_CAMP, self.BAIHUTANG_REPUTE_CALSS, nValue);
end

function BaiHuTang:AddFriendFavor(pSelf, tbPlayerList, nFavor)
	if (0 == pSelf.nTeamId) then
		return;
	end
	for _, pPlayer in ipairs(tbPlayerList) do
		if (pPlayer.nId ~= pSelf.nId and 
			pPlayer.nTeamId == pSelf.nTeamId and
			pSelf.IsFriendRelation(pPlayer.szName) == 1) then	
			Relation:AddFriendFavor(pSelf.szName, pPlayer.szName, nFavor);
			pSelf.Msg(string.format("Bạn và <color=yellow>%s<color> độ thân mật tăng thêm %d điểm.", pPlayer.szName, nFavor * 2));
		end
	end
end

function BaiHuTang:ClearAwardCount()
	self.tbGetAwardCount = {};
end

function BaiHuTang:GetFloor(nMapId)
	if (nMapId >= 226 and nMapId <= 229) 
		or (nMapId >= 275 and nMapId <= 278)
		or (nMapId >= 334 and nMapId <= 337) 
		or (nMapId >= 234 and nMapId <= 237)
		or (nMapId >= 822 and nMapId <= 825) then
		return 1;
	elseif (nMapId >= 230 and nMapId <= 231) 
		or (nMapId >= 279 and nMapId <= 280)
		or (nMapId >= 338 and nMapId <= 339)
		or (nMapId >= 238 and nMapId <= 239)
		or (nMapId >= 826 and nMapId <= 827) then
		return 2;
	elseif (nMapId == 232 or nMapId == 281 or nMapId == 340 or nMapId == 240 or nMapId == 828) then
		return 3;
	end
	return 0;
end

function BaiHuTang:GetLevelByMapId(nMapId)
	if nMapId == self.GaoJi then
		return 2;
	end
	if nMapId == self.Goldlen then
		return 3;
	end	
	for _, tb in pairs(self.tbBatte[self.GaoJi].MapId) do
		for __, nTempMap in pairs(tb) do
			if nTempMap == nMapId then
				return 2;
			end
		end
	end
	for _, tb in pairs(self.tbBatte[self.Goldlen].MapId) do
		for __, nTempMap in pairs(tb) do
			if nTempMap == nMapId then
				return 3;
			end
		end
	end
	return 1;
end

function BaiHuTang:IsOpenGolden()
	if TimeFrame:GetState("OpenBaiHuTangGolden") == 1 then
		return 1;
	end
	return 0;
end
