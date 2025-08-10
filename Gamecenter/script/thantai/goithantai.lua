if not MODULE_GC_SERVER then
return;
end
--- gọi lửa trại
function GoiSuGiaThanMa:GoiThanTai_GC()
local nRandomMap = MathRandom(1,7)
if nRandomMap == 1 then
GlobalExcute({"GoiSuGiaThanMa:nPhuongTuong"});
	elseif nRandomMap == 2 then
GlobalExcute({"GoiSuGiaThanMa:nDuongChau"});
		elseif nRandomMap == 3 then
GlobalExcute({"GoiSuGiaThanMa:nLamAn"});
		elseif nRandomMap == 4 then
GlobalExcute({"GoiSuGiaThanMa:nTuongDuong"});
		elseif nRandomMap == 5 then
GlobalExcute({"GoiSuGiaThanMa:nBienKinh"});
		elseif nRandomMap == 6 then
GlobalExcute({"GoiSuGiaThanMa:nThanhDo"});
		elseif nRandomMap == 7 then
GlobalExcute({"GoiSuGiaThanMa:nDaiLy"});
	end 
GlobalExcute({"GoiSuGiaThanMa:AddSuGiaThanMa_GS"});
end
