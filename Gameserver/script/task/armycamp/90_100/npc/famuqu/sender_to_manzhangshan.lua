-- truyện đưa đi man chướng sơn đích Npc

-- nộp lên chỉ định sổ mục đích tài liệu khả dĩ khi đến nhất quan 
local tbNpc = Npc:GetClass("yundadao");

tbNpc.tbNeedItemList = 
{
	{20, 1, 487, 1, 2},
}

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nManZhangShanPass == 1) then
		Dialog:Say("có hay không này phải đi man chướng sơn 。",
		{
			{"đi trước man chướng sơn", self.Send, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	else
	Dialog:Say("vân đại đao ：“lần này ta đợi huynh đệ ki nhân tiền lai man chướng sơn tầm bảo ，phí liễu thật lớn lực khí tài và ở đây đích man nhân bộ hảo giao chuyện 。ngươi nếu tưởng tiến man chướng sơn ，ta khả dĩ giúp việc 。bất quá chúng ta khoái đao môn dĩ lợi đương tiên ，ngươi trước phải cấp ta hoa lai hai cái cốt ngọc đồ đằng mới được 。”",
		{
			{"cấp vân đại đao hai cái cốt ngọc đồ đằng", self.Give, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	end
end

function tbNpc:Give(tbInstancing, nPlayerId)
	Task:OnGift("giao cho vân đại đao hai cái cốt ngọc đồ đằng là được khi hắn đích dưới sự dẫn dắt tiến nhập man chướng sơn 。", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId}, nil, {self.CheckRepeat, self, tbInstancing});
end

function tbNpc:Send(tbInstancing)
	me.NewWorld(tbInstancing.nMapId, 1911, 3000);
end


function tbNpc:Pass(tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	tbInstancing.nManZhangShanPass = 1;
	if (pPlayer) then
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"ta bây giờ yên tâm khứ man chướng núi");
	end
end

function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nManZhangShanPass == 1) then
		return 0;
	end
	
	return 1; 
end
