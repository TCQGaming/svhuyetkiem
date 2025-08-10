--Phát triển bởi TCQGaming
--Zalo: 0357091972
--Facebook: https://www.facebook.com/xboy.hd/
local tbItem = Item:GetClass("tuiquahotrotanthuday_moi_s4"); 
function tbItem:OnUse()

	Dialog:Say("Trang bị hỗ trợ tân thủ.\n<color=red>Mỗi nhân vật chỉ được nhận một lần duy nhất nên hãy cẩn thận<color>", {
		{"<color=blue>Ta Muốn Nhận Trang Bị<color>", self.AddItem, self},
			{"Kết thúc đối thoại"},
	});
	
end
tbItem.nWeaponLevel		= 10;					-- Vũ Khí
tbItem.nArmor_Level		= 10;					-- Trang Bị
tbItem.CuongHoa			= 12; 					-- cường hóa trang bị 
tbItem.CuongHoa1			= 14; 					-- cường hóa trang bị với vũ khí

function tbItem:AddItem()
local tbItemId = {18,1,1326,2,0,0}
	if nSex == 0 and nFactionId == 5 then
		Dialog:Say("Người thì làm sao vào Nga My được chứ.");
		return 0;
	elseif nSex == 1 and nFactionId == 1 then
		Dialog:Say("Thiếu Lâm Tự, từ xưa nay không nhận đệ tử là nữ.");
		return 0;
	end
	if (me.nSeries == 0) then
		Dialog: SendInfoBoardMsg(me, "Nhà ngươi hãy gia nhập vào môn phái rồi hãy quay lại !");
		return;
	end
	if me.nRouteId == 0 then
		Dialog: SendInfoBoardMsg(me, "<color=yellow>Nhà ngươi chưa chọn hệ môn phái Hãy F3 lên chọn phái trước nha");
		return
	end	
	if me.CountFreeBagCell() < 10 then
		Dialog:Say("Hãy xắp túi đủ 10 ô trống rồi quay lại");
		return 0;
	end
	local tbEquip	= tbItem.tbAddedItem[me.nFaction][me.nRouteId][me.nSex];
	if (not tbEquip) then
		return;
	end
		for i = 1, #tbEquip do
			local tbTmp = {unpack(tbEquip[i])};
			tbTmp[6] = tbTmp[6] or 1;
		local pItem = me.AddItem(unpack(tbTmp))
		local nDo = "Đồ Hỗ Trợ do ADM"
		if pItem then
			pItem.Bind(1);
			pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, nDo);		
			pItem.Sync();
		end
	end
Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
 end
 
 tbItem.tbAddedItem		= {						-- 60级紫装
		{	-- 少林
			{	-- 刀少林
				[0] = {	--男性
					{2,  1, 727-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},	--近身武器meleeweapon.txt
					{2,  3, 828-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--衣服armor
					{2,  9, 826-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--帽子helm
					{2,  8, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--腰带belt
					{2,  7, 408-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--鞋子boots
					{2, 10, 624-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--护腕cuff
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--项链necklace
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--戒指ring
					{2, 11, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--玉佩pendant
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},	--护身符amulet
				},
				[1] = {	--女性
					{2,  1, 727-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 838-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 836-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 418-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 318-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			}, 
			{	-- 	棍少林
				[0]	= {
					{2,  1, 737-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 808-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 806-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 408-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 624-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 737-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 818-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 816-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 418-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 318-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			}, 
		},
		{	-- 天王
			{	-- 	枪天王
				[0]	= {
					{2,  1, 747-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 808-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 806-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 408-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 624-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 747-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 818-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 816-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 418-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 318-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	--	锤天王
				[0]	= {
					{2,  1, 757-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 808-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 806-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 408-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 624-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 406-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},			
				[1]	= {
					{2,  1, 757-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 818-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 816-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 418-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 318-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 206-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 416-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 207-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
		{	-- Đường môn
			{	-- Bẫy Đường Môn nữ
				[0]	= {
					{2,  2,  86-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},	--远程武器rangeweapon.txt
					{2,  3, 848-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 846-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 328-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  2,  86-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 858-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 856-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 	Đường môn nỏ nữ 
				[0]	= {
					{2,  2,  96-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},	--远程武器rangeweapon.txt
					{2,  3, 848-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 846-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 328-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  2,  96-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 858-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 856-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
		{	-- 五毒
			{	-- 刀毒
				[0]	= {
					{2,  1, 767-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 848-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 846-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 328-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 767-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 858-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 856-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 掌毒
				[0]	= {
					{2,  1, 777-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 868-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 866-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 777-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 878-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 876-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
		{	-- 峨嵋
			{	-- 掌em
				[0] = {
					{2,  1, 807-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 807-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				}
			},
			{	-- 辅助
				[0] = {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				}
			},
		},
		{	-- 翠烟
			{	-- 剑翠
				[0]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 刀翠
				[0]	= {
					{2,  1, 787-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 787-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},       
			},
		},
		{	-- 丐帮
			{	-- 掌丐  
				[0]	= {  
					{2,  1, 847-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 748-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 746-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 368-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 468-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 847-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 758-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 756-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 378-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 478-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 棍丐
				[0]	= {
					{2,  1, 827-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 748-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 746-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 368-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 468-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 827-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 758-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 756-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 378-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 478-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				}
			},
		},
		{	-- 天忍
			{	-- 战忍
				[0]	= {
					{2,  1, 837-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 728-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 726-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 368-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,10, 468-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 837-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 738-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 736-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 378-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 478-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				};
			},
			{	-- 魔忍
				[0]	= {
					{2,  1, 857-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 748-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 746-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 368-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 468-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 366-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 857-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 758-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 756-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 378-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 478-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 186-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 236-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 376-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 187-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
		{	-- 武当
			{	-- 气武
				[0]	= {
					{2,  1, 887-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 988-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 986-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 887-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 998-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 996-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 剑武
				[0]	= {
					{2,  1, 877-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 968-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 966-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10,488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 877-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 978-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 976-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},

		},
		{	-- 昆仑
			{	-- 刀昆
				[0]	= {
					{2,  1, 867-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 988-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 986-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10,488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 867-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 998-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 996-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 剑昆
				[0]	= {
					{2,  1, 897-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 988-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 986-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 488-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 486-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				}, 
				[1]	= {
					{2,  1, 897-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
				  	{2,  3, 998-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
			   		{2,  9, 996-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2,  8, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2,  7, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2, 10, 498-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2,  5, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2,  4, 246-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2, 11, 496-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                    {2,  6, 247-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
                },
            },
		},
		{	-- 明教
			{	-- 锤明教
				[0] = {
					{2,  1, 987-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 848-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 846-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 328-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 987-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 858-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 856-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 358-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 剑明教
				[0]	= {
					{2,  1, 977-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 868-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 866-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 428-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 426-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 977-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 878-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 876-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 438-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 216-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 436-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 217-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
		{	-- 段氏
			{	-- 指段氏
				[0] = {
					{2,  1, 797-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 797-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
			{	-- 气段氏
				[0]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 908-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 906-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 448-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 446-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
				[1]	= {
					{2,  1, 817-6+tbItem.nWeaponLevel, tbItem.nWeaponLevel, nil,tbItem.CuongHoa1},
					{2,  3, 918-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  9, 916-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  8, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  7, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 10, 458-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  5, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  4, 226-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2, 11, 456-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
					{2,  6, 227-6+tbItem.nArmor_Level,tbItem. nArmor_Level, nil,tbItem.CuongHoa},
				},
			},
		},
};
