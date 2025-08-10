-------------------------------------------------------
-- văn kiện danh 　：qinshihuangling_1.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-09 11:23:12
-- văn kiện miêu tả ：
-------------------------------------------------------


-------------- định nghĩa riêng địa đồ quay về điều ---------------
local tbMap = Map:GetClass(1536);

-- định nghĩa ngoạn gia tiến nhập sự kiện 
function tbMap:OnEnter(szParam)
	
	-- phán đoán thặng dư thời gian 
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	
	-- thặng dư thời gian là 0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		me.NewWorld(Boss.Qinshihuang:GetLeaveMapPos());
		me.SetFightState(0);
		return;
	end
	
	-- chiến đấu bảo hộ 
	Player:AddProtectedState(me, 6);
	
	-- thêm vào trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:AddPlayer(me.nId, 1);
	
	-- địa đồ đối ngoạn gia ảnh hưởng 
	Boss.Qinshihuang:OnMapEffect(me.nId, 1);
end;

-- định nghĩa ngoạn gia ly khai sự kiện 
function tbMap:OnLeave(szParam)

	-- thanh trừ địa đồ hiệu quả 
	Boss.Qinshihuang:OnMapLeave(me.nId, 1);
			
	-- dời ra trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:RemovePlayer(me.nId);
end;


-------------- định nghĩa riêng Trapđiểm quay về điều ---------------

-- tiến nhập 2tằng điểm 1
local tbTrap1 = tbMap:GetTrapClass("trap_f2_1");

function tbTrap1:OnPlayer()
	me.NewWorld(1537, 1700, 3372);
	me.SetFightState(1);
end;


-- tiến nhập 2tằng điểm 2
local tbTrap2 = tbMap:GetTrapClass("trap_f2_2");

function tbTrap2:OnPlayer()
	me.NewWorld(1537, 1893, 3143);
	me.SetFightState(1);
end;

-- tiến nhập an toàn khu 1
local tbSafeIn1 = tbMap:GetTrapClass("trap_safe_in_1");

function tbSafeIn1:OnPlayer()
	me.NewWorld(1536, 1567, 3629);
	me.SetFightState(0);
end;

-- tiến nhập an toàn khu 2
local tbSafeIn2 = tbMap:GetTrapClass("trap_safe_in_2");

function tbSafeIn2:OnPlayer()
	me.NewWorld(1536, 1567, 3629);
	me.SetFightState(0);
end;

-- tiến nhập an toàn khu 3
local tbSafeIn3 = tbMap:GetTrapClass("trap_safe_in_3");

function tbSafeIn3:OnPlayer()
	me.NewWorld(1536, 1567, 3629);
	me.SetFightState(0);
end;

-- ly khai an toàn khu 1
local tbSafeOut1 = tbMap:GetTrapClass("trap_safe_out_1");

function tbSafeOut1:OnPlayer()
	me.NewWorld(1536, 1534, 3662);
	me.SetFightState(1);
	Player:AddProtectedState(me, 3);
end;

-- ly khai an toàn khu 2
local tbSafeOut2 = tbMap:GetTrapClass("trap_safe_out_2");

function tbSafeOut2:OnPlayer()
	me.NewWorld(1536, 1600, 3675);
	me.SetFightState(1);
	Player:AddProtectedState(me, 3);
end;

-- ly khai an toàn khu 3
local tbSafeOut3 = tbMap:GetTrapClass("trap_safe_out_3");

function tbSafeOut3:OnPlayer()
	me.NewWorld(1536, 1600, 3600);
	me.SetFightState(1);
	Player:AddProtectedState(me, 3);
end;
