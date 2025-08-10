-----------------------------------------------------------
-- văn kiện danh 　：lingxiefengnpc.lua
-- văn kiện miêu tả ：bích ngô ngọn núi NPCcước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-27 09:19:00
-----------------------------------------------------------

-- thiết công kê tù môn 
local tbLaoMen = Npc:GetClass("laomen");

function tbLaoMen:OnDialog()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nLaoMenDurationTime ~= 0) then
		me.Msg("Hãy chờ vài giây rồi thử mở lại!")
		return;
	end;
	
		local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
	}
	-- 
	GeneralProcess:StartProcess("Đang mở chuồng kê", 5 * Env.GAME_FPS, {self.Open, self, me.nId, him.dwId, tbInstancing}, {me.Msg,"Thao tác bị gián đoạn"}, tbEvent);
end;

-- mở tù môn xác xuất thành công 30%
function tbLaoMen:Open(nPlayerId, nNpcId, tbInstancing)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	assert(pPlayer);
	if (not pNpc) then
		return;
	end;
	
	-- xác xuất thành công 30%
	local nSuccess = MathRandom(100);
	if (nSuccess <30) then
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"Thiết môn đã mở!");
		tbInstancing.nTieGongJiLaoMen = 1;
		pNpc.Delete();
	else
		pPlayer.Msg("Khai mở thiết môn thất bại!");
		tbInstancing.nLaoMenDurationTime = 5;
	end;
end;

-- thiết công kê đối thoại 
local tbTieGongJi = Npc:GetClass("tiegongji_dialog");
-- cần vật phẩm 
tbTieGongJi.tbNeedItemList 	= { {20, 1, 626, 1, 20}, };
-- thiết công kê đích hành tẩu tuyến đường 
tbTieGongJi.tbTrack			= { 
	{1870, 2694}, {1881, 2693}, {1890, 2681}, 
	{1900, 2675}, {1889, 2650}, {1871, 2650}, 
	{1866, 2638}, {1874, 2619}, {1882, 2606} 
};

tbTieGongJi.tbText = {"a  ! trời ạ  ! trời ạ  ! đây là ai  ?","là ai đái lai như thế thật đáng giận !"};

function tbTieGongJi:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	if (tbInstancing.nTieGongJiOut == 1) then
		return;
	end;
	
	Dialog:Say("Cần<color=red> 20 Đuôi Bọ Cạp<color> để giải cứu Thiết Trảo Kim Kê",
		{
			{"Nộp 20 Đuôi Bọ Cạp", self.Give, self, tbInstancing, me.nId, him.dwId},
			{"Kết thúc đối thoại!"}
		});
end;

function tbTieGongJi:Give(tbInstancing, nPlayerId, nNpcId)
	Task:OnGift("Đặt vào 20 Đuôi Bọ Cạp 。", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId, nNpcId}, nil, {self.CheckRepeat, self, tbInstancing}, true);
end;

function tbTieGongJi:CheckRepeat(tbInstancing)
	if (tbInstancing.nTieGongJiOut == 1) then
		return 0;
	end	
	return 1; 
end

function tbTieGongJi:Pass(tbInstancing, nPlayerId, nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return;
	end;
	local nSubWorld, nPosX, nPosY	= him.GetWorldPos();
	pNpc.Delete();
	
	if (tbInstancing.nTieGongJiLaoOut == 1) then
		return;
	end;
	local pFightNpc = KNpc.Add2(4170, 100, -1, nSubWorld, nPosX, nPosY);
	tbInstancing.nTieGongJiOut = 1;
	tbInstancing.dwFightGongJiId = pFightNpc.dwId;
	
	tbInstancing:Escort(pFightNpc.dwId, nPlayerId, self.tbTrack, 50, 1);
	pFightNpc.GetTempTable("Npc").tbOnArrive = {self.OnArrive, self, pFightNpc.dwId, me.nId};
	
	tbInstancing.bLXSCastSkill = false;
	
	if (tbInstancing.nLingXieShiId) then
		local pNpc = KNpc.GetById(tbInstancing.nLingXieShiId);
		if (not pNpc) then
			return;
		end;
		-- pNpc.RemoveSkillState(999);
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg("Ác ác ác ！！！", pFightNpc.szName);
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"Bảo vệ Thiết Trảo Kim Kê đến Linh Hạt Sứ");
	end;
end;

function tbTieGongJi:OnArrive(dwNpcId, nPlayerId)

	assert(dwNpcId and nPlayerId);
	local pNpc = KNpc.GetById(dwNpcId);
	if not pNpc then --hơn nữa bảo hộ zounan
		return;
	end
	local nSubWorld,_,_	= pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);

	local tbNpc = Npc:GetClass("lingxieshi");
	tbInstancing:NpcSay(tbInstancing.nLingXieShiId, self.tbText);
end;

-- linh hiết sử 
local tbLingXieShi = Npc:GetClass("lingxieshi");

tbLingXieShi.tbText = {
	[99] ="này nhất quan nhưng một vậy hảo quá ！",
	[50] = {"mau đưa nó mang đi ，khoái điểm mang đi ！","ta van cầu các ngươi lạp ！khoái mang đi nó ！"},
	[30] ="đáng giận đích tên ，ta không tha quá các ngươi ！",
	[10] ="xem ta cổ Ảnh Phân Thân đại pháp ！",
	[0] ="các ngươi không chết tử tế được ！",
}
-- độc hiết ID
tbLingXieShi.tbDuWeiXieId = 4128;
-- độc hiết vị trí 
tbLingXieShi.tbPos = {
	{1880, 2601}, {1883, 2601}, {1885, 2602}, {1886, 2604},
	{1886, 2607}, {1884, 2609}, {1881, 2609}, {1879, 2605},
}

tbLingXieShi.tbDropItem = {"setting\\npc\\droprate\\droprate010_shouling.txt", 6};

function tbLingXieShi:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nJinZhiLingXieFeng) then
		local pNpc_x = KNpc.GetById(tbInstancing.nJinZhiLingXieFeng);
		if (pNpc_x) then
			pNpc_x.Delete();
		end;
	end;
	
	
	
	tbInstancing.nLingXieFengPass = 1;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	
	-- rơi xuống 
	local nId = 0;
	if (pNpc and pNpc.GetPlayer()) then
		nId = pNpc.GetPlayer().nId;
	else
		nId = tbPlayList[1].nId;
	end;
	him.DropRateItem(self.tbDropItem[1], self.tbDropItem[2], -1, -1, nId);
	
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"Đường tới Thiên Tuyệt Phong đã mở ! Khá lắm hãy nhớ, Kim Mộc Thổ Thủy Hỏa");
	end;
end;

function tbLingXieShi:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (nLifePercent == 50) then
		tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent]);
		him.GetTempTable("Task").tbSayOver = nil;
		return;
	end;
	
	him.SendChat(self.tbText[nLifePercent]);
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbText[nLifePercent], him.szName);
	end;	
	
	if (nLifePercent == 10) then
		-- độc hiết con trùng con 
		for i = 1, 8 do
			local pNpc = KNpc.Add2(self.tbDuWeiXieId, 100, -1, nSubWorld, self.tbPos[i][1], self.tbPos[i][2]);
			assert(pNpc);
			pNpc.GetTempTable("Task").nLingXieFengLifePresent = him.nCurLife;
		end;
		-- bỏ đi công kê 
		if (tbInstancing.dwFightGongJiId) then
			local pGongJi = KNpc.GetById(tbInstancing.dwFightGongJiId);
			if (pGongJi) then
				pGongJi.Delete();
				tbInstancing.dwFightGongJiId = nil;
			end;
		end;
		-- bỏ đi linh hiết sử 
		him.Delete();
	end;
end;

-- độc đuôi hiết 
local tbDuWeiXie = Npc:GetClass("duweixie");

function tbDuWeiXie:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	--assert(tbInstancing); đổi thành bảo hộ zounan
	if not tbInstancing then
		Dbg:WriteLog("quân doanh","độc đuôi hiết tử vong thì vô phó bản",nSubWorld);
		return;
	end
			
	local tbNpcData = him.GetTempTable("Task");
	if (not tbNpcData or not tbNpcData.nLingXieFengLifePresent) then
		return; -- 
	end;
	
	tbInstancing.nDuWeiXieCount = tbInstancing.nDuWeiXieCount + 1;
	if (tbInstancing.nDuWeiXieCount> 8) then
		return;
	end;
	
	if (tbInstancing.nDuWeiXieCount == 8) then
		local pNpc = KNpc.Add2(4136, tbInstancing.nNpcLevel, -1, tbInstancing.nMapId, 1883, 2605);
		assert(pNpc);
		
		local nReduct = pNpc.nMaxLife - tbNpcData.nLingXieFengLifePresent;
		pNpc.ReduceLife(nReduct);
	end;
end;

-- linh hiết ngọn núi chỉ dẫn 
local tbLingXieFengZhiYin = Npc:GetClass("lingxiefengzhiyin");

tbLingXieFengZhiYin.szText = "Tiêu diệt <color=red>Độc Vĩ Hạt<color> để thu thập Đuôi Bọ Cạp<enter><enter>Mang <color=red>20<color=green>Đuôi Bọ Cạp<color><enter> đến <color=yellow>Thiết Trảo Kim Kê<color> để giải cứu.";

function tbLingXieFengZhiYin:OnDialog()
	local tbOpt = {{"Cám ơn, ta đã hiểu"}, };
	Dialog:Say(self.szText, tbOpt);
end;
