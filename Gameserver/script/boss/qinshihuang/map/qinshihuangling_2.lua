-------------------------------------------------------
-- văn kiện danh 　：qinshihuangling_2.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-09 12:47:18
-- văn kiện miêu tả ：
-------------------------------------------------------


-------------- định nghĩa riêng địa đồ quay về điều ---------------
local tbMap = Map:GetClass(1537);

-- định nghĩa ngoạn gia tiến nhập sự kiện 
function tbMap:OnEnter(szParam)
	
	-- phán đoán thặng dư thời gian 
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	
	-- thặng dư thời gian là 0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		me.NewWorld(1536, 1567, 3629);		-- tầng thứ nhất đích an toàn khu 
		me.SetFightState(0);
		return;
	end
	
	-- chiến đấu bảo hộ 
	Player:AddProtectedState(me, 6);
	
	-- thêm vào trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:AddPlayer(me.nId, 2);
	
	-- địa đồ đối ngoạn gia ảnh hưởng 
	Boss.Qinshihuang:OnMapEffect(me.nId, 2);
end;

-- định nghĩa ngoạn gia ly khai sự kiện 
function tbMap:OnLeave(szParam)
	
	-- thanh trừ địa đồ hiệu quả 
	Boss.Qinshihuang:OnMapLeave(me.nId, 2);
			
	-- dời ra trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:RemovePlayer(me.nId);
end;


-------------- định nghĩa riêng Trapđiểm quay về điều ---------------

-- tiến nhập 3tằng điểm 1
local tbTrap1 = tbMap:GetTrapClass("trap_f3_1");

function tbTrap1:OnPlayer()
	me.NewWorld(1538, 1469, 3245);
	me.SetFightState(1);
end;


-- tiến nhập 3tằng điểm 2
local tbTrap2 = tbMap:GetTrapClass("trap_f3_2");

function tbTrap2:OnPlayer()
	me.NewWorld(1538, 1549, 3170);
	me.SetFightState(1);
end;

-- phản hồi 1tằng điểm 1
local tbTrap3 = tbMap:GetTrapClass("trap_f1_1");

function tbTrap3:OnPlayer()
	me.NewWorld(1536, 1710, 3954);
	me.SetFightState(1);
end;


-- phản hồi 1tằng điểm 2
local tbTrap4 = tbMap:GetTrapClass("trap_f1_2");

function tbTrap4:OnPlayer()
	me.NewWorld(1536, 1874, 3787);
	me.SetFightState(1);
end;
