-----------------------------------------------------------
-- văn kiện danh 　：zhunbeiqunpc.lua
-- văn kiện miêu tả ：chuẩn bị khu cước bản [Lộ Lộ Thông] [Lưu Nhất Bán]
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 20:21:59
-----------------------------------------------------------

-- Lộ Lộ Thông 
local tbNpc = Npc:GetClass("lulutong");
-- truyện đưa vị trí 
tbNpc.tbPos = {
	{"Đến Bích Ngô Phong", 1714, 2980,},
	{"Đến Thần Chu Phong", 1876, 2991,},
	{"Đến Linh Hạt Phong", 1936, 2723,},
	{"Đến Thiên Tuyệt Phong", 1777, 2739,},
	};

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	local szMsg ="đây là nhất điều đi thông phó bản nội các địa phương tiệp kính ，nếu như ngươi hoặc của ngươi đội hữu đã khai khải liễu thông quan đích điều kiện ，liền có thể thông qua này điều tiệp kính trực tiếp đi trước chỗ đó 。nhưng nhu tiền trả 500lượng bạc 。";
	local tbOpt = {};
	for i = 1, #self.tbPos do
		tbOpt[#tbOpt + 1] = {"đi trước".. self.tbPos[i][1], tbNpc.Send, self, i, tbInstancing, me.nId};
	end;
	tbOpt[#tbOpt + 1] = {"kết thúc đối thoại"};
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:Send(nPos, tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;
	
	if (pPlayer.nCashMoney <500) then
		Task.tbArmyCampInstancingManager:Warring(pPlayer,"trên người ngươi đích tiền không đủ ！");
		return;
	end
	
	if (nPos == 1 and tbInstancing.nTaoHuaShiPass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 2 and tbInstancing.nBiWuFengPass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 3 and tbInstancing.nShenZhuFengPass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 4 and tbInstancing.nLingXieFengPass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		return;
	end;

	Task.tbArmyCampInstancingManager:Warring(pPlayer,"chỉ có thông qua quan tạp sau khi tài có thể sử dụng tiệp kính");
end;

function tbNpc:SendToNewPos(nPos, nMapId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;
		
	assert(pPlayer.CostMoney(500, Player.emKPAY_CAMPSEND) == 1);
	pPlayer.NewWorld(pPlayer.nMapId, tbNpc.tbPos[nPos][2], tbNpc.tbPos[nPos][3]);	
	pPlayer.SetFightState(1);	
end;

local tbLiuYiBan = Npc:GetClass("liuyiban");

tbLiuYiBan.tbLifePresentText = {
	[99] ="không nên ，không nên tới gần ta ！ta ở đây cái gì đều không có ！",
	[80] = {"không đánh được ta bỏ chạy","các ngươi thực sự là âm hồn không tiêu tan đích theo ta"},
	[60] = {"có bản lĩnh tựu đuổi theo lai ！","các ngươi hoàn thực sự đuổi theo lai liễu ！"},
	[40] = {"ta bào ！ta chạy nữa ！","có thể hay không nghỉ một hồi a ！"},
	[20] = {"không được ，ta đả mệt mỏi ！","các ngươi thực sự là âm hồn không tiêu tan đích theo ta ！"},
	[0] ="các ngươi ……cấp ta Lưu Nhất Bán a ……",
}

tbLiuYiBan.tbDrop = {
	{"setting\\npc\\droprate\\renwudiaoluo\\jindi_lv1.txt", 8},
	{"setting\\npc\\droprate\\renwudiaoluo\\jindi_lv2.txt", 8},
	{"setting\\npc\\droprate\\renwudiaoluo\\jindi_lv3.txt", 8},
	{"setting\\npc\\droprate\\renwudiaoluo\\jindi_lv4.txt", 8},
	{"setting\\npc\\droprate\\renwudiaoluo\\jindi_lv5.txt", 8},	
}

function tbLiuYiBan:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nLiuYiBanOutCount> 5) then
		return;
	end;
	
	him.SendChat(self.tbLifePresentText[0]);
	
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbLifePresentText[0], him.szName);
	end;
	
	local nId = 0;
	if (pNpc and pNpc.GetPlayer()) then
		nId = pNpc.GetPlayer().nId;
	else
		nId = tbPlayList[1].nId;
	end;
	him.DropRateItem(self.tbDrop[tbInstancing.nLiuYiBanOutCount][1], self.tbDrop[tbInstancing.nLiuYiBanOutCount][2], -1, -1, nId);
end;

function tbLiuYiBan:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nLiuYiBanOutCount == 0 or tbInstancing.nLiuYiBanOutCount>= 5) then
		return;
	end;
	if (nLifePercent == 99) then
		him.SendChat(self.tbLifePresentText[nLifePercent]);
		return;
	end;
	
	him.SendChat(self.tbLifePresentText[nLifePercent][1]);
	
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		teammate.Msg(self.tbLifePresentText[nLifePercent][1], him.szName);
	end;
	-- rơi xuống vật phẩm 
	him.DropRateItem(self.tbDrop[tbInstancing.nLiuYiBanOutCount][1], self.tbDrop[tbInstancing.nLiuYiBanOutCount][2], -1, -1, tbPlayList[1].nId);
	tbInstancing.nLiuYiBanOutCount = tbInstancing.nLiuYiBanOutCount + 1;
	him.Delete();
end;
