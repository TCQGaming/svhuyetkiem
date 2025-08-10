--đốn củi khu --rời khỏi man chướng sơn 

local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_exitmanzhangshan");

function tbTrap_1:OnPlayer()
	me.NewWorld(me.nMapId, 1832, 3084);
	TaskAct:StepOverEvent("rời khỏi man chướng sơn");
end


