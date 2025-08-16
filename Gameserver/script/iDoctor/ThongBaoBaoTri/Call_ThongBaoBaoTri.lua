if not MODULE_GAMESERVER then
return;
end
function ThongBao:AddThongBaoBaoTri_GS()
	local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
	return;
	end
	local szMsg = "\n\n\n<color=cyan>Bảo trì máy chủ định kỳ  hàng ngày\n\n<color=yellow> 18:00 - 18:05<color>\n\nCác bạn chú ý không giao dịch và gửi thư trong thời gian này<color>";
	KDialog.MsgToGlobal(szMsg);
end

function ThongBao:ThongBao_MSG_TinhNangHoatDong_GS()
	local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
	return;
	end
	local szMsg = "<color=cyan>Có thể bạn chưa biết\n<color=yellow>Để tham gia săn boss Võ Lâm Cao Thủ bạn cần Đăng ký săn boss tại NPC Cổ Phong Hà mỗi IP chỉ được đăng ký tối đa 12 nhân vật\nPhiên Bản Kéo Xe 12 Account Hoạt động PK , Tống Kim Tuyệt Đối\nNghiên cấm hành vi trục lỗi , bug game sẽ tiến hành khóa vĩnh viễn";
	KDialog.MsgToGlobal(szMsg);
end

function ThongBao:ThongBao_ThuongNhan_VSV()
	local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
	return;
	end
	local szMsg = "<color=cyan>Thần bí thương nhân đã mở bán hàng Vỏ Sò Vàng tại<color><pos=8,1744,3404>";
	KDialog.MsgToGlobal(szMsg);
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, 0);
end



