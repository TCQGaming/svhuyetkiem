
QianCengTower.Folder = "\\script\\\mission\\\qiancengtower\\"; -- duong dan folder
QianCengTower.List_Player = "QianCengTower_Player.txt"; -- list nhan vat
function QianCengTower:ThongBao_SuKien()
	QianCengTower:ResetFile() -- reset file save
	local szMsg = "<color=green>Thiên Tầng Tháp<color> đã mở cửa quý đồng đạo mau mau tìm đến<color=cyan> NPC Cổ Phong Hà <color>tại <pos=24,1779,3537> báo danh ngay."
	KDialog.MsgToGlobal(szMsg);
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,szMsg);
end
function QianCengTower:Save_File(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then 
		return;
	end	
	local szFile = QianCengTower.Folder..QianCengTower.List_Player.."";
	local nCheck = 0;
	local nCheck_Ai = pPlayer.GetTask(QianCengTower.TASK_GROUP_ID,QianCengTower.TASK_ROOM_NUM_SAVE)
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
					if pPlayer.szName == tbRow.szName  and nCheck_Ai > tonumber(tbRow.Rank) then
						nCheck = 1;	
					elseif pPlayer.szName == tbRow.szName  and nCheck_Ai <= tonumber(tbRow.Rank) then
						nCheck = 2;	
					end
			end
	end	
	if nCheck == 1 then
		Lib:EditTabFile(szFile,1,""..pPlayer.szName.."",2,""..nCheck_Ai .."");
	elseif nCheck == 0 then
		KFile.AppendFile(szFile, ""..pPlayer.szName.."\t"..nCheck_Ai.."\r\n");	
	end	
	--KFile.AppendFile(szFile, ""..pPlayer.szName.."\t"..nCheck_Ai.."\r\n");	
	pPlayer.SetTask(QianCengTower.TASK_GROUP_ID,QianCengTower.TASK_ROOM_NUM_SAVE,0);-- làm mới số tầng trước đó đã vượt qua
end
function QianCengTower:ResetFile()
	local szFile = QianCengTower.Folder..QianCengTower.List_Player.."";
	KFile.WriteFile(szFile, "szName\tRank\n");	
end