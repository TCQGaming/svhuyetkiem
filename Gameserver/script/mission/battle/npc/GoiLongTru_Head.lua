if not MODULE_GAMESERVER then
	return;
end
function GoiKyLan:TrieuHoi_LongTru_TrungLapTK()
        local targetMapId = 0
	if ThietLap.capdo <= 90 then
            targetMapId = 1635
        else
            targetMapId = 1638
      end
		local nMapIndex = SubWorldID2Idx(targetMapId);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("<color=yellow><color=pink>Long trụ Trung Lập<<color> xuất hiện tại <pos="..targetMapId..",1810,2955>\nHãy mau mau chiếm lĩnh<color>");
local pNpc = KNpc.Add2(7410, 200, 0, targetMapId, 1810, 2955)
end

function GoiKyLan:Xoa_LongTruTongKim()
        local targetMapId = 0
	if ThietLap.capdo <= 90 then
            targetMapId = 1635
        else
            targetMapId = 1638
      end
		local nMapIndex = SubWorldID2Idx(targetMapId);
	if nMapIndex < 0 then
		return;
	end
local Task_PheTong = KGblTask.SCGetDbTaskInt(DBTASD_TuongPheTong)
local Task_PheKim = KGblTask.SCGetDbTaskInt(DBTASD_TuongPheKim)
if Task_PheTong == 1 then 
ClearMapNpcWithName(targetMapId, "Điêu Tượng Phe Tống");
end 
if Task_PheKim == 1  then 
ClearMapNpcWithName(targetMapId, "Điêu Tượng Phe Kim");
end 
end