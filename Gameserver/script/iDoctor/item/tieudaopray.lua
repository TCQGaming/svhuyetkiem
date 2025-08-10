

local tbRuongtieudao = Item:GetClass("tieudaopray");
function tbRuongtieudao:OnUse()
	if me.CountFreeBagCell() < 1 then
		me.Msg("Túi của bạn đã đầy, cần ít nhất 1 ô trống.");
		return 0;
	end
	
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	
	-- random
	nRand = MathRandom(1, 10000);
	
	-- fill 3 rate	
	local tbRate = {6000, 3850, 150};
	local tbAward = {7 ,8, 9};
	
	-- get index
	for i = 1, 3 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
	if nIndex == 0 then
		me.Msg("Xin lỗi, bạn không nhận được gì.");
		return 0;
	end;
	local pItem = me.AddItem(18, 1, 114, tbAward[nIndex]);
	me.Msg("Bạn mở rương phát hiện <color=yellow>"..pItem.szName.."<color>");
	return 1;
end
