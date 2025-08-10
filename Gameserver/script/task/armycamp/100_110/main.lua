-----------------------------------------------------------
-- văn kiện danh 　：main.lua
-- văn kiện miêu tả ：quân doanh phó bản -bách man sơn 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-12-01 15:48:25
-----------------------------------------------------------

Require("\\script\\task\\armycamp\\campinstancing\\instancingmanager.lua");

local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancingBase(2); -- 2vì thế FBđích Id

tbInstancing.szName ="Bách Mạn Sơn";
tbInstancing.szDesc ="Phó Bản Bách Mạn Sơn";

-- Sơn Dân thuyết nếu 
tbInstancing.tbShanMinText = {
	{"Các hạ đã phá Đào Hoa Chướng",""},
	{"Đội ngũ đã thông qua ！","Hãy thám thính ngọn núi phía trước"},
	{"Đội ngũ đã thông qua ！","Hãy thám thính ngọn núi phía trước"},
	{"Đội ngũ đã thông qua ！","Hãy thám thính ngọn núi phía trước"},
	{"Đội ngũ đã thông qua ！","Hãy thám thính ngọn núi phía trước"},
	{"Dĩ nhiên , đội ngũ đã thông qua"},
	{"HAHA Ta chỉ là một khách vãng lai"},
}

-- Đào Hoa Chướng chướng khí vị trí 
tbInstancing.tbZhangQiPos = {
	{1653, 3051},
	{1707, 3029},
	{1707, 3029},
}

-- cổ vương hộ pháp vị trí 
tbInstancing.tbGuWangHuFaPos 	= {{1842, 2767}, {1883, 2862}, {1842, 2940}, {1761, 2900}, {1763, 2812}};
-- tâm đăng vị trí  truyện tống 
tbInstancing.tbXinDengInPos		= {{1822, 2818}, {1845, 2860}, {1824, 2882}, {1794, 2863}, {1798, 2837}, };
-- tâm đăng vị trí  ra 
tbInstancing.tbXinDengOutPos 	= {{1839, 2789}, {1866, 2869}, {1838, 2920}, {1777, 2891}, {1776, 2824}, };

-- khai khải FBđích thì hậu điều dùng 
function tbInstancing:OnOpen()
	-- khai khải FBkế thì khí 
	self.nNoPlayerDuration = 0; 
	self.nBreathTimerId = Timer:Register(Env.GAME_FPS, self.OnBreath, self);
	self.nCloseTimerId 	= Timer:Register(self.tbSetting.nInstancingExistTime*Env.GAME_FPS, self.OnClose, self);
	
	self.tbPlayerList = {}; -- lúc này Playerliệt biểu 
	self.tbEnteredPlayerList = {}; -- từng tiến quá đích Playerliệt biểu 
	
	-- dùng sinh NPCnói chuyện kế sổ 
	self.nCount	= nil;
	
	-- Lưu Nhất Bán xuất hiện đích thứ sổ 
	self.nLiuYiBanOutCount = 0;
	
	-- Đào Hoa Chướng 
	local pNpc = KNpc.Add2(4163, 110, -1, self.nMapId, 1709, 3122);
	self.nTaoHuaLinZhiYin = pNpc.dwId; -- Chỉ dẫn Đào Hoa Lâm 
	-- Đào Hoa Chướng Cấm Chế 
	local pNpc = KNpc.Add2(4135, 110, -1, self.nMapId, 1655, 3023);
	self.nJinZhiTaoHuaLin = pNpc.dwId
	
	-- Sơn Dân 
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1656, 3029);
	self.nTaoHuaZhengShanMin1 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1661, 3023);
	self.nTaoHuaZhengShanMin2 = pNpc.dwId;
	
	-- Đào Hoa Chướng chướng khí 
	self.tbZhangQiId = {};
	local pNpc = KNpc.Add2(4141, 150, -1, self.nMapId, self.tbZhangQiPos[1][1], self.tbZhangQiPos[1][2]);
	self.tbZhangQiId[1] = pNpc.dwId;
	local pNpc = KNpc.Add2(4141, 150, -1, self.nMapId, self.tbZhangQiPos[2][1], self.tbZhangQiPos[2][2]);
	self.tbZhangQiId[2] = pNpc.dwId;
	local pNpc = KNpc.Add2(4141, 150, -1, self.nMapId, self.tbZhangQiPos[3][1], self.tbZhangQiPos[3][2]);
	self.tbZhangQiId[3] = pNpc.dwId;
	
	self.nTaoHuaZhangPass 	= 0; -- Đào Hoa Chướng có được hay không thông qua 
	
	-- Đào Hoa Sứ 
	KNpc.Add2(4124, self.nNpcLevel, -1, self.nMapId, 1671, 2910);	-- đối thoại Đào Hoa Sứ 
	
	local pNpc = KNpc.Add2(4135, 110, -1, self.nMapId, 1686, 2944); -- Cấm Chế 
	self.nJinZhiTaoHuaShi = pNpc.dwId;
	
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1676, 2931);
	self.nTaoHuaShiShanMin1 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1681, 2926);
	self.nTaoHuaShiShanMin2 = pNpc.dwId;
	
	local nProb = MathRandom(100); -- 10%đích xác suất xuất hiện Lưu Nhất Bán 

	if (nProb <50) then 
		local pNpc = KNpc.Add2(4155, self.nNpcLevel, -1, self.nMapId, 1667, 2907); -- Lưu Nhất Bán 
		-- pNpc.AddLifePObserver(99);
		-- pNpc.AddLifePObserver(80);
		self.nLiuYiBanOutCount = 1;
	end;

	self.nTaoHuaShiOut		= 0; 						-- Đào Hoa Sứ có hay không đã xuất hiện 
	self.nTaoHuaShiPass 	= 0; 						-- Đào Hoa Sứ xử có được hay không thông qua 
	
	-- bích ngô ngọn núi 
	local pNpc = KNpc.Add2(4125, 150, -1, self.nMapId, 1781, 3073, 1); -- cổ ông 
	
	pNpc.AddLifePObserver(99);
	pNpc.AddLifePObserver(80);
	pNpc.AddLifePObserver(30);
	pNpc.AddLifePObserver(10);
	
	for i = 1, 14 do 
		pNpc.AddLifePObserver(i * 7);
	end;
	
	
	local pNpc = KNpc.Add2(4135, 110, -1, self.nMapId, 1828, 3044); -- bích ngô ngọn núi Cấm Chế 
	self.nJinZhiBiWuFeng = pNpc.dwId;
	
	-- Sơn Dân 
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1825, 3043);
	self.nBiWuFengShanMin1 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1829, 3047);
	self.nBiWuFengShanMin2 = pNpc.dwId;
	
	local pNpc = KNpc.Add2(4164, 110, -1, self.nMapId, 1720, 2977); --Chỉ dẫn Bích Ngô Phong 
	self.nBiWuFengZhiYin = pNpc.dwId;

	self.nDuXieYouChong		= 0; -- giết chết độc hiết con trùng con đích cá sổ 	
	self.nXieWangOut		= 0; -- Bích Ngô Sứ có hay không xuất hiện 
	self.nBiWuFengPass		= 0; -- bích ngô ngọn núi có được hay không thông qua 	
	
	-- thần chu ngọn núi 
	local pNpc = KNpc.Add2(4165, 110, -1, self.nMapId, 1877, 2981); -- Chỉ dẫn Thần Thù Phong 
	self.nShenZhuFengZhiYin = pNpc.dwId;
	-- thần chu ngọn núi Cấm Chế 
	local pNpc = KNpc.Add2(4135, 110, -1, self.nMapId, 1951, 2847);
	self.nJinZhiShenZhuFeng = pNpc.dwId;

	-- Sơn Dân 
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1949, 2852);
	self.nShenZhuFengShanMin1 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1954, 2849);
	self.nShenZhuFengShanMin2 = pNpc.dwId;
	
	self.tbWenZhu			= {}; -- dùng sinh ký lục mỗi lần cà ra độc hiết con trùng con 
	self.nPlayDrumTime 		= 0; -- ký lục khả dĩ gõ trống đích thời gian có hay không đáo 
	self.nPlayDrumCount		= 0; -- gõ trống đích thứ sổ 
	self.nPlayGongCount		= 0; -- xao la đích thứ sổ 
	self.nWenZhu			= 0; -- giết chết độc hiết con trùng con đích cá sổ 	

	self.nShenZhuFengPass 	= 0; -- thần chu ngọn núi có được hay không thông qua 
	
	-- linh hiết ngọn núi 
	KNpc.Add2(4134, self.nNpcLevel, -1, self.nMapId, 1865, 2692); 	-- thiết công kê 
	local pNpc = KNpc.Add2(4136, self.nNpcLevel, -1, self.nMapId, 1883, 2605);		-- linh hiết sử 
	self.nLingXieShiId = pNpc.dwId;
	self.bLXSCastSkill = true; -- ký lục linh hiết sử có hay không tiếp theo thích phóng kỹ năng 
	
	pNpc.AddLifePObserver(99);
	pNpc.AddLifePObserver(50);
	pNpc.AddLifePObserver(30);
	pNpc.AddLifePObserver(10);
	-- linh hiết ngọn núi Cấm Chế 
	local pNpc = KNpc.Add2(4135, 110, -1, self.nMapId, 1826, 2685);
	self.nJinZhiLingXieFeng = pNpc.dwId;
	
	-- Sơn Dân 
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1831, 2684);
	self.nLingXieFengShanMin1 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1825, 2678);
	self.nLingXieFengShanMin2 = pNpc.dwId;	

	if (self.nLiuYiBanOutCount ~= 0) then 
		local pNpc = KNpc.Add2(4155, self.nNpcLevel, -1, self.nMapId, 1886, 2608);
		-- pNpc.AddLifePObserver(20);
	end;
	
	local pNpc = KNpc.Add2(4166, 110, -1, self.nMapId, 1939, 2715); -- linh hiết ngọn núi chỉ dẫn 
	self.nLingXieFengZhiYin = pNpc.dwId;
	
	self.nLaoMenDurationTime 		= 0; 	-- cứ lần sau khả dĩ khai tù môn đích thời gian 
	self.nLingXieFengPass			= 0; 	-- bích ngô ngọn núi có được hay không thông qua 
	self.nTieGongJiLaoMen			= 0; 	-- thiết công kê tù môn có hay không mở 
	self.nTieGongJiOut				= 0;	-- chiến đấu thiết công kê có hay không xuất hiện 
	self.nDuWeiXieCount				= 0;	-- giết chết độc đuôi hiết đích cá sổ 
	-- thiên tuyệt ngọn núi 
	
	local pNpc = KNpc.Add2(4167, 110, -1, self.nMapId, 1772, 2742); -- thiên tuyệt ngọn núi chỉ dẫn 
	self.nTianJueGongZhiYin = pNpc.dwId;

	-- Sơn Dân 
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1646, 2955);
	self.nTianJueGongShanMin1 = pNpc.dwId;

	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1810, 2828);
	self.nTianJueGongShanMin2 = pNpc.dwId;
	local pNpc = KNpc.Add2(4154, 110, -1, self.nMapId, 1807, 2833);
	self.nTianJueGongShanMin3 = pNpc.dwId;
	
	-- cổ vương hộ pháp 
	for i = 1, #self.tbGuWangHuFaPos do
		local pNpc = KNpc.Add2(4142, 110, -1, self.nMapId, self.tbGuWangHuFaPos[i][1], self.tbGuWangHuFaPos[i][2]);
		pNpc.GetTempTable("Task").nId = i;
		pNpc.AddLifePObserver(99);
	end;

	-- tâm đăng truyện tống 
	for i = 1, #self.tbXinDengInPos do
		local pNpc6 = KNpc.Add2(4137, 110, -1, self.nMapId, self.tbXinDengInPos[i][1], self.tbXinDengInPos[i][2]);
		pNpc6.GetTempTable("Task").nId = i;
	end;
	-- tâm đăng ra 
	for i = 1, #self.tbXinDengOutPos do
		local pNpc6 = KNpc.Add2(4138, 110, -1, self.nMapId, self.tbXinDengOutPos[i][1], self.tbXinDengOutPos[i][2]);
		pNpc6.GetTempTable("Task").nId = i;
	end;
	
	-- trường sinh đăng xuất hiện đích thuận tự 
	self.tbChangShengDeng = {1, 2, 3, 4, 5,};
	Lib:SmashTable(self.tbChangShengDeng);	-- trường sinh đăng đích thuận tự 	
	
	self.nGuWangLife99				= 0; -- ký lục bắt đầu đích thì hậu thoại có hay không đã nói 
	self.nGuWangChange75			= 0; -- cổ vương chuyển biến thành khác NPC 75%
	self.nGuWangChange50			= 0; -- cổ vương chuyển biến thành khác NPC 50%	
	self.nGuShenOut					= 0; -- cổ thần có hay không xuất hiện 
	self.nChangShengDengCount		= 0; -- trường sinh đăng đã xuất hiện đích cá sổ 
	self.nOpenChangShengDeng		= 0; -- đã khai khải đích cá sổ 
	
	-- quên ưu cốc 
	KNpc.Add2(4144, self.nNpcLevel, -1, self.nMapId, 1841, 2990);
	self.nHuoPengChenOut			= 0; -- Hỏa Bồng xuân có hay không xuất hiện 
	
	-- phong tuyết hồng phi 
	local pNpc = KNpc.Add2(4148, self.nNpcLevel, -1, self.nMapId, 1894, 2924, 1);
	pNpc.AddLifePObserver(99);
	pNpc.AddLifePObserver(90);
	pNpc.AddLifePObserver(70);
	pNpc.AddLifePObserver(50);
	pNpc.AddLifePObserver(30);
	
	local pNpc = KNpc.Add2(4146, self.nNpcLevel, -1, self.nMapId, 1910, 2838, 1); -- Hỏa Nhãn Nghê 
	
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
		Task.tbArmyCampInstancingManager:Tip2MapPlayer(self.nMapId,"Lúc này"..self.tbSetting.szName.." phó bản quân doanh còn "..math.floor((self.tbSetting.nInstancingExistTime-self.nCurSec)/60).."phút");
	end
	-- chỉ dẫn người của mỗi 10miểu thuyết một lần thoại 
	if ((self.nCurSec - 1) % 5 == 0) then
		self:NpcTimerSay(self.nTaoHuaLinZhiYin,"Con đường phía trước rất nguy hiểm");
		self:NpcTimerSay(self.nBiWuFengZhiYin,"Đại hiệp xin dừng chân !");
		self:NpcTimerSay(self.nShenZhuFengZhiYin,"Phía trước có địch nhân mai phục");
		self:NpcTimerSay(self.nLingXieFengZhiYin,"Thỉnh tạm hoãn");
		self:NpcTimerSay(self.nTianJueGongZhiYin,"Con đường phía trước thật nguy hiểm");
	end;
	
	-- sơn danh nói chuyện mỗi 5miểu một lần 
	if (self.nCurSec % 5 == 0) then
		-- Đào Hoa Chướng Sơn Dân 
		self:NpcTimerSayWithCondition(self.nTaoHuaZhengShanMin1, self.nTaoHuaZhangPass, self.tbShanMinText[1][1], self.tbShanMinText[1][2]);
		self:NpcTimerSayWithCondition(self.nTaoHuaZhengShanMin2, self.nTaoHuaZhangPass, self.tbShanMinText[1][1], self.tbShanMinText[1][2]);
		-- Đào Hoa Sứ Sơn Dân 
		self:NpcTimerSayWithCondition(self.nTaoHuaShiShanMin1, self.nTaoHuaShiPass, self.tbShanMinText[2][1], self.tbShanMinText[2][2]);
		self:NpcTimerSayWithCondition(self.nTaoHuaShiShanMin2, self.nTaoHuaShiPass, self.tbShanMinText[2][1], self.tbShanMinText[2][2]);
		-- bích ngô ngọn núi Sơn Dân 
		self:NpcTimerSayWithCondition(self.nBiWuFengShanMin1, self.nBiWuFengPass, self.tbShanMinText[3][1], self.tbShanMinText[3][2]);
		self:NpcTimerSayWithCondition(self.nBiWuFengShanMin2, self.nBiWuFengPass, self.tbShanMinText[3][1], self.tbShanMinText[3][2]);
		-- thần chu ngọn núi Sơn Dân 
		self:NpcTimerSayWithCondition(self.nShenZhuFengShanMin1, self.nShenZhuFengPass, self.tbShanMinText[4][1], self.tbShanMinText[4][2]);
		self:NpcTimerSayWithCondition(self.nShenZhuFengShanMin2, self.nShenZhuFengPass, self.tbShanMinText[4][1], self.tbShanMinText[4][2]);
		-- linh hiết ngọn núi Sơn Dân 
		self:NpcTimerSayWithCondition(self.nLingXieFengShanMin1, self.nLingXieFengPass, self.tbShanMinText[5][1], self.tbShanMinText[5][2]);
		self:NpcTimerSayWithCondition(self.nLingXieFengShanMin2, self.nLingXieFengPass, self.tbShanMinText[5][1], self.tbShanMinText[5][2]);
		-- thiên tuyệt ngọn núi Sơn Dân 
		self:NpcTimerSay(self.nTianJueGongShanMin1, self.tbShanMinText[6][1]);
		
		self:NpcTimerSay(self.nTianJueGongShanMin2, self.tbShanMinText[7][1]);
		self:NpcTimerSay(self.nTianJueGongShanMin3, self.tbShanMinText[7][1]);

	end;	
	-- tù môn kế thì 
	if (self.nLaoMenDurationTime ~= 0) then
		self.nLaoMenDurationTime = self.nLaoMenDurationTime - 1;
	end;
	-- xao la kế thì 
	if (self.nPlayDrumTime> 0) then
		self.nPlayDrumTime = self.nPlayDrumTime - 1;
	end;
	
	-- linh hiết sử mỗi ba phần chung thích phóng một lần Kim chung tráo 
	if (self.nLingXieShiId and self.bLXSCastSkill and (self.nCurSec - 1) % 300 == 0) then
		local pNpc = KNpc.GetById(self.nLingXieShiId);
		if (not pNpc) then
			return;
		end;
		-- pNpc.CastSkill(999, 10, -1, pNpc.nIndex);
	end;
end

-- NPCnói một lời 
function tbInstancing:NpcTimerSay(nNpcId, szMsg)

	if (nNpcId) then
		local pNpc = KNpc.GetById(nNpcId);
		assert(pNpc);
		
		pNpc.SendChat(szMsg);
	end;
end;

-- NPCán điều kiện nói chuyện 
function tbInstancing:NpcTimerSayWithCondition(nNpcId, nCondition, szMsg1, szMsg2)
	if (nNpcId) then
		local pNpc = KNpc.GetById(nNpcId);
		assert(pNpc);
		if (nCondition == 0) then
			pNpc.SendChat(szMsg1);
		else
			pNpc.SendChat(szMsg2);
		end;
	end;
end;
-- NPCnói chuyện 
function tbInstancing:NpcSay(nNpcId, tbText)
	-- mỗ cá NPCđang ở nói chuyện     -- bất năng đồng thời nói chuyện 
	if (self.nCount) then
		return;
	end;

	if (not nNpcId or not tbText) then
		return;
	end;

	self.nNpcSayTimerId 	= Timer:Register(Env.GAME_FPS * 2, self.OnBreathDialog, self, nNpcId, tbText);
	self.nCount				= 0;
end;

-- 
function tbInstancing:OnBreathDialog(nNpcId, tbText)
	assert(nNpcId and tbText);
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		self.nNpcSayTimerId = nil;
		--Timer:Close(self.nNpcSayTimerId);
		self.nCount = nil;
		return 0;
	end;
	
	self.nCount = self.nCount + 1;
	-- nói xong thoại ，quan bế kế thì khí 	
	if (self.nCount> #tbText) then
		--Timer:Close(self.nNpcSayTimerId);
		self.nCount = nil;
		self.nNpcSayTimerId = nil;
		local tbSayOver = pNpc.GetTempTable("Task").tbSayOver;
		if (tbSayOver) then
			Lib:CallBack(tbSayOver);
			tbSayOver = nil;
		end;
		return 0;
	end;

	pNpc.SendChat(tbText[self.nCount]);

	local tbPlayList, nCount = KPlayer.GetMapPlayer(self.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(tbText[self.nCount], pNpc.szName);
	end;		
end;

-- hộ tống NPC
function tbInstancing:Escort(nNpcId, nPlayerId, tbTrack, nActiveFight, bPassiveFight)
	assert(nNpcId and nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pNpc and pPlayer);
	
	if (not nActiveFight) then
		nActiveFight = 0;
	end;
	if (not bPassiveFight) then
		bPassiveFight = 0;
	end;
	
	pNpc.SetCurCamp(0);
	pNpc.RestoreLife();
	pNpc.AI_ClearPath();
	for _,Pos in ipairs(tbTrack) do
		if (Pos[1] and Pos[2]) then
			pNpc.AI_AddMovePos(tonumber(Pos[1])*32, tonumber(Pos[2])*32)
		end
	end;
	pNpc.SetNpcAI(9, nActiveFight, bPassiveFight, -1, 25, 25, 25, 0, 0, 0, pPlayer.GetNpc().nIndex);	
end; 

-- FBquan bế thì điều dùng 
function tbInstancing:OnClose()
	for nPlayerId, tbPlayerData in pairs(self.tbPlayerList) do
		self:KickPlayer(nPlayerId, 1,"phó bản thời gian kết thúc ，ngài bị truyện ra phó bản 【bách man sơn 】");
	end
	
	Task.tbArmyCampInstancingManager:CloseMap(self.nMapId);
	Timer:Close(self.nBreathTimerId);
	Timer:Close(self.nCloseTimerId);
	
	return 0;
end


-- đương một ngoạn gia thân thỉnh tiến nhập 
function tbInstancing:OnPlayerAskEnter(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (self.nPlayerCount>= self.tbSetting.nMaxPlayer) then
		Dialog:SendInfoBoardMsg(pPlayer,"phó bản nhân số dĩ mãn ，ngài tạm thì không cách nào tiến nhập 。");
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
		pPlayer.SetTask(1024, 61, 0); -- nặng đưa nhiệm vụ biến lượng 
		
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
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer, "Bạn đã theo "..self.szOpenerName.." vào "..self.szRegisterMapName.." "..self.tbSetting.szName .. " ", 20);
	-- kế thì mặt bản 
	if (not self.nCurSec) then -- ở báo danh đích một giây chung trong vòng tiến nhập phó bản ，self.nCurSechoàn một trải qua OnBreathsanh thành ，vi nil tắc ở đây sanh thành 
		self.nCurSec = 0;
	end;
	Dialog:SetTimerPanel(pPlayer, "<color=Gold>Phó bản quân doanh: <color>\n<color=White>Cách giờ đóng cửa còn: <color>", (self.tbSetting.nInstancingExistTime-self.nCurSec));
	Task.tbArmyCampInstancingManager.StatLog:WriteLog(1, 1, pPlayer);
	
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
	self:RemoveTaskItem(pPlayer, {20, 1, 623, 1, 0, 0});
	self:RemoveTaskItem(pPlayer, {20, 1, 624, 1, 0, 0});
	self:RemoveTaskItem(pPlayer, {20, 1, 625, 1, 0, 0});
	self:RemoveTaskItem(pPlayer, {20, 1, 626, 1, 0, 0});

	if (bPassive) then
		local nMapId, nReviveId, nMapX, nMapY = pPlayer.GetLoginRevivePos();
		pPlayer.NewWorld(nMapId, nMapX/32, nMapY/32);
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

-- ngoạn gia tử vong 
function tbInstancing:OnPlayerDeath()
	me.ReviveImmediately(0);
	me.SetFightState(0);
end

-- ngoạn gia rời khỏi địa đồ 
function tbInstancing:OnPlayerLeaveMap()
	self:KickPlayer(me.nId);
end

