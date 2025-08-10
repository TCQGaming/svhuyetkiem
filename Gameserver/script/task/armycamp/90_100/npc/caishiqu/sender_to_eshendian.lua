-- truyện đưa đi ngạc thần điện đích Npc

-- nộp lên chỉ định sổ mục đích tài liệu khả dĩ khi đến nhất quan 
local tbNpc = Npc:GetClass("yunxiaodao");

tbNpc.tbNeedItemList = 
{
	{20, 1, 486, 1, 2},
}

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nEShenDianPass == 1) then
		Dialog:Say("có hay không này phải đi ngạc thần điện 。",
		{
			{"đi trước ngạc thần điện", self.Send, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	else
	Dialog:Say("vân tiểu đao ：“thực sự là kỳ tai quái cũng ，ở đây dĩ nhiên hội lưu lại như thế một tòa thượng cổ đích ngạc thần điện ，ở đây mặt nhất định có cái gì bí mật 。ta đợi huynh đệ phí liễu thật lớn lực khí tài mở liễu thần điện nhập khẩu ，ngươi nếu là tưởng tiến nhập ，mượn lưỡng bả mê cung Thược thi cấp ta ，coi như là cá khổ cực tiền ba ！”",
		{
			{"cấp vân tiểu đao lưỡng bả mê cung Thược thi", self.Give, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	end
end

function tbNpc:Give(tbInstancing, nPlayerId)
	Task:OnGift("giao cho vân tiểu đao lưỡng bả mê cung Thược thi là được khi hắn đích dưới sự dẫn dắt tiến nhập ngạc thần điện", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId}, nil, {self.CheckRepeat, self, tbInstancing});
end

function tbNpc:Send(tbInstancing)
	me.NewWorld(tbInstancing.nMapId, 1819, 3941);
end


function tbNpc:Pass(tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	tbInstancing.nEShenDianPass = 1;
	if (pPlayer) then
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"ta bây giờ yên tâm khứ ngạc thần điện liễu");
	end
end

function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nEShenDianPass == 1) then
		return 0;
	end
	
	return 1; 
end
