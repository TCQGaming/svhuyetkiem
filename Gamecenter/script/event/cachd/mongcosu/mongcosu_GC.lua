if not MODULE_GC_SERVER then
	return;
end

function DaiChienQuanMongCo:AddQuanLinhMC()
	GlobalExcute{"DaiChienQuanMongCo:AddQuanLinhMC_GS"};

end
function DaiChienQuanMongCo:AddMCSNhat()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSNhat_GS"};
end
function DaiChienQuanMongCo:AddMCSNguyet()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSNguyet_GS"};

end
function DaiChienQuanMongCo:AddMCSPhong()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSPhong_GS"};
end
function DaiChienQuanMongCo:AddMCSVan()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSSVan_GS"};
end
function DaiChienQuanMongCo:AddMCSLoi()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSLoi_GS"};
end
function DaiChienQuanMongCo:AddMCSDien()
	GlobalExcute{"DaiChienQuanMongCo:AddMCSDien_GS"};
end
function DaiChienQuanMongCo:TrieuTapMember()
	GlobalExcute{"DaiChienQuanMongCo:TrieuTapMember_GS"};
end
function DaiChienQuanMongCo:ThongBaoLan1()
	GlobalExcute{"DaiChienQuanMongCo:ThongBaoLan1_GS"};
end
function DaiChienQuanMongCo:ThongBaoLan2()
	GlobalExcute{"DaiChienQuanMongCo:ThongBaoLan2_GS"};
end
function DaiChienQuanMongCo:ThongBaoLan3()
	GlobalExcute{"DaiChienQuanMongCo:ThongBaoLan3_GS"};
end
function DaiChienQuanMongCo:ThongBaoLan4()
	GlobalExcute{"DaiChienQuanMongCo:ThongBaoLan4_GS"};
end

--================================================CÔNG THÀNH CHIẾN================================================--
function DaiChienQuanMongCo:Star_CongThanhChien() 
	--Báo Danh 10 phút
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (6 == nWeekDay) then --Thứ 7
			GlobalExcute{"DaiChienQuanMongCo:Star_CongThanhChien_GS"};
		end	
end 
--=================================Bắt Đầu Chiến=====================================--
function DaiChienQuanMongCo:PK_CongThanhChien()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (6 == nWeekDay) then --Thứ 7
			GlobalExcute{"DaiChienQuanMongCo:PK_CongThanhChien_GS"};
		end	
end  
--=================================Bắt Đầu Chiến=====================================--
function DaiChienQuanMongCo:Goi_NgaiVang()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (6 == nWeekDay) then --Thứ 7
			GlobalExcute{"DaiChienQuanMongCo:Goi_NgaiVang_GS"};
		end	
end 
--===================================Kết Thúc===================================--
function DaiChienQuanMongCo:KetThuc_CongThanhChien()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (6 == nWeekDay) then --Thứ 7
			GlobalExcute{"DaiChienQuanMongCo:KetThuc_CongThanhChien_GS"};
		end	
end
