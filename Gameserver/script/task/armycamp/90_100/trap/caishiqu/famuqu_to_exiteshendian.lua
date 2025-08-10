--đốn củi khu --rời khỏi ngạc thần điện 

local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_exiteshendian");

function tbTrap_1:OnPlayer()
	me.NewWorld(me.nMapId, 1809, 3778);
	TaskAct:StepOverEvent("rời khỏi ngạc thần điện");
end


