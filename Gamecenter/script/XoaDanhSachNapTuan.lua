if not MODULE_GC_SERVER then
return;
end

function XoaDanhSachNapTuan:XoaDanhSachNap_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));

	if nWeekDay == 1 then
	GlobalExcute({"XoaDanhSachNapTuan:XoaDanhSachNapTuanGS"});
	end
end
