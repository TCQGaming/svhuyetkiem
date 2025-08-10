if not MODULE_GC_SERVER then
return;
end
--- gọi lửa trại
function QianCengTower:MoThienTangThap()
	GlobalExcute({"QianCengTower:ThongBao_SuKien"});
end
