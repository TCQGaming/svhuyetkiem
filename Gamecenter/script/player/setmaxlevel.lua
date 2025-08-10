	
function Player:SetMaxLevelGC()
	if KGblTask.SCGetDbTaskInt(DBTASD_SERVER_SETMAXLEVELSV) == 0 then
		KGblTask.SCSetDbTaskInt(DBTASD_SERVER_SETMAXLEVELSV, GetTime());
	end
	Dbg:WriteLog("Player","Cap cao nhat "..ThietLap.capdo); 
	GlobalExcute({"Player:SetMaxLevelGC2GS", ThietLap.capdo});
	GlobalExcute({"Player.tbOffline:OnUpdateLevelInfo"});
	Task.tbHelp:UpdateLevelOpenTimeNews(DBTASD_SERVER_SETMAXLEVELSV, ThietLap.capdo);
	return 0;
end

function Player:SetMaxLevelGC2GS(nMaxLevel)
	if KPlayer.GetMaxLevel() < nMaxLevel then
		KPlayer.SetMaxLevel(nMaxLevel);
		Dbg:WriteLog("Player","da dat cap cap nhat "..nMaxLevel);
	end
end

function Player:SetMaxLevelGS()
	if KPlayer.GetMaxLevel() < ThietLap.capdo then
		KPlayer.SetMaxLevel(ThietLap.capdo);
		Dbg:WriteLog("Player","Cap cao nhat "..ThietLap.capdo); 
	end
	return 0;
end   
