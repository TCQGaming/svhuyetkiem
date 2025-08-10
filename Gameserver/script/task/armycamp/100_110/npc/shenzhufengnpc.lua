-----------------------------------------------------------
-- văn kiện danh 　：shenzhufengnpc.lua
-- văn kiện miêu tả ：thần chu ngọn núi NPCcước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 20:39:28
-----------------------------------------------------------

-- la 
local tbLuo = Npc:GetClass("luo");
-- truyện tống ngoạn gia đích vị trí 
tbLuo.tbPlayerPos = {1952, 2896};

tbLuo.tbPlayText = {"ai , là ai đã gõ chiêng ầm ĩ thật không thể tha thứ！","Thần Chu Sứ"};

-- cà ra con trùng con đích vị trí 
tbLuo.tbZhiZhuYouChongPos = { {1952, 2885}, {1946, 2907}, {1942, 2897}, {1945, 2888}, {1959, 2906}, {1953, 2910}, {1959, 2888}, {1962, 2897},}
-- xao la 
function tbLuo:OnDialog()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	-- khả dĩ gõ trống thì không thể gõ lại la 
	if (tbInstancing.nPlayDrumCount == 1) then
		return;
	end;
	-- thời gian có hay không đáo 
	if (tbInstancing.nPlayDrumTime ~= 0) then
		me.Msg("ngươi hoàn nhu chờ".. tbInstancing.nPlayDrumTime.."miểu mới có thể tiếp theo xao la");
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
		-- truyền phát tin âm nhạc 
	local szMsg 	="setting\\audio\\obj\\ss034.wav"; 
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.CallClientScript({"PlaySound", szMsg, 3});
	end;
	GeneralProcess:StartProcess("Gõ Chiêng", 5 * Env.GAME_FPS, {self.OnPlay, self, me.nId, tbInstancing, nSubWorld}, {self.BreakPlay, self, me.nId, tbPlayList, szSound,"bị đánh đoạn ！"}, tbEvent);
end;

function tbLuo:BreakPlay(nPlayerId, tbPlayList, szSound, szMsg)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.Msg(szMsg);
	for _, teammate in ipairs(tbPlayList) do
		teammate.CallClientScript({"StopSound", szSound});
	end;	
end;

function tbLuo:OnPlay(nPlayerId, tbInstancing, nSubWorld)
	tbInstancing.nPlayDrumTime = 10;
	
	-- truyện tống 
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbPlayText[1], self.tbPlayText[2]);
		teammate.NewWorld(tbInstancing.nMapId, self.tbPlayerPos[1], self.tbPlayerPos[2]);
		teammate.SetFightState(1);
	end;
	-- bỏ đi con trùng con 
	for i = 1, #tbInstancing.tbWenZhu do
		if (tbInstancing.tbWenZhu[i]) then
			local pNpc = KNpc.GetById(tbInstancing.tbWenZhu[i]);
			if (pNpc) then
				pNpc.Delete();
			end;
		end;
	end;
	tbInstancing.tbWenZhu = {};
	-- một lần nữa cà ra con trùng con 
	for i = 1, 5 do
		for i = 1, #self.tbZhiZhuYouChongPos do
			local pYouChong = KNpc.Add2(4131, tbInstancing.nNpcLevel, -1, nSubWorld, self.tbZhiZhuYouChongPos[i][1], self.tbZhiZhuYouChongPos[i][2]);
			assert(pYouChong);
			tbInstancing.tbWenZhu[#tbInstancing.tbWenZhu + 1] = pYouChong.dwId;
		end;
	end;
end;


-- văn châu 
local tbWenZhu = Npc:GetClass("wenzhu");

tbWenZhu.tbDeathText = {"các ngươi việc này tên ，ta hội nhượng các ngươi chết rất khó coi 。","Thần Chu Sứ"};

function tbWenZhu:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then	-- 
		return;
	end;
	
	tbInstancing.nWenZhu = tbInstancing.nWenZhu + 1;
	
	if (tbInstancing.nWenZhu % 10 == 0) then
		local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			teammate.Msg(self.tbDeathText[1], self.tbDeathText[2])
		end;
	end;
	
	if (tbInstancing.nWenZhu>= 200 and tbInstancing.nPlayDrumCount == 0) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Task.tbArmyCampInstancingManager:ShowTip(teammate,"bây giờ đã có thể gõ trống để gọi Thần Chu Sứ ！");
			tbInstancing.nPlayDrumCount = 1;
			for i = 1, #tbInstancing.tbWenZhu do
				if (tbInstancing.tbWenZhu[i]) then
					local pNpc = KNpc.GetById(tbInstancing.tbWenZhu[i]);
					if (pNpc) then
						pNpc.Delete();
					end;
				end;
			end;
			tbInstancing.tbWenZhu = {};
		end;
	end; 
end;


-- Trống 
local tbGu = Npc:GetClass("gu");
-- chu mẫu xuất hiện đích vị trí 
tbGu.tbZhuMuPos = {1976, 2851};

tbGu.tbPlayText = {"các ngươi đây là tự đâm đầu vào lưới！","Thần Chu Sứ"}
-- gõ trống 
function tbGu:OnDialog()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	-- có được hay không bồn chồn 
	if (tbInstancing.nWenZhu <200) then
		me.Msg("chuyện võng đại trận vị phá bất khả gõ trống ！");
		return;
	end;
	-- có hay không đã xao quá Trống 
	if (tbInstancing.nPlayGongCount ~= 0) then
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
	
	-- truyền phát tin âm nhạc 
	local szMsg 	="setting\\audio\\obj\\ss033s.wav"; 
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.CallClientScript({"PlaySound", szMsg, 3});
	end;
	
	GeneralProcess:StartProcess("Gõ trống", 5 * 18, {self.OnPlay, self, me.nId, tbInstancing, nSubWorld}, {self.BreakPlay, self, me.nId, tbPlayList, szSound,"bị đánh đoạn ！"}, tbEvent);	
end;

function tbGu:BreakPlay(nPlayerId, tbPlayList, szSound, szMsg)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.Msg(szMsg);
	for _, teammate in ipairs(tbPlayList) do
		teammate.CallClientScript({"StopSound", szSound});
	end;	
end;

function tbGu:OnPlay(nPlayerId, tbInstancing, nSubWorld)
	-- có hay không đã xao quá Trống 
	if (tbInstancing.nPlayGongCount ~= 0) then
		return;
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbPlayText[1], self.tbPlayText[2])
	end;
	
	tbInstancing.nPlayGongCount = 1;
	local pZhuMu = KNpc.Add2(4132, tbInstancing.nNpcLevel, -1, nSubWorld, self.tbZhuMuPos[1], self.tbZhuMuPos[2]);
	assert(pZhuMu);
	
	pZhuMu.AddLifePObserver(99);
	pZhuMu.AddLifePObserver(90);
	pZhuMu.AddLifePObserver(70);
	pZhuMu.AddLifePObserver(50);
	pZhuMu.AddLifePObserver(30);
	pZhuMu.AddLifePObserver(10);
	
	if (tbInstancing.nLiuYiBanOutCount ~= 0) then
		local pNpc = KNpc.Add2(4155, tbInstancing.nNpcLevel, -1, nSubWorld, 1979, 2855);
		-- pNpc.AddLifePObserver(40);
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"Thần Chu Sứ đã xuất hiện");
	end;
end;

-- chu mẫu 
local tbZhuMu = Npc:GetClass("shenzhushi");

tbZhuMu.tbText = {
	[99] = {"HAHA ngươi đã thất bại","Nhìn không ra các ngươi nhỏ nhắn mà công lực thật thâm hậu"},
	[90] = {"nhân vãng cao xử đi ，Thủy vãng thấp xử lưu ！","Không bằng cách ngươi theo ta vào cổ giáo","Ta hội truyền thụ ngươi luyện cổ đích pháp môn ！"},
	[70] = {"Nếu buông tay lão nương sẽ tha cho ngươi một mạng","Tiểu xúc sinh , ngươi thật sự không biết tốt xấu mà"},
	[50] = {"Chúng ta ngày xưa , không thù không oán","Các ngươi cần gì phải vậy chứ","Tội gì theo ta"},
	[30] = {"Xen tình hình có ổn không","Ta vẫn thấy đào lộ phương hướng kia"},
	[10] = {"Lão nương ta không rảnh cùng ngươi chơi môn này","Này ，ngươi không có khả năng đâu"},
	[0] = {"Ta đánh giá ngươi rất cao","Thần Chu Sứ"},

}
function tbZhuMu:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();

	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	tbInstancing.nShenZhuFengPass = 1;
	
	him.SendChat(self.tbText[0][1]);
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbText[0][1], self.tbText[0][2]);
	end;
	
	if (tbInstancing.nJinZhiShenZhuFeng) then
		local pNpc = KNpc.GetById(tbInstancing.nJinZhiShenZhuFeng);
		pNpc.Delete();
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"Đường tới Linh Hạt Phong đã mở ！");
	end;
end;

function tbZhuMu:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent]);
	
	if (nLifePercent == 10) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			teammate.NewWorld(tbInstancing.nMapId, 1952, 2896);
			teammate.SetFightState(1);
			Task.tbArmyCampInstancingManager:ShowTip(teammate,"Thần Chu Sứ dùng chuyện võng đại trận hãm hại ngươi và của ngươi đội hữu kết quả bị dịch chuyển đi khá xa , hắn vẫn còn ở đó！");
		end;
	end;
end;

-- Chỉ dẫn Thần Thù Phong 
local tbBiWuFengZhiYin = Npc:GetClass("shenzhufengzhiyin");

tbBiWuFengZhiYin.szText =" phía trước Thần Chu Sứ vẫn như cũ văn phong thiết hạ chuyện võng đại trận ，chờ các ngươi tự đầu la võng 。hoàn ở đây trận áo hay ta dĩ tất biết ，bất túc vi cụ 。\n\n  phá trận đích quan kiện thị thần chu ngọn núi đích na mặt la ，<color=red>chỉ yếu xao hưởng la ，thần chu liền hội lầm tưởng là muốn kỳ công kích phong ủng ra ，chỉ yếu thần chu không địch thủ trở ra là được gõ trống nghênh chiến Thần Chu Sứ 。<color>nhu phải chú ý thị ，một ngày la bị xao hưởng ，tất cả mọi người hội bị hút vào đáo trận pháp Trung tâm ，lúc này Văn Thù nhất định phong ủng ra ，nhất định phải cẩn thận ！thiết ký ！thiết ký ！\n\n  chuyện võng đại trận vừa vỡ ，nhưng tốc tốc <color=red>xao hưởng Thần Chu Sứ trước điện đích na mặt trống <color>，thử thị Thần Chu Sứ phóng xuất bản mạng cổ hại nhân đích tấn hào ，chỉ yếu bản mạng cổ phi ra ，Thần Chu Sứ tịnh bất túc vi cụ liễu 。";

function tbBiWuFengZhiYin:OnDialog()
	local tbOpt = {{"kết thúc đối thoại"}, };
	Dialog:Say(self.szText, tbOpt);
end;
