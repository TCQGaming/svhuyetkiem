
CampBattle.Mission_CampBattle_CheckNumAccount = 1;--Tắt mở chức năng 0 là tắt,1 là mở
CampBattle.Mission_CampBattle_HardWare_Folder = "\\script\\iDoctor\\CampBattle\\"; -- Đường dẫn folder Ổ cứng
CampBattle.Mission_CampBattle_HardWare_List = "Tong.txt"; -- File Load Tống
CampBattle.Mission_CampBattle_HardWare_ListKim = "Kim.txt"; -- File Load Kim
CampBattle.Mission_CampBattle_HardWare_GioiHanMonPhai = "GioiHanMonPhai.txt"; -- File Load Kim

function CampBattle:RemovePlayerGioiHan_MonPhai(pPlayer)
    if not pPlayer then
        return;
    end

    local nHardWareId = pPlayer.dwHardWareId;
		if not nHardWareId then 
		return ;
	end	
    local nMonPhai = pPlayer.nRouteId;
    local nHeMonPhai = pPlayer.nFaction;

    -- Bổ sung đủ 24 cấu hình cho 12 phái × 2 hệ
    local tbPhaiConfigs = {
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt", nMonPhai = 1, nHeMonPhai = 1,  phaiName = "Thiếu Lâm Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt", nMonPhai = 2, nHeMonPhai = 1,  phaiName = "Thiếu Lâm Bổng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt", nMonPhai = 1, nHeMonPhai = 2,  phaiName = "Thiên Vương Thương"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt", nMonPhai = 2, nHeMonPhai = 2,  phaiName = "Thiên Vương Chùy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt", nMonPhai = 1, nHeMonPhai = 3,  phaiName = "Đường Môn Bẫy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt", nMonPhai = 2, nHeMonPhai = 3,  phaiName = "Đường Môn Tiễn"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt", nMonPhai = 1, nHeMonPhai = 4,  phaiName = "Ngũ Độc Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt", nMonPhai = 2, nHeMonPhai = 4,  phaiName = "Ngũ Độc Chưởng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt", nMonPhai = 1, nHeMonPhai = 5,  phaiName = "Nga My Chưởng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt", nMonPhai = 2, nHeMonPhai = 5,  phaiName = "Nga My Buff"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt", nMonPhai = 1, nHeMonPhai = 6,  phaiName = "Thúy Yên Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt", nMonPhai = 2, nHeMonPhai = 6,  phaiName = "Thúy Yên Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt", nMonPhai = 1, nHeMonPhai = 7,  phaiName = "Cái Bang Rồng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt", nMonPhai = 2, nHeMonPhai = 7,  phaiName = "Cái Bang Bổng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt", nMonPhai = 1, nHeMonPhai = 8,  phaiName = "Thiên Nhẫn Kích"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt", nMonPhai = 2, nHeMonPhai = 8,  phaiName = "Thiên Nhẫn Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt", nMonPhai = 2, nHeMonPhai = 9,  phaiName = "Võ Đang Khí"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDQ.txt", nMonPhai = 1, nHeMonPhai = 9,  phaiName = "Võ Đang Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt", nMonPhai = 1, nHeMonPhai = 10, phaiName = "Côn Lôn Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt", nMonPhai = 2, nHeMonPhai = 10, phaiName = "Côn Lôn Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt", nMonPhai = 1, nHeMonPhai = 11, phaiName = "Minh Giáo Chùy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt", nMonPhai = 2, nHeMonPhai = 11, phaiName = "Minh Giáo Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt", nMonPhai = 1, nHeMonPhai = 12, phaiName = "Đoàn Thị Chỉ"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt", nMonPhai = 2, nHeMonPhai = 12, phaiName = "Đoàn Thị Kiếm"}
    };

    for _, tbConfig in ipairs(tbPhaiConfigs) do
        if nMonPhai == tbConfig.nMonPhai and nHeMonPhai == tbConfig.nHeMonPhai then
            local szHwidOld = tbConfig.szHwidOld;
            local szData = KFile.ReadTxtFile(szHwidOld);
            if not szData then
                return;
            end

            -- Phân tách nội dung file thành từng dòng
            local tbLines = Lib:SplitStr(szData, "\n");
            if not tbLines or #tbLines == 0 then
                return;
            end

            -- Lấy dòng tiêu đề và dữ liệu chi tiết
            local szHeader = tbLines[1]; -- Dòng đầu tiên là tiêu đề
            local tbNewLines = {szHeader}; -- Giữ lại tiêu đề
            local bFound = false;

            for i = 2, #tbLines do
                local szLine = tbLines[i];
                local tbFields = Lib:SplitStr(szLine, "\t"); -- Cắt theo tab
                if #tbFields > 0 and tbFields[1] ~= pPlayer.szName then
                    table.insert(tbNewLines, szLine);
                else
                    bFound = true;
                end
            end

            if not bFound then
                return;
            end

            -- Ghi lại danh sách mới vào file
            local szNewData = table.concat(tbNewLines, "\n");
            KFile.WriteFile(szHwidOld, szNewData);
            return;
        end
    end
end


function CampBattle:XoaNguoiChoiKhoiDanhSach(szPlayerName)
    local szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHan1Acc.txt";

    -- Đọc toàn bộ nội dung file
    local szData = KFile.ReadTxtFile(szHwidOld);
    if not szData or szData == "" then
        -- print("File danh sách hiện tại trống hoặc không tồn tại.");
        return;
    end

    -- Phân tách nội dung file thành từng dòng
    local tbLines = Lib:SplitStr(szData, "\n");
    if not tbLines or #tbLines == 0 then
        -- print("Danh sách hiện tại trống hoặc không tồn tại.");
        return;
    end

    -- Lấy dòng tiêu đề và dữ liệu chi tiết
    local szHeader = tbLines[1]; -- Dòng đầu tiên là tiêu đề
    local tbNewLines = {szHeader}; -- Giữ lại tiêu đề

    local bFound = false;

    -- Duyệt qua từng dòng dữ liệu (bỏ qua dòng đầu tiên là tiêu đề)
    for i = 2, #tbLines do
        local szLine = tbLines[i];
        local tbFields = Lib:SplitStr(szLine, "\t"); -- Phân tách dòng thành các cột
        if #tbFields > 0 and tbFields[1] ~= szPlayerName then
            table.insert(tbNewLines, szLine); -- Giữ lại các dòng không khớp tên người chơi
        else
            bFound = true;
        end
    end

    -- Kiểm tra nếu không tìm thấy người chơi
    if not bFound then
        -- print("Không tìm thấy người chơi: "..szPlayerName.." trong danh sách.");
        return;
    end

    -- Ghi lại danh sách mới vào file
    local szNewData = table.concat(tbNewLines, "\n");
    KFile.WriteFile(szHwidOld, szNewData);

    -- print("Đã xóa người chơi: "..szPlayerName.." khỏi danh sách.");
end



function CampBattle:GioiHan1Acc(pPlayer)
    if not pPlayer then
        return;
    end

    local nHardWareId = pPlayer.GetTask(2406, 1)
    local szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHan1Acc.txt";
    local tbHwidOld = Lib:LoadTabFile(szHwidOld);
    local nSoAccPerPC = 1 -- Giới hạn số nhân vật tối đa trên mỗi PC
    local nNum = 0

    -- Đếm số lượng nhân vật đã được tạo từ PC này
    for _, tbRowData in ipairs(tbHwidOld) do
        if tonumber(tbRowData.MaMay) == nHardWareId then
            nNum = nNum + 1
        end
    end

    -- Kiểm tra nếu đã vượt quá giới hạn
    if nNum >= nSoAccPerPC then
        -- Kiểm tra nếu nhân vật hiện tại đã có trong danh sách
        for _, tbRowData in ipairs(tbHwidOld) do
            if tbRowData.PlayerName == pPlayer.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                return -- Cho phép nếu nhân vật hiện tại đã được tạo trước đó
            end
        end
        
        -- Thông báo và từ chối nếu vượt quá giới hạn
        pPlayer.Msg("<color=cyan>Mỗi máy tính chỉ được phép tham gia tối đa "..nSoAccPerPC.." nhân vật.\nHiện tại, máy tính của bạn đã tham gia "..nNum.." nhân vật.<color>");
        return;
    end

    -- Thêm nhân vật mới vào danh sách
    local szData = KFile.ReadTxtFile(szHwidOld)  
    if not szData or not szData:find(string.format("%s\t%s", pPlayer.szName, nHardWareId), 1, true) then
        KFile.AppendFile(szHwidOld, string.format("%s\t%s\n", pPlayer.szName, nHardWareId));
    end
end

function CampBattle:GioiHanMonPhai(pPlayer)
    if not pPlayer then
        return;
    end

    local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return ;
	end	
    local nMonPhai = pPlayer.nRouteId;
    local nHeMonPhai = pPlayer.nFaction;

    -- Bổ sung đủ 24 cấu hình cho 12 phái × 2 hệ
    local tbPhaiConfigs = {
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt", nMonPhai = 1, nHeMonPhai = 1,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiếu Lâm Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt", nMonPhai = 2, nHeMonPhai = 1,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiếu Lâm Bổng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt", nMonPhai = 1, nHeMonPhai = 2,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiên Vương Thương"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt", nMonPhai = 2, nHeMonPhai = 2,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiên Vương Chùy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt", nMonPhai = 1, nHeMonPhai = 3,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Đường Môn Bẫy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt", nMonPhai = 2, nHeMonPhai = 3,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Đường Môn Tiễn"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt", nMonPhai = 1, nHeMonPhai = 4,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Ngũ Độc Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt", nMonPhai = 2, nHeMonPhai = 4,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Ngũ Độc Chưởng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt", nMonPhai = 1, nHeMonPhai = 5,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Nga My Chưởng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt", nMonPhai = 2, nHeMonPhai = 5,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Nga My Buff"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt", nMonPhai = 1, nHeMonPhai = 6,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thúy Yên Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt", nMonPhai = 2, nHeMonPhai = 6,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thúy Yên Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt", nMonPhai = 1, nHeMonPhai = 7,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Cái Bang Rồng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt", nMonPhai = 2, nHeMonPhai = 7,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Cái Bang Bổng"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt", nMonPhai = 1, nHeMonPhai = 8,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiên Nhẫn Kích"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt", nMonPhai = 2, nHeMonPhai = 8,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Thiên Nhẫn Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt", nMonPhai = 1, nHeMonPhai = 9,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Võ Đang Khí"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDI.txt", nMonPhai = 2, nHeMonPhai = 9,  nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Võ Đang Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt", nMonPhai = 1, nHeMonPhai = 10, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Côn Lôn Đao"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt", nMonPhai = 2, nHeMonPhai = 10, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Côn Lôn Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt", nMonPhai = 1, nHeMonPhai = 11, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Minh Giáo Chùy"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt", nMonPhai = 2, nHeMonPhai = 11, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Minh Giáo Kiếm"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt", nMonPhai = 1, nHeMonPhai = 12, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Đoàn Thị Chỉ"},
        {szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt", nMonPhai = 2, nHeMonPhai = 12, nSoAccLimit = ConfigAll.GioiHanMonPhai, phaiName = "Đoàn Thị Kiếm"}
    };

    for _, tbConfig in ipairs(tbPhaiConfigs) do
        if nMonPhai == tbConfig.nMonPhai and nHeMonPhai == tbConfig.nHeMonPhai then
            local szHwidOld = tbConfig.szHwidOld;
            local nSoAccLimit = tbConfig.nSoAccLimit;
            local phaiName = tbConfig.phaiName;

            local tbHwidOld = Lib:LoadTabFile(szHwidOld);
            if not tbHwidOld or type(tbHwidOld) ~= "table" then
                return;
            end

            local nNum = 0;
            for _, tbRowData in ipairs(tbHwidOld) do
                if tonumber(tbRowData.MaMay) == nHardWareId then
                    nNum = nNum + 1;
                end
                if tbRowData.PlayerName == pPlayer.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                    return;
                end
            end

            if nNum >= nSoAccLimit then
                pPlayer.Msg(string.format("<color=cyan>Mỗi máy tính chỉ được vào %d nhân vật phái %s.\nMáy tính của bạn đã gia nhập %d nhân vật <color=green>%s<color><color>",
                    nSoAccLimit, phaiName, nNum, phaiName));
                return;
            end

            local szData = KFile.ReadTxtFile(szHwidOld);
            if not szData or not szData:find(string.format("%s\t%s", pPlayer.szName, nHardWareId), 1, true) then
                KFile.AppendFile(szHwidOld, string.format("%s\t%s\t%s\n", pPlayer.szName, nHardWareId, nNum + 1));
            end
        end
    end
end




function CampBattle:WriteSongCamp(pPlayer)
	if not pPlayer then 
		return;
	end	

	local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return -1,0,"Lỗi thông tin ổ cứng";
	end	

	local szFile = CampBattle.Mission_CampBattle_HardWare_Folder..CampBattle.Mission_CampBattle_HardWare_List.."";

	local szIPPath = "\\script\\iDoctor\\DontLimitBattle\\Account.txt";  
    local tbIPSetting = Lib:LoadTabFile(szIPPath);

    for nRow, tbRowData in pairs(tbIPSetting) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["szAccount"];
        if (tbTemp.szIPban == me.szAccount) then
		    me.Msg("<color=yellow>Không giới hạn nhân vật này:<color><color=cyan> Successfully<color>");
            return 0;
        end
	end
	
	local szHwidOld = "\\script\\iDoctor\\CampBattle\\Tong.txt";  
    local tbHwidOld = Lib:LoadTabFile(szHwidOld);
    for nRow, tbRowData in pairs(tbHwidOld) do
        if (tonumber(tbRowData.Name) == nHardWareId) then
		me.Msg("<color=cyan>Địa chỉ Ip này đã được ghi nhận phe:<color><color=blue> Tống<color>");
        return 0;	
        end
    end
	
    KFile.AppendFile(szFile, nHardWareId.."\n");
end

function CampBattle:WriteKimCamp(pPlayer)
	if not pPlayer then 
		return;
	end	

	local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return ;
	end	

	local szFile = CampBattle.Mission_CampBattle_HardWare_Folder..CampBattle.Mission_CampBattle_HardWare_ListKim.."";

	local szIPPath = "\\script\\iDoctor\\DontLimitBattle\\Account.txt";  
    local tbIPSetting = Lib:LoadTabFile(szIPPath);

    for nRow, tbRowData in pairs(tbIPSetting) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["szAccount"];
        if (tbTemp.szIPban == me.szAccount) then
		    me.Msg("<color=yellow>Không giới hạn nhân vật này:<color><color=cyan> Successfully<color>");
            return 0;
        end
	end
	
	local szHwidOld = "\\script\\iDoctor\\CampBattle\\Kim.txt";  
    local tbHwidOld = Lib:LoadTabFile(szHwidOld);
    for nRow, tbRowData in pairs(tbHwidOld) do
        if (tonumber(tbRowData.Name) == nHardWareId) then
		me.Msg("<color=cyan>Máy tính này được ghi nhận phe:<color><color=purple> Kim<color>");
        return 0;		
        end
    end
	
    KFile.AppendFile(szFile, nHardWareId.."\n");
end
