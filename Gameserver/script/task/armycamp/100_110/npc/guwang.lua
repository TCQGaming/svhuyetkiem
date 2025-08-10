-----------------------------------------------------------
-- 文件名　：guwang.lua
-- 文件描述：蠱王
-- 創建者　：ZhangDeheng
-- 創建時間：2008-11-27 11:19:16
-----------------------------------------------------------

-- 蠱王
local tbGuWang = Npc:GetClass("guwang");

-- 轉變的NPC
tbGuWang.tbChangeNpcTemplateId 	= {4156, 4157, 4158, 4159, 4160, 4161, 4162};
-- 蠱神
tbGuWang.tbGuSheng				= {4153, 1820, 2841};

tbGuWang.tbText = {
	{"Các ngươi rất nhanh thì sẽ có cơ hội minh bạch ，cái gì là chênh lệch!","thực lực đích chênh lệch"},
	{"Nhìn đây là ai","không nên động thủ a","là ta a ! ta chẩm ma hội ở ở đây ?","khoái ngừng tay ，chúng ta chẩm ma khả dĩ tự cùng tàn sát ?","dừng tay ，đây là cổ vương đích âm mưu a !","các ngươi không tin ta ?"},
	{"Ngươi thật sự nhẫn tâm như vậy?", "Gieo gió gặt bão thôi", "Cầu xin ngươi , hãy giúp ta aaa", "Được rồi", "Ngươi phải chuẩn bị thật tốt",},
	{{"Ý kiến thật hay", "Cổ thần"}, {"Ta nghĩ mà không ra", "HA HA HA", "Thật không ngờ ta bị tiểu tử đánh bại"}},
}

function tbGuWang:OnDeath(pNpc)
	local nEntryWayRate = MathRandom(100);
	
	KNpc.Add2(2793, 1, -1, him.nMapId, 1820, 2836); 
	
	local pPlayer  	= pNpc.GetPlayer();
	local nSubWorld, _, _	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	
	if (nEntryWayRate < 50) then	
		-- 開出秘徑
		
		local pEntryway = KNpc.Add2(4176, 110, -1, him.nMapId, 1820, 2846);
		local tbNpcData = pEntryway.GetTempTable("Task");
		tbNpcData.nEntrancePlayerId = pPlayer.nId;
		
		for _, teammate in ipairs(tbPlayList) do
			Task.tbArmyCampInstancingManager:ShowTip(teammate, "một đạo thần bí áp môn xuất hiện ở trên tế đài");
		end;
	end;
			-------Thưởng Quân Doanh
	local nTeamIdd = pPlayer.nTeamId;
	if nTeamIdd == 0 then
		pPlayer.AddKinReputeEntry(1);
	else
	local tbPlayerId, nMemberCount = KTeam.GetTeamMemberList(nTeamIdd);
		for i, nPlayerId in pairs(tbPlayerId) do
			local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pTeamPlayer and pTeamPlayer.nMapId == him.nMapId) then
			pTeamPlayer.AddStackItem(18,1,114,8,{bForceBind = 1},1);     --HT
			pTeamPlayer.AddExp(3000000);-----3tr Exp
			pTeamPlayer.AddBindCoin(5*10000);-------5 Vạn Đồng Khóa
			pTeamPlayer.AddBindMoney(50*10000);----50 vạn bạc khóa
			pTeamPlayer.SetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID,pTeamPlayer.GetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID)+1);
			end
		end
	end
	
	-- 用於老玩家召回任務完成任務記錄
--	local tbMemberList = pPlayer.GetTeamMemberList();	
	for _, player in ipairs(tbPlayList) do 
		Task.OldPlayerTask:AddPlayerTaskValue(player.nId, 2082, 4);
	end;
					
	-- 增加隊長的領袖榮譽
	local tbHonor = {[3] = 24, [4] = 36, [5] = 48, [6] = 60}; -- 3、4、5、6人隊長的領袖榮譽表
	local tbTeamPlayer, _ = KTeam.GetTeamMemberList(pPlayer.nTeamId);
	local _, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);	
	if tbHonor[nCount] and tbTeamPlayer then
		PlayerHonor:AddPlayerHonorById_GS(tbTeamPlayer[1], PlayerHonor.HONOR_CLASS_LINGXIU, 0, tbHonor[nCount]);
	end
	
		-- 四次任務
	for _, player in ipairs(tbPlayList) do 
		local tbPlayerTasks	= Task:GetPlayerTask(player).tbTasks;
		local tbTask1 = tbPlayerTasks[381];
		local tbTask2 = tbPlayerTasks[429]
		if ((tbTask1 and tbTask1.nReferId == 565) or (tbTask2 and tbTask2.nReferId == 622)) then
			player.SetTask(1022, 201, player.GetTask(1022, 201) + 1);
		end;
		
		-- 額外獎勵回調
		local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("ArmyCampBoss", player);
		SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	end;
end;

-- 血量觸發
function tbGuWang:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld, _, _	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	-- 血量第一次到達75或50 ，變成別的NPC，記錄血量
	if ((nLifePercent == 75 and tbInstancing.nGuWangChange75 == 0) or (nLifePercent == 50 and tbInstancing.nGuWangChange50 == 0)) then
		if (nLifePercent == 75) then
			tbInstancing.nGuWangChange75 = 1;
		end;
		if (nLifePercent == 50) then
			tbInstancing.nGuWangChange50 = 1;
		end;
		local nNpcNo =  MathRandom(7);
		local nSubWorld, nPosX, nPosY	= him.GetWorldPos();
		local pNpc = KNpc.Add2(self.tbChangeNpcTemplateId[nNpcNo], tbInstancing.nNpcLevel, -1, nSubWorld, nPosX, nPosY);
		assert(pNpc);
		
		tbInstancing:NpcSay(pNpc.dwId, self.tbText[2]);
		pNpc.AddLifePObserver(10);
		pNpc.GetTempTable("Task").nNpcId	= pNpc.dwId;
		pNpc.GetTempTable("Task").nGuWangCurLife = him.nCurLife; 
		him.Delete();
	elseif(nLifePercent == 30 and tbInstancing.nGuShenOut == 0) then -- 血量在10%的時候召喚蠱王
		tbInstancing.nGuShenOut = 1;
		local pNpc = KNpc.Add2(self.tbGuSheng[1], tbInstancing.nNpcLevel, -1, nSubWorld, self.tbGuSheng[2], self.tbGuSheng[3]);
		assert(pNpc);
		
		self:OnLifePercent10Say(him.dwId, pNpc.dwId); -- 蠱王與蠱神對話
	elseif (tbInstancing.nGuWangLife99 == 0) then -- 開始打的時候的對話
		tbInstancing:NpcSay(him.dwId, self.tbText[1]);
		tbInstancing.nGuWangLife99 = 1;
	end;
end;
	
function tbGuWang:OnLifePercent10Say(nGuWangId, nGuShenId)
	if (not nGuWangId or not nGuShenId) then
		return;
	end;
	local pNpc = KNpc.GetById(nGuWangId);
	if (not pNpc) then
		return;
	end;
	local nSubWorld, _, _	= pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	tbInstancing.nNpcSayTimerId2 	= Timer:Register(Env.GAME_FPS * 2, self.OnBreathDialog, self, nGuWangId, nGuShenId);
	tbInstancing.nCount				= 0;
end;

function tbGuWang:OnBreathDialog(nGuWangId, nGuShenId)
	assert(nGuWangId and nGuShenId);

	local pNpc = KNpc.GetById(nGuWangId);
	if (not pNpc) then
		return 0;
	end;
	local nSubWorld, _, _	= pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	--	assert(tbInstancing); -- 改成 RETURN zounan
	
	if not tbInstancing then
		return 0;
	end
	
	if not tbInstancing.nCount then
    tbInstancing.nCount = 0;
	end

	tbInstancing.nCount = tbInstancing.nCount + 1;
	if (tbInstancing.nCount >#self.tbText[3]) then
		return 0;
	end;
	
	-- nNpcId用來區分由誰說出
	local nNpcId = 0;
	if (tbInstancing.nCount == #self.tbText[3]) then
		nNpcId = nGuShenId;
		return 0;
	elseif (tbInstancing.nCount % 2 == 0) then
		nNpcId = nGuShenId;
	else
		nNpcId = nGuWangId;
	end;
	
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end;
		
	pNpc.SendChat(self.tbText[3][tbInstancing.nCount]);
	local tbPlayList, nCount = KPlayer.GetMapPlayer(pNpc.nMapId);
	for _, teammate in ipairs(tbPlayList) do
			teammate.Msg(self.tbText[3][tbInstancing.nCount], pNpc.szName);
	end;
	
end;

-- 變成的NPC
local tbNpc = Npc:GetClass("guwang_npc");

function tbNpc:OnLifePercentReduceHere(nLifePercent)
	local tbNpcData = him.GetTempTable("Task");
	if (not tbNpcData or him.dwId ~= tbNpcData.nNpcId) then
		return;
	end;
	
	local nSubWorld, nPosX, nPosY	= him.GetWorldPos();
	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);	
	
	local pGuWang = KNpc.Add2(4152, tbInstancing.nNpcLevel, -1, nSubWorld, nPosX, nPosY);
	assert(pGuWang);
	
	local nReduct = pGuWang.nMaxLife - tbNpcData.nGuWangCurLife;
	pGuWang.ReduceLife(nReduct);
	
	if (tbNpcData.nGuWangCurLife > 50) then
		pGuWang.AddLifePObserver(50);
		pGuWang.AddLifePObserver(30);
	else
		pGuWang.AddLifePObserver(30);
	end;
	
	if (him) then
		him.Delete();
	end;
end;


-- 蠱神
local tbGuSheng = Npc:GetClass("gushen");

function tbGuSheng:OnDeath(pNpc)
end;

-- 天絕峰指引
local tbTianJueGongZhiYin = Npc:GetClass("tianjuegongzhiyin");

tbTianJueGongZhiYin.szText = "Di chuyển vào 5 hầm đánh bại Npc canh giữ hầm, sau đó mở theo thứ tự <color=green>Kim - Mộc - Thổ - Thủy - Hỏa <color>";

function tbTianJueGongZhiYin:OnDialog()
	local tbOpt = {{"Cám ơn, ta đã hiểu"}, };
	Dialog:Say(self.szText, tbOpt);
end;

-- 禁地之門
local tbJinDiZhiMen = Npc:GetClass("jindizhimen");

function tbJinDiZhiMen:OnDialog()
	local tbNpcData = him.GetTempTable("Task");
	assert(tbNpcData.nEntrancePlayerId);
	local pOpener = KPlayer.GetPlayerObjById(tbNpcData.nEntrancePlayerId);
	if (not pOpener) then
		return;
	end
	
	local nTeamId = pOpener.nTeamId;
	
	if (me.nTeamId == 0) then
		local szMsg = "Tổ đội tài năng mới có thể tiến vào"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	
	if (me.nTeamId ~= nTeamId) then
		local szMsg ="Chỉ có <color=yellow>"..pOpener.szName.."<color>chỗ ở đội ngũ tài năng tiến nhập"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	
	local nEntryMapId = tbNpcData.nEntryMapId;

	Dialog:Say("Cổng vào phụ bản, bạn có muốn vào không?", 
		{"Có, Đưa ta đi", self.Enter, self, me, him.dwId, him.nMapId},
		{"Không"})
end;

function tbJinDiZhiMen:Enter(pPlayer, nNpcId, nEntryMapId)
	pPlayer.NewWorld(nEntryMapId, 1874, 2825);
	pPlayer.SetFightState(1);
end
