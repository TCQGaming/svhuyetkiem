-- đốn củi khu đáo thải quáng khu 
local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_caikuanqu");

function tbTrap_1:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nFaMuQuTrapOpen ~= 1) then
		me.NewWorld(me.nMapId, 1842, 3399);
		Task.tbArmyCampInstancingManager:ShowTip(me,"cần tiên giết chết thủ quáng đích Lâu la đầu mục tài khả tiến nhập");
	else
		me.NewWorld(me.nMapId, 1913,3316);
		Task.tbArmyCampInstancingManager:ShowTip(me,"tiến nhập sừng tê giác quáng");
	end
end
