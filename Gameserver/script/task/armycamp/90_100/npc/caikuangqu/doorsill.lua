-- nộp lên chỉ định sổ mục đích tài liệu khả dĩ khi đến nhất quan 
local tbNpc = Npc:GetClass("caikuangqudoorsill");

tbNpc.tbNeedItemList = 
{
	{20, 1, 604, 1, 3},
	{20, 1, 605, 1, 3},
}

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nCaiKuangQuPass == 1) then
		Dialog:Say("thuyền dĩ thân thiện hữu hảo ，khả dĩ tọa trước thuyền vãng loạn thạch bãi 。",
		{
			{"tọa trước thuyền vãng loạn thạch bãi", self.Send, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	else
	Dialog:Say("này chiến thuyền thuyền phá bại bất kham ，nhu dùng tam điều Ma thằng và tam khối Tấm gỗ gia cố phương có thể sử dụng 。",
		{
			{"sửa phục cựu thuyền", self.Fix, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	end
end

function tbNpc:Fix(tbInstancing, nPlayerId)
	Task:OnGift("thuyền đã hư nát ，cần để vào tam điều Ma thằng ，tam khối Tấm gỗ tương kỳ sửa phục tài có thể sử dụng 。", self.tbNeedItemList, {self.PassCaiKuangQu, self, tbInstancing, nPlayerId}, nil, {self.CheckRepeat, self, tbInstancing});
end

function tbNpc:Send(tbInstancing)
	me.NewWorld(tbInstancing.nMapId, 1668, 3764);
end


function tbNpc:PassCaiKuangQu(tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	tbInstancing.nCaiKuangQuPass = 1;
	if (pPlayer) then
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"cựu thuyền đã bị thân thiện hữu hảo");
	end
end

function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nCaiKuangQuPass == 1) then
		return 0;
	end
	
	return 1; 
end
