if not MODULE_GC_SERVER then
return;
end

function GoiKyLan:AddHoaKyLan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
GlobalExcute{"GoiKyLan:AddKyLan_GS"};
	end
end
function GoiKyLan:XoaHoaKyLan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
	GlobalExcute{"GoiKyLan:XoaHoaKyLan_GS"};
	end
end

