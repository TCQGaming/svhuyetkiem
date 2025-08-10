

if not MODULE_GC_SERVER then
	return;
end
function LOIDAI16:BaoDanh_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"LOIDAI16:thongbaoloidai16"};
	end
end

function LOIDAI16:SapXep_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"LOIDAI16:SapXepVaGhiDanhSachCap"};
	end
end

function LOIDAI16:BatDauDoSat()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"LOIDAI16:PKLoiDaiStart"};
	end
end

function LOIDAI16:KetThuc_GiaiDoan2_HoaKyLan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"LOIDAI16:vethanhgiaidoan2"};
	end
end

