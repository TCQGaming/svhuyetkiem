if not MODULE_GC_SERVER then
	return;
end

function GoiBossSLTK:AddHoaKyLan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (1 == nWeekDay) then --Thứ 2
			GlobalExcute{"GoiBossSLTK:AddHoaKyLan_GS"};
		end	
	
end
function GoiBossSLTK:XoaHoaKyLan()
local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		if (1 == nWeekDay) then --Thứ 2
	GlobalExcute{"GoiBossSLTK:XoaHoaKyLan_GS"};
	end
end
-- function GoiBossSLTK:Addyennamthien()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
			-- GlobalExcute{"GoiBossSLTK:yennamthien_GS"};
		-- end	
	
-- end
-- function GoiBossSLTK:xoayennamthien()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
	-- GlobalExcute{"GoiBossSLTK:Xoayennamthien_GS"};
	-- end
-- end

-- function GoiBossSLTK:Addyenthaptam()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
			-- GlobalExcute{"GoiBossSLTK:yenthaptam_GS"};
		-- end	
	
-- end
-- function GoiBossSLTK:xoayenthaptam()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
	-- GlobalExcute{"GoiBossSLTK:Xoayenthaptam_GS"};
	-- end
-- end
-- function GoiBossSLTK:Adddiepcothanh()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
			-- GlobalExcute{"GoiBossSLTK:diepcothanh_GS"};
		-- end	
	
-- end
-- function GoiBossSLTK:xoadiepcothanh()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
	-- GlobalExcute{"GoiBossSLTK:Xoadiepcothanh_GS"};
	-- end
-- end

-- function GoiBossSLTK:Addtaymon()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
			-- GlobalExcute{"GoiBossSLTK:taymon_GS"};
		-- end	
	
-- end
-- function GoiBossSLTK:xoataymon()
-- local nCurTime = GetTime();
	-- local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
		-- if (3 == nWeekDay) then --Thứ 4
	-- GlobalExcute{"GoiBossSLTK:Xoataymon_GS"};
	-- end
-- end
---
function GoiBossSLTK:AddHacKyLan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
	if (3 == nWeekDay) then
	GlobalExcute{"GoiBossSLTK:AddHacKyLan_GS"};
	end	
end

function GoiBossSLTK:XoaHacKyLan()
local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	local nCurDate = tonumber(os.date("%Y%m%d", nCurTime));
	if (3 == nWeekDay) then
	GlobalExcute{"GoiBossSLTK:XoaHacKyLan_GS"};
end
end
