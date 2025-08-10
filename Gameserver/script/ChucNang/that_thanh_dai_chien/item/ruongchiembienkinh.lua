-----Dev : TCQGaming
-----Time : 10/01/2024 2:38 PM
local KnbBiz = Item:GetClass("ruongchiem_bk");

function KnbBiz:OnUse()	
-- DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\item\\ruongchiembienkinh.lua");
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
		local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
	local nName = "<color=green>"..szTongName.." Bang"
	if tbInfo.nSex ~= 0 then
	local pItem = 		me.AddItem(1,25,115,1)
	local pItem1 = 		me.AddItem(1,26,115,1)
			pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, nName);		
			pItem.Sync();	
			pItem1.SetCustom(Item.CUSTOM_TYPE_MAKER, nName);		
			pItem1.Sync();	
								me.SetItemTimeout(pItem, 5*24*60, 0);
								me.SetItemTimeout(pItem1, 5*24*60, 0);
	else 		
			local pItem = 		me.AddItem(1,25,114,1)
			local pItem1 = 		me.AddItem(1,26,114,1)
			pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, nName);		
			pItem.Sync();	
			pItem1.SetCustom(Item.CUSTOM_TYPE_MAKER, nName);		
			pItem1.Sync();	
			me.SetItemTimeout(pItem, 5*24*60, 0);
			me.SetItemTimeout(pItem1, 5*24*60, 0);
	end 
return 1;-----Xóa vật phẩm sau khi sử dụng
end

