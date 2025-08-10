-------------------------------------------------------
-- văn kiện danh 　：yicengnpc.lua
-- văn kiện miêu tả ：phó bản nhất tằng NPCcước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-16 10:54:32
-------------------------------------------------------

local tbNpc = Npc:GetClass("hl_guess1");

tbNpc.tbDesc = {
		"đệ nhất luân du hí khai khải ：đáp án tương ở <color=red>6-36<color>giữa tùy ki sinh sản 。",
		"đệ nhị luân du hí khai khải ：đáp án tương ở <color=red>5-30<color>giữa tùy ki sinh sản 。",
		"đệ tam luân du hí khai khải ：đáp án tương ở <color=red>4-24<color>giữa tùy ki sinh sản 。",
	}

tbNpc.GUESS_GIFT = {
				{"bạch ngân bảo rương", 18, 1, 331, 1},
				{"thanh đồng bảo rương", 18, 1, 332, 1},
				{"hắc thiết bảo rương", 18, 1, 333, 1},
		}

function tbNpc:OnInit(tbInstancing, nMin, nMax)
	tbInstancing.nCurGuessPlayer 	= 0;

	tbInstancing.nCurGuess1No		= nMin - 1;
	tbInstancing.nGuess1Max			= nMax;
	
	tbInstancing.nOpen1 			= 1;
	tbInstancing.nGuessState1		= 0;
	tbInstancing.nGuessNo1			= MathRandom(nMax - nMin) + nMin;
	tbInstancing.nPassGuess			= {};
	tbInstancing.nReturnGuess		= {};
end;

function tbNpc:OnDialog()
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	if (tbInstancing.nOpenJiGuan ~= 4) then
		return;
	end;
	
	if (tbInstancing.nGuessState1 == 0) then
		local tbOpt = {
			{"bắt đầu du hí", self.GuessStart, self, tbInstancing},
			{"kết thúc đối thoại"},
		}
		Dialog:Say(self.tbDesc[tbInstancing.nYiCengGuessCount + 1], tbOpt);	
	end;
	if (tbInstancing.nGuessState1 == 1) then
		local pPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
		if (not pPlayer) then -- nếu như lúc này sai chữ ngoạn gia mất ，tắc vị kế tiếp 
			pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
		end;
		
		if (not pPlayer) then -- phó bản trung không ai liễu ，ra lổi phản hồi 
			return;
		end;
		tbInstancing.nCurGuessPlayer = pPlayer.nId;
		
		if (me.nId == tbInstancing.nCurGuessPlayer) then
			local szMsg ="thỉnh đăng khan ："
			local nNo = tbInstancing.nCurGuess1No;
			local tbOpt = {
					{string.format("%d", nNo + 1), self.InputNo, self, me.nId, him.dwId, tbInstancing, 1},
					{string.format("%d,%d", nNo + 1, nNo + 2), self.InputNo, self, me.nId, him.dwId, tbInstancing, 2},
					{string.format("%d,%d,%d", nNo + 1, nNo + 2, nNo + 3), self.InputNo, self, me.nId, him.dwId, tbInstancing, 3},
				};
			if (not tbInstancing.nPassGuess[tbInstancing.nCurGuessPlayer] or tbInstancing.nPassGuess[tbInstancing.nCurGuessPlayer] ~= 1) then
				if (not tbInstancing.nReturnGuess[tbInstancing.nCurGuessPlayer] or tbInstancing.nReturnGuess[tbInstancing.nCurGuessPlayer] ~= 1) then
					tbOpt[#tbOpt + 1] = {"thông qua", self.InputNo, self, me.nId, him.dwId, tbInstancing, 4};
					tbOpt[#tbOpt + 1] = {"phản hồi", self.InputNo, self, me.nId, him.dwId, tbInstancing, 5};
				end;
			end;
			Dialog:Say(szMsg, tbOpt);
		else
			Dialog:SendInfoBoardMsg(me,"ngài bây giờ bất năng sai điểm ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			me.Msg("ngài bây giờ bất năng sai điểm ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
		end;
	end;
end;

function tbNpc:GuessStart(tbInstancing)
	if (tbInstancing.nGuessState1 ~= 0) then
		return;
	end;
	
	tbInstancing:SetGuessTable(tbInstancing.tbGuessTable);
	Lib:SmashTable(tbInstancing.tbGuessTable);
	local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
	if (pPlayer ~= nil) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Dialog:SendInfoBoardMsg(teammate,"sai điểm du hí bắt đầu ，bản luân đích đáp án ở <color=green>"..(tbInstancing.nCurGuess1No + 1).."-".. tbInstancing.nGuess1Max.."<color>giữa ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			teammate.Msg("sai điểm du hí bắt đầu ，bản luân đích đáp án ở <color=green>"..(tbInstancing.nCurGuess1No + 1).."-".. tbInstancing.nGuess1Max.."<color>giữa ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
		end;
		
		if (tbInstancing.nGuessTimerId) then
			Timer:Close(tbInstancing.nGuessTimerId);
			tbInstancing.nGuessTimerId = nil;
		end;
		tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, him.dwId, tbInstancing);
		tbInstancing.nCurGuessPlayer = pPlayer.nId;
		tbInstancing.nGuessState1 = 1;
	end;
end;

function tbNpc:OnBreath(nId, tbInstancing)
	local pPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
	if (not pPlayer) then
		return;
	end;

	if (tbInstancing.nGuessTimerId) then
		Timer:Close(tbInstancing.nGuessTimerId);
		tbInstancing.nGuessTimerId = nil;
	end;
			
	local nNo = MathRandom(3);
	local szMsg ="<color=green>";
	for i = 1, nNo do
		local n = tbInstancing.nCurGuess1No + i;
		szMsg = szMsg.. n.."";
	end;
	szMsg = szMsg.."<color>";
	Dialog:SendInfoBoardMsg(pPlayer,"ngài ở 30miểu nội vị sai điểm ，hệ thống vi ngài tuyển tùy ki trạch liễu".. szMsg.."。");
	pPlayer.Msg("ngài ở 30miểu nội vị sai điểm ，hệ thống vi ngài tuyển tùy ki trạch liễu".. szMsg.."。");
	self:InputNo(pPlayer.nId, nId, tbInstancing, nNo);
	return 0;
end;
	
function tbNpc:InputNo(nId, dwId, tbInstancing, nCount)
	if(nId ~= tbInstancing.nCurGuessPlayer) then
		return;
	end;
	
	if (tbInstancing.nGuessTimerId) then
		Timer:Close(tbInstancing.nGuessTimerId);
		tbInstancing.nGuessTimerId = nil;
	end;
	local pCurPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	
	if (nCount == 4) then
		local pCurPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
		local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Dialog:SendInfoBoardMsg(teammate,"<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>thông qua <color>，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			teammate.Msg("<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>thông qua <color>，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			tbInstancing.nCurGuessPlayer = pPlayer.nId;
		end;
		
		if (tbInstancing.nGuessTimerId) then
			Timer:Close(tbInstancing.nGuessTimerId);
			tbInstancing.nGuessTimerId = nil;
		end;
	
		tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, dwId, tbInstancing);
		tbInstancing.nPassGuess[pCurPlayer.nId] = 1;
	elseif (nCount == 5) then
		local pCurPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
		tbInstancing.tbGuessTable = tbInstancing:ConverseTable(tbInstancing.tbGuessTable);
		local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Dialog:SendInfoBoardMsg(teammate,"<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>phản hồi <color>，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			teammate.Msg("<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>phản hồi <color>，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			tbInstancing.nCurGuessPlayer = pPlayer.nId;
		end;
		
		if (tbInstancing.nGuessTimerId) then
			Timer:Close(tbInstancing.nGuessTimerId);
			tbInstancing.nGuessTimerId = nil;
		end;
	
		tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, dwId, tbInstancing);
		tbInstancing.nReturnGuess[pCurPlayer.nId] = 1;
	else
		if (tbInstancing.nGuessNo1>= tbInstancing.nCurGuess1No + 1 and tbInstancing.nGuessNo1 <= tbInstancing.nCurGuess1No + nCount) then
			tbInstancing.nYiCengGuessCount = tbInstancing.nYiCengGuessCount + 1;
			if (tbInstancing.nYiCengGuessCount ~= 3) then
				for _, teammate in ipairs(tbPlayList) do
					Dialog:SendInfoBoardMsg(teammate,"thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，thỉnh tiến hành tiếp theo luân sai điểm");
					teammate.Msg("thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，thỉnh tiến hành tiếp theo luân sai điểm");
				end;
				if (tbInstancing.nYiCengGuessCount == 1) then
					self:OnInit(tbInstancing, 5, 30);
				elseif (tbInstancing.nYiCengGuessCount == 2) then
					self:OnInit(tbInstancing, 4, 24);
				end;
				
				tbInstancing.tbYiCengWinner[tbInstancing.nYiCengGuessCount] = pCurPlayer.nId;
			else
				tbInstancing.tbYiCengWinner[tbInstancing.nYiCengGuessCount] = pCurPlayer.nId;
				self:GameOver(dwId, tbInstancing);
			end;
		else
			local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
			if not pPlayer then -- gia tằng phán đoán zounan
				return;
			end	
			local szMsg ="";
			for i = tbInstancing.nCurGuess1No + 1, tbInstancing.nCurGuess1No + nCount do
				szMsg = szMsg.. i.."";
			end;
			for _, teammate in ipairs(tbPlayList) do
				Dialog:SendInfoBoardMsg(teammate,"<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>".. szMsg.."<color>，vị đoán đúng đáp án ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
				teammate.Msg("<color=yellow>".. pCurPlayer.szName.."<color>đăng khan <color=green>".. szMsg.."<color>，vị đoán đúng đáp án ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			end;
			
			if (tbInstancing.nGuessTimerId) then
				Timer:Close(tbInstancing.nGuessTimerId);
				tbInstancing.nGuessTimerId = nil;
			end;
	
			tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, dwId, tbInstancing);
			tbInstancing.nCurGuess1No = tbInstancing.nCurGuess1No + nCount;
			tbInstancing.nCurGuessPlayer = pPlayer.nId;
		end;
	end;
end;

function tbNpc:GameOver(nNpcId, tbInstancing)
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	local pCurPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
	
	for _, teammate in ipairs(tbPlayList) do
		local nWinCount = 1;
		for i = 1, #tbInstancing.tbYiCengWinner do
			if (tbInstancing.tbYiCengWinner[i] == teammate.nId) then
				nWinCount = nWinCount + 1;
			end;
		end;
		if (self.GUESS_GIFT[nWinCount]) then
			if (teammate.CountFreeBagCell()>= 1) then
				teammate.AddItem(self.GUESS_GIFT[nWinCount][2], self.GUESS_GIFT[nWinCount][3], self.GUESS_GIFT[nWinCount][4], self.GUESS_GIFT[nWinCount][5])
			else
				local nMapId, nPosX, nPosY = teammate.GetWorldPos();
				local pItem = KItem.AddItemInPos(nMapId, nPosX, nPosY, self.GUESS_GIFT[nWinCount][2], self.GUESS_GIFT[nWinCount][3], self.GUESS_GIFT[nWinCount][4], self.GUESS_GIFT[nWinCount][5], 0, 0, 0, nil, nil, 0, 0, teammate);
				pItem.SetOnlyBelongPick(1);
			end;
			Dialog:SendInfoBoardMsg(teammate,"thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，du hí kết thúc 。ngài thu được liễu một <color=yellow>".. self.GUESS_GIFT[nWinCount][1].."<color>!");
			teammate.Msg("thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，du hí kết thúc 。ngài thu được liễu một <color=yellow>".. self.GUESS_GIFT[nWinCount][1].."<color>!");
		else
			Dialog:SendInfoBoardMsg(teammate,"thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，du hí kết thúc 。"); 
			teammate.Msg("thật bất hạnh <color=yellow>".. pCurPlayer.szName.."<color>đoán được không may sổ tự ，du hí kết thúc 。"); 
		end;
	end;
	
	local pNpc = KNpc.GetById(nNpcId);
	local nPosX = 58912 / 32;
	local nPosY = 102752 / 32;
	if (pNpc) then
		local _, nX, nY = pNpc.GetWorldPos();
		nPosX = nX;
		nPosY = nY;
		
		pNpc.Delete();
	end;
	
	local pNpc = KNpc.Add2(4226, 120, -1, tbInstancing.nMapId, nPosX, nPosY);
	pNpc.szName ="nhị tằng mật thất nhập khẩu";
end;

-- nhất tằng ki quan ，dựa theo phong lâm Hỏa sơn thuận tự khai khải 
local tbJiGuan = Npc:GetClass("hl_jiguan");

tbJiGuan.szDesc ="nhất tằng ki quan";
tbJiGuan.szText ="<npc=4224>：các ngươi tìm được rồi ta ，tốt ，thế nhưng nếu muốn thông qua ở đây ，các ngươi phải giúp ta tìm được tam cá đáp án 。<end><npc=4224>：đã quên thuyết liễu ，đáp trả sổ chữ nhân sẽ đã bị trừng phạt 。<end><npc=4224>：nghĩ xong tựu bắt đầu du hí ，các ngươi tha hồ hưởng thụ ba ，ha ha ha ha ……<end>";

function tbJiGuan:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nOpenJiGuan == 4) then
		return;
	end;
	
	local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
	}
	GeneralProcess:StartProcess("đang mở trụ", 5 * 18, {self.OnOpen, self, him.dwId, me.nId, tbInstancing}, {me.Msg,"mở trụ bị đánh đoạn ！"}, tbEvent);
end;

function tbJiGuan:OnOpen(dwNpcId, nPlayerId, tbInstancing)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pNpc = KNpc.GetById(dwNpcId);
	if (not pPlayer or not pNpc) then
		return;
	end;
	
	if (tbInstancing.nOpenJiGuan>= 4) then
		return;
	end;
	
	local tbNpcData = pNpc.GetTempTable("Task"); 
	assert(tbNpcData);

	if (tbNpcData.nNo ~= (tbInstancing.nOpenJiGuan + 1)) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Task.tbArmyCampInstancingManager:ShowTip(teammate,"khai khải thuận tự bất đúng ，thỉnh tòng phong một lần nữa khai khải!");
			teammate.Msg("khai khải thuận tự bất đúng ，thỉnh tòng phong một lần nữa khai khải!");
		end;
		tbInstancing.nOpenJiGuan = 0;
		return;
	end;
	
	tbInstancing.nOpenJiGuan = tbInstancing.nOpenJiGuan + 1;
	pPlayer.Msg("mở trụ thành công ！");
	
	if (tbInstancing.nOpenJiGuan == 4) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			teammate.NewWorld(tbInstancing.nMapId, 58880 / 32, 102688 / 32);
			tbInstancing:OnCoverBegin(teammate);
			teammate.SetFightState(1);
			
			Setting:SetGlobalObj(teammate);
			TaskAct:Talk(self.szText);
			Setting:RestoreGlobalObj();		
		end;	
			
		-- sai điểm NPC
		KNpc.Add2(4224, 120, -1, tbInstancing.nMapId, 58912 / 32, 102752 / 32);
	end;
end;

-- nhất tằng chỉ dẫn 
local tbZhiYin = Npc:GetClass("hl_yindao1");

tbZhiYin.szDesc ="nhất tằng chỉ dẫn";

tbZhiYin.szText ="tả cấp sau này người của môn ：\n  tìm được bốn bề Kình Thiên Trụ ，dựa theo <color=red>phong ，lâm ，Hỏa ，sơn <color>đích thuận tự khai khải ，du long hội rớt xuống ，dựa theo chỉ thị của hắn ，đoán ra tam cá mật mã ，tựu hội xuất hiện hạ tằng đích thông đạo ，thế nhưng ，<color=red>sai đối người của sẽ nỗ lực đại giá <color>。"

tbZhiYin.szDianShu ="sai điểm du hí quy tắc ：\n  1， đầu tiên do hệ thống ở quy định phạm vây nội giữa tùy ki thiêu một sổ tự （tam luân đích phạm vây phân biệt thị 6-36，5-30，4-24）。\n  2， ngoạn gia luân lưu báo sổ ，thứ một ngoạn gia tòng ít nhất sổ tự bắt đầu báo ，dĩ đệ nhất luân vi lệ ，khả dĩ báo 6，67，678，tam chủng đăng khan phương thức ，nếu như báo sổ trung không có hệ thống tuyển định sổ tự ，tắc an toàn thông qua 。đệ nhị cá ngoạn gia kéo dài thứ một ngoạn gia đích báo sổ thuận tự đi xuống báo ，cũng là tam chủng đăng khan ，dĩ thử loại thôi nếu có một vị ngoạn gia đích báo sổ cùng hệ thống chọn trúng đích sổ tự tương đồng ，vậy hắn tựu thâu rớt bỉ tái 。\n  3， ở sổ chữ tam chủng tổ hợp đăng khan ở ngoài ，ngoạn gia hoàn khả dĩ đăng khan thông qua và phản hồi ，cố danh tư nghĩa ，cảm thấy sau sổ tự nguy hiểm ，đăng khan thông qua nhà dưới không báo sổ ，có lẽ phản hồi cấp nhà trên báo sổ ，tương báo sổ đích thuận tự nghịch lại đây 。ở một ván bỉ tái trung ，ngoạn gia chỉ năng đăng khan một lần thông qua có lẽ phản hồi ，sử dụng sau khi ，này hai cái tuyển hạng tương sẽ không ở mặt bản trung xuất hiện 。\n  4， đương một ngoạn gia đoán đúng không may sổ tự ，tắc bị tiêu ký vi thâu rơi bản luân bỉ tái 。đợi cho tam luân kết thúc hậu ，dựa theo tống hợp thành tích ban phát tưởng lệ ，một lần vị thâu người tưởng lệ tối cao 。";

function tbZhiYin:OnDialog()
	Dialog:Say(self.szText, 
			{
				{"sai điểm quy tắc", self.Say, self},
				{"kết thúc đối thoại"},	
			}
		);
end;

function tbZhiYin:Say()
	Dialog:Say(self.szDianShu, 
			{
				{"kết thúc đối thoại"},	
			}
		);	
end;

-- nhất tằng khai BOSS2ki quan 
local tbJiGuan = Npc:GetClass("hl_round2");

tbJiGuan.szDesc ="nhất tằng khai BOSS2khai quan";
tbJiGuan.szText ="<npc=4182>：ta văn đến rồi người sống vị đạo ，ta bảo đao đã đã lâu không có thường quá tươi máu 。"
tbJiGuan.EFFECT_NPC	= 2976

function tbJiGuan:OnDialog()
	local nMapId,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);

	if (not tbInstancing or tbInstancing.nBoss2Out ~= 0) then
		return;
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Setting:SetGlobalObj(teammate);
		TaskAct:Talk(self.szText, self.TalkEnd, self, him.dwId, tbInstancing);
		Setting:RestoreGlobalObj();
	end;	
end;

function tbJiGuan:TalkEnd(dwId, tbInstancing)

	local pNpc = KNpc.GetById(dwId);
	if (not pNpc) then
		return;
	end;
	
	local nMapId, nPosX, nPosY	= pNpc.GetWorldPos();
	pNpc.Delete();
	
	local pNpc = KNpc.Add2(self.EFFECT_NPC, 10, -1, tbInstancing.nMapId, nPosX, nPosY);
	Timer:Register(5 * Env.GAME_FPS, self.CallBoss, self, nMapId, pNpc.dwId);
end;

function tbJiGuan:CallBoss(nMapId, nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;	
	end;

	local nMapId, nPosX, nPosY	= pNpc.GetWorldPos();
	pNpc.Delete();
		
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);
	if (not tbInstancing or tbInstancing.nBoss2Out == 1) then
		return 0;
	end;
		
	local pNpc = KNpc.Add2(4182, tbInstancing.nNpcLevel, -1, nMapId, nPosX, nPosY);
	pNpc.CastSkill(1163, 10, -1, pNpc.nIndex);
	for i = 1, 9 do
		pNpc.AddLifePObserver(i * 10);
	end;
	tbInstancing.nBoss2Out = 1;	
	return 0;
end;

local tbBoss2 = Npc:GetClass("hl_boss2");

tbBoss2.szDesc ="BOSS2"
tbBoss2.tbText = {
			[90] ="không được các ngươi nhiễu loạn chủ nhân nghỉ ngơi ，đi tìm chết ba 。",
			[80] ="Kim quốc đệ nhất đao khách không có thể như vậy lãng đắc hư danh đích 。",
			[70] ="không ai có thể thông qua ở đây ，không ai 。",
			[60] ="ta thiêu ，ta thiêu ，ta thiêu thiêu thiêu 。",
			[50] ="đêm nay gia cá thái ，ta muốn đem ngươi môn biến thành thiêu khảo đích món ăn thôn quê 。",
			[40] ="người xâm lăng ，cách sát vật luận 。",
			[30] ="ta muốn xuất toàn lực liễu ，xem chiêu 。。",
			[20] ="có thể đem ta ép đáo trình độ như vậy ，vẫn lần đầu tiên 。",
			[10] ="hoàn nhan không phá thì khắc canh giữ ở chủ nhân bên cạnh 。",
			[0] ="<npc=4182>：các ngươi thắng liễu ，quá khứ ba ，mong muốn các ngươi bả việc này lực lượng dùng ở chính nghĩa chuyện nghiệp thượng ，đại địa mẫu thân cùng ngươi cùng tồn tại 。",
	}
function tbBoss2:OnLifePercentReduceHere(nLifePercent)	
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	
	if (self.tbText[nLifePercent]) then
		him.SendChat(self.tbText[nLifePercent]);
		
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			teammate.Msg(self.tbText[nLifePercent], him.szName);
		end;
	end;
end;

function tbBoss2:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	tbInstancing.nTrap4Pass = 1;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(nSubWorld);
	for _, teammate in ipairs(tbPlayList) do
		Setting:SetGlobalObj(teammate);
		TaskAct:Talk(self.tbText[0]);
		Setting:RestoreGlobalObj();
	end;
	
	local pNpc = KNpc.Add2(4151, 120, -1, tbInstancing.nMapId, 56192 / 32, 110528 / 32);
	pNpc.szName ="";
end;

local tbSend1 = Npc:GetClass("hl_ceng1send");

tbSend1.szDesc 		="sai sổ tự 1hậu đích truyện tống môn"
tbSend1.tbSendPos 	= {1788, 3293}; 

function tbSend1:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	Dialog:Say("có hay không truyện tống ？", 
		{"hảo", self.Enter, self, me.nId, tbInstancing},
		{"tạm thì không đi"})
end;

function tbSend1:Enter(nPlayerId, tbInstancing)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;
	
	me.NewWorld(tbInstancing.nMapId, self.tbSendPos[1], self.tbSendPos[2]);
end;
