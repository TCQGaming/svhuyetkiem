-------------------------------------------------------
-- văn kiện danh 　：qinshihuangling_5.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-09 13:06:16
-- văn kiện miêu tả ：
-------------------------------------------------------

-------------- định nghĩa riêng địa đồ quay về điều ---------------
local tbMap = Map:GetClass(1540);

-- định nghĩa ngoạn gia tiến nhập sự kiện 
function tbMap:OnEnter(szParam)
	
	-- phán đoán thặng dư thời gian 
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	
	-- thặng dư thời gian là 0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME or Boss.Qinshihuang:CheckOpenQinFive() ~= 1 then
		me.NewWorld(1538, 1762, 3191);		-- tầng thứ ba an toàn khu 
		me.SetFightState(0);
		return;
	end
	
	-- chiến đấu bảo hộ 
	Player:AddProtectedState(me, 6);
	
	-- địa đồ đối ngoạn gia ảnh hưởng 
	Boss.Qinshihuang:AddPlayer(me.nId, 5);
	
	-- địa đồ đối ngoạn gia ảnh hưởng 
	Boss.Qinshihuang:OnMapEffect(me.nId, 5);
	
	self:_SetState(me);
	
	-- thành tựu ：thành công tiến nhập Tần Thủy Hoàng lăng 5tằng 
	Achievement:FinishAchievement(me.nId, Achievement.QINSHIHUANG_5);
	
end;

-- định nghĩa ngoạn gia ly khai sự kiện 
function tbMap:OnLeave(szParam)
	
	-- thanh trừ địa đồ hiệu quả 
	Boss.Qinshihuang:OnMapLeave(me.nId, 5);
			
	-- dời ra trước mặt địa đồ đích liệt biểu 
	Boss.Qinshihuang:RemovePlayer(me.nId);
	
	self:_ResetState(me);
end;

function tbMap:_SetState(pPlayer)
	
	-- thiết trí vi bang hội hình thức 
	pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	
	-- cấm bày sạp 
	pPlayer.DisabledStall(1);	
	
	-- cấm cắt trạng thái chiến đấu 
	pPlayer.nForbidChangePK	= 1;
end

function tbMap:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end

-------------- định nghĩa riêng Trapđiểm quay về điều ---------------


-- phản hồi 4tằng điểm 1
local tbTrap1 = tbMap:GetTrapClass("trap_f4_1");

function tbTrap1:OnPlayer()
	
	me.NewWorld(1539, 1892, 3856);
	me.SetFightState(1);
end;


-- phản hồi 4tằng điểm 2
local tbTrap2 = tbMap:GetTrapClass("trap_f4_2");

function tbTrap2:OnPlayer()
	
	me.NewWorld(1539, 1938, 3799);
	me.SetFightState(1);
end;
