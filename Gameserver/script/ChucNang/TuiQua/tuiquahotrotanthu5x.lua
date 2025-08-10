--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbItem = Item:GetClass("tuiquahotrotanthu5x");
local tbItemId = {18,1,2103,2,0,0} --Rương Quà Tân Thủ (50)

function tbItem:OnUse()
	DoScript("\\\script\\ChucNang\\TuiQua\\tuiquahotrotanthu5x.lua");
	if me.CountFreeBagCell() < 10 then
		Dialog:Say("Phải Có 10 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
	if me.nFaction == 0 then
		Dialog:Say("<color=yellow>Chưa gia nhập môn phái không thể mở<color>")
		return 0;
	end
	if me.nRouteId == 0 then
		Dialog:Say("Chưa chọn hệ phái")
		return 0;
	end
	
	if (me.nSeries == 1) and (me.nSex == 0) then --Hệ Kim + Nam
		local pItem =
		me.AddItem(2,9,605,5).Bind(1);--Thôn Long Khôi-Trang bị cam PVE_Thôn Long Khôi (Côn Thiếu, Thiên Vương)
		me.AddItem(2,3,607,5).Bind(1);--Tỏa Tử Hoàng Kim Giáp	Trang bị cam PVE_Tỏa Tử Hoàng Kim Giáp (Côn Thiếu, Thiên Vương)
		me.AddItem(2,8,305,5).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Kim
		me.AddItem(2,10,307,5).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Kim
		me.AddItem(2,7,307,5).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Kim
		me.AddItem(2,5,155,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Kim
		me.AddItem(2,4,155,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Kim
		me.AddItem(2,11,305,5).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Kim
		me.AddItem(2,6,156,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Kim
		end
	if (me.nSeries == 1) and (me.nSex == 1) then --Hệ Kim + Nữ 
		local pItem =
		me.AddItem(2,9,615,5).Bind(1);--Phượng Miên Khôi-Trang bị cam PVE_Phượng Miên Khôi (Côn Thiếu, Thiên Vương)
		me.AddItem(2,3,617,5).Bind(1);--Hàn Quang Nhạn Linh Giáp	Trang bị cam PVE_Hàn Quang Nhạn Linh Giáp (Côn Thiếu, Thiên Vương)
		me.AddItem(2,8,315,5).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Kim
		me.AddItem(2,10,317,5).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Kim
		me.AddItem(2,7,317,5).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Kim
		me.AddItem(2,5,155,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Kim
		me.AddItem(2,4,155,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Kim
		me.AddItem(2,11,315,5).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Kim
		me.AddItem(2,6,156,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Kim
		end  
	if (me.nSeries == 2) and (me.nSex == 0) then --Hệ Mộc + Nam
		local pItem = 
		me.AddItem(2,9,645,5).Bind(1);--Sơn Quỷ Phát Quán-Trang bị cam PVE_Sơn Quỷ Phát Quán (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,3,647,5).Bind(1);--Sơn Quỷ Trang	Trang bị cam PVE_Sơn Quỷ Trang (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,8,325,5).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Mộc
		me.AddItem(2,10,327,5).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Mộc
		me.AddItem(2,7,327,5).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Mộc		
		me.AddItem(2,5,165,5).Bind(1);--Bí Ẩn Liên	Trang bị cam PVE_Bí Ẩn Liên cho tất cả hệ phái hệ Mộc
		me.AddItem(2,4,165,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Mộc
		me.AddItem(2,11,325,5).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Mộc
		me.AddItem(2,6,166,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Mộc	
		end
	if (me.nSeries == 2) and (me.nSex == 1) then --Hệ Mộc + Nữ
		local pItem =
		me.AddItem(2,9,655,5).Bind(1);--Điêu Bì Diện Tráo-Trang bị cam PVE_Điêu Bì Diện Tráo (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,3,657,5).Bind(1);--Vận Nghê Thường	Trang bị cam PVE_Vận Nghê Thường (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,8,335,5).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Mộc
		me.AddItem(2,10,337,5).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Mộc
		me.AddItem(2,7,337,5).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Mộc
		me.AddItem(2,5,165,5).Bind(1);--Bí Ẩn Liên	Trang bị cam PVE_Bí Ẩn Liên cho tất cả hệ phái hệ Mộc
		me.AddItem(2,4,165,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Mộc
		me.AddItem(2,11,335,5).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Mộc
		me.AddItem(2,6,166,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Mộc
		end
	if (me.nSeries == 3) and (me.nSex == 0) then --Hệ Thủy + Nam
		local pItem =
		me.AddItem(2,9,705,5).Bind(1);--Tử Kim Thúc Ngạch-Trang bị cam PVE_Tử Kim Thúc Ngạch (Khí Đoàn, Thúy Yên, Nga My)
		me.AddItem(2,3,707,5).Bind(1);--Toàn Long Bào	Trang bị cam PVE_Toàn Long Bào (Nga My, Thúy Yên, Khí Đoàn)
		me.AddItem(2,8,345,5).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Thủy
		me.AddItem(2,10,347,5).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Thủy
		me.AddItem(2,7,347,5).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Thủy
		me.AddItem(2,5,175,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thủy
		me.AddItem(2,4,175,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thủy
		me.AddItem(2,11,345,5).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Thủy
		me.AddItem(2,6,176,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thủy		
		end
	if (me.nSeries == 3) and (me.nSex == 1) then --Hệ Thủy + Nữ
		local pItem =
		me.AddItem(2,9,715,5).Bind(1);--Minh Điệp Phát Kết-Trang bị cam PVE_Minh Điệp Phát Kết (Khí Đoàn, Thúy Yên, Nga My)
		me.AddItem(2,3,717,5).Bind(1);--Lăng La Sam	Trang bị cam PVE_Lăng La Sam (Nga My, Thúy Yên, Khí Đoàn)
		me.AddItem(2,8,355,5).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Thủy
		me.AddItem(2,10,357,5).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Thủy
		me.AddItem(2,7,357,5).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Thủy
		me.AddItem(2,5,175,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thủy
		me.AddItem(2,4,175,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thủy
		me.AddItem(2,11,355,5).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Thủy
		me.AddItem(2,6,176,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thủy	
		end
	if (me.nSeries == 4) and (me.nSex == 0) then --Hệ Hỏa + Nam
		local pItem =
		me.AddItem(2,9,745,5).Bind(1);--Sơn Quỷ Phát Quán-Trang bị cam PVE_Sơn Quỷ Phát Quán (Ma Nhẫn, Cái Bang)
		me.AddItem(2,3,747,5).Bind(1);--Sơn Quỷ Trang	Trang bị cam PVE_Sơn Quỷ Trang (Ma Nhẫn, Cái Bang)
		me.AddItem(2,8,365,5).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,10,367,5).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,7,367,5).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,5,185,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,4,185,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,11,365,5).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,6,186,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Hỏa
		end
	if (me.nSeries == 4) and (me.nSex == 1) then --Hệ Hỏa + Nữ
		local pItem =
		me.AddItem(2,9,755,5).Bind(1);--Điêu Bì Diện Tráo-Trang bị cam PVE_Điêu Bì Diện Tráo (Ma Nhẫn, Cái Bang)
		me.AddItem(2,3,757,5).Bind(1);--Vận Nghê Thường	Trang bị cam PVE_Vận Nghê Thường (Ma Nhẫn, Cái Bang)
		me.AddItem(2,8,375,5).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,10,377,5).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,7,377,5).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,5,185,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,4,185,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,11,375,5).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,6,186,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Hỏa
		end
	if (me.nSeries == 5) and (me.nSex == 0) then --Hệ Thổ + Nam 
		local pItem = 
		me.AddItem(2,9,785,5).Bind(1);--Tử Kim Thúc Ngạch-Trang bị cam PVE_Tử Kim Thúc Ngạch (Khí Võ, Côn Lôn)
		me.AddItem(2,3,787,5).Bind(1);--Toàn Long Bào	Trang bị cam PVE_Toàn Long Bào (Khí Võ, Côn Lôn)
		me.AddItem(2,8,385,5).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Thổ
		me.AddItem(2,10,387,5).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Thổ
		me.AddItem(2,7,387,5).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Thổ
		me.AddItem(2,5,195,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thổ
		me.AddItem(2,4,195,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thổ
		me.AddItem(2,11,385,5).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Thổ
		me.AddItem(2,6,196,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thổ
		end
	if (me.nSeries == 5) and (me.nSex == 1) then --Hệ Thổ + Nữ 
		local pItem =
		me.AddItem(2,9,795,5).Bind(1);--Minh Điệp Phát Kết-Trang bị cam PVE_Minh Điệp Phát Kết (Khí Võ, Côn Lôn)
		me.AddItem(2,3,797,5).Bind(1);--Lăng La Sam	Trang bị cam PVE_Lăng La Sam (Khí Võ, Côn Lôn)
		me.AddItem(2,8,395,5).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Thổ
		me.AddItem(2,10,397,5).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Thổ
		me.AddItem(2,7,397,5).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Thổ
		me.AddItem(2,5,195,5).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thổ
		me.AddItem(2,4,195,5).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thổ
		me.AddItem(2,11,395,5).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Thổ
		me.AddItem(2,6,196,5).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thổ
		end
	-- Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
	return 1;
end;
