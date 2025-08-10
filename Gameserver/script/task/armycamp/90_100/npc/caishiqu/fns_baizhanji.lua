----------------------------------------
-- bách trảm cát 
-- ZhangDeheng
-- 2008/10/29 8:41
----------------------------------------

local tbBaiZhanJi_Fight = Npc:GetClass("fnsbaizhanjifight");

tbBaiZhanJi_Fight.BOXID	= 4113; --đánh chết BOSShậu rơi xuống bảo rương đích ID
-- dùng sinh ký lục lượng máu ở nhất định thì hậu nếu có hay không thuyết liễu 
tbBaiZhanJi_Fight.tbLifePercentSay =
{
	[100] = false,
	[90] = false,
	[49] = false,
	[9]  = false,
}

-- cách mỗi nhất định thời gian thuyết nếu 
tbBaiZhanJi_Fight.tbOnTimerSayText = 
{
	[100] = {
		"chúng ta gia dưỡng đích đều là danh quý đích hãm hại đa �phu tê kê 。",
		"lai ，ôn chỉ kê ！",
		"tổng cảm thấy có cái gì sự tình một bạn ，nhưng là vừa nhớ không nổi lai ……",
	},
	[90] = {
		"tái lai ！tái lai ！chúng ta chơi nữa ngoạn ！",
		"xem ra ，muốn ăn ki miệng kê thịt bổ bổ liễu ！ngừng tay ！",
		"lai nhân na ，cấp ta điểm khẳng đắc kê bổ sung ta nội lực ！",
	},
	[49] = {
		"ta muốn đem ngươi môn đánh cho kê mao loạn phi ！",
		"ngươi thuyết cái gì ？ngươi xác định ngươi là ở hướng ta cầu xin tha thứ mạ ？",
		"ngươi chạy không được liễu ，tiểu kê môn ！",
	},
	[9] = {
		"chuyển dời địch nhân lực chú ý ！khán ~hôi kê ！！",
		"ta bây giờ bắt đầu hiểu được đáo bị ta ăn tươi đích kê đích cảm giác liễu ！",
		"cổn khai ！",
	}, 
}

-- lượng máu ở nhất định thì hậu thuyết nếu 
tbBaiZhanJi_Fight.tbOnLifeSayText = 
{
	[100] ="các ngươi cũng dám lai đất của ta bàn dương oai ？xem ta lão ưng trảo tiểu kê ！",
	[90] ="ai u đau quá ，chuyển dời địch nhân lực chú ý ！khán ~hôi kê ！！",
	[49] ="cơ thể có điểm toan a 。",
	[9]  ="ta ……ta ……！",
}

-- tử vong thì chấp hành 
function tbBaiZhanJi_Fight:OnDeath(pNpc)
	Task.tbToBeDelNpc[him.dwId] = 0;
	local nSubWorld, nNpcPosX, nNpcPosY = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	if (tbInstancing.nBzhjTimerId and tbInstancing.nBzhjTimerId> 0) then
		Timer:Close(tbInstancing.nBzhjTimerId);
		tbInstancing.nBzhjTimerId = nil;
	end
	
	-- rơi một bảo rương 
	local pBaoXiang = KNpc.Add2(self.BOXID, 1, -1, nSubWorld, nNpcPosX, nNpcPosY);
	assert(pBaoXiang)

	local pPlayer 	= pNpc.GetPlayer();
	pBaoXiang.GetTempTable("Task").nOwnerPlayerId = pPlayer.nId;
	pBaoXiang.GetTempTable("Task").CUR_LOCK_COUNT = 0;
end;

-- mỗi tránh chấp hành một lần 
function tbBaiZhanJi_Fight:OnBreath(nId)
	local pNpc = KNpc.GetById(nId);
	local nSubWorld,_,_ = pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	assert(tbInstancing);
	
	if not tbInstancing.nBaiZhanJiCurSec then
		tbInstancing.nBaiZhanJiCurSec = 1;
	else
		tbInstancing.nBaiZhanJiCurSec = tbInstancing.nBaiZhanJiCurSec + 1;
	end
	
	-- lượng máu ở 100%đích thì hậu cách mỗi 20miểu thuyết một lần thoại 
	if (self:OnTimerSay(nId, 100, 100, 20)) then
		return;
	-- lượng máu ở 90% - 50% đích thì hậu cách mỗi 10miểu thuyết một lần thoại 	
	elseif (self:OnTimerSay(nId, 90, 50, 10)) then
		return;
	-- lượng máu ở 49% - 10% đích thì hậu cách mỗi 10miểu thuyết một lần thoại 
	elseif (self:OnTimerSay(nId, 49, 10, 10)) then
		return;
	-- lượng máu ở 9% - 0% đích thì hậu cách mỗi 10miểu thuyết một lần thoại 
	elseif (self:OnTimerSay(nId, 9, 0, 10)) then
		return;
	-- ở lượng máu thấp sinh 9đích thì hậu nói một lời 
	elseif (self:OnLifePercentSay(nId, 9)) then
		return;	
	-- ở lượng máu thấp sinh 49đích thì hậu nói một lời 
	elseif (self:OnLifePercentSay(nId, 49)) then
		return;	
	-- ở lượng máu thấp sinh 90đích thì hậu nói một lời 
	elseif (self:OnLifePercentSay(nId, 90)) then
		return;	
	-- đang bị công kích đích thì hậu nói một lời 
	elseif (self:OnLifePercentSay(nId, 100)) then
		return;
	end;
end

-- đương lượng máu ở nhất định tỉ lệ phần trăm đích thì hậu nói chuyện 
function tbBaiZhanJi_Fight:OnLifePercentSay(nId, nLifePercent)
	local pNpc = KNpc.GetById(nId);
	assert(pNpc);
	local nSubWorld,_,_ = pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	local nPercent = (pNpc.nCurLife / pNpc.nMaxLife) * 100;
	if (nPercent <nLifePercent and not self.tbLifePercentSay[nLifePercent]) then
		pNpc.SendChat(self.tbOnLifeSayText[nLifePercent]);
		self.tbLifePercentSay[nLifePercent] = true;
		tbInstancing.nBaiZhanJiCurSec = 0;
		return true;
	else 
		return false;
	end;
end;

-- đương lượng máu ở nhất định phạm vây nội cách mỗi nhất định thời gian thuyết một lần thoại 
function tbBaiZhanJi_Fight:OnTimerSay(nId, nLifeMax, nLifeMin, nTime)
	local pNpc = KNpc.GetById(nId);
	assert(pNpc);
	local nSubWorld,_,_ = pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	local nPercent = (pNpc.nCurLife / pNpc.nMaxLife) * 100;
	if (nPercent <= nLifeMax and nLifeMin <= nPercent and tbInstancing.nBaiZhanJiCurSec % nTime == 0) then
		local nTextId = MathRandom(#self.tbOnTimerSayText[nLifeMax]);
		pNpc.SendChat(self.tbOnTimerSayText[nLifeMax][nTextId]);
		tbInstancing.nBaiZhanJiCurSec = 0;
		return true;
	else 
		return false;	
	end;	
end;

-- đối thoại bách trảm cát 
local tbBaiZhanJi_Dialog = Npc:GetClass("fnsbaizhanjidialog");

function tbBaiZhanJi_Dialog:OnDialog()
	local tbPlayerTask = Task:GetPlayerTask(me) --thu được ngoạn gia đích nhiệm vụ 
	local tbOpt = {};
	local szMsg = string.format("%s：đi khai đi khai ，ta tối đáng ghét các ngươi việc này gã sai vặt ！", him.szName);
	
	local tbTask = tbPlayerTask.tbTasks[0x122];
	
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	if (tbTask and tbTask.nSubTaskId == 0x1D1 and tbTask.nCurStep == 4 and tbInstancing.BAIZHANJI_IS_OUT == 0) then
		szMsg = string.format("%s：ngươi là ai ？ngươi là chẩm ma lăn lộn tiến lai đích ？", him.szName);
		tbOpt[#tbOpt + 1] = {"【bắt đầu chiến đấu 】", self.Fight, self, me.nId, him.dwId};
	end
	
	local tbTask = tbPlayerTask.tbTasks[0x12E];
	if (tbTask and tbTask.nSubTaskId == 0x1DD and tbTask.nCurStep == 4 and tbInstancing.BAIZHANJI_IS_OUT == 0) then
		szMsg = string.format("%s：ngươi là ai ？ngươi là chẩm ma lăn lộn tiến lai đích ？", him.szName);
		tbOpt[#tbOpt + 1] = {"【bắt đầu chiến đấu 】", self.Fight, self, me.nId, him.dwId};
	end

	tbOpt[#tbOpt+1]	= {"【kết thúc đối thoại 】"};
	Dialog:Say(szMsg, tbOpt);
end

function tbBaiZhanJi_Dialog:Fight(nPlayerId,nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	if (not pPlayer or not pNpc) then
		return;
	end;
	
	local nSubWorld, nNpcPosX, nNpcPosY = pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	if (tbInstancing.BAIZHANJI_IS_OUT ~= 0) then
		return;
	end
	local pBaiZhanJi = KNpc.Add2(4111, tbInstancing.nNpcLevel, -1, nSubWorld, nNpcPosX, nNpcPosY);
	assert(pBaiZhanJi);
	Task.tbToBeDelNpc[pBaiZhanJi.dwId] = 1;
	
	tbInstancing.nBaiZhanJiCurSec = 0;
	tbInstancing.BAIZHANJI_IS_OUT = 1;
	local tbNpc = Npc:GetClass("fnsbaizhanjifight");

	tbInstancing.nBzhjTimerId = Timer:Register(Env.GAME_FPS, tbNpc.OnBreath, tbNpc, pBaiZhanJi.dwId);
	tbInstancing.nFnsBaiZhanJiId = pBaiZhanJi.dwId;
	
	KTeam.Msg2Team(pPlayer.nTeamId,"<color=yellow>và bách trảm cát đích chiến đấu đã bắt đầu <color>！");
	pNpc.Delete();
end

		
