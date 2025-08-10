-------------------------------------------------------
-- văn kiện danh 　：ercengtrap.lua
-- văn kiện miêu tả ：nhị tằng BOSStử vong hậu khai khải đích TRAPđiểm 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-04-09 16:09:31
-------------------------------------------------------

local tbMap	= Map:GetClass(493);
local tbTrap_6 = tbMap:GetTrapClass("to_ceng3");

tbTrap_6.szDesc		="truyện đưa đến đệ tam tằng";

tbTrap_6.tbSendPos	= {1820, 3646};

function tbTrap_6:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);

	if (tbInstancing.nTrap6Pass == 1) then
		me.NewWorld(me.nMapId, self.tbSendPos[1],self.tbSendPos[2]);
	end;
end;
