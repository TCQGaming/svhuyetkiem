-----------------------------------------------------------
-- văn kiện danh 　：taohuashi.lua
-- văn kiện miêu tả ：đối thoại Đào Hoa Sứ cập chiến đấu Đào Hoa Sứ 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 17:26:10
-----------------------------------------------------------

-- chiến đấu Đào Hoa Sứ 
local tbTaoHuaShi_Fight = Npc:GetClass("taohuashifight");

tbTaoHuaShi_Fight.tbText = {
	[70] = {"khán dáng vẻ các ngươi là có bị mà lai đích ！","bất quá da da ta không có thể như vậy ngồi không ！","nhượng các ngươi nhìn một cái ta lợi hại ba ！"},
	[50] = {"ta cảm thấy có chút khẩn trương ！","chúng ta ngồi xuống lai đàm đàm thế nào ？","biệt vậy cố chấp có được hay không ？"},
	[20] = {"đều là đi lẫn vào ，cấp điểm mặt mũi ba ！","đại gia cũng không dễ dàng a ！","chúng ta ngừng tay có được hay không ？"},
	[10] = {"hảo tiểu tử ！nhuyễn cứng rắn không ăn đúng không ？","Xem như ngươi lợi hại chúng ta đi tiều ！"},
	[0] = {"ta thực sự không nghĩ đến ……"},
}
-- tử vong thì chấp hành 
function tbTaoHuaShi_Fight:OnDeath(pNpc)
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	him.SendChat(self.tbText[0][1]);
	
	tbInstancing.nTaoHuaShiPass = 1;
	if (not tbInstancing.nJinZhiTaoHuaLin) then
		return;
	end;
	
	local pNpc = KNpc.GetById(tbInstancing.nJinZhiTaoHuaShi);
	if (pNpc) then
		pNpc.Delete();
	end;
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"ngài khả dĩ đi trước bích ngô ngọn núi ！");
	end;
end;

-- lượng máu ở nhất định thì hậu chấp hành 
function tbTaoHuaShi_Fight:OnLifePercentReduceHere(nLifePercent)
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (not tbInstancing) then
		return;
	end;
	tbInstancing:NpcSay(him.dwId, self.tbText[nLifePercent]);
end;

-- đối thoại Đào Hoa Sứ 
local tbTaoHuaShi_Dialog = Npc:GetClass("taohuashidialog");

tbTaoHuaShi_Dialog.tbText = {
	"lai ba ！lai ba ！ta cũng chờ đích không nhịn được liễu ！",
	"các ngươi chân tưởng các ngươi khả dĩ sấm quá ta này sơn đầu mạ ？",
	"ở các ngươi trước đã có vô số nhân thử quá liễu ！",
}
-- đối thoại 
function tbTaoHuaShi_Dialog:OnDialog()
	local nSubWorld,_,_ = him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	if (tbInstancing.nTaoHuaShiOut ~= 0) then
		return;
	end;
	
	local szMsg = string.format("%s：lai ba ！lai ba ！ta cũng chờ đích không nhịn được liễu ！", him.szName);
	local tbOpt = {
		{"bắt đầu chiến đấu", self.Fight, self, me.nId, him.dwId},
		{"kết thúc đối thoại"},
	}
	Dialog:Say(szMsg, tbOpt);
end;

-- đối thoại chuyển chiến đấu 
function tbTaoHuaShi_Dialog:Fight(nPlayerId, nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	if (not pPlayer or not pNpc) then
		return;
	end;
	
	local nSubWorld, nNpcPosX, nNpcPosY = pNpc.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	if (tbInstancing.nTaoHuaShiOut ~= 0) then
		return;
	end
	-- chiến đấu Đào Hoa Sứ 
	local pTaoHuaShi = KNpc.Add2(4171, tbInstancing.nNpcLevel, -1, nSubWorld, nNpcPosX, nNpcPosY);
	assert(pTaoHuaShi);
	tbInstancing:NpcSay(pTaoHuaShi.dwId, self.tbText);
	
	pTaoHuaShi.AddLifePObserver(70);
	pTaoHuaShi.AddLifePObserver(50);
	pTaoHuaShi.AddLifePObserver(20);
	pTaoHuaShi.AddLifePObserver(10);
	
	tbInstancing.nTaoHuaShiOut = 1;
	pNpc.Delete();
end;

