-------------------------------------------------------------------
--File: 	factionrest_base.lua
--Author: 	sunduoliang
--Date: 	2008-2-23 9:00
--Describe:	Môn phái chiến thời gian nghỉ ngơi hoạt động 
--InterFace1: JoinEvent(pPlayer)--ngoạn gia thêm vào hoạt động 
--InterFace2: LeaveEvent(pPlayer)--ngoạn gia ly khai hoạt động 
--InterFace3: StartRest() --bắt đầu hoạt động ，
--InterFace3: EndRest()					--cai giới hoạt động kết thúc ，đóng cai giới hoạt động ，một lần có 3tràng hoạt động ，3tràng hoạt động hậu sử dụng nữa ，
--InterFace4: HmCloseRest()					--thủ động cưỡng chế đóng hoạt động ；
--InterFace4: InitRest(nMapId) mới bắt đầu hóa ：nMapId:hoạt động địa đồ ;
-------------------------------------------------------------------
Require("\\script\\pvp\\factionbattle_def.lua");
local tbBaseFactionRest	= {};	-- 	Môn phái chiến thời gian nghỉ ngơi hoạt động 
FactionBattle.tbBaseFactionRest = tbBaseFactionRest;
tbBaseFactionRest.tbPlayerIdList = {}; --ngoạn gia liệt biểu 
tbBaseFactionRest.POS_SUM = 1;			--cà npcmột sổ 
tbBaseFactionRest.NPC_TEMPID = 2701;	--cà npcđích mẫu ID
tbBaseFactionRest.NPC_LEVEL = 1;		--cà npcđích đẳng cấp 
tbBaseFactionRest.NPC_SERIES = Env.SERIES_NONE; --cà npcđích ngũ hành thuộc tính 
tbBaseFactionRest.TRAP_CONFIG ="\\setting\\pvp\\map\\jingjiqizhi.txt"; 	--npcnảy sinh cái mới trapđiểm bảng định văn kiện 
tbBaseFactionRest.TASK_GROUP_ID = FactionBattle.TASK_GROUP_ID;	--nhiệm vụ lượng biến đổi ，nhiệm vụ phân tổ ID
tbBaseFactionRest.TASK_ID1 = FactionBattle.DEGREE_TASK_ID;			--nhiệm vụ lượng biến đổi ，ghi lại vi tích phân đích giới 
tbBaseFactionRest.TASK_ID2 = FactionBattle.SCORE_TASK_ID;			--nhiệm vụ lượng biến đổi ，ghi lại vi tích phân 
tbBaseFactionRest.TASK_ID3 = FactionBattle.ELIMINATION_TASK_ID;
tbBaseFactionRest.MY_GET_POINT = {nPoint = 100, nExNum = 5, nExPoint = 300}--điểm người Bát Kỳ thu được vi tích phân,thêm vào vi tích phân 
tbBaseFactionRest.MEMBER_GET_POINT = {nPoint = 20, nExNum = 5, nExPoint = 60}	--điểm người Bát Kỳ đội viên thu được vi tích phân,thêm vào vi tích phân 
--cờ xí giai đoạn tính xuất hiện thời gian đơn vị miểu 
tbBaseFactionRest.RESTSTATE =	
{
	[1] = {nEndTime = 30,}, --thứ 90miểu 
	[2] = {nEndTime = 30,}, --thứ 180miểu 
	[3] = {nEndTime = 30,}, --thứ 270miểu 
	[4] = {nEndTime = 30,}, --thứ 360miểu 
	[5] = {nEndTime = 10,}, --thứ 420miểu 
}
local nTimeLastSum = 0;
for nRestState, tbTime in pairs(tbBaseFactionRest.RESTSTATE) do
		nTimeLastSum = nTimeLastSum + tbTime.nEndTime;
end
tbBaseFactionRest.STATE_TIEM_SUM = nTimeLastSum;	--ghi lại tổng thời gian 

--số liệu giữ gìn hàm số start-------------

function tbBaseFactionRest:InitRest(nMapId)	--số liệu mới bắt đầu hóa 
	self.nMapId = nMapId; 	--nMapId:hoạt động địa đồ 

	self.nState = 0;				--mở ra trạng thái, 0vị mở ra ，1,2,3,4,5vi các giai đoạn 
	self.tbNpcIdList = {} 	--cà sở hữu npcđích IDliệt biểu 
	self.nTimerId = 0;			--cà npcsinh ra đúng giờ khí Id
	self.nTimeLastSum = self.STATE_TIEM_SUM;
end

function tbBaseFactionRest:ClearRest()	--thanh trừ sở hữu số liệu 
	self.nState = 0;			--mở ra trạng thái 
	self.tbNpcIdList = {} --cà sở hữu npcđích IDliệt biểu 
	self.nTimerId = 0;		--cà npcsinh ra đúng giờ khí Id	
	self.nTimeLastSum = self.STATE_TIEM_SUM;	
	self:ClearPlayerInfo();
end

function tbBaseFactionRest:ClearPlayerInfo()	--thanh trừ ngoạn gia số liệu 
	for nPlayerId, tbPlayerInfo in pairs(self.tbPlayerIdList) do
		self:ClearSinglePlayerInfo(nPlayerId);		--thanh trừ đan một ngoạn gia số liệu 
	end	
end

function tbBaseFactionRest:ClearSinglePlayerInfo(nPlayerId)	--thanh trừ ngoạn gia số liệu 
	self.tbPlayerIdList[nPlayerId] = {};
	self.tbPlayerIdList[nPlayerId].nHitQiZhi = 0;
	self.tbPlayerIdList[nPlayerId].tbHitQiZhiSign = {};	
end

function tbBaseFactionRest:RestSetPlayerList()--mới bắt đầu ngoạn gia liệt biểu số liệu 
	self.tbPlayerIdList = {};
end
--số liệu giữ gìn hàm số end-------------

--đối ngoại tiếp lời start-------------
function tbBaseFactionRest:JoinEvent(pPlayer)--ngoạn gia thêm vào hoạt động 
	if self.tbPlayerIdList[pPlayer.nId] == nil then
		self.tbPlayerIdList[pPlayer.nId] = {};
		self.tbPlayerIdList[pPlayer.nId].nHitQiZhi = 0;
		self.tbPlayerIdList[pPlayer.nId].tbHitQiZhiSign = {};
		self.tbPlayerIdList[pPlayer.nId].nState = 0;	--tham gia hoạt động tình huống 
	end
	if self.nState> 0 then
		self.tbPlayerIdList[pPlayer.nId].nState = 1;	--tham gia hoạt động tình huống 
		self:OpenSingleShowMsg(pPlayer);	--tham gia hoạt động tình huống 		
	end
end

function tbBaseFactionRest:LeaveEvent(pPlayer)--ngoạn gia ly khai hoạt động 
	if self.tbPlayerIdList[pPlayer.nId] ~= nil then
		self:CloseSingleShowMsg(pPlayer);
	end
end

function tbBaseFactionRest:EndRest()
	self:RestSetPlayerList();
end

function tbBaseFactionRest:StartRest()	--mở ra hoạt động 
	if self.nState> 0 then
		print("hoạt động tiến hành mở ra ，thỉnh hoàn tất hậu tái mở ra 。bất năng mở lại mở ra 。");
		return 0;
	end
	self.nTimerId = Timer:Register(self.RESTSTATE[1].nEndTime * Env.GAME_FPS, self.StartState, self);	
	self:StartState();
end
--đối ngoại tiếp lời end-------------

function tbBaseFactionRest:CallRandomNpc()
	self:GetNpcPos();--xong cà npcđích ngẫu nhiên điểm 
	for nPos=1, self.POS_SUM do
		local pNPC = KNpc.Add2(self.NPC_TEMPID, self.NPC_LEVEL, self.NPC_SERIES, self.nMapId * 1, self.tbNpcPos[nPos].nX * 1, self.tbNpcPos[nPos].nY * 1, 0, 0, 0)
		if pNPC == nil then
			print("Môn phái thi đấu thể thao nghỉ ngơi đang lúc hoạt động ，triệu hoán npcthất bại 。");
			Dbg:WriteLog("Môn phái thi đấu thể thao nghỉ ngơi đang lúc hoạt động","thủ động đóng đúng giờ khí thất bại");
		else
			local tbNpcInfo = pNPC.GetTempTable("FactionBattle");
			tbNpcInfo.tbBaseClass = self;
			self.tbNpcIdList[#self.tbNpcIdList+ 1] = pNPC.dwId;
		end
	end
end

function tbBaseFactionRest:StartState()
	self.nState = self.nState + 1;
	if self.nState> #self.RESTSTATE then
		self:AutoCloseRest();
		return 0;
	else
		if self.nState> 1 then
			self.nTimeLastSum = self.nTimeLastSum - self.RESTSTATE[self.nState - 1].nEndTime;
		end
		self:ClearNpc();	--thanh trừ lần trước npc
		self:CallRandomNpc(); --triệu hoán npc
		self:BroadcastMsg();	--thông cáo 
		self:OpenShowMsg(); --mở sở hữu ngoạn gia mặt biên 
		return self.RESTSTATE[self.nState].nEndTime * Env.GAME_FPS;
	end
	return 0;
end

function tbBaseFactionRest:GetNpcPos()		--từ phối trí văn kiện thu được npcđích trap
	local tbsortpos = Lib:LoadTabFile(self.TRAP_CONFIG);
	local nLineCount = #tbsortpos;
	local tbClassPos = {};
	for nLine=1, nLineCount do
		local nZone = tonumber(tbsortpos[nLine].ZONE) or 0;
		local nTrapX = tonumber(tbsortpos[nLine].TRAPX);
		local nTrapY = tonumber(tbsortpos[nLine].TRAPY);
		if nZone == 0 then
			nZone = #tbClassPos + 1
		end
		if tbClassPos[nZone] == nil then
			tbClassPos[nZone] = {};
		end
		local nPosNo = (#tbClassPos[nZone]+ 1);
		tbClassPos[nZone][nPosNo] = {};
		tbClassPos[nZone][nPosNo].nX = nTrapX;
		tbClassPos[nZone][nPosNo].nY = nTrapY;
	end
	tbClassPos = self:GetRandomList(tbClassPos, #tbClassPos);
	self.tbNpcPos = {};
	for nPos=1, self.POS_SUM do
		tbClassPos[nPos] = self:GetRandomList(tbClassPos[nPos], #tbClassPos[nPos]);
		self.tbNpcPos[nPos] = {};
		self.tbNpcPos[nPos].nX = tbClassPos[nPos][1].nX;
		self.tbNpcPos[nPos].nY = tbClassPos[nPos][1].nY;
	end
end

function tbBaseFactionRest:GetRandomList(tbitem, nmax)	--bả tabletiến hành ngẫu nhiên ，phản hồi ngẫu nhiên biểu 
	for ni = 1, nmax do
		local p = MathRandom(1, nmax);
		tbitem[ni], tbitem[p] = tbitem[p], tbitem[ni];
	end
	return tbitem;
end

--
function tbBaseFactionRest:BroadcastMsg()	--tuyên bố công cộng thông cáo 
	for nPlayerId, tbPlayerInfo in pairs(self.tbPlayerIdList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer ~= nil then
			if (pPlayer.nMapId == self.nMapId) then
				local szAnnouce ="";
				self.tbPlayerIdList[pPlayer.nId].nState = 1;
				if self.nState == 1 then
					szAnnouce ="Cờ đã mọc lên, hợp thành đội tìm cờ tìm kiếm sẽ thu được cờ:";
				else
					szAnnouce = string.format("Cờ thứ %s đã dâng lên,họp thành đội tìm kiếm sẽ thu được cờ 。",self.nState); 
				end
				Dialog:SendBlackBoardMsg(pPlayer, szAnnouce)
			end
		end
	end
end
--

--mặt biên tương quan hàm số start--------------
function tbBaseFactionRest:OpenShowMsg()			--mở sở hữu ngoạn gia liệt biểu mặt biên biểu hiện 
	for nPlayerId, tbPlayerInfo in pairs(self.tbPlayerIdList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer ~= nil then
			self:OpenSingleShowMsg(pPlayer);
		end
	end
end

function tbBaseFactionRest:OpenSingleShowMsg(pPlayer)	--mở đan một ngoạn gia mặt biên 
	if (not pPlayer or self.tbPlayerIdList[pPlayer.nId].nState == 0) then	--tham gia hoạt động tình huống 
		return;
	end
	Dialog:ShowBattleMsg(pPlayer, 0, 0); -- đóng mặt biên 
	if self.nState> 0 then
		local szMsgFormat ="<color=green>Tìm kiếm cờ kết thúc ：<color><color=white>%s<color>\n\n";
		local nLastFrameTime = tonumber(self.RESTSTATE[self.nState].nEndTime * Env.GAME_FPS);
		szMsgFormat = szMsgFormat.. string.format("<color=green>Lượt tìm cờ %2s tiếp theo ：<color>", self.nState).."<color=white>%s<color>";
		Dialog:SetBattleTimer(pPlayer, szMsgFormat, self.nTimeLastSum * Env.GAME_FPS, nLastFrameTime);
		self:UpdateShowMsg(pPlayer);
		
	elseif self.nState == 0 then
		local nLastFrameTime = 0;
		local szMsgFormat ="<color=green>hoạt động còn chưa mở ra ：<color><color=white>%s<color>";
		Dialog:SetBattleTimer(pPlayer, nLastFrameTime, szMsgFormat);
		local szMsg ="\ncờ  còn chưa xuất hiện";
		Dialog:SendBattleMsg(pPlayer, szMsg);
	end
	self.tbPlayerIdList[pPlayer.nId].nState = 1 	--bị vây trong hoạt động 
	Dialog:ShowBattleMsg(pPlayer, 1, 0); --mở ra mặt biên 
	
end

function tbBaseFactionRest:UpdateShowMsg(pPlayer)	--canh tân biểu hiện ngoạn gia mặt biên nội dung 
		local szFindQiZhiMsg ="";
		if self.tbPlayerIdList[pPlayer.nId].nHitQiZhi == self.nState and self.nState> 0 then
			szFindQiZhiMsg ="\n<color=yellow>ngài thành công tìm được cờ rồi <color>";
		end
		szFindQiZhiMsg = string.format("%s\nlần này trong hoạt động tìm kiếm cờ được ：<color=yellow>%s/%s<color>", szFindQiZhiMsg, self.tbPlayerIdList[pPlayer.nId].nHitQiZhi, #self.RESTSTATE);
		local nGradePoint = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_ID2);
		local szGradePointMsg = string.format("\nSố cờ nhặt được ：<color=yellow>%s<color>", nGradePoint);
		local szMsg = string.format("%s%s", szFindQiZhiMsg, szGradePointMsg);
		Dialog:SendBattleMsg(pPlayer, szMsg);
end

function tbBaseFactionRest:CloseShowMsg()			--đóng sở hữu ngoạn gia liệt biểu đích mặt biên 
	for nPlayerId, tbPlayerInfo in pairs(self.tbPlayerIdList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer ~= nil then
			self:CloseSingleShowMsg(pPlayer);
		end
	end
end

function tbBaseFactionRest:CloseSingleShowMsg(pPlayer)	--đóng đan một ngoạn gia mặt biên 
	Dialog:ShowBattleMsg(pPlayer, 0, 0); -- đóng mặt biên 
	self.tbPlayerIdList[pPlayer.nId].nState = 0;
end
--mặt biên tương quan hàm số end--------------

--đúng giờ khí tương quan start------------
function tbBaseFactionRest:AutoCloseRest()	--đúng giờ khí tự động đóng lại 
	self:BaseCloseRest();
	return 0;
end

function tbBaseFactionRest:HmCloseRest()	--thủ động đóng 
	if self.nState == 0 then
		print("Môn phái thi đấu thể thao nghỉ ngơi đang lúc hoạt động ，cai đúng giờ khí đã đóng ，vô đúng giờ khí nhưng đóng 。");
		Dbg:WriteLog("Môn phái thi đấu thể thao nghỉ ngơi đang lúc hoạt động","thủ động đóng đúng giờ khí thất bại");
		return 0;
	end
	self:BaseCloseRest();
	Timer:Close(self.nTimerId);
end

function tbBaseFactionRest:BaseCloseRest()	--đóng cơ loại 
	self:ClearNpc();
	self:ClearRest();
	--self:CloseShowMsg();
end

function tbBaseFactionRest:ClearNpc()	--thanh trừ npc
	if self.tbNpcIdList ~= nil or #self.tbNpcIdList ~= 0 then 
		for nNpcNo=1, #self.tbNpcIdList do
			local pNpc = KNpc.GetById(self.tbNpcIdList[nNpcNo]);
			if pNpc ~= nil then
				pNpc.Delete();
			end
		end
	end
	self.tbNpcIdList = {};	
end
--đúng giờ khí tương quan start------------
