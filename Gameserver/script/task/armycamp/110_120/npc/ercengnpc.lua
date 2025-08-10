-------------------------------------------------------
-- văn kiện danh 　：ercengnpc.lua
-- văn kiện miêu tả ：Hải Lăng Vương Mộ 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-17 08:46:04
-------------------------------------------------------

local tbNpc = Npc:GetClass("hl_guess2");

tbNpc.szDesc ="sổ tự sẽ ở <color=red>1-100<color>giữa tùy ki sinh sản ，thỉnh dựa theo thuận tự bày tỏ các ngươi đích đáp án 。";

function tbNpc:OnInit(tbInstancing, nMin, nMax)

	tbInstancing.nCurGuess2No		= nMin;
	tbInstancing.nGuess2Max			= nMax;
	
	tbInstancing.nGuessState2		= 0;
	tbInstancing.nGuessNo2			= MathRandom(nMax - nMin) + nMin;
end;

function tbNpc:OnDialog()
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	if (tbInstancing.nZhuZiOpen ~= 1) then
		return;
	end;
	
	if (tbInstancing.nGuessState2 == 0) then
		local tbOpt = {
			{"bắt đầu du hí", self.GuessStart, self, tbInstancing, him.dwId},
			{"kết thúc đối thoại"},
		}
		Dialog:Say(self.szDesc, tbOpt);	
	end;
	if (tbInstancing.nGuessState2 == 1) then
		local pPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
		if (not pPlayer) then -- nếu như lúc này sai chữ ngoạn gia mất ，tắc vị kế tiếp 
			pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
		end;
		
		if (not pPlayer) then -- phó bản trung không ai liễu ，ra lổi phản hồi 
			return;
		end;
		tbInstancing.nCurGuessPlayer = pPlayer.nId;
		
		if (me.nId == tbInstancing.nCurGuessPlayer) then
			Dialog:AskNumber("thỉnh thâu nhập ngài đoán điểm ：", tbInstancing.nGuess2Max, self.InputNo, self, tbInstancing, him.dwId, me.nId);
		else
			Dialog:SendInfoBoardMsg(me,"ngài bây giờ bất năng sai điểm ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			me.Msg("ngài bây giờ bất năng sai điểm ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
		end;
	end;
end;

function tbNpc:GuessStart(tbInstancing, dwId)
	if (tbInstancing.nGuessState2 ~= 0) then
		return;
	end;
	
	tbInstancing:SetGuessTable(tbInstancing.tbGuessTable);
	Lib:SmashTable(tbInstancing.tbGuessTable);
	local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
	if (pPlayer ~= nil) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Dialog:SendInfoBoardMsg(teammate,"sai điểm du hí bắt đầu ，đáp án ở <color=green>"..tbInstancing.nCurGuess2No.."-".. tbInstancing.nGuess2Max.."<color>giữa ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
			teammate.Msg("sai điểm du hí bắt đầu ，đáp án ở <color=green>"..tbInstancing.nCurGuess2No.."-".. tbInstancing.nGuess2Max.."<color>giữa ，thỉnh <color=yellow>".. pPlayer.szName.."<color>sai điểm");
		end;
		
		tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, tbInstancing, dwId);
		tbInstancing.nGuessState2 = 1;
		tbInstancing.nCurGuessPlayer = pPlayer.nId;
	end;

end;

function tbNpc:OnBreath(tbInstancing, nNpcId)	
	local pPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
	if (not pPlayer) then
		return;
	end;

	if (tbInstancing.nGuessTimerId) then
		Timer:Close(tbInstancing.nGuessTimerId);
		tbInstancing.nGuessTimerId = nil;
	end;

	local nNo = MathRandom(tbInstancing.nGuess2Max - tbInstancing.nCurGuess2No) + tbInstancing.nCurGuess2No;
	local szMsg ="<color=green>";
	szMsg = szMsg.. nNo;
	szMsg = szMsg.."<color>";
	Dialog:SendInfoBoardMsg(pPlayer,"ngài ở 30miểu nội vị sai điểm ，hệ thống vi ngài tuyển tùy ki trạch liễu".. szMsg.."。");
	pPlayer.Msg("ngài ở 30miểu nội vị sai điểm ，hệ thống vi ngài tuyển tùy ki trạch liễu".. szMsg.."。");
	self:InputNo(tbInstancing, nNpcId, pPlayer.nId, nNo);
	return 0;
end;

function tbNpc:InputNo(tbInstancing, nNpcId, nId, nCount)
	if (nId ~= tbInstancing.nCurGuessPlayer) then
		return;
	end;
	
	if (tbInstancing.nGuessTimerId) then
		Timer:Close(tbInstancing.nGuessTimerId);
		tbInstancing.nGuessTimerId = nil;
	end;
	
	local pCurPlayer = KPlayer.GetPlayerObjById(tbInstancing.nCurGuessPlayer);
	if (tbInstancing.nGuessNo2 == nCount) then
		tbInstancing.nCurGuessPlayer = nil;
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Dialog:SendInfoBoardMsg(teammate,"chúc mừng <color=yellow>".. pCurPlayer.szName.."<color>đoán trúng điểm sổ, thu được liễu một hoàng Kim bảo rương ！");
			teammate.Msg("chúc mừng <color=yellow>".. pCurPlayer.szName.."<color>đoán trúng điểm sổ, thu được liễu một hoàng Kim bảo rương ！");
		end;

		if (pCurPlayer.CountFreeBagCell()>= 1) then
			pCurPlayer.AddItem(18, 1, 330, 1)
		else
			local nMapId, nPosX, nPosY = pCurPlayer.GetWorldPos();
			local pItem = KItem.AddItemInPos(nMapId, nPosX, nPosY, 18, 1, 330, 1,0, 0, 0, nil, nil, 0, 0, pCurPlayer);
			pItem.SetOnlyBelongPick(1);
		end;
		
		tbInstancing.nErCengWinner	= pCurPlayer.nId;
		tbInstancing.nGuessState2 = 2;
		tbInstancing.nTrap5Pass	= 1;
		
		local pNpc = KNpc.GetById(nNpcId);
		if (pNpc) then
			local _, nPosX, nPosY = pNpc.GetWorldPos();
			pNpc.Delete();
			local pNpc = KNpc.Add2(4227, 120, -1, tbInstancing.nMapId, nPosX, nPosY);
			pNpc.szName ="tam tằng mật thất nhập khẩu";
		end;
	else
		local pPlayer = tbInstancing:GetNextPlayerFromTable(tbInstancing.tbGuessTable);
		if not pPlayer then -- gia tằng phán đoán zounan
			return;
		end
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			local szMsg ="";
			
			if (nCount <tbInstancing.nGuessNo2) then
				if (tbInstancing.nCurGuess2No <nCount) then
					tbInstancing.nCurGuess2No = nCount;
				end;
			else
				if (tbInstancing.nGuess2Max> nCount) then
					tbInstancing.nGuess2Max = nCount;
				end;
			end;
			Dialog:SendInfoBoardMsg(teammate,"sổ tự <color=green>".. nCount.."<color>vị đoán đúng ，thỉnh <color=yellow>".. pPlayer.szName.."<color>tiếp theo sai điểm ！đáp án ở <color=green>"..tbInstancing.nCurGuess2No.."-".. tbInstancing.nGuess2Max.."<color>giữa 。");
			teammate.Msg("sổ tự <color=green>".. nCount.."<color>vị đoán đúng ，thỉnh <color=yellow>".. pPlayer.szName.."<color>tiếp theo sai điểm ！đáp án ở <color=green>"..tbInstancing.nCurGuess2No.."-".. tbInstancing.nGuess2Max.."<color>giữa 。");
		end;
		tbInstancing.nGuessTimerId = Timer:Register(Env.GAME_FPS * 30, self.OnBreath, self, tbInstancing, nNpcId);
		tbInstancing.nCurGuessPlayer = pPlayer.nId;
	end;
end;

local tbZhuZi2 = Npc:GetClass("hl_zhuzi2");

tbZhuZi2.szDesc ="nhị tằng Trụ";

function tbZhuZi2:OnDialog()
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	
	if (tbInstancing.tbOpen[him.dwId] ~= 0 or tbInstancing.nZhuZiOpen ~= 0) then
		return;
	end;
	if (tbInstancing.nOpenZhuZiTime ~= 2) then
		--tiến độ điều 
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
		GeneralProcess:StartProcess("đang ở khai khải", 5 * 18, {self.OnOpen, self, him.dwId, me.nId, tbInstancing}, {me.Msg,"khai khải bị đánh đoạn ！"}, tbEvent);
	end;
end;


function tbZhuZi2:OnOpen(nNpcId, nPlayerId, tbInstancing)
	tbInstancing.nOpenZhuZiTime = 1;
	tbInstancing.tbOpen[nNpcId] = 1;
end;

-- nhất tằng khai BOSS2ki quan 
local tbJiGuan = Npc:GetClass("hl_round3");

tbJiGuan.szDesc ="nhị tằng khai BOSS2khai quan";
tbJiGuan.szText ="<npc=4183>：ta chinh phục đích ranh giới bỉ các ngươi thấy qua đích hoàn đa ，phóng mã lại đây ba ，người tuổi trẻ 。"
tbJiGuan.EFFECT_NPC	= 2976
tbJiGuan.tbHuWeiPos = {
		{1762, 3558},
		{1768, 3565},
		{1762, 3571},
		{1765, 3564},
	}
tbJiGuan.tbHuWeiId = {
			4185, 4186, 4187, 4188, 4189, 4190, 
			4191, 4192, 4193, 4194, 4195, 4196, 
			4197, 4198, 4199, 4200, 4201, 4202, 
			4203, 4204, 4205, 4206, 4207, 4208, 
		}
		
function tbJiGuan:OnDialog()
	local nMapId,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);

	if (not tbInstancing or tbInstancing.nBoss3Out ~= 0) then
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
	if (not pNpc or tbInstancing.nBoss3Out == 1) then
		return;
	end;
	local nMapId, nPosX, nPosY	= pNpc.GetWorldPos();
	pNpc.Delete();
	
	local pNpc = KNpc.Add2(self.EFFECT_NPC, 10, -1, tbInstancing.nMapId, nPosX, nPosY);
	Timer:Register(5 * Env.GAME_FPS, self.CallBoss, self, nMapId, pNpc.dwId);
end;

function tbJiGuan:CallBoss(nMapId, dwId)
	local pNpc = KNpc.GetById(dwId);
	if (not pNpc) then
		return 0;	
	end;

	local nMapId, nPosX, nPosY	= pNpc.GetWorldPos();
	pNpc.Delete();
	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);
	if (not tbInstancing or tbInstancing.nBoss3Out == 1) then
		return 0;
	end;
		
	local pNpc = KNpc.Add2(4183, tbInstancing.nNpcLevel, -1, nMapId, nPosX, nPosY);
	pNpc.CastSkill(1163, 10, -1, pNpc.nIndex);
	for i = 1, 9 do
		pNpc.AddLifePObserver(i * 10);
	end;
	tbInstancing.nBoss3Out = 1;	
	
	for i = 1, 4 do
		Lib:SmashTable(self.tbHuWeiId);
		KNpc.Add2(self.tbHuWeiId[i], tbInstancing.nNpcLevel, -1, nMapId, self.tbHuWeiPos[i][1], self.tbHuWeiPos[i][2]);
	end;
end;
-- BOSS3
local tbBoss3 = Npc:GetClass("hl_boss3");

tbBoss3.szDesc ="BOSS3";
tbBoss3.tbText = {
			[90] ="vô nhu ta xuất thủ ，hộ vệ môn trảo thích khách 。",
			[80] ="ta trì sính giang hồ đích thì hậu các ngươi đều hoàn một sinh ra ni 。",
			[70] ="điều không phải ta ỷ già mại lão ，các ngươi không đánh được ta 。",
			[60] ="các ngươi dũng khí có thể tăng ，thế nhưng y theo quân pháp án luật đương trảm 。",
			[50] ="tưởng năm ấy nhạc gia quân cũng muốn nhượng ta ba phần 。",
			[40] ="ta cũng muốn cấp các ngươi nhìn ，lão cẩu cũng có ki khỏa nha 。",
			[30] ="kiên cường trở nên ，ta khung lý lưu đích thế nhưng đại Kim đích máu 。",
			[20] ="đây là cuối cùng nhất kích liễu ，ta sẽ không bại cấp các ngươi đích 。",
			[10] ="bất luận ngươi thành lập nhiều ít phong công vĩ nghiệp ，ngươi đều không cách nào thừa thụ tuế nguyệt đích dày vò 。",
			[0] ="<npc=4183>：đại Kim đích giang sơn khởi thị nhĩ chờ thử bối khả dĩ dao động đích ，các ngươi vĩnh viễn không cách nào chinh phục chúng ta cuồng dã lòng của 。",
	}
function tbBoss3:OnLifePercentReduceHere(nLifePercent)
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

function tbBoss3:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	tbInstancing.nTrap6Pass = 1;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(nSubWorld);
	for _, teammate in ipairs(tbPlayList) do
		Setting:SetGlobalObj(teammate);
		TaskAct:Talk(self.tbText[0]);
		Setting:RestoreGlobalObj();
	end;
	local pNpc = KNpc.Add2(4151, 120, -1, tbInstancing.nMapId, 55840 / 32, 116736 / 32);
	pNpc.szName ="";
end;

local tbErCengSend = Npc:GetClass("hl_ceng2chuansong");

tbErCengSend.szDesc ="nhị tằng truyện tống";

function tbErCengSend:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	Dialog:Say("có hay không tiến nhập ？", 
		{"Tiến vào", self.Enter, self, me.nId, him.dwId, tbInstancing},
		{"tạm thời không đi"})
end;

function tbErCengSend:Enter(nPlayerId, nNpcId, tbInstancing)
	local pNpc = KNpc.GetById(nNpcId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pNpc or not pPlayer) then
		return;
	end;
	local tbData = pNpc.GetTempTable("Task");
	if (not tbData or not tbData.tbNo) then
		return;
	end;
	
	me.NewWorld(tbInstancing.nMapId, tbInstancing.ERCENG_SEND_POS[tbData.tbNo[1]][tbData.tbNo[2]][tbData.tbNo[3]][1] / 32, tbInstancing.ERCENG_SEND_POS[tbData.tbNo[1]][tbData.tbNo[2]][tbData.tbNo[3]][2] / 32);
end;

local tbSend2 = Npc:GetClass("hl_ceng2send");

tbSend2.szDesc 		="sai điểm 2hậu đích truyện tống môn"
tbSend2.tbSendPos 	= {1775, 3490}; 

function tbSend2:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	Dialog:Say("có hay không tiến nhập ？", 
		{"Tiến vào", self.Enter, self, me.nId, tbInstancing},
		{"tạm thời không đi"})
end;

function tbSend2:Enter(nPlayerId, tbInstancing)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;
	
	me.NewWorld(tbInstancing.nMapId, self.tbSendPos[1], self.tbSendPos[2]);
end;


-- nhất tằng chỉ dẫn 
local tbZhiYin = Npc:GetClass("hl_yindao2");

tbZhiYin.szDesc ="nhị tằng chỉ dẫn";

tbZhiYin.szText ="tả cấp sau này người của môn ：\n  tới mê cung góc ，tứ cá nhân <color=red>đồng thời khai khải Quang Ảnh Thạch <color>，du long hội lần thứ hai rớt xuống ，dựa theo chỉ thị của hắn ，đoán đúng đáp án ，tựu hội xuất hiện hạ tằng đích thông đạo ，thế nhưng lần này cùng thượng tằng bất đồng ，<color=red>sai đối người của sẽ xong phong dầy tưởng lệ <color>。"

tbZhiYin.szDianShu ="sai điểm đích du hí quy tắc ：\n  do hệ thống tả ra trong đó ý một sổ tự ，(dĩ 1-100vi lệ ，tả ra 88)，lại do sở hữu du hí người án thuận tự mỗi người thuyết một sổ tự ，mà du hí người bày tỏ đích sổ tự có tam chủng có khả năng ，một bỉ tả tốt đại ，một bỉ tả tốt tiểu ，một vừa lúc, nếu như bỉ tả tốt sổ tự lớn thoại (tỷ như 99)，ra đề người tựu phải biết nhỏ đi phạm vây vì thế du hí người thuyết đích sổ tự cùng nhỏ nhất sổ tự giữa (ra đề người phải nên nói là 1-99)，lại do hạ một du hí người bày tỏ một sổ tự, nếu như bỉ tả tốt sổ tự tiểu nếu (tỷ như 11)，ra đề người tựu phải biết nhỏ đi phạm vây vì thế du hí người thuyết đích sổ tự cùng lớn nhất sổ tự giữa (ra đề người phải nên nói là 11-100)，lại do hạ một du hí người bày tỏ một sổ tự ，(tái kéo dài một chút ，hạ một du hí người thuyết 90，ra đề người thuyết 11-90，tái tiếp theo du hí người thuyết 60，ra đề người thuyết 60-90，lần lượt loại thôi) thẳng đến du hí người bày tỏ ra đề người tả ra sổ tự ，du hí kết thúc 。"

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
