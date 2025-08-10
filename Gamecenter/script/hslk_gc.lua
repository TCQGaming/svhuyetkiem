if not MODULE_GC_SERVER then
return;
end
function PKVLMC:AddPKHSLK()
--- bao danh
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurTimer = tonumber(GetLocalDate("%H%M"));
	--
	if nWeekDay == 3 then
		if (nCurTimer >= 2100 and nCurTimer < 2105) then
			GlobalExcute{"PKVLMC:baodanh"};
		end
		--trangthaichiendau
		if (nCurTimer >= 2105 and nCurTimer < 2110) then
			GlobalExcute{"PKVLMC:AddPKHSLK_GS"};
		end
		--pk minh chủ
		if (nCurTimer >= 2110 and nCurTimer < 2115) then
			GlobalExcute{"PKVLMC:AddPKVLMC_GS"};
		end
		--- ket thuc
		if (nCurTimer >= 2115 and nCurTimer < 2120) then
			GlobalExcute{"PKVLMC:AddMoveHSLK_GS"};
		end
	end
--
end

