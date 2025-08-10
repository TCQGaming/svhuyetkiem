--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbHoTro90 = Item:GetClass("tuivukhitanthu5x")
local tbItemId = {18,1,2105,2,0,0} --Rương Vũ Khí Tân Thủ (50)

function tbHoTro90:OnUse()
	DoScript("\\script\\ChucNang\\TuiQua\\tuivukhitanthu5x.lua");
	
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
		me.AddItem(2,1,746,5).Bind(1);
		me.AddItem(1,14,3,1); --Mật tịch Thiên Vương Thương (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
		me.AddItem(2,1,746,5).Bind(1);
		me.AddItem(1,14,3,1); --Mật tịch Thiên Vương Thương (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
		me.AddItem(2,1,756,5).Bind(1);
		me.AddItem(1,14,4,1); --Mật tịch Chùy Thiên Vương (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
		me.AddItem(2,1,756,5).Bind(1);
		me.AddItem(1,14,4,1); --Mật tịch Chùy Thiên Vương (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
		me.AddItem(2,1,726,5).Bind(1);
		me.AddItem(1,14,1,1); --Mật tịch Đao Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
		me.AddItem(2,1,726,5).Bind(1);
		me.AddItem(1,14,1,1); --Mật tịch Đao Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
		me.AddItem(2,1,736,5).Bind(1);
		me.AddItem(1,14,2,1); --Mật tịch Côn Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
		me.AddItem(2,1,736,5).Bind(1);
		me.AddItem(1,14,2,1); --Mật tịch Côn Thiếu Lâm (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
		me.AddItem(2,2,95,5).Bind(1);
		me.AddItem(1,14,6,1); --Mật tịch Tụ Tiễn Đường Môn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
		me.AddItem(2,2,95,5).Bind(1);
		me.AddItem(1,14,6,1); --Mật tịch Tụ Tiễn Đường Môn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
		me.AddItem(2,2,85,5).Bind(1);
		me.AddItem(1,14,5,1); --Mật tịch Hãm Tĩnh Đường Môn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
		me.AddItem(2,2,85,5).Bind(1);
		me.AddItem(1,14,5,1); --Mật tịch Hãm Tĩnh Đường Môn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
		me.AddItem(2,1,766,5).Bind(1);
		me.AddItem(1,14,7,1); --Mật tịch Đao Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
		me.AddItem(2,1,766,5).Bind(1);
		me.AddItem(1,14,7,1); --Mật tịch Đao Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
		me.AddItem(2,1,776,5).Bind(1);
		me.AddItem(1,14,8,1); --Mật tịch Chưởng Ngũ Độc (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
		me.AddItem(2,1,776,5).Bind(1);
		me.AddItem(1,14,8,1); --Mật tịch Chưởng Ngũ Độc (sơ)
        end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
		me.AddItem(2,1,976,5).Bind(1);
		me.AddItem(1,14,22,1); --Mật tịch Kiếm Minh Giáo (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
		me.AddItem(2,1,976,5).Bind(1);
		me.AddItem(1,14,22,1); --Mật tịch Kiếm Minh Giáo (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nam
		me.AddItem(2,1,986,5).Bind(1);
		me.AddItem(1,14,21,1); --Mật tịch Chùy Minh Giáo (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
		me.AddItem(2,1,986,5).Bind(1);
		me.AddItem(1,14,21,1); --Mật tịch Chùy Minh Giáo (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,24,1); --Mật tịch Khí Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,24,1); --Mật tịch Khí Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
		me.AddItem(2,1,796,5).Bind(1);
		me.AddItem(1,14,23,1); --Mật tịch Chỉ Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
		me.AddItem(2,1,796,5).Bind(1);
		me.AddItem(1,14,23,1); --Mật tịch Chỉ Đoàn Thị (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
		me.AddItem(2,1,806,5).Bind(1);
		me.AddItem(1,14,9,1); --Mật tịch Chưởng Nga My (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
		me.AddItem(2,1,806,5).Bind(1);
		me.AddItem(1,14,9,1); --Mật tịch Chưởng Nga My (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,10,1); --Mật tịch Phụ Trợ Nga My (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,10,1); --Mật tịch Phụ Trợ Nga My (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
		me.AddItem(2,1,786,5).Bind(1);
		me.AddItem(1,14,12,1); --Mật tịch Đao Thúy Yên (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
		me.AddItem(2,1,786,5).Bind(1);
		me.AddItem(1,14,12,1); --Mật tịch Đao Thúy Yên (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,11,1); --Mật tịch Kiếm Thúy Yên (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
		me.AddItem(2,1,816,5).Bind(1);
		me.AddItem(1,14,11,1); --Mật tịch Kiếm Thúy Yên (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
		me.AddItem(2,1,846,5).Bind(1);
		me.AddItem(1,14,13,1); --Mật tịch Chưởng Cái Bang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
		me.AddItem(2,1,846,5).Bind(1);
		me.AddItem(1,14,13,1); --Mật tịch Chưởng Cái Bang (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
		me.AddItem(2,1,826,5).Bind(1);
		me.AddItem(1,14,14,1); --Mật tịch Côn Cái Bang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
		me.AddItem(2,1,826,5).Bind(1);
		me.AddItem(1,14,14,1); --Mật tịch Côn Cái Bang (sơ)
	end
	if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
		me.AddItem(2,1,856,5).Bind(1);
		me.AddItem(1,14,16,1); --Mật tịch Ma Nhẫn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
		me.AddItem(2,1,856,5).Bind(1);
		me.AddItem(1,14,16,1); --Mật tịch Ma Nhẫn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
		me.AddItem(2,1,836,5).Bind(1);
		me.AddItem(1,14,15,1); --Mật tịch Chiến Nhẫn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
		me.AddItem(2,1,836,5).Bind(1);
		me.AddItem(1,14,15,1); --Mật tịch Chiến Nhẫn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
		me.AddItem(2,1,886,5).Bind(1);
		me.AddItem(1,14,17,1); --Mật tịch Khí Võ Đang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
		me.AddItem(2,1,886,5).Bind(1);
		me.AddItem(1,14,17,1); --Mật tịch Khí Võ Đang (sơ)
	end
	if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
		me.AddItem(2,1,876,5).Bind(1);
		me.AddItem(1,14,18,1); --Mật tịch Kiếm Võ Đang (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
		me.AddItem(2,1,876,5).Bind(1);
		me.AddItem(1,14,18,1); --Mật tịch Kiếm Võ Đang (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
		me.AddItem(2,1,896,5).Bind(1);
		me.AddItem(1,14,20,1); --Mật tịch Kiếm Côn Lôn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
		me.AddItem(2,1,896,5).Bind(1);
		me.AddItem(1,14,20,1); --Mật tịch Kiếm Côn Lôn (sơ)
	end
	if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
		me.AddItem(2,1,866,5).Bind(1);
		me.AddItem(1,14,19,1); --Mật tịch Đao Côn Lôn (sơ)
	end
	if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
		me.AddItem(2,1,866,5).Bind(1);
		me.AddItem(1,14,19,1); --Mật tịch Đao Côn Lôn (sơ)
	end
	-- Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
	return 1;
end
