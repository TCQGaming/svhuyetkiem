-------------------------------------------------------
-- τݾĻaúqinshihuang.lua
-- Դݨ֟aúzhangjinpin@kingsoft
-- Դݨʱݤú2009-06-04 16:14:13
-- τݾĨ˶úfix skill state bug 2009-6-23
-------------------------------------------------------

Require("\\script\\boss\\qinshihuang\\qinshihuang_def.lua");

if (not MODULE_GAMESERVER) then
	return 0;
end

local tbQinshihuang = Boss.Qinshihuang;

-- ݆ʱǷԥע
function tbQinshihuang:OnTimer()

	if self.tbPlayerList then	
	
		-- ҩzΦݒҭ
		for nPlayerId, tbPlayerMap in pairs(self.tbPlayerList) do
	
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			
			-- ֒սΦݒהг
			if pPlayer then
				
				-- ȡޭڽքʱݤ
				local nTime = GetTime() - pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_START_TIME);
				
				-- ȡʹԃʱݤ
				local nUseTime = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME);
				
				-- ʱݤһأղ͟Զ
				-- ֢o޶޶ёΦݒ͟Զ֘ͼì۳ѸքәطܡԉRemovePlayerΪԉ
				if nUseTime + nTime> self.MAX_DAILY_TIME or self:_CheckState() ~= 1 then

					pPlayer.SetFightState(0);
					pPlayer.NewWorld(self:GetLeaveMapPos());			
					
					local szMsg ="Tần lăng chứa nhiều khí độc, không nên ở lại lâu";
					Dialog:SendBlackBoardMsg(pPlayer, szMsg);
					pPlayer.Msg(szMsg);
				end
			else
				self.tbPlayerList[nPlayerId] = nil;
			end
		end
	end

	return 5 * Env.GAME_FPS;
end

function tbQinshihuang:Init()
	
	-- עӡtimerì һֱզ՚
	self.nTimerID = Timer:Register(5 * Env.GAME_FPS, self.OnTimer, self);
end

-- նݓΦݒ
function tbQinshihuang:AddPlayer(nPlayerId, nMapLevel)
	
	if self:_CheckState() ~= 1 then
		return;
	end
	
	-- ͨڽID֒Φݒהг
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	-- ֒һս׵ܘ
	if not pPlayer then
		return;
	end
	
	-- ȡʣԠʱݤɎϱҤ(ī)
	local nUseTime = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME);
	print(""..nUseTime.."ssssssssss"..self.MAX_DAILY_TIME.."")
	-- ûʱݤ׵ܘ
	if nUseTime> self.MAX_DAILY_TIME then
		return;
	end
	
	-- Ҫ݇Φݒ, ֘ͼֈܶ.޸ɫʱݤ
	self.tbPlayerList[nPlayerId] = {};
	self.tbPlayerList[nPlayerId].nMapLevel = nMapLevel;
	self.tbPlayerList[nPlayerId].nStartTime = GetTime();
	
	-- ߪǴ݆ʱ
	local nFrame = (self.MAX_DAILY_TIME - nUseTime) * Env.GAME_FPS;
	self:OpenRightUI(pPlayer, nFrame);
	
	-- ʨ׃ߪʼʱݤ
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_START_TIME, self.tbPlayerList[nPlayerId].nStartTime);
	
	-- ʨ׃ѣۤ
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_PROTECT, 1);
	pPlayer.SetLogoutRV(1);
end

-- ӆԽΦݒ
function tbQinshihuang:RemovePlayer(nPlayerId)
	
	-- ͨڽID֒Φݒהг
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	-- ֒һս׵ܘ
	if not pPlayer then
		
		-- ɝխìՙƐ׏ЂҭאԐûԐ˽ߝìԐߍȥִ
		if self.tbPlayerList[nPlayerId] then
			self.tbPlayerList[nPlayerId] = nil;
		end
		
		return;
	end
	
	if self.tbPlayerList[nPlayerId] then
		
		-- ȡʣԠʱݤ
		local nTime = GetTime() - self.tbPlayerList[nPlayerId].nStartTime;
		local nUseTime = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME);
		
		nUseTime = nUseTime + nTime;
		
		if nUseTime> self.MAX_DAILY_TIME then
			nUseTime = self.MAX_DAILY_TIME;
		end

		-- ʨɎϱҤ
		pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME, nUseTime);
		pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_START_TIME, 0);
	end

	-- ӆԽҭ
	self.tbPlayerList[nPlayerId] = nil
	
	-- ژҕާĦ
	self:CloseRightUI(pPlayer);
	
	-- ʨ׃ѣۤ
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_PROTECT, 0);
end	

-- ߪǴԒӠ݆ʱާĦ
function tbQinshihuang:OpenRightUI(pPlayer, nRemainFrame)
	
	-- ԒӠДʾ
	local szMsg ="<color=green>Thời gian còn lại: <color=white>%s<color>";
	
	-- ߪǴާĦ
	Dialog:SetBattleTimer(pPlayer, szMsg, nRemainFrame);
	Dialog:SendBattleMsg(pPlayer,"", 1);
	Dialog:ShowBattleMsg(pPlayer, 1, 0);
end

-- ژҕԒӠ݆ʱާĦ
function tbQinshihuang:CloseRightUI(pPlayer)
	
	-- ژҕާĦ
	Dialog:ShowBattleMsg(pPlayer, 0, 0);
end

-- ĬɏքܘԌ֣
function tbQinshihuang:GetLeaveMapPos()
	
	local tbNpc = Npc:GetClass("chefu");
	
	for _, tbMapInfo in ipairs(tbNpc.tbCountry) do
		if SubWorldID2Idx(tbMapInfo.nId)>= 0 then
			local nRandomPos = MathRandom(1, #tbMapInfo.tbSect)
			return tbMapInfo.nId, tbMapInfo.tbSect[nRandomPos][1], tbMapInfo.tbSect[nRandomPos][2];
		end
	end
	
	return 5, 1580, 3029;
end

-- ÿͬט׃Ϊ2Сʱ	
function tbQinshihuang:DailyEvent()
		
	if self:_CheckState() ~= 1 then
		return;
	end
	
	-- ɧڻΦݒ՚֘ͼא
	if self.tbPlayerList[me.nId] then
		
		-- ט׃ʱݤҤ
		me.SetTask(self.TASK_GROUP_ID, self.TASK_START_TIME, GetTime());
		self.tbPlayerList[me.nId].nStartTime = GetTime();
		
		-- ټтާĦ
		self:OpenRightUI(me, self.MAX_DAILY_TIME * Env.GAME_FPS);
	end
	
	-- ݇¼Φݒ޸ɫڽȘʼ܊ªքͬ˽
	if (me.GetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME) ~= 0) then
		Stats.Activity:AddCount(me, Stats.TASK_COUNT_QINSHIHUANG, 1);
	end
	
	me.SetTask(self.TASK_GROUP_ID, self.TASK_USE_TIME, 0);
	
	-- ȥࠕÿͬʹԃքvۯʹλϯƷ˽
	me.SetTask(self.TASK_GROUP_ID, self.TASK_REFINE_ITEM, 0);
end;

-- ʹԃҹķשܘַ
function tbQinshihuang:OnUseYemingzhu(nPlayerId)
	
	-- ͨڽID֒Φݒהг
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	-- ֒һս׵ܘ
	if not pPlayer then		
		return;
	end
	
	-- Ɛ׏ҭאԐ֢ٶɋ
	if not self.tbPlayerList[nPlayerId] then
		Dialog:SendInfoBoardMsg(pPlayer,"<color=red>Đạo cụ này không sử dụng được ở đây<color>");
		return;
	end
	
	-- ȡbuffֈܶ
	local nSkillLevel = pPlayer.GetSkillState(1413);
	
	-- ձǰ֘ͼܶҰ
	local nMapLevel = self.tbPlayerList[nPlayerId].nMapLevel;
	
	if nSkillLevel> 0 and nSkillLevel>= nMapLevel - 1 then
		pPlayer.Msg("Đã dùng Dạ Minh Châu, Không cần sử dụng thêm.");
		Dialog:SendInfoBoardMsg(pPlayer,"<color=red>Đã dùng Dạ Minh Châu, Không cần sử dụng thêm.<color>");
		return;
	end
	
	-- ΦݒəԾֈܶ
	local nHonorLevel = pPlayer.GetHonorLevel();
	
	-- һѨҪݓbuff
	if not self.tbYemingzhu[nMapLevel][nHonorLevel] or self.tbYemingzhu[nMapLevel][nHonorLevel] <= 0 then
		pPlayer.Msg("Bản thân bạn có thể chịu được sức nóng hiện nay, không cần sử dụng!");
		Dialog:SendInfoBoardMsg(pPlayer,"<color=red>Bản thân bạn có thể chịu được sức nóng hiện nay, không cần sử dụng!<color>");
		return;
	end
	
	-- փսѨҪքҹķש˽
	local nNum = tonumber(self.tbYemingzhu[nMapLevel][nHonorLevel]);
	
	-- Ɛ׏ʭʏҹķש˽
	local nFind = pPlayer.GetItemCountInBags(18, 1, 357, 1);
	
	if nFind <nNum then
		Dialog:Say("Bạn đã có đủ dạ minh châu", {"Tôi biết"});
		return;
	end
	
	-- ࠛԽҹķש
	local bRet = pPlayer.ConsumeItemInBags(nNum, 18, 1, 357, 1);
	
	-- todo: check return
	pPlayer.AddSkillState(1413, nMapLevel - 1, 1, 60 * 60 * Env.GAME_FPS, 1, 1);
end

-- ѨҪ˽
function tbQinshihuang:GetCostNum(pPlayer)
	
	local nPlayerId = pPlayer.nId;
	
	-- Ɛ׏ҭאԐ֢ٶɋ
	if not self.tbPlayerList[nPlayerId] then
		return 0;
	end
	
	-- ձǰ֘ͼܶҰ
	local nMapLevel = self.tbPlayerList[nPlayerId].nMapLevel;
	
	-- ΦݒəԾֈܶ
	local nHonorLevel = pPlayer.GetHonorLevel();
	
	local nNum = self.tbYemingzhu[nMapLevel][nHonorLevel];
	
	-- һѨҪݓbuff
	if not nNum then
		return 0;
	end
	
	return nNum;
end

-- ݓغĦbuffìܖشֽĦbuff
function tbQinshihuang:OnMapEffect(nPlayerId, nMapLevel)
	
	-- ͨڽID֒Φݒהг
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	-- ֒һս׵ܘ
	if not pPlayer then		
		return;
	end
	
	-- ձǰ֘ͼܶҰ
	local nMapLevel = self.tbPlayerList[nPlayerId].nMapLevel;
	
	-- ΦݒəԾֈܶ
	-- temp fix bug
	--local nHonorLevel = pPlayer.GetHonorLevel();
	local nHonorLevel = PlayerHonor:GetPlayerMaxHonorLevel(pPlayer);
	
	-- һѨҪݓbuff
	if not self.tbYemingzhu[nMapLevel][nHonorLevel] or self.tbYemingzhu[nMapLevel][nHonorLevel] <= 0 then
		return;
	end
	
	-- ݓغĦbuff(10Сʱ)
	pPlayer.AddSkillState(1412, nMapLevel - 1, 1, 10 * 60 * 60 * Env.GAME_FPS, 1, 1);
	
	local szMsg = string.format("Bạn đang ở Tần Lăng tầng %d nơi đây tràn ngập khí độc. <color=yellow>Hãy sử dụng dạ minh châu để chống lại khí độc.<color>c", nMapLevel);
	Dialog:SendBlackBoardMsg(pPlayer,"Tràn ngập khí độc hãy sử dụng <color=yellow>Dạ minh châu.<color>");
	pPlayer.Msg(szMsg);
	
	-- ܖشֽĦbuff
	local nBuffLevel = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_BUFF_LEVEL);
	local nBuffFrame = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_BUFF_FRAME);
	
	-- ɧڻԐʱݤìҢȒһСԚձǰغbuffֈܶ
	if nBuffLevel> 0 and nBuffFrame> 36 and nBuffLevel>= nMapLevel - 1 then
		pPlayer.AddSkillState(1413, nBuffLevel, 1, nBuffFrame, 1, 1);
	
	-- رղߍȥ
	else
		if pPlayer.GetSkillState(1413)> 0 then
			pPlayer.RemoveSkillState(1413);
		end
	end
end

-- ȥԾ̹Ԑbuffì݇¼ֽĦbuff˴є
function tbQinshihuang:OnMapLeave(nPlayerId, nMapLevel)
	
	-- ͨڽID֒Φݒהг
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	-- ֒һս׵ܘ
	if not pPlayer then		
		return;
	end
	
	-- Զխ#-#
	if not self.tbPlayerList[nPlayerId] then
		Dbg:WriteLog("Boss_Qinling","Xuat hien tren ban do", pPlayer.szName, pPlayer.szAccount);
		return;
	end
	
	-- ݇¼ֽĦbuff
	local nSkillLevel,_, nEndFrame = pPlayer.GetSkillState(1413);
	
	if nSkillLevel> 0 and nEndFrame> 36 then
		pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUFF_LEVEL, nSkillLevel);
		pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUFF_FRAME, nEndFrame);
	else		
		-- ΦݒəԾֈܶ
		local nHonorLevel = PlayerHonor:GetPlayerMaxHonorLevel(pPlayer);
		
		if (pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_BUFF_LEVEL) + 1)>= nMapLevel then
			if self.tbYemingzhu[nMapLevel][nHonorLevel] and self.tbYemingzhu[nMapLevel][nHonorLevel]> 0 then
				pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUFF_LEVEL, 0);
				pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUFF_FRAME, 0);
			end
		end
	end
	
	-- ֽغbuffȫȥ
	if pPlayer.GetSkillState(1412)> 0 then
		pPlayer.RemoveSkillState(1412);
	end
	
	if pPlayer.GetSkillState(1413)> 0 then
		pPlayer.RemoveSkillState(1413);
	end
	
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_SAVEDATE, 0);
end

function tbQinshihuang:_OnMapEffect(pPlayer)
	if not pPlayer or not self.tbSaveData then
		return;
	end
	local nTask = 0;
	for i = 1, 4 do 
		local nMinute = math.floor(self.tbSaveData[i].nTime / 60);
		local nIndex = self.tbSaveData[i].nIndex - 1;
		local nOffset = (i - 1) * 8;
		nTask = Lib:SetBits(nTask, nIndex, nOffset, nOffset + 1);
		nTask = Lib:SetBits(nTask, nMinute, nOffset + 2, nOffset + 7);	
	end
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_SAVEDATE, nTask);
end

-- ݇¼Șʼ܊ID
function tbQinshihuang:OnProtectBoss(nTempId, nStep, tbDamage)	
	
	self.tbBoss.nTempId = nTempId
	self.tbBoss.nStep = nStep;
	self.tbBoss.tbDamage = tbDamage or {};
	
	-- ٫٦	
	local szMsg ="Thiên cổ nhất đế đã xuất hiện: \n";
	
	-- ƅѲ
	local tbSort = {unpack(tbDamage)};
	table.sort(tbSort, self._SortDamage);
	
	-- ˤԶхϢ
	for i = 1, 3 do
		if tbSort[i] then
			local szCaptainName = nil;
			if tbSort[i].nPlayerId> 0 then
				if tbSort[i].nTeamId == 0 then
					szCaptainName = KGCPlayer.GetPlayerName(tbSort[i].nPlayerId);
				else
					local tbPlayer = KTeam.GetTeamMemberList(tbSort[i].nTeamId) or {};
					if tbPlayer[1] then
						szCaptainName = KGCPlayer.GetPlayerName(tbPlayer[1]);
					end
				end
			end
			if szCaptainName then
				szMsg = szMsg.. string.format("Đầu tiên %d tên", i).."<color=yellow>".. szCaptainName.."Nhóm của<color>\n";
			end
		end
	end
	
	-- ڣҥٸΦݒ
	if self.tbPlayerList then
		for nPlayerId, tbPlayerMap in pairs(self.tbPlayerList) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.Msg(szMsg);
			end
		end
	end
end

tbQinshihuang._SortDamage = function(tbDamage1, tbDamage2)
	return tbDamage1.nDamage> tbDamage2.nDamage;
end

-- ׵ܘҽר
function tbQinshihuang:GetBossStep()
	if self.tbBoss.nStep then
		return self.tbBoss.nStep;
	end
	return 0;
end

-- ܖشսַ
function tbQinshihuang:RecoverBoss(nRate)
	
	if self.tbBoss.nTempId then
		
		local pTempNpc = KNpc.GetById(self.tbBoss.nTempId);
		
		if pTempNpc then
			pTempNpc.Delete();
		end
	end
	
	-- սַȘʼ܊
	local pNpc = KNpc.Add2(2426, 120, -1, 1540, 1820, 3282);
	
	pNpc.AddLifePObserver(80);
	pNpc.AddLifePObserver(50);
	pNpc.AddLifePObserver(20);
	
	-- ʨ׃ִäϯƷքʱ۲ˇرܘַޅѾ
	pNpc.SetLoseItemCallBack(1);
	
	if pNpc then 
		local nReduceLife = math.floor(pNpc.nMaxLife * nRate);
		pNpc.ReduceLife(nReduceLife);
		
		-- ܖشʋڦ݇¼
		for i = 1, 3 do
			if self.tbBoss.tbDamage[i] then			
				pNpc.SetDamageTable(i,
					self.tbBoss.tbDamage[i].nTeamId,
					self.tbBoss.tbDamage[i].nPlayerId,
					self.tbBoss.tbDamage[i].nTime,
					self.tbBoss.tbDamage[i].nDamage
					);
			end
		end
	end
end

-- ̀ζ݆˽
function tbQinshihuang:AddDeathCount()
	
	if not self.tbBoss.nDeathCount then
		self.tbBoss.nDeathCount = 0;
	end
	
	self.tbBoss.nDeathCount = self.tbBoss.nDeathCount + 1;
	
	if (self.tbBoss.nStep == 1 and self.tbBoss.nDeathCount == 4) then
		self:RecoverBoss(0.21);
		
	elseif (self.tbBoss.nStep == 2 and self.tbBoss.nDeathCount == 8) then
		self:RecoverBoss(0.51);
		
	elseif (self.tbBoss.nStep == 3 and self.tbBoss.nDeathCount == 12) then
		self:RecoverBoss(0.81);
	end
end

function tbQinshihuang:ClearInfo()
	self.tbBoss.nTempId = nil;
	self.tbBoss.nStep = 0;
	self.tbBoss.nDeathCount = 0;
	self.tbBoss.tbDamage = {};
	self.tbBoss.nPassId1 = nil;
	self.tbBoss.nPassId2 = nil;
end

function tbQinshihuang:ClearPassNpc()
	
	if self.tbBoss.nPassId1 then
		
		local pNpc = KNpc.GetById(self.tbBoss.nPassId1);
		
		if pNpc then
			pNpc.Delete();
		end
	end
	
	if self.tbBoss.nPassId2 then
		
		local pNpc = KNpc.GetById(self.tbBoss.nPassId2);
		
		if pNpc then
			pNpc.Delete();
		end
	end
end

-- ̀ζ˂ݾ
function tbQinshihuang:OnPlayerDeath()
		
	if self.tbPlayerList[me.nId] then
		
		if self.tbPlayerList[me.nId].nMapLevel> 3 then
			me.ReviveImmediately(1);
			me.SetFightState(0);
			me.NewWorld(1538, 1762, 3191);		-- ֚ɽӣքвȫȸ			
			
		elseif self.tbPlayerList[me.nId].nMapLevel> 1 then
			me.ReviveImmediately(1);
			me.SetFightState(0);
			me.NewWorld(1536, 1567, 3629);		-- ֚һӣքвȫȸ			
			
		else
			me.ReviveImmediately(1);
			me.SetFightState(0);
			me.NewWorld(self:GetLeaveMapPos());	-- ܘԌ֣		
		end
	end
end

-- ȸԲڣҥ
function tbQinshihuang:Broadcast(szMsg)

	if self.tbPlayerList then
		for nPlayerId, tbPlayerMap in pairs(self.tbPlayerList) do
			
			-- ֒սΦݒ
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			
			-- ֒սΦݒהг
			if pPlayer then
				Dialog:SendBlackBoardMsg(pPlayer, szMsg);
				pPlayer.Msg(szMsg);
			end
		end
	end
end

-- call boss ܘַ
function tbQinshihuang:OnBossCallOut(pNpc)
		
	local tbBoss = 
	{
		[2426] = 1,
		[2451] = 2,
		[2452] = 2,
		[2453] = 2,
		[2454] = 2,
		[2455] = 2,
	};
	
	local nType = tbBoss[pNpc.nTemplateId];
	
	if not nType then
		return 0;
	end
	
	-- Șʼ܊
	if nType == 1 then
		
		-- Șʼ܊
		local szMsg = string.format("<color=green>Theo những người đào mộ cổ truyền tai cho nhau nghe, Thiên cổ nhất đế đã sống lại ở tầng 5 của Tần Lăng<color>");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
		KDialog.MsgToGlobal(szMsg);	
-- local tbGMCard	= Item:GetClass("gmcard");
		-- tbGMCard:XepHangDanhVong();
		pNpc.AddLifePObserver(80);
		pNpc.AddLifePObserver(50);
		pNpc.AddLifePObserver(20);
		
		-- ʨ׃ִäϯƷքʱ۲ˇرܘַޅѾ
		pNpc.SetLoseItemCallBack(1);
		
		return 1;
		
	elseif nType == 2 then
		
		-- Сboss
		local szMsg = string.format("Nghe thấy tiếng động tại %s", pNpc.szName);
		self:Broadcast(szMsg);
		
		return 1;
	end
	
	return 0;
end

-- gc to gs
function tbQinshihuang:DoUpdateQinBoss(nTemplateId, nMapId, nMapX, nMapY)
	
	local nMapIndex = SubWorldID2Idx(nMapId);
	
	if nMapIndex <0 then
		return;
	end	

	if Boss.tbUniqueBossCallOut[nTemplateId] then
		return;
	end	
	
	-- add npc 
	local pNpc = KNpc.Add2(nTemplateId, 120, -1, nMapId, nMapX, nMapY, 0, 1);
		
	if pNpc then
		
		-- flag
		Boss.tbUniqueBossCallOut[nTemplateId] = 1;
		
		local szMsg = string.format("Nghe thấy tiếng động tại %s", pNpc.szName);
		self:Broadcast(szMsg);
	end
end

function tbQinshihuang:SaveData(tbData)
	self.tbSaveData = tbData;
end

function tbQinshihuang:DoOpenQinFive()
	self.bOpenQinFive = 1;
	
	local szMsg ="Với sự sống lại của Tần Thủy Hoàng, cửa vào tầng 5 Tần Lăng đang từ từ mở ra......";
	self:Broadcast(szMsg);
end

function tbQinshihuang:DoCloseQinFive()
	self.bOpenQinFive = 0;
	self:ClearPassNpc();
	
	local szMsg ="Các chiến binh đã dũng cảm chiến đấu Tần Thủy Hoàng, cửa vào tầng 5 đang từ từ đóng lại.....";
	self:Broadcast(szMsg);
end

function tbQinshihuang:CheckOpenQinFive()
	return self.bOpenQinFive;
end

function tbQinshihuang:_CloseSystem()	
	if self.tbPlayerList then	
		for nPlayerId, tbPlayerMap in pairs(self.tbPlayerList) do	
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.SetFightState(0);
				pPlayer.NewWorld(self:GetLeaveMapPos());			
			else
				self.tbPlayerList[nPlayerId] = nil;
			end
		end
	end
	self._bOpen = 0;
end

function tbQinshihuang:_OpenSystem()
	self._bOpen = 1;
end

function tbQinshihuang:_CheckState()
	return self._bOpen;
end

function tbQinshihuang:OnPlayerLogin()
	
	local tbMap = 
	{
		[1536] = 1,
		[1537] = 1,
		[1538] = 1,
		[1539] = 1,
		[1540] = 1,
	};
	if tbMap[me.nMapId] then
		return;
	end
	
	local nProtect = me.GetTask(self.TASK_GROUP_ID, self.TASK_PROTECT);
	if nProtect ~= 1 then
		return;
	end
	
	me.nPkModel = Player.emKPK_STATE_PRACTISE;
	me.nForbidChangePK	= 0;
	me.DisabledStall(0);

	if me.GetSkillState(1412)> 0 then
		me.RemoveSkillState(1412);
	end
	
	if me.GetSkillState(1413)> 0 then
		me.RemoveSkillState(1413);
	end
	
	me.SetTask(self.TASK_GROUP_ID, self.TASK_PROTECT, 0);
end

-- עӡΦݒÿɕ˂ݾ
PlayerSchemeEvent:RegisterGlobalDailyEvent({Boss.Qinshihuang.DailyEvent, Boss.Qinshihuang});

-- עӡǴ֯˂ݾ
ServerEvent:RegisterServerStartFunc(Boss.Qinshihuang.Init, Boss.Qinshihuang);

-- עӡ̀ζ˂ݾ
PlayerEvent:RegisterGlobal("OnDeath", Boss.Qinshihuang.OnPlayerDeath, Boss.Qinshihuang);

-- עӡև½˂ݾ
PlayerEvent:RegisterGlobal("OnLogin", Boss.Qinshihuang.OnPlayerLogin, Boss.Qinshihuang);
