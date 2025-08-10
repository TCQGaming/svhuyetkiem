-------TCQGaming------------
DietQuai.TASK_GROUP = 3073;
DietQuai.TASK_COUNT = 1;
function DietQuai:TaskPlus()
	local nSec = tonumber(KGblTask.SCGetDbTaskInt(DBTASD_SERVER_STARTTIME));
	if nSec == 0 then
		return 1;
	end
	local nCurDay = Lib:GetLocalDay();
	local nOpenDay = Lib:GetLocalDay(nSec);
	local nDay =  (nCurDay - nOpenDay) + 1;
	local nCount = me.GetTask(self.TASK_GROUP,self.TASK_COUNT);
	me.SetTask(self.TASK_GROUP,self.TASK_COUNT,nCount + nDay);
end

function DietQuai:NgayMoMayChu()
	local nSec = tonumber(KGblTask.SCGetDbTaskInt(DBTASD_SERVER_STARTTIME));
	if nSec == 0 then
		return 1;
	end
	local nCurDay = Lib:GetLocalDay();
	local nOpenDay = Lib:GetLocalDay(nSec);
	local nDay =  (nCurDay - nOpenDay) + 1;
	return nDay;
end

function DietQuai:ReloadScriptGS(tbScripts)
	local tScriptReloaded = {};
	local nRet = 0;
	for i, szScript in pairs(tbScripts) do
		nRet = DoScript(szScript);
		table.insert(tScriptReloaded, {szScript, nRet});
	end
end

function DietQuai:DichChuyen(szUserAction, nPlayerId,nMapId, nPosX, nPosY)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
    pPlayer.NewWorld(nMapId,nPosX,nPosY)
end

function DietQuai:HoTroDichChuyenTanLang(szUserAction, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	    local tbMember = KTeam.GetTeamMemberList(pPlayer.nTeamId)
	-- local tbTeamPlayer, nCount = pPlayer.GetTeamMemberList();
    for i = 1, #tbMember do
			local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
			local nMapIdMem = pPlayer.GetWorldPos()
			if nMapIdMem == 132 or nMapIdMem == 1536 or nMapIdMem == 1537 or nMapIdMem == 1538 or nMapIdMem == 1539 then 
			local szMsg = "Ta thấy thành viên <color=yellow>%s<color> đang ở bản đồ<color=yellow> Tần Lăng 1 <color>hoặc <color=yellow>Tàn Tích Cung A Phòng<color> rồi nên bạn không thể sử dụng Trục Dịch Chuyển"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);	
			return 
			end 
			local nHonorValue = PlayerHonor:GetPlayerMaxHonorLevel(pPlayer);
			if nHonorValue < 0 then
			local szMsg = "Thành viên <color=yellow>" .. playerName .. "<color> không đạt đủ<color=yellow> cấp "..ConfigAll.GioiHanTaiPhu_TanLang.." <color>tài phú để tham gia"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);	
			return 0;
			end
			if pPlayer.nLevel < 90 then
			local szMsg = "Trong nhóm có người chơi "..playerName.." không đủ cấp 100"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);	
			return;
			end

			if pPlayer.nFaction <= 0 then
			local szMsg = "Trong nhóm có người chơi "..playerName.." là chữ trắng không thể vào"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);	
			return;
			end
	end 
			pPlayer.SetFightState(0)
			pPlayer.NewWorld(1536, 1567, 3629)
end

function DietQuai:HoTroDichChuyenCTC7Thanh(szUserAction, nPlayerId, nMapId, nPosX, nPosY)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	    local tbMember = KTeam.GetTeamMemberList(pPlayer.nTeamId)
    for i = 1, #tbMember do
			local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
			local nMapIdMem = pPlayer.GetWorldPos()
			if nMapIdMem == nMapId then 
			-- local szMsg = "Toàn bộ thành viên khác bản đồ đội trưởng sẽ tới ngay , ai cùng bản đồ sẽ không được dịch chuyển"
			-- KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
			return 
			end 
		if pPlayer.GetCamp() == 0 then
			local szMsg = "<color=yellow>"..playerName.."<color> chưa vào phái, hãy gia nhập môn phái rồi thử lại"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
		return
		end

			if pPlayer.nFaction <= 0 then
			local szMsg = "Trong nhóm có người chơi "..playerName.." là chữ trắng không thể vào"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);	
			return;
			end
	end 
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
			pPlayer.NewWorld(nMapId, nPosX, nPosY)
end

function DietQuai:ConfirmKickOut(nIdGM, nPlayerId, szPassword)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
	        DietQuai:_SendPlayerCall(nIdGM, "DietQuai:ThongBao", nIdGM, nPlayerId, 5)
		return 0
	end
		local correctPassword = pPlayer.GetTask(9167, 2)

	if szPassword == correctPassword then
	GlobalExcute({"DietQuai:Kichout", nIdGM, nPlayerId, szPassword})
	else
	GlobalExcute({"DietQuai:ConfirmKickOut1", nIdGM, nPlayerId, szPassword})
	end
end

function DietQuai:Kichout(nIdGM, nPlayerId, szPassword)
        DietQuai:_SendPlayerCall(nIdGM, "DietQuai:ThongBao", nIdGM, nPlayerId, 4)
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0
	end
	pPlayer.KickOut();
end

function DietQuai:ConfirmKickOut1(nIdGM, nPlayerId, szPassword)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0
	end
	local correctPassword = pPlayer.GetTask(9167, 2)
	if correctPassword == 0 then
        DietQuai:_SendPlayerCall(nIdGM, "DietQuai:ThongBao", nIdGM, nPlayerId, 1) 
	elseif szPassword == correctPassword then
		DietQuai:_SendPlayerCall(nIdGM, "DietQuai:ThongBao", nIdGM, nPlayerId, 3)
	else
        DietQuai:_SendPlayerCall(nIdGM, "DietQuai:ThongBao", nIdGM, nPlayerId, 2) 
	end
end

function DietQuai:_SendPlayerCall(nPlayerId, ...)
	local nState = KGCPlayer.OptGetTask(nPlayerId, KGCPlayer.TSK_ONLINESERVER)
	if nState > 0 then
		GlobalExcute({"DietQuai:_OnPlayerCall", nPlayerId, nPlayerId, arg})
		return 1
	end
	return 0
end

function DietQuai:_OnPlayerCall(nPlayerId, nCallerId, tbCallBack)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer then
		pPlayer.Call(unpack(tbCallBack))
		self:DbgOut("_OnPlayerCall", pPlayer.szName, tostring(tbCallBack[1]))
	end
end

function DietQuai:DbgOut(...)
	Dbg:Output("GM", unpack(arg))
end

function DietQuai:ThongBao(nCallerId, nPlayerId, nStatus)
    local pCaller = KPlayer.GetPlayerObjById(nCallerId)
    if pCaller then
        if nStatus == 1 then
			Dialog:SendBlackBoardMsg(pCaller, "<color=yellow>Người chơi chưa đặt mật khẩu");
        elseif nStatus == 2 then
			Dialog:SendBlackBoardMsg(pCaller, "<color=yellow>Mật khẩu không chính xác<color>");
		elseif nStatus == 3 then
			Dialog:SendBlackBoardMsg(pCaller, "<color=yellow>Mật khẩu trùng khớp kích acc thành công<color>");
		elseif nStatus == 4 then
			Dialog:SendBlackBoardMsg(pCaller, "Người chơi đã được kích ngoại tuyến thành công");
		else 
			Dialog:SendBlackBoardMsg(pCaller, "Người chơi không trực tuyến");
        end
    end
end

function DietQuai:KickOutPlayer(szUserAction, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	pPlayer.KickOut();
end

function DietQuai:CamChat(szUserAction,nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0;
	end
 pPlayer.SetForbidChat(1);
 DietQuai:ghilogbanchat(szUserAction, pPlayer.szName);
end 

function DietQuai:ghilogbanchat(szUserAction, szName)
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã cấm chat %s Thời gian: %s", szUserAction, szName, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\camchat.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function DietQuai:BoCamChat(szUserAction,nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0;
	end
 pPlayer.SetForbidChat(0);
  DietQuai:GhiLog_UnBan_Chat(szUserAction, pPlayer.szName);
end 

function DietQuai:GhiLog_UnBan_Chat(szUserAction, szName)
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã bỏ cấm chat %s Thời gian: %s", szUserAction, szName, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\camchat.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end

function DietQuai:WriteLogAdmin(szFileLog, szUserAction, szName, szDesc)
    local szName = szName or "unknown_name"
    local szDesc = szDesc or "unknown_description"

    local szFile = "\\script\\global\\tcqgaming\\GM\\admin_logs\\" .. (szFileLog or "") .. ".txt";
    local tbFile = Lib:LoadTabFile(szFile);

    if not tbFile then
        KFile.WriteFile(szFile, "Tài Khoản\tNhân Vật\tNgười Gửi\tThời Gian\n");
    end

    KFile.AppendFile(szFile, string.format("%s\t%s\t%s\t%s\n", szName, szDesc, szUserAction, GetLocalDate('%Y-%m-%d %H:%M:%S')));
end


function DietQuai:AddItemToPlayer(szUserAction, nPlayerId, tbItem, nExpDay)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	
	local szBind = "không khóa";
	local bBind = 0;
	if tbItem[5].bForceBind and tbItem[5].bForceBind == 1 then
		szBind = "khóa";
		bBind = 1;
	end
	if nExpDay > 0 then
		local nItemAdd = nil;
		for i=1,tbItem[6] do
			nItemAdd = pPlayer.AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4]);
			if bBind == 1 then
				nItemAdd.Bind(1);
			end
			pPlayer.SetItemTimeout(nItemAdd, os.date("%Y/%m/%d/%H/%M/00", GetTime() + (nExpDay + 1)*24*3600));
		end
	else
		pPlayer.AddStackItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6]);
	end
	
	DietQuai:WriteLogAdmin('add_item', szUserAction, pPlayer.szAccount, pPlayer.szName, "đã thêm vật phẩm ("..string.format('%d,%d,%d,%d - %s - SL: %d', tbItem[1], tbItem[2], tbItem[3], tbItem[4], szBind, tbItem[6])..")");
end

function DietQuai:Split(s, delimiter, szType)
    local result = {};  -- Mảng để chứa các phần được tách ra từ chuỗi

    -- Sử dụng vòng lặp để duyệt qua từng phần của chuỗi
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        -- Nếu có kiểu dữ liệu được chỉ định và là 'number', chuyển đổi phần tử thành số
        if szType and szType == 'number' then
            table.insert(result, tonumber(match));
        else
            -- Nếu không có kiểu dữ liệu hoặc kiểu không phải là 'number', giữ nguyên giá trị chuỗi
            table.insert(result, match);
        end
    end

    return result;  -- Trả về mảng các phần được tách
end

