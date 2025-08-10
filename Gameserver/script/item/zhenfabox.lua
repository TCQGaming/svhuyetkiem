-------------------------------------------------------
-- 文件名　：zhenfabox.lua
-- 文件描述：阵法箱 用于取阵法书及销毁阵法书
-- 创建者　：ZhangDeheng
-- 创建时间：2009-03-26 11:53:08
-------------------------------------------------------

local tbItem = Item:GetClass("zhenfa_box")

tbItem.ZHENFA_LIST = {
			{"Trận pháp-Cao: Ngũ Hành Trận", 1, 15, 12, 1},
			{"Trận pháp-Cao: Bát quái trận-Li", 1, 15, 2, 1},
			{"Trận pháp-Cao: Bát quái trận-Đoài", 1, 15, 3, 1},
			{"Trận pháp-Cao: Bát quái trận-Cấn", 1, 15, 4, 1},
			{"Trận pháp-Cao: Bát quái trận-Khảm", 1, 15, 5, 1},
			{"Trận pháp-Cao: Bát quái trận-Tốn", 1, 15, 6, 1},
			{"Trận pháp-Cao: Bát quái trận-Càn", 1, 15, 7, 1},
			{"Trận pháp-Cao: Thanh Long Trận", 1, 15, 8, 1},
			{"Trận pháp-Cao: Huyền Vũ Trận", 1, 15, 9, 1},
			{"Trận pháp-Cao: Bạch Hổ Trận", 1, 15, 10, 1},
			{"Trận pháp-Cao: Chu Tước Trận", 1, 15, 11, 1},
			
	}
	
tbItem.LIVE_TIME	= 30 * 24 * 60 * 60; -- 秒 一个月
	
function tbItem:InitGenInfo()
	--设置道具的生存期
	if MODULE_GAMECLIENT then
		it.SetTimeOut(1, self.LIVE_TIME);
	else
		it.SetTimeOut(0, GetTime() + self.LIVE_TIME);
	end;
	return	{};
end

function tbItem:OnUse()
	local szMsg 		= "Hãy chọn thao tác cần làm:"
	local tbOpt 		= {};
	tbOpt[#tbOpt + 1] 	= {"Lấy trận pháp", self.SelectBook, self, me.nId, it.dwId};
	tbOpt[#tbOpt + 1]	= {"Trả trận pháp", self.DeleteBook, self, me.nId};
	tbOpt[#tbOpt + 1]	= {"Hủy bỏ"};
	
	Dialog:Say(szMsg, tbOpt);
end;

function tbItem:SelectBook(nPlayerId, nBoxId)
	local szMsg 	= "Hãy chọn trận pháp đồ bạn muốn lấy ："
	local tbOpt		= {};
	
	for i = 1, #self.ZHENFA_LIST do 
	tbOpt[#tbOpt + 1]	= {self.ZHENFA_LIST[i][1], self.GiveBook, self, nPlayerId, i, nBoxId};
	end;
	
	tbOpt[#tbOpt + 1]	=  {"Đóng"};
	
	Dialog:Say(szMsg, tbOpt); 
end;

function tbItem:GiveBook(nPlayerId, nBookId, nBoxId)
	local pBox = KItem.GetObjById(nBoxId);
	if (not pBox) then
		print("ZhenFaBox ERROR", nPlayerId, nBookId, nBoxId);
		return;
	end;
	
	-- bind
	pBox.Bind(1);
	
	local pItem = me.AddItem(self.ZHENFA_LIST[nBookId][2], self.ZHENFA_LIST[nBookId][3], self.ZHENFA_LIST[nBookId][4], self.ZHENFA_LIST[nBookId][5]);
	if (not pItem) then
		return;
	end;

	local tbTimeOut = me.GetItemAbsTimeout(pBox);		--设置绝对过期时间
	if (tbTimeOut) then
		local szTime = string.format("%02d/%02d/%02d/%02d/%02d/10", 			
				tbTimeOut[1],
				tbTimeOut[2],
				tbTimeOut[3],
				tbTimeOut[4],
				tbTimeOut[5]);
		me.SetItemTimeout(pItem, szTime);
		pItem.Sync()
	end;	
end;

function tbItem:DeleteBook(nPlayerId)
	Dialog:OpenGift("Xin vui lòng đặt trận đồ muốn hủy vào", nil, {self.OnOpenGiftOk, self});
end;

function tbItem:OnOpenGiftOk(tbItemObj)
	local bForbidItem 	= false;
	
	for _, pItem in pairs(tbItemObj) do
		if (self:CheckItem(pItem) == 0) then
			me.DelItem(pItem[1]);
		else
			bForbidItem = true;
		end;
	end
	
	if (bForbidItem == true) then
		me.Msg("Lấy trận pháp đồ thành công!");
	end;
end;

function tbItem:CheckItem(pItem)
	if (not pItem) then
		return;
	end;
	
	local szBook = string.format("%s,%s,%s,%s", pItem[1].nGenre, pItem[1].nDetail, pItem[1].nParticular, pItem[1].nLevel)
	for i = 1, #self.ZHENFA_LIST do
		local szItem = string.format("%s,%s,%s,%s", self.ZHENFA_LIST[i][2], self.ZHENFA_LIST[i][3], self.ZHENFA_LIST[i][4], self.ZHENFA_LIST[i][5]);
		if (szItem == szBook) then
			return 0;
		end;
	end;
	return 1;
end;