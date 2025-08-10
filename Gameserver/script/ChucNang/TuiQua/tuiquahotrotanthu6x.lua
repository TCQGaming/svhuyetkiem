--Phát triển bởi @KeBacTinh86 Dev
--Zalo: 0973.212.767
--Facebook: https://www.facebook.com/thanhlich.dev

local tbItem = Item:GetClass("tuiquahotrotanthu6x");
local tbItemId = {18,1,2105,1,0,0} --Rương Vũ Khí (60)

function tbItem:OnUse()
	DoScript("\\\script\\ChucNang\\TuiQua\\tuiquahotrotanthu6x.lua");
	if me.CountFreeBagCell() < 10 then
		Dialog:Say("Phải Có 10 Ô Trống Trong Túi Hành Trang!");
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
	
	if (me.nSeries == 1) and (me.nSex == 0) then --Hệ Kim + Nam
		local pItem =
		me.AddItem(2,9,606,6,1,4).Bind(1);--Lôi Trì Quán-Trang bị cam PVE_Lôi Trì Quán (Côn Thiếu, Thiên Vương)
		me.AddItem(2,3,608,6,1,4).Bind(1);--Tỏa Tử Hoàng Kim Giáp-Trang bị cam PVE_Tỏa Tử Hoàng Kim Giáp (Côn Thiếu, Thiên Vương)
		me.AddItem(2,8,306,6,1,4).Bind(1);--Ngọa Hổ Thúc Yêu-Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Kim
		me.AddItem(2,10,308,6,1,4).Bind(1);--Võ Thần Hộ Uyển-Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Kim
		me.AddItem(2,7,308,6,1,4).Bind(1);--Tuyệt Hỏa Ngoa-Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Kim
		me.AddItem(2,5,156,6,1,4).Bind(1);--Bắc Thần Liên-Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Kim
		me.AddItem(2,4,156,6,1,4).Bind(1);--Thương Khung Giới-Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Kim
		me.AddItem(2,11,306,6,1,4).Bind(1);--Long Thủ Bội-Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Kim
		me.AddItem(2,6,157,6,1,4).Bind(1);--Thiên Ma Phù-Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Kim
		end
	if (me.nSeries == 1) and (me.nSex == 1) then --Hệ Kim + Nữ 
		local pItem =
		me.AddItem(2,9,616,6,1,4).Bind(1);--Phượng Miên Khôi-Trang bị cam PVE_Phượng Miên Khôi (Côn Thiếu, Thiên Vương)
		me.AddItem(2,3,618,6,1,4).Bind(1);--Hàn Quang Nhạn Linh Giáp	Trang bị cam PVE_Hàn Quang Nhạn Linh Giáp (Côn Thiếu, Thiên Vương)
		me.AddItem(2,8,316,6,1,4).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Kim
		me.AddItem(2,10,318,6,1,4).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Kim
		me.AddItem(2,7,318,6,1,4).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Kim
		me.AddItem(2,5,156,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Kim
		me.AddItem(2,4,156,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Kim
		me.AddItem(2,11,316,6,1,4).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Kim
		me.AddItem(2,6,157,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Kim
		end  
	if (me.nSeries == 2) and (me.nSex == 0) then --Hệ Mộc + Nam
		local pItem = 
		me.AddItem(2,9,646,6,1,4).Bind(1);--Sơn Quỷ Phát Quán-Trang bị cam PVE_Sơn Quỷ Phát Quán (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,3,648,6,1,4).Bind(1);--Sơn Quỷ Trang	Trang bị cam PVE_Sơn Quỷ Trang (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,8,326,6,1,4).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Mộc
		me.AddItem(2,10,328,6,1,4).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Mộc
		me.AddItem(2,7,328,6,1,4).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Mộc		
		me.AddItem(2,5,166,6,1,4).Bind(1);--Bí Ẩn Liên	Trang bị cam PVE_Bí Ẩn Liên cho tất cả hệ phái hệ Mộc
		me.AddItem(2,4,166,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Mộc
		me.AddItem(2,11,326,6,1,4).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Mộc
		me.AddItem(2,6,167,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Mộc	
		end
	if (me.nSeries == 2) and (me.nSex == 1) then --Hệ Mộc + Nữ
		local pItem =
		me.AddItem(2,9,656,6,1,4).Bind(1);--Điêu Bì Diện Tráo-Trang bị cam PVE_Điêu Bì Diện Tráo (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,3,658,6,1,4).Bind(1);--Vận Nghê Thường	Trang bị cam PVE_Vận Nghê Thường (Đao Độc, Đường Môn, Minh Giáo)
		me.AddItem(2,8,336,6,1,4).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Mộc
		me.AddItem(2,10,338,6,1,4).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Mộc
		me.AddItem(2,7,338,6,1,4).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Mộc
		me.AddItem(2,5,166,6,1,4).Bind(1);--Bí Ẩn Liên	Trang bị cam PVE_Bí Ẩn Liên cho tất cả hệ phái hệ Mộc
		me.AddItem(2,4,166,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Mộc
		me.AddItem(2,11,336,6,1,4).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Mộc
		me.AddItem(2,6,167,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Mộc
		end
	if (me.nSeries == 3) and (me.nSex == 0) then --Hệ Thủy + Nam
		local pItem =
		me.AddItem(2,9,706,6,1,4).Bind(1);--Tử Kim Thúc Ngạch-Trang bị cam PVE_Tử Kim Thúc Ngạch (Khí Đoàn, Thúy Yên, Nga My)
		me.AddItem(2,3,708,6,1,4).Bind(1);--Toàn Long Bào	Trang bị cam PVE_Toàn Long Bào (Nga My, Thúy Yên, Khí Đoàn)
		me.AddItem(2,8,346,6,1,4).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Thủy
		me.AddItem(2,10,348,6,1,4).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Thủy
		me.AddItem(2,7,348,6,1,4).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Thủy
		me.AddItem(2,5,176,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thủy
		me.AddItem(2,4,176,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thủy
		me.AddItem(2,11,346,6,1,4).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Thủy
		me.AddItem(2,6,177,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thủy		
		end
	if (me.nSeries == 3) and (me.nSex == 1) then --Hệ Thủy + Nữ
		local pItem =
		me.AddItem(2,9,716,6,1,4).Bind(1);--Minh Điệp Phát Kết-Trang bị cam PVE_Minh Điệp Phát Kết (Khí Đoàn, Thúy Yên, Nga My)
		me.AddItem(2,3,718,6,1,4).Bind(1);--Lăng La Sam	Trang bị cam PVE_Lăng La Sam (Nga My, Thúy Yên, Khí Đoàn)
		me.AddItem(2,8,356,6,1,4).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Thủy
		me.AddItem(2,10,358,6,1,4).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Thủy
		me.AddItem(2,7,358,6,1,4).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Thủy
		me.AddItem(2,5,176,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thủy
		me.AddItem(2,4,176,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thủy
		me.AddItem(2,11,356,6,1,4).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Thủy
		me.AddItem(2,6,177,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thủy	
		end
	if (me.nSeries == 4) and (me.nSex == 0) then --Hệ Hỏa + Nam
		local pItem =
		me.AddItem(2,9,746,6,1,4).Bind(1);--Sơn Quỷ Phát Quán-Trang bị cam PVE_Sơn Quỷ Phát Quán (Ma Nhẫn, Cái Bang)
		me.AddItem(2,3,748,6,1,4).Bind(1);--Sơn Quỷ Trang	Trang bị cam PVE_Sơn Quỷ Trang (Ma Nhẫn, Cái Bang)
		me.AddItem(2,8,366,6,1,4).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,10,368,6,1,4).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,7,368,6,1,4).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,5,186,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,4,186,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,11,366,6,1,4).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,6,187,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Hỏa
		end
	if (me.nSeries == 4) and (me.nSex == 1) then --Hệ Hỏa + Nữ
		local pItem =
		me.AddItem(2,9,756,6,1,4).Bind(1);--Điêu Bì Diện Tráo-Trang bị cam PVE_Điêu Bì Diện Tráo (Ma Nhẫn, Cái Bang)
		me.AddItem(2,3,758,6,1,4).Bind(1);--Vận Nghê Thường	Trang bị cam PVE_Vận Nghê Thường (Ma Nhẫn, Cái Bang)
		me.AddItem(2,8,376,6,1,4).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,10,378,6,1,4).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,7,378,6,1,4).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,5,186,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,4,186,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,11,376,6,1,4).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Hỏa
		me.AddItem(2,6,187,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Hỏa
		end
	if (me.nSeries == 5) and (me.nSex == 0) then --Hệ Thổ + Nam 
		local pItem = 
		me.AddItem(2,9,786,6,1,4).Bind(1);--Tử Kim Thúc Ngạch-Trang bị cam PVE_Tử Kim Thúc Ngạch (Khí Võ, Côn Lôn)
		me.AddItem(2,3,788,6,1,4).Bind(1);--Toàn Long Bào	Trang bị cam PVE_Toàn Long Bào (Khí Võ, Côn Lôn)
		me.AddItem(2,8,386,6,1,4).Bind(1);--Ngọa Hổ Thúc Yêu	Trang bị cam PVE_Ngọa Hổ Thúc Yêu cho tất cả hệ phái hệ Thổ
		me.AddItem(2,10,388,6,1,4).Bind(1);--Võ Thần Hộ Uyển	Trang bị cam PVE_Võ Thần Hộ Uyển cho tất cả hệ phái hệ Thổ
		me.AddItem(2,7,388,6,1,4).Bind(1);--Tuyệt Hỏa Ngoa	Trang bị cam PVE_Tuyệt Hỏa Ngoa cho tất cả hệ phái hệ Thổ
		me.AddItem(2,5,196,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thổ
		me.AddItem(2,4,196,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thổ
		me.AddItem(2,11,386,6,1,4).Bind(1);--Long Thủ Bội	Trang bị cam PVE_Long Thủ Bội cho tất cả hệ phái hệ Thổ
		me.AddItem(2,6,197,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thổ
		end
	if (me.nSeries == 5) and (me.nSex == 1) then --Hệ Thổ + Nữ 
		local pItem =
		me.AddItem(2,9,796,6,1,4).Bind(1);--Minh Điệp Phát Kết-Trang bị cam PVE_Minh Điệp Phát Kết (Khí Võ, Côn Lôn)
		me.AddItem(2,3,798,6,1,4).Bind(1);--Lăng La Sam	Trang bị cam PVE_Lăng La Sam (Khí Võ, Côn Lôn)
		me.AddItem(2,8,396,6,1,4).Bind(1);--Ngạo Mai Ngọc Đái	Trang bị cam PVE_Ngạo Mai Ngọc Đái cho tất cả hệ phái hệ Thổ
		me.AddItem(2,10,398,6,1,4).Bind(1);--Bế Nguyệt Hoàn	Trang bị cam PVE_Bế Nguyệt Hoàn cho tất cả hệ phái hệ Thổ
		me.AddItem(2,7,398,6,1,4).Bind(1);--Khinh Vân Ngoa	Trang bị cam PVE_Khinh Vân Ngoa cho tất cả hệ phái hệ Thổ
		me.AddItem(2,5,196,6,1,4).Bind(1);--Bắc Thần Liên	Trang bị cam PVE_Bắc Thần Liên cho tất cả hệ phái hệ Thổ
		me.AddItem(2,4,196,6,1,4).Bind(1);--Thương Khung Giới	Trang bị cam PVE_Thương Khung Giới cho tất cả hệ phái hệ Thổ
		me.AddItem(2,11,396,6,1,4).Bind(1);--Tiên Xạ Hương Nang	Trang bị cam PVE_Tiên Xạ Hương Nang cho tất cả hệ phái hệ Thổ
		me.AddItem(2,6,197,6,1,4).Bind(1);--Thiên Ma Phù	Trang bị cam PVE_Thiên Ma Phù cho tất cả hệ phái hệ Thổ
		end
--	Task:DelItem(me, tbItemId, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
	return 1;
end;
