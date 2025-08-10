-----------------------------------------------------------
-- văn kiện danh 　：zhunbeiqutrap.lua
-- văn kiện miêu tả ：rời khỏi thuyền cập trở lại thuyền đích trạng thái cắt 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2008-11-26 19:06:26
-----------------------------------------------------------

-- rời khỏi thuyền 
local tbMap	= Map:GetClass(560);
local tbTrap_1 = tbMap:GetTrapClass("to_zhandou");

tbTrap_1.tbSendPos = {1712, 3119};

function tbTrap_1:OnPlayer()
	me.NewWorld(me.nMapId, self.tbSendPos[1], self.tbSendPos[2]);
	me.SetFightState(1);
end

-- trở lại thuyền 
local tbMap	= Map:GetClass(560);
local tbTrap_2 = tbMap:GetTrapClass("to_feizhandou");

tbTrap_2.tbSendPos = {1722, 3129};

function tbTrap_2:OnPlayer()
	me.NewWorld(me.nMapId, self.tbSendPos[1], self.tbSendPos[2]);
	me.SetFightState(0);
end
