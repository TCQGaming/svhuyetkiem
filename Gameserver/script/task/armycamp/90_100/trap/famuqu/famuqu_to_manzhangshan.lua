--đốn củi khu --man chướng sơn 

local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_manzhangshan");

function tbTrap_1:OnPlayer()
	me.NewWorld(me.nMapId, 1831, 3080);
	TaskAct:StepOverEvent("thỉnh hoa vân đại đao đái lộ tiến nhập man chướng sơn");
end


