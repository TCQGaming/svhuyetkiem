
local tbNpc = Npc:GetClass("ctcchefu");
--script\CTC\npc\chefu.lua
tbNpc.nSoLuongOTrong = 10;-- so luong o trong trong tui

tbNpc.HONOR_CLASS_MONEY		= 8;	
tbNpc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbNpc.HONOR_CLASS_MONEY,
	},
};
function tbNpc:OnDialog(nCheck)


--------Giới hạn hệ nhân vật / PC--------
local nHardWareId = me.dwHardWareId;

local tbHwidPaths = {
    ["TLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt",
    ["TLB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt",
    ["TVT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt",
    ["TVC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt",
    ["DMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt",
    ["DMT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt",
    ["NDD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt",
    ["NDC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt",
    ["NMC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt",
    ["NMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt",
    ["TYC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt",
    ["TYK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt",
    ["CBB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt",
    ["CBR"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt",
    ["TNK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt",
    ["TND"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt",
    ["VDK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt",
    ["VDQ"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDQ.txt",
    ["CLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt",
    ["CLK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt",
    ["MGC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt",
    ["MGK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt",
    ["DTC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt",
    ["DTK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt"
}

local tbFactionLimits = {
    {nMonPhai = 1,  nHeMonPhai = 1,  key = "TLD", name = "Thiếu Lâm Đao"},
    {nMonPhai = 2,  nHeMonPhai = 1,  key = "TLB", name = "Thiếu Lâm Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 2,  key = "TVT", name = "Thiên Vương Thương"},
    {nMonPhai = 2,  nHeMonPhai = 2,  key = "TVC", name = "Thiên Vương Chùy"},
    {nMonPhai = 1,  nHeMonPhai = 3,  key = "DMB", name = "Đường Môn Bẫy"},
    {nMonPhai = 2,  nHeMonPhai = 3,  key = "DMT", name = "Đường Môn Tiễn"},
    {nMonPhai = 1,  nHeMonPhai = 4,  key = "NDD", name = "Ngũ Độc Đao"},
    {nMonPhai = 2,  nHeMonPhai = 4,  key = "NDC", name = "Ngũ Độc Chưởng"},
    {nMonPhai = 1,  nHeMonPhai = 5,  key = "NMC", name = "Nga My Chưởng"},
    {nMonPhai = 2,  nHeMonPhai = 5,  key = "NMB", name = "Nga My Buff"},
    {nMonPhai = 1,  nHeMonPhai = 6,  key = "TYK", name = "Thúy Yên Kiếm"},
    {nMonPhai = 2,  nHeMonPhai = 6,  key = "TYC", name = "Thúy Yên Đao"},
    {nMonPhai = 1,  nHeMonPhai = 7,  key = "CBR", name = "Cái Bang Rồng"},
    {nMonPhai = 2,  nHeMonPhai = 7,  key = "CBB", name = "Cái Bang Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 8,  key = "TNK", name = "Thiên Nhẫn Kích"},
    {nMonPhai = 2,  nHeMonPhai = 8,  key = "TND", name = "Thiên Nhẫn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 9,  key = "VDK", name = "Võ Đang Khí"},
    {nMonPhai = 1,  nHeMonPhai = 9,  key = "VDQ", name = "Võ Đang Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 10, key = "CLD", name = "Côn Lôn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 10, key = "CLK", name = "Côn Lôn Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 11, key = "MGC", name = "Minh Giáo Chùy"},
    {nMonPhai = 2,  nHeMonPhai = 11, key = "MGK", name = "Minh Giáo Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 12, key = "DTC", name = "Đoàn Thị Chỉ"},
    {nMonPhai = 2,  nHeMonPhai = 12, key = "DTK", name = "Đoàn Thị Kiếm"}
}

local nSoAccLimit = ConfigAll.GioiHanMonPhai -- Giới hạn số lượng acc/phái

local function CheckFactionLimit(faction)
    local tbHwidOld = Lib:LoadTabFile(tbHwidPaths[faction.key])
    local nNum = 0

    for _, tbRowData in ipairs(tbHwidOld) do
        if tonumber(tbRowData.MaMay) == nHardWareId then
            nNum = nNum + 1
        end
    end

    if nNum >= nSoAccLimit then
        local bFound = false
        for _, tbRowData in ipairs(tbHwidOld) do
            if tbRowData.PlayerName == me.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                bFound = true
                break
            end
        end

        if not bFound then
            Dialog:Say(string.format("<color=cyan>Mỗi Máy tính chỉ được vào %d Nhân vật phái %s\nMáy tính của bạn đã gia nhập %d nhân vật <color=green>%s<color><color>",
                nSoAccLimit, faction.name, nNum, faction.name))
            return true
        end
    end
    return false
end

for _, faction in ipairs(tbFactionLimits) do
    if me.nRouteId == faction.nMonPhai and me.nFaction == faction.nHeMonPhai then
        if CheckFactionLimit(faction) then
            return
        end
    end
end
--------End giới hạn--------

----------Gioi Han Tai Phu-------------
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu then
	Dialog:Say(ConfigAll.ThongBaoGioiHan)
	return 0;
	end
	end
---------------------------------------
	if CTC:CheckTime() == false then
		Dialog:Say("Hoạt động chưa bắt đầu, vui lòng quay lại sau");
		return;
	end
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(CTC.nTask_Group, CTC.nTaskId_Day) < nDate then
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Day, nDate);
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count, 0);
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV, 0);
	end 
		local tbOpt = {	
				{"Báo danh Thiết Phù Thành",self.Register,self},
				{"Truyền tống Thiết Phù Thành",self.chuansong,self},
				{"<pic=285>Kết thúc đối thoại"};
	
			};
			local Show_Line_BD = 0
			local nTime = GetTime();
			local nWeekDay = tonumber(os.date("%w", nTime))
			local nCurTime = tonumber(os.date("%H%M", nTime))
			if CTC.Show_Line_BD == 1 then
				table.insert(tbOpt,1, {"Báo danh Thiết Phù Thành",self.Register,self});
			end
			 if CTC.Show_Line_NT == 1   then
				table.insert(tbOpt,3, {"Nhận Thưởng <color=yellow>(Bang Chủ)<color>",self.NhanThuongBC,self});
				table.insert(tbOpt,4, {"Nhận Thưởng <color=yellow>(Thành Viên)<color>",self.NhanThuongTV,self});
			end
Dialog:Say("Ngươi muốn đến Thiết Phù Thành chứ?",tbOpt)
end
function tbNpc:NhanThuongBC()
	local pTong = KTong.GetTong(me.dwTongId);
	if not pTong then
		Dialog:Say("Bạn không trong bang hội, không thể sử dụng chức năng này")
		return 0;
	end	
	local szTongName = pTong.GetName();
	local szFile = CTC.Folder..CTC.List.."";
	local nCheck = 0 ;
	local nRank = 0;
	local nCount = me.GetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV);
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay ~= CTC.WEEKDAY then
		Dialog:Say("Chỉ đươc nhận thưởng trong ngày diễn ra sự kiện");
		return 0;
	end
	if nCount > 0 then
		Dialog:Say("Mỗi người chỉ có thể nhận 1 lần");
		return 0;
	end	
	if me.CountFreeBagCell() < self.nSoLuongOTrong then
		Dialog:Say("Hành trang ít nhất "..self.nSoLuongOTrong.." ô trống !!",tbOpt);
		return 0;	
	end;
    local nTongId = me.dwTongId;
    local checkResult = self:CheckDeclareWarRight(nTongId);

    if checkResult == 0 then
        return 0; 
    end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	if nRank == 0 then
		Dialog:Say("Không có xếp hạng lần trước không thể nhận");
		return 0;
	end
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\CTC\\bangchunhanthuong.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 
	local nMoKhamNam = ConfigAll.OpenKham
	if nRank == 1 then
ConfigAll.BangChu_CTC_Bang_TOP1()
self.GhiLogTenBang()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_BC_TOP1	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count, nCount + 1);
	elseif nRank == 2 then
ConfigAll.BangChu_CTC_Bang_TOP2()
self.GhiLogTenBang()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_BC_TOP2
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count, nCount + 1);
	elseif nRank == 3 then
ConfigAll.BangChu_CTC_Bang_TOP3()
self.GhiLogTenBang()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_BC_TOP3
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count, nCount + 1);
	elseif nRank == 4 then
ConfigAll.BangChu_CTC_Bang_TOP4()
self.GhiLogTenBang()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_BC_TOP4
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count, nCount + 1);
	end

CampBattle:RemovePlayerGioiHan_MonPhai(me);
end

function tbNpc:GhiLogTenBang()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\CTC\\bangchunhanthuong.txt"
    tbNpc:WriteUsedCodeToFile(szTongName, szFile)
end


function tbNpc:WriteUsedCodeToFile(szTongName, szFile)
    local szData = KFile.ReadTxtFile(szFile)
    
    -- Chúng ta sẽ kiểm tra xem tên Bang Hội đã tồn tại trong file hay chưa trước khi thêm vào
    if not szData or not szData:find(szTongName) then
        szData = szData and (szData .. "\n" .. szTongName) or szTongName
        KFile.WriteFile(szFile, szData)
    end
end



function tbNpc:NhanThuongTV()
	local pTong = KTong.GetTong(me.dwTongId);
	if not pTong then
		Dialog:Say("Bạn không trong bang hội, không thể sử dụng chức năng này")
		return 0;
	end	
	local szTongName = pTong.GetName();
	local szFile = CTC.Folder..CTC.List.."";
	local nRank = 0;
	local nCount = me.GetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV);
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay ~= CTC.WEEKDAY then
		Dialog:Say("Chỉ đươc nhận thưởng trong ngày diễn ra sự kiện");
		return 0;
	end
		local nGioiHanBC = me.GetTask(CTC.nTask_Group, CTC.nTaskId_Count);
	if nGioiHanBC > 0 then
	Dialog:Say("Mỗi người chỉ có thể nhận 1 lần");
	return 0;
	end	
	if nCount > 0 then
		Dialog:Say("Mỗi người chỉ có thể nhận 1 lần");
		return 0;
	end
	if me.CountFreeBagCell() < self.nSoLuongOTrong then
		Dialog:Say("Hành trang ít nhất "..self.nSoLuongOTrong.." ô trống !!",tbOpt);
		return 0;	
	end;	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end

	if nRank == 0 then
		Dialog:Say("Không có xếp hạng lần trước không thể nhận"); 
		return 0;
	end
		local nMoKhamNam = ConfigAll.OpenKham
	-- Add Phan Thuong
	if nRank == 1 then
ConfigAll.ThanhVien_CTC_Bang_TOP1()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_TV_TOP1
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV, nCount + 1);
	elseif nRank == 2 then
ConfigAll.ThanhVien_CTC_Bang_TOP2()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_TV_TOP2
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV, nCount + 1);
	elseif nRank == 3 then
ConfigAll.ThanhVien_CTC_Bang_TOP3()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_TV_TOP3
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV, nCount + 1);
	elseif nRank == 4 then
ConfigAll.ThanhVien_CTC_Bang_TOP4()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_TV_TOP4
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
		me.SetTask(CTC.nTask_Group, CTC.nTaskId_Count_TV, nCount + 1);
	end
	
end

function tbNpc:CheckDeclareWarRight(nTongId)
    local nSelfKinId, nSelfMemberId = me.GetKinMember();
    local nMasterCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_MASTER);-----Chỉ Bang Chủ
    local nGeneralCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_WAR);-----Bang Chủ Và Phó Bang Chủ

    if nMasterCheck ~= 1 then
        Dialog:Say("<color=yellow>Chỉ Bang Chủ Mới Nhận Phần Thưởng Này");
        return 0;
    end
    return 1; 
end

function tbNpc:QuayVe()
	me.NewWorld(24,1767,3540);
end
function tbNpc:chuansong()
	Dialog:Say("Ngươi muốn đến Thiết Phù Thành chứ?",
			{

				{"Đồng ý", self.OnTransTotiefucheng, self},
				{"Để suy nghĩ lại đã"},	
			}
		);
end

function tbNpc:Register()
    local nTongId = me.dwTongId;
    local nSelfKinId, nSelfMemberId = me.GetKinMember();
    local nMasterCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_MASTER);-----Chỉ Bang Chủ
    local nGeneralCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_WAR);-----Bang Chủ Và Phó Bang Chủ

    if nGeneralCheck ~= 1 then
        Dialog:Say("<color=yellow>Chỉ Bang Chủ Hoặc Phó Bang Chủ mới có thể tiến hành báo danh");
        return 0;
    end
	if #CTC.TongList >= CTC.MAXTONG then
		Dialog:Say("Hiện tại đã đủ "..CTC.MAXTONG.." Bang hội tham gia. Vui lòng quay lại sau.");
		return 0;
	end
	--local cTong = KTong.GetTong(me.dwTongId);
	for i = 1,#CTC.TongList do
		if CTC.TongList[i] == me.dwTongId then
		Dialog:Say("Bang hội của bạn đã đăng ký");
		return;
		end
	end

	table.insert(CTC.TongList,me.dwTongId);
	table.insert(CTC.Result,{me.dwTongId,0});
	Dialog:Say("Báo danh thành công");
	Player:SendMsgToKinOrTong(me, " đăng ký thành công CTC", 1);
	KTong.Msg2Tong(me.dwTongId, "Người chơi "..me.szName.. " báo danh thành công Công Thành Chiến");
	--print(#CTC.TongList);
	
end

function tbNpc:OnTransTotiefucheng()
	if CTC:Check()== false then
	return;
	end
	local szFile_HWID = CTC.Folder..CTC.List_HWID.."";
	local nCheck_HWID = 0;
	local nCount_HWID = 0;
	local nHardWareId = me.dwHardWareId;
	local nNum = 0;
	if szFile_HWID then 
		local tbFile =  Lib:LoadTabFile(szFile_HWID);
			for nIndex, tbRow  in ipairs(tbFile) do
				if (nHardWareId == tonumber(tbRow.nHWID)) and (tonumber(tbRow.nNum) >= CTC.Max_HWID)  then	--khac name va vuot qua hwid
					if me.szName ~= tbRow.szName then
						nCheck_HWID = 1;				
					end
				end
				
			end
	end	
	if nCheck_HWID == 1 then
		Dialog:Say("Giới hạn đã được mở chỉ có thể vào tối đa "..CTC.Max_HWID.." nhân vật");
		return;
	end
	
	if nCheck_HWID == 0 then
		CTC:WriteFile_HWID(me,0,0);--me: truyen bien player,0: nCount ,0: ghi mới or 1: update thông tin có trước
	end

	-------------------------------------
	table.insert(CTC.PlayerList,me.nId);
	for i = 1,#CTC.TongList do
		if me.dwTongId == CTC.TongList[i] then
			me.SetTmpDeathPos(unpack(CTC.MapPos_Prepare[i]));-- set diem luu chet tam
			me.SetFightState(0);-- tat pk
			me.SetCurCamp(i);--set cam
			me.NewWorld(unpack(CTC.MapPos_Prepare[i]));-- move ra ngoai--
		end
	end

	local szFile = CTC.Folder..CTC.List.."";
	local nCheck = 0 ;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if me.szName == tbRow.szName then						
					nCheck = 1;
				end
			end
	end	
	if nCheck < 1 then
		CTC:WriteFile(me,0,0);--me: truyen bien player,0: xep hang rank ,0: ghi mới or 1: update thông tin có trước
	end
	if ConfigAll.GioiHanKhongTrungPhaiCTC_Ngai  == 1 then 
				CampBattle:GioiHanMonPhai(pPlayer)
	end 
	-----------------------------------
end

