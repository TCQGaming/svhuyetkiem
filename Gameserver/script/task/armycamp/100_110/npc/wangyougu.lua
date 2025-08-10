-----------------------------------------------------------
-- văn kiện danh 　：wangyougu.lua
-- văn kiện miêu tả ：quên ưu cốc cước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-12-12 09:38:03
-----------------------------------------------------------

-- Hỏa Bồng xuân đối thoại 
local tbHuoPengChen_Dialog = Npc:GetClass("huopengchen_dialog");

tbHuoPengChen_Dialog.tbNeedItemList = { {20, 1, 624, 1, 1}, {20, 1, 625, 1, 1}};

function tbHuoPengChen_Dialog:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	if (tbInstancing.nHuoPengChenOut ~= 0) then
		return;
	end;
	
	local szMsg ="cổn viễn điểm ，lão đầu Tử hựu nhượng các ngươi lai chịu chết mạ ？";
	Dialog:Say(szMsg,
		{
			{"cấp tĩnh tâm châu và thư tín", self.Give, self, tbInstancing, me.nId, him.dwId},
			{"kết thúc đối thoại"}
		});
	
end;

function tbHuoPengChen_Dialog:Give(tbInstancing, nPlayerId, nNpcId)
	Task:OnGift("việc này đông tây ngươi tử tế nhìn ！", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId, nNpcId}, nil, {self.CheckRepeat, self, tbInstancing}, true);
end;

function tbHuoPengChen_Dialog:CheckRepeat(tbInstancing)
	if (tbInstancing.nHuoPengChenOut == 1) then
		return 0;
	end	
	return 1; 
end

function tbHuoPengChen_Dialog:Pass(tbInstancing, nPlayerId, nNpcId)
	if (tbInstancing.nHuoPengChenOut ~= 0) then
		return;
	end;
	
	local szMsg ="này hạt châu hình như là lão đầu Tử giao cho Ân Đồng cái tiểu nha đầu đích ，chẩm ma hội ở các ngươi trong tay ？còn có này phong thư tín đích bút ký cũng rất quen thuộc ，hình như cũng là Ân Đồng cái tiểu nha đầu đích ，yêm nhìn đều tả liễu ta gì 。<color=yellow>\
   《ta ngu xuẩn 》  《ngọa Xuân 》\
  yêm không có văn hóa （ám mai u văn Hoa ），\
  ta chỉ số thông minh rất thấp （ngọa chi thương hận để ），\
  yếu vấn ta là ai （xa văn ngọa như nước ），\
  vừa đại ngu xuẩn lư （dịch thấu đạt Xuân lục ）。\
  yêm thị lư   （ngạn tự lục ），\
  yêm thị đầu lư  （ngạn tự thấu lục ），\
  yêm thị đầu ngây ngô lư （ngạn tự thấu đại lục ）。<color>";
	
	Dialog:Say(szMsg,
	{
		{"kết thúc đối thoại", self.ChangeFight, self, tbInstancing, nNpcId},
	});
	if (tbInstancing.nHuoPengChenOut == 0 and not tbInstancing.nHuoPengChenTimerId) then
		tbInstancing.nHuoPengChenTimerId = Timer:Register(Env.GAME_FPS * 5, self.OnClose, self, tbInstancing, nNpcId);
	end;
end;

function tbHuoPengChen_Dialog:OnClose(tbInstancing, nNpcId)
	self:ChangeFight(tbInstancing, nNpcId);
	if (tbInstancing.nHuoPengChenTimerId) then
		Timer:Close(tbInstancing.nHuoPengChenTimerId);
		tbInstancing.nHuoPengChenTimerId = nil;
	end;
	return 0;
end;

function tbHuoPengChen_Dialog:ChangeFight(tbInstancing, nNpcId)
	assert(tbInstancing, nPlayerId, nNpcId);
	if (tbInstancing.nHuoPengChenOut ~= 0) then
		return;
	end;
	
	local pNpc = KNpc.GetById(nNpcId);
	local nSubWorld, nPosX, nPosY	= him.GetWorldPos();
	pNpc.Delete();
	
	local pNpc = KNpc.Add2(4145, tbInstancing.nNpcLevel, -1, nSubWorld, nPosX, nPosY);
	tbInstancing.nHuoPengChenOut = 1;
	pNpc.AddLifePObserver(90);
	pNpc.AddLifePObserver(70);
	pNpc.AddLifePObserver(60);
	pNpc.AddLifePObserver(40);
	pNpc.AddLifePObserver(30);
	pNpc.AddLifePObserver(20);
	pNpc.AddLifePObserver(10);
	pNpc.AddLifePObserver(5);
	pNpc.AddLifePObserver(4);
	pNpc.AddLifePObserver(3);
	pNpc.AddLifePObserver(2);
	
	local tbNpc = Npc:GetClass("huopengchen_fight");

	if (tbNpc) then
		tbInstancing:NpcSay(pNpc.dwId, tbNpc.tbSayText[100]);
	end;
	
end;

-- Hỏa Bồng xuân chiến đấu 
local tbHuoPengChen_Fight = Npc:GetClass("huopengchen_fight");

tbHuoPengChen_Fight.tbSayText = {
	[100] = {"Ân Đồng này tiểu nha đầu cuộn phim ！","mọi người đi hoàn không quên ký trêu cợt nhân ！"},
	[90] = {"lão đầu Tử đã không được ba ？","yêm ở phía trên đều nghe nói liễu ！"},
	[70] = {"lão đầu Tử không được ，吖rống ！","na yêm khởi điều không phải hay ở đây đích đầu đầu liễu ？"},
	[60] = {"chờ yêm bả ở đây người của đều thu thập tề lâu ！","khán yêm chẩm ma thu thập ngươi môn ！"},
	[40] = {"yêm nhất định sẽ không cân yêm sư phụ như uất ức ！"},
	[30] = {"yêm nhất định phải nhượng bọn hắn nhìn một cái ！","yêm địa lợi hại ！"},
	[20] = {"đúng... ，còn có Ân Đồng na tiểu nha đầu ！","yêm nhất định phải nắm nàng ！","nhượng nàng cấp yêm đương tức phụ ！"},
	[10] = {"các ngươi thì không thể khinh điểm a ！","a ！yêm đích cổ chẩm ma chiêu không ra lai liễu ？","các ngươi đối yêm làm gì ？"},
	[5] ="nan đạo lão đầu Tử cấp Ân Đồng đích hay ……",
	[4] ="thiên sát đích lão đầu Tử a ！",
	[3] ="ngươi chết đều chết không lanh lẹ a ！",
	[2] ="yêm ……yêm ……",
	[0] ="yêm hận các ngươi ……",
}

function tbHuoPengChen_Fight:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;

	if (nLifePercent <10 and him) then
		him.SendChat(self.tbSayText[nLifePercent]);
		
		local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			teammate.Msg(self.tbSayText[nLifePercent], him.szName);
		end;
		return;
	end;
	
	tbInstancing:NpcSay(him.dwId, self.tbSayText[nLifePercent]);
end;

function tbHuoPengChen_Fight:OnDeath(pNpc)
	-- rơi một bảo rương 
	local nSubWorld, nNpcPosX, nNpcPosY = him.GetWorldPos();
	local pBaoXiang = KNpc.Add2(4113, 1, -1, nSubWorld, nNpcPosX, nNpcPosY);
	assert(pBaoXiang)

	local pPlayer 	= pNpc.GetPlayer();
	pBaoXiang.GetTempTable("Task").nOwnerPlayerId = pPlayer.nId;
	pBaoXiang.GetTempTable("Task").CUR_LOCK_COUNT = 0;
	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"trên mặt đất xuất hiện một thiểm thiểm phát quang đích cái rương ！");
	end;
end;

-- tuyết vũ hồng phi 
local tbXueYuHongFei = Npc:GetClass("xueyuhongfei");

tbXueYuHongFei.tbText = {
	[99] ="các ngươi là cái gì người dám xông vào đáo cấm địa trung lai 。",
	[90] ="ở đây cái gì đều không có ，các ngươi rốt cuộc muốn cái gì ？",
	[70] = {"nan đạo ，nan đạo là hắn ？","thị Hỏa Bồng xuân này tên nhượng các ngươi lai đích ？"},
	[50] = {"các ngươi ？các ngươi đều biết ta cái gì ？","các ngươi biết các ngươi đều ở đây làm chút cái gì ？"},
	[30] ="khán dáng vẻ các ngươi biết chút ít cái gì ？",
	[0] ="các ngươi hội hậu hối đích ！",
}

function tbXueYuHongFei:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (nLifePercent == 50 or nLifePercent == 70) then
		tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent]);
		return;
	end;
		
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbText[nLifePercent], him.szName);
	end;
	him.SendChat(self.tbText[nLifePercent]);
end;
