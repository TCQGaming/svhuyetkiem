--quân doanh nhiệm vụ.linh kiện 
--tôn đa lương 
--2008.08.18

local tbItem = Item:GetClass("army_part")

tbItem.nTaskGroupId = 2044;	--tùy ki thu được linh kiện đích nhiệm vụ biến lượng Group
tbItem.nRate =	10; --mỗi độc nhất trang thu được linh kiện đích xác suất,tỉ lệ phần trăm 
tbItem.tbArmyHandBook = {20,1,483,1};
tbItem.tbTaskId =
{
	--tùy ki thu được linh kiện đích nhiệm vụ biến lượng 
	1,2,3,4,5,6,7,8,9,10,
}
tbItem.tbTaskName = {"tiền trục","hậu trục","trung cốt","cánh tả","hữu quân","Tiêu thạch","lưu hoàng","Gỗ","đồng khối","Thủy ngân"};

function tbItem:OnUse()
	local tbFind1 = me.FindItemInBags(unpack(self.tbArmyHandBook));
	local tbFind2 = me.FindItemInRepository(unpack(self.tbArmyHandBook));
	if #tbFind1 <= 0 and #tbFind2 <= 0 then
		if me.CountFreeBagCell()>= 1 then
			local pItem = me.AddItem(unpack(self.tbArmyHandBook));
			if pItem then
				pItem.Bind(1);
			end
			--me.Msg("ngài thu được liễu ki quan tài liệu thủ sách 。")
		else
			me.Msg("ngài đích ba lô không gian bất túc 。");
			return 0;
		end
	end
	local nFull = 0;
	for ni, nTaskId in pairs(self.tbTaskId) do
		if me.GetTask(self.nTaskGroupId, nTaskId) == 0 then
			nFull = 1;
			break;
		end
	end
	if nFull == 0 then
		me.Msg("ngài đích ki quan linh kiện dĩ toàn bộ thu thập hoàn ，thỉnh đáo Phục Ngưu Sơn quân doanh đích thiên ki Tử xử đoái hoán tưởng lệ hậu ，sử dụng nữa linh kiện 。")
		return 0;
	end
	local nR = Random(10)+1;
	if me.GetTask(self.nTaskGroupId, self.tbTaskId[nR]) == 0 then
		me.SetTask(self.nTaskGroupId, self.tbTaskId[nR], 1);
		me.Msg(string.format("thu được liễu một <color=yellow>%s<color>gia nhập thủ sách trung 。",self.tbTaskName[nR]));
	else
		me.Msg(string.format("thu được liễu một <color=yellow>%s<color>，nhưng thủ sách trung dĩ tồn tại đáng linh kiện liễu 。",self.tbTaskName[nR]));
	end
	for ni, nTaskId in pairs(self.tbTaskId) do
		if me.GetTask(self.nTaskGroupId, nTaskId) == 0 then
			return 1;
		end
	end
	me.Msg("ki quan tài liệu dĩ toàn bộ thu thập toàn bộ liễu ，thỉnh đáo Phục Ngưu Sơn quân doanh đích thiên ki Tử xử đoái hoán tưởng lệ 。")
	Dialog:SendBlackBoardMsg(me,"ki quan tài liệu dĩ toàn bộ thu thập toàn bộ liễu ，thỉnh đáo Phục Ngưu Sơn quân doanh đích thiên ki Tử xử đoái hoán tưởng lệ 。");
	return 1;
end
