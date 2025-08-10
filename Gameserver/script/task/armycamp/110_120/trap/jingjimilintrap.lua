-------------------------------------------------------
-- văn kiện danh 　：jingjimilintrap.lua
-- văn kiện miêu tả ：kinh cức rừng rậm TRAPđiểm 
-- sang xây người 　：ZhangDeheng
-- sang xây thời gian ：2009-03-16 09:32:51
-------------------------------------------------------


local tbMap	= Map:GetClass(493);
local tbTrap_1 = tbMap:GetTrapClass("trapjingji");

tbTrap_1.szText ="không cẩn thận bị kinh cức cắt vỡ da phu! ta cảm giác càng lúc càng hôn mê......";

function tbTrap_1:OnPlayer()
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(me.nMapId);
	if (not tbInstancing) then
		return;
	end;
	
	TaskAct:Talk(self.szText, self.Return, self, me.nId);
end

function tbTrap_1:Return(nId)
	local pPlayer = KPlayer.GetPlayerObjById(nId);
	if (not pPlayer) then
		return;
	end;
	
	pPlayer.NewWorld(pPlayer.nMapId, 1586, 3157);
	pPlayer.SetFightState(0);
	return 0;
end;

local tbMap	= Map:GetClass(493);
local tbTrap_2 = tbMap:GetTrapClass("to_ceng1");

tbTrap_2.szDesc		="to_ceng1";

tbTrap_2.tbSendPos	= {{1720, 3289}, {1841, 3211}};

function tbTrap_2:OnPlayer()
	local nSubWorld,_,_	= me.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nTrap2Pass == 0) then
		me.NewWorld(me.nMapId, self.tbSendPos[1][1],self.tbSendPos[1][2]);
	else
		me.NewWorld(me.nMapId, self.tbSendPos[2	][1],self.tbSendPos[2][2]);
		tbInstancing:OnCoverBegin(me);
		Task.tbArmyCampInstancingManager:ShowTip(me,"y theo long ngũ thái da đích miêu tả ，tìm được tứ cây Kình Thiên Trụ ，dựa theo <color=red>phong lâm hỏa sơn <color>đích thuận tự khai khải");
		me.Msg("y theo long ngũ thái da đích miêu tả ，tìm được tứ cây Kình Thiên Trụ ，dựa theo phong lâm hỏa sơn đích thuận tự khai khải");
	end;	
end;
