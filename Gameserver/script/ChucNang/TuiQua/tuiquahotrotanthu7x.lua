local tbItem = Item:GetClass("tuiquahotrotanthu7x"); 
local tbItemId = {18,1,2111,3,0,0}
function tbItem:OnUse()
			if me.GetTask(8007,1) > 0 then
			me.Msg("Nhận rồi thì không được nhận nữa");
			Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
			return 0;	
			end
	Dialog:Say("Trang bị hỗ trợ tân thủ.\n<color=red>Mỗi nhân vật chỉ được nhận một lần duy nhất nên hãy cẩn thận<color>", {
			{"Lựa chọn môn phái", self.GetEquipFaction, self, 1, 8},
			{"Kết thúc đối thoại"},
	});
	
end
tbItem.nWeaponLevel		= 7;					-- 宋金体验的武器等级
tbItem.nArmor_Level		= 7;					-- 宋金体验的防具等级
		-- 20格背包
tbItem.tbAddedItem		= {						-- 60级紫装
		{	-- 少林
			{	-- 刀少林
				[0] = {	--男性
					{2,  1, 727-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},	--近身武器meleeweapon.txt
					{2,  3, 828-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--衣服armor
					{2,  9, 826-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--帽子helm
					{2,  8, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--腰带belt
					{2,  7, 408-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--鞋子boots
					{2, 10, 564-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--护腕cuff
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--项链necklace
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--戒指ring
					{2, 11, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--玉佩pendant
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},	--护身符amulet
				},
				[1] = {	--女性
					{2,  1, 727-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 838-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 836-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 418-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 570-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			}, 
			{	-- 	棍少林
				[0]	= {
					{2,  1, 737-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 808-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 806-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 408-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 564-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 737-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 818-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 816-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 418-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 570-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			}, 
		},
		{	-- 天王
			{	-- 	枪天王
				[0]	= {
					{2,  1, 747-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 808-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 806-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 408-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 564-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 747-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 818-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 816-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 418-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 570-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	--	锤天王
				[0]	= {
					{2,  1, 757-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 808-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 806-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 408-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 564-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 406-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},			
				[1]	= {
					{2,  1, 757-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 818-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 816-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 418-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 570-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 206-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 416-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 207-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
		{	-- 唐门
			{	-- 陷阱唐门
				[0]	= {
					{2,  2,  86-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},	--远程武器rangeweapon.txt
					{2,  3, 848-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 846-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 576-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  2,  86-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 858-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 856-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 582-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 	袖箭唐
				[0]	= {
					{2,  2,  96-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},	--远程武器rangeweapon.txt
					{2,  3, 848-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 846-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 576-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  2,  96-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 858-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 856-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 582-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
		{	-- 五毒
			{	-- 刀毒
				[0]	= {
					{2,  1, 767-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 848-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 846-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 576-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 767-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 858-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 856-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 582-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 掌毒
				[0]	= {
					{2,  1, 777-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 868-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 866-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 777-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 878-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 876-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
		{	-- 峨嵋
			{	-- 掌em
				[0] = {
					{2,  1, 807-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 807-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				}
			},
			{	-- 辅助
				[0] = {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				}
			},
		},
		{	-- 翠烟
			{	-- 剑翠
				[0]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 刀翠
				[0]	= {
					{2,  1, 787-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 787-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},       
			},
		},
		{	-- 丐帮
			{	-- 掌丐  
				[0]	= {  
					{2,  1, 847-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 748-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 746-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 368-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 468-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 847-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 758-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 756-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 378-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 478-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 棍丐
				[0]	= {
					{2,  1, 827-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 748-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 746-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 368-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 468-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 827-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 758-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 756-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 378-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 478-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				}
			},
		},
		{	-- 天忍
			{	-- 战忍
				[0]	= {
					{2,  1, 837-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 728-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 726-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 368-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,10, 468-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 837-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 738-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 736-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 378-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 478-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				};
			},
			{	-- 魔忍
				[0]	= {
					{2,  1, 857-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 748-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 746-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 368-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 468-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 366-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 857-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 758-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 756-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 378-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 478-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 186-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 236-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 376-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 187-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
		{	-- 武当
			{	-- 气武
				[0]	= {
					{2,  1, 887-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 988-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 986-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 887-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 998-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 996-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 剑武
				[0]	= {
					{2,  1, 877-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 968-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 966-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10,488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 877-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 978-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 976-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},

		},
		{	-- 昆仑
			{	-- 刀昆
				[0]	= {
					{2,  1, 867-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 988-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 986-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10,488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 867-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 998-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 996-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 剑昆
				[0]	= {
					{2,  1, 897-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 988-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 986-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 488-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 486-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				}, 
				[1]	= {
					{2,  1, 897-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
				  	{2,  3, 998-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
			   		{2,  9, 996-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2,  8, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2,  7, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2, 10, 498-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2,  5, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2,  4, 246-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2, 11, 496-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                    {2,  6, 247-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
                },
            },
		},
		{	-- 明教
			{	-- 锤明教
				[0] = {
					{2,  1, 987-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 848-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 846-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 576-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 987-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 858-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 856-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 582-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 剑明教
				[0]	= {
					{2,  1, 977-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 868-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 866-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 428-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 426-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 977-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 878-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 876-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 438-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 216-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 436-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 217-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
		{	-- 段氏
			{	-- 指段氏
				[0] = {
					{2,  1, 797-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 797-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
			{	-- 气段氏
				[0]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 908-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 906-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 448-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 446-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, -1},
					{2,  3, 918-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  9, 916-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  8, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  7, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 10, 458-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  5, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  4, 226-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2, 11, 456-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
					{2,  6, 227-6+tbItem.nArmor_Level, tbItem.nArmor_Level, -1},
				},
			},
		},
};

function tbItem:GetEquipFaction(nPosStartIdx, nQiangHua)
	local tbOpt		= {};
	local nCount	= 9;
	for i = nPosStartIdx, Player.FACTION_NUM do
		if (nCount <= 0) then
			tbOpt[#tbOpt]	= {"Trang Sau", self.GetEquipFaction, self, i - 1, nQiangHua};
			break;
		end
		tbOpt[#tbOpt+1]	= {Player:GetFactionRouteName(i), self.GetEquipRoute, self, i, 1, nQiangHua};
		nCount	= nCount - 1;
	end;
	tbOpt[#tbOpt+1]	= {"Kết thúc đối thoại"};
	Dialog:Say("Chọn Môn phái muốn lấy đồ", tbOpt);
end

-- 获得60级紫装所属的路线
function tbItem:GetEquipRoute(nFactionId, nPosStartIdx, nQiangHua)
	local tbOpt		= {};
	local nCount	= 9;
	for i = nPosStartIdx, #Player.tbFactions[nFactionId].tbRoutes do
		if (nCount <= 0) then
			tbOpt[#tbOpt]	= {"Trang Sau", self.GetEquipRoute, self, nFactionId, i - 1, nQiangHua};
			break;
		end
		tbOpt[#tbOpt+1]	= {Player:GetFactionRouteName(nFactionId, i).." đồ môn phái", self.GetEquip, self, nFactionId, i, nQiangHua};
		nCount	= nCount - 1;
	end;
	tbOpt[#tbOpt+1]	= {"Kết thúc đối thoại"};
	Dialog:Say("Lựa Chọn Môn phái bạn muốn lấy đồ?", tbOpt);
end

-- 获得60级紫装
function tbItem:GetEquip(nFactionId, nRouteId, nQiangHua)
	local tbEquip	= self.tbAddedItem[nFactionId][nRouteId][me.nSex];
	if me.CountFreeBagCell() < 20 then
	me.Msg("Chừa hành nang 20 ô trống");
	return;
	end
	if (not tbEquip) then
		return;
	end
	for i = 1, #tbEquip do
		local tbTmp = {unpack(tbEquip[i])};
		tbTmp[6] = tbTmp[6] or nQiangHua;
	local pAddItem = me.AddItem(unpack(tbTmp));	
		pAddItem.Bind(0);
	end
--	Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
	me.SetTask(8007,1,1);
	return 1;
end
