if not MODULE_GC_SERVER then
return;
end
function XoaUD:XoaUyDanhTuan()
	local nCurTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nCurTime));
	-- local nCurTimer = tonumber(GetLocalDate("%H%M"));
	if nWeekDay == 1 then
	GlobalExcute{"XoaUD:XoaUyDanhTuan_GS"};
	end
end
function XoaUD:GiamUyDanhHangNgay_GC()
	GlobalExcute{"XoaUD:GiamUyDanhHangNgay_GS"};
end

function XoaUD:CongTaskGlobal_UyDanh()
	local nFollowUid = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TRUUYDANH);
	KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_TRUUYDANH, (nFollowUid+1));
end
