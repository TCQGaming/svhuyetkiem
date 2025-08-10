
local tbChongTrangBiPet = {};
SpecialEvent.ChongTrangBiPet = tbChongTrangBiPet;
--=======================================--
local tbTimeStart={};
--=======================================--
function tbChongTrangBiPet:Login()
	tbTimeStart[me.nId] = Timer:Register(1 * Env.GAME_FPS, self.CheckItemPet, self,me);  ---- hệ thống chạy kiểm tra
end
--=======================================--Check đồ người mang vào pét--=======================================--
function tbChongTrangBiPet:CheckItemPet(pPlayer) --Check đồ người mang vào pét
	local nOk = 0;
		for i = 1, Item.PARTNEREQUIP_NUM do
		local pItem = pPlayer.GetItem(Item.ROOM_PARTNEREQUIP, i - 1, 0);
	if pItem then
		local nDetail = pItem.nDetail;
		if nDetail < Item.EQUIP_PARTNERWEAPON then
			nOk = 1;
			break;
		end
	end
end
	if nOk == 1 then
	local nMapId = pPlayer.GetWorldPos();
	if (nMapId >= 1497 and nMapId <= 1503) then
		return 0;
	else
	--	GM.tbGMRole:ArrestHim(pPlayer.nId)
	   me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..pPlayer.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
	end
end
	local nMapId = pPlayer.GetWorldPos();
	if (nMapId >= 1497 and nMapId <= 1503) then	
		return 0;	
	else
		self:CheckEquip1(pPlayer);
		self:CheckEquip2(pPlayer);
		self:CheckEquip3(pPlayer);
		self:CheckEquip4(pPlayer);
		self:CheckEquip5(pPlayer);
	end
	return 1 * Env.GAME_FPS
end
--=======================================--
function tbChongTrangBiPet:CheckEquip1(pPlayer)
	local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_BODY, 0);
	if not pItem then
		return 0;
    end	
	if (pItem.nGenre == 5)	then
	--	GM.tbGMRole:ArrestHim(pPlayer.nId);
	    me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..me.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
        else
		return 0;
    end
end
--=======================================--
function tbChongTrangBiPet:CheckEquip2(pPlayer)
	local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_BELT, 0);
	if not pItem then
		return 0;
    end	
	if (pItem.nGenre == 5)	then
	--	GM.tbGMRole:ArrestHim(pPlayer.nId);
	    me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..me.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
        else
		return 0;
    end
end
--=======================================--
function tbChongTrangBiPet:CheckEquip3(pPlayer)
	local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_HEAD, 0);
	if not pItem then
		return 0;
    end	
	if (pItem.nGenre == 5)	then
	--	GM.tbGMRole:ArrestHim(pPlayer.nId);
	    me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..me.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
        else
		return 0;
    end
end
--=======================================--
function tbChongTrangBiPet:CheckEquip4(pPlayer)
	local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_WEAPON, 0);
	if not pItem then
		return 0;
    end		
	if (pItem.nGenre == 5)	then
	--	GM.tbGMRole:ArrestHim(pPlayer.nId);
	    me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..me.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
        else
		return 0;
    end
end
--=======================================--
function tbChongTrangBiPet:CheckEquip5(pPlayer)
	local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_FOOT, 0);
	if not pItem then
		return 0;
    end	
	if (pItem.nGenre == 5)	then
	--	GM.tbGMRole:ArrestHim(pPlayer.nId);
	    me.NewWorld(1497,1625,3190);--dao hoa quyen
		KDialog.MsgToGlobal("<color=red>Cảnh Báo<color><color=yellow>Người Chơi <color=red>"..me.szName.."<color> đã mang sai hoặc cố tình bug trang bị đồng hành. Hệ thống tự động cho lên đảo<color>");	
        else
		return 0;
    end
end
--=======================================--
	PlayerEvent:RegisterGlobal("OnLogin", tbChongTrangBiPet.Login, tbChongTrangBiPet);
--=======================================--

