----Dev TCQGaming
----26/05/2023 3:43
--- fb.com/xboy.hd

local allpet ={};
SpecialEvent.allpet= allpet;

function allpet:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\tinhnangpet\\allpet.lua");
	if me.nLevel < 100 then
		Dialog:Say("Cấp độ 100 trở lên mới mở");
		return 0;
	end
	local szMsg = "<color=yellow>Tính năng Tẩy Kỹ Năng Đồng Hành<color>";
  local tbOpt =   {}
			table.insert(tbOpt, {"<color=green>Tẩy Luyện Kỹ Năng Đồng Hành\n<color=yellow>(30 Vạn Đồng + 1 Linh Hồn) <color>" , SpecialEvent.mainpet.OnDialog, SpecialEvent.mainpet,});
			table.insert(tbOpt, {"<color=green>Khai Thiên Đồng Hành<color>\n300v-1 Lần\n1 HTB + 25%\n Tạo Kỹ Năng Mới" , SpecialEvent.hoankynangpet.OnDialog, SpecialEvent.hoankynangpet,});
			table.insert(tbOpt, {"<color=green>Đổi Linh Hồn Đồng Hành<color>", self.doilinhhonmain, self});
			table.insert(tbOpt, {"<color=blue>Bấm vào đây để xem chi tiết tính năng\nBài Viết Trên Web<color>", self.chitietkhaithien, self});
			table.insert(tbOpt, {"Kết Thúc Đối Thoại", self});
			
  Dialog:Say(szMsg, tbOpt)
end
function allpet:chitietkhaithien()
	me.CallClientScript({"OpenWebSite", "https://tuyetdinhkt2009.com/khaithienpet.html"});
end 
function allpet:doilinhhonmain()
local szMsg = "<color=yellow>Hãy chọn mục nhà ngươi cần\n<color><color=red>Công thức lấy thất sắc hồn : 1 Linh Hồn + 1 Vạn Đồng Thường Thành 1 Thất Sắc Hồn Khi bấm sẽ không được chọn mà sẽ khấu trừ toàn bộ\n<color=cyan>Nếu muốn giữ lại linh hồn hãy cất vào kho chứa đồ<color>";
  local tbOpt =   {}
  			-- table.insert(tbOpt, {"<color=green>Ta muốn đổi Linh Hồn <color>", self.doilinhhon, self});
			table.insert(tbOpt, {"Ta muốn<color=green> Linh Hồn <color>lấy lại<color=green> Thất Sắc Hồn<color>", self.doilinhhon, self});
			table.insert(tbOpt, {"Kết Thúc Đối Thoại", self});	
  Dialog:Say(szMsg, tbOpt)
end

function allpet:doilinhhon()
local szMsg = "<color=yellow>Hãy chọn mục nhà ngươi cần\n<color><color=red>Công thức lấy thất sắc hồn : 1 Linh Hồn + 1 Vạn Đồng Thường Thành 1 Thất Sắc Hồn Khi bấm sẽ không được chọn mà sẽ khấu trừ toàn bộ\n<color=cyan>Nếu muốn giữ lại linh hồn hãy cất vào kho chứa đồ<color>";
  local tbOpt =   {}
			table.insert(tbOpt, {"<color=green>Ta muốn đổi toàn bộ<color>", self.doilai, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ Linh Hồn Bảo Ngọc<color>", self.baongoc, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ Linh Hồn Hạ Tiểu Sảnh<color>", self.hatieusanh, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ Linh Hồn Oanh Oanh<color>", self.oanhoanh, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ Linh Hồn Mộc Siêu<color>", self.mocsieu, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ  Linh Hồn Từ Uyển<color>", self.tuuyen, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ  Linh Hồn Tần Trọng<color>", self.tantrong, self});
			-- table.insert(tbOpt, {"<color=green>Toàn bộ trừ  Linh Hồn Diệp Tịnh<color>", self.dieptinh, self});
			table.insert(tbOpt, {"Kết Thúc Đối Thoại", self});
			
  Dialog:Say(szMsg, tbOpt)
end

-- function allpet:doilai1()
-- local nMyCoin = me.nCoin;
	-- local tbItemInfo = {bForceBind=1};
	-- local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	-- local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	-- local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	-- local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	-- local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	-- local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	-- local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	-- local nThatSacHon	= {18,1,2026,1,0,0};
	-- local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTuUyen + nLinhHonTanTrong;
	-- local nSoDong = 10000*tong
	-- local nSoDongHien = nSoDong/10000
	-- if (nMyCoin < nSoDong) then
	-- me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	-- return 0; 
	-- end
	-- if tong > 0 then 
	   -- for i = 2, 8 do
		-- local itemCount = {18,1,2026,i,0,0};
		-- Task:DelItem(me, itemCount, tong)
		-- end
		-- me.AddJbCoin(-nSoDong)
	-- me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	-- Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	-- else 
	-- Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	-- end
-- end

function allpet:doilai()
local tbItemInfo = {bForceBind=1};
	local tbAllRoom = {
		Item.ROOM_MAINBAG
		-- Item.ROOM_EXTBAG1,
		-- Item.ROOM_EXTBAG2,
		-- Item.ROOM_EXTBAG3,	
	};

	local nCount = 0;
	for _, nRoom in pairs(tbAllRoom) do
		local tbIdx = me.FindAllItem(nRoom);
		for i = 1, #tbIdx do
			local pItem = KItem.GetItemObj(tbIdx[i]);
			local szItem = string.format("%s,%s,%s,%s", pItem.nGenre, pItem.nDetail, pItem.nParticular, pItem.nLevel);
			for i = 2, 8 do
				local szItemCheck = string.format("%s,%s,%s,%s", 18, 1, 2026, i);
				if szItemCheck == szItem then
					nCount = nCount + pItem.nCount;
				end
			end
		end
	end

	local itemCount = {18, 1, 2026, i, 0, 0};
	Task:DelItem(me, itemCount, nCount)

	if nCount > 0 then
		me.AddStackItem(18, 1, 2026, 1, tbItemInfo, nCount);
		Dialog:Say("Bạn đã đổi thành công " .. nCount .. " thất sắc hồn");
	else
		Dialog:Say("<color=red>Trong hành trang không tìm thấy Linh Hồn");
	end
end






function allpet:baongoc()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTuUyen + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 3 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end 
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end


function allpet:hatieusanh()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTuUyen + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 4 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end 
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end
function allpet:oanhoanh()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonHaTieuSanh  + nLinhHonMocSieu + nLinhHonTuUyen + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 5 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end 
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end
function allpet:mocsieu()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonTuUyen + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 6 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end 
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end
function allpet:tuuyen()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 7 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end
function allpet:tantrong()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2);
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong = nLinhHonDiepTinh + nLinhHonBaoNgoc + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTuUyen ;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 2, 8 do
	   if i ~= 8 then
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		end 
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end
function allpet:dieptinh()
local nMyCoin = me.nCoin;
	local tbItemInfo = {bForceBind=1};
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3);
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4);
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5);
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6);
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7);
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8);
	local nThatSacHon	= {18,1,2026,1,0,0};
	local tong =  nLinhHonBaoNgoc + nLinhHonHaTieuSanh + nLinhHonOanhOanh + nLinhHonMocSieu + nLinhHonTuUyen + nLinhHonTanTrong;
	local nSoDong = 10000*tong
	local nSoDongHien = nSoDong/10000
	if (nMyCoin < nSoDong) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..nSoDongHien.." Vạn Đồng<color>");
	return 0; 
	end
	if tong > 0 then 
	   for i = 3, 8 do
		local itemCount = {18,1,2026,i,0,0};
		Task:DelItem(me, itemCount, tong)
		end
		me.AddJbCoin(-nSoDong)
	me.AddStackItem(18,1,2026,1,tbItemInfo,tong);
	Dialog:Say("Bạn đã đổi thành công "..tong.." thất sắc hồn tiêu tốn "..nSoDongHien.." Vạn Đồng ")
	else 
	Dialog:Say("<color=red>Trong hành trang phát hiện không tồn tại Linh Hồn ")
	end
end


