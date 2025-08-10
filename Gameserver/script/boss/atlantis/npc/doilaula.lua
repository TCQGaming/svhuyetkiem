
local tbNpc = Npc:GetClass("doilaula");

tbNpc.tbItemInfo = {
        bForceBind=1,
}; 
local tbNAT = {18,1,476,1};-- NAT
local tbBichNgoc = {18,1,1235,1};-- lau lan bich ngoc 
local tbNhaTu = {18,1,1236,1};-- lau lan nha tu
local tbLinhTinh = {18,1,1235,2};
local tbBachNgoc = {18,1,1236,2};

function tbNpc:OnDialog()
local szOptMsg = [[
Lâu Lan là một thành trì trù phú và giàu có nằm bên hồ La Bố cổ đại, người dân tại đây có một cuộc sống phồn hoa và an lạc như chốn thế ngoại đào nguyên. Tương truyền, toàn bộ dân cư tại Lâu Lan thành cùng lượng tài phú khổng lồ đã hoàn toàn biến mất chỉ sau một đêm. Đến nay, cổ thành Lâu Lan chỉ còn là một thành trì hoang tàn đổ nát nằm giữa sa mạc quanh năm khô hạn. 
<color> 
]];
		local tbOpt = {
		
			--{"Lâu Lan-Bích Ngọc (Cấp 1)", self.BichNgoc, self},
			--{"Lâu Lan-Nhã Từ (Cấp 1)", self.NhaTu, self},
			--{"Lâu Lan-Linh Tinh (Cấp 2)", self.LinhTinh, self},
			--{"Lâu Lan-Bạch Ngọc (Cấp 2)", self.BachNgoc, self},
			{"Kết thúc đối thoại"},
	}
		
	Dialog:Say("Yến Tiểu Lâu: "..szOptMsg, tbOpt);
end
function tbNpc:BichNgoc()
local szOptMsg = [[
Tham gia Hoạt động Lâu Lan Cổ Thành có thể tìm được Lâu Lan-Bích Ngọc (Cấp 1).
Ta có thể giúp nhà ngươi đổi sang:
<color=red>1. 50 Bích Ngọc + 1 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>200 vạn bạc khóa
100 vạn bạc thường
5 Mảnh Ghép Mặt Nạ<color>
<color=red><color>
<color> 
]];
		local tbOpt = {
		
			{"200 Vạn Bạc Khóa", self.DoiBchNgoc, self, 1},
			{"200 Vạn Bạc Thường", self.DoiBchNgoc, self, 2},
			{"Mảnh Ghép Mặt Nạ", self.DoiBchNgoc, self, 3},
			--{"Nguyên Liệu Cấp 2", self.DoiBchNgoc1, self},
			{"Kết thúc đối thoại"},
	}
		
	Dialog:Say("Yến Tiểu Lâu: "..szOptMsg, tbOpt);
end
function tbNpc:DoiBchNgoc(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 50 Bích Ngọc + 1 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKBichNgoc, self, nValue});
end

function tbNpc:OnOpenOKBichNgoc(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountBN = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbBichNgoc[1] and
			pItem[1].nDetail == tbBichNgoc[2] and
			pItem[1].nParticular == tbBichNgoc[3] and
			pItem[1].nLevel == tbBichNgoc[4]) then
			nCountBN = nCountBN + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountBN ~= 50) or (nCountNAT ~= 1)  then
		Dialog:Say("Yêu cầu 50 Bích Ngọc + 1 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddBindMoney(100 * 20000);
		elseif nValue == 2 then
			me.Earn(100 * 10000);
		else
			me.AddStackItem(18,1,6602,5,nil,5);
		end
	
		return 1;

end
---------------------------------------------------------------------------
function tbNpc:DoiBchNgoc1()
	local nNeedBag = 10;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 75 Bích Ngọc", nil ,{self.OnOpenOKBichNgoc1, self,});
end

function tbNpc:OnOpenOKBichNgoc1(tbItemObj)
	local bForbidItem = 0;
	local nCountBN = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbBichNgoc[1] and
			pItem[1].nDetail == tbBichNgoc[2] and
			pItem[1].nParticular == tbBichNgoc[3] and
			pItem[1].nLevel == tbBichNgoc[4]) then
			nCountBN = nCountBN + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountBN ~= 75)   then
		Dialog:Say("Yêu cầu 75 Bích Ngọc ");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		local nRandom = MathRandom(1235, 1236);
		me.AddItem(18,1,nRandom,2);
		return 1;

end
--------------------------------------------------------------------------------------------------------------
-- Nha Tu
function tbNpc:NhaTu()
local szOptMsg = [[
Tham gia Hoạt động Lâu Lan Cổ Thành có thể tìm được Lâu Lan-Nhã Từ (Cấp 1).
Ta có thể giúp nhà ngươi đổi sang:
<color=red>1. 50 Nhã Từ + 1 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>50 vạn đồng khóa"
5 Vạn Đồng Thường
5 Mảnh Ghép Đồng Hành<color>
<color=red><color>
<color> 
]];
		local tbOpt = {
		
			{"50 vạn đồng khóa", self.DoiNhaTu, self, 1},
			{"5 vạn đồng thường", self.DoiNhaTu, self, 2},
			{"5 Rương MGTBDH", self.DoiNhaTu, self, 3},
			--{"Nguyên Liệu Cấp 2", self.DoiNhaTu1, self},
			{"Kết thúc đối thoại"},
	}
		
	Dialog:Say("Yến Tiểu Lâu: "..szOptMsg, tbOpt);
end
function tbNpc:DoiNhaTu(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 50 Nhã Từ + 1 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKNhaTu, self, nValue});
end

function tbNpc:OnOpenOKNhaTu(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountNT = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbNhaTu[1] and
			pItem[1].nDetail == tbNhaTu[2] and
			pItem[1].nParticular == tbNhaTu[3] and
			pItem[1].nLevel == tbNhaTu[4]) then
			nCountNT = nCountNT + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountNT ~= 50) or (nCountNAT ~= 1)  then
		Dialog:Say("Yêu cầu 50 Nhã Từ + 1 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddBindCoin(50 * 10000);
		elseif nValue == 2 then
			me.AddJbCoin(50000);
		else
			me.AddStackItem(18,1,1875,1,nil,5);
		end
	
		return 1;

end
---------------------------------------------------------------------------
function tbNpc:DoiNhaTu1()
	local nNeedBag = 10;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 50 Nhã Từ", nil ,{self.OnOpenOKNhaTu1, self,});
end

function tbNpc:OnOpenOKNhaTu1(tbItemObj)
	local bForbidItem = 0;
	local nCountNT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbNhaTu[1] and
			pItem[1].nDetail == tbNhaTu[2] and
			pItem[1].nParticular == tbNhaTu[3] and
			pItem[1].nLevel == tbNhaTu[4]) then
			nCountNT = nCountNT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountNT ~= 50)   then
		Dialog:Say("Yêu cầu 50 Nhã Từ");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		local nRandom = MathRandom(1235, 1236);
		me.AddItem(18,1,nRandom,2);
		return 1;

end
-------------------------------------------------------------------------------------------
function tbNpc:BachNgoc()
local szOptMsg = [[
Tham gia Hoạt động Lâu Lan Cổ Thành có thể tìm được Lâu Lan-Bạch Ngọc (Cấp 2).
Ta có thể giúp nhà ngươi đổi sang:
<color=red>1. 10 Bạch Ngọc + 100 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>[Mảnh Ghép] Mặt Nạ
5 vạn Tiền Xu<color>
<color=red>2. 50 Bạch Ngọc + 500 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>[Thú Cưng] Tiểu Hồ Lô (30 Ngày)
10 Lệnh Bài Tần Lăng 4 <color>
<color> 
]];
		local tbOpt = {
		
			{"[Mảnh Ghép] Mặt Nạ", self.DoiBachNgoc, self, 1},
			{"Tiền Xu", self.DoiBachNgoc, self, 2},
			{"[Thú Cưng]Tiểu Hồ Lô", self.DoiBachNgoc1, self, 1},
			{"Lệnh Bài Tần Lăng 4", self.DoiBachNgoc1, self, 2},
			{"Kết thúc đối thoại"},
	}
		
	Dialog:Say("Yến Tiểu Lâu: "..szOptMsg, tbOpt);
end
function tbNpc:DoiBachNgoc(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 10 Bạch Ngọc + 100 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKBachNgoc, self, nValue});
end

function tbNpc:OnOpenOKBachNgoc(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountBN = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbBachNgoc[1] and
			pItem[1].nDetail == tbBachNgoc[2] and
			pItem[1].nParticular == tbBachNgoc[3] and
			pItem[1].nLevel == tbBachNgoc[4]) then
			nCountBN = nCountBN + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountBN ~= 10) or (nCountNAT ~= 100)  then
		Dialog:Say("Yêu cầu 10 Bạch Ngọc + 100 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddItem(18,1,20373,7);-- manh ghep mat na
		else
			me.AddStackItem(18,1,20368,4,nil,50000);
		end
	
		return 1;

end
----------------------------------------------------------------------------------
function tbNpc:DoiBachNgoc1(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 50 Bạch Ngọc + 500 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKBachNgoc1, self, nValue});
end

function tbNpc:OnOpenOKBachNgoc1(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountBN = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbBachNgoc[1] and
			pItem[1].nDetail == tbBachNgoc[2] and
			pItem[1].nParticular == tbBachNgoc[3] and
			pItem[1].nLevel == tbBachNgoc[4]) then
			nCountBN = nCountBN + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountBN ~= 50) or (nCountNAT ~= 500)  then
		Dialog:Say("Yêu cầu 50 Bạch Ngọc + 500 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddItem(18,1,1730,1);-- ruong thu cung
		else
			me.AddStackItem(18,1,20800,4,nil,10);
		end
	
		return 1;

end
------------------------------------------------------------------------------------------------------
function tbNpc:LinhTinh()
local szOptMsg = [[
Tham gia Hoạt động Lâu Lan Cổ Thành có thể tìm được Lâu Lan-Linh Tinh (Cấp 2).
Ta có thể giúp nhà ngươi đổi sang:
<color=red>1. 10 Linh Tinh + 100 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>[Mảnh Ghép] Hoàng Nhân Chi Ấn
5 vạn Tiền Xu<color>
<color=red>2. 100 Linh Tinh + 500 Nguyệt Ảnh Thạch<color>
Phần Thưởng :
<color=yellow>Trận Pháp Cao (30 Ngày)
20 Lệnh Bài Tần Lăng 4 <color>
<color> 
]];
		local tbOpt = {
		
			{"[Mảnh Ghép] Hoàng Nhân Chi Ấn", self.DoiLinhTinh, self, 1},
			{"Tiền Xu", self.DoiLinhTinh, self, 2},
			{"Trận Pháp Cao ", self.DoiLinhTinh1, self, 1},
			{"Lệnh Bài Tần Lăng 4", self.DoiLinhTinh1, self, 2},
			{"Kết thúc đối thoại"},
	}
		
	Dialog:Say("Yến Tiểu Lâu: "..szOptMsg, tbOpt);
end
function tbNpc:DoiLinhTinh(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 10 Linh Tinh + 100 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKLinhTinh, self, nValue});
end

function tbNpc:OnOpenOKLinhTinh(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountLT = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbLinhTinh[1] and
			pItem[1].nDetail == tbLinhTinh[2] and
			pItem[1].nParticular == tbLinhTinh[3] and
			pItem[1].nLevel == tbLinhTinh[4]) then
			nCountLT = nCountLT + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountLT ~= 10) or (nCountNAT ~= 100)  then
		Dialog:Say("Yêu cầu 10 Linh Tinh + 100 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddItem(18,1,20373,6);-- manh ghep an
		else
			me.AddStackItem(18,1,20368,4,nil,50000);
		end
	
		return 1;

end
----------------------------------------------------------------------------------
function tbNpc:DoiLinhTinh1(nValue)
	local nNeedBag = 10;
	local nGiaTriTien = nValue * 30;

	if me.CountFreeBagCell() < nNeedBag then
		local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
		Dialog:Say(szAnnouce);
		return 0;	
	end

	Dialog:OpenGift("Đặt vào 100 Linh Tinh + 500 Nguyệt Ảnh Thạch", nil ,{self.OnOpenOKLinhTinh1, self, nValue});
end

function tbNpc:OnOpenOKLinhTinh1(nValue,tbItemObj)
local bForbidItem = 0;
	local nCountLT = 0;
	local nCountNAT = 0;

	
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbLinhTinh[1] and
			pItem[1].nDetail == tbLinhTinh[2] and
			pItem[1].nParticular == tbLinhTinh[3] and
			pItem[1].nLevel == tbLinhTinh[4]) then
			nCountLT = nCountLT + pItem[1].nCount;
		elseif 	(pItem[1].nGenre == tbNAT[1] and
			pItem[1].nDetail == tbNAT[2] and
			pItem[1].nParticular == tbNAT[3] and
			pItem[1].nLevel == tbNAT[4]) then
			nCountNAT = nCountNAT + pItem[1].nCount;		
		else
			bForbidItem = 1;
			break;
		end
	end
	if (bForbidItem > 0) then
		Dialog:Say("Đây không phải là thứ ta cần");
		return 0;
	end
	if (nCountLT ~= 100) or (nCountNAT ~= 500)  then
		Dialog:Say("Yêu cầu 100 Linh Tinh + 500 Nguyệt Ảnh Thạch");
		return 0;	
	end
	

	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
		if nValue == 1 then
			me.AddItem(18,1,320,3);-- ruong thu cung
		else
			me.AddStackItem(18,1,20800,4,nil,20);
		end
	
		return 1;

end