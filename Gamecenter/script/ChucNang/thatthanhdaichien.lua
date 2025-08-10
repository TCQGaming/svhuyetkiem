

if not MODULE_GC_SERVER then
	return;
end
function CTC_7_Thanh:BaoDanh_GC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 1 then
		GlobalExcute{"CTC_7_Thanh:thongbaoCTC_7_Thanh"};
		GlobalExcute{"CTC_7_Thanh:baodanhCTC_7_Thanh"};
	end
end

function CTC_7_Thanh:XoaNPC()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	if nWeekDay == 1 then
	GlobalExcute{"CTC_7_Thanh:DelAllNPC"};
	end
end

function CTC_7_Thanh:EndGame()
	if nWeekDay == 1 then
		GlobalExcute{"CTC_7_Thanh:EndGame_GS"};
	end
end 

function CTC_7_Thanh:ChuyenPK()
	if nWeekDay == 1 then
		GlobalExcute{"CTC_7_Thanh:PKLoiDaiStart"};
	end
end 




