if not MODULE_GAMESERVER then
	return;
end
function XoaUD:XoaUyDanhTuan_GS() 
	local nMapIndex = SubWorldID2Idx(1);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("<color=green>\n<color=yellow>HỆ THỐNG Xóa Toàn Bộ Uy Danh Tuần");
	local nFollowUid = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TRUUYDANH);
	for i = 1,nFollowUid do	
		KGCPlayer.SetPlayerPrestige(i, 0);
	end
end

function XoaUD:GiamUyDanhHangNgay_GS() 
	local nMapIndex = SubWorldID2Idx(1);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("<color=yellow>HỆ THỐNG <color>Đã giảm 15% uy danh hàng ngày thành công");
	local nFollowUid = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TRUUYDANH);
	for i = 1,nFollowUid do	
		local tinhdiem = (KGCPlayer.GetPlayerPrestige(i) * 15 ) / 100;
		KGCPlayer.SetPlayerPrestige(i, tinhdiem);
	end
end





