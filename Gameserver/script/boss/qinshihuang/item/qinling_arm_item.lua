-- ȘªїӸb܆ްϯƷնݓʹλϯƷ
-- By Peres 2009/06/13
-- ێһʳɢē

local tbItem = Item:GetClass("qinling_arm_item");

tbItem.tbData = 
{
	[369] = {100, 2}, -- ԱػìÿՎ 100 ֣ìخٟݓս 2 ܶ
	[377] = {100, 3}, -- ۍˏcống ̓ߴΠ100 ֣ìخٟݓս 3 ܶ
}

function tbItem:OnUse()
	
	if not self.tbData[it.nParticular] then
		me.Msg("Sử dụng không thành công.");
		return;
	end
	
	local nReputeLevel = me.GetReputeLevel(9, 2);
	if nReputeLevel>= self.tbData[it.nParticular][2] then
		me.Msg("Sử dụng <color=yellow>"..it.szName.."<color> Giúp danh vọng <color=green>Tần lăng-Phát khâu Môn<color> có thể tăng đến <color=yellow>"..self.tbData[it.nParticular][2].."<color> Cấp");
		return;
	end
	
	local nFlag = Player:AddRepute(me, 9, 2, self.tbData[it.nParticular][1]);
	if (nFlag == 0) then
		return;
	elseif (nFlag == 1) then
		me.Msg("Danh vọng <color=green>Tần lăng-Phát khâu Môn<color> đã đạt cấp cao nhất.");
		return;
	end	
	return 1;
end

