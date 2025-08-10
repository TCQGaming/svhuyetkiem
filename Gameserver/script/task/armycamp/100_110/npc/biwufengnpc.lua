-----------------------------------------------------------
-- văn kiện danh 　：biwufengnpc.lua
-- văn kiện miêu tả ：cổ ông ，độc hiết con trùng con ，hiết vương 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 18:11:25
-----------------------------------------------------------

-- cổ ông 
local tbGuWeng = Npc:GetClass("guweng");

-- con trùng con ID
tbGuWeng.nYouChongId = 4126;

-- con trùng con xuất hiện đích vị trí 
tbGuWeng.tbYouChongPos = {
	{1777, 3069}, {1784, 3069}, {1787, 3081}, {1779, 3091}, {1773, 3079},
};

-- 
tbGuWeng.tbLifePresent = {99, 90, 80, 70, 30, 10,};

tbGuWeng.tbLifePresentText = {
	[99] = {{"nhị ca ，bọn hắn ở tạp của ngươi thố đàn Tử","thiên tuyệt sử"}, {"bế chủy ，ta cũng không phải không có trường mắt","Bích Ngô Sứ"}},
	[90] = {{"nhị ca ，hoàn ở tạp ！","thiên tuyệt sử"}, {"nhìn nói lại ，ta cổ không có thể như vậy dưỡng lai nhìn ！","Bích Ngô Sứ"}},
	[80] = {{"nhị ca ，của ngươi cổ hình như không đặc biệt lợi hại ！","thiên tuyệt sử"}, {"nói bậy ，ngươi đổng gì ，bây giờ đi đều là không có gì dùng ，lợi hại đích ở hậu đầu ni ！","Bích Ngô Sứ"}},
	[70] = {{"nhị ca ……","thiên tuyệt sử"}, {"bế chủy ！","Bích Ngô Sứ"}},
	[30] = {{"nhị ca ，ta xem ngươi cổ là thật không được ！sợ không phải thúi ba ？","thiên tuyệt sử"}, {"cũng không phải ở ướp dưa muối ，cái gì thối không thúi đích ，phạ cái gì ？xảy ra chuyện có ta nhằm chống ，này đều là ta tiểu hài tử xấu xa ，ta chẩm ma cân bọn hắn kế giác ，truyện đi ra ngoài ta hoàn chẩm ma kiến nhân ？","Bích Ngô Sứ"}},
	[10] = {{"nhị ca ，ta hiểu ngươi ở đây cũng không phải rất an toàn ！","thiên tuyệt sử"}, {"hảo hí hoàn ở hậu đầu ni ！","Bích Ngô Sứ"}},
	[0] = {{"tiểu biết tam ，các ngươi chiết đằng cú liễu ba ？","Bích Ngô Sứ"}, {"bây giờ nhượng các ngươi sổ sổ mã vương da có ki chỉ mắt ！","Bích Ngô Sứ"}},
}

function tbGuWeng:OnLifePercentReduceHere(nLifePercent)
	
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);

	-- tăng thêm con trùng con 
	if (nLifePercent % 7 == 0) then
		for i = 1, #self.tbYouChongPos do
			for j = 1, 2 do
				KNpc.Add2(self.nYouChongId, tbInstancing.nNpcLevel, -1, nSubWorld, self.tbYouChongPos[i][1], self.tbYouChongPos[i][2]);
			end;
		end;
	end;
	
	-- nói chuyện 
	for i = 1, #self.tbLifePresent do 
		if (nLifePercent == self.tbLifePresent[i]) then
			local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
			for _, teammate in ipairs(tbPlayList) do
				teammate.Msg(self.tbLifePresentText[nLifePercent][1][1],self.tbLifePresentText[nLifePercent][1][2]);
				teammate.Msg(self.tbLifePresentText[nLifePercent][2][1],self.tbLifePresentText[nLifePercent][2][2]);
			end;
		end;
	end;
end;

function tbGuWeng:OnDeath(pNpc)
	local nSubWorld,_,_ = him.GetWorldPos();	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
		
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbLifePresentText[0][1][1],self.tbLifePresentText[0][1][2]);
		teammate.Msg(self.tbLifePresentText[0][2][1],self.tbLifePresentText[0][2][2]);
	end;
end;

-- độc hiết con trùng con 
local tbDuXieYouChong = Npc:GetClass("youchong");
-- cần sát đích số lượng 
tbDuXieYouChong.NEED_COUNT		= 100;

-- tử vong thì chấp hành 
function tbDuXieYouChong:OnDeath(pNpc)
	local nSubWorld, nNpcPosX, nNpcPosY = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	
	tbInstancing.nDuXieYouChong = tbInstancing.nDuXieYouChong + 1;
	if (tbInstancing.nDuXieYouChong>= self.NEED_COUNT and tbInstancing.nXieWangOut == 0) then
		local pXieWang = KNpc.Add2(4127, tbInstancing.nNpcLevel, -1, nSubWorld, 1800, 3035);
		assert(pXieWang);
		
		pXieWang.AddLifePObserver(90);
		pXieWang.AddLifePObserver(70);
		pXieWang.AddLifePObserver(50);
		pXieWang.AddLifePObserver(30);
		pXieWang.AddLifePObserver(10);
		tbInstancing.nXieWangOut = 1;
		-- Lưu Nhất Bán 
		if (tbInstancing.nLiuYiBanOutCount ~= 0) then
			local pNpc = KNpc.Add2(4155, tbInstancing.nNpcLevel, -1, nSubWorld, 1804, 3036);
		--	pNpc.AddLifePObserver(60);
		end;
		
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			Task.tbArmyCampInstancingManager:ShowTip(teammate,"Bích Ngô Sứ đã xuất hiện");
		end;
	end;
end;

-- hiết vương 
local tbBiWuShi = Npc:GetClass("biwushi");

tbBiWuShi.tbText = {
	[90] = {"khó trách lão tứ như thế sợ ！hoàn đĩnh đâm tay ！","Đại Lý quốc nội không có như vậy thật là tốt thủ ！","các ngươi thị na lộ cao thủ ，báo thượng danh lai ！"},
	[70] = {{"chẩm ma đích ？khinh thường nhân ？biết ta là ai không ？","ta thế nhưng bách man sơn đích lão đại ！"}, {"nhị ca ，đại tỷ biết hội không cao hứng đích ！","thiên tuyệt sử"}, {"không cao hứng ？nàng cái gì thì hậu cao hứng quá ？","nàng nếu như cao hứng nếu đã sớm là ngươi Nhị tẩu liễu ！"}},
	[50] = {"điểm Tử đâm tay ！","có điểm chịu không nổi ！"},
	[30] = {{"ta xem chúng ta vẫn đi tìm đại tỷ ba ！","thiên tuyệt sử"}, {"ngươi thành tâm xem ta xấu mặt mạ ？","Bích Ngô Sứ"}, {"xấu mặt tổng bỉ một mệnh cường ba ？","thiên tuyệt sử"}},
	[10] = {{"nhị ca ！lưu trứ núi xanh ở hoàn phạ một sài thiêu ？","thiên tuyệt sử"}, {"ai ！phong khẩn xả hô ！","Bích Ngô Sứ"}},
	[0] = {"khán dáng vẻ có điểm chậm ！","chính ngươi chạy trối chết đi thôi ！"}
}

function tbBiWuShi:OnDeath(pNpc)
	local nSubWorld, nNpcPosX, nNpcPosY = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbText[0][1], him.szName);
		teammate.Msg(self.tbText[0][2], him.szName);
	end;
	
	tbInstancing.nBiWuFengPass = 1;
	
	if (not tbInstancing.nJinZhiBiWuFeng) then
		return;
	end;
	
	local pNpc = KNpc.GetById(tbInstancing.nJinZhiBiWuFeng);
	if (pNpc) then
		pNpc.Delete();
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"ngài khả dĩ đi trước thần chu ngọn núi ！");
	end;
end;

function tbBiWuShi:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	if (nLifePercent == 90 or nLifePercent == 50) then
			tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent]);
			him.GetTempTable("Task").tbSayOver = nil;
	end;
	if (nLifePercent == 70) then
		tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent][1]);
		him.GetTempTable("Task").tbSayOver = {self.SayOver, self, him.dwId, self.tbText[nLifePercent]};
	end;
	if (nLifePercent == 30 or nLifePercent == 10) then
		local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
		for _, teammate in ipairs(tbPlayList) do
			for i = 1, #self.tbText[nLifePercent] do
				teammate.Msg(self.tbText[nLifePercent][i][1], self.tbText[nLifePercent][i][2]);
			end;
		end;
	end;
end;

function tbBiWuShi:SayOver(nNpcId, tbText)
	if (not nNpcId or not tbText) then
		return;
	end;
	
	local pNpc = KNpc.GetById(nNpcId);
	local nSubWorld,_,_ = pNpc.GetWorldPos();	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
		
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(tbText[2][1], tbText[2][2]);
	end;
	
	tbInstancing:NpcSay(nNpcId, tbText[3]);
	him.GetTempTable("Task").tbSayOver = nil;
end;

-- Chỉ dẫn Bích Ngô Phong 
local tbBiWuFengZhiYin = Npc:GetClass("biwufengzhiyin");

tbBiWuFengZhiYin.szText =" quá kiều xử đó là bích ngô ngọn núi ，thử xử do Bích Ngô Sứ gác 。Bích Ngô Sứ trước đây bối tự cho mình là ，đối hậu bối cũng không chúa động xuất thủ 。nếu muốn cùng hắn giao thủ ，phải tương kỳ làm tức giận 。\n\n  để cho các ngươi trải qua bích ngô ngọn núi hội thấy một to lớn cổ hủ ，thử thị Bích Ngô Sứ luyện cổ sở dụng 。<color=red>chỉ yếu công kích thử hủ ，hủ nội đích cổ vật tất hội nhẫn nại không được đi thương nhân ，cổ vật thương hơn liễu ，Bích Ngô Sứ tự nhiên hội nhẫn nại không được 。<color>";

function tbBiWuFengZhiYin:OnDialog()
	local tbOpt = {{"kết thúc đối thoại"}, };
	Dialog:Say(self.szText, tbOpt);
end;
