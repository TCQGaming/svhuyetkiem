-- văn kiện danh 　：mask_card.lua
-- sang xây người 　：jiazhenwei
-- sang xây thời gian ：2010-03-19 18:55:03
-- miêu  thuật  ：đạo cụ tạp phiến 

local tbItem = Item:GetClass("mask_card3");

tbItem.tbMask = {	{1, 13, 46, 1},
				{1, 13, 47, 1},
			 };

function tbItem:OnUse()
	local szInfo ="Hãy chọn mặt nạ mà bạn muốn:";
	local tbOpt ={
			--{"[Mặt nạ]Phương Hành Giác(3 ngày)",	self.AddMask, self, 1, it.dwId},
			--{"[Mặt nạ]Khiên Vân Thủ(3 ngày)", self.AddMask, self, 2, it.dwId},
			{"Đóng"},
		};
	Dialog:Say(szInfo,tbOpt);
	return 0;
end

function tbItem:AddMask(nType, nItemId)
	local pItem = KItem.GetObjById(nItemId);
	if pItem then
		pItem.Delete(me);
		me.AddItem(unpack(self.tbMask[nType]));
	end
end
	
