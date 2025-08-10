-----Dev : TCQGaming
-----Time : 13/02/2031 7:38 PM
local KnbBiz = Item:GetClass("capsach_20_11");

function KnbBiz:OnUse()	
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang11\\capsach.lua");
	if me.CountFreeBagCell() < 3 then
		Dialog:Say("Phải Có 3 Ô Trống Trong Hành Trang Mới Sử Dụng Được !");
		return 0;
	end
	local tbItemId1	= {18,1,2033,1,0,0};--Rương TĐLT
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	nRand = MathRandom(1, 75);
		local tbRate = {25,25,25};
	local tbAward = 
	{
		[1] =	{18, 1, 2033,2} ;
		[2] =	{18, 1, 2033,3};--Tranh con giáp
		[3] =	{18, 1, 2033,4};--Hoa đăng liễn
		
	}
	
	for i = 1, 3 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end	
	
	Task:DelItem(me, tbItemId1, 1);

	if (nIndex ==1) or (nIndex == 2) or (nIndex == 3)  then
		local pItem = me.AddItem(unpack(tbAward[nIndex]));
		-- pItem.Bind(1);
	end
	
end