local tbZhenzhus = Item:GetClass("jxsf8_zhenyuanzhu");

function tbZhenzhus:OnUse()
	local szMsg = "Chân nguyên tu luyện, hộ thể cường thân. Phát quang thiên hạ.";
	local tbOpt = {
		{"Tu Luyện thuộc tính <color=gold>Thứ Nhất<color>", self.tuluyen1, self, it},
		{"Tu Luyện thuộc tính <color=gold>Thứ Hai<color>", self.tuluyen2, self, it},
		{"Tu Luyện thuộc tính <color=gold>Thứ Thứ Ba<color>", self.tuluyen3, self, it},
		{"Tu Luyệnthuộc tính <color=gold>Thứ Tư<color>", self.tuluyen4, self,it},
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end




function tbZhenzhus:tuluyen1(pThisItem)
local t = math.floor(os.clock());
	local currentTime = me.GetTask(9155,1);
	if t < currentTime then
		me.SetTask(9155,1,0);
	end
	if ( t - currentTime ) < 1 then
		me.Msg("Rap chậm thôi Ae =))");
		return;
	end
	me.SetTask(9155,1,t);
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if pItem == nil then
	me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
	return 0;
	end
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if pItem == nil then
	me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
	return 0;
	end
	local nLevel = pItem.GetGenInfo(1 * 2 - 1, 0);
	if nLevel >= 150 then
	me.Msg("Thuộc tính chân nguyên đã đạt tới hạn. Không thể tu luyện thêm");
	return 0;
	end
	if pThisItem.nCount > 1 then
		pThisItem.SetCount(pThisItem.nCount-1);
	else
		me.DelItem(pThisItem);
	end
	Item:UpgradeZhenYuanNoItem(pItem,10,1);
	me.Msg(string.format("Chúc mừng <color=gold>%s<color> tu luyện Chân Nguyên thành công thuộc tính thứ nhất tăng <color=gold> 10 điểm<color>.", me.szName));
	
end

function tbZhenzhus:tuluyen2(pThisItem)
	
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if pItem == nil then
	me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
	return 0;
	end
	local nLevel = pItem.GetGenInfo(2 * 2 - 1, 0);
	if nLevel >= 200 then
	me.Msg("Thuộc tính chân nguyên đã đạt tới hạn. Không thể tu luyện thêm");
	return 0;
	end
	if pThisItem.nCount > 1 then
		pThisItem.SetCount(pThisItem.nCount-1);
	else
		me.DelItem(pThisItem);
	end
	Item:UpgradeZhenYuanNoItem(pItem,10,2);
	me.Msg(string.format("Chúc mừng <color=gold>%s<color> tu luyện Chân Nguyên thành công thuộc tính thứ hai tăng <color=gold> 10 điểm<color>.", me.szName));
	
end

function tbZhenzhus:tuluyen3(pThisItem)
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if pItem == nil then
	me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
	return 0;
	end
	local nLevel = pItem.GetGenInfo(3 * 2 - 1, 0);
	if nLevel >= 200 then
	me.Msg("Thuộc tính chân nguyên đã đạt tới hạn. Không thể tu luyện thêm");
	return 0;
	end
	if pThisItem.nCount > 1 then
		pThisItem.SetCount(pThisItem.nCount-1);
	else
		me.DelItem(pThisItem);
	end
	Item:UpgradeZhenYuanNoItem(pItem,10,3);
	me.Msg(string.format("Chúc mừng <color=gold>%s<color> tu luyện Chân Nguyên thành công thuộc tính thứ ba tăng <color=gold> 10 điểm<color>.", me.szName));
	
end

function tbZhenzhus:tuluyen4(pThisItem)
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if pItem == nil then
	me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
	return 0;
	end
	local nLevel = pItem.GetGenInfo(4 * 2 - 1, 0);
	if nLevel >= 200 then
	me.Msg("Thuộc tính chân nguyên đã đạt tới hạn. Không thể tu luyện thêm");
	return 0;
	end
	if pThisItem.nCount > 1 then
		pThisItem.SetCount(pThisItem.nCount-1);
	else
		me.DelItem(pThisItem);
	end
	Item:UpgradeZhenYuanNoItem(pItem,10,4);
	me.Msg(string.format("Chúc mừng <color=gold>%s<color> tu luyện Chân Nguyên thành công thuộc tính thứ tư tăng <color=gold> 10 điểm<color>.", me.szName));
	
end

	
	
	
	
	
	
	
	
	
	