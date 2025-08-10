-- Șªvۯ͗װʹλϯƷ
-- By Peres 2009/06/13
-- ێһʳɢē

local tbItem = Item:GetClass("qinling_refine_item");

tbItem.tbData = 
{
	[360] = {10, 2}, -- ӤķֆìÿՎ 10 ֣ìخٟݓս 2 ܶ
	[363] = {10, 3}, -- ѡɽӡìÿՎ 10 ֣ìخٟݓս 3 ܶ
	[366] = {10, 4}, -- ľްػìÿՎ 10 ֣ìخٟݓս 4 ܶ
	[375] = {10*50, 4},-- ľްػx50ìÿՎ 10 ֣ìخٟݓս 4 ܶ
}

function tbItem:OnUse()
	
	if not self.tbData[it.nParticular] then
		me.Msg("Sử dụng không thành công");
		return;
	end
	
--	local nDailyNum	= me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_REFINE_ITEM);
--	if nDailyNum>= Boss.Qinshihuang.MAX_DAILY_REFINEITEM then
--		me.Msg("<color=green>Șʼ܊ªdڙخ<color>քʹλϯƷÿֻͬŜʹԃ <color=yellow>10 ٶ<color>á");
--		return;
--	end
	
	
	local nReputeLevel = me.GetReputeLevel(9, 1);
	if nReputeLevel>= self.tbData[it.nParticular][2] then
		me.Msg("Sử dụng <color=yellow>"..it.szName.."<color> có thể tăng danh vọng <color=green>Tần lăng-Quan phủ<color> cao nhất đến <color=yellow>"..self.tbData[it.nParticular][2].."<color> cấp");
		return;
	end
	
	local nFlag = Player:AddRepute(me, 9, 1, self.tbData[it.nParticular][1]);
	if (nFlag == 0) then
		return;
	elseif (nFlag == 1) then
		me.Msg("Danh vọng <color=green>Tần lăng-Quan phủ<color> của bạn đã đạt đến cấp cao nhất!");
		return;
	end	
	
--	nDailyNum = nDailyNum + 1;
--	me.SetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_REFINE_ITEM, nDailyNum);
	return 1;
end

