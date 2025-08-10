--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbItem = Item:GetClass("tuivukhitanthu9x")
local tbItemId = {18,1,2104,2,0,0} --Rương Vũ Khí Tân Thủ (90)

function tbItem:OnUse()
	DoScript("\\script\\ChucNang\\TuiQua\\tuivukhitanthu9x.lua");	
	if me.CountFreeBagCell() < 5 then
		Dialog:Say("Phải Có 5 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end	
	if me.nFaction == 0 then
		Dialog:Say("<color=yellow>Chưa gia nhập môn phái không thể mở<color>")
		return 
	end
	if me.nRouteId == 0 then
		Dialog:Say("Chưa chọn hệ phái")
		return
	end
	
	local tbInfo = GetPlayerInfoForLadderGC(me.szName);	
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nam
		local item1 = me.AddItem(2,1,750,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
		local item1 = me.AddItem(2,1,750,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
		local item1 = me.AddItem(2,1,760,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
		local item1 = me.AddItem(2,1,760,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
		local item1 = me.AddItem(2,1,730,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
		local item1 = me.AddItem(2,1,730,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
		local item1 = me.AddItem(2,1,740,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
		local item1 = me.AddItem(2,1,740,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
		local item1 = me.AddItem(2,2,99,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
		local item1 = me.AddItem(2,2,99,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
		local item1 = me.AddItem(2,2,89,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
		local item1 = me.AddItem(2,2,89,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
		local item1 = me.AddItem(2,1,770,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
		local item1 = me.AddItem(2,1,770,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
		local item1 = me.AddItem(2,1,780,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
		local item1 = me.AddItem(2,1,780,9,1,8);
		item1.Bind(1);
        end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
		local item1 = me.AddItem(2,1,1000,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
		local item1 = me.AddItem(2,1,1000,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- Minh Giáo Chùy Nam
		local item1 = me.AddItem(2,1,990,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
		local item1 = me.AddItem(2,1,990,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
		local item1 = me.AddItem(2,1,800,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
		local item1 = me.AddItem(2,1,800,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
		local item1 = me.AddItem(2,1,810,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
		local item1 = me.AddItem(2,1,810,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
		local item1 = me.AddItem(2,1,790,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
		local item1 = me.AddItem(2,1,790,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
		local item1 = me.AddItem(2,1,820,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
		local item1 = me.AddItem(2,1,850,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
		local item1 = me.AddItem(2,1,850,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
		local item1 = me.AddItem(2,1,830,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
		local item1 = me.AddItem(2,1,830,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
		local item1 = me.AddItem(2,1,860,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
		local item1 = me.AddItem(2,1,860,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
		local item1 = me.AddItem(2,1,840,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
		local item1 = me.AddItem(2,1,840,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
		local item1 = me.AddItem(2,1,890,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
		local item1 = me.AddItem(2,1,890,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
		local item1 = me.AddItem(2,1,880,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
		local item1 = me.AddItem(2,1,880,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
		local item1 = me.AddItem(2,1,900,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
		local item1 = me.AddItem(2,1,900,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
		local item1 = me.AddItem(2,1,870,9,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
		local item1 = me.AddItem(2,1,870,9,1,8);
		item1.Bind(1);
	end
	-- Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
	return 1;
end
