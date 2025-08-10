-----------------------------------------------------------
-- văn kiện danh 　：taohuazhangtrap.lua
-- văn kiện miêu tả ：Đào Hoa Chướng trapđiểm cước bản 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 19:12:37
-----------------------------------------------------------

-- chỉ có giết chết liễu Đào Hoa Sứ ，tài khả thông qua thử điểm 
local tbMap	= Map:GetClass(560);
local tbTrap_1 = tbMap:GetTrapClass("to_biwufeng");

tbTrap_1.tbSendPos = {1678, 2928};

function tbTrap_1:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nTaoHuaShiPass == 0) then
		me.NewWorld(me.nMapId, self.tbSendPos[1], self.tbSendPos[2]);
	end;
end

local tbMap	= Map:GetClass(560);
local tbTrap_2 = tbMap:GetTrapClass("to_jisi");

tbTrap_2.tbPos = {1663, 3035};

function tbTrap_2:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nTaoHuaZhangPass == 0) then
		me.NewWorld(nSubWorld, self.tbPos[1], self.tbPos[2]);
	end;
end
