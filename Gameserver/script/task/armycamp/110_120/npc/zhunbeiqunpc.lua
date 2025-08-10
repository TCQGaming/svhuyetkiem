-------------------------------------------------------
-- văn kiện danh 　：zhunbeiqunpc.lua
-- văn kiện miêu tả ：chuẩn bị khu NPCcước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-16 09:17:36
-------------------------------------------------------


-- Lộ Lộ Thông 
local tbNpc = Npc:GetClass("hl_lulutong");
-- truyện đưa vị trí 
tbNpc.tbPos = {
	{"nhất tằng", 1841, 3210,},
	{"nhị tằng", 1883, 3452,},
	{"tam tằng", 1819, 3647},
	};
tbNpc.tbPosKuoZhanQu = {
		{"cờ vua bàn", 53696 / 32, 115104 / 32},
		{"kính người trong", 52288 / 32, 109760 / 32},
		{"đuổi bắt Lưu Nhất Bán", 54144 / 32, 124160 / 32},
	}

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	local szMsg ="đây là nhất điều đi thông phó bản nội các địa phương tiệp kính ，nếu như ngươi hoặc của ngươi đội hữu đã khai khải liễu thông quan đích điều kiện ，liền có thể thông qua này điều tiệp kính trực tiếp đi trước chỗ đó 。nhưng nhu tiền trả 500lượng bạc 。";
	local tbOpt = {};
	for i = 1, #self.tbPos do
		tbOpt[#tbOpt + 1] = {"đi trước".. self.tbPos[i][1], tbNpc.Send, self, i, tbInstancing, me.nId};
	end;
	if (tbInstancing.tbKuoZhanQuOut[1] == 1) then
		tbOpt[#tbOpt + 1] = {"đi trước".. self.tbPosKuoZhanQu[1][1], tbNpc.Send, self, 4, tbInstancing, me.nId};
	end;
	if (tbInstancing.tbKuoZhanQuOut[2] == 1) then
		tbOpt[#tbOpt + 1] = {"đi trước".. self.tbPosKuoZhanQu[2][1], tbNpc.Send, self, 5, tbInstancing, me.nId};
	end;
	if (tbInstancing.tbKuoZhanQuOut[3] == 1) then
		tbOpt[#tbOpt + 1] = {"đi trước".. self.tbPosKuoZhanQu[3][1], tbNpc.Send, self, 6, tbInstancing, me.nId};
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
	
	if (nPos == 1 and tbInstancing.nTrap2Pass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		tbInstancing:OnCoverBegin(pPlayer);
		return;
	elseif (nPos == 2 and tbInstancing.nTrap4Pass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		tbInstancing:OnCoverBegin(pPlayer);
		return;
	elseif (nPos == 3 and tbInstancing.nTrap6Pass == 1) then
		self:SendToNewPos(nPos, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 4) then
		self:SendToNewPos(4, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 5) then
		self:SendToNewPos(5, tbInstancing.nMapId, nPlayerId);
		return;
	elseif (nPos == 6) then
		self:SendToNewPos(6, tbInstancing.nMapId, nPlayerId);
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
	if (nPos <= 3) then
		pPlayer.NewWorld(pPlayer.nMapId, tbNpc.tbPos[nPos][2], tbNpc.tbPos[nPos][3]);
	elseif (nPos <= 6) then
		pPlayer.NewWorld(pPlayer.nMapId, tbNpc.tbPosKuoZhanQu[nPos - 3][2], tbNpc.tbPosKuoZhanQu[nPos - 3][3]);
	end;
		
	pPlayer.SetFightState(1);	
end;
