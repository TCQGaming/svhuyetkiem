
if not MODULE_GC_SERVER then
	return;
end

function MuaLai_TCQGaming:Update_GC()
	GlobalExcute{"MuaLai_TCQGaming:Update_Gs"};
end

function MuaLai_TCQGaming:Update_NhiemVuTuan_GC()
			local nCurTime = GetTime();
			local nWeekDay	= tonumber(os.date("%w", nCurTime));
			
				if (nWeekDay == 1) then---------------Update nhiệm vụ tuần
				GlobalExcute{"MuaLai_TCQGaming:Update_NhiemVuTuan_Gs"};
				end 
				
end
