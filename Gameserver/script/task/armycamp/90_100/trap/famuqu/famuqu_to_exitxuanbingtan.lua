--đốn củi khu --rời khỏi huyền băng đàm 

local tbMap	= Map:GetClass(557);
local tbTrap_1 = tbMap:GetTrapClass("to_exitxuanbingtan");

function tbTrap_1:OnPlayer()
	me.NewWorld(me.nMapId, 1927, 2947);
	TaskAct:StepOverEvent("đi tới man chướng sơn");
end


