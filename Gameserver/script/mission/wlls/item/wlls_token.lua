--武林联赛令牌
--孙多良
--2008.10.14

local tbItem = Item:GetClass("wlls_token");
tbItem.tbAward = 
{
	[1] = 50,
	[2] = 200,
	[3] = 300,
	[4] = 500,
}

function tbItem:OnUse()	
	local nFlag = Player:AddRepute(me, 7, 1, self.tbAward[it.nLevel]);

	if (0 == nFlag) then
		return;
	elseif (1 == nFlag) then
		me.Msg("Danh vọng đã đạt mức tối đa");
		return;
	end	

	me.Msg(string.format("Bạn nhận được <color=yellow>%s<color> điểm danh vọng võ lâm liên đấu.",self.tbAward[it.nLevel]))
	return 1;
end


