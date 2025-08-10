--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbHoTro90 = Item:GetClass("tuivukhitanthu")
local tbItemId = {18,1,2104,1,0,0} -- Mảnh Ghép Huyền Vũ Ấn

function tbHoTro90:OnUse()
	DoScript("\\\script\\ChucNang\\TuiQua\\tuivukhitanthu.lua");
	
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
		local item1 = me.AddItem(2,1,569,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
		local item1 = me.AddItem(2,1,569,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
		local item1 = me.AddItem(2,1,579,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
		local item1 = me.AddItem(2,1,579,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
		local item1 = me.AddItem(2,1,549,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
		local item1 = me.AddItem(2,1,549,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
		local item1 = me.AddItem(2,1,559,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
		local item1 = me.AddItem(2,1,559,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
		local item1 = me.AddItem(2,2,98,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
		local item1 = me.AddItem(2,2,98,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
		local item1 = me.AddItem(2,2,88,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
		local item1 = me.AddItem(2,2,88,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
		local item1 = me.AddItem(2,1,589,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
		local item1 = me.AddItem(2,1,589,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
		local item1 = me.AddItem(2,1,599,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
		local item1 = me.AddItem(2,1,599,8,1,8);
		item1.Bind(1);
        end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
		local item1 = me.AddItem(2,1,999,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
		local item1 = me.AddItem(2,1,999,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- Minh Giáo Chùy Nam
		local item1 = me.AddItem(2,1,989,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
		local item1 = me.AddItem(2,1,989,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
		local item1 = me.AddItem(2,1,619,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
		local item1 = me.AddItem(2,1,619,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
		local item1 = me.AddItem(2,1,629,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
		local item1 = me.AddItem(2,1,629,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
		local item1 = me.AddItem(2,1,609,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
		local item1 = me.AddItem(2,1,609,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
		local item1 = me.AddItem(2,1,669,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
		local item1 = me.AddItem(2,1,669,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
		local item1 = me.AddItem(2,1,649,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
		local item1 = me.AddItem(2,1,649,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
		local item1 = me.AddItem(2,1,679,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
		local item1 = me.AddItem(2,1,679,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
		local item1 = me.AddItem(2,1,659,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
		local item1 = me.AddItem(2,1,659,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
		local item1 = me.AddItem(2,1,709,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
		local item1 = me.AddItem(2,1,709,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
		local item1 = me.AddItem(2,1,699,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
		local item1 = me.AddItem(2,1,699,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
		local item1 = me.AddItem(2,1,719,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
		local item1 = me.AddItem(2,1,719,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
		local item1 = me.AddItem(2,1,689,8,1,8);
		item1.Bind(1);
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
		local item1 = me.AddItem(2,1,689,8,1,8);
		item1.Bind(1);
	end
	return 1;
--	Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
end
