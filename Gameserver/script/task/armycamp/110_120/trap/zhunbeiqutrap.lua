-------------------------------------------------------
-- văn kiện danh 　：zhunbeiqutrap.lua
-- văn kiện miêu tả ：chiến đấu và phi chiến đấu trạng thái đích chuyển hoán 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-16 09:23:05
-------------------------------------------------------

-- chuyển vi chiến đấu trạng thái 
local tbMap = Map:GetClass(493);
local tbTrap = tbMap:GetTrapClass("hlwm_trap1");

tbTrap.tbSendPos = {{1605, 3177}, {1599, 3163}}

function tbTrap:OnPlayer()
	if (me.nFightState == 0) then
		me.NewWorld(me.nMapId, self.tbSendPos[1][1], self.tbSendPos[1][2]);
		me.SetFightState(1);
	else
		me.NewWorld(me.nMapId, self.tbSendPos[2][1], self.tbSendPos[2][2]);
		me.SetFightState(0);
	end;	
end;

