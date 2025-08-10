local tbNpc = Npc:GetClass("send2caikuangqu");

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	Dialog:Say("này chiến thuyền thuyền hiển nhiên thị cương sửa xong",
		{
			{"tọa trước thuyền vãng sừng tê giác quáng", self.Send, self, tbInstancing},
			{"kết thúc đối thoại"}
		})	
end

function tbNpc:Send(tbInstancing)
	me.NewWorld(tbInstancing.nMapId, 1878, 3464);
end



local tbNpc1 = Npc:GetClass("outcaishiqu");

function tbNpc1:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	Dialog:Say("này điều thủy lộ thị phản hồi đi trước vùng núi đích duy nhất thông lộ",
		{
			{"tống ta quay về trạm canh gác cương", self.Send, self, tbInstancing},
			{"kết thúc đối thoại"}
		})
end

function tbNpc1:Send(tbInstancing)
	me.NewWorld(tbInstancing.nMapId, 1643, 3623);
end
