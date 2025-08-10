--đốn củi khu --Trâu lan trại 

local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_niulanzhai");

function tbTrap_1:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	if (tbInstancing.nNiuLanZhaiPass ~= 1) then
		me.NewWorld(nSubWorld, 1867, 3189);
		Task.tbArmyCampInstancingManager:ShowTip(me,"thỉnh thối tiền lẻ lai đái lộ tiến nhập Trâu lan trại");
	end
end
