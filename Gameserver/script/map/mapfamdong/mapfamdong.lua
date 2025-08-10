-------------------------------------------------------
-- văn kiện danh 　：qinshihuangling_5.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-09 13:06:16
-- văn kiện miêu tả ：
-------------------------------------------------------

-------------- định nghĩa riêng địa đồ quay về điều ---------------
local tbMap = Map:GetClass(1721);

-- định nghĩa ngoạn gia tiến nhập sự kiện 
function tbMap:OnEnter(szParam)
	
	me.nPkModel = Player.emKPK_STATE_TONG;
	
	-- cấm bày sạp 
	me.DisabledStall(1);	
	
	-- cấm cắt trạng thái chiến đấu 
	me.nForbidChangePK	= 1;
	Player:AddProtectedState(me, 5);
	
end;
function tbMap:OnLeave(szParam)
	
	-- thanh trừ địa đồ hiệu quả 
	me.DisabledStall(0);
	me.nForbidChangePK	= 0;
end;
-- định nghĩa ngoạn gia ly khai sự kiện 
