--ki quan đại sư 
--tôn đa lương 
--2008.08.15

local tbNpc = Npc:GetClass("jiguandashi");
tbNpc.tbArmyBag = {20,1,482,1};
tbNpc.tbArmyHandBook = {20,1,483,1};
tbNpc.nTaskGroupId = 2044;	--tùy ki thu được linh kiện đích nhiệm vụ biến lượng Group
tbNpc.tbTaskId =
{
	--tùy ki thu được linh kiện đích nhiệm vụ biến lượng 
	1,2,3,4,5,6,7,8,9,10,
}

function tbNpc:OnDialog()
	local szMsg ="thiên địa phân âm dương ，vạn vật hóa ngũ hành ，cùng phụ năng phối hợp ，tương khắc hựu cùng sinh 。ki quan học đích tinh túy điều không phải xảo đoạt thiên công đích kỹ nghệ ，mà là thuận ứng tự nhiên sáng tạo 。";
	local tbOpt = 
	{
		{"dùng ki quan bền đoái hoán vật phẩm", Dialog.OpenShop, Dialog, 129, 10},
		{"lĩnh thủ ki quan rương", self.GetArmyBag, self},
		--{"lĩnh thủ ki quan tài liệu thủ sách", self.GetArmyHandBook, self},
		{"lĩnh thủ ki quan tài liệu thủ sách đích tưởng lệ", self.recycleHandBook, self},
		{"kết thúc đối thoại"},
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:GetArmyBag()
	if me.nLevel <90 then
		Dialog:Say("ki quan đại sư ：ngài phải tới 90cấp mới có tư cách hoạt động ki quan rương 。");
		return 0;
	end
	if me.GetTask(1022,117) ~= 1 then
		Dialog:Say("ki quan đại sư ：người tuổi trẻ ，ngươi hoàn chưa nhập môn ，thỉnh tiên đi hoàn thành một lần tân quân thao luyện nhiệm vụ ba 。");		
		return 0;
	end
	local tbFind1 = me.FindItemInBags(unpack(self.tbArmyBag));
	local tbFind2 = me.FindItemInRepository(unpack(self.tbArmyBag));
	if #tbFind1 <= 0 and #tbFind2 <= 0 then
		if me.CountFreeBagCell()>= 1 then
			local pItem = me.AddItem(unpack(self.tbArmyBag));
			if pItem then
				
			end
			Dialog:Say("ki quan đại sư ：ngài thành công lĩnh lấy ki quan rương 。")
		else
			Dialog:Say("ki quan đại sư ：ngài đích ba lô không gian bất túc 。");
		end
	else
		Dialog:Say("ki quan đại sư ：ngài dĩ lĩnh lấy ki quan rương 。")
	end
	return 0;
end

function tbNpc:GetArmyHandBook()
	local tbFind1 = me.FindItemInBags(unpack(self.tbArmyHandBook));
	local tbFind2 = me.FindItemInRepository(unpack(self.tbArmyHandBook));
	if #tbFind1 <= 0 and #tbFind2 <= 0 then
		if me.CountFreeBagCell()>= 1 then
			local pItem = me.AddItem(unpack(self.tbArmyHandBook));
			if pItem then
				pItem.Bind(1);
			end
			Dialog:Say("ki quan đại sư ：ngài thành công lĩnh lấy ki quan tài liệu thủ sách 。")
		else
			Dialog:Say("ki quan đại sư ：ngài đích ba lô không gian bất túc 。");
		end
	else
		Dialog:Say("ki quan đại sư ：ngài dĩ lĩnh lấy ki quan tài liệu thủ sách 。")
	end
	return 0;
end

function tbNpc:recycleHandBook()
	local tbFind1 = me.FindItemInBags(unpack(self.tbArmyHandBook));
	if #tbFind1 <= 0 then
		Dialog:Say("ki quan đại sư ：ngài trên người không có ki quan tài liệu thủ sách a 。")
		return 0;
	end
	for i, nTaskId in pairs(self.tbTaskId) do
		if me.GetTask(self.nTaskGroupId, nTaskId) == 0 then
			Dialog:Say("ki quan đại sư ：ngài hoàn không có tập tề 10cá ki quan linh kiện ni ，tiếp theo nỗ lực lên ba 。")
			return 0;
		end
	end
	me.ConsumeItemInBags(1,unpack(self.tbArmyHandBook));
	for i, nTaskId in pairs(self.tbTaskId) do
		me.SetTask(self.nTaskGroupId, nTaskId, 0)
	end
	me.AddExp(1000000);
	me.Earn(10000, Player.emKEARN_TASK_ARMYCAMP);
	KStatLog.ModifyAdd("jxb","[sản ra]quân doanh nhiệm vụ","tổng lượng", 10000)
	me.AddMachineCoin(150);
	me.AddRepute(1, 3, 150);
	me.Msg("ngươi thu được liễu 1000000kinh nghiệm");
	me.Msg("ngươi thu được liễu 10000ngân lưỡng");
	me.Msg("ngươi thu được liễu 150ki quan học kinh nghiệm");
	me.Msg("ngươi thu được liễu 150ki quan bền độ");
end
