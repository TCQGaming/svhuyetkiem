
-- đệ nhị tằng bên trái đích BOSS
local tbNpc_1	= Npc:GetClass("famuquboss");

function tbNpc_1:OnDeath(pNpc)
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	Task.tbArmyCampInstancingManager:ShowTip(me,"quáng nói nhập khẩu đã khai khải 。");
	tbInstancing.nFaMuQuTrapOpen = 1;
end

