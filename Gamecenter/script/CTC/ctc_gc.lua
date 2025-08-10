CTC.ISOPEN = 1;
---------------Thời gian-------------
CTC.WEEKDAY = 3;-- 1 là thứ 2; ngày diễn ra sự kiện

function CTC:CheckTime()
	if CTC.ISOPEN ~= 1 then
		return false;
	end
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))
	if nWeekDay == CTC.WEEKDAY then
		return true;
	end
	return false;
end
function CTC:Register()
	if CTC:CheckTime() == false then
		return;
	end
		GlobalExcute{"CTC:Register_GS"};

end
function CTC:StartGame()
	if CTC:CheckTime() == false then
		return;
	end
		GlobalExcute{"CTC:StartGame_GS"};

end
function CTC:EndGame()
	if CTC:CheckTime() == false then
		return;
	end
		GlobalExcute{"CTC:EndGame_GS"};

end
