

if not MODULE_GC_SERVER then
	return;
end
function PKVLMC:BaoDanh_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"PKVLMC:baodanh"};
	end
end

function PKVLMC:DoSatNguHanh_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"PKVLMC:AddPKHSLK_GS"};
	end
end

function PKVLMC:DoSatVLMC_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"PKVLMC:AddPKVLMC_GS"};
	end
end

function PKVLMC:KetThucVLMC_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 3 then
		GlobalExcute{"PKVLMC:AddMoveHSLK_GS"};
	end
end

