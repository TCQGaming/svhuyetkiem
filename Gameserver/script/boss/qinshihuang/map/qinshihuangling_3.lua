-------------------------------------------------------
-- văn kiện danh 　：qinshihuangling_3.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-09 13:00:28
-- văn kiện miêu tả ：
-------------------------------------------------------


-------------- định nghĩa riêng địa đồ quay về điều ---------------
local tbMap = Map:GetClass(1538);

-- định nghĩa ngoạn gia tiến nhập sự kiện 
function tbMap:OnEnter(szParam)
	
	-- phán đoán thặng dư thời gian 
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	-- print(""..nUseTime.."ssssssssss"..Boss.Qinshihuang.MAX_DAILY_TIME.."")
	-- thặng dư thời gian là 0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		me.NewWorld(1536, 1567, 3629);		-- tầng thứ nhất đích an toàn khu 
		me.SetFightState(0);
		return;
	end
	
	-- chiến đấu bảo hộ 
	Player:AddProtectedState(me, 6);
	
	-- thêm vào trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:AddPlayer(me.nId, 3);
	
	-- địa đồ đối ngoạn gia ảnh hưởng 
	Boss.Qinshihuang:OnMapEffect(me.nId, 3);
end;

-- định nghĩa ngoạn gia ly khai sự kiện 
function tbMap:OnLeave(szParam)
	
	-- thanh trừ địa đồ hiệu quả 
	Boss.Qinshihuang:OnMapLeave(me.nId, 3);
			
	-- dời ra trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:RemovePlayer(me.nId);
end;


-------------- định nghĩa riêng Trapđiểm quay về điều ---------------


-- tiến nhập 4tằng điểm 1
local tbTrap1 = tbMap:GetTrapClass("trap_f4_1");

function tbTrap1:OnPlayer()
	me.NewWorld(1539, 1490, 3592);
	me.SetFightState(1);
end;


-- tiến nhập 4tằng điểm 2
local tbTrap2 = tbMap:GetTrapClass("trap_f4_2");

function tbTrap2:OnPlayer()
	me.NewWorld(1539, 1714, 3373);
	me.SetFightState(1);
end;

-- phản hồi 2tằng điểm 1
local tbTrap3 = tbMap:GetTrapClass("trap_f2_1");

function tbTrap3:OnPlayer()
	me.NewWorld(1537, 1962, 3660);
	me.SetFightState(1);
end;


-- phản hồi 2tằng điểm 2
local tbTrap4 = tbMap:GetTrapClass("trap_f2_2");

function tbTrap4:OnPlayer()
	me.NewWorld(1537, 2166, 3455);
	me.SetFightState(1);
end;


-- tiến nhập an toàn khu 1
local tbSafeIn1 = tbMap:GetTrapClass("trap_safe_in");

function tbSafeIn1:OnPlayer()
	me.NewWorld(1538, 1762, 3191);
	me.SetFightState(0);
end;

-- ly khai an toàn khu 1
local tbSafeOut1 = tbMap:GetTrapClass("trap_safe_out");

function tbSafeOut1:OnPlayer()
	me.NewWorld(1538, 1746, 3267);
	me.SetFightState(1);
	Player:AddProtectedState(me, 3);
end;
