if not MODULE_GC_SERVER then
return;
end

function ThongBao:AddThongBao_BaoTri()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- if nWeekDay == 5 then
GlobalExcute{"ThongBao:AddThongBaoBaoTri_GS"};
-- end 
end

function ThongBao:ThongBao_MSG_TinhNangHoatDong()
GlobalExcute{"ThongBao:ThongBao_MSG_TinhNangHoatDong_GS"};
end


function ThongBao:ThongBao_ThuongNhan_VSV_GC()
GlobalExcute{"ThongBao:ThongBao_ThuongNhan_VSV"};
end