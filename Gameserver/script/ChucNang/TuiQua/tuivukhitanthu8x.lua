--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbItem = Item:GetClass("tuivukhitanthu8x")
local tbItemId = {18,1,2104,1,0,0} --Rương Vũ Khí Tân Thủ (80)

function tbItem:OnUse()
	DoScript("\\script\\ChucNang\\TuiQua\\tuivukhitanthu8x.lua");	
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
		me.AddItem(1,14,3,1); --Mật tịch Thiên Vương Thương (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
		local item1 = me.AddItem(2,1,569,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,3,1); --Mật tịch Thiên Vương Thương (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
		local item1 = me.AddItem(2,1,579,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,4,1); --Mật tịch Chùy Thiên Vương (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
		local item1 = me.AddItem(2,1,579,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,4,1); --Mật tịch Chùy Thiên Vương (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
		local item1 = me.AddItem(2,1,549,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,1,1); --Mật tịch Đao Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
		local item1 = me.AddItem(2,1,549,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,1,1); --Mật tịch Đao Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
		local item1 = me.AddItem(2,1,559,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,2,1); --Mật tịch Côn Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
		local item1 = me.AddItem(2,1,559,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,2,1); --Mật tịch Côn Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
		local item1 = me.AddItem(2,2,98,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,6,1); --Mật tịch Tụ Tiễn Đường Môn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
		local item1 = me.AddItem(2,2,98,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,6,1); --Mật tịch Tụ Tiễn Đường Môn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
		local item1 = me.AddItem(2,2,88,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,5,1); --Mật tịch Hãm Tĩnh Đường Môn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
		local item1 = me.AddItem(2,2,88,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,5,1); --Mật tịch Hãm Tĩnh Đường Môn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
		local item1 = me.AddItem(2,1,589,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,7,1); --Mật tịch Đao Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
		local item1 = me.AddItem(2,1,589,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,7,1); --Mật tịch Đao Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
		local item1 = me.AddItem(2,1,599,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,8,1); --Mật tịch Chưởng Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
		local item1 = me.AddItem(2,1,599,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,8,1); --Mật tịch Chưởng Ngũ Độc (sơ)
        end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
		local item1 = me.AddItem(2,1,999,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,22,1); --Mật tịch Kiếm Minh Giáo (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
		local item1 = me.AddItem(2,1,999,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,22,1); --Mật tịch Kiếm Minh Giáo (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- Minh Giáo Chùy Nam
		local item1 = me.AddItem(2,1,989,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,21,1); --Mật tịch Chùy Minh Giáo (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
		local item1 = me.AddItem(2,1,989,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,21,1); --Mật tịch Chùy Minh Giáo (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,24,1); --Mật tịch Khí Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,24,1); --Mật tịch Khí Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
		local item1 = me.AddItem(2,1,619,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,23,1); --Mật tịch Chỉ Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
		local item1 = me.AddItem(2,1,619,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,23,1); --Mật tịch Chỉ Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
		local item1 = me.AddItem(2,1,629,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,9,1); --Mật tịch Chưởng Nga My (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
		local item1 = me.AddItem(2,1,629,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,9,1); --Mật tịch Chưởng Nga My (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,10,1); --Mật tịch Phụ Trợ Nga My (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,10,1); --Mật tịch Phụ Trợ Nga My (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
		local item1 = me.AddItem(2,1,609,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,12,1); --Mật tịch Đao Thúy Yên (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
		local item1 = me.AddItem(2,1,609,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,12,1); --Mật tịch Đao Thúy Yên (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,11,1); --Mật tịch Kiếm Thúy Yên (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
		local item1 = me.AddItem(2,1,639,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,11,1); --Mật tịch Kiếm Thúy Yên (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
		local item1 = me.AddItem(2,1,669,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,13,1); --Mật tịch Chưởng Cái Bang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
		local item1 = me.AddItem(2,1,669,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,13,1); --Mật tịch Chưởng Cái Bang (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
		local item1 = me.AddItem(2,1,649,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,14,1); --Mật tịch Côn Cái Bang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
		local item1 = me.AddItem(2,1,649,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,14,1); --Mật tịch Côn Cái Bang (sơ)
	end
	if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
		local item1 = me.AddItem(2,1,679,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,16,1); --Mật tịch Ma Nhẫn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
		local item1 = me.AddItem(2,1,679,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,16,1); --Mật tịch Ma Nhẫn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
		local item1 = me.AddItem(2,1,659,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,15,1); --Mật tịch Chiến Nhẫn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
		local item1 = me.AddItem(2,1,659,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,15,1); --Mật tịch Chiến Nhẫn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
		local item1 = me.AddItem(2,1,709,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,17,1); --Mật tịch Khí Võ Đang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
		local item1 = me.AddItem(2,1,709,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,17,1); --Mật tịch Khí Võ Đang (sơ)
	end
	if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
		local item1 = me.AddItem(2,1,699,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,18,1); --Mật tịch Kiếm Võ Đang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
		local item1 = me.AddItem(2,1,699,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,18,1); --Mật tịch Kiếm Võ Đang (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
		local item1 = me.AddItem(2,1,719,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,20,1); --Mật tịch Kiếm Côn Lôn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
		local item1 = me.AddItem(2,1,719,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,20,1); --Mật tịch Kiếm Côn Lôn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
		local item1 = me.AddItem(2,1,689,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,19,1); --Mật tịch Đao Côn Lôn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
		local item1 = me.AddItem(2,1,689,8,1,8);
		item1.Bind(1);
		me.AddItem(1,14,19,1); --Mật tịch Đao Côn Lôn (sơ)
	end
--	Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
return 1;
end
