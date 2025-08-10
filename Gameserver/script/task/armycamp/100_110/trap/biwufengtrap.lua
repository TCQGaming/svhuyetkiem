-----------------------------------------------------------
-- văn kiện danh 　：biwufengtrap.lua
-- văn kiện miêu tả ：bích ngô ngọn núi trapđiểm cước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 19:46:12
-----------------------------------------------------------

-- giết chết hiết vương tài khả thông qua thử điểm 
local tbMap	= Map:GetClass(560);
local tbTrap_1 = tbMap:GetTrapClass("to_shenzhufeng");

tbTrap_1.tbSendPos = {1827, 3047};

function tbTrap_1:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nBiWuFengPass == 0) then
		me.NewWorld(me.nMapId, self.tbSendPos[1],self.tbSendPos[2]);
	end;
end
