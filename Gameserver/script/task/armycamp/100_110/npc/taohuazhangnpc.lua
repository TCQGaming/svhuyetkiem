-----------------------------------------------------------
-- văn kiện danh 　：taohuazhangnpc.lua
-- văn kiện miêu tả ：Đào Hoa Chướng khu cước bản [đỉnh]
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 20:23:33
-----------------------------------------------------------

-- Đào Hoa Chướng khu đỉnh 
local tbNpc = Npc:GetClass("jiuningding");

tbNpc.tbNeedItemList = 
{
	{20, 1, 623, 1, 20},
}
function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nTaoHuaZhangPass == 0) then
		Dialog:Say("Hãy cho vào 20 nhiếp không thảo",
			{
				{"【Chế dược 】", self.Pharmacy, self, tbInstancing, me.nId},
				{"【Kết thúc đối thoại 】"}
			});
	end
end

function tbNpc:Pharmacy(tbInstancing, nPlayerId)
	Task:OnGift("Đặt vào 20 nhiếp không thảo", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId}, nil, {self.CheckRepeat, self, tbInstancing}, true);
end;

function tbNpc:Pass(tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	assert(pPlayer);
	
	local tbPlayList,_ = KPlayer.GetMapPlayer(tbInstancing.nMapId);
	for _, teammate in ipairs(tbPlayList) do
		Task.tbArmyCampInstancingManager:ShowTip(teammate,"Chế dược thành công");
	end;
	-- bỏ đi Đào Hoa Chướng đích chướng khí 
	for i = 1, 3 do 
		if (tbInstancing.tbZhangQiId[i]) then
			local pNpc = KNpc.GetById(tbInstancing.tbZhangQiId[i]);
			if (pNpc) then
				pNpc.Delete();
			end;
		end;
	end;
	
	-- bỏ đi Cấm Chế 
	if (tbInstancing.nJinZhiTaoHuaLin) then
		local pNpc = KNpc.GetById(tbInstancing.nJinZhiTaoHuaLin);
		if (pNpc) then
			pNpc.Delete();
		end;
	end;
	-- tăng thêm thiên tuyệt sử 	
	local pTianJueShi = KNpc.Add2(4150, tbInstancing.nNpcLevel, -1, tbInstancing.nMapId, 1710, 3100); -- thiên tuyệt sử 
	local tbTianJueShi = Npc:GetClass("tianjueshi");
	tbInstancing:NpcSay(pTianJueShi.dwId, tbTianJueShi.tbText);
	pTianJueShi.GetTempTable("Task").tbSayOver = {tbTianJueShi.SayOver, tbTianJueShi, tbInstancing, pTianJueShi.dwId, nPlayerId};
	
	-- thiết đưa Đào Hoa Chướng khả dĩ thông qua 
	tbInstancing.nTaoHuaZhangPass = 1;
end;

function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nTaoHuaZhangPass == 1) then
		return 0;
	end	
	return 1; 
end

-- Đào Hoa Chướng thiên tuyệt sử 
local tbTianJueShi = Npc:GetClass("tianjueshi");

tbTianJueShi.tbText = {
	"các ngươi là ai ？các ngươi chẩm ma hội biết tiến sơn đích phương pháp ？",
	"nan đạo ？không ！không có khả năng ！",
	"không xong ！có người sấm núi ！",
}
tbTianJueShi.tbTrack = {{1704, 3095}, {1697, 3089}};

function tbTianJueShi:SayOver(tbInstancing, nNpcId, nPlayerId)
	assert(nNpcId and nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	assert(pNpc);
	
	tbInstancing:Escort(nNpcId, nPlayerId, self.tbTrack);
	pNpc.GetTempTable("Npc").tbOnArrive = {self.OnArrive, self, nNpcId, nPlayerId};
end;

function tbTianJueShi:OnArrive(nNpcId, nPlayerId)
	assert(nNpcId and nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return;
	end;
	
	pNpc.Delete();
end;

-- Đào Hoa Chướng chỉ dẫn 
local tbTaoHusLinZhiYin = Npc:GetClass("taohualinzhiyin");

tbTaoHusLinZhiYin.szText =" phía trước là bách man sơn đích thiên hiểm đào hoa lâm ，lâm nội đích Đào Hoa Chướng làm giận súc khổ sở ，cũng may chúng ta đã biết thông hành phương pháp 。\n\n  ngươi cần <color=red>tương đào hoa lâm đặc hữu bích lân Rắn trong miệng nhiếp Trống cây cỏ thủ 20buội cây lai ，vùi đầu vào Cửu Ngưng Đỉnh nội ，<color>luyện hóa ra dược khí liền có thể Dĩ Độc Công Độc tương chướng khí giải 。";

function tbTaoHusLinZhiYin:OnDialog()
	local tbOpt = {{"kết thúc đối thoại"}, };
	Dialog:Say(self.szText, tbOpt);
end;
