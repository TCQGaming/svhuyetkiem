-------------------------------------------------------
-- văn kiện danh 　：main.lua
-- văn kiện miêu tả ：quân doanh phó bản -Hải Lăng Vương Mộ 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-16 09:13:42
-------------------------------------------------------

Require("\\script\\task\\armycamp\\campinstancing\\instancingmanager.lua");

local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancingBase(3);

tbInstancing.szName ="Hải Lăng Vương Mộ";
tbInstancing.szDesc ="Chiến thắng Hải Lăng Vương Mộ";


-- nhất tằng Trụ đích vị trí 
tbInstancing.YICENG_ZHUZI_POS	= {
			{{56384, 103360}, {57440, 103136}, {58080, 103136}}, 
			{{60352, 103104}, {60576, 102240}, {60544, 101472}},
			{{58176, 103904}, {58848, 105120}, {60064, 104416}},
			{{57344, 101696}, {58432, 102208}, {59520, 101056}},
		}
-- Trụ danh 
tbInstancing.YICENG_ZHUZI_NAME = {
				[1] ="Phong";
				[2] ="Lâm";
				[3] ="Hỏa";
				[4] ="Sơn";
		};
-- nhị tằng Trụ vị trí 				
tbInstancing.ERCENG_ZHUZI_POS	= {{1946, 3520}, {1954, 3395}, {1816, 3392}, {1823, 3519}, {1799, 3452}, {1884, 3361}, {1972, 3453}, {1884, 3541}};
-- nhị tằng truyện đưa vị trí 
tbInstancing.ERCENG_SEND_POS	= {
			{
				{{59520, 110464}, {60288, 109696}, {60320, 111200}, {61056, 110464}},
				{{59200, 109728}, {59104, 111072}, {59680, 109248}, {59680, 111616}, {60960, 109312}, {60928, 111616}, {61440, 109824}, {61472, 111072}},
				{{58592, 109248}, {59200, 112256}, {61312, 108544}, {62144, 111520}},
			},
			{
				{{58656, 110464}, {60288, 108672}, {60288, 112224}, {61920, 110496}},
				{{57984, 109824}, {58528, 111616}, {59264, 108576}, {59808, 112864}, {60672, 107904}, {61408, 112256}, {61984, 109216}, {62720, 110912}},
				{{58272, 108448}, {58368, 112544}, {62368, 108608}, {62272, 112512}},
			},
	}
-- khai khải FBđích thì hậu điều dùng 
function tbInstancing:OnOpen()
	-- khai khải FBkế thì khí 
	self.nNoPlayerDuration = 0; 
	self.nBreathTimerId = Timer:Register(Env.GAME_FPS, self.OnBreath, self);
	self.nCloseTimerId 	= Timer:Register(self.tbSetting.nInstancingExistTime*Env.GAME_FPS, self.OnClose, self);
	
	self.tbPlayerList = {}; -- lúc này Playerliệt biểu 
	self.tbEnteredPlayerList = {}; -- từng tiến quá đích Playerliệt biểu 
	
	if (not self.nCurSec) then
		self.nCurSec = 0;
	end;
	
	self.tbWinId			= {};
	self.nCurPlayerNo 		= 1;
	
	-- chuẩn bị khu 
	self:InitZhunBeiQu();
	
	-- kinh cức rừng rậm 
	self:InitJingJiMiLin();
	-- nhất tằng 
	self:InitFuBenYiCeng();
	
	-- nhị tằng 
	self:InitFuBenErCeng();
	
	-- hồng liên địa ngục 
	self:InitHongLianDiYu();
	
	self:InitKuoZhanQu();
end

function tbInstancing:InitZhunBeiQu()
	-- Lộ Lộ Thông 
	KNpc.Add2(4210, 125, -1, self.nMapId, 1589, 3173);
	-- quân doanh truyện tống 
	KNpc.Add2(4209, 125, -1, self.nMapId, 1592, 3149);
end;

function tbInstancing:InitJingJiMiLin()
	-- Tập Hợp Thạch 
	self.nJiHeShiCanUse	= 1;
	self.tbPassJingJiMiLin = {};
	
	self.nJiHeShiTime		= 0;
	KNpc.Add2(4216, 120, -1, self.nMapId, 1705, 3338);
	
	-- BOSS1ki quan 
	local pNpc = KNpc.Add2(4217, 120, -1, self.nMapId, 55168 / 32, 105120 / 32);
	self.nHL_Round1_ID = pNpc.dwId;
	self.nTrap2Pass		= 0;
	
	self.nBoss1Out		= 0;
end;

function tbInstancing:InitFuBenYiCeng()
	self.nTrap3Pass			= 0;
	self.tbGuessTable		= {};
	self.tbYiCengWinner		= {};
	self.nYiCengGuessCount	= 0;

	local tbNpc = Npc:GetClass("hl_guess1");	
	tbNpc:OnInit(self, 6, 36);
	
	-- dẫn đạo NPC
	KNpc.Add2(4231, 120, -1, self.nMapId, 59008 / 32, 102912 / 32);
	
	-- Trụ 
	for i = 1, #self.YICENG_ZHUZI_POS do
		local nNo = MathRandom(#self.YICENG_ZHUZI_POS[i]);
		local pNpc = KNpc.Add2(4222, 120, -1, self.nMapId, self.YICENG_ZHUZI_POS[i][nNo][1] / 32, self.YICENG_ZHUZI_POS[i][nNo][2] / 32);
		pNpc.GetTempTable("Task").nNo = i;	
		local szTitle = pNpc.szName.."(".. self.YICENG_ZHUZI_NAME[i]..")";
		pNpc.szName = szTitle;
		
		for j = 1, #self.YICENG_ZHUZI_POS[i] do
			if (j ~= nNo) then
				KNpc.Add2(4281, 120, -1, self.nMapId, self.YICENG_ZHUZI_POS[i][j][1] / 32, self.YICENG_ZHUZI_POS[i][j][2] / 32);
			end;
		end;
	end;
	
	self.nOpenJiGuan = 0; 
	
	-- khai BOSS2ki quan 
	local pNpc = KNpc.Add2(4218, 120, -1, self.nMapId, 56704 / 32, 107936 / 32);
	self.nHL_Round2_ID = pNpc.dwId;
	self.nTrap4Pass		= 0;
	self.nBoss2Out		= 0;

end;

function tbInstancing:InitFuBenErCeng()
	-- nhị tằng Trụ vị trí 				
	self.ERCENG_ZHUZI_POS	= {{1946, 3520}, {1954, 3395}, {1816, 3392}, {1823, 3519}, {1799, 3452}, {1884, 3361}, {1972, 3453}, {1884, 3541}};
	-- nhị tằng truyện đưa vị trí 
	self.ERCENG_SEND_POS	= {
			{
				{{59520, 110464}, {60288, 109696}, {60320, 111200}, {61056, 110464}},
				{{59200, 109728}, {59104, 111072}, {59680, 109248}, {59680, 111616}, {60960, 109312}, {60928, 111616}, {61440, 109824}, {61472, 111072}},
				{{58592, 109248}, {59200, 112256}, {61312, 108544}, {62144, 111520}},
			},
			{
				{{58656, 110464}, {60288, 108672}, {60288, 112224}, {61920, 110496}},
				{{57984, 109824}, {58528, 111616}, {59264, 108576}, {59808, 112864}, {60672, 107904}, {61408, 112256}, {61984, 109216}, {62720, 110912}},
				{{58272, 108448}, {58368, 112544}, {62368, 108608}, {62272, 112512}},
			},
	}
	Lib:SmashTable(self.ERCENG_ZHUZI_POS);
	for i = 1, #self.ERCENG_SEND_POS do
		for j = 1, #self.ERCENG_SEND_POS[i] do
			Lib:SmashTable(self.ERCENG_SEND_POS[i][j]);
		end;
	end;
	
	self.nOpen2 			= 1;
	self.nErCengWinner		= 0;
	
	local tbNpc = Npc:GetClass("hl_guess2");
	tbNpc:OnInit(self, 1, 100)
	
	-- Trụ 
	self.nOpenZhuZiTime		= 0;
	self.nZhuZiOpen			= 0;
	self.tbOpen				= {};
	
	-- dẫn đạo NPC2
	KNpc.Add2(4232, 120, -1, self.nMapId, 60384 / 32, 110624 / 32);
	
	-- truyện tống khứ 
	for i = 1, #self.ERCENG_SEND_POS[1] do 
		for j = 1, #self.ERCENG_SEND_POS[1][i] do
			local pNpc = KNpc.Add2(4228, 120, -1, self.nMapId, self.ERCENG_SEND_POS[1][i][j][1] / 32, self.ERCENG_SEND_POS[1][i][j][2] / 32);
			pNpc.szName ="";
			local tbData = pNpc.GetTempTable("Task");
			tbData.tbNo = {2, i, j};
		end;
	end; 
	-- truyện tống quay về 
	for i = 1, #self.ERCENG_SEND_POS[2] do 
		for j = 1, #self.ERCENG_SEND_POS[2][i] do
			local pNpc = KNpc.Add2(4228, 120, -1, self.nMapId, self.ERCENG_SEND_POS[2][i][j][1] / 32, self.ERCENG_SEND_POS[2][i][j][2] / 32);
			pNpc.szName ="";
			local tbData = pNpc.GetTempTable("Task");
			tbData.tbNo = {1, i, j};
		end;
	end; 	
	--Quang Ảnh Thạch 
	for i = 1, 4 do
		local pNpc = KNpc.Add2(4223, 120, -1, self.nMapId, self.ERCENG_ZHUZI_POS[i][1], self.ERCENG_ZHUZI_POS[i][2]);
		self.tbOpen[pNpc.dwId] = 0;
	end;
	--Trụ 	
	for i = 5, 8 do
		KNpc.Add2(4281, 120, -1, self.nMapId, self.ERCENG_ZHUZI_POS[i][1], self.ERCENG_ZHUZI_POS[i][2]);
	end;
	
	-- khai BOSS3ki quan 
	local pNpc = KNpc.Add2(4219, 120, -1, self.nMapId, 56384 / 32, 114112 / 32);
	self.nHL_Round3_ID 	= pNpc.dwId;	
	self.nTrap6Pass		= 0;
	self.nBoss3Out			= 0;
end;


function tbInstancing:InitHongLianDiYu()
	self.tbFireOutTime = {}; --dùng lai bảo tồn cà ra Hỏa cập Hỏa tồn tại thời gian 

	-- dẫn đạo NPC3
	KNpc.Add2(4233, 120, -1, self.nMapId, 1922, 3805);
		
	-- hoàn nhan lượng quan quách 
	local pNpc = KNpc.Add2(4220, self.nNpcLevel, -1, self.nMapId, 59264 / 32, 115616 / 32);
	self.nHL_Round4_ID = pNpc.dwId;	
	self.nHL_Round4_Count = 0;
	self.nTrap10Pass = 0;
	self.nBoss5Out 	= 0;
	self.nJinDiZhiMenOut	= 0;
	self.tbDiYuTrap		= {
				[7]	= 0,	-- trap 7 
				[8] = 0,  -- trap 8 
				[9] = 0,  -- trap 9 
				[10] = 0,  -- trap 10 
		}
	-- địa ngục 1 hl_diyu1
	local pNpc = KNpc.Add2(4234, 120, -1, self.nMapId, 63008 / 32, 121984 / 32);
	pNpc.GetTempTable("Task").nTrapNo = 7;
	pNpc.SetTitle("<color=red>Một<color>");
	
	-- địa ngục 2 hl_diyu2
	local pNpc = KNpc.Add2(4234, 120, -1, self.nMapId, 62528 / 32, 119136 / 32);
	pNpc.GetTempTable("Task").nTrapNo = 8;
	pNpc.SetTitle("<color=red>Hai<color>");
	
	-- địa ngục 3 hl_diyu3
	local pNpc = KNpc.Add2(4234, 120, -1, self.nMapId, 63840 / 32, 116384 / 32); 
	pNpc.GetTempTable("Task").nTrapNo = 9; 
	pNpc.SetTitle("<color=red>Ba<color>");
	
	KNpc.Add2(4221, 120, -1, self.nMapId, 1946, 3603); 
end;

function tbInstancing:InitKuoZhanQu()
	-- Kỳ Hồn 
	KNpc.Add2(4248, self.nNpcLevel, -1, self.nMapId, 51904 / 32, 112640 / 32);
	-- Ảnh Hồn 
	KNpc.Add2(4274, self.nNpcLevel, -1, self.nMapId, 51200 / 32, 108512 / 32);
	
	KNpc.Add2(4276, self.nNpcLevel, -1, self.nMapId, 1712, 3864);
	
	self.tbKuoZhanQuOut		= {
				0,
				0,
				0,
			}
end;

function tbInstancing:OnBreath()
	if (self.nPlayerCount == 0) then
		self.nNoPlayerDuration = self.nNoPlayerDuration + 1;
	elseif (nNoPlayerDuration ~= 0) then
		self.nNoPlayerDuration = 0;
	end
	
	if (not self.nCurSec) then
		self.nCurSec = 1;
	else
		self.nCurSec = self.nCurSec + 1;
	end
	
	if (self.nNoPlayerDuration>= self.tbSetting.nNoPlayerDuration) then
		self:OnClose();
		return 0;
	end

	if (self.nCurSec % 600 == 0) then
		Task.tbArmyCampInstancingManager:Tip2MapPlayer(self.nMapId,"Phó bản"..self.tbSetting.szName.."sẽ đóng sau"..math.floor((self.tbSetting.nInstancingExistTime-self.nCurSec)/60).."phút");
	end
	
	if (self.nJiHeShiTime> 0) then
		self.nJiHeShiTime = self.nJiHeShiTime - 1;
	end;

	local nExistLongTime = 0;
	if (self.nTrap10Pass ~= 1) then
		for nId, nTime in pairs(self.tbFireOutTime) do
			if (nTime>= 8) then ----if (nTime>= 8) then --dập lửa
				local pNpc = KNpc.GetById(nId);
				nExistLongTime = pNpc.GetTempTable("Task").nDiYuNo;
				break;
			end;
			self.tbFireOutTime[nId] = nTime + 1;
		end;
	end;
	
	if (nExistLongTime ~= 0) then
		local tbDiYuNpc = Npc:GetClass("hl_hldy_npc");
		tbDiYuNpc:TimeOver(nExistLongTime, self);
	end;
---------------------------------------------------------- mở hải lăng vương mộ
	--if (self.nOpenZhuZiTime == 1) then
	--	local bAllOpen = true;
	--	for _, nOpen in pairs(self.tbOpen) do
	--		if (nOpen ~= 1) then
	--			bAllOpen = false;
	--			break;
	--		end;
	--	end;
	if (self.nOpenZhuZiTime == 1) then
		local bAllOpen = true;
		for _, nOpen in pairs(self.tbOpen) do
			if (nOpen ~= 1) then
				bAllOpen = false;
				break;
			end;
		end;
		if (not bAllOpen) then
			for nId, nOpen in pairs(self.tbOpen) do
				self.tbOpen[nId] = 0;
			end;
			self.nOpenZhuZiTime = 0;
			Task.tbArmyCampInstancingManager:Tip2MapPlayer(self.nMapId,"Mở không cùng lúc,phải mở 4 quang ảnh thạch cùng lúc");
		else
			self.nOpenZhuZiTime = 2;
			self.nZhuZiOpen = 1;
			
				-- sai sổ tự NPC
			KNpc.Add2(4225, self.nNpcLevel, -1, self.nMapId, 60320 / 32, 110400 / 32);
			
			local tbPlayList,_ = KPlayer.GetMapPlayer(self.nMapId);
			for _, teammate in ipairs(tbPlayList) do
				teammate.NewWorld(self.nMapId, 60160 / 32, 110304 / 32);
				self:OnCoverBegin(teammate);
				teammate.SetFightState(1);
				
				local szMsg ="<npc=4224>：Chúng ta lại gặp lại,hãy cùng tham gia với ta <end><npc=4224>：Người nào trả lời đúng sẽ có phần thưởng hậu hĩnh <end><npc=4224>：Hãy cố gắng hết sức <end>";	
				Setting:SetGlobalObj(teammate);
				TaskAct:Talk(szMsg);
				Setting:RestoreGlobalObj();	
			end;		
		end;
	end;
end

function tbInstancing:ReturnLastTime()
	for nId, nTime in pairs(self.tbHuo) do
		local pNpc = KNpc.GetById(nId);
		if (pNpc) then
			pNpc.Delete();
		end;
	end;
	self.tbHuo = {};
	self.nTrap7Open = 0;
end;

-- một lần nữa tảo miêu một lần phó bản nội ngoạn gia 
function tbInstancing:SetGuessTable(tbGuessTable)
	local tbPlayList,_ = KPlayer.GetMapPlayer(self.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		local bNotIn = true;
		for i = 1, #tbGuessTable do
			if (tbGuessTable[i] == teammate.nId) then
				bNotIn = false;
			end;
		end;
		if (bNotIn) then
			tbGuessTable[#tbGuessTable + 1] = teammate.nId;
		end;
	end;
end;

function tbInstancing:ConverseTable(tbGuessTable)
	local tbTemp = {};
	tbTemp[#tbTemp + 1] = tbGuessTable[self.nCurPlayerNo];
	
	if (self.nCurPlayerNo> 1) then
		for i = self.nCurPlayerNo - 1, 1, -1 do
			tbTemp[#tbTemp + 1] = tbGuessTable[i];
		end;
	end;
	
	for i = #tbGuessTable, self.nCurPlayerNo + 1, -1 do
			tbTemp[#tbTemp + 1] = tbGuessTable[i];
	end;

	self.nCurPlayerNo = 1;
	return tbTemp;
end;

-- thu hoạch vị kế tiếp sai sổ đích ngoạn gia 
function tbInstancing:GetNextPlayerFromTable(tbGuessTable)
	self:SetGuessTable(tbGuessTable);
	if (not self.nCurPlayerNo or self.nCurPlayerNo>= #tbGuessTable) then
		self.nCurPlayerNo = 1;
	else
		self.nCurPlayerNo = self.nCurPlayerNo + 1;
	end;
	
	if (not tbGuessTable or #tbGuessTable == 0) then
		return nil;
	end;
	
	for i = 1, #tbGuessTable * 2 do
		if (tbGuessTable[self.nCurPlayerNo]) then
			local pPlayer = KPlayer.GetPlayerObjById(tbGuessTable[self.nCurPlayerNo]);
			if (pPlayer and pPlayer.nMapId == self.nMapId) then
				return pPlayer;
			end;
		end;
		
		self.nCurPlayerNo = self.nCurPlayerNo + 1;
		if (self.nCurPlayerNo> #tbGuessTable) then
			self.nCurPlayerNo = 1;
		end;
	end;
	return nil;
end;

-- thu hoạch tiền một vị sai sổ đích ngoạn gia 
function tbInstancing:GetPrePlayerFromTable(tbGuessTable)
	self:SetGuessTable(tbGuessTable);
	if (not self.nCurPlayerNo or self.nCurPlayerNo <= 1) then
		self.nCurPlayerNo = #tbGuessTable;
	else
		self.nCurPlayerNo = self.nCurPlayerNo - 1;
	end;
	
	if (not tbGuessTable or #tbGuessTable == 0) then
		return nil;
	end;
	
	for i = 1, #tbGuessTable * 2 do
		if (tbGuessTable[self.nCurPlayerNo]) then
			local pPlayer = KPlayer.GetPlayerObjById(tbGuessTable[self.nCurPlayerNo]);
			if (pPlayer and pPlayer.nMapId == self.nMapId) then
				tbInstancing.nCurPlayerNo = self.nCurPlayerNo;
				return pPlayer;
			end;
		end;
		
		self.nCurPlayerNo = self.nCurPlayerNo - 1;
		if (self.nCurPlayerNo <1) then
			self.nCurPlayerNo = #tbGuessTable;
		end;
	end;
	return nil;
end;

-- FBquan bế thì điều dùng 
function tbInstancing:OnClose()
	for nPlayerId, tbPlayerData in pairs(self.tbPlayerList) do
		self:KickPlayer(nPlayerId, 1,"Phó bản đã kết thúc");
	end
	
	for nId,_ in pairs(self.tbFireOutTime) do 
		local pNpc = KNpc.GetById(nId);
		if (pNpc) then
			pNpc.Delete();
		end;
		self.tbFireOutTime[nId] = nil;		
	end;
	
	if (self.nDY_TimerId) then
		Timer:Close(self.nDY_TimerId);
		self.nDY_TimerId = nil;
	end;
	
	if (self.nGuessTimerId) then
		Timer:Close(self.nGuessTimerId);
		self.nGuessTimerId = nil;		
	end;
	
	Task.tbArmyCampInstancingManager:CloseMap(self.nMapId);
	Timer:Close(self.nBreathTimerId);
	Timer:Close(self.nCloseTimerId);
	
	return 0;
end


-- đương một ngoạn gia thân thỉnh tiến nhập 
function tbInstancing:OnPlayerAskEnter(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (self.nPlayerCount>= self.tbSetting.nMaxPlayer) then
		Dialog:SendInfoBoardMsg(pPlayer,"Đã đủ đội tham gia phó bản.vui lòng thử lại sau");
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
		pPlayer.SetTask(1022, 177, 0); -- nặng đưa nhiệm vụ biến lượng 
		pPlayer.SetTask(1022, 178, 0);
		pPlayer.SetTask(1022, 179, 0);
		
		-- ký lục ngoạn gia tham gia quân doanh phó bản đích thứ sổ 
		Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_ARMYCAMP, 1);
	end
	
	self.tbPlayerList[nPlayerId] = {};
	self.tbPassJingJiMiLin[nPlayerId] = 0;
	
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
	Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"Di chuyển đến"..self.szRegisterMapName.."phó bản"..self.tbSetting.szName.."do Đội Trưởng"..self.szOpenerName.."mở!!!", 20);
	
	-- kế thì mặt bản 
	if (not self.nCurSec) then -- ở báo danh đích một giây chung trong vòng tiến nhập phó bản ，self.nCurSechoàn một trải qua OnBreathsanh thành ，vi nil tắc ở đây sanh thành 
		self.nCurSec = 0;
	end;
	Dialog:SetTimerPanel(pPlayer,"<color=Gold>quân doanh phó bản ：<color>\n<color=White>cự phó bản quan bế còn có ：<color>", (self.tbSetting.nInstancingExistTime-self.nCurSec));
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
	self:OnCoverEnd(pPlayer);
	
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
	self:OnCoverEnd(me);
end

-- ngoạn gia rời khỏi địa đồ 
function tbInstancing:OnPlayerLeaveMap()
	self:KickPlayer(me.nId);
end

-- khai khải hắc ám quang hoàn 
function tbInstancing:OnCoverBegin(pPlayer)
	if (MODULE_GAMESERVER) then
		pPlayer.CallClientScript({"BlackSky:OnCoverBegin"});
	end;
end;

-- quan bế hắc ám quang hoàn 
function tbInstancing:OnCoverEnd(pPlayer)
	if (MODULE_GAMESERVER) then
		pPlayer.CallClientScript({"BlackSky:OnCoverEnd"});
	end;
end;

