
Require("\\script\\task\\armycamp\\campinstancing\\instancingmanager.lua");

local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancingBase(1); -- 1vì thế FBđích Id

tbInstancing.szName ="Hậu Phục Ngưu Sơn";
tbInstancing.szDesc ="Phó Bản Hậu Phục Ngưu Sơn";

-- tùy ki Npc，12tuyển 3
tbInstancing.tbRandNpc = 
{
	{nTemplateId = 4062, nPosX = 1600, nPosY = 3648},
	{nTemplateId = 4063, nPosX = 1607, nPosY = 3638},
	{nTemplateId = 4064, nPosX = 1611, nPosY = 3633},
	{nTemplateId = 4065, nPosX = 1615, nPosY = 3627},
	{nTemplateId = 4066, nPosX = 1624, nPosY = 3674},
	{nTemplateId = 4067, nPosX = 1639, nPosY = 3660},
	{nTemplateId = 4068, nPosX = 1658, nPosY = 3647},
	{nTemplateId = 4069, nPosX = 1654, nPosY = 3643},
	{nTemplateId = 4070, nPosX = 1650, nPosY = 3638},
	{nTemplateId = 4071, nPosX = 1648, nPosY = 3628},
	{nTemplateId = 4072, nPosX = 1675, nPosY = 3557},
	{nTemplateId = 4073, nPosX = 1681, nPosY = 3564},
}

tbInstancing.tbRandPos = 
{
	{1655, 3640},
	{1658, 3645},
	{1649, 3631},
}

tbInstancing.tbExtRandNpc = 
{
	{
		{4078, 1918, 2988}, {4079, 1920, 2990}, {4080,1922,2992},
	},
	{
		{4086, 1891, 3175}, {4087, 1879, 3171}, {4088,1918,3106},
	},
	{
		{4081, 1825, 3944}, {4082, 1827, 3946}, {4083,1829,3948},
	},
}
-- khai khải FBđích thì hậu điều dùng ，dùng sinh một ít mới bắt đầu hóa 
function tbInstancing:OnOpen()
	-- khai khải FBkế thì khí 
	self.nNoPlayerDuration = 0;
	self.nBreathTimerId = Timer:Register(Env.GAME_FPS, self.OnBreath, self);
	self.nCloseTimerId 	= Timer:Register(self.tbSetting.nInstancingExistTime*Env.GAME_FPS, self.OnClose, self);
	
	self.tbPlayerList = {}; -- lúc này Playerliệt biểu 
	self.tbEnteredPlayerList = {}; -- từng tiến quá đích Playerliệt biểu 
	
	-- tùy ki tăng thêm 3cá nhiệm vụ Npc
	Lib:SmashTable(self.tbRandNpc);
	for i = 1, 3 do
		KNpc.Add2(self.tbRandNpc[i].nTemplateId, 1, -1, self.nMapId, self.tbRandPos[i][1], self.tbRandPos[i][2]);
	end
	
	-- tùy ki tăng thêm 3cá mở rộng khu vực nhiệm vụ Npc
	local tbRandom = {};
	table.insert(tbRandom, MathRandom(3));
	table.insert(tbRandom, MathRandom(3));
	table.insert(tbRandom, MathRandom(3));
	for i = 1, #self.tbExtRandNpc do
		local tbNpc = self.tbExtRandNpc[i][tbRandom[i]];
		KNpc.Add2(tbNpc[1], 1, -1, self.nMapId, tbNpc[2], tbNpc[3]);
	end

	-- đốn củi khu 
	self.nFaMuQuTrapOpen = 0;	
	
	
	-- thải quáng khu 
	-- tăng thêm 6ki quan 
	local pControl1 = KNpc.Add2(4019, 1, -1, self.nMapId, 1940, 3305);
	local pControl2 = KNpc.Add2(4019, 1, -1, self.nMapId, 1925, 3289);
	local pControl3 = KNpc.Add2(4019, 1, -1, self.nMapId, 2006, 3348);
	local pControl4 = KNpc.Add2(4019, 1, -1, self.nMapId, 2000, 3328);
	local pControl5 = KNpc.Add2(4019, 1, -1, self.nMapId, 1971, 3421);
	local pControl6 = KNpc.Add2(4019, 1, -1, self.nMapId, 1968, 3452);

	-- tăng thêm 6sách lan 
	local pBarrier1 = KNpc.Add2(4015, 1, -1, self.nMapId, 1939, 3299);
	local pBarrier2 = KNpc.Add2(4015, 1, -1, self.nMapId, 1929, 3289);
	local pBarrier3 = KNpc.Add2(4015, 1, -1, self.nMapId, 2010, 3346);
	local pBarrier4 = KNpc.Add2(4015, 1, -1, self.nMapId, 2004, 3329);
	local pBarrier5 = KNpc.Add2(4015, 1, -1, self.nMapId, 1968, 3439);
	local pBarrier6 = KNpc.Add2(4016, 1, -1, self.nMapId, 1959, 3453);
	
	-- Phục Ngưu Sơn Trang cựu chỉ bách trảm cát 
	local pNpc = KNpc.Add2(4117, self.nNpcLevel, -1, self.nMapId, 1615, 3334);
	assert(pNpc);
	self.BAIZHANJI_IS_OUT = 0;
	
	-- phán đoán Trapcó được hay không thông qua đích tiêu chí 
	self.tbBarrierPairs = 
	{
		{pControl1.dwId, pBarrier2.dwId, 0},
		{pControl2.dwId, pBarrier1.dwId, 0},
		{pControl3.dwId, pBarrier4.dwId, 0},
		{pControl4.dwId, pBarrier3.dwId, 0},
		{pControl5.dwId, pBarrier6.dwId, 0},
		{pControl6.dwId, pBarrier5.dwId, 0},
	}
	
	-- cà tài liệu mới 
	local tbMineA = Npc:GetClass("funiushan_caikuangqu_masheng");
	tbMineA:Grow(self.nMapId);
	
	local tbMineB = Npc:GetClass("funiushan_caikuangqu_mubang");
	tbMineB:Grow(self.nMapId);
	
	self.nCaiKuangQuPass = 0;
	
	
	-- thải thạch khu 
	self.nCaiShiQuColItem = 0;
	self.nCaiShiQuPass = 0;
	
	
	-- man chướng sơn 
	self.nManZhangShanPass = 0;
	
	-- Trâu lan trại 
	self.nNiuLanZhaiPass = 0;
	local pNiuLanZhaiLaoMen = KNpc.Add2(4015, 1, -1, self.nMapId, 1871, 3183); -- tù môn 
	self.nNiuLanZhaiLaoMenId = pNiuLanZhaiLaoMen.dwId;
	
	local pNpc = KNpc.Add2(4004, self.nNpcLevel, -1, self.nMapId, 1908, 3437); -- động thái gia tái giam công đầu lĩnh 
	assert(pNpc);

	local pNpc = KNpc.Add2(4006, self.nNpcLevel, -1, self.nMapId, 1845, 3269); -- động thái gia tái Lâu la đầu mục 
	assert(pNpc);
	
	-- ngạc thần điện 
	self.nEShenDianPass = 0;
end


function tbInstancing:OnBreath()
	if (self.nPlayerCount == 0) then
		self.nNoPlayerDuration = self.nNoPlayerDuration + 1;
	elseif (nNoPlayerDuration ~= 0) then
		self.nNoPlayerDuration = 0;
	end
	
	if (self.nNoPlayerDuration>= self.tbSetting.nNoPlayerDuration) then
		self:OnClose();
		return 0;
	end
	
	if (not self.nCurSec) then
		self.nCurSec = 1;
	else
		self.nCurSec = self.nCurSec + 1;
	end
	
	if (self.nCurSec % 600 == 0) then
		Task.tbArmyCampInstancingManager:Tip2MapPlayer(self.nMapId,"lúc này cự ly"..self.tbSetting.szName.."quan bế còn có"..math.floor((self.tbSetting.nInstancingExistTime-self.nCurSec)/60).."phút");
	end
end

-- FBquan bế thì điều dùng 
function tbInstancing:OnClose()
	for nPlayerId, tbPlayerData in pairs(self.tbPlayerList) do
		self:KickPlayer(nPlayerId, 1,"phó bản thời gian kết thúc ，ngươi bị truyện ra phó bản 【Phục Ngưu Sơn hậu sơn 】");
	end
	
	Task.tbArmyCampInstancingManager:CloseMap(self.nMapId);
	Timer:Close(self.nBreathTimerId);
	Timer:Close(self.nCloseTimerId);

	if (self.nBzhjTimerId and self.nBzhjTimerId> 0) then
		Timer:Close(self.nBzhjTimerId);
		self.nBzhjTimerId = nil;
	end

	return 0;
end


-- đương một ngoạn gia thân thỉnh tiến nhập 
function tbInstancing:OnPlayerAskEnter(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (self.nPlayerCount>= self.tbSetting.nMaxPlayer) then
		Dialog:SendInfoBoardMsg(pPlayer,"phó bản nhân số dĩ mãn ，ngươi tạm thì không cách nào tiến nhập 。");
		return;
	end
	
	pPlayer.NewWorld(self.nMapId, unpack(self.tbSetting.tbRevivePos));
	pPlayer.SetFightState(0);
	self:OnPlayerEnter(pPlayer.nId);
end

-- đương một ngoạn gia tiến nhập hậu 
function tbInstancing:OnPlayerEnter(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	self.nPlayerCount = self.nPlayerCount + 1;
	assert(self.nPlayerCount <= self.tbSetting.nMaxPlayer);
	-- lần đầu tiên tiến nhập lúc này phó bản 
	if (not self.tbEnteredPlayerList[nPlayerId]) then
		local nTimes = pPlayer.GetTask(self.tbSetting.nInstancingEnterLimit_D.nTaskGroup, self.tbSetting.nInstancingEnterLimit_D.nTaskId);
		pPlayer.SetTask(self.tbSetting.nInstancingEnterLimit_D.nTaskGroup, self.tbSetting.nInstancingEnterLimit_D.nTaskId, nTimes + 1, 1);
		self.tbEnteredPlayerList[nPlayerId] = 1;
		self:ResetPlayerAttr(nPlayerId);
		
		-- ký lục ngoạn gia tham gia quân doanh phó bản đích thứ sổ 
		Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_ARMYCAMP, 1);
	end
	
	self.tbPlayerList[nPlayerId] = {};
	
	-- đối thử ngoạn gia chú sách một việc món 
	Setting:SetGlobalObj(pPlayer, him, it);
	local nDeathEventId = PlayerEvent:Register("OnDeath", self.OnPlayerDeath, self);
	self.tbPlayerList[nPlayerId].nDeathEventId = nDeathEventId;
	local nLogoutEventId = PlayerEvent:Register("OnLogout", self.OnPlayerLogout, self);
	self.tbPlayerList[nPlayerId].nLogoutEventId = nLogoutEventId;
	local nLeaveMapEventId = PlayerEvent:Register("OnLeaveMap", self.OnPlayerLeaveMap, self);
	self.tbPlayerList[nPlayerId].nLeaveMapEventId = nLeaveMapEventId;
	Setting:RestoreGlobalObj();
	local nRevMapId, nRevPointId = pPlayer.GetRevivePos();
	self.tbPlayerList[nPlayerId].tbOldRev = {nRevMapId, nRevPointId};
	pPlayer.SetTmpDeathPos(self.nMapId, unpack(self.tbSetting.tbRevivePos));
	pPlayer.SetLogoutRV(1);
	Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"ngươi tiến vào do"..self.szOpenerName.."ở"..self.szRegisterMapName.."khai khải đích"..self.tbSetting.szName, 20);
	-- kế thì mặt bản 
	if (not self.nCurSec) then -- ở báo danh đích một giây chung trong vòng tiến nhập phó bản ，self.nCurSechoàn một trải qua OnBreathsanh thành ，vi nil tắc ở đây sanh thành 
		self.nCurSec = 0;
	end;
	Dialog:SetTimerPanel(pPlayer,"<color=Gold>quân doanh phó bản ：<color>\n<color=White>cự phó bản quan bế còn có ：<color>", (self.tbSetting.nInstancingExistTime-self.nCurSec));

	Task.tbArmyCampInstancingManager.StatLog:WriteLog(1, 1, pPlayer);
	
	--Task.tbArmyCampInstancingManager:OpenArmyCampUi(pPlayer.nId, self.nCloseTimerId);
end

-- đá ra một ngoạn gia 
function tbInstancing:KickPlayer(nPlayerId, bPassive, szDesc)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	if (not self.tbPlayerList[nPlayerId]) then
		return;
	end
	
	Dialog:CloseTimerPanel(pPlayer);
	
	self.nPlayerCount = self.nPlayerCount -1;
	assert(self.nPlayerCount>= 0);
	assert(self.tbPlayerList[nPlayerId] and self.tbPlayerList[nPlayerId].nDeathEventId and self.tbPlayerList[nPlayerId].nLogoutEventId and self.tbPlayerList[nPlayerId].nLeaveMapEventId);
	Setting:SetGlobalObj(pPlayer, him, it);
	PlayerEvent:UnRegister("OnDeath", self.tbPlayerList[nPlayerId].nDeathEventId);
	PlayerEvent:UnRegister("OnLogout", self.tbPlayerList[nPlayerId].nLogoutEventId);
	PlayerEvent:UnRegister("OnLeaveMap", self.tbPlayerList[nPlayerId].nLeaveMapEventId);
	Setting:RestoreGlobalObj();
	pPlayer.SetRevivePos(unpack(self.tbPlayerList[nPlayerId].tbOldRev));
	self.tbPlayerList[nPlayerId] = nil;
	if (pPlayer.IsDead() == 1) then
		pPlayer.ReviveImmediately(0);
	end
	
	-- bỏ đi chỉ định đạo cụ 
	self:RemoveTaskItem(pPlayer, {20, 1, 603, 1, 0, 0});
	self:RemoveTaskItem(pPlayer, {20, 1, 604, 1, 0, 0});
	self:RemoveTaskItem(pPlayer, {20, 1, 605, 1, 0, 0});
	-- bỏ đi ngoạn gia trên người kê máu 
	self:RemoveTaskItem(pPlayer, {20, 1, 620, 1, 0, 0});
	
	--Task.tbArmyCampInstancingManager:CloseArmyCampUi(pPlayer.nId);
	if (bPassive) then
		local nMapId, nReviveId, nMapX, nMapY = pPlayer.GetLoginRevivePos();
		pPlayer.NewWorld(nMapId, nMapX/32, nMapY / 32);
	end
	
	pPlayer.SetLogoutRV(0);
	
	if (szDesc) then
		Task.tbArmyCampInstancingManager:Warring(pPlayer, szDesc);
	end
end

function tbInstancing:RemoveTaskItem(pPlayer, tbItemId)	
	local nDelCount = Task:GetItemCount(me, tbItemId);
	
	Task:DelItem(me, tbItemId, nDelCount);
end

-- đương ngoạn gia hạ tuyến thì hậu điều dùng 
function tbInstancing:OnPlayerLogout()
	self:KickPlayer(me.nId, 1);
end

-- ngoạn gia tử vong hậu điều dùng 
function tbInstancing:OnPlayerDeath()
	me.ReviveImmediately(0);
	me.SetFightState(0);
end

-- ngoạn gia rời khỏi địa đồ thì điều dùng 
function tbInstancing:OnPlayerLeaveMap()
	self:KickPlayer(me.nId);
end

-- nặng đưa ngoạn gia FBtương quan đích đặc tính 
function tbInstancing:ResetPlayerAttr(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	pPlayer.SetTask(1022, 136, 0, 1);
	pPlayer.SetTask(1024, 53, 0, 1);
	pPlayer.SetTask(1024, 56, 0, 1);
end
