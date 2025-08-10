-------------------------------------------------------------------
--File: 	factionshop_gs.lua
--Author: 	sunduoliang
--Date: 	2008-3-14
--Describe:	Môn phái chưởng môn nhân chỗ mua Môn phái thi đấu thể thao trang bị 
-------------------------------------------------------------------
local tbFactionShop	= {};	-- 	Môn phái chiến thời gian nghỉ ngơi hoạt động 
FactionBattle.tbFactionShop = tbFactionShop;

tbFactionShop.tbFactionShopID =
{
	[1] = 25, -- Thiếu Lâm 
	[2] = 26, --thiên Vương chưởng môn 
	[3] = 27, --Đường Môn chưởng môn 
	[4] = 29, --ngũ độc chưởng môn 
	[5] = 31, --Nga mi chưởng môn 
	[6] = 32, --thúy yên chưởng môn 
	[7] = 34, --Cái Bang chưởng môn 
	[8] = 33, --thiên nhẫn chưởng môn 
	[9] = 35, --Vũ Đương chưởng môn 
	[10] = 36, --Côn Lôn chưởng môn 
	[11] = 28, --Minh Giáo chưởng môn 
	[12] = 30, --Đại Lý Đoàn Thị chưởng môn 
}

function tbFactionShop:OpenShop(nFaction)
	me.OpenShop(self.tbFactionShopID[nFaction], 1) --sử dụng danh vọng mua 
end
