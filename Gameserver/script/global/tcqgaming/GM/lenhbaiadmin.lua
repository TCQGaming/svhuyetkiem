-- GM专用卡
local tbGMCard = Item:GetClass("lenhbaitcq");
tbGMCard.MAX_RECENTPLAYER = 15;

function tbGMCard:OnUse()
DoScript("\\script\\global\\tcqgaming\\GM\\lenhbaiadmin.lua");
	local nQuayVaoHT3s = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_VSV)
	local nBachBaoRuongNe = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_RuongVuaDepVuaCaoQuy)
	 local nIsHide = GM.tbGMRole:IsHide();
	 local nCheck = me.GetTask(9167,1)
			local nHardWareId = me.dwHardWareId;
	 local nThoiGianThuc = GetTime()
	 -- GoiKyLan:GoiBoss_45_NgauNhien()
	 	if (me.szAccount == "xboyhd") then
	 -- GlobalExcute({"GoiKyLan:goiboss_75_kim"});
	 -- GlobalExcute({"GoiKyLan:GoiBoss_45_NgauNhien"});
	 -- GlobalExcute({"GoiKyLan:GoiBoss_75_NgauNhien"});
	 end 
XoaList:RemoveList_GS();
	 -- ConfigAll.ThuongThamGia_NguHanh()
	 	 	-- local nMapId, nPosX, nPosY = me.GetWorldPos();
	 	 -- self:ghiLogToaDo(nMapId, nPosX, nPosY)------Ghi log Lấy Tọa độ 
	 	local nBHD = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	 -- local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>\nMa may :"..nHardWareId.."";
	 -- local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>\nĐã quay vào 6677 :"..nBachBaoRuongNe.."\nĐã quay vào HT3 Sao :"..nQuayVaoHT3s.."";
	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi1<color>";
    local tbOpt =     {} 
				if (me.szAccount == "xboyhd") then
					if nCheck == 1 then 
					table.insert(tbOpt, {"<pic=123><color=yellow>Goi bosss ",self.GoiBossConMeNo,self});
					-- table.insert(tbOpt, {"<pic=123><color=yellow>Đổi phái",self.DoiPhaiMain,self});
					 -- table.insert(tbOpt, {"<pic=123><color=yellow>Lấy Kỹ Năng 150",self.addmoi,self});
					table.insert(tbOpt, {"<pic=123><color=yellow>Thông báo toàn Server",self.ThongBaoTheGioi,self});
					-- table.insert(tbOpt, {"<pic=123><color=yellow>Xoa Trụ",self.Xoa_TieuGS,self});
					 table.insert(tbOpt, {"<color=green>Lấy Đồ GM<color>",self.itemId,self});
					 -- table.insert(tbOpt, {"<color=green>Công Trạng Tuần<color>",self.CongTrang,self});
					table.insert(tbOpt, {"<color=yellow>Quản Lý Task<color>",self.MenuDev,self});
					-- table.insert(tbOpt, {"<color=yellow>Di chuyển Nhanh CTC <color>",self.DichChuyenCTCNe,self});
					table.insert(tbOpt, {"<color=yellow>Di chuyển Nhanh Thành <color>",self.DichuyenOnDialog,self});
					table.insert(tbOpt, {"<color=yellow>Reload Lệnh Bài Admin<color>",self.reloadgm,self});
					 table.insert(tbOpt, {"<color=yellow>Nhập tên nhân vật<color>",self.AskRoleName,self});
					table.insert(tbOpt, {"<pic=123><color=cyan>Tính năng GM<color>",self.GM_TCQGaming,self});
					table.insert(tbOpt, {"<pic=123><color=yellow>Reload Script 8GS<color>",self.Reload_script,self});
					-- table.insert(tbOpt, {"<pic=123><color=yellow>Reset Thời gian Open Sever<color>",self.LamMoiOpenSV,self});
					 -- table.insert(tbOpt, {"<pic=123><color=yellow>Set TDMP<color>",self.SetTaskToanSV,self});
					 -- table.insert(tbOpt, {"<pic=123><color=yellow>Cộng số lần dùng Quả<color>",self.congqua,self});
					 table.insert(tbOpt, {"<pic=123><color=yellow>Làm mới tỉ lệ BBR Và HT Sò<color>",self.LamMoiVSV,self});
					 -- table.insert(tbOpt, {"<color=yellow>Add NPC<color>",self.addnpcloc,self});
					 -- table.insert(tbOpt, {"<color=yellow>Add Ông Già Noel<color>",self.onggianoel2024,self});
					table.insert(tbOpt, {"<color=yellow>Add Danh Hiệu GM<color>",self.laydanhhieu,self});
					-- table.insert(tbOpt, {"<color=yellow>Lấy Vũ Khí<color>",self.layvukhi,self});
					-- table.insert(tbOpt, {"<pic=123><color=yellow>Goi Bosss toàn Server",self.goibossmoitcq,self});
					else 
					 table.insert(tbOpt, {"<bclr=blue><color=yellow>Nhập Pass<color>",self.KiemTraAdmin,self});
					me.Msg("<color=yellow>Cố Gắng Để Làm Chi Cho Đời Thêm Sầu");	
					end
				elseif (me.szAccount == "kimnhung") then
					table.insert(tbOpt, {"<pic=123><color=yellow>Goi bosss ",self.GoiBossConMeNo,self});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thông báo toàn Server",self.ThongBaoTheGioi,self});
				 table.insert(tbOpt, {"<color=green>Lấy Đồ GM<color>",self.itemId,self});
				table.insert(tbOpt, {"<color=yellow>Quản Lý Task<color>",self.MenuDev,self});
				table.insert(tbOpt, {"<color=yellow>Di chuyển Nhanh Thành <color>",self.DichuyenOnDialog,self});
				 -- table.insert(tbOpt, {"<color=yellow>Nhập tên nhân vật<color>",self.AskRoleName,self});
				table.insert(tbOpt, {"<pic=123><color=cyan>Tính năng GM<color>",self.GM_TCQGaming,self});
				table.insert(tbOpt, {"<color=yellow>Add Danh Hiệu GM<color>",self.laydanhhieu,self});
				else 
				me.Msg("<color=yellow>Dò Pass Cũng Cực Lắm nhưng bố đâu phải cừu non");	
				end 
				
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:CongTrang()
Battle:TOP_CONGTRANG()
end 
function tbGMCard:SetTaskToanSV()
	me.Msg("Set Task TDMP Thành Công");
	self:RemoteCall_ApplyAll("me.SetTask", 9152,1,0);
end 

function tbGMCard:RemoteCall_ApplyAll(...)
	GlobalExcute({"GM.tbPlayer:RemoteCall_DoAll", arg})
end

function tbGMCard:ghiLogToaDo(nMapId, nPosX, nPosY)
    local filelog = "\\script\\global\\tcqgaming\\GM\\logtoado.txt"
    local szData = KFile.ReadTxtFile(filelog)
    
    -- local sLine = string.format("{%d, %d}", nPosX, nPosY)
    local sLine = string.format("%d\t%d", nPosX*32, nPosY*32)
    if not szData or not szData:find(sLine) then
        szData = szData and (szData .. "\n" .. sLine) or sLine
        KFile.WriteFile(filelog, szData)
    end
end
function tbGMCard:GoiBossConMeNo()
GlobalExcute({"GoiKyLan:goiboss_75_kim"});
GlobalExcute({"GoiKyLan:goiboss_75_moc"});
GlobalExcute({"GoiKyLan:goiboss_75_thuy"});
GlobalExcute({"GoiKyLan:goiboss_75_hoa"});
GlobalExcute({"GoiKyLan:goiboss_75_tho"});
GlobalExcute({"GoiKyLan:goiboss_45_vantuyetson"});
GlobalExcute({"GoiKyLan:goiboss_45_hinhbodau"});
GlobalExcute({"GoiKyLan:goiboss_45_vanlaodien"});
GlobalExcute({"GoiKyLan:goiboss_45_caosihien"});
GlobalExcute({"GoiKyLan:goiboss_45_thacbacsonuyen"});
GlobalExcute({"GoiKyLan:goiboss_45_duonglieu"});
end 
function tbGMCard:DoiPhaiMain()
	if (me.nFaction == 0) then
	me.Msg("Chưa nhập môn phái!");
	return 0;
	end

    local me = KPlayer.GetPlayerObjById(me.nId);
    local nMainFaction = me.nFaction;

    if not nMainFaction or nMainFaction == 0 then
        Dialog:Say("Chưởng môn: Ngươi đã là đệ tử của môn phái khác, không thể gia nhập bổn phái.");
        return;
    end

    -- Lưu các môn phái phụ hiện tại
    local tbUsedFactionsBackup = {};
    for nTskId = 100, 100 + 3 - 1 do
        local nUsedFactionId = me.GetTask(7, nTskId);
        table.insert(tbUsedFactionsBackup, nUsedFactionId);
    end
    local tbFactionOptions = {
        {nFactionId = 1, szFactionName = "Thiếu Lâm"},
        {nFactionId = 2, szFactionName = "Thiên Vương"},
        {nFactionId = 3, szFactionName = "Đường Môn"},
        {nFactionId = 4, szFactionName = "Ngũ Độc"},
        {nFactionId = 5, szFactionName = "Nga My"},
        {nFactionId = 6, szFactionName = "Thúy Yên"},
        {nFactionId = 7, szFactionName = "Cái Bang"},
        {nFactionId = 8, szFactionName = "Thiên Nhẫn"},
        {nFactionId = 9, szFactionName = "Võ Đang"},
        {nFactionId = 10, szFactionName = "Côn Lôn"},
        {nFactionId = 11, szFactionName = "Minh Giáo"},
        {nFactionId = 12, szFactionName = "Đoàn Thị"},
    };

    -- Hiển thị hộp thoại chọn môn phái mới
    local tbOpt = {};
    for _, tbFaction in ipairs(tbFactionOptions) do
        table.insert(tbOpt, {tbFaction.szFactionName, self.OnSelectNewFaction, self, tbFaction.nFactionId});
    end
    table.insert(tbOpt, {"Không đổi"});

    Dialog:Say("Đệ tử: Hãy Chọn môn phái mới", tbOpt);
end

function tbGMCard:OnSelectNewFaction(nNewFaction)
    local me = KPlayer.GetPlayerObjById(me.nId);

    -- Đổi môn phái chính
    me.JoinFaction(nNewFaction);
    me.SetTask(2, 1, 1);

    -- Giữ nguyên các môn phái phụ tu
    local tbUsedFactionsBackup = {};
    for nTskId = 100, 100 + 3 - 1 do
        local nUsedFactionId = me.GetTask(7, nTskId);
        table.insert(tbUsedFactionsBackup, nUsedFactionId);
    end

    for i, nUsedFactionId in ipairs(tbUsedFactionsBackup) do
        local nTskId = 100 + i - 1;
        if i == 1 then
            me.SetTask(7, nTskId, 0);
        else
            me.SetTask(7, nTskId, nUsedFactionId);
        end
    end
	me.UnAssignPotential();
	me.ResetFightSkillPoint();
	Faction:InitChangeFaction(me);
    me.Msg("Đã đổi môn phái chính và giữ nguyên các môn phái phụ tu");
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local logMessage = string.format("Nhân Vật: %s đã chuyển môn phái main tốn 700 knb", me.szName)
    local logFilePath = "\\script\\global\\tcqgaming\\GM\\admin_logs\\shop.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end 
function tbGMCard:addngocmoi()
	-- me.AddBindCoin(3000*10000)
	-- me.AddStackItem(18,1,1303,1,{bForceBind=1},1000)
	me.AddStackItem(18,1,1301,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1300,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1304,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1305,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1306,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1302,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1307,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1308,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1309,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1310,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1319,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1312,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1313,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1314,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1315,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1316,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1317,1,{bForceBind=1},100)
	me.AddStackItem(18,1,1318,1,{bForceBind=1},100)
	end 
	function tbGMCard:addmoi()

	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<color=yellow>Lấy Kỹ Năng 150",self.addmoi150,self,1});
				table.insert(tbOpt, {"<color=yellow>Xóa Kỹ Năng 150",self.XoaKyNang150,self,2});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:addmoi150()

	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiếu Lâm Đao",self.addmoi1,self,1});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiếu Lâm Bổng",self.addmoi1,self,2});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiên Vương Thương",self.addmoi1,self,3});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiên Vương Chùy",self.addmoi1,self,4});
				table.insert(tbOpt, {"<pic=123><color=yellow>Đường môn bẫy",self.addmoi1,self,5});
				table.insert(tbOpt, {"<pic=123><color=yellow>Đường môn tiễn",self.addmoi1,self,6});
				table.insert(tbOpt, {"<pic=123><color=yellow>Ngũ Độc Đao",self.addmoi1,self,7});
				table.insert(tbOpt, {"<pic=123><color=yellow>Ngũ Độc Chưởng",self.addmoi1,self,8});
				table.insert(tbOpt, {"<pic=123><color=yellow>NM Chưởng",self.addmoi1,self,9});
				table.insert(tbOpt, {"<pic=123><color=yellow>NM Buff",self.addmoi1,self,10});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thúy Yên Đao",self.addmoi1,self,11});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thúy Yên Chưởng",self.addmoi1,self,12});
				table.insert(tbOpt, {"Trang sau",self.addmoitrang2,self,13});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbGMCard:addmoitrang2()

	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<pic=123><color=yellow>Cái bang bổng",self.addmoi1,self,13});
				table.insert(tbOpt, {"<pic=123><color=yellow>Cái bang Rồng",self.addmoi1,self,14});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiên nhẫn đao",self.addmoi1,self,15});
				table.insert(tbOpt, {"<pic=123><color=yellow>Thiên nhẫn kích",self.addmoi1,self,16});
				table.insert(tbOpt, {"<pic=123><color=yellow>Minh giáo Chùy",self.addmoi1,self,17});
				table.insert(tbOpt, {"<pic=123><color=yellow>Minh giáo Kiếm",self.addmoi1,self,18});
				table.insert(tbOpt, {"<pic=123><color=yellow>Võ Đang Khí",self.addmoi1,self,19});
				table.insert(tbOpt, {"<pic=123><color=yellow>Võ Đang Kiếm",self.addmoi1,self,20});
				table.insert(tbOpt, {"<pic=123><color=yellow>Côn Lôn Đao",self.addmoi1,self,21});
				table.insert(tbOpt, {"<pic=123><color=yellow>Côn Lôn Kiếm",self.addmoi1,self,22});
				table.insert(tbOpt, {"<pic=123><color=yellow>Đoàn thị Kiếm",self.addmoi1,self,23});
				table.insert(tbOpt, {"<pic=123><color=yellow>Đoàn thị Chỉ ",self.addmoi1,self,24});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbGMCard:addmoi1(index)
if index == 1 then 
	me.AddFightSkill(1993,20);-----Thiếu Lâm Đao
elseif index == 2 then 
	me.AddFightSkill(1997,20);-----Thiếu Lâm Bổng
	elseif index == 3 then 
		me.AddFightSkill(1689,20);-----Thiên Vương Thương
	elseif index == 4 then 
		me.AddFightSkill(1960,20);-----Thiên Vương Chùy
			elseif index == 5 then 
			me.AddFightSkill(1445,20);-----Đường môn bẫy
				elseif index == 6 then 
	me.AddFightSkill(1544,20);-----Đường môn tiễn
		elseif index == 7 then 
			me.AddFightSkill(1439,20);-----Ngũ Độc Đao
					elseif index == 8 then 
	me.AddFightSkill(1442,20);-----Ngũ Độc Chưởng
			elseif index == 9 then 
				me.AddFightSkill(1722,20);-----NM Chưởng
							elseif index == 10 then 
	me.AddFightSkill(1724,20);-----NM Buff
			elseif index == 11 then 
					   me.AddFightSkill(1728,20); --- Thúy Yên Đao
		elseif index == 12 then 
	   me.AddFightSkill(1731,20); --- Thúy Yên Chưởng
	   				elseif index == 13 then 
	me.AddFightSkill(1970,20);-----Cái bang bổng
		   				elseif index == 14 then 
	me.AddFightSkill(1973,20);-----Cái bang Rồng
		   				elseif index == 15 then 
	me.AddFightSkill(1964,20);-----Thiên nhẫn đao
		   				elseif index == 16 then 
	me.AddFightSkill(1966,20);-----Thiên nhẫn kích
		   				elseif index == 17 then 
	me.AddFightSkill(1968,20);-----Minh giáo Chùy
		   				elseif index == 18 then 
	me.AddFightSkill(1978,20);-----Minh giáo Kiếm
		   				elseif index == 19 then 
	me.AddFightSkill(1550,20);-----Võ Đang Khí
		   				elseif index == 20 then 
	me.AddFightSkill(1551,20);-----Võ Đang Kiếm
		   				elseif index == 21 then 
	me.AddFightSkill(1553,20);-----Côn Lôn Đao
		   				elseif index == 22 then 
	me.AddFightSkill(1708,20);-----Côn Lôn Kiếm
		   				elseif index == 23 then 
	me.AddFightSkill(1711,20);-----Đoàn thị Kiếm
		   				elseif index == 24 then 
	me.AddFightSkill(1717,20);-----Đoàn thị Chỉ 
	end 
	-- me.AddFightSkill(1906,10);
	 -- me.AddFightSkill(1972,1);
	 -- me.AddFightSkill(1973,1);
	-- me.DelFightSkill(1972);
	-- me.DelFightSkill(1973);
	-- me.DelFightSkill(1974);
	-- me.DelFightSkill(1979);
	-- me.DelFightSkill(1978);
	-- me.DelFightSkill(1981);
	-- me.DelFightSkill(1982);

	   	-- me.RemoveSkillState(1875);
	-- me.AddFightSkill(1882,1);
	-- me.AddFightSkill(1884,7);
	-- me.AddFightSkill(1998,1);
-- for i = 1867,1896 do 
	-- me.DelFightSkill(i);
-- end 
-- for i = 1901,1908 do 
	-- me.DelFightSkill(i);
-- end 
-- for i = 1, 100 do
	-- me.SetTask(9183,i,0)
-- end 
-- for i = 1, 33 do
	-- me.SetTask(9184,i,0)
-- end 
	me.Msg("Add thành công")
	end 
function tbGMCard:XoaKyNang150(index)	
	me.DelFightSkill(1993);-----Thiếu Lâm Đao
	me.DelFightSkill(1997);-----Thiếu Lâm Bổng
		me.DelFightSkill(1689);-----Thiên Vương Thương
		me.DelFightSkill(1960);-----Thiên Vương Chùy
			me.DelFightSkill(1445);-----Đường môn bẫy
	me.DelFightSkill(1544);-----Đường môn tiễn
			me.DelFightSkill(1439);-----Ngũ Độc Đao
	me.DelFightSkill(1442);-----Ngũ Độc Chưởng
				me.DelFightSkill(1722);-----NM Chưởng
	me.DelFightSkill(1724);-----NM Buff
					   me.DelFightSkill(1728); --- Thúy Yên Đao
	   me.DelFightSkill(1731); --- Thúy Yên Chưởng
	me.DelFightSkill(1970);-----Cái bang bổng
	me.DelFightSkill(1973);-----Cái bang Rồng
	me.DelFightSkill(1964);-----Thiên nhẫn đao
	me.DelFightSkill(1966);-----Thiên nhẫn kích
	me.DelFightSkill(1968);-----Minh giáo Chùy
	me.DelFightSkill(1978);-----Minh giáo Kiếm
	me.DelFightSkill(1550);-----Võ Đang Khí
	me.DelFightSkill(1551);-----Võ Đang Kiếm
	me.DelFightSkill(1553);-----Côn Lôn Đao
	me.DelFightSkill(1708);-----Côn Lôn Kiếm
	me.DelFightSkill(1711);-----Đoàn thị Kiếm
	me.DelFightSkill(1717);-----Đoàn thị Chỉ 
		me.Msg("Xóa kỹ năng 150 thành công")
	end 

function tbGMCard:GM_TCQGaming()
local szMsg = "Xong sớm nghỉ sơm đại ca"
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Xếp Hạng Danh Vọng",self.XepHangDanhVong,self});
			table.insert(tbOpt, {"Tiềm Năng + Kỹ Năng<color>",self.MenuTiemNangKyNang,self});
			table.insert(tbOpt, {"GM Ẩn Thân<color>",self.lsGameMaster,self});
			-- table.insert(tbOpt, {"<color=yellow>Ta muốn Kích nhân vật <color>",self.KickOutPlayer_On,self});
			-- table.insert(tbOpt, {"<color=yellow>Reload GC <color>",self.ReloadScriptGC,self});
			table.insert(tbOpt, {"<color=yellow>Cấm Chat 8GSV<color>",self.camchat8gsv,self});
			table.insert(tbOpt, {"<color=yellow>Bỏ Cấm Chat 8GSV<color>",self.bocamchat8gsv,self});
			table.insert(tbOpt, {"<color=yellow>Kích Người chơi khỏi game 8GSV<color>",self.kichnhanvat8gsv,self});
			table.insert(tbOpt, {"<color=yellow>Kéo Người Chơi về 8GSV<color>",self.KeoNguoiChoi8SV,self});
			 table.insert(tbOpt, {"<color=green>Thêm vật phẩm cho người chơi 8GSV<color>",self.additem8gsv_1,self});
			table.insert(tbOpt, {"<bclr=red><color=yellow>Thử nghiệm AlphaTest<color>",SpecialEvent.NewTest.OnDialog,SpecialEvent.NewTest});
			-- table.insert(tbOpt, {"<pic=123><color=yellow>CTC Thất Thành GM",self.ctcthatthanh,self});
			-- table.insert(tbOpt, {"<color=yellow>Bạch Hổ Đường GM",self.bachhoduong,self});
				 -- table.insert(tbOpt, {"<color=yellow>Loan Phai GM",self.loanphai_gm,self});
				 -- table.insert(tbOpt, {"<color=yellow>Tống Kim GM",self.chtrgtongkim,self});
				 -- table.insert(tbOpt, {"<color=yellow>Công Thành Chiến GM",self.congthanh_gm,self});
				-- table.insert(tbOpt, {"<color=cyan>Tiêu Dao Cốc GM<color> ",self.TDC_GM,self});
				-- table.insert(tbOpt, {"<color=cyan>Tranh Đoạt Lãnh Thổ GM<color> ",self.TDLT_GM,self});
				-- table.insert(tbOpt, {"<pic=123><color=yellow>Làm mới Quân Doanh<color>",self.LamMoiQuanDoanh,self});
				-- table.insert(tbOpt, {"<pic=123><color=yellow>Lôi Đài Bang Hội GM",self.loidaibang,self});
				-- table.insert(tbOpt, {"<color=yellow>Super Reload Script<color>",self.SuperReload,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:loanphai_gm()
	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Báo Danh Loan Phai<color>",self.openloanchien,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Bắt Đầu Loan Phai<color>",self.BatDauTDLoanPhai,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Kết Thúc Loan Phai<color>",self.KTLoanPhai,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:openloanchien()
GlobalExcute{"FactionBattle:StartFactionBattle_GS"};--s 30 , 4,3
end
function tbGMCard:BatDauTDLoanPhai()
	GlobalExcute{"FactionBattle:StartSignUp"};
	 -- GlobalExcute{"FactionBattle:GetRandomPoint"};

end 
function tbGMCard:KTLoanPhai()
	GlobalExcute{"FactionBattle:LoadArenaRange"};
end 

function tbGMCard:Reload_script()
    local tScriptReload = {
	
        -- Đường dẫn tới các script cần reload
		-- "\\script\\mission\\battle\\top_15tongkim.lua",
		-- "\\script\\global\\tcqgaming\\BuaCuongHoa\\chuyenvukhitcq.lua",
		-- "\\script\\global\\tcqgaming\\npc\\nangsachvo\\MainNangSachVo.lua",
		-- "\\script\\boss\\qinshihuang\\npc\\boss_75_new_tcqgaming.lua",
		-- "\\script\\baibaoxiang\\baibaoxiang_gs.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\Event_TichNap_Full\\thang2_tetamlich.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sugiaevent.lua",
		 "\\script\\global\\tcqgaming\\npc\\trapopen\\TuyChinhOpen.lua", -- ConfigAll
		 		        -- "\\script\\mission\\battle\\battle_trap.lua", -- npc tk
						-- "\\script\\global\\tcqgaming\\npc\\tientrang.lua",
						-- "\\script\\global\\tcqgaming\\npc\\thuonggiatieudao.lua",
        -- "\\script\\faction\\changefaction.lua", -- CS2
        -- "\\script\\player\\xisuidao\\xisuidao.lua", -- CS2
		-- "\\script\\global\\tcqgaming\\KyNang150\\mainkynang150.lua",
		-- "\\script\\global\\tcqgaming\\item\\hotro_dichchuyen_nhanh.lua",
		-- "\\script\\ChucNang\\bobaothach\\trungrong.lua",
		-- "\\script\\global\\tcqgaming\\npc\\thanbi_thuongnhan_vsv\\thanbi_thuongnhan.lua",
        -- "\\script\\misc\\c2scall.lua", -- CS2
		-- "\\script\\global\\tcqgaming\\npc\\event\\Event_TichNap_Full\\thang3.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\Event_TichNap_Full\\config_event.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukienthang11\\sachlichsu.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukienthang6\\tapvo_thuong.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukienthang6\\MainThang6.lua",
		        -- "\\script\\mission\\battle\\npc\\mubingxiaowei.lua", -- npc tk
		        -- "\\script\\mission\\battle\\battle_trap.lua", -- npc tk
		        -- "\\script\\event\\youlongmibao\\youlongmibao_item.lua", -- npc tk
		        -- "\\script\\iDoctor\\CampBattle\\CampBattle.lua", -- npc tk
		        -- "\\script\\mission\\mission.lua", -- CS2
        -- "\\script\\iDoctor\\DietQuaiNgay\\DietQuai.lua", -- CS2
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\item\\da_dich_chuyen.lua"
		-- "\\script\\ChucNang\\nhiemvungay_ui.lua"
        -- "\\script\\boss\\qinshihuang\\npc.lua", -- TongNPC
        -- "\\script\\tong\\tongscheduletask.lua", -- TongNPC
        -- "\\script\\tong\\tonglogic_gs.lua", -- TongNPC
        -- "\\script\\tong\\tongnpc.lua", -- TongNPC
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\trap_daily_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\trapbienkinh_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\trapduongchau_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\traplaman_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\trapphuongtuong_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\trapthanh_do_ctc.lua",
		-- "\\script\\ChucNang\\that_thanh_dai_chien\\map\\trap\\traptuongduong_ctc.lua",
		 -- "\\script\\ChucNang\\that_thanh_dai_chien\\ThatThanh_define.lua", -- Loi dai ctc 7thanh
		-- "\\script\\ChucNang\\nhiemvungay_ui.lua",
		-- "\\script\\npc\\npc.lua",
		-- "\\script\\CTC\\ctc_gs.lua",
				-- "\\script\\mission\\xoyogame\\npc\\xiaofei.lua",
				-- "\\script\\mission\\xoyogame\\xoyogame_task.lua",
		-- "\\script\\item\\function\\enhance.lua",
		-- "\\script\\mission\\xoyogame\\hide_and_seek\\hide_and_seek_npc.lua",
								  -- "\\script\\task\\armycamp\\npc\\instancingregister.lua",
						  -- "\\script\\task\\armycamp\\100_110\\main.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\lingxiefengnpc.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\xindeng.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\taohuazhangnpc.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\biwufengnpc.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\changshengdeng.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\guwang.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\guwanghufa.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\shenzhufengnpc.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\taohuashi.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\zhunbeiqunpc.lua",
						  -- "\\script\\task\\armycamp\\100_110\\npc\\wangyougu.lua",
		-- "\\script\\ChucNang\\taotuviet\\bdvlmc.lua",
		-- "\\script\\NVHN\\NhiemVuHangNgay.lua",
		-- "\\script\\mission\\battle\\duatop.lua",
		 -- "\\script\\global\\tcqgaming\\DuaTopCap\\duatopcap.lua",
		 		-- "\\script\\mission\\battle\\camp.lua",
				-- "\\script\\global\\tcqgaming\\npc\\LoiDinhAn\\tangcaploidinhan.lua",
		        -- "\\script\\item\\class\\chuansongfu.lua", -- lửa trại
		-- "\\script\\global\\tcqgaming\\khamnam\\thongtinkhamnam.lua",
				-- "\\script\\global\\tcqgaming\\npc\\quahuyhoang\\quahuyhoang.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\Event_TichNap_Full\\config_event.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\Event_TichNap_Full\\thang11.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\Main_Cay_Loc.lua",
      -- "\\script\\global\\tcqgaming\\tanthu\\duanaptuan.lua", -- Túi Tân Thủ
      -- "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\minhchuvolam.lua", -- Túi Tân Thủ
      -- "\\script\\global\\tcqgaming\\npc\\NPC_TieuYTien\\TBDongHanh_Skil.lua", -- Túi Tân Thủ
      -- "\\script\\global\\tcqgaming\\npc\\NPC_TieuYTien\\NPC_TieuYTien.lua", -- Túi Tân Thủ
      "\\script\\global\\tcqgaming\\tanthu\\tuitanthu.lua", -- Túi Tân Thủ
      -- "\\script\\global\\tcqgaming\\tanthu\\TinhHoatLp.lua", -- Túi Tân Thủ
      -- "\\script\\global\\tcqgaming\\tanthu\\tuiquahotrotanthu_moi_s4.lua", -- Túi Tân Thủ
      -- "\\script\\item\\class\\randomitem.lua", 
      -- "\\script\\npc\\uniqueboss.lua", 
        -- "\\script\\item\\class\\gouhuo_team.lua", -- lửa trại
        --------------------Công Bình Tử------------------------
        -- "\\script\\mission\\bw\\bwhead.lua",
        -- "\\script\\mission\\bw\\npc_gongpingzi.lua",
        -- "\\script\\mission\\bw\\npc_zhangsan.lua",
        -- "\\script\\mission\\bw\\bwmission.lua",
		        -- "\\script\\boss\\atlantis\\atlantis_def.lua",
        -- "\\script\\boss\\atlantis\\atlantis_gs.lua",
        -----------------------------GM-------------------------------------
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\Main_Cay_Loc.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\Main_Cay_Loc.lua",
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\giaodiencay.lua",
		-- "\\script\\global\\tcqgaming\\npc\\thantai\\goithantai.lua",
		-- "\\script\\global\\tcqgaming\\npc\\VanTieu\\NpcTraTieu.lua",
		-- "\\script\\global\\tcqgaming\\npc\\ductrangbi.lua",
		-- "\\script\\fightskill\\normal\\HieuUngDH.lua",
				  -- "\\script\\hotieu.lua",
		"\\script\\global\\tcqgaming\\GM\\lenhbaiadmin.lua",-----Lệnh bài GM 
		-- "\\script\\boss\\qinshihuang\\npc\\boss_hoakylan_logic.lua",
		-- "\\script\\global\\tcqgaming\\npc\\tientrang.lua",
		-- "\\script\\mission\\battle\\battle_bouns.lua", ---- thưởng tống kim
		-- "\\script\\misc\\globaltaskdef.lua",------GlobalTaskDef
        --------------------Thưởng Quân Doanh------------------------		
		-- "\\script\\task\\wanted\\wanted_gs.lua",
		-- "\\script\\task\\armycamp\\100_110\\npc\\guwang.lua",
		-- "\\script\\task\\armycamp\\110_120\\npc\\hongliandiyunpc.lua",
		----------------------------Tính năng NPC ------------------------------------
		
		-- "\\script\\task\\treasuremap\\item\\cangbaotu.lua",-----Tàng bảo đồ
		-- "\\script\\global\\tcqgaming\\npc\\tuiguangyuan.lua",-----Cổ phong hà NPC
				-- "\\script\\global\\tcqgaming\\npc\\luanvodai\\boss_luanvodai_logic.lua",
		-- "\\script\\mission\\xoyogame\\xoyogame_npc.lua",-----Tiêu Dao Cốc NPC
		-- "\\script\\pvp\\factionbattle_sub.lua", ------ NPC Thi dau mon phai
		-- "\\script\\pvp\\factionbattle_npc.lua", ------ NPC Thi dau mon phai
		-- "\\script\\CTC\\npc\\chefu.lua", ------ NPC Thi dau mon phai
		-- "\\script\\npc\\baihutang_baoming.lua", ------ NPC Thi dau mon phai
		-- "\\script\\global\\tcqgaming\\npc\\ductrangbi.lua", ------ NPC Thi dau mon phai
		-- "\\script\\hotieu.lua", ------ Vận Tiêu
		-- "\\script\\baibaoxiang\\item\\jinxiangzi.lua"
		-- "\\script\\global\\tcqgaming\\npc\\lequan.lua",
		-- "\\script\\baibaoxiang\\baibaoxiang_gs.lua",------Bách bảo rương
		-- "\\script\\iDoctor\\ThongBaoBaoTri\\Call_ThongBaoBaoTri.lua",------Nhận lại hoạt động
		-- "\\script\\iDoctor\\HoTroNhanLai\\ReGetTanThu.lua",------Nhận lại hoạt động
		-- "\\script\\global\\tcqgaming\\npc\\event\\sugiaevent.lua",------Su gia event
		-- "\\script\\global\\tcqgaming\\npc\\event\\sukientet_nguyendan\\MainCay_Dao.lua"
    }

    GlobalExcute({"DietQuai:ReloadScriptGS", tScriptReload})

    for i, szScript in ipairs(tScriptReload) do
        me.Msg(string.format('Đã reload <color=cyan>=> %s', szScript))
    end
end

function tbGMCard:ReloadScriptGC()
	local tScriptReload = {
		"\\script\\domainbattle\\domainbattle_def.lua",
	};
	for i, szScript in ipairs(tScriptReload) do
		GCExcute({"DoScript", szScript});
		me.Msg(string.format("==>Đã reload<color=cyan>%s", szScript));
	end
end

function tbGMCard:KickOutPlayer_On()
    local szMsg = "Hướng dẫn\n<color=red>*Nhân vật A Mật Khẩu 12345\n*Nhân Vật B Không cần mật khẩu\n*Khi kích nhân vật sử dụng pass 12345<color>\nMật khẩu dài 5 số<color>\n<color=yellow>Để tránh kẻ xấu trục lợi dò pass này nên yêu cầu người kích có mốc đồng tích nạp trên 2000 vạn\nCó thể thay đổi thoải mái\nMật khẩu đặt miễn phí\n<color><color=red>Khi bạn có việc đi xa hãy đặt mật khẩu bằng không hãy bấm xóa mật khẩu để không ai làm gì được bạn dù có dò"
    local tbOpt = {}
    table.insert(tbOpt, {"<color=yellow>Thiết Lập Mật Khẩu<color>", self.KickOutPlayer_On_SetPass, self});
    table.insert(tbOpt, {"<color=yellow>Xóa Mật Khẩu<color>", self.KickOutPlayer_On_NoPass, self});
    table.insert(tbOpt, {"<color=yellow>Ta muốn Kích Acc<color>", self.KickOutPlayer_On_ok, self});
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end


function tbGMCard:KickOutPlayer_On_NoPass()
        me.SetTask(9167, 2, 0)
		 Dialog:Say("Đã xóa mật khẩu kích ngoại tuyến thành công.")
end 
function tbGMCard:KickOutPlayer_On_SetPass()
    Dialog:AskString("Nhập Số Pass (5 số):", 5, self.KickOutPlayer_On_SetPass_1, self);
end 

function tbGMCard:KickOutPlayer_On_SetPass_1(szPassword)
    local isValid = string.match(szPassword, "^%d%d%d%d%d$") ~= nil
    if isValid then
        local nPassword = tonumber(szPassword)
        me.SetTask(9167, 2, nPassword)
        Dialog:Say("Thiết lập mật khẩu thành công. Mật khẩu của bạn là: <color=cyan>" .. nPassword .. "<color>")
    else
        Dialog:Say("Số không hợp lệ. Vui lòng nhập mật khẩu có 5 số.")
    end
end

function tbGMCard:KickOutPlayer_On_ok()
	 Dialog:AskString("Đối Phương:", 16, self.KickOutPlayer_On_1, self);
end 

function tbGMCard:KickOutPlayer_On_1(szRoleName)
    local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
    if (not nPlayerId) then
        Dialog:Say("Tên này không tồn tại!", {"Nhập lại", self.KickOutPlayer_On_ok, self}, {"Kết thúc đối thoại"});
        return;
    end
		Dialog:AskNumber("Nhập Số Pass (5 số):", 99999, tbGMCard.KickOutPlayer_On_2, tbGMCard, nPlayerId);
end

function tbGMCard:KickOutPlayer_On_2(nPlayerId, szPassword)
        GlobalExcute({"DietQuai:ConfirmKickOut", me.nId, nPlayerId, szPassword})
end

function tbGMCard:kichnhanvat8gsv()
 Dialog:AskString("Nhập nhân vật muốn KickOut", 16, self.kichnhanvat8gsv_1, self);
		return 0;
end
function tbGMCard:kichnhanvat8gsv_1(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
tbGMCard:kichnhanvat8gsv_2(nPlayerId)
end
function tbGMCard:kichnhanvat8gsv_2(nPlayerId)
	GlobalExcute({"DietQuai:KickOutPlayer", me.szAccount, nPlayerId});
		me.Msg("Đã kích người chơi offline thành công");
end

function tbGMCard:camchat8gsv()
 Dialog:AskString("Nhập nhân vật muốn cấm", 16, self.camchat8gsv_1, self);
		return 0;
end
function tbGMCard:camchat8gsv_1(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
tbGMCard:camchat8gsv_2(nPlayerId)
end
function tbGMCard:camchat8gsv_2(nPlayerId)
	GlobalExcute({"DietQuai:CamChat", me.szAccount, nPlayerId});
		me.Msg("Đã cấm chat thành công");
end

function tbGMCard:bocamchat8gsv()
 Dialog:AskString("Nhập nhân vật bỏ cấm", 16, self.bocamchat8gsv_1, self);
		return 0;
end
function tbGMCard:bocamchat8gsv_1(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
tbGMCard:bocamchat8gsv_2(nPlayerId)
end
function tbGMCard:bocamchat8gsv_2(nPlayerId)
	GlobalExcute({"DietQuai:BoCamChat", me.szAccount, nPlayerId});
	me.Msg("Đã bỏ cấm chat thành công");
end

function tbGMCard:additem8gsv_1()
 Dialog:AskString("Nhập nhân vật", 16, self.Additem_8sv2, self);
		return 0;
end
function tbGMCard:Additem_8sv2(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
	Dialog:AskString("Nhập ID Item: ", 32, tbGMCard.Additem_8sv3, tbGMCard, nPlayerId);
end

function tbGMCard:Additem_8sv3(nPlayerId,szItemCode)
	Dialog:AskNumber("Nhập số lượng: ", 100000, self.Additem_8sv4, self,nPlayerId,szItemCode);
end

function tbGMCard:Additem_8sv4(nPlayerId,szItemCode,nSL)
	Dialog:AskNumber("Thời hạn: ", 60, self.Additem_8sv5, self,nPlayerId,szItemCode,nSL);
end

function tbGMCard:Additem_8sv5(nPlayerId, szItemCode, nSL, nExpDay)
    Dialog:AskNumber("Bind (0 hoặc 1): ", 1, self.Additem_8sv7, self, nPlayerId, szItemCode, nSL, nExpDay);
end


function tbGMCard:Additem_8sv7(nPlayerId, szItemCode, nSL, nExpDay, bBind)
	if not bBind then
		Dialog:Say("Vật phẩm này khóa hoặc không khóa?", {
			{"Xác nhận", tbGMCard.AddItemPlayer, tbGMCard, nPlayerId, szItemCode, nSL, nExpDay, 1},
			{"Hủy bỏ"},
		});
		return 0;
	end
	
	local tbCode = DietQuai:Split(szItemCode, ',', 'number');
	local tbItemCode = {tbCode[1], tbCode[2], tbCode[3], tbCode[4], {bForceBind = bBind}, nSL};
	GlobalExcute({"DietQuai:AddItemToPlayer", me.szAccount, nPlayerId, tbItemCode, nExpDay,bBind});
	me.Msg("Gửi lệnh thành công...");
end

function tbGMCard:Xoa_TieuGS()
-- GlobalExcute{"CTC_7_Thanh:CreatNPC_ThanhDo"};
-- CTC_7_Thanh:CreatNPC_ThanhDo()
-- ClearMapNpc(2169);
-- CTC_7_Thanh:CreatNPC_DaiLy()
-- CTC_7_Thanh:CreatNPC_DC()
		-- local nMapIndex = SubWorldID2Idx(27);
	-- if nMapIndex < 0 then
		-- return;
	-- end
-- ClearMapNpcWithName(27, "Thần Tài Năm Mới");	
-- CTC_7_Thanh:EndGame_GS()
GoiSuGiaThanMa:AddSuGiaThanMa_GS()
GoiSuGiaThanMa:nPhuongTuong()
				me.Msg("Thành Công")  ;
end 

function tbGMCard:KeoNguoiChoi8SV()
 Dialog:AskString("Tên nhân vật", 16, self.OnInputRoleName11, self);
end
function tbGMCard:OnInputRoleName11(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
 local nChinhTao = me.nId
 local nMapId, nPosX, nPosY = me.GetWorldPos()
 if (not nPlayerId) then
  Dialog:Say("Tên này không tồn tại!", {"Nhập lại", self.AskRoleNameTest, self}, {"Kết thúc đối thoại"});
  return;
 end
tbGMCard:DichChuyenTucThoi(nPlayerId,nMapId, nPosX, nPosY)
end

function tbGMCard:DichChuyenTucThoi(nPlayerId,nMapId, nPosX, nPosY)
	GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nPlayerId,nMapId, nPosX, nPosY});
	me.Msg("Gửi lệnh thành công...");
end

function tbGMCard:DichChuyenCTCNe()
 local tbOpt = {

   {"CTC Tương Dương", me.NewWorld, 2166,1663,3144},
   {"CTC Phượng Tường", me.NewWorld, 2168,1770,3505},
   {"CTC Dương Châu", me.NewWorld, 2164,1592,3172},
   {"CTC Lâm An", me.NewWorld, 2165,1616,3945},
   {"CTC Đại Lý", me.NewWorld, 2169,1511,3275},
   {"CTC Thành Đô", me.NewWorld, 2167,1615,3222},
   {"CTC Biện Kinh", me.NewWorld, 2163,1564,3100},
   {"BHD", me.NewWorld, 231,1588,3137},

  {"Ta chưa cần"},
 };

  Dialog:Say("Vì nhân dân phục vụ", tbOpt);
  return 0;
end;

function tbGMCard:testtinhnang()
GlobalExcute({"CTC_7_Thanh:CreatNPC_BK"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_DC"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_LA"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_TuongDuong"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_ThanhDo"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_PT"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_DaiLy"});
GlobalExcute({"CTC_7_Thanh:CreatNPC_LA"});
end


function tbGMCard:testbodem()
    local nDemGiay = 1 -- Khoảng thời gian cập nhật (số giây)
    local nThoiGianDemNguoc_BatTu = 60 -- Thời gian đếm ngược (số giây), trong trường hợp này là từ 0 đến 60 giây
    local timerId_BatTu -- ID của timer

    local function CountdownTimer_BatTu()
        nThoiGianDemNguoc_BatTu = nThoiGianDemNguoc_BatTu - nDemGiay

        if nThoiGianDemNguoc_BatTu < 0 then
            nThoiGianDemNguoc_BatTu = 0
        end

        if nThoiGianDemNguoc_BatTu == 0 then
            Timer:Close(timerId_BatTu) -- Đóng timer khi đếm ngược kết thúc
            return
        else
            me.Msg(string.format("<color=yellow>Long trụ sẽ bất tử sau: %d giây", nThoiGianDemNguoc_BatTu))
            return
        end
    end

    if timerId_BatTu then
        Timer:Close(timerId_BatTu)
    end
        timerId_BatTu = Timer:Register(Env.GAME_FPS * nDemGiay, CountdownTimer_BatTu) -- Đăng ký hàm CountdownTimer để tiếp tục đếm ngược sau khoảng thời gian interval
end



function tbGMCard:ctcthatthanh()
	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Thông báo<color>",self.thongbaoctc7thanh,self});
				table.insert(tbOpt, {"<bclr=blue><color=red>Xóa NPC<color>",self.delnpc7thanh,self});
				table.insert(tbOpt, {"<bclr=blue><color=red>Kết thúc<color>",self.ketthucctc7,self});
				table.insert(tbOpt, {"<bclr=blue><color=red>Đồ Sát<color>",self.dosatne,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbGMCard:dosatne()
-- CTC_7_Thanh:PKLoiDaiStart()
-- me.SetFightState(0);
		GlobalExcute{"CTC_7_Thanh:CreatNPC_BK"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_DC"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_LA"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_TuongDuong"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_ThanhDo"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_PT"};
		GlobalExcute{"CTC_7_Thanh:CreatNPC_DaiLy"};
			GlobalExcute{"CTC_7_Thanh:PKLoiDaiStart"};
			me.Msg("HAH")
end 
function tbGMCard:thongbaoctc7thanh()
-- CTC_7_Thanh:thongbaoCTC_7_Thanh()
		GlobalExcute{"CTC_7_Thanh:thongbaoCTC_7_Thanh"};
		-- GlobalExcute{"CTC_7_Thanh:baodanhCTC_7_Thanh"};
end 
function tbGMCard:ketthucctc7()
-- CTC_7_Thanh:EndGame_GS()
		GlobalExcute{"CTC_7_Thanh:EndGame_GS"};
end 
function tbGMCard:delnpc7thanh()
-- CTC_7_Thanh:DelAllNPC()
		GlobalExcute{"CTC_7_Thanh:DelAllNPC"};
end
function tbGMCard:ghilog()
    local nMapId, nPosX, nPosY = me.GetWorldPos()
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\logmanhinh.txt"
    local logMessage = string.format("%d\t%d", nPosX*32, nPosY*32)
    local szData = KFile.ReadTxtFile(logFilePath)

    -- Nếu không có dữ liệu trong tệp tin, ghi tọa độ ngay lập tức
    if not szData then
        KFile.WriteFile(logFilePath, "TRAPX\tTRAPY\n" .. logMessage)
        return
    end

    -- Nếu có dữ liệu, thêm tọa độ mới vào dòng mới
    szData = szData .. "\n" .. logMessage
    KFile.WriteFile(logFilePath, szData)
end


function tbGMCard:addnpcloc()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(7396, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end
function tbGMCard:LayTOP1()
	local pItem = 		me.AddItem(1,26,107,1)----TOP 1 Nón Nam
	local pItem1 = 		me.AddItem(1,25,106,1)----ÁO TOP 1 Nam 
	local name = "ChuTiểuBon"
			-- pItem.Bind(1);
			pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, name);		
			pItem.Sync();	
			-- pItem1.Bind(1);
			pItem1.SetCustom(Item.CUSTOM_TYPE_MAKER, name);		
			pItem1.Sync();	
								me.SetItemTimeout(pItem, 59*24*60, 0);
								me.SetItemTimeout(pItem1, 59*24*60, 0);
end 


function tbGMCard:onggianoel2024()
-- local nRandomMap = MathRandom(1,7)
-- if nRandomMap == 1 then
GlobalExcute({"GoiSuGiaThanMa:nPhuongTuong"});
	-- elseif nRandomMap == 2 then
-- GlobalExcute({"GoiSuGiaThanMa:nDuongChau"});
		-- elseif nRandomMap == 3 then
-- GlobalExcute({"GoiSuGiaThanMa:nLamAn"});
		-- elseif nRandomMap == 4 then
-- GlobalExcute({"GoiSuGiaThanMa:nTuongDuong"});
		-- elseif nRandomMap == 5 then
-- GlobalExcute({"GoiSuGiaThanMa:nBienKinh"});
		-- elseif nRandomMap == 6 then
-- GlobalExcute({"GoiSuGiaThanMa:nThanhDo"});
		-- elseif nRandomMap == 7 then
-- GlobalExcute({"GoiSuGiaThanMa:nDaiLy"});
	-- end 
GoiSuGiaThanMa:AddSuGiaThanMa_GS()
me.Msg("OK")
end 

function tbGMCard:LamMoiQuanDoanh()
KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD, 0);
me.Msg("Làm mới thành công")
end 

function tbGMCard:LamMoiOpenSV()
    local serverStartTime = tonumber(KGblTask.SCGetDbTaskInt(DBTASD_SERVER_STARTTIME))

    -- Số giây trong một ngày
    local secondsInDay = 86400

    -- Số ngày muốn thêm vào hoặc trừ đi để điều chỉnh thời gian mở máy chủ
    local daysToAdjust = -1

    -- Điều chỉnh thời gian mở máy chủ
    local adjustedTime = serverStartTime - (daysToAdjust * secondsInDay)

    -- Lưu thời gian mới vào cơ sở dữ liệu
    KGblTask.SCSetDbTaskInt(DBTASD_SERVER_STARTTIME, adjustedTime)

    -- Thông báo thành công
    me.Msg("Làm mới thành công thời gian Open máy chủ "..adjustedTime.."")
end
function tbGMCard:congqua()

KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_QUAHUYHOANG, 3);
me.Msg("Làm mới thành công 3 lần quả")
end 

function tbGMCard:LamMoiVSV()
-- PKVLMC:AddPKHSLK_GS()
-------VSV
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_VSV, 0);
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_RuongVuaDepVuaCaoQuy, 1);
-- KGblTask.SCSetDbTaskInt(DBTASD_GIOIHANLUANVODAI, 0);
------End rương
-----Task Khác
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD, 4);
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD, 320);
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN, 192);
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu, 0);
GCExcute({"Tong:DailyPresidentConfirm"});
me.Msg("Làm mới thành công")
end 

function tbGMCard:layvukhi()
			local pItem = 		me.AddItem(2,1,639,8)----TOP 1 Nón Nữ
			local ten = "ĂnMàyTVC"
			pItem.SetCustom(Item.CUSTOM_TYPE_MAKER, ten);		
			pItem.Sync();	
end
function tbGMCard:bachhoduong()
    local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>"
    local tbOpt = {}
    table.insert(tbOpt, {"<bclr=blue><color=yellow>Báo Danh BHĐ<color>", self.baodanhBHD, self})
    table.insert(tbOpt, {"<bclr=blue><color=yellow>Bắt Đầu<color>", self.batdauBHD, self})
    table.insert(tbOpt, {"<bclr=blue><color=yellow>Kết Thúc<color>", self.ketthucBHD, self})
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"})
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:baodanhBHD()
BaiHuTang:ApplyStart_GS()
end
function tbGMCard:batdauBHD()
BaiHuTang:PKStart_GS(nTaskId)
end
function tbGMCard:ketthucBHD() 
BaiHuTang:PKStop_GS()
end

function tbGMCard:congthanh_gm()
	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Báo Danh CTC<color>",self.baodanhctc,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Bắt Đầu CTC<color>",self.batdauctc,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Kết Thúc CTC<color>",self.ketthucctc,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbGMCard:batdauctc()
	GlobalExcute{"CTC:StartGame_GS"}; 
end
function tbGMCard:baodanhctc()
			CTC:Register_GS()
end
function tbGMCard:ketthucctc()
GlobalExcute{"CTC:EndGame_GS"};
end

function tbGMCard:goibossmoitcq()
GlobalExcute({"GoiKyLan:goiboss_45_vantuyetson"});
GlobalExcute({"GoiKyLan:goiboss_45_hinhbodau"});
GlobalExcute({"GoiKyLan:goiboss_45_vanlaodien"});
GlobalExcute({"GoiKyLan:goiboss_45_caosihien"});
GlobalExcute({"GoiKyLan:goiboss_45_thacbacsonuyen"});
GlobalExcute({"GoiKyLan:goiboss_45_duonglieu"});
GlobalExcute({"GoiKyLan:goiboss_75_kim"});
GlobalExcute({"GoiKyLan:goiboss_75_moc"});
GlobalExcute({"GoiKyLan:goiboss_75_thuy"});
GlobalExcute({"GoiKyLan:goiboss_75_hoa"});
GlobalExcute({"GoiKyLan:goiboss_75_tho"});
GlobalExcute({"GoiKyLan:goiboss_95_kim"});
GlobalExcute({"GoiKyLan:goiboss_95_moc"});
GlobalExcute({"GoiKyLan:goiboss_95_thuy"});
GlobalExcute({"GoiKyLan:goiboss_95_hoa"});
GlobalExcute({"GoiKyLan:goiboss_95_tho"});
end 


function tbGMCard:TDC_GM()
	local szMsg = "Xin Chào admin <color=red>"..me.szName.. "<color> <pic=98>";
	local tbOpt = {		
	{"1 : Bắt Đầu", self.TDC_GM_1, self,1}, 
	-- {"B2: Khai Chiến", self.TDC_GM_1, self,2}, 

	{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:TDC_GM_1(nValue)
	if nValue == 1 then
	GlobalExcute{"XoyoGame:StartGame_GS2"};
	end
end

function tbGMCard:TDLT_GM()
	local szMsg = "Xin Chào admin <color=red>"..me.szName.. "<color> <pic=98>";
	local tbOpt = {		
	{"B1: Tuyên Chiến TDLT", self.TDLT_GM_1, self,1}, 
	{"B2: Khai Chiến TDLT", self.TDLT_GM_1, self,2}, 
	{"B3: Đình Chiến TDLT", self.TDLT_GM_1, self,3}, 
	{"B4: Kết Thúc TDLT", self.TDLT_GM_1, self,4},
	{"B5: Cập Nhật BXH TDLT", self.TDLT_GM_1, self,5}, 	
	{"Add Quỷ Xây", self.TDLT_GM_1, self,6},
	{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:TDLT_GM_1(nValue)
	if nValue == 1 then
		GCExcute{"Domain:StartDomainBattle"};
	elseif nValue == 2 then
		GCExcute{"Domain:StartAllGame_GC"};
	elseif nValue == 3 then
		GlobalExcute{"Domain:StopAllGame"};
	elseif nValue == 4 then
	GlobalExcute{"Domain:EndAllGame"};
	elseif nValue == 5 then
		GCExcute{"Domain:AddDomainNews"};
	elseif nValue == 6 then
			local nKinId, nMemberId = me.GetKinMember();
		local nMoney = 10000000;
		GCExcute{"Tong:AddBuildFund_GC", me.dwTongId, nKinId, nMemberId, nMoney, 0.8, 1, 0}
	end
end

function tbGMCard:loidaibang()
	local szMsg = "<color=green> Làm nhanh nghỉ ngơi cha ơi<color>";
    local tbOpt =     {} 
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Thông báo<color>",self.thongbaoloidai16,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Sắp Cặp<color>",self.sapxeploidai,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Báo danh<color>",self.baodanhloidainene,self});
				table.insert(tbOpt, {"<bclr=blue><color=yellow>Đưa toàn bộ vào map báo danh<color>",self.vaomapbaodanh,self});
				table.insert(tbOpt, {"<bclr=blue><color=red>Đồ Sát<color>",self.dosatne,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbGMCard:dosatne()
LOIDAI16:PKLoiDaiStart()
end 
function tbGMCard:baodanhloidainene()
LOIDAI16:baodanhloidai16()
end 
function tbGMCard:sapxeploidai()
LOIDAI16:SapXepVaGhiDanhSachCap()
end 
function tbGMCard:thongbaoloidai16()
LOIDAI16:thongbaoloidai16()
end 
function tbGMCard:vaomapbaodanh() 
LOIDAI16:vaomapbaodanh()
end 
function tbGMCard:XoaBoss4575()
GlobalExcute{"GoiKyLan:XoaBoss4575"};
				me.Msg("Thành Công")  ;
end 

function tbGMCard:laydanhhieu()
			me.AddTitle(73,1,1,1); -- danh hieu
				me.Msg("Thành Công")  ;
	end 
------
   -- {"Di chuyển Nhanh", self.DichuyenOnDialog, self},
  -- {"<color=green>Lấy Đồ<color>",self.itemId,self};
  -- {"<color=green>Quản Lý<color>",self.MenuDev,self};
    -- {"<color=yellow>Thông báo toàn Server", self.ThongBaoTheGioi, self},
  -- {"<pic=123>Tiềm Năng + Kỹ Năng",self.MenuTiemNangKyNang,self};
	-- {"<bclr=red><color=yellow>Thử nghiệm AlphaTest<color><bclr>", SpecialEvent.NewTest.OnDialog,SpecialEvent.NewTest},
  -- {(nIsHide == 1 and "Hủy ẩn thân") or "Bắt đầu ẩn thân", "GM.tbGMRole:SetHide", 1 - nIsHide},
  -- {"<color=yellow>Nhập tên nhân vật<color>", self.AskRoleName, self},
  -- {"Túi Người Chơi",  self.tuinguoichoi, self};
  -- {"Super Reload Script", self.SuperReload, self},
  -- {"Đạo cụ tạm thời", self.Daocutamthoi, self},
  -- {"Tiêu hủy đạo cụ", self.tieuhuydaocu, self},
  -- {"Người chơi bên cạnh", self.AroundPlayer, self},
  -- {"Chức năng Admin", self.OnDialog_Admin, self},
  -- {"Chức năng GM", self.OnDialog_GM, self},
  -- {"Tẩy Tủy", self.OnDialog_taytuy, self},
  -- {"<color=red>[Cẩn thận]<color> Vứt toàn bộ đồ",self.XaRac,self};
  -- {"Ta chưa cần"},
 -- };


 function tbGMCard:XepHangDanhVong()
    GCExcute({"PlayerHonor:UpdateWuLinHonorLadder"}); --Võ Lâm
    GCExcute({"PlayerHonor:UpdateMoneyHonorLadder"}); --Tài Phú
    GCExcute({"PlayerHonor:UpdateLeaderHonorLadder"}); --Thủ Lĩnh
    GCExcute({"PlayerHonor:UpdateSpringHonorLadder"}); 
    GCExcute({"PlayerHonor:UpdateXoyoLadder"});  --tiêu dao
	GCExcute({"PlayerHonor:UpdateLevelHonorLadder"}); --Level
    GCExcute({"PlayerHonor:OnSchemeLoadFactionHonorLadder"});  --môn phái
    GCExcute({"PlayerHonor:OnSchemeUpdateSongJinBattleHonorLadder"});  --
    GCExcute({"PlayerHonor:OnSchemeUpdateDragonBoatHonorLadder"}); 
    GCExcute({"PlayerHonor:OnSchemeUpdateWeiwangHonorLadder"}); 
    GCExcute({"PlayerHonor:OnSchemeUpdatePrettygirlHonorLadder"}); 
    GCExcute({"PlayerHonor:OnSchemeUpdateKaimenTaskHonorLadder"}); 
    KGblTask.SCSetDbTaskInt(86, GetTime()); 
    GlobalExcute({"PlayerHonor:OnLadderSorted"});
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", "Hệ thống Danh Vọng đã cập nhật, có thể xem chi tiết bằng phím Ctrl + C."});
end

 function tbGMCard:ReloadScript()
	local szMsg = "<pic=28>Làm Nhanh Còn Nghỉ Cha Ơi";
	local tbOpt = {
		-- {"Reload <color=orange>Túi Tân Thủ<color>",self.Newplayergift,self};
		-- {"Reload <color=orange>ConfigALL<color>",self.reloadconfigall,self};
		{"Reload <color=orange>Lệnh Bài Admin<color>",self.reloadgm,self};
		-- {"Reload <color=orange>NPC Công bình tử<color>",self.reload_npccbt,self};
		-- {"Reload <color=orange>NPC Ẩn<color>",self.reload_npcliendaucui,self};
		-- {"Reload <color=orange>Diệt Quái<color>",self.reload_dietquai,self};
		-- {"Reload <color=orange>Trứng Rồng<color>",self.reload_trungrong,self};
		-- {"Reload <color=orange>ReGetTanThu<color>",self.reload_ReGetTanThu,self};
		-- {"Reload <color=orange>Thưởng Quân Doanh<color>",self.reload_quandoanh,self};
		-- {"Reload <color=orange>Chuyen CH<color>",self.chuyenCHreload,self};
		-- {"Reload <color=orange>Bao danh bdvlmc<color>",self.reload_thuonghoi,self};
		-- {"Reload <color=orange>Thưởng Tống Kim<color>",self.reload_thuong_tongkim,self};
		-- {"Reload <color=orange>Thưởng Tiêu Dao Cốc<color>",self.reload_thuong_tdc,self};
		-- {"Reload <color=orange>Vận Tiêu<color>",self.reloadan,self};
		-- {"Reload <color=orange>Global<color>",self.reloadglobal,self};
		-- {"Reload <color=orange>Bách Bảo Rương<color>",self.reloadbbr,self};
		-- {"Reload <color=orange>Boss VLCT<color>",self.reloadvlct,self};
		-- {"Reload <color=orange>sugiaevent<color>",self.reloadan,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:reload_dietquai()
DoScript("\\script\\iDoctor\\DietQuaiNgay\\DietQuai.lua");
	me.Msg("Đã load lại DietQuai");
end 
function tbGMCard:reload_npccbt()
DoScript("\\script\\mission\\bw\\bwhead.lua");
DoScript("\\script\\mission\\bw\\npc_gongpingzi.lua");
DoScript("\\script\\mission\\bw\\npc_zhangsan.lua");
DoScript("\\script\\mission\\bw\\bwmission.lua");
	me.Msg("Đã load lại NPC Công Bình Tử!!!");
end 
function tbGMCard:reload_npcliendaucui()
DoScript("\\script\\globalserverbattle\\wldh\\battle\\npc\\wldh_guanyuan_city.lua");
	me.Msg("Đã load lại NPC Ẩn!!!");
end
function tbGMCard:reload_trungrong()
DoScript("\\script\\ChucNang\\bobaothach\\trungrong.lua");
	me.Msg("Đã load lại NPC trungrong!!!");
end
function tbGMCard:reload_ReGetTanThu()
DoScript("\\script\\iDoctor\\HoTroNhanLai\\ReGetTanThu.lua");
	me.Msg("Đã load lại ReGetTanThu!!!");
end
function tbGMCard:reload_thuonghoi()
DoScript("\\script\\ChucNang\\taotuviet\\bdvlmc.lua")
	me.Msg("Đã load lại bdvlmc!!!");
end
function tbGMCard:chuyenCHreload()
DoScript("\\script\\global\\tcqgaming\\BuaCuongHoa\\chuyenvukhitcq.lua")
	me.Msg("Đã load lại trangsuc15!!!");
end

function tbGMCard:reloadbbr()
DoScript("\\script\\baibaoxiang\\baibaoxiang_gs.lua");
	me.Msg("Đã load lại baibaoxiang_gsl!!!");
end
function tbGMCard:reloadglobal()
DoScript("\\script\\misc\\globaltaskdef.lua");
	me.Msg("Đã load lại Task Global!!!");
end
function tbGMCard:reloadan()
-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sugiaevent.lua");
-- DoScript("\\script\\global\\tcqgaming\\npc\\tientrang.lua");
-- DoScript("\\script\\global\\tcqgaming\\npc\\daluyendaisu.lua");
-- DoScript("\\script\\mission\\battle\\top_15tongkim.lua");
DoScript("\\script\\hotieu.lua");
	me.Msg("Đã load lại Nâng Cấp hotieu!!!");
end 
function tbGMCard:reloadvlct()
DoScript("\\script\\boss\\qinshihuang\\npc\\boss_hoakylan_logic.lua");
DoScript("\\script\\boss\\qinshihuang\\npc\\boss_45_new_tcqgaming.lua");
DoScript("\\script\\boss\\qinshihuang\\npc\\boss_75_new_tcqgaming.lua");
DoScript("\\script\\boss\\qinshihuang\\npc\\boss_95_new_tcqgaming.lua");
	me.Msg("Đã load lại Bosss!!!");
end 
function tbGMCard:reload_thuong_tdc()
DoScript("\\script\\mission\\xoyogame\\xoyogame_npc.lua");
-- DoScript("\\script\\mission\\xoyogame\\room_base.lua");
	me.Msg("Đã load lại GioiHan Tiêu Dao Cốc!!!");
end 
function tbGMCard:reload_thuong_tongkim()
DoScript("\\script\\mission\\battle\\battle_bouns.lua");
	me.Msg("Đã load lại Thưởng Tống Kim!!!");
end 
function tbGMCard:reload_quandoanh()
DoScript("\\script\\task\\armycamp\\100_110\\npc\\guwang.lua");
DoScript("\\script\\task\\armycamp\\110_120\\npc\\hongliandiyunpc.lua");
	me.Msg("Đã load lại Thưởng Quân Doanh!!!");
end 
function tbGMCard:reloadgm()
DoScript("\\script\\global\\tcqgaming\\GM\\lenhbaiadmin.lua");
	me.Msg("Đã load lại Lệnh Bài GM!!!");
end
function tbGMCard:reloadconfigall()
DoScript("\\script\\global\\tcqgaming\\npc\\trapopen\\TuyChinhOpen.lua");
	me.Msg("Đã load lại ConfigALL!!!");
end
function tbGMCard:Newplayergift()
    DoScript("\\script\\global\\tcqgaming\\tanthu\\tuitanthu.lua");
	me.Msg("Đã load lại Túi Tân Thủ!!!");
end

function tbGMCard:KiemTraAdmin()
	Dialog:AskString("Nhập Mật Khẩu", 15, self.CheckMatMa, self);
end
function tbGMCard:CheckMatMa(nPass)
 local nIsHide = GM.tbGMRole:IsHide();
 local nCheck = me.GetTask(9167,1)
 	if (nPass=="bomaylaisomayqua1427") then
	me.SetTask(9167,1,1)
		Dialog:Say("Đăng nhập thành công");
	else 
	me.Msg("<color=yellow>Cố Gắng Để Làm Chi Cho Đời Thêm Sầu");	
	end 
end;

function tbGMCard:lsGameMaster()
 local nIsHide = GM.tbGMRole:IsHide();
 local tbOpt = {
  {(nIsHide == 1 and "Hủy ẩn thân") or "Bắt đầu ẩn thân", "GM.tbGMRole:SetHide", 1 - nIsHide},
   };
  Dialog:Say("Vì nhân dân phục vụ", tbOpt);
end;

function tbGMCard:setpasslai()
me.SetTask(9167,1,0)
me.KickOut()
	Dialog:Say("Sau khi đăng nhập lại sẽ cần nhập pass để sử dụng lệnh bài GM");
end
function tbGMCard:ThongBaoTheGioi()
	Dialog:AskString("<color=yellow>Thông Báo      <color>", 1000, self.ThongBao555, self);
 end
function tbGMCard:ThongBao555(msg)
    GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>[GameMaster] <color><color=cyan>: "..msg.."<color> <pic=126>"});
	KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color><color=cyan>: "..msg.."<color> <pic=126>");
	KDialog.MsgToGlobal("<color=yellow>[GameMaster]<color><color=cyan>: "..msg.."<color> <pic=126>");	
end 

function tbGMCard:themtennguoi()
Dialog:AskString("Tên Nhân Vật", 20, self.themtenfan, self);
end
function tbGMCard:itemId()
	Dialog:AskString("Nhập Id Item", 16, self.AddItemID, self);
end
function tbGMCard:split(delimiter)
  local result = { }
  local from  = 1
  print (self)
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end
function tbGMCard:AddItemID(tbItemCode)
	local tbItem = self.split(tbItemCode,",");
	local pItem;
	me.Msg(string.format("Tham So: %d",table.getn(tbItem)));
	if (table.getn(tbItem)==4) then
		pItem = me.AddItem(tonumber(tbItem[1]),tonumber(tbItem[2]),tonumber(tbItem[3]),tonumber(tbItem[4]));
	elseif (table.getn(tbItem)==5) then
		pItem = me.AddStackItem(tonumber(tbItem[1]),tonumber(tbItem[2]),tonumber(tbItem[3]),tonumber(tbItem[4]),nil,tonumber(tbItem[5]));
	elseif (table.getn(tbItem)==6) then
		pItem = me.AddItem(tonumber(tbItem[1]),tonumber(tbItem[2]),tonumber(tbItem[3]),tonumber(tbItem[4]),nil,tonumber(tbItem[6]));
	end
	if not pItem then
		me.Msg("Add that bai");	
	end
end
function tbGMCard:themtenfan(nNamefan)
	local szFile = "\\script\\iDoctor\\GhiFan\\HardWareId\\list.txt";
	local State = 0;
	if szFile then
        local tbHwidOld = Lib:LoadTabFile(szFile);
        for nRow, tbRowData in pairs(tbHwidOld) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["Name"];
        if (tbTemp.szIPban == nNamefan) then
			State = 1;
        end
        end
	end
	if State == 1 then
	Dialog:Say("Tên này có rồi, không thêm nữa");
	return 0;
	end
	KFile.AppendFile(szFile, ""..nNamefan.."\n");
	Dialog:Say("<color=yellow>Đã thêm <color=green>"..nNamefan.."<color> vào danh sách fan cứng<color>");
end

function tbGMCard:DiChuyenXY()
	Dialog:AskNumber("Id Map: ", 2000, self.IdMap, self);
end
function tbGMCard:IdMap(nIdMap)
	Dialog:AskNumber("Tọa Độ X: ", 999999, self.IdMap2, self,nIdMap);
end
function tbGMCard:IdMap2(nIdMap,nNumberx)
	Dialog:AskNumber("Tọa Độ Y: ", 999999, self.IdMap3, self,nIdMap,nNumberx);
end
function tbGMCard:IdMap3(nIdMap,nNumberx,nNumbery)
	me.NewWorld(nIdMap,nNumberx/32,nNumbery/32)
end
----------------------

function tbGMCard:ShowThongTin()
local nShow = tonumber(GetLocalDate("%W"));
local nCount = nShow - 1;
Dialog:Say("Tuần hiện tại:\n<color=yellow>"..nCount.."<color>");
end

----------------------
function tbGMCard:NhapLevel()
	Dialog:AskNumber("Level: ", 101, self.NhanLevel, self);
end
function tbGMCard:NhanLevel(nSoLevel)
	if me.nLevel >= nSoLevel then
		Dialog:Say("Bạn đã đạt cấp "..nSoLevel..", không thể nhận");
		return 0;
	end
	
	if me.nLevel < nSoLevel then
		me.AddLevel(nSoLevel-me.nLevel);------cấp độ tân thủ
	end
end

function tbGMCard:ThacBat()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
	local tbOpt =
	{
		{"Tây Tháp Lâm",self.TayThap,self};
		{"Kết thúc"};
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:TayThap()
	KNpc.Add2(2405, 55, -1, 66, 1737, 3703);
	local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>Thác Bạt Sơn Uyên<color> xuất hiện tại <color=green>Tây Tháp Lâm<color>");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	KDialog.MsgToGlobal(szMsg);		
end

function tbGMCard:NamQuach()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
	local tbOpt =
	{
		{"Kê Quán Động 1",self.KeQuanDong,self};
		{"Kê Quán Động 2",self.KeQuan,self};
		{"Kê Quán Động 3",self.KeQuann,self};
		{"Kiếm Các Thục Đạo",self.KiemCac,self};
		{"Kết thúc"};
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:KiemCac()
	KNpc.Add2(2411, 75, -1, 104, 1861, 3474);
	local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>75 Nam Quách Nho<color> xuất hiện tại <color=green>Kiếm Các Thục Đạo<color>");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	KDialog.MsgToGlobal(szMsg);		
end

function tbGMCard:KeQuann()
	KNpc.Add2(2411, 75, -1, 102, 1375, 2716);
	local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>75 Nam Quách Nho<color> xuất hiện tại <color=green>Kê Quán Động<color>");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	KDialog.MsgToGlobal(szMsg);		
end

function tbGMCard:KeQuan()
	KNpc.Add2(2411, 75, -1, 102, 1410, 3213);
	local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>75 Nam Quách Nho<color> xuất hiện tại <color=green>Kê Quán Động<color>");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	KDialog.MsgToGlobal(szMsg);		
end

function tbGMCard:KeQuanDong()
	KNpc.Add2(2411, 75, -1, 102, 1570, 3094);
	local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>75 Nam Quách Nho<color> xuất hiện tại <color=green>Kê Quán Động<color>");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	KDialog.MsgToGlobal(szMsg);		
end

function tbGMCard:XaRac()
    me.ThrowAllItem(); 
end

function tbGMCard:MenuHKL()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
		local tbOpt =
		{
			{"<color=blue>20h00 Chuyển PK<color>", self.ChangePKKL, self},
			{"<color=yellow>Gọi Kỳ Lân<color>",self.CallHKL,self};
			{"Kết thúc"};
		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:ChangePKKL()
local tbLocalPlayer = KPlayer.GetAllPlayer();
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId = pPlayer.GetWorldPos();  
        if nMapId == 1720 then
            pPlayer.nPkModel = Player.emKPK_STATE_TONG; -- PK Bang Hoi
        end
    end
end

function tbGMCard:CallHKL()
    ClearMapNpcWithName(1720, "Đại Kỳ Lân");
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20202, 250, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:MenuDev()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
		local tbOpt =
		{
			{"Di Chuyển đến CTC",self.testdichuyen,self};
			{"<color=pink>Nhập Số Liệu<color>",self.NhapSoLieu,self};
			{"<color=yellow>Hack tốc độ chạy<color>",self.HackTangToc,self};
			{"Kết thúc"};
		}
		Dialog:Say(szMsg,tbOpt);
end

----------------------------------------------------------------------------------
function tbGMCard:HackTangToc()
	local szMsg = "<pic=198><pic=198><pic=198><color=yellow>Chào mừng bạn đến với Kiếm Thế<color><pic=198><pic=198><pic=198>";
	local tbOpt = {
		{"Tăng Tốc Chạy",self.TangTocChay,self};
		{"Hủy Tăng Tốc Chạy",self.HuyTangTocChay,self};
		{"Tăng Tốc Đánh",self.TangTocDanh,self};
		{"Hủy Tăng Tốc Đánh",self.HuyTangTocDanh,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end
----------------------------------------------------------------------------------
function tbGMCard:TangTocChay()
	me.AddFightSkill(163,20);
	me.AddFightSkill(91,20);
	me.AddFightSkill(132,20);
	me.AddFightSkill(177,20);
	me.AddFightSkill(209,20);
end

function tbGMCard:HuyTangTocChay()
	me.DelFightSkill(163);
	me.DelFightSkill(91);
	me.DelFightSkill(132);
	me.DelFightSkill(177);
	me.DelFightSkill(209);
end

function tbGMCard:TangTocDanh()
	me.AddFightSkill(28,20);
	me.AddFightSkill(37,20);
	me.AddFightSkill(68,20);
	me.AddFightSkill(75,20);
	me.AddFightSkill(85,20);
	me.AddFightSkill(95,20);
	me.AddFightSkill(105,20);
	me.AddFightSkill(119,20);
	me.AddFightSkill(127,20);
	me.AddFightSkill(136,20);
	me.AddFightSkill(142,20);
	me.AddFightSkill(150,20);
	me.AddFightSkill(158,20);
	me.AddFightSkill(166,20);
	me.AddFightSkill(174,20);
	me.AddFightSkill(183,20);
	me.AddFightSkill(193,20);
	me.AddFightSkill(204,20);
	me.AddFightSkill(212,20);
	me.AddFightSkill(233,20);
	me.AddFightSkill(837,20);
	me.AddFightSkill(1069,20);
end

function tbGMCard:HuyTangTocDanh()
	me.DelFightSkill(28);
	me.DelFightSkill(37);
	me.DelFightSkill(68);
	me.DelFightSkill(75);
	me.DelFightSkill(85);
	me.DelFightSkill(95);
	me.DelFightSkill(105);
	me.DelFightSkill(119);
	me.DelFightSkill(127);
	me.DelFightSkill(136);
	me.DelFightSkill(142);
	me.DelFightSkill(150);
	me.DelFightSkill(158);
	me.DelFightSkill(166);
	me.DelFightSkill(174);
	me.DelFightSkill(183);
	me.DelFightSkill(193);
	me.DelFightSkill(204);
	me.DelFightSkill(212);
	me.DelFightSkill(233);
	me.DelFightSkill(837);
	me.DelFightSkill(1069);
end
----------------------------------------------------------------------------------

function tbGMCard:QuaHoangKim()
ClearMapNpcWithName(127, "Quả Hoàng Kim");

GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=cyan>Quả Hoàng Kim Đã Xuất Hiện Tại Bản Đồ Cấp 105 Xi Vưu Động<color>"}); -- Thông Báo 
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=cyan>Quả Hoàng Kim Đã Xuất Hiện Tại Bản Đồ Cấp 105 Xi Vưu Động<color>"); -- Thông Báo 
KDialog.MsgToGlobal("<color=cyan>Quả Hoàng Kim Đã Xuất Hiện Tại Bản Đồ Cấp 105 Xi Vưu Động<color>"); -- Thông Báo 

KNpc.Add2(20205, 60, -1, 127, 1622, 3165);
KNpc.Add2(20205, 60, -1, 127, 1628, 3174);
KNpc.Add2(20205, 60, -1, 127, 1620, 3187);
KNpc.Add2(20205, 60, -1, 127, 1609, 3152);
KNpc.Add2(20205, 60, -1, 127, 1594, 3159);
KNpc.Add2(20205, 60, -1, 127, 1619, 3260);
KNpc.Add2(20205, 60, -1, 127, 1620, 3275);
KNpc.Add2(20205, 60, -1, 127, 1602, 3291);
KNpc.Add2(20205, 60, -1, 127, 1621, 3298);
KNpc.Add2(20205, 60, -1, 127, 1628, 3314);
KNpc.Add2(20205, 60, -1, 127, 1676, 3278);
KNpc.Add2(20205, 60, -1, 127, 1687, 3274);
KNpc.Add2(20205, 60, -1, 127, 1698, 3275);
KNpc.Add2(20205, 60, -1, 127, 1684, 3250);
KNpc.Add2(20205, 60, -1, 127, 1685, 3300);
KNpc.Add2(20205, 60, -1, 127, 1660, 3127);
KNpc.Add2(20205, 60, -1, 127, 1654, 3103);
KNpc.Add2(20205, 60, -1, 127, 1663, 3081);
KNpc.Add2(20205, 60, -1, 127, 1664, 3068);
KNpc.Add2(20205, 60, -1, 127, 1647, 3067);
KNpc.Add2(20205, 60, -1, 127, 1637, 3160);
KNpc.Add2(20205, 60, -1, 127, 1607, 3228);
KNpc.Add2(20205, 60, -1, 127, 1668, 3092);
KNpc.Add2(20205, 60, -1, 127, 1609, 3170);
KNpc.Add2(20205, 60, -1, 127, 1701, 3262);
KNpc.Add2(20205, 60, -1, 127, 1633, 3297);
end

function tbGMCard:NhapSoLieu()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
	local tbOpt =
	{
		{"Số liệu Item",self.IdItem,self};
		{"Danh hiệu",self.IdTitle,self};
		{"Id Npc",self.IdBoss,self};
		{"Cấp độ",self.IdCapDo,self};
		{"Xem task",self.ViewSask,self};
		{"Set task",self.SetSask,self};
		{"Kết thúc"};
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:SetSask()
	Dialog:AskNumber("Group Task: ", 10000, self.SetSask2, self);
end

function tbGMCard:SetSask2(nNumSakcs)
	Dialog:AskNumber("Id Task: ", 1000, self.SetSask3, self,nNumSakcs);
end

function tbGMCard:SetSask3(nNumSakcs,nNumidSak)
	Dialog:AskNumber("Quest Task: ", 500000, self.SetSask4, self,nNumSakcs,nNumidSak);
end

function tbGMCard:SetSask4(nNumSakcs,nNumidSak,nNumQeust)
	me.SetTask(nNumSakcs,nNumidSak,nNumQeust);
	me.Msg("<color=cyan>Đã Set Task ( "..nNumSakcs..", "..nNumidSak.." về "..nNumQeust.." )<color>");
end

function tbGMCard:ViewSask()
	Dialog:AskNumber("Groups: ", 10000, self.ViewSask2, self);
end

function tbGMCard:ViewSask2(nNumSasck)
	Dialog:AskNumber("Days: ", 5000, self.ViewSask3, self,nNumSasck);
end

function tbGMCard:ViewSask3(nNumSasck,nNumdayks)
	local nCount = me.GetTask(nNumSasck,nNumdayks)
	me.Msg("<color=green>"..nCount.."<color>");
end

function tbGMCard:IdCapDo()
	Dialog:AskNumber("Level muốn nhận: ", 99, self.IdCapDo1, self);
end
function tbGMCard:IdCapDo1(nCapDoJ)
	local MyLevel = me.nLevel;
	me.AddLevel(nCapDoJ-MyLevel);
end

function tbGMCard:IdTitle()
	Dialog:AskNumber("Genre Title: ", 999999, self.Id1, self);
end
function tbGMCard:Id1(nGenre)
	Dialog:AskNumber("Detail Title: ", 999999, self.Id2, self,nGenre);
end
function tbGMCard:Id2(nGenre,nDetail)
	Dialog:AskNumber("Particular Title: ", 999999, self.Id3, self,nGenre,nDetail);
end
function tbGMCard:Id3(nGenre,nDetail,nParticular)
	Dialog:AskNumber("Level Title: ", 999999, self.Id4, self,nGenre,nDetail,nParticular);
end
function tbGMCard:Id4(nGenre,nDetail,nParticular,nLevel)
	me.AddTitle(nGenre,nDetail,nParticular,nLevel);
end
----------------------

----------------------
function tbGMCard:IdBoss()
	Dialog:AskNumber("Id Boss: ", 999999, self.LevelBosss, self);
end
function tbGMCard:LevelBosss(nIdBoss)
	Dialog:AskNumber("Level Boss: ", 999, self.CallOut, self,nIdBoss);
end
function tbGMCard:CallOut(nIdBoss,nLevelNpc)
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(nIdBoss, nLevelNpc, -1, nMapId, nPosX, nPosY);
end
----------------------

----------------------
function tbGMCard:IdItem()
	Dialog:AskNumber("Genre: ", 999999, self.testdo1, self);
end
function tbGMCard:testdo1(nGenre)
	Dialog:AskNumber("Detail: ", 999999, self.testdo2, self,nGenre);
end
function tbGMCard:testdo2(nGenre,nDetail)
	Dialog:AskNumber("Particular: ", 999999, self.testdo3, self,nGenre,nDetail);
end
function tbGMCard:testdo3(nGenre,nDetail,nParticular)
	Dialog:AskNumber("Level: ", 999999, self.testdo4, self,nGenre,nDetail,nParticular);
end
function tbGMCard:testdo4(nGenre,nDetail,nParticular,nLevel)
	Dialog:AskNumber("Stack: ", 999999, self.testdo5, self,nGenre,nDetail,nParticular,nLevel);
end
function tbGMCard:testdo5(nGenre,nDetail,nParticular,nLevel,nStack)
	me.AddStackItem(nGenre,nDetail,nParticular,nLevel,nil,nStack);
end

function tbGMCard:CallBoss()
	local szMsg = "<pic=198><pic=198><pic=198><color=yellow>Gọi con nào đây Đại Ca<color><pic=198><pic=198><pic=198>";
	local tbOpt = {
		{"Long Trụ Thanh Long",self.Call1,self};
		{"Long Mạch",self.Call2,self};
		{"Long Trụ Chu Tước",self.Call3,self};
		{"Long Trụ Bạch Hổ",self.Call4,self};
		{"Long Trụ Huyền Vũ",self.Call5,self};
		{"Cờ Bang Chiến",self.Call6,self};
		{"Cường Tặc",self.Call7,self};
		{"Độc Cô Cầu Bại",self.Call8,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end


function tbGMCard:Call8()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20201, 50, -1, nMapId, nPosX, nPosY);
end

function tbGMCard:Call7()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20201, 1, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call6()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20199, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call5()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20198, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call4()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20197, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call3()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20196, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call2()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20193, 300, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:Call1()
    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(20195, 200, -1, nMapId, nPosX, nPosY);
    me.Msg(string.format("Đã gọi Bos tại map số %d tọa độ %d/%d",nMapId,nPosX/8,nPosY/16));
end

function tbGMCard:MenuFightSkill()
	local szMsg = ""..me.szName.." chọn đi đại ca?";
		local tbOpt =
		{
			{"Nhận Skill Test", self.NhanSkill, self},
			{"Xóa Skill Test",self.XoaSkill,self};
			{"Kiểm Tra Skill",self.CheckSkill,self};
		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:CheckSkill()
   	local nSkill = me.GetSkillState(1999);
	local yesno = "Chưa biết";
	if nSkill > 0 then
	    yesno = "<color=yellow>Đã Có Skill<color>"
	else
	    yesno = "<color=white>Chưa Có Skill<color>"
	end
	Dialog:Say("Kết Quả "..yesno.."");
end

function tbGMCard:XoaSkill()
   	me.RemoveSkillState(1995);
end

function tbGMCard:NhanSkill()
	me.AddSkillState(1995, 1, 2, 30 * 60* Env.GAME_FPS, 1, 0, 1);
end

function tbGMCard:testdichuyen()
	local szMsg = "<pic=198><pic=198><pic=198><color=yellow>Mời chọn<color><pic=198><pic=198><pic=198>";
	local tbOpt = {
		{"Công Thành Chiến",self.CongThanhChien,self};
		{"Xóa Xa Phu",self.XoaXaPhu,self};
		{"Cho người chơi ra khỏi CTC",self.MoveNcCtc,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbGMCard:MoveNcCtc()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
	if nMapId == 1718 then
		pPlayer.NewWorld(2,1780,3579); -- chuyển hết đến long môn trấn
	end
end
end

function tbGMCard:XoaXaPhu()
	ClearMapNpcWithName(1718,"Xa Phu");
end

function tbGMCard:CongThanhChien()
me.NewWorld(1718,1742,3417);
end

function tbGMCard:MenuTiemNangKyNang()
	local szMsg = ""..me.szName.." cộng gì đây đại ca?";
		local tbOpt =
		{
			{"Nhận 10000 Tiềm Năng",self.DiemTiemNang,self};
			{"Nhận 10 Kỹ Năng", self.DiemKyNang,self},
			{"Nhận Max Kỹ Năng Môn Phái 20 Thành", self.MaxSkillMonPhai,self},
			{"Del Kỹ Năng", self.XoaKyNang,self},
		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:XoaKyNang()
	me.DelFightSkill(697)
end

function tbGMCard:DiemTiemNang()
	me.AddPotential(10000)
end

function tbGMCard:DiemKyNang()
		me.AddFightSkillPoint(10)
end

function tbGMCard:vukhitest()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.vktvt,self},
			{"Thiên vương Chùy", self.vktvc,self},
			{"Thiếu Lâm Đao", self.vktld,self},
			{"Thiếu Lâm Bổng", self.vktlb,self},
			{"Minh Giáo Kiếm", self.vkmgk,self},
			{"Minh Giáo Chùy", self.vkmgc,self},
			{"Đường Môn Tụ Tiễn", self.vkdmtt,self},
			{"Đường Môn Hãm Tĩnh", self.vkdmht,self},
			{"Ngũ Độc Chưởng", self.vkndc,self},
			{"Ngũ Độc Đao", self.vkndd,self},
			{"Đoàn Thị Kiếm", self.vkdtk,self},
			{"Đoàn Thị Chỉ", self.vkdtc,self},
			{"Thuy Yên Kiếm", self.vktyk,self},
			{"Thúy Yên Đao", self.vktyd,self},
			{"Nga My Kiếm", self.vknmk,self},
			{"Nga My Chưởng", self.vknmc,self},
			{"<color=pink>Trang Sau<color>", self.vktrangsau,self},

		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:vktrangsau()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.vkcbr,self},
			{"Cái Bang Bổng", self.vkcbb,self},
			{"Thiên Nhẫn Đao", self.vktnd,self},
			{"Thiên Nhẫn Kích", self.vktnk,self},
			{"Côn Lôn Kiếm", self.vkclk,self},
			{"Côn Lôn Đao", self.vkcld,self},
			{"Võ Đang Khí", self.vkvdk,self},
			{"Võ Đang Kiếm", self.vkvdkk,self},

		}
		Dialog:Say(szMsg,tbOpt);
end

function tbGMCard:vkmgk()
		local item10 = me.AddItem(2,1,1354,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkmgc()
		local item10 = me.AddItem(2,1,1353,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkdmtt()
		local item10 = me.AddItem(2,2,148,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkdmht()
		local item10 = me.AddItem(2,2,147,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkndc()
		local item10 = me.AddItem(2,1,1340,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkndd()
		local item10 = me.AddItem(2,1,1339,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkdtk()
		local item10 = me.AddItem(2,1,1344,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkdtc()
		local item10 = me.AddItem(2,1,1342,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktyk()
		local item10 = me.AddItem(2,1,1344,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktyd()
		local item10 = me.AddItem(2,1,1341,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vknmk()
		local item10 = me.AddItem(2,1,1344,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vknmc()
		local item10 = me.AddItem(2,1,1343,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktvt()
		local item10 = me.AddItem(2,1,1337,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktvc()
		local item10 = me.AddItem(2,1,1338,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktld()
		local item10 = me.AddItem(2,1,1335,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktlb()
		local item10 = me.AddItem(2,1,1336,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkcbb()
		local item10 = me.AddItem(2,1,1345,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkcbr()
		local item10 = me.AddItem(2,1,1347,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktnd()
		local item10 = me.AddItem(2,1,1348,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vktnk()
		local item10 = me.AddItem(2,1,1346,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkclk()
		local item10 = me.AddItem(2,1,1352,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkcld()
		local item10 = me.AddItem(2,1,1349,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkvdk()
		local item10 = me.AddItem(2,1,1351,10,1,16);
		item10.Bind(1);
end

function tbGMCard:vkvdkk()
		local item10 = me.AddItem(2,1,1350,10,1,16);
		item10.Bind(1);
end

function tbGMCard:nhancapdo()
me.AddExp(10000000000);
end

function tbGMCard:ThongBaoHeThong()
    Dialog:AskString("Nhập dữ liệu", 1000, self.tbtsv1, self);
end

function tbGMCard:tbtsv1(msg)

	local szMsg ="<color=greenyellow>"..msg.."<color>";
	GlobalExcute({"Dialog:GlobalNewsMsg_GS",szMsg});
	KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,szMsg);
	KDialog.MsgToGlobal(szMsg);
	local tbPlayerList = KPlayer:GetAllPlayer();
		for _,pPlayer in pairs(tbPlayerList) do
			pPlayer.CallClientScript({"UiManager:OpenWindow", "UI_INFOBOARD", "<color=yellow>Có Thông Báo Mới<color>"});
		end
end

---- Tiêu hủy đạo cụ

function tbGMCard:tieuhuydaocu()
	Dialog:OpenGift("Hãy đặt vào", nil ,{self.OnOpenGiftOk, self});
end

function tbGMCard:OnOpenGiftOk(tbGMCardObj)
	for _, pItem in pairs(tbGMCardObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
end

function tbGMCard:SuperReload()
 local tbOpt = {
  {"Super Reload Script", Lib._SuperScript:DoScriptDir(),Lib._SuperScript},
 };
end


function tbGMCard:Daocutamthoi()
    if (me.szName=="TCQGaming")  then
	local szMsg = "Ta có thể giúp gì cho ngươi";
	local tbOpt = {};
	table.insert(tbOpt , {"Đồ hỗ trợ",  self.dohotro, self});
	table.insert(tbOpt , {"Túi Truyền Tống",  self.tuitruyentong, self});
	table.insert(tbOpt , {"Túi Kỹ Năng",  self.tuikynang, self});
	table.insert(tbOpt , {"Túi Nhiệm Vụ",  self.tuinhiemvu, self});
	table.insert(tbOpt , {"Túi Người Chơi",  self.tuinguoichoi, self});
	table.insert(tbOpt , {"Chiến trường Tống Kim",  self.chtrgtongkim, self});
	table.insert(tbOpt , {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	else
		local szMsg = "";
		local tbOpt = {};
		Dialog:Say(szMsg, tbOpt);
	end
end


function tbGMCard:dohotro()
	local tbTmpNpc	= Npc:GetClass("tmpnpc");
	tbTmpNpc:OnDialog();
end
function tbGMCard:tuitruyentong()
	local tbItem	= Item:GetClass("tempitem");
	tbItem:OnTransPak(tbItem.tbMap);
end
function tbGMCard:tuikynang()
	local tbItem	= Item:GetClass("tempitem");
	tbItem:OnSkillPak();
end
function tbGMCard:tuinhiemvu()
	local tbItem	= Item:GetClass("tempitem");
	tbItem:OnTaskItemPak(tbItem.tbItems);
end

function tbGMCard:tuinguoichoi()
    if (me.szName=="TCQGaming")  then
		GM.tbPlayer:Main();
	else
		local szMsg = "";
		local tbOpt = {};
		Dialog:Say(szMsg, tbOpt);
	end
end



function tbGMCard:chtrgtongkim()
	Battle:GM();
end

function tbGMCard:DichuyenOnDialog()
 local tbOpt = {

  {"Tương Dương", self.maptuongduong, self},
  {"Dương Châu", self.mapduongchau, self},
  {"Phượng Tường", self.mapphuongtuong, self},
  {"Đại Lý", self.mapdaily, self},
  {"Lâm An", self.maplaman, self},
  {"Biện Kinh", self.mapbienkinh, self},
  {"Thành Đô", self.mapthanhdo, self},
  {"Ta chưa cần"},
 };

  Dialog:Say("Vì nhân dân phục vụ", tbOpt);
  return 0;
end;

function tbGMCard:maptuongduong()
local toadox = 48448 / 32
local toadoy = 100864 / 32
 local tbOpt = {
 
{"CTC", me.NewWorld, 233,1609,3085},
{"CTC 1", me.NewWorld, 1832,1979,3109},
 -- {"CTC 2", me.NewWorld, 1832,1616,3135},
 -- {"CTC 3", me.NewWorld, 1832,1511,3255},
 -- {"CTC 4", me.NewWorld, 1832,1505,3696},
 -- {"CTC 5", me.NewWorld, 1832,1616,3812},
 -- {"CTC 6", me.NewWorld, 1832,1966,3829},
 -- {"CTC 7", me.NewWorld, 1832,2073,3713},
   -- {"Đảo Tẩy Tủy", me.NewWorld, 255, 1652, 3389},
   -- {"Hoàng Lăng", me.NewWorld, 1536, 1567, 3629},
   -- {"Vân Lĩnh", self.vanlinh, self},
   -- {"Tương Dương1", me.NewWorld, 25,1783,3113},
   {"Tương Dương2", me.NewWorld, 25, 1773, 3009},
   {"Tương Dương3", me.NewWorld, 25,1670,3038},
   {"Tương Dương4", me.NewWorld, 25,1590,2926},
   {"Tương Dương5", me.NewWorld, 25,1464,2960},
   {"Tương Dương6", me.NewWorld, 25,1442,3148},
   {"Tương Dương7", me.NewWorld, 25,1490,3271},
   {"Tương Dương8", me.NewWorld, 25,1587,3249},
   {"Tương Dương9", me.NewWorld, 25,1621,3327},
   {"Tương Dương10", me.NewWorld, 25,1710,3198},
   {"Tương Dương11", me.NewWorld, 25,1759,3302},
   {"Tương Dương12", me.NewWorld, 25,1789,3195},
    };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:maplaman()
 local tbOpt = {
{"Lâm An1", me.NewWorld, 29, 1649, 3950},
{"Lâm An2", me.NewWorld, 29, 1726, 4029},
{"Lâm An3", me.NewWorld, 29, 1829, 3946},
{"Lâm An4", me.NewWorld, 29, 1736, 3890},
{"Lâm An5", me.NewWorld, 29, 1831, 3882},
{"Lâm An6", me.NewWorld, 29, 1694, 3798},
{"Lâm An7", me.NewWorld, 29, 1686, 3692},
{"Lâm An8", me.NewWorld, 29, 1582, 3820},
{"Lâm An9", me.NewWorld, 29, 1518, 3879},
{"Lâm An10", me.NewWorld, 29, 1475, 3774},
{"Lâm An11", me.NewWorld, 29, 1573, 4114},
{"Lâm An12", me.NewWorld, 29, 1458, 4145},
    };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:mapthanhdo()
 local tbOpt = {
   {"Thành Đô 1", me.NewWorld, 27, 1734, 3345},
   {"Thành Đô 2", me.NewWorld, 27, 1735, 3279},
   {"Thành Đô 3", me.NewWorld, 27, 1730, 3176},
   {"Thành Đô 4", me.NewWorld, 27, 1603, 3252},
   {"Thành Đô 5", me.NewWorld, 27, 1571, 3294},
   {"Thành Đô 6", me.NewWorld, 27, 1507, 3389},
   {"Thành Đô 7", me.NewWorld, 27, 1634, 3357},
   {"Thành Đô 8", me.NewWorld, 27, 1685, 3105},
   {"Thành Đô 9", me.NewWorld, 27, 1600, 3121},
   {"Thành Đô 10", me.NewWorld, 27, 1539, 3141},
   {"Thành Đô 11", me.NewWorld, 27, 1522, 3192},
   {"Thành Đô 12", me.NewWorld, 27, 1484, 3201},
       };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:mapbienkinh()
 local tbOpt = {
{"Biện Kinh 1", me.NewWorld, 23, 1578, 3262},
{"Biện Kinh 2", me.NewWorld, 23, 1459, 3134},
{"Biện Kinh 3", me.NewWorld, 23, 1526, 3121},
{"Biện Kinh 4", me.NewWorld, 23, 1460, 3001},
{"Biện Kinh 5", me.NewWorld, 23, 1548, 3041},
{"Biện Kinh 6", me.NewWorld, 23, 1674, 3179},
{"Biện Kinh 7", me.NewWorld, 23, 1689, 3088},
{"Biện Kinh 8", me.NewWorld, 23, 1712, 3021},
{"Biện Kinh 9", me.NewWorld, 23, 1602, 3043},
{"Biện Kinh 10", me.NewWorld, 23, 1611, 2912},
{"Biện Kinh 11", me.NewWorld, 23, 1541, 2982},
{"Biện Kinh 12", me.NewWorld, 23, 1569, 3106}
       };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:mapdaily()
 local tbOpt = {
{"Đại Lý 1", me.NewWorld, 28, 1519, 3446},
{"Đại Lý 2", me.NewWorld, 28, 1413, 3489},
{"Đại Lý 3", me.NewWorld, 28, 1412, 3339},
{"Đại Lý 4", me.NewWorld, 28, 1502, 3279},
{"Đại Lý 5", me.NewWorld, 28, 1503, 3371},
{"Đại Lý 6", me.NewWorld, 28, 1496, 3195},
{"Đại Lý 7", me.NewWorld, 28, 1566, 3166},
{"Đại Lý 8", me.NewWorld, 28, 1648, 3140},
{"Đại Lý 9", me.NewWorld, 28, 1657, 3304},
{"Đại Lý 10", me.NewWorld, 28, 1743, 3367},
{"Đại Lý 11", me.NewWorld, 28, 1792, 3322},
{"Đại Lý 12", me.NewWorld, 28, 1650, 3453}
       };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:mapduongchau()
 local tbOpt = {
{"Dương Châu 1", me.NewWorld, 26, 1673, 3074},
{"Dương Châu 2", me.NewWorld, 26, 1620, 3447},
{"Dương Châu 3", me.NewWorld, 26, 1690, 3149},
{"Dương Châu 4", me.NewWorld, 26, 1682, 3272},
{"Dương Châu 5", me.NewWorld, 26, 1631, 3352},
{"Dương Châu 6", me.NewWorld, 26, 1485, 3098},
{"Dương Châu 7", me.NewWorld, 26, 1495, 3219},
{"Dương Châu 8", me.NewWorld, 26, 1391, 3183},
{"Dương Châu 9", me.NewWorld, 26, 1478, 3288},
{"Dương Châu 10", me.NewWorld, 26, 1572, 3377},
{"Dương Châu 11", me.NewWorld, 26, 1557, 3287},
{"Dương Châu 12", me.NewWorld, 26, 1598, 3202}
       };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
  function tbGMCard:mapphuongtuong()
 local tbOpt = {
{"Phượng Tường 1", me.NewWorld, 24, 1796, 3497},
{"Phượng Tường 2", me.NewWorld, 24, 1870, 3429},
{"Phượng Tường 3", me.NewWorld, 24, 1940, 3419},
{"Phượng Tường 4", me.NewWorld, 24, 1947, 3523},
{"Phượng Tường 5", me.NewWorld, 24, 1876, 3589},
{"Phượng Tường 6", me.NewWorld, 24, 1820, 3584},
{"Phượng Tường 7", me.NewWorld, 24, 1749, 3618},
{"Phượng Tường 8", me.NewWorld, 24, 1654, 3536},
{"Phượng Tường 9", me.NewWorld, 24, 1539, 3435},
{"Phượng Tường 10", me.NewWorld, 24, 1686, 3316},
{"Phượng Tường 11", me.NewWorld, 24, 1793, 3339},
{"Phượng Tường 12", me.NewWorld, 24, 1873, 3382}
       };
 Dialog:Say("Chọn nơi muốn đến!", tbOpt);
end
function tbGMCard:vanlinh()
	Task.FourfoldMap:ApplyTeamMap(1, 2, 0);
--	Task.FourfoldMap:OnDialog();

end

function tbGMCard:Tuluyen()
 me.AddXiuWeiTime(10000000);
end

function tbGMCard:OnDialog_GM()
 if (me.szName=="TCQGaming")  then
 local nIsHide = GM.tbGMRole:IsHide();
 
 local tbOpt = {
  
	{(nIsHide == 1 and "Hủy ẩn thân") or "Bắt đầu ẩn thân", "GM.tbGMRole:SetHide", 1 - nIsHide},
	{"Nhập tên nhân vật", self.AskRoleName, self},
	{"Người chơi bên cạnh", self.AroundPlayer, self},
	{"Thao tác gần đây", self.RecentPlayer, self},
	{"Tự điều chỉnh cấp", self.AdjustLevel, self},
	--{"Xếp hạng danh vọng", self.XepHangDanhVong, self},
	{"Reload Script", self.Reload, self},
	--{"<color=yellow>Phóng viên thi đấu liên server<color>", self.LookWldh, self},
	{"<color=yellow>Hoàng Lăng không giới hạn<color>", self.SuperQinling, self},
	{"Ta chưa cần"},
 };
 
 Dialog:Say("\n  Các bạn vất vả rồi!<pic=28>\n\n     Vì nhân dân phục vụ<pic=98><pic=98><pic=98>", tbOpt);
 
 return 0;
 else
		local szMsg = "";
		local tbOpt = {};
		Dialog:Say(szMsg, tbOpt);
	end
end;

function tbGMCard:SuperQinling()
 me.NewWorld(1536, 1567, 3629);
 me.SetTask(2098, 1, 0);
 me.AddSkillState(1413, 4, 1, 2 * 60 * 60 * Env.GAME_FPS, 1, 1);
end
function tbGMCard:Reload()
	-- local nRet1 = DoScript("\\script\\global\\tcqgaming\\GM\\theadmin.lua");
		local nRet1 = DoScript("\\script\\global\\tcqgaming\\GM\\lenhbaiadmin.lua");
		-- local nRet1 = DoScript("\\script\\global\\tcqgaming\\npc\\tientrang.lua");
	-- local nRet1 = DoScript("\\script\\npc\\yeliandashi.lua");
	--local nRet2 = DoScript("\\script\\misc\\gm_role.lua");
	-- local nRet2 = DoScript("\\script\\global\\tcqgaming\\tanthu\\tuitanthu.lua");
	-- local nRet2 = DoScript("\\script\\baibaoxiang\\item\\jinxiangzi.lua");
	--local nRet3 = DoScript("\\script\\account\\account_gs.lua");
	--local nRet3 = DoScript("\\script\\relation\\renji.lua");
	--local nRet3 = DoScript("\\script\\misc\\c2scall.lua");
	-- local nRet3	= DoScript("\\script\\misc\\gm.lua");
	--GCExcute({"DoScript", "\\script\\misc\\gm_role.lua"});
	-- DoScript("\\script\\lib\\dialog.lua");
	-- DoScript("\\script\\player\\KLuaPlayer.lua");
	-- DoScript("\\script\\factionelect\\factionelect_gs.lua");
	local szMsg	= "Reloaded!!("..nRet1..","..nRet2..","..nRet3..GetLocalDate(") %Y-%m-%d %H:%M:%S");
	me.Msg(szMsg);
	print(szMsg);
end
function tbGMCard:XepHangDanhVong() 
    GCExcute({"PlayerHonor:UpdateWuLinHonorLadder"}); --võ lâm
    GCExcute({"PlayerHonor:UpdateMoneyHonorLadder"}); --tài phú
    GCExcute({"PlayerHonor:UpdateLeaderHonorLadder"});  --thủ lĩnh
    GCExcute({"PlayerHonor:UpdateSpringHonorLadder"}); 
    GCExcute({"PlayerHonor:UpdateXoyoLadder"});  --tiêu dao
    GCExcute({"PlayerHonor:OnSchemeLoadFactionHonorLadder"});  --môn phái
    GCExcute({"PlayerHonor:OnSchemeUpdateSongJinBattleHonorLadder"});  --
    GCExcute({"PlayerHonor:OnSchemeUpdateDragonBoatHonorLadder"}); 
    GCExcute({"PlayerHonor:OnSchemeUpdatePrettygirlHonorLadder"}); 
    GCExcute({"PlayerHonor:OnSchemeUpdateKaimenTaskHonorLadder"}); 
    KGblTask.SCSetDbTaskInt(86, GetTime()); 
    GlobalExcute({"PlayerHonor:OnLadderSorted"});     
    print("Xếp hạng lại danh vọng."); 
end  

function tbGMCard:AskRoleName()
 if (me.szName=="TCQGaming")  then
 Dialog:AskString("Tên nhân vật", 16, self.OnInputRoleName, self);
 else
	local szMsg = "";
	local tbOpt = {};
	Dialog:Say(szMsg, tbOpt);
end
end
function tbGMCard:OnInputRoleName(szRoleName)
 local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
 if (not nPlayerId) then
  Dialog:Say("Tên này không tồn tại!", {"Nhập lại", self.AskRoleName, self}, {"Kết thúc đối thoại"});
  return;
 end
 
 self:ViewPlayer(nPlayerId);
end



function tbGMCard:ViewPlayer(nPlayerId)
 -- 插入最近玩家列表
 local tbRecentPlayerList = self.tbRecentPlayerList or {};
 self.tbRecentPlayerList  = tbRecentPlayerList;
 for nIndex, nRecentPlayerId in ipairs(tbRecentPlayerList) do
  if (nRecentPlayerId == nPlayerId) then
   table.remove(tbRecentPlayerList, nIndex);
   break;
  end
 end
 if (#tbRecentPlayerList >= self.MAX_RECENTPLAYER) then
  table.remove(tbRecentPlayerList);
 end
 table.insert(tbRecentPlayerList, 1, nPlayerId);
     local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
 local SoDong = pPlayer.nCoin/10000;
 local KNBtieu = pPlayer.GetItemCountInBags(18,1,1338,2);		
local KNBdai = pPlayer.GetItemCountInBags(18,1,1338,1);
local HT7 = pPlayer.GetItemCountInBags(18,1,1,7);		
local HT8 = pPlayer.GetItemCountInBags(18,1,1,8);		
local HT10 = pPlayer.GetItemCountInBags(18,1,114,10);		
local HT11 = pPlayer.GetItemCountInBags(18,1,114,11);
local HT12 = pPlayer.GetItemCountInBags(18,1,114,12);		
local DanhBo = pPlayer.GetItemCountInBags(18,1,190,1);	
local nSoLuongVLMT = pPlayer.GetTask(2040,5);	
local nSoLuongTTK = pPlayer.GetTask(2040,6);	
 local nHardWareId = pPlayer.GetTask(2406,1)
 local nCheckEvent = pPlayer.GetTask(9178,152)


 local szName = KGCPlayer.GetPlayerName(nPlayerId);
 local tbInfo = GetPlayerInfoForLadderGC(szName);
 local tbState = {
  [0]  = "Không online",
  [-1] = "Đang xử lý",
  [-2] = "Auto?",
 };
    --local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    --local nIp = pPlayer.GetTask(2063, 1);

 local nState = KGCPlayer.OptGetTask(nPlayerId, KGCPlayer.TSK_ONLINESERVER);
 local tbText = {
  {"Tên", szName},
  {"Tài khoản", tbInfo.szAccount},
  {"Cấp", tbInfo.nLevel},
  {"Giới tính", (tbInfo.nSex == 1 and "Nữ") or "Nam"},
  {"Hệ phái", Player:GetFactionRouteName(tbInfo.nFaction, tbInfo.nRoute)},
  {"Tộc", tbInfo.szKinName},
  {"Bang hội", tbInfo.szTongName},
  -- {"<color=cyan>Số VLMT <color> ", nSoLuongVLMT},
  -- {"<color=cyan>Số TTK <color> ", nSoLuongTTK},
  -- {"<color=cyan>Tổng Đồng<color> ", SoDong},
  -- {"<color=cyan>Tổng Tiểu Kim<color> ", KNBtieu},
  -- {"<color=cyan>Tổng Đại Kim<color> ", KNBdai},
  	-- {"Uy danh", KGCPlayer.GetPlayerPrestige(nPlayerId)},
  -- {"<color=cyan>Tổng Số Huyền Tinh 7<color> ", HT7},
  -- {"<color=cyan>Tổng Số Huyền Tinh 8<color> ", HT8},
  -- {"<color=cyan>Tổng Số Huyền Tinh 10<color> ", HT10},
  -- {"<color=cyan>Tổng Số Huyền Tinh 11<color> ", HT11},
  -- {"<color=cyan>Tổng Số Huyền Tinh 12<color> ", HT12},
  -- {"<color=cyan>Tổng Số Danh Bổ Lệnh<color> ", DanhBo},

  {"<color=cyan>Check Event<color> ", nCheckEvent},
  {"<color=cyan>Mã ổ cứng<color> ", nHardWareId},
  {"Uy danh", KGCPlayer.GetPlayerPrestige(nPlayerId)},
  {"Trạng thái", (tbState[nState] or "<color=green>Trên mạng<color>") .. "("..nState..")"},
 }
 local szMsg = "";
 for _, tb in ipairs(tbText) do
  szMsg = szMsg .. "\n  " .. Lib:StrFillL(tb[1], 6) .. tostring(tb[2]);
 end
 local szButtonColor = (nState > 0 and "") or "<color=gray>";
 local tbOpt = {
   {"<color=cyan>Cấm Chat", self.CamChat, self, nPlayerId },
   {"<color=cyan>Bỏ Cấm Chat", self.BoCamChat, self, nPlayerId },
		-- {"Ban treo tống kim", self.BanTreoTK, self, nPlayerId},
		-- {"UnBan treo tống kim", self.UnBanTreoTK, self, nPlayerId},
		{"Ban người chơi vi phạm", self.BanPlayerByHardWareId, self, nPlayerId},
        -- {"Unban người chơi", self.UnbanPlayerByHardWareId, self, nPlayerId},
  -- {"<color=yellow>Vào Tù Kéo Xe<color>", self.CamKeoXe, self, nPlayerId },
  -- {"<color=blue>Vào Tù post mạng<color>", self.CamPstMang, self, nPlayerId },
  {szButtonColor.."Kéo hắn qua đây", "GM.tbGMRole:CallHimHere", nPlayerId},
  {szButtonColor.."Đưa ta đi", "GM.tbGMRole:SendMeThere", nPlayerId},
  -- {"Nạp đồng thường.", self.Napdong, self, nPlayerId },
  -- {"<color=cyan>Xóa 1 Lần Chuyển Cường Hóa", self.XoaLanChuyenCuong, self, nPlayerId },
  -- {"<color=cyan>Lay Lần Chuyển Cường Hóa", self.LayChuyenCuongNe, self, nPlayerId },
  -- {"<color=cyan>Set An", self.settranhoang, self, nPlayerId },
   -- {"<color=cyan>Set event", self.layminhchu, self, nPlayerId },
  -- {"<color=cyan>Set Ngu Hanh", self.laynguhanh, self, nPlayerId },
  -- {"<color=cyan>Lấy Điểm Hoạt Động", self.LayDiemHD, self, nPlayerId },
  -- {"<color=cyan>Reset rương", self.reset6677, self, nPlayerId },
  -- {"<color=cyan>Xóa Danh Hiệu", self.xoadanhhieu, self, nPlayerId },
  -- {"<color=cyan>Lay Lag", self.laylagne, self, nPlayerId },
  {"<color=cyan>Settask", self.buffso, self, nPlayerId },
  -- {"<color=cyan>Buff 10 Viên HT8", self.buffht8, self, nPlayerId }, 
  -- {"<color=cyan>Buff 10 Viên HT9", self.buffht9, self, nPlayerId },
  {"Lấy ID Vật Phẩm Cho", self.Addvatpham, self, nPlayerId },
  -- {"Add tinh hoạt", self.Naptinhhoat, self, nPlayerId },
  --{"cho nó max kỹ năng sống", self.chonomaxkns, self, nPlayerId },
  -- {"Nạp đồng khóa", self.Napdongkhoa, self, nPlayerId },
  -- {"Xoa Uy Danh Của Hắn", self.xoauydanh, self, nPlayerId },
  --{"Thêm cấp", self.levelnhanvat, self, nPlayerId },
  --{"Thêm chúc phúc.", self.Chucphucfp, self, nPlayerId },
  --{"Thêm TDC.", self.Tieudaofp, self, nPlayerId },
   --{"Thêm LãnhThổ.", self.lanhthofp, self, nPlayerId },
 {szButtonColor.."Cho hắn rớt mạng", "GM.tbGMRole:KickHim", nPlayerId},
  -- {"Gửi thư", self.SendMail, self, nPlayerId},
  -- {"<color=greenyellow>Quan Ấn Thượng Khanh<color>", self.quaanthuong, self, nPlayerId},
  -- {"<color=greenyellow>Add hoặc xóa skill<color>", self.menuuskill, self, nPlayerId},
  {"Kết thúc đối thoại"},
 };
 Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:CamChat(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end
 pPlayer.SetForbidChat(1);
 me.Msg("Đã cấm chat người chơi"..pPlayer.szName.." thành công")
end 
function tbGMCard:BoCamChat(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end
 pPlayer.SetForbidChat(0);
 me.Msg("Đã bỏ cấm chat người chơi"..pPlayer.szName.." thành công")
end 
function tbGMCard:BanTreoTK(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end

    local szHardWareId = pPlayer.GetTask(2406,1)
    local szBanFile = "\\script\\global\\tcqgaming\\npc\\ban\\BanTongKimTreo.txt"
    local szData = KFile.ReadTxtFile(szBanFile)

    if szData and szData:find(string.format("%s\t%s", szHardWareId, pPlayer.szName)) then
        return Dialog:Say("Người chơi đã bị ban trước đó rồi")
    end

    local banLine = string.format("%s\t%s", szHardWareId, pPlayer.szName)
    local szNewData = szData and (szData .. "\n" .. banLine) or banLine
    KFile.WriteFile(szBanFile, szNewData)

    -- Gửi thông báo cho người chơi
    local szMessage = string.format("<color=cyan>Bạn đã vi phạm quy định về treo Tống Kim. Tài khoản của bạn đã bị ban cho tới khi tống kim kết thúc.")
    pPlayer.Msg(szMessage)

    -- Đá người chơi khỏi game
    pPlayer.KickOut()

    return Dialog:Say("Ban thành công: " .. szHardWareId)
end
function tbGMCard:UnBanTreoTK(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end

    local szHardWareId = pPlayer.GetTask(2406,1)
    local szBanFile = "\\script\\global\\tcqgaming\\npc\\ban\\BanTongKimTreo.txt"
    local szData = KFile.ReadTxtFile(szBanFile)
    if not szData then
        return Dialog:Say(string.format("Người chơi chưa bị ban, dwHardWareId của người chơi: %s", szHardWareId))
    end
    local bFound = false
    local newLines = {}
    for line in szData:gmatch("[^\r\n]+") do
        local id, name = line:match("(%S+)\t(%S+)")
        if id ~= tostring(szHardWareId) then
            table.insert(newLines, line)
        else
            bFound = true
        end
    end

    if not bFound then
        return Dialog:Say("Người chơi chưa bị ban")
    end
    local szNewData = table.concat(newLines, "\n")
    KFile.WriteFile(szBanFile, szNewData)
    return Dialog:Say("Unban thành công")
end


function tbGMCard:BanPlayerByHardWareId(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end

    -- local szHardWareId = tostring(pPlayer.dwHardWareId)
    local szHardWareId = pPlayer.GetTask(2406,1)
    local szBanFile = "\\script\\global\\tcqgaming\\npc\\ban\\BanList.txt"
    local szData = KFile.ReadTxtFile(szBanFile)

    -- Kiểm tra xem người chơi đã bị ban hay chưa
    if szData and szData:find(string.format("%s\t%s", szHardWareId, pPlayer.szName)) then
        Dialog:Say("Người chơi đã bị ban trước đó rồi")
        return
    end

    -- Ghi thông tin ban vào file BanList.txt
    local banLine = string.format("%s\t%s", szHardWareId, pPlayer.szName)
    local szNewData = szData and (szData .. "\n" .. banLine) or banLine
    KFile.WriteFile(szBanFile, szNewData)

    -- Gửi thông báo cho người chơi
    local szMessage = string.format("<color=cyan>Bạn đã vi phạm quy định về treo Tống Kim. Tài khoản của bạn đã bị ban cho tới khi tống kim kết thúc.")
    pPlayer.Msg(szMessage)
    -- Đá người chơi khỏi game
    pPlayer.KickOut()

    return Dialog:Say("Ban thành công: " .. szHardWareId)
end

function tbGMCard:UnbanPlayerByHardWareId(nPlayerId)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    if not pPlayer then
        return Dialog:Say("Người chơi không tồn tại")
    end
    local szHardWareId = pPlayer.GetTask(2406,1)
    local szBanFile = "\\script\\global\\tcqgaming\\npc\\ban\\BanList.txt"
    local szData = KFile.ReadTxtFile(szBanFile)
    if not szData then
        return Dialog:Say(string.format("Người chơi chưa bị ban, dwHardWareId của người chơi: %s", szHardWareId))
    end
    local bFound = false
    local newLines = {}
    for line in szData:gmatch("[^\r\n]+") do
        local id, name = line:match("(%S+)\t(%S+)")
        if id ~= tostring(szHardWareId) then
            table.insert(newLines, line)
        else
            bFound = true
        end
    end

    if not bFound then
        return Dialog:Say("Người chơi chưa bị ban")
    end
    local szNewData = table.concat(newLines, "\n")
    KFile.WriteFile(szBanFile, szNewData)
    return Dialog:Say("Unban thành công")
end

function tbGMCard:XoaUyDanhTuan_GS(nPlayerId)
				local nTongUyDanh = KGCPlayer.GetPlayerPrestige(nPlayerId);
				if nTongUyDanh > 1 then
				KGCPlayer.SetPlayerPrestige(nPlayerId, 0);
					print("--- DA XOA UY DANH TUAN NAY ---");
				else
				end
end 

function tbGMCard:quaanthuong(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local pItem = pPlayer.AddItem(1,18,4,5);
	if pItem then
		pPlayer.SetItemTimeout(pItem, 7*24*60,0);
	end
end

function tbGMCard:honthientho(nPlayerId)
	Dialog:AskNumber("Id FiFong: ", 20, self.geffthoihan, self,nPlayerId);
end

function tbGMCard:geffthoihan(nPlayerId,nNumiFiF)
	Dialog:AskNumber("Level FiFong: ", 10, self.nhangefifo, self,nPlayerId,nNumiFiF);
end

function tbGMCard:nhangefifo(nPlayerId,nNumiFiF,nLevlFif)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local pItem = pPlayer.AddItem(1,17,nNumiFiF,nLevlFif);
	if pItem then
		pPlayer.SetItemTimeout(pItem, 30*24*60,0);
	end
end

function tbGMCard:menuuskill(nPlayerId)
	local szMsg = ""..me.szName.." chọn đi đại ca?";
	local tbOpt =
	{
		{"Add Skill Chí Mạng",self.AddSkillCma, self,nPlayerId},
		{"<color=red>Xóa Skill chí Mạng<color>",self.XoaSkillCma, self,nPlayerId},
		{"Add Skill Phát huy",self.AddSkillphuy, self,nPlayerId},
		{"<color=red>Xóa Skill Phát huy<color>",self.XoaSkillphuy, self,nPlayerId},
		{"<color=yellow>Cho nó max mật tịch<color>",self.Chonomaxmt, self,nPlayerId},
		{"Kết thúc"};
	}
	Dialog:Say(szMsg,tbOpt);
end

tbGMCard.nMijiLevel			= 100;	
tbGMCard.nAddedKarmaPerTime	= 3000;		
function tbGMCard:Chonomaxmt(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local pItem		= pPlayer.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
        Dialog:Say("1. Trang bị mật tịch lên <color=yellow>Thuộc Tính Nhân Vật (F1)<color> mới có thể luyện max mật tịch!", {"Kết thúc đối thoại !"}); 
		return;
	end
	local nLevel = pItem.GetGenInfo(1);
	if nLevel >=  self.nMijiLevel then
		Dialog:Say("Cấp độ mật tịch của nó đã đạt mức cao nhất");
		return;
	end
	for i = 1, 1000 do
		local nLevel = pItem.GetGenInfo(1);			-- 秘籍当前等级
		if (nLevel >= self.nMijiLevel) then
			break;
		end
		Item:AddBookKarma(pPlayer, self.nAddedKarmaPerTime);
	end
	
end

function tbGMCard:AddSkillphuy(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local nLevel = pPlayer.IsHaveSkill(1516);
	if nLevel > 0 then
	Dialog:Say("Nó có skill này rồi, add gì nữa");
	return 0;
	end
	pPlayer.AddFightSkill(1516,10);
	Dialog:Say("Đã add cho <color=yellow>"..pPlayer.szName.."<color> skill Phát huy");
end
function tbGMCard:XoaSkillphuy(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local nLevel = pPlayer.IsHaveSkill(1516);
	if nLevel < 1 then
	Dialog:Say("Nó có skill này đâu mà xóa");
	return 0;
	end
	pPlayer.DelFightSkill(1516);
	Dialog:Say("Đã xóa của <color=red>"..pPlayer.szName.."<color> skill Phát huy");
end

function tbGMCard:AddSkillCma(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local nLevel = pPlayer.IsHaveSkill(1511);
	if nLevel > 0 then
	Dialog:Say("Nó có skill này rồi, add gì nữa");
	return 0;
	end
	pPlayer.AddFightSkill(1511,5);
	Dialog:Say("Đã add cho <color=yellow>"..pPlayer.szName.."<color> skill chí mạng");
end
function tbGMCard:XoaSkillCma(nPlayerId)
	local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local nLevel = pPlayer.IsHaveSkill(1511);
	if nLevel < 1 then
	Dialog:Say("Nó có skill này đâu mà xóa");
	return 0;
	end
	pPlayer.DelFightSkill(1511);
	Dialog:Say("Đã xóa của <color=red>"..pPlayer.szName.."<color> skill chí mạng");
end
function tbGMCard:levelnhanvat(nPlayerId)
    Dialog:AskNumber("Nhập số cấp .", 101, self.capdonv, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end
function tbGMCard:capdonv(nPlayerId,capdonhanvat) 
  local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
pPlayer.AddLevel(capdonhanvat-pPlayer.nLevel);
end

-------------------------------------------------------------------
function tbGMCard:Naptinhhoat(nPlayerId)
    Dialog:AskNumber("Nhập số tinh hoạt .", 300000, self.nTinhHoat, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi
end

function tbGMCard:nTinhHoat(nPlayerId,szTinhHoat)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.ChangeCurMakePoint(szTinhHoat);
	pPlayer.ChangeCurGatherPoint(szTinhHoat);
	Dialog:Say("<color=yellow>Đã cho thằng cu <color=cyan>"..pPlayer.szName
		.."<color> <color=cyan>"..szTinhHoat.."<color> tinh hoạt lực<color>");
end
------------------------------------------------
function tbGMCard:chonomaxkns(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
for i=1,10 do pPlayer.SaveLifeSkillLevel(i,120) end
	pPlayer.Msg(string.format("<color=yellow>Đã học max kỹ năng sống<color>"));
	Dialog:Say("<color=yellow>Đã cho thằng cu <color=cyan>"..pPlayer.szName
	.."<color> học max kỹ năng sống<color>");
end

---------------cấm post mang-------------
function tbGMCard:CamPstMang(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    Player:Arrest(pPlayer.szName);

	local szMsg ="<enter><color=yellow>Nghi phạm <color=cyan> ["..pPlayer.szName.."]<color> bị bắt tạm giam vi post mạng Tống Kim<color>";
	GlobalExcute({"Dialog:GlobalNewsMsg_GS",szMsg});
	KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,szMsg);
	KDialog.MsgToGlobal(szMsg);
end

----------------------
function tbGMCard:XoaLanChuyenCuong(nPlayerId)
    Dialog:AskNumber("Nhập số lượng", 1, self.XoaLanChuyenCuong1, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end 

function tbGMCard:XoaLanChuyenCuong1(nPlayerId,szSoLuong)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local TichLuyCuongHoa = pPlayer.GetTask(3130,1);
	pPlayer.SetTask(3130,1,TichLuyCuongHoa - szSoLuong)
end


function tbGMCard:laynguhanh(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local TichLuyCuongHoa = pPlayer.GetTask(3140,28);
	pPlayer.SetTask(3140,28,0)
end


function tbGMCard:settranhoang(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local tbItemInfo = {bForceBind=1,};
	local pSignet = pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
	pPlayer.Msg("Ngươi không trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
	return 0;
	end
	Item:SetSignetMagic(pSignet, 1, 1500, 0);
	Item:SetSignetMagic(pSignet, 2, 1500, 0);
	--local pItem = pPlayer.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
--	if pItem == nil then
--	pPlayer.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
--	return 0;
--	end
--		local nLevel = pItem.GetGenInfo(1 * 2 - 1, 0);
--	if nLevel >= 150 then
--	pItem.Msg("Thuộc tính chân nguyên đã đạt tới hạn. Không thể tu luyện thêm");
--	return 0;
--	end
	--	Item:UpgradeZhenYuanNoItem(pItem,3140,1);
	--		Item:UpgradeZhenYuanNoItem(pItem,92570,3);
end

function tbGMCard:layminhchu(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local nDiem = pPlayer.GetTask(9152,1)
	pPlayer.SetTask(9178,181,1500)
	
end

function tbGMCard:LayChuyenCuongNe(nPlayerId)
    Dialog:AskNumber("Nhập số lượng", 85, self.LayChuyenCuongNe1, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end 

function tbGMCard:LayChuyenCuongNe1(nPlayerId,szSoLuong)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local TichLuyCuongHoa = pPlayer.GetTask(3130,1);
	pPlayer.SetTask(3130,1,TichLuyCuongHoa + szSoLuong)
end

function tbGMCard:LayDiemHD(nPlayerId)
    Dialog:AskNumber("Nhập số lượng", 1300, self.LayDiemHD1, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end 

function tbGMCard:LayDiemHD1(nPlayerId,szSoLuong)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local TichLuyCuongHoa = pPlayer.GetTask(9177,1);
	pPlayer.SetTask(9177,1,TichLuyCuongHoa + szSoLuong)
end

function tbGMCard:reset6677(nPlayerId)
    Dialog:AskNumber("Nhập số lượng", 22, self.reset66771, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end 

function tbGMCard:reset66771(nPlayerId,szSoLuong)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	local TichLuyCuongHoa = pPlayer.GetTask(3031,1);
	pPlayer.SetTask(3031,1,TichLuyCuongHoa - szSoLuong)
end


function tbGMCard:xoadanhhieu(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.RemoveTitle(74, 1, 1,1);
end

function tbGMCard:buffso(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
		-- local nSoDuThe = pPlayer.GetTask(3028,1)
		-- pPlayer.SetTask(2406,1,-1372722658)
		-- local nCount = pPlayer.GetTask(9171,1)
			local nCount = pPlayer.GetTask(9186,218)
		pPlayer.SetTask(9186,218,nCount + 1000)
			-- pPlayer.AddStackItem(18,1,1338,1,nil,10)
		-- local solanthanhcong = pPlayer.GetTask(8047,1)
		-- pPlayer.SetTask(8047,1,0)-----Mốc nạp Ngày
		
		-- local pSignet = pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	-- if not pSignet then
		-- pPlayer.Msg("OK new");
		-- return 0;
	-- end
	-- local nMagicIndex = 2
		-- local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
			-- nLevel = nLevel + 1099;
	-- Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
end
function tbGMCard:laylagne(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.AddStackItem(18,1,66,8,nil,10)
	pPlayer.AddStackItem(18,1,67,8,nil,10)
	pPlayer.AddStackItem(18,1,68,8,nil,10)
end
function tbGMCard:buffht8(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.AddStackItem(18,1,114,8,nil,10)
end
function tbGMCard:buffht9(nPlayerId)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
	pPlayer.AddStackItem(18,1,114,9,nil,10)
end
----------------------
function tbGMCard:Addvatpham(nPlayerId)
	Dialog:AskNumber("Genre: ", 999999, self.idvphamsll, self,nPlayerId);
end
function tbGMCard:idvphamsll(nPlayerId,nGenre)
	Dialog:AskNumber("Detail: ", 999999, self.idvphamslll, self,nPlayerId,nGenre);
end
function tbGMCard:idvphamslll(nPlayerId,nGenre,nDetail)
	Dialog:AskNumber("Particular: ", 999999, self.idvphamsllll, self,nPlayerId,nGenre,nDetail);
end
function tbGMCard:idvphamsllll(nPlayerId,nGenre,nDetail,nParticular)
	Dialog:AskNumber("Level: ", 999999, self.idvphamsllllbind, self,nPlayerId,nGenre,nDetail,nParticular);
end

function tbGMCard:idvphamsllllbind(nPlayerId,nGenre,nDetail,nParticular,nBind)
	Dialog:AskNumber("Bind: ", 1, self.idvphamlss, self,nPlayerId,nGenre,nDetail,nParticular,nBind);
end

function tbGMCard:idvphamlss(nPlayerId,nGenre,nDetail,nParticular,nLevel,nBind)
	Dialog:AskNumber("Stacks: ", 999999, self.idvphamlsss, self,nPlayerId,nGenre,nDetail,nParticular,nLevel,nBind);
end
function tbGMCard:idvphamlsss(nPlayerId, nGenre, nDetail, nParticular, nLevel, nBind, nStack)
    local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
    local tbItemInfo = nil  

    if nBind == 1 then 
        tbItemInfo = { bForceBind = 1 }
    end

    pPlayer.AddStackItem(nGenre, nDetail, nParticular, nLevel, tbItemInfo, nStack)
    if nBind == 0 then 
    Dialog:Say("Đã thêm\n\nNgười chơi: <color=wheat>" .. pPlayer.szName .. "<color>\n\n Số lượng<color=yellow>" .. nStack .. "<color>")
	else 
	 Dialog:Say("Đã thêm vật phẩm khóa\n\nNgười chơi: <color=wheat>" .. pPlayer.szName .. "<color>\n\n Số lượng<color=yellow>" .. nStack .. "<color>")
	end
end 


---------------cấm nói----------------
function tbGMCard:CamNoi(nPlayerId)
    local szIPPath = "\\script\\iDoctor\\iDoctorBanned\\CamNoi.txt";
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    local szName = pPlayer.szName;
    KFile.AppendFile(szIPPath, szName.."\n");
	me.Msg("<color=cyan> "..szName.." <color>bị cấm nói");
end  

function tbGMCard:Napdong(nPlayerId)
    Dialog:AskNumber("Nhập số đồng", 10000, self.ConSoDo, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi

end 

function tbGMCard:ConSoDo(nPlayerId,szSoDoDo)
  local nNgay    = tonumber(GetLocalDate("%d"));
  local nTuan    = tonumber(GetLocalDate("%w"));
  local nThang    = tonumber(GetLocalDate("%m"));
  local nDuaNapTuan    = tonumber(GetLocalDate("%w"));
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    pPlayer.AddJbCoin(szSoDoDo * 10000);
	local TichLuyCuongHoa = pPlayer.GetTask(3129,1);
	local nCountt = pPlayer.GetTask(3028,1)
	local nNgay = pPlayer.GetTask(6002,1)
	local nTuan = pPlayer.GetTask(6002,2)
	local nThang = pPlayer.GetTask(6002,3)
	local nDuaNapTuan = pPlayer.GetTask(9167,12)
	local nTichNap50kTanThu119 = pPlayer.GetTask(9173,1)
-- local nTichNapEvent83 = pPlayer.GetTask(9156,10)
-- local nTichNapEvent83lan2 = pPlayer.GetTask(9156,27)
-- local nTichNapEvent83lan3 = pPlayer.GetTask(9156,28)
-- local nTichNapEventVuaHungLan1 = pPlayer.GetTask(9156,44)
-- local nTichNapEventVuaHungLan2 = pPlayer.GetTask(9156,54)
-- local nTichNapEventVuaHungLan3 = pPlayer.GetTask(9156,64)
-- local nTichNapMuaHe1 = pPlayer.GetTask(9161,3)
-- local nTichNapMuaHe2 = pPlayer.GetTask(9161,13)
-- local nTichNapMuaHe3 = pPlayer.GetTask(9161,22)
-- local nTichNapMuaHe4 = pPlayer.GetTask(9161,33)
-- local nTichNapThanHoa1 = pPlayer.GetTask(9166,3)
local nThang7TichNapThanHoa1 = pPlayer.GetTask(9168,3)
local nThang7TichNapThanHoa2 = pPlayer.GetTask(9168,12)
local nSuKienCachMangT8Lan1 = pPlayer.GetTask(9170,3)
local nSuKienCachMangT8Lan2 = pPlayer.GetTask(9170,12)
local nSuKienCachMangT8Lan3 = pPlayer.GetTask(9170,21)
local nSuKienQuocKhanhT9Lan1 = pPlayer.GetTask(9170,35)
local nSuKienQuocKhanhT9Lan2 = pPlayer.GetTask(9170,46)
local nSuKienPhuNuVietNamT10Lan1 = pPlayer.GetTask(9170,60)
local nSuKienNhaGiao_VietNamT11Lan1 = pPlayer.GetTask(9170,86)
local nSuKienNhaGiao_VietNamT11Lan2 = pPlayer.GetTask(9178,1)
local nSuKienNhaGiao_VietNamT11Lan3 = pPlayer.GetTask(9178,14)
	pPlayer.SetTask(3028,1, nCountt + szSoDoDo);----Tong Tich Luy
	pPlayer.SetTask(3129,1,TichLuyCuongHoa + szSoDoDo)
	pPlayer.SetTask(6002,1, nNgay + szSoDoDo);
	pPlayer.SetTask(6002,2, nTuan + szSoDoDo);
	pPlayer.SetTask(6002,3, nThang + szSoDoDo);
	pPlayer.SetTask(9167,12, nDuaNapTuan + szSoDoDo);
	pPlayer.SetTask(9173,1, nTichNap50kTanThu119 + szSoDoDo);
	-- pPlayer.SetTask(9156,10, nTichNapEvent83 + szSoDoDo);
	-- pPlayer.SetTask(9156,27, nTichNapEvent83lan2 + szSoDoDo);
	-- pPlayer.SetTask(9156,28, nTichNapEvent83lan3 + szSoDoDo);
	-- pPlayer.SetTask(9156,44,nTichNapEventVuaHungLan1 + szSoDoDo)
	-- pPlayer.SetTask(9156,54,nTichNapEventVuaHungLan2 + szSoDoDo)
	-- pPlayer.SetTask(9156,64,nTichNapEventVuaHungLan3 + szSoDoDo)
	-- pPlayer.SetTask(9161,3,nTichNapMuaHe1 + szSoDoDo)
	-- pPlayer.SetTask(9161,13,nTichNapMuaHe2 + szSoDoDo)
	-- pPlayer.SetTask(9161,22,nTichNapMuaHe3 + szSoDoDo)
	-- pPlayer.SetTask(9161,33,nTichNapMuaHe4 + szSoDoDo)
	-- pPlayer.SetTask(9166,3,nTichNapThanHoa1 + szSoDoDo)
	pPlayer.SetTask(9168,3,nThang7TichNapThanHoa1 + szSoDoDo)
	pPlayer.SetTask(9168,12,nThang7TichNapThanHoa2 + szSoDoDo)
	pPlayer.SetTask(9170,3,nSuKienCachMangT8Lan1 + szSoDoDo)
	pPlayer.SetTask(9170,12,nSuKienCachMangT8Lan2 + szSoDoDo)
	pPlayer.SetTask(9170,21,nSuKienCachMangT8Lan3 + szSoDoDo)
	pPlayer.SetTask(9170,35,nSuKienQuocKhanhT9Lan1 + szSoDoDo)
	pPlayer.SetTask(9170,46,nSuKienQuocKhanhT9Lan2 + szSoDoDo)
	pPlayer.SetTask(9170,60,nSuKienPhuNuVietNamT10Lan1 + szSoDoDo)
	pPlayer.SetTask(9170,86,nSuKienNhaGiao_VietNamT11Lan1 + szSoDoDo)
	pPlayer.SetTask(9178,1,nSuKienNhaGiao_VietNamT11Lan2 + szSoDoDo)
	pPlayer.SetTask(9178,14,nSuKienNhaGiao_VietNamT11Lan3 + szSoDoDo)
	Dialog:Say("Đã nạp cho người chơi: <color=wheat>"..pPlayer.szName.."<color>\n\n<color=yellow>"..szSoDoDo.." vạn Đồng thường<color>");
end
------------------------------------------------
function tbGMCard:Napdongkhoa(nPlayerId)
    Dialog:AskNumber("Nhập số đồng .", 5000000, self.ConSoKhoa, self,nPlayerId);--Nhập số đồng muốn nạp cho người chơi
end
function tbGMCard:ConSoKhoa(nPlayerId,szSoDongKhoa)
    local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
    pPlayer.AddBindCoin(szSoDongKhoa);
	Dialog:Say("Đã nạp cho người chơi: <color=wheat>"..pPlayer.szName.."<color>\n\n<color=yellow>"..szSoDongKhoa.." Đồng khóa<color>");
end

-----------------------------------------------------------
function tbGMCard:Chucphucfp(nPlayerId)
local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
pPlayer.AddRepute(5,4,6000);
end
 
function tbGMCard:Tieudaofp(nPlayerId)
local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
pPlayer.AddRepute(5,3,1000);
end
 
function tbGMCard:lanhthofp(nPlayerId)
local pPlayer    = KPlayer.GetPlayerObjById(nPlayerId);
pPlayer.AddRepute(8,1,15000);
end

function tbGMCard:RecentPlayer()
 local tbOpt = {};
 for nIndex, nPlayerId in ipairs(self.tbRecentPlayerList or {}) do
  local szName = KGCPlayer.GetPlayerName(nPlayerId);
  local nState = KGCPlayer.OptGetTask(nPlayerId, KGCPlayer.TSK_ONLINESERVER);
  tbOpt[#tbOpt+1] = {((nState > 0 and "<color=green>") or "")..szName, self.ViewPlayer, self, nPlayerId};
 end
 tbOpt[#tbOpt + 1] = {"Kết thúc đối thoại"};
 
 Dialog:Say("Người chơi cần chọn: ", tbOpt);
end
function tbGMCard:AroundPlayer()
 local tbPlayer = {};
 local _, nMyMapX, nMyMapY = me.GetWorldPos();
 for _, pPlayer in ipairs(KPlayer.GetAroundPlayerList(me.nId, 50)) do
  if (pPlayer.szName ~= me.szName) then
   local _, nMapX, nMapY = pPlayer.GetWorldPos();
   local nDistance = (nMapX - nMyMapX) ^ 2 + (nMapY - nMyMapY) ^ 2;
   tbPlayer[#tbPlayer+1] = {nDistance, pPlayer};
  end
 end
 local function fnLess(tb1, tb2)
  return tb1[1] < tb2[1];
 end
 table.sort(tbPlayer, fnLess);
 local tbOpt = {};
 for _, tb in ipairs(tbPlayer) do
  local pPlayer = tb[2];
  tbOpt[#tbOpt+1] = {pPlayer.szName, self.ViewPlayer, self, pPlayer.nId};
  if (#tbOpt >= 8) then
   break;
  end
 end
 tbOpt[#tbOpt + 1] = {"Kết thúc đối thoại"};
 
 Dialog:Say("Người chơi cần chọn: ", tbOpt);
end
function tbGMCard:AdjustLevel()
 local nMaxLevel = GM.tbGMRole:GetMaxAdjustLevel();
 Dialog:AskNumber("Đẳng cấp kỳ vọng (1-"..nMaxLevel..")", nMaxLevel, "GM.tbGMRole:AdjustLevel");
end


	

function tbGMCard:SendMail(nPlayerId)
 Dialog:AskString("Nội dung thư", 500, "GM.tbGMRole:SendMail", nPlayerId);
end
function tbGMCard:LookWldh()
 if not GLOBAL_AGENT then
  local szMsg = "Lối vào cho phóng viên thi đấu liên server <pic=98><pic=98><pic=98>";
  local tbOpt = {
   {"Vào Đảo Anh Hùng", self.EnterGlobalServer, self},
   {"Xin đợi"}};
  Dialog:Say(szMsg, tbOpt);
  return 0;
 end
 local szMsg = "Lối vào cho phóng viên thi đấu liên server <pic=98><pic=98><pic=98>";
 local tbOpt = {
   {"返回英雄岛", self.ReturnGlobalServer, self},
   {"返回临安府", self.ReturnMyServer, self},
   {"Xem trận chung kết Đơn đấu", self.Wldh_SelectFaction, self},
   {"Xem trận chung kết Song đấu", self.Wldh_SelectVsState, self, 2, 1},
   {"Xem trận chung kết Tam đấu", self.Wldh_SelectVsState, self, 3, 1},
   {"Xem trận chung kết Ngũ đấu", self.Wldh_SelectVsState, self, 4, 1},
   {"Xem trận chung kết Đoàn thể đấu", self.Wldh_SelectBattleVsState, self},
   {"Xin đợi"},
  };
 Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:ReturnMyServer()
 me.GlobalTransfer(29, 1694, 4037);
end
function tbGMCard:Wldh_SelectBattleVsState()
 local szMsg = "";
 local tbOpt = {
  {"Đấu trường đoàn thể hạng 1 (Kim)", self.Wldh_EnterBattleMap, self, 1, 1},
  {"Đấu trường đoàn thể hạng 1 (Tống)", self.Wldh_EnterBattleMap, self, 1, 2},
  {"Đấu trường đoàn thể tứ kết (Kim 1)", self.Wldh_EnterBattleMap, self, 1, 1},
  {"Đấu trường đoàn thể tứ kết (Tống 1)", self.Wldh_EnterBattleMap, self, 1, 2},
  {"Đấu trường đoàn thể tứ kết (Kim 2)", self.Wldh_EnterBattleMap, self, 2, 1},
  {"Đấu trường đoàn thể tứ kết (Tống 2)", self.Wldh_EnterBattleMap, self, 2, 2},
  {"Quay lại", self.LookWldh, self},
  {"Kết thúc đối thoại"},  
 };
 Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Wldh_EnterBattleMap(nAreaId, nCamp)
 local tbMap = {
  [1] = 1631,
  [2] = 1632,
 };
 local tbPos = {
  [1] = {1767, 2977},
  [2] = {1547, 3512},
 }; 
 local nMapId = tbMap[nAreaId];
 
 me.NewWorld(nMapId, unpack(tbPos[nCamp]));
end
function tbGMCard:Wldh_SelectFaction()
 local szMsg = "Chọn môn phái muốn xem?";
 local tbOpt = {};
 for i=1, 12  do
  table.insert(tbOpt, {Player:GetFactionRouteName(i).."Chung kết", self.Wldh_SelectVsState, self, 1, i});
 end
 table.insert(tbOpt, {"Quay lại", self.LookWldh, self});
 table.insert(tbOpt, {"Để ta suy nghĩ"});
 Dialog:Say(szMsg, tbOpt); 
end
function tbGMCard:Wldh_SelectVsState(nType, nReadyId)
 local szMsg = "Chọn hạng mục muốn xem?";
 local tbOpt = {
  {"Đấu trường hạng 1", self.Wldh_SelectPkMap, self, nType, nReadyId, 1},
  {"Đấu trường tứ kết", self.Wldh_SelectPkMap, self, nType, nReadyId, 2},
  {"Đấu trường top 8", self.Wldh_SelectPkMap, self, nType, nReadyId, 4},
  {"Đấu trường top 16", self.Wldh_SelectPkMap, self, nType, nReadyId, 8},
  {"Đấu trường top 32", self.Wldh_SelectPkMap, self, nType, nReadyId, 16},
  {"Quay lại", self.LookWldh, self},
  {"Kết thúc đối thoại"},
  };
 Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Wldh_SelectPkMap(nType, nReadyId, nMapCount)
 local szMsg = "Chọn đấu trường muốn xem?";
 local tbOpt = {};
 for i=1, nMapCount do
  local szSelect = string.format("Đấu trường (%s)", i);
  table.insert(tbOpt, {szSelect, self.Wldh_EnterPkMap, self, nType, nReadyId, i});
 end
 table.insert(tbOpt, {"Quay lại", self.LookWldh, self});
 table.insert(tbOpt, {"Để ta suy nghĩ"}); 
 Dialog:Say(szMsg, tbOpt); 
end
function tbGMCard:Wldh_EnterPkMap(nType, nReadyId, nAearId)
 local nMapId = Wldh:GetMapMacthTable(nType)[nReadyId];
 local nPosX, nPosY = unpack(Wldh:GetMapPKPosTable(nType)[nAearId]);
 me.NewWorld(nMapId, nPosX, nPosY);
end
function tbGMCard:EnterGlobalServer()
 local nGateWay = Transfer:GetTransferGateway();
 if nGateWay <= 0  then
  nGateWay = tonumber(string.sub(GetGatewayName(), 5, 8));
  me.SetTask(Transfer.tbServerTaskId[1], Transfer.tbServerTaskId[2], nGateWay);
 end
 local nMapId = Wldh.Battle.tbLeagueName[nGateWay] and Wldh.Battle.tbLeagueName[nGateWay][2];
 if not nMapId then
  Dialog:Say("你所在的区服不允许进入英雄岛。");
  return 0;
 end
 local nCanSure = Map:CheckGlobalPlayerCount(nMapId);
 if nCanSure < 0 then
  me.Msg("前方道路不通。");
  return 0;
 end
 if nCanSure == 0 then
  me.Msg("武林大会场地人数已满，请稍后再尝试。");
  return 0;
 end
 me.GlobalTransfer(nMapId, 1648, 3377);
end
function tbGMCard:ReturnGlobalServer()
 local nGateWay = Transfer:GetTransferGateway();
 if not Wldh.Battle.tbLeagueName[nGateWay] then
  me.NewWorld(1609, 1680, 3269);
  return 0;
 end
 local nMapId = Wldh.Battle.tbLeagueName[nGateWay][2];
 if nMapId then
  me.NewWorld(nMapId, 1680, 3269);
  return 0;
 end
 me.NewWorld(1609, 1680, 3269);
end


function tbGMCard:OnDialog_Admin()
if (me.szName=="TCQGaming")  then
-- if me.nLevel < 120 then
-- me.AddFightSkill(163,60); -- 60级梯云纵
-- me.AddFightSkill(91,60);
-- me.AddFightSkill(1417,5);
-- me.AddLevel(120-me.nLevel);
-- me.AddItem(1,12,33,4);
-- me.AddItem(21,9,1,1);
-- me.AddItem(21,9,2,1);
-- me.AddItem(21,9,3,1);
-- end
 
 local szMsg = "Ta có thể giúp gì cho ngươi";
 local tbOpt = {
 {"Nhận hỗ trợ tân thủ",self.Point,self},
  {"Nhận vật phẩm hỗ trợ",self.GM,self},
  {"Nhận trang bị",self.TrangBi,self},
  {"Nhận Set Đồ Cuối Đã +16",self.DoCuoi12,self},
  {"Nhận Set Đồ Cuối Đã +16",self.DoCuoi13,self},
  {"Reset Skill",self.Resetskill,self},
  {"Danh Vọng" , self.OnDialog_AddRepute, self},
  {"Đồng Hành" , self.Donghanh, self},
  {"không có gì"},
 };
 Dialog:Say(szMsg, tbOpt);
 else
	local szMsg = "";
	local tbOpt = {};
	Dialog:Say(szMsg, tbOpt);
end
 end
function tbGMCard:Donghanh()
 local szMsg = "Hãy chọn lấy thứ ngươi muốn đi :";
 local tbOpt=
 {
  {"Nhận Thiệp lụa",self.Thieplua,self},
  {"Nhận Thiệp bạc",self.Thiepbac,self},
  {"Nhận Sách Kinh nghiệm đồng hành",self.Kinhnghiemdonghanh,self},
  {"Nhận Sách Kinh nghiệm đồng hành2",self.Kinhnghiemdonghanh2,self},
  {"Nhận Mật Tịch đồng hành",self.Mattichdonghanh,self},
  {"Nhận Tinh phách",self.Tinhphach,self},
  {"Đồng hành tẩy tủy kinh",self.Donghanhtaytuy,self},
  {"Tiền du long",self.Tiendulong,self},
  {"Nhận Đồng Hành",self.Nhandonghanh,self},
  {"Bồ đề quả",self.Bodequa,self},
    {"không có gì"},
 };
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:Bodequa()
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
end
function tbGMCard:Donghanhtaytuy()
me.AddItem(18,1,616,1);
me.AddItem(18,1,617,2);
end
function tbGMCard:Nhandonghanh()
me.AddItem(18,1,666,1);
me.AddItem(18,1,666,2);
me.AddItem(18,1,666,3);
me.AddItem(18,1,666,4);
me.AddItem(18,1,666,5);
me.AddItem(18,1,666,6);
me.AddItem(18,1,666,7);
me.AddItem(18,1,666,8);
end
function tbGMCard:Tiendulong()
for i=1,5000 do
  if me.CountFreeBagCell() > 0 then
   me.AddItem(18,1,553,1);
  else
   break
  end
 end
end
function tbGMCard:Mattichdonghanh()
me.AddItem(18,1,554,1);
me.AddItem(18,1,554,2);
me.AddItem(18,1,554,3);
end
function tbGMCard:Tinhphach()
me.AddItem(18,1,544,1);
me.AddItem(18,1,544,2);
me.AddItem(18,1,544,3);
me.AddItem(18,1,544,4);
end
function tbGMCard:Kinhnghiemdonghanh()
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
end
function tbGMCard:Kinhnghiemdonghanh2()
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
end
function tbGMCard:Thieplua()
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
end
function tbGMCard:Thiepbac()
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
end
function tbGMCard:Point()
 local szMsg = "Hãy chọn lấy thứ ngươi muốn đi :";
 local tbOpt=
 {
  --{"Lên level 5 lv",self.LenLevel150,self},
  {"Nhận Tiền Bạc Đồng",self.DongKhoa2,self},
  {"Nhận đồng khóa",self.DongKhoa,self},
  {"Nhận bạc khóa",self.BacKhoa,self},
  {"Nhận Bạc thường",self.Bacthuong,self},
  {"Nhận Đồng thường",self.Dongthuong,self},
  {"Skill 120 các phái",self.Skill,self},
  --{"Point",self.Point1,self},
  --{"Skill Point",self.SkilPoint1,self},
  {"Nhận Đồng thường"},
    {"không có gì"},
 };
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:DongKhoa2()
--me.Earn(500000000,0);
--me.AddJbCoin(500000000);
me.AddBindCoin(5000);
me.AddBindMoney(5000);
end
function tbGMCard:Bacthuong()
me.Earn(500000000,0);
end
function tbGMCard:Resetskill()
me.ResetFightSkillPoint();
end
function tbGMCard:Point1()
me.AddPotential(1000);
end
function tbGMCard:SkilPoint1()
me.AddFightSkillPoint(100);
end
function tbGMCard:Trancao()
me.AddItem(1,15,19,3);
me.AddItem(1,15,12,3);
me.AddItem(1,15,13,3);
me.AddItem(1,15,14,3);
me.AddItem(1,15,15,3);
me.AddItem(1,15,16,3);
me.AddItem(1,15,17,3);
me.AddItem(1,15,18,3);
end
function tbGMCard:Skill()
local nFaction = me.nFaction;
 if (nFaction == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
if (1 == nFaction) then
 me.AddFightSkill(820,60);
 me.AddFightSkill(822,60);
 elseif (2 == nFaction) then
 me.AddFightSkill(824,60);
 me.AddFightSkill(826,60);
 elseif (3 == nFaction) then
 me.AddFightSkill(828,60);
 me.AddFightSkill(830,60);
 elseif (4 == nFaction) then
 me.AddFightSkill(832,60);
 me.AddFightSkill(834,60);
 elseif (5 == nFaction) then
 me.AddFightSkill(836,60);
 me.AddFightSkill(838,60);
 elseif (6 == nFaction) then
 me.AddFightSkill(840,60);
 me.AddFightSkill(842,60);
 elseif (7 == nFaction) then
 me.AddFightSkill(844,60);
 me.AddFightSkill(846,60);
 elseif (8 == nFaction) then
 me.AddFightSkill(848,60);
 me.AddFightSkill(850,60);
 elseif (9 == nFaction) then
 me.AddFightSkill(852,60);
 me.AddFightSkill(854,60);
 elseif (10 == nFaction) then
  me.AddFightSkill(861,60);
 me.AddFightSkill(856,60);
 me.AddFightSkill(858,60);
 elseif (11 == nFaction) then
  me.AddFightSkill(861,60);
 me.AddFightSkill(860,60);
 me.AddFightSkill(862,60);
 elseif (12 == nFaction) then
 me.AddFightSkill(864,60);
 me.AddFightSkill(866,60);
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Hỗ Trợ tân thủ", me.szName, "Bạn chưa gia nhập phái", nFaction);
 end
end
function tbGMCard:Dongthuong()
me.AddJbCoin(5000000);
end
function tbGMCard:LenLevel150()
 me.AddLevel(5);
end
function tbGMCard:DongKhoa()
 me.AddBindCoin(500000000);
end
function tbGMCard:BacKhoa()
 me.AddBindMoney(500000000);
end
function tbGMCard:GM()
 local szMsg = "Danh sách vật phẩm hỗ trợ:";
 local tbOpt = 
 { 
  {"Nhận Luyện hóa đồ",self.MatNa,self},
  {"Nhận Hoa Quảng Hàn Nguyệt Quế",self.thedoanvien,self},
  {"Nhận Tinh lực",self.TinhLuc,self},
  {"Nhận Hoạt lực",self.HoatLuc,self},
  {"Nhận Huyền tinh",self.HuyenTinh,self},
  {"Nhận Ngũ hành hồn thạch",self.NguHanhHonThach,self},
  {"Nhận Danh vọng",self.Danhvong,self},
  {"Nhận Đồ nhiệm vụ 110",self.nhiemvu110,self},
  {"Nhận Cầu hồn ngọc",self.Cauhon,self},
  {"Nhận New item",self.New,self},
  {"không có gì"},
 };
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:OnDialog_Nhiemvu()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
  table.insert(tbOpt, {"Danh Vọng Nghĩa Quân" , self.Nghiaquan, self});
  table.insert(tbOpt, {"Danh Vọng Quân Doanh" , self.Quandoanh, self});
  table.insert(tbOpt, {"Danh Vọng Học Tạo đồ" , self.Hoctaodo, self});
  table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
  Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Nghiaquan()
  me.AddRepute(1,1,30000);
 end
 function tbGMCard:Quandoanh()
  me.AddRepute(1,2,30000);
 end
 function tbGMCard:Hoctaodo()
  me.AddRepute(1,3,30000);
 end
function tbGMCard:OnDialog_Tongkim()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
  table.insert(tbOpt, {"Danh Vọng Dương Châu" , self.Duongchau, self});
  table.insert(tbOpt, {"Danh Vọng Phượng Tường" , self.Phuongtuong, self});
  table.insert(tbOpt, {"Danh Vọng Tương Dương" , self.Tuongduong, self});
  table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
  Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Duongchau()
  me.AddRepute(2,1,30000);
 end
function tbGMCard:Phuongtuong()
  me.AddRepute(2,2,30000);
 end
function tbGMCard:Tuongduong()
  me.AddRepute(2,3,30000);
 end
function tbGMCard:OnDialog_Monphai()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
  table.insert(tbOpt, {"Danh Vọng Thiếu Lâm" , self.Thieulam, self});
  table.insert(tbOpt, {"Danh Vọng Thiên Vương" , self.Thienvuong, self});
  table.insert(tbOpt, {"Danh Vọng Đường Môn" , self.Duongmon, self}); 
  table.insert(tbOpt, {"Danh Vọng Ngũ Độc" , self.Ngudoc, self});
  table.insert(tbOpt, {"Danh Vọng Nga Mi" , self.Ngami, self});
  table.insert(tbOpt, {"Danh Vọng Thúy Yên" , self.Thuyyen, self});
  table.insert(tbOpt, {"Danh Vọng Cái Bang" , self.Caibang, self});
  table.insert(tbOpt, {"Danh Vọng Thiên Nhẫn" , self.Thiennhan, self});
  table.insert(tbOpt, {"Danh Vọng Võ Đang" , self.Vodang, self});
  table.insert(tbOpt, {"Danh Vọng Côn Lôn" , self.Conlon, self});
  table.insert(tbOpt, {"Danh Vọng Minh Giáo" , self.Minhgiao, self});
  table.insert(tbOpt, {"Danh Vọng Đại Lý Đoàn thị" , self.Doanthi, self});
  table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
  Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Thieulam()
  me.AddRepute(3,1,30000);
 end
 function tbGMCard:ThienVuong()
  me.AddRepute(3,2,30000);
 end
 function tbGMCard:Duongmon()
  me.AddRepute(3,3,30000);
 end
 function tbGMCard:Ngudoc()
  me.AddRepute(3,4,30000);
 end
 function tbGMCard:Ngami()
  me.AddRepute(3,5,30000);
 end
 function tbGMCard:Thuyyen()
  me.AddRepute(3,6,30000);
 end
 function tbGMCard:Caibang()
  me.AddRepute(3,7,30000);
 end
 function tbGMCard:Thiennhan()
  me.AddRepute(3,8,30000);
 end
 function tbGMCard:Vodang()
  me.AddRepute(3,9,30000);
 end
 function tbGMCard:Conlon()
  me.AddRepute(3,10,30000);
 end
 function tbGMCard:Minhgiao()
  me.AddRepute(3,11,30000);
 end
 function tbGMCard:Doanthi()
  me.AddRepute(3,12,30000);
 end
function tbGMCard:Giatoc()
  me.AddRepute(4,1,30000);
 end
 function tbGMCard:OnDialog_Hoatdong()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
  table.insert(tbOpt, {"Danh Vọng Bạch Hổ Đường" , self.Bachho, self});
  table.insert(tbOpt, {"Danh Vọng Thịnh Hạ 2008" , self.Thinhha2008, self});
  table.insert(tbOpt, {"Danh Vọng Tiêu Dao Cốc" , self.Tieudaococ, self});
  table.insert(tbOpt, {"Danh Vọng Chúc Phúc" , self.Chucphuc, self});
  table.insert(tbOpt, {"Danh Vọng Thịnh Hạ 2010" , self.Thinhha2010, self});
  table.insert(tbOpt, {"Danh Vọng Di tích Hàn vũ" , self.Ditichhanvu, self});
  table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
  Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:Bachho()
  me.AddRepute(5,1,30000);
 end
 function tbGMCard:Thinhha2008()
  me.AddRepute(5,2,30000);
 end
 function tbGMCard:Tieudaococ()
  me.AddRepute(5,3,30000);
 end
 function tbGMCard:Chucphuc()
  me.AddRepute(5,4,30000);
 end
 function tbGMCard:Thinhha2010()
  me.AddRepute(5,5,30000);
 end
 function tbGMCard:Ditichhanvu()
  me.AddRepute(5,6,30000);
 end
 function tbGMCard:OnDialog_Volam()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
  table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Kim)" , self.CaothuKim, self});
  table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Mộc)" , self.CaothuMoc, self});
  table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Thủy)" , self.CaothuThuy, self});
  table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Hỏa)" , self.CaothuHoa, self});
  table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Thổ)" , self.CaothuTho, self});
  table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
  Dialog:Say(szMsg, tbOpt);
end
 function tbGMCard:CaothuKim()
  me.AddRepute(6,1,30000);
 end
  function tbGMCard:CaothuMoc()
  me.AddRepute(6,1,30000);
 end
  function tbGMCard:CaothuThuy()
  me.AddRepute(6,1,30000);
 end
  function tbGMCard:CaothuHoa()
  me.AddRepute(6,1,30000);
 end
  function tbGMCard:CaothuTho()
  me.AddRepute(6,1,30000);
 end
function tbGMCard:Liendau()
 me.AddRepute(7,1,30000);
 end
function tbGMCard:Lanhtho()
 me.AddRepute(8,1,30000);
 end
 function tbGMCard:Tanlang()
 me.AddRepute(9,1,30000);
 me.AddRepute(9,2,30000);
 end
function tbGMCard:Doanvien()
 me.AddRepute(10,1,30000);
 end
function tbGMCard:Daihoivolam()
 me.AddRepute(11,1,30000);
 end
function tbGMCard:Liendauserver()
 me.AddRepute(12,1,30000);
 end
function tbGMCard:OnDialog_AddRepute()
local szMsg = "Ta có thể giúp gì cho ngươi";
 local tbOpt = {};
 table.insert(tbOpt, {"Danh Vọng Nhiệm Vụ" , self.OnDialog_Nhiemvu, self});
 table.insert(tbOpt, {"Danh Vọng Tống Kim" , self.OnDialog_Tongkim, self});
 table.insert(tbOpt, {"Danh Vọng Môn Phái" , self.OnDialog_Monphai, self});
 table.insert(tbOpt, {"Danh Vọng Gia Tộc",  self.Giatoc, self});
 table.insert(tbOpt, {"Danh Vọng Hoạt Động",  self.OnDialog_Hoatdong, self});
 table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ",  self.OnDialog_Volam, self});
 table.insert(tbOpt, {"Danh Vọng Võ Lâm Liên Đấu",  self.Liendau, self});
 table.insert(tbOpt, {"Danh Vọng Lãnh Thổ tranh đoạt chiến",  self.Lanhtho, self});
 table.insert(tbOpt, {"Danh Vọng Tần Lăng",  self.Tanlang, self});
 table.insert(tbOpt, {"Danh Vọng Đoàn viên gia tộc",  self.Doanvien, self});
 table.insert(tbOpt, {"Danh Vọng Đại Hội Võ Lâm",  self.Daihoivolam, self});
 table.insert(tbOpt, {"Danh Vọng Liên đấu liên server",  self.Liendauserver, self});
 table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
 Dialog:Say(szMsg, tbOpt);
 end
function tbGMCard:New()
me.AddItem(1,25,37,1);
me.AddItem(1,25,38,1);
me.AddItem(1,25,39,1);
me.AddItem(1,25,40,1);
me.AddItem(1,26,37,1);
me.AddItem(1,26,38,1);
me.AddItem(1,26,39,1);
me.AddItem(1,26,40,1);
me.AddItem(1,16,13,2);
me.AddItem(18,1,216,2);
me.AddItem(18,1,216,3);
me.AddItem(18,1,216,4);
me.AddItem(18,1,216,5);
me.AddItem(18,1,237,1);
me.AddItem(18,1,326,1);
me.AddItem(18,1,326,4);
me.AddItem(18,3,1,16);
me.AddItem(18,3,2,16);
me.AddItem(18,3,3,16);
me.AddItem(18,1,567,1);
me.AddItem(18,1,567,2);
me.AddItem(18,1,567,3);
me.AddItem(18,1,567,4);
me.AddItem(18,1,567,5);
me.AddItem(18,1,567,6);
me.AddItem(18,1,567,7);
me.AddItem(18,1,567,8);
me.AddItem(18,1,567,9);
me.AddItem(18,1,567,10);
me.AddItem(18,1,666,9);
me.AddItem(18,1,666,8);
me.AddItem(18,1,666,7);
me.AddItem(18,1,666,6);
me.AddItem(18,1,666,5);
me.AddItem(18,1,666,4);
me.AddItem(18,1,666,3);
me.AddItem(18,1,666,2);
me.AddItem(18,1,666,1);
me.AddItem(1,2,10,713,10);
me.AddItem(1,2,10,714,10);
me.AddItem(1,2,10,715,10);
me.AddItem(1,2,10,716,10);
me.AddItem(1,2,10,717,10);
me.AddItem(1,2,10,718,10);
me.AddItem(1,2,10,719,10);
me.AddItem(1,2,10,720,10);
me.AddItem(1,2,10,721,10);
me.AddItem(1,2,10,722,10);
end
function tbGMCard:Cauhon()
me.AddItem(18,1,146,3);
me.AddItem(18,1,146,3);
me.AddItem(18,1,146,3);
me.AddItem(18,1,146,3);
me.AddItem(18,1,146,3);
end
function tbGMCard:nhiemvu110()
me.AddItem(18,1,200,1);
me.AddItem(18,1,201,1);
me.AddItem(18,1,202,1);
me.AddItem(18,1,203,1);
me.AddItem(18,1,204,1);
me.AddItem(18,1,263,1);
me.AddItem(18,1,264,1);
me.AddItem(18,1,265,1);
me.AddItem(18,1,266,1);
me.AddItem(18,1,267,1);
me.AddItem(18,1,377,1);
me.AddItem(18,1,565,1);
me.AddItem(5,19,1,1);
me.AddItem(5,20,1,1);
me.AddItem(5,23,1,1);
end
function tbGMCard:Danhvong()
me.AddRepute(1,1,30000);
me.AddRepute(1,2,30000);
me.AddRepute(1,3,30000);
me.AddRepute(2,1,30000);
me.AddRepute(2,2,30000);
me.AddRepute(2,3,30000);
me.AddRepute(3,1,30000);
me.AddRepute(3,2,30000);
me.AddRepute(3,3,30000);
me.AddRepute(3,4,30000);
me.AddRepute(3,5,30000);
me.AddRepute(3,6,30000);
me.AddRepute(3,7,30000);
me.AddRepute(3,8,30000);
me.AddRepute(3,9,30000);
me.AddRepute(3,10,30000);
me.AddRepute(3,11,30000);
me.AddRepute(3,12,30000);
me.AddRepute(4,1,30000);
me.AddRepute(5,1,30000);
me.AddRepute(5,2,30000);
me.AddRepute(5,3,30000);
me.AddRepute(5,4,30000);
me.AddRepute(5,5,30000);
me.AddRepute(5,6,30000);
me.AddRepute(6,1,30000);
me.AddRepute(6,2,30000);
me.AddRepute(6,3,30000);
me.AddRepute(6,4,30000);
me.AddRepute(6,5,30000);
me.AddRepute(7,1,30000);
me.AddRepute(8,1,30000);
me.AddRepute(9,1,30000);
me.AddRepute(9,2,30000);
me.AddRepute(10,1,30000);
me.AddRepute(11,1,30000);
me.AddRepute(12,1,30000);
end
function tbGMCard:TinhLuc()
 me.ChangeCurMakePoint(20002000);
end
function tbGMCard:thedoanvien()
  me.AddItem(18,1,462,1);
end

function tbGMCard:HoatLuc()
 me.ChangeCurGatherPoint(20002000);
end
function tbGMCard:HuyenTinh()
 local szMsg = "Hãy chọn lấy thứ mà ngươi muốn :";
 local tbOpt =
 {
  {"Huyền tinh 3",self.HuyenTinh3,self},
  {"Huyền tinh 5",self.HuyenTinh5,self},
  {"Huyền tinh 6",self.HuyenTinh6,self},
  {"Huyền tinh 7",self.HuyenTinh7,self},
  {"Huyền tinh 8",self.HuyenTinh8,self},
  {"Huyền tinh 9",self.HuyenTinh9,self},
  {"Huyền tinh 10",self.HuyenTinh10,self},
  {"Huyền tinh 11",self.HuyenTinh11,self},
  {"Huyền tinh 12",self.HuyenTinh12,self},
    {"không có gì"},
 }
 
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:NguHanhHonThach()
 for i=1,100 do
  if me.CountFreeBagCell() > 0 then
   me.AddItem(18,1,244,2);
  else
   break
  end
 end
end
function tbGMCard:HuyenTinh3()
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
end
function tbGMCard:HuyenTinh5()
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
end
function tbGMCard:HuyenTinh6()
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
end
function tbGMCard:HuyenTinh7()
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
me.AddItem(18,1,1,7);
end
function tbGMCard:HuyenTinh8()
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
me.AddItem(18,1,1,8);
end
function tbGMCard:HuyenTinh9()
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
me.AddItem(18,1,1,9);
end
function tbGMCard:HuyenTinh10()
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
me.AddItem(18,1,1,10);
end
function tbGMCard:HuyenTinh11()
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
end

function tbGMCard:HuyenTinh12()
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
end
function tbGMCard:TrangBi()
 local szMsg = "Hãy chọn lấy thứ mà ngươi muốn :";
 local tbOpt = {
  {"Nhận Quan ấn cấp 8",self.QuanAn8,self},
  {"Nhận Áo vũ uy",self.Vuuy,self},
  {"Nhận Thú cưỡi",self.Thucuoi,self},
  {"Nhận Tẩy tủy",self.Taytuy,self},
  {"Nhận Áo Tần thủy hoàng",self.Thuyhoang,self},
  {"Nhận Hộ uyển - Thủ trạc",self.Baotay,self},
  {"Nhận Nón hoàng kim",self.Non,self},
  {"Nhận Giày hoàng kim",self.Giay,self},
  {"Nhận Lưng hoàng kim",self.Lung,self},
  {"Nhận Ngọc bội",self.Ngocboi,self},
  {"Nhận Nhẫn hoàng kim kim",self.Nhan,self},
  {"Nhận Liên hoàng kim",self.Lien,self},
  {"Nhận Hộ phù hoàng kim",self.Hophu,self},
  {"Cửa hàng Vũ khí TTH",  self.ShopThuyhoang, self},
  {"Nhận Mật tịch cao",self.Mattichcao,self},
  {"Nhận Phi phong vô song",self.PhiPhong,self},
  {"Trận pháp cao",self.Trancao,self},
  {"Ngọc Trúc Mai hoa",self.Ngoctrucmaihoa,self},  
  {"không có gì"},  
 }
 
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:Ngoctrucmaihoa()
me.AddItem(17,3,2,6);
me.AddItem(17,3,2,7);
end
function tbGMCard:ShopThuyhoang()
local nSeries = me.nSeries;
 if (nSeries == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nSeries) then
  me.OpenShop(156, 1);
 elseif (2 == nSeries) then
  me.OpenShop(157, 1);
 elseif (3 == nSeries) then
  me.OpenShop(158, 1);
 elseif (4 == nSeries) then
  me.OpenShop(159, 1);
 elseif (5 == nSeries) then
  me.OpenShop(160, 1);
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Hỗ Trợ tân thủ", me.szName, "Bạn chưa gia nhập phái", nSeries);
 end
end
function tbGMCard:Mattichcao()
local nFaction = me.nFaction;
 if (nFaction == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nFaction) then
 me.AddItem(1,14,1,2);
 me.AddItem(1,14,2,2);
 me.AddItem(1,14,1,3);
 me.AddItem(1,14,2,3);
 elseif (2 == nFaction) then
 me.AddItem(1,14,3,2);
 me.AddItem(1,14,4,2);
 me.AddItem(1,14,3,3);
 me.AddItem(1,14,4,3);
 elseif (3 == nFaction) then
 me.AddItem(1,14,5,2);
 me.AddItem(1,14,6,2);
 me.AddItem(1,14,5,3);
 me.AddItem(1,14,6,3);
 elseif (4 == nFaction) then
 me.AddItem(1,14,7,2);
 me.AddItem(1,14,8,2);
 me.AddItem(1,14,7,3);
 me.AddItem(1,14,8,3);
 elseif (5 == nFaction) then
 me.AddItem(1,14,9,2);
 me.AddItem(1,14,10,2);
 me.AddItem(1,14,9,3);
 me.AddItem(1,14,10,3);
 elseif (6 == nFaction) then
 me.AddItem(1,14,11,2);
 me.AddItem(1,14,12,2);
 me.AddItem(1,14,11,3);
 me.AddItem(1,14,12,3);
 elseif (7 == nFaction) then
 me.AddItem(1,14,13,2);
 me.AddItem(1,14,14,2);
 me.AddItem(1,14,13,3);
 me.AddItem(1,14,14,3);
 elseif (8 == nFaction) then
 me.AddItem(1,14,15,2);
 me.AddItem(1,14,16,2);
 me.AddItem(1,14,15,3);
 me.AddItem(1,14,16,3);
 elseif (9 == nFaction) then
 me.AddItem(1,14,17,2);
 me.AddItem(1,14,18,2);
 me.AddItem(1,14,17,3);
 me.AddItem(1,14,18,3);
 elseif (10 == nFaction) then
 me.AddItem(1,14,19,2);
 me.AddItem(1,14,20,2);
 me.AddItem(1,14,19,3);
 me.AddItem(1,14,20,3);
 elseif (11 == nFaction) then
 me.AddItem(1,14,21,2);
 me.AddItem(1,14,22,2);
 me.AddItem(1,14,21,3);
 me.AddItem(1,14,22,3);
 elseif (12 == nFaction) then
 me.AddItem(1,14,23,2);
 me.AddItem(1,14,24,2);
 me.AddItem(1,14,23,3);
 me.AddItem(1,14,24,3);
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Hỗ Trợ tân thủ", me.szName, "Bạn chưa gia nhập phái", nFaction);
 end
end
function tbGMCard:Taytuy()
 me.AddItem(1,12,24,4);
 me.AddItem(1,12,12,4);
 me.AddItem(1,12,33,4);
 me.AddItem(21,9,1,1);
 me.AddItem(21,9,2,1);
 me.AddItem(21,9,3,1);
 me.AddItem(18,1,191,1);
 me.AddItem(18,1,191,1);
 me.AddItem(18,1,191,1);
 me.AddItem(18,1,191,1);
 me.AddItem(18,1,191,1);
 me.AddItem(18,1,191,2);
 me.AddItem(18,1,191,2);
 me.AddItem(18,1,191,2);
 me.AddItem(18,1,191,2);
 me.AddItem(18,1,191,2);
 me.AddItem(18,1,192,1);
 me.AddItem(18,1,192,1);
 me.AddItem(18,1,192,1);
 me.AddItem(18,1,192,1);
 me.AddItem(18,1,192,1);
 me.AddItem(18,1,192,2);
 me.AddItem(18,1,192,2);
 me.AddItem(18,1,192,2);
 me.AddItem(18,1,192,2);
 me.AddItem(18,1,192,2);
 me.AddItem(18,1,236,1);
 me.AddItem(18,1,326,2);
 me.AddItem(18,1,326,2);
 me.AddItem(18,1,326,3);
 me.AddItem(18,1,326,3);
 me.AddItem(18,1,400,1);
end
 
function tbGMCard:Lung()
me.AddItem(4,8,517,10);
me.AddItem(4,8,518,10);
me.AddItem(4,8,519,10);
me.AddItem(4,8,520,10);
me.AddItem(4,8,521,10);
me.AddItem(4,8,522,10);
me.AddItem(4,8,523,10);
me.AddItem(4,8,524,10);
me.AddItem(4,8,525,10);
me.AddItem(4,8,526,10);
me.AddItem(4,8,527,10);
me.AddItem(4,8,528,10);
me.AddItem(4,8,529,10);
me.AddItem(4,8,530,10);
me.AddItem(4,8,531,10);
me.AddItem(4,8,532,10);
me.AddItem(4,8,533,10);
me.AddItem(4,8,534,10);
me.AddItem(4,8,535,10);
me.AddItem(4,8,536,10);
me.AddItem(4,8,537,10);
me.AddItem(4,8,538,10);
me.AddItem(4,8,539,10);
me.AddItem(4,8,540,10);
me.AddItem(4,8,541,10);
me.AddItem(4,8,542,10);
me.AddItem(4,8,543,10);
me.AddItem(4,8,544,10);
me.AddItem(4,8,545,10);
me.AddItem(4,8,546,10);
me.AddItem(4,8,547,10);
me.AddItem(4,8,548,10);
me.AddItem(4,8,549,10);
me.AddItem(4,8,550,10);
me.AddItem(4,8,551,10);
me.AddItem(4,8,552,10);
me.AddItem(4,8,553,10);
me.AddItem(4,8,554,10);
me.AddItem(4,8,555,10);
me.AddItem(4,8,556,10);
me.AddItem(4,8,459,10);
me.AddItem(4,8,460,10);
me.AddItem(4,8,463,10);
me.AddItem(4,8,464,10);
me.AddItem(4,8,467,10);
me.AddItem(4,8,468,10);
me.AddItem(4,8,471,10);
me.AddItem(4,8,472,10);
me.AddItem(4,8,475,10);
me.AddItem(4,8,476,10);
me.AddItem(4,8,479,10);
me.AddItem(4,8,480,10);
me.AddItem(4,8,483,10);
me.AddItem(4,8,484,10);
me.AddItem(4,8,487,10);
me.AddItem(4,8,488,10);
me.AddItem(4,8,491,10);
me.AddItem(4,8,492,10);
me.AddItem(4,8,495,10);
me.AddItem(4,8,496,10);
me.AddItem(4,8,499,10);
me.AddItem(4,8,500,10);
me.AddItem(4,8,503,10);
me.AddItem(4,8,504,10);
me.AddItem(4,8,507,10);
me.AddItem(4,8,508,10);
me.AddItem(4,8,511,10);
me.AddItem(4,8,512,10);
me.AddItem(4,8,515,10);
me.AddItem(4,8,516,10);
end
function tbGMCard:Giay()
me.AddItem(4,7,31,10);
me.AddItem(4,7,32,10);
me.AddItem(4,7,33,10);
me.AddItem(4,7,34,10);
me.AddItem(4,7,35,10);
me.AddItem(4,7,36,10);
me.AddItem(4,7,37,10);
me.AddItem(4,7,38,10);
me.AddItem(4,7,39,10);
me.AddItem(4,7,40,10);
me.AddItem(4,7,41,10);
me.AddItem(4,7,42,10);
me.AddItem(4,7,43,10);
me.AddItem(4,7,44,10);
me.AddItem(4,7,45,10);
me.AddItem(4,7,46,10);
me.AddItem(4,7,47,10);
me.AddItem(4,7,48,10);
me.AddItem(4,7,49,10);
me.AddItem(4,7,50,10);
end
function tbGMCard:Thuyhoang()
me.AddItem(4,3,233,10);
me.AddItem(4,3,234,10);
me.AddItem(4,3,235,10);
me.AddItem(4,3,236,10);
me.AddItem(4,3,237,10);
me.AddItem(4,3,238,10);
me.AddItem(4,3,239,10);
me.AddItem(4,3,240,10);
me.AddItem(4,3,241,10);
me.AddItem(4,3,242,10);
me.AddItem(4,3,20045,10);
me.AddItem(4,3,20046,10);
me.AddItem(4,3,20047,10);
me.AddItem(4,3,20048,10);
me.AddItem(4,3,20049,10);
me.AddItem(4,3,20050,10);
me.AddItem(4,3,20051,10);
me.AddItem(4,3,20052,10);
me.AddItem(4,3,20053,10);
me.AddItem(4,3,20054,10);
end

function tbGMCard:Non()
me.AddItem(4,9,477,10);
me.AddItem(4,9,478,10);
me.AddItem(4,9,479,10);
me.AddItem(4,9,480,10);
me.AddItem(4,9,481,10);
me.AddItem(4,9,482,10);
me.AddItem(4,9,483,10);
me.AddItem(4,9,484,10);
me.AddItem(4,9,485,10);
me.AddItem(4,9,486,10);
me.AddItem(4,9,487,10);
me.AddItem(4,9,488,10);
me.AddItem(4,9,489,10);
me.AddItem(4,9,490,10);
me.AddItem(4,9,491,10);
me.AddItem(4,9,492,10);
me.AddItem(4,9,493,10);
me.AddItem(4,9,494,10);
me.AddItem(4,9,495,10);
me.AddItem(4,9,496,10);
end
 
function tbGMCard:Hophu()
 me.AddItem(4,6,95,10);
 me.AddItem(4,6,100,10);
 me.AddItem(4,6,105,10);
 me.AddItem(4,6,110,10);
 me.AddItem(4,6,115,10);
 me.AddItem(4,6,20000,10);
 me.AddItem(4,6,20001,10);
 me.AddItem(4,6,20002,10);
 me.AddItem(4,6,20003,10);
 me.AddItem(4,6,457,10);
 me.AddItem(4,6,458,10);
 me.AddItem(4,6,459,10);
 me.AddItem(4,6,460,10);
 me.AddItem(4,6,461,10);
 me.AddItem(4,6,462,10);
 me.AddItem(4,6,463,10);
 me.AddItem(4,6,464,10);
 me.AddItem(4,6,465,10);
 me.AddItem(4,6,466,10);
end
function tbGMCard:MatNa()
 me.AddItem(1,13,92,1); 
 me.AddItem(1,13,94,1); 
 me.AddItem(1,13,18,1); 
 me.AddItem(1,13,19,1);
 me.AddItem(1,13,77,1); 
 me.AddItem(1,13,89,1); 
 me.AddItem(18,1,518,1);
 me.AddItem(18,1,519,1);
 me.AddItem(18,1,520,1);
 me.AddItem(18,2,4,3);
 me.AddItem(18,2,4,2);
 me.AddItem(18,2,4,1);
 me.AddItem(18,2,3,1);
 me.AddItem(18,2,3,2);
 me.AddItem(18,2,3,3);
 me.AddItem(18,2,1,1);
 me.AddItem(18,2,1,2);
 me.AddItem(18,2,1,3);
 me.AddItem(18,1,1305,1);
 me.AddItem(18,1,1305,2);
 me.AddItem(18,1,510,1);
 me.AddItem(18,1,566,1);
 me.AddItem(18,1,541,2);
 me.AddItem(18,1,543,2);
 me.AddItem(18,1,1199,1);
 me.AddItem(18,1,1198,1);
 me.AddItem(18,1,1286,1);
 me.AddItem(1,16,13,2);
 me.AddItem(5,19,1,1);
 me.AddItem(5,20,1,1);
 me.AddItem(5,23,1,1);
 me.AddItem(1,12,28,4);
 me.AddItem(1,12,29,4);
 me.AddItem(18,1,957,1);
 me.AddItem(18,1,957,2);
 me.AddItem(18,1,541,2);
 me.AddItem(18,1,541,1);
 me.AddItem(18,1,544,1);
 me.AddItem(18,1,544,2);
 me.AddItem(18,1,529,7);
 me.AddItem(18,1,529,8);
 me.AddItem(18,1,529,9);
 me.AddItem(18,1,529,1);
 me.AddItem(18,1,529,6);
 me.AddItem(18,1,529,2);
 me.AddItem(18,1,529,3);
 me.AddItem(18,1,529,4);
 me.AddItem(18,1,529,5);
 me.AddItem(21,9,6,1);
 me.AddItem(21,9,4,1);
 me.AddItem(21,8,2,1);
 me.AddItem(22,1,91,1);
end
function tbGMCard:PhiPhong()
local nSeries = me.nSeries;
 if (nSeries == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nSeries) then
 local nSex = me.nSex;
  
 if (0 == nSex) then --male
 me.AddItem(1,17,1,10);
 else   --female
  me.AddItem(1,17,2,10);
 end
 elseif (2 == nSeries) then
 local nSex = me.nSex;
  
 if (0 == nSex) then --male
  me.AddItem(1,17,3,10); 
 else   --female
  me.AddItem(1,17,4,10); 
 end
 elseif (3 == nSeries) then
 local nSex = me.nSex;
  
 if (0 == nSex) then --male
 me.AddItem(1,17,5,10); 
 else   --female
 me.AddItem(1,17,6,10); 
 end
 elseif (4 == nSeries) then
  local nSex = me.nSex;
  
 if (0 == nSex) then --male
  me.AddItem(1,17,7,10);
 else   --female
 me.AddItem(1,17,8,10);
 end
 elseif (5 == nSeries) then
  local nSex = me.nSex;
  
 if (0 == nSex) then --male
 me.AddItem(1,17,9,10); 
 else   --female
 me.AddItem(1,17,10,10); 
 end
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Quan Lãnh Thổ", me.szName, "Bạn chưa gia nhập phái", nSeries);
 end
end
function tbGMCard:QuanAn8()
local nSeries = me.nSeries;
 if (nSeries == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nSeries) then
 me.AddItem(1,18,1,8);
 me.AddItem(1,18,6,1);
 me.AddItem(1,18,11,1);
 elseif (2 == nSeries) then
 me.AddItem(1,18,2,8);
 me.AddItem(1,18,7,1);
 me.AddItem(1,18,12,1);
 elseif (3 == nSeries) then
 me.AddItem(1,18,3,8);
 me.AddItem(1,18,8,1);
 me.AddItem(1,18,13,1);
 elseif (4 == nSeries) then
 me.AddItem(1,18,4,8);
 me.AddItem(1,18,9,1);
 me.AddItem(1,18,14,1);
 elseif (5 == nSeries) then
 me.AddItem(1,18,5,8);
 me.AddItem(1,18,10,1);
 me.AddItem(1,18,15,1);
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Quan Lãnh Thổ", me.szName, "Bạn chưa gia nhập phái", nSeries);
 end
end
function tbGMCard:Lien()
 me.AddItem(4,5,20085,10);
 me.AddItem(4,5,20086,10);
 me.AddItem(4,5,20087,10);
 me.AddItem(4,5,20088,10);
 me.AddItem(4,5,20089,10);
 me.AddItem(4,5,20090,10);
 me.AddItem(4,5,20091,10);
 me.AddItem(4,5,20092,10);
 me.AddItem(4,5,20093,10);
 me.AddItem(4,5,20094,10);
 me.AddItem(4,5,457,10);
 me.AddItem(4,5,458,10);
 me.AddItem(4,5,459,10);
 me.AddItem(4,5,460,10);
 me.AddItem(4,5,461,10);
 me.AddItem(4,5,462,10);
 me.AddItem(4,5,463,10);
 me.AddItem(4,5,464,10);
 me.AddItem(4,5,465,10);
 me.AddItem(4,5,466,10);
end
function tbGMCard:Thucuoi()
 me.AddItem(1,12,38,4);
 me.AddItem(1,12,39,4);
 me.AddItem(1,12,40,4);
 me.AddItem(1,12,41,4);
 me.AddItem(1,12,43,4);
 me.AddItem(1,12,44,4);
 me.AddItem(1,12,45,4);
 me.AddItem(1,12,46,4);
 me.AddItem(18,1,1285,1);
 me.AddItem(18,1,1285,2);
 me.AddItem(18,1,1285,3);
 me.AddItem(18,1,1285,4);
 me.AddItem(18,1,1285,5);
 me.AddItem(18,1,1285,6);
 me.AddItem(1,12,24,4);
 me.AddItem(1,12,25,4);
 me.AddItem(1,12,26,4);
 me.AddItem(1,12,27,4);
 me.AddItem(1,12,28,4);
 me.AddItem(1,12,29,4);
 me.AddItem(1,12,30,4);
 me.AddItem(1,12,31,4);
 me.AddItem(1,12,32,4);
 me.AddItem(1,12,33,4);
 me.AddItem(1,12,34,4);
 me.AddItem(1,12,35,4);
 me.AddItem(1,12,36,4);
 me.AddItem(1,12,37,4);
 me.AddItem(1,12,38,4);
 me.AddItem(1,12,39,4);
 me.AddItem(1,12,40,4);
 me.AddItem(1,12,41,4);
 me.AddItem(1,12,46,4);
 me.AddItem(1,12,47,4);
 me.AddItem(1,12,48,4);
 me.AddItem(1,12,2000,4);
 me.AddItem(1,12,20001,4);
 me.AddGeneralEquip(12,25,4);
 me.AddGeneralEquip(12,26,4);
 me.AddGeneralEquip(12,27,4);
 me.AddGeneralEquip(12,33,4);
 me.AddGeneralEquip(12,34,4);
end

function tbGMCard:Vuuy()
 me.AddItem(4,3,143,10);
 me.AddItem(4,3,145,10);
 me.AddItem(4,3,146,10);
 me.AddItem(4,3,147,10);
 me.AddItem(4,3,148,10);
 me.AddItem(4,3,149,10);
 me.AddItem(4,3,150,10);
 me.AddItem(4,3,151,10);
 me.AddItem(4,3,152,10);
 me.AddItem(4,3,153,10);
 me.AddItem(4,3,154,10);
 me.AddItem(4,3,155,10);
 me.AddItem(4,3,156,10);
 me.AddItem(4,3,157,10);
 me.AddItem(4,3,158,10);
 me.AddItem(4,3,159,10);
 me.AddItem(4,3,160,10);
 me.AddItem(4,3,161,10);
 me.AddItem(4,3,162,10);
end

function tbGMCard:Nhan()
 me.AddItem(4,4,444,10);
 me.AddItem(4,4,445,10);
 me.AddItem(4,4,446,10);
 me.AddItem(4,4,447,10);
 me.AddItem(4,4,448,10);
 me.AddItem(4,4,449,10);
 me.AddItem(4,4,450,10);
 me.AddItem(4,4,451,10);
 me.AddItem(4,4,452,10);
 me.AddItem(4,4,453,10);
 me.AddItem(4,4,454,10);
 me.AddItem(4,4,455,10);
 me.AddItem(4,4,456,10);
 me.AddItem(4,4,457,10);
 me.AddItem(4,4,458,10);
 me.AddItem(4,4,459,10);
 me.AddItem(4,4,460,10);
 me.AddItem(4,4,461,10);
 me.AddItem(4,4,462,10);
 me.AddItem(4,4,463,10);
end
function tbGMCard:Ngocboi()
 me.AddItem(4,11,20105,10);
 me.AddItem(4,11,20106,10);
 me.AddItem(4,11,20107,10);
 me.AddItem(4,11,20108,10);
 me.AddItem(4,11,20109,10);
 me.AddItem(4,11,20110,10);
 me.AddItem(4,11,20111,10);
 me.AddItem(4,11,20112,10);
 me.AddItem(4,11,20113,10);
 me.AddItem(4,11,20114,10);
 me.AddItem(4,11,81,10);
 me.AddItem(4,11,82,10);
 me.AddItem(4,11,83,10);
 me.AddItem(4,11,84,10);
 me.AddItem(4,11,85,10);
 me.AddItem(4,11,86,10);
 me.AddItem(4,11,87,10);
 me.AddItem(4,11,90,10);
 me.AddItem(4,11,91,10);
 me.AddItem(4,11,92,10);
 me.AddItem(4,11,93,10);
 me.AddItem(4,11,94,10);
 me.AddItem(4,11,95,10);
 me.AddItem(4,11,96,10);
 me.AddItem(4,11,97,10);
 me.AddItem(4,11,98,10);
 me.AddItem(4,11,99,10);
 me.AddItem(4,11,100,10);
end
function tbGMCard:Baotay()
 me.AddItem(4,10,95,10);
 me.AddItem(4,10,96,10);
 me.AddItem(4,10,97,10);
 me.AddItem(4,10,98,10);
 me.AddItem(4,10,99,10);
 me.AddItem(4,10,100,10);
 me.AddItem(4,10,101,10);
 me.AddItem(4,10,102,10);
 me.AddItem(4,10,103,10);
 me.AddItem(4,10,104,10);
 me.AddItem(4,10,105,10);
 me.AddItem(4,10,106,10);
 me.AddItem(4,10,107,10);
 me.AddItem(4,10,108,10);
 me.AddItem(4,10,109,10);
 me.AddItem(4,10,110,10);
 me.AddItem(4,10,111,10);
 me.AddItem(4,10,112,10);
 me.AddItem(4,10,113,10);
 me.AddItem(4,10,114,10);
 me.AddItem(4,10,441,10);
 me.AddItem(4,10,442,10);
 me.AddItem(4,10,443,10);
 me.AddItem(4,10,444,10);
 me.AddItem(4,10,445,10);
 me.AddItem(4,10,446,10);
 me.AddItem(4,10,447,10);
 me.AddItem(4,10,448,10);
 me.AddItem(4,10,449,10);
 me.AddItem(4,10,450,10);
 me.AddItem(4,10,451,10);
 me.AddItem(4,10,452,10);
 me.AddItem(4,10,453,10);
 me.AddItem(4,10,454,10);
 me.AddItem(4,10,455,10);
 me.AddItem(4,10,456,10);
 me.AddItem(4,10,457,10);
 me.AddItem(4,10,459,10);
 me.AddItem(4,10,460,10);
 me.AddItem(4,10,461,10);
 me.AddItem(4,10,462,10);
 me.AddItem(4,10,463,10);
 me.AddItem(4,10,464,10);
 me.AddItem(4,10,465,10);
 me.AddItem(4,10,466,10);
 me.AddItem(4,10,467,10);
 me.AddItem(4,10,468,10);
 me.AddItem(4,10,469,10);
 me.AddItem(4,10,470,10);
 me.AddItem(4,10,471,10);
 me.AddItem(4,10,472,10);
 me.AddItem(4,10,473,10);
 me.AddItem(4,10,474,10);
 me.AddItem(4,10,475,10);
 me.AddItem(4,10,476,10);
 me.AddItem(4,10,477,10);
 me.AddItem(4,10,478,10);
 me.AddItem(4,10,479,10);
 me.AddItem(4,10,480,10);
 me.AddItem(4,10,481,10); 
end
function tbGMCard:DoCuoi12()
local nSeries = me.nSeries;
 local szMsg = "Hay chon";
 local tbOpt = {
  {"Đồ Ngoại Công",self.Dongoai,self},
  {"Đồ Nội Công",self.Donoi,self },
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:Dongoai()
local nSex = me.nSex;
  local nSeries = me.nSeries;
 if (nSeries == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,519,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,537,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20211,10,5,16); --Th?y Hoàng H?ng Hoang Uy?n
 me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
 me.AddGreenEquip(8,520,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,538,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20212,10,5,16);
 me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 end
 elseif (2 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,523,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,541,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20215,10,5,16);
 me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
 me.AddGreenEquip(8,524,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,542,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(10,20216,10,5,16);
 me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 end
 elseif (3 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,527,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,545,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(10,20219,10,5,16);
 me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 else   --female
 me.AddGreenEquip(8,528,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,546,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20220,10,5,16);
 me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 end
 elseif (4 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,531,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,549,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20223,10,5,16);
 me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
 me.AddGreenEquip(8,532,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,550,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(10,20224,10,5,16);
 me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 end
 elseif (5 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,535,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,553,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20227,10,5,16);
 me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
 me.AddGreenEquip(8,536,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,554,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20228,10,5,16);
 me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 end
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Quan Lãnh Thổ", me.szName, "Bạn chưa gia nhập phái", nSeries);
 end
 ---local szMsg = "Hay chon";
 --local tbOpt = {
 -- {"He Kim",self.HeKim,self},
 -- {"He Moc",self.HeMoc,self},
 -- {"He Thuy",self.HeThuy,self},
 -- {"He Hoa",self.HeHoa,self},
 -- {"He Tho",self.HeTho,self},
 --}
 --Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:Donoi()
local nSex = me.nSex;
  local nSeries = me.nSeries;
 if (nSeries == 0) then
  Dialog:Say("Bạn hãy gia nhập phái");
  return;
 end
 
 if (1 == nSeries) then
  if (0 == nSex) then --male
 me.AddGreenEquip(8,519,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,537,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20213,10,5,16);
 me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
 me.AddGreenEquip(8,520,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,538,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 
  me.AddGreenEquip(10,20214,10,5,16);
 me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 end
 elseif (2 == nSeries) then
 
  if (0 == nSex) then --male
 me.AddGreenEquip(8,523,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,541,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 
  me.AddGreenEquip(10,20217,10,5,16);
 me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 else   --female
me.AddGreenEquip(8,524,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,542,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(10,20218,10,5,16);
 me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 end
 elseif (3 == nSeries) then
 
  if (0 == nSex) then --male
 me.AddGreenEquip(8,527,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,545,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 
   me.AddGreenEquip(10,20221,10,5,16);
 me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 else   --female
 me.AddGreenEquip(8,528,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,546,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(10,20222,10,5,16);
 me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 end
 elseif (4 == nSeries) then
 
  if (0 == nSex) then --male
 me.AddGreenEquip(8,531,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,549,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 
   me.AddGreenEquip(10,20225,10,5,16);
 me.AddGreenEquip(4,20168,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 else   --female
 me.AddGreenEquip(8,532,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,550,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
   me.AddGreenEquip(10,20226,10,5,16);
 me.AddGreenEquip(4,20168,10,5,16);--V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 end
 elseif (5 == nSeries) then
 
  if (0 == nSex) then --male
  me.AddGreenEquip(8,535,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,553,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
   me.AddGreenEquip(10,20229,10,5,16);
 me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
 else   --female
  me.AddGreenEquip(10,20230,10,5,16);
me.AddGreenEquip(8,536,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
  me.AddGreenEquip(8,554,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 
 me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 end
 else
  Dbg:WriteLogEx(Dbg.LOG_INFO, "Quan Lãnh Thổ", me.szName, "Bạn chưa gia nhập phái", nSeries);
 end
 
end
 
 

function tbGMCard:DoCuoi13()
 local szMsg = "Hay chon";
 local tbOpt = {
  {"Do Nam",self.DoNam,self},
  {"Do Nu",self.DoNu,self },
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:DoNam()
 local szMsg = "Hay chon";
 local tbOpt = {
  {"He Kim",self.HeKim,self},
  {"He Moc",self.HeMoc,self},
  {"He Thuy",self.HeThuy,self},
  {"He Hoa",self.HeHoa,self},
  {"He Tho",self.HeTho,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:DoNu()
 local szMsg = "Hay chon";
 local tbOpt = {
  {"He Kim",self.HeKim1,self},
  {"He Moc",self.HeMoc1,self},
  {"He Thuy",self.HeThuy1,self},
  {"He Hoa",self.HeHoa1,self},
  {"He Tho",self.HeTho1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeKim()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.KimNgoai,self},
  {"Do Noi",self.KimNoi,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeKim1()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.KimNgoai1,self},
  {"Do Noi",self.KimNoi1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeMoc()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.MocNgoai,self},
  {"Do Noi",self.MocNoi,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeMoc1()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.MocNgoai1,self},
  {"Do Noi",self.MocNoi1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeThuy()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.ThuyNgoai,self},
  {"Do Noi",self.ThuyNoi,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeThuy1()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.ThuyNgoai1,self},
  {"Do Noi",self.ThuyNoi1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeHoa()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.HoaNgoai,self},
  {"Do Noi",self.HoaNoi,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeHoa1()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.HoaNgoai1,self},
  {"Do Noi",self.HoaNoi1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeTho()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.ThoNgoai,self},
  {"Do Noi",self.ThoNoi,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:HeTho1()
 local szMsg = "Hay chon";
 local tbOpt ={
  {"Do Ngoai",self.ThoNgoai1,self},
  {"Do Noi",self.ThoNoi1,self},
 }
 Dialog:Say(szMsg,tbOpt);
end
function tbGMCard:KimNgoai()
 me.AddGreenEquip(10,20211,10,5,16); --Th?y Hoàng H?ng Hoang Uy?n
 me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 
 --Chua bo trang bi vao******************************
end
function tbGMCard:KimNgoai1()
 me.AddGreenEquip(10,20212,10,5,16);
 me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:KimNoi()
 me.AddGreenEquip(10,20213,10,5,16);
 me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:KimNoi1()
 me.AddGreenEquip(10,20214,10,5,16);
 me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:MocNgoai()
 me.AddGreenEquip(10,20215,10,5,16);
 me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:MocNgoai1()
 me.AddGreenEquip(10,20216,10,5,16);
 me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:MocNoi()
 me.AddGreenEquip(10,20217,10,5,16);
 me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:MocNoi1()
 me.AddGreenEquip(10,20218,10,5,16);
 me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end

function tbGMCard:ThuyNgoai()
 me.AddGreenEquip(10,20219,10,5,16);
 me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThuyNgoai1()
 me.AddGreenEquip(10,20220,10,5,16);
 me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThuyNoi()
 me.AddGreenEquip(10,20221,10,5,16);
 me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThuyNoi1()
 me.AddGreenEquip(10,20222,10,5,16);
 me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:HoaNgoai()
 me.AddGreenEquip(10,20223,10,5,16);
 me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:HoaNgoai1()
 me.AddGreenEquip(10,20224,10,5,16);
 me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:HoaNoi()
 me.AddGreenEquip(10,20225,10,5,16);
 me.AddGreenEquip(4,20168,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:HoaNoi1()
 me.AddGreenEquip(10,20226,10,5,16);
 me.AddGreenEquip(4,20168,10,5,16);--V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end

function tbGMCard:ThoNgoai()
 me.AddGreenEquip(10,20227,10,5,16);
 me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThoNgoai1()
 me.AddGreenEquip(10,20228,10,5,16);
 me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThoNoi()
 me.AddGreenEquip(10,20229,10,5,16);
 me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
 me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
 me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end
function tbGMCard:ThoNoi1()
 me.AddGreenEquip(10,20230,10,5,16);
 me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
 me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
 me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
 me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
 me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
 me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
 me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
 me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
 --Chua bo trang bi vao******************************
end

function tbGMCard:MaxSkillMonPhai() 
    if me.nFaction > 0 then 
        if me.nFaction == 1 and me.nRouteId == 1  then    -- Thiếu Lâm Đao
            --Skill Đao Thiếu 
            me.AddFightSkill(21,20);    --Phục Ma Đao Pháp 
            me.AddFightSkill(22,10);    --Thiếu Lâm Đao Pháp 
            me.AddFightSkill(23,10);    --Dịch Cốt Kinh 
            me.AddFightSkill(25,20);    --A La Hán Thần Công 
            me.AddFightSkill(24,20);    --Phá Giới Đao Pháp 
            me.AddFightSkill(250,10);    --Hàng Long Phục Hổ 
            me.AddFightSkill(26,20);    --Bồ Đề Tâm Pháp 
            me.AddFightSkill(28,20);    --Hỗn Nguyên Nhất Khí 
            me.AddFightSkill(27,20);    --Thiên Trúc Tuyệt Đao 
            me.AddFightSkill(252,10);    --Như Lai Thiên Diệp 
            me.AddFightSkill(819,10);    --Thiền Nguyên Công 
            me.AddFightSkill(820,10);    --Kỹ năng cấp 120 
			elseif me.nFaction == 1 and me.nRouteId == 2 then 
            --Skill Côn Thiếu 
            me.AddFightSkill(29,20);    --Phổ Độ Côn Pháp 
            me.AddFightSkill(30,10);    --Thiếu Lâm Côn Pháp 
            me.AddFightSkill(31,10);    --Sư Tử Hống 
            me.AddFightSkill(25,20);    --A La Hán Thần Công 
            me.AddFightSkill(33,20);    --Phục Ma Côn Pháp 
            me.AddFightSkill(34,10);    --Bất Động Minh Vương 
            me.AddFightSkill(254,20);    --Dịch Cốt Kinh 
            me.AddFightSkill(37,20);    --Đạt Ma Vũ Kinh 
            me.AddFightSkill(36,20);    --Thất Tinh La Sát Côn 
            me.AddFightSkill(255,10);    --Vô Tướng Thần Công 
            me.AddFightSkill(821,10);    --Túy Bát Tiên Côn 
            me.AddFightSkill(822,10);    --Kỹ năng cấp 120 
        elseif me.nFaction == 2 and me.nRouteId == 1 then    --Skill Thiên Vương 
            --Thương Thiên 
            me.AddFightSkill(38,20);    --Hồi Phong Lạc Nhạn 
            me.AddFightSkill(40,10);    --Thiên Vương Thương Pháp 
            me.AddFightSkill(41,10);    --Đoạn Hồn Thích     
            me.AddFightSkill(45,20);    --Tĩnh Tâm Quyết 
            me.AddFightSkill(43,20);    --Dương Quan Tam Điệp 
            me.AddFightSkill(256,10);    --Kinh Lôi Phá Thiên 
            me.AddFightSkill(46,20);    --Thiên Vương Chiến Ý     
            me.AddFightSkill(49,20);    --Thiên Canh Chiến Khí     
            me.AddFightSkill(47,20);    --Truy Tinh Trục Nguyệt 
            me.AddFightSkill(259,10);    --Huyết Chiến Bát Phương     
            me.AddFightSkill(823,10);    --Bôn Lôi Toàn Long Thương     
            me.AddFightSkill(824,10);    --Kỹ năng cấp 120
			        elseif me.nFaction == 2 and me.nRouteId == 2 then 
            --Chùy Thiên 
            me.AddFightSkill(50,20);    --Hành Vân Quyết 
            me.AddFightSkill(52,10);    --Thiên Vương Chùy Pháp 
            me.AddFightSkill(41,10);    --Đoạn Hồn Thích 
            me.AddFightSkill(781,20);    --Tĩnh Tâm Thuật 
            me.AddFightSkill(53,20);    --Truy Phong Quyết 
            me.AddFightSkill(260,10);    --Thiên Vương Bản Sinh 
            me.AddFightSkill(55,20);    --Kim Chung Tráo 
            me.AddFightSkill(58,20);    --Đảo Hư Thiên 
            me.AddFightSkill(56,20);    --Thừa Long Quyết 
            me.AddFightSkill(262,10);    --Bất Diệt Sát Ý 
            me.AddFightSkill(825,10);    --Trảm Long Quyết 
            me.AddFightSkill(826,10);    --Kỹ năng cấp 120
        elseif me.nFaction == 3 and me.nRouteId == 1 then    --Đường Môn 
            --Hãm Tĩnh 
            me.AddFightSkill(69,20);    --Độc Thích Cốt 
            me.AddFightSkill(70,10);    --Đường Môn Hãm Tĩnh 
            me.AddFightSkill(64,10);    --Mê Ảnh Tung     
            me.AddFightSkill(71,20);    --Câu Hồn Tĩnh 
            me.AddFightSkill(72,20);    --Tiểu Lý Phi Đao 
            me.AddFightSkill(263,10);    --Hấp Tinh Trận 
            me.AddFightSkill(73,20);    --Triền Thân Thích     
            me.AddFightSkill(75,20);    --Tâm Phách     
            me.AddFightSkill(74,20);    --Loạn Hoàn Kích 
            me.AddFightSkill(265,10);    --Thực Cốt Huyết Nhẫn     
            me.AddFightSkill(827,10);    --Cơ Quan Bí Thuật     
            me.AddFightSkill(828,10);    --Kỹ năng cấp 120  
elseif me.nFaction == 3 and me.nRouteId == 2 then			
            --Tụ Tiễn 
            me.AddFightSkill(59,20);    --Truy Tâm Tiễn 
            me.AddFightSkill(60,10);    --Đường Môn Tụ Tiễn 
            me.AddFightSkill(64,10);    --Mê Ảnh Tung     
            me.AddFightSkill(61,20);    --Tôi Độc Thuật 
            me.AddFightSkill(62,20);    --Thiên La Địa Võng 
            me.AddFightSkill(266,10);    --Đoạn Cân Nhẫn 
            me.AddFightSkill(65,20);    --Ngự Độc Thuật     
            me.AddFightSkill(68,20);    --Tâm Ma     
            me.AddFightSkill(66,20);    --Bạo Vũ Lê Hoa 
            me.AddFightSkill(268,10);    --Tâm Nhãn     
            me.AddFightSkill(829,10);    --Thất Tuyệt Sát Quang     
            me.AddFightSkill(830,10);    --Kỹ năng cấp 120
        elseif me.nFaction == 4 and me.nRouteId == 1 then   --Ngũ Độc 
            --Đao Độc 
            me.AddFightSkill(76 ,20);  -- Huyết Đao Độc Sát 
            me.AddFightSkill(77 ,10);  -- Ngũ Độc Đao Pháp 
            me.AddFightSkill(78 ,10);  -- Vô Hình Cổ 
            me.AddFightSkill(81 ,20);  -- Thí Độc Thuật 
            me.AddFightSkill(80 ,20);  -- Bách Độc Xuyên Tâm 
            me.AddFightSkill(269 ,10);  -- Ôn Cổ Chi Khí 
            me.AddFightSkill(82 ,20);  -- Vạn Cổ Thực Tâm 
            me.AddFightSkill(85 ,20);  -- Ngũ Độc Kỳ Kinh 
            me.AddFightSkill(83 ,20);  -- Huyền Âm Trảm 
            me.AddFightSkill(271 ,10);  -- Thiên Thù Vạn Độc 
            me.AddFightSkill(831 ,10);  -- Chu Cáp Thanh Minh 
            me.AddFightSkill(832 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 4 and me.nRouteId == 2 then
            --Chưởng Độc 
            me.AddFightSkill(86 ,20);  -- Độc Sa Chưởng 
            me.AddFightSkill(87 ,10);  -- Ngũ Độc Chưởng Pháp 
            me.AddFightSkill(92 ,20);  -- Xuyên Tâm Độc Thích 
            me.AddFightSkill(91 ,20);  -- Ngân Ti Phi Thù 
            me.AddFightSkill(90 ,20);  -- Thiên Canh Địa Sát 
            me.AddFightSkill(272 ,10);  -- Khu Độc Thuật 
            me.AddFightSkill(88 ,20);  -- Bi Ma Huyết Quang 
            me.AddFightSkill(95 ,20);  -- Bách Cổ Độc Kinh 
            me.AddFightSkill(93 ,20);  -- Âm Phong Thực Cốt 
            me.AddFightSkill(274 ,10);  -- Đoạn Cân Hủ Cốt 
            me.AddFightSkill(833 ,10);  -- Hóa Cốt Miên Chưởng 
            me.AddFightSkill(834 ,10);  -- Kỹ năng cấp 120
        elseif me.nFaction == 5 and me.nRouteId == 1 then    --Nga My 
            --Chưởng Nga 
            me.AddFightSkill(96 ,20);  -- Phiêu Tuyết Xuyên Vân 
            me.AddFightSkill(97 ,10);  -- Nga My Chưởng Pháp 
            me.AddFightSkill(98 ,20);  -- Từ Hàng Phổ Độ 
            me.AddFightSkill(101 ,20);  -- Phật Tâm Từ Hựu 
            me.AddFightSkill(99 ,20);  -- Tứ Tượng Đồng Quy 
            me.AddFightSkill(479 ,10);  -- Bất Diệt Bất Tuyệt 
            me.AddFightSkill(782 ,20);  -- Lưu Thủy Tâm Pháp 
            me.AddFightSkill(105 ,20);  -- Phật Pháp Vô Biên 
            me.AddFightSkill(103 ,20);  -- Phong Sương Toái Ảnh 
            me.AddFightSkill(280 ,10);  -- Vạn Phật Quy Tông 
            me.AddFightSkill(835 ,10);  -- Phật Quang Chiến Khí 
            me.AddFightSkill(836 ,10);  -- Kỹ năng cấp 120
			 elseif me.nFaction == 5 and me.nRouteId == 2 then
            --Phụ Trợ 
            me.AddFightSkill(107 ,20);  -- Phật Âm Chiến Ý 
            me.AddFightSkill(106 ,10);  -- Mộng Điệp 
            me.AddFightSkill(98 ,20);  -- Từ Hàng Phổ Độ 
            me.AddFightSkill(101 ,20);  -- Phật Tâm Từ Hựu 
            me.AddFightSkill(109 ,20);  -- Thiên Phật Thiên Diệp 
            me.AddFightSkill(110 ,10);  -- Phật Quang Phổ Chiếu 
            me.AddFightSkill(102 ,20);  -- Lưu Thủy Quyết 
            me.AddFightSkill(481 ,20);  -- Ba La Tâm Kinh 
            me.AddFightSkill(108 ,20);  -- Thanh Âm Phạn Xướng 
            me.AddFightSkill(482 ,10);  -- Phổ Độ Chúng Sinh 
            me.AddFightSkill(837 ,10);  -- Kiếm Ảnh Phật Quang 
           me.AddFightSkill(838 ,10);  -- Kỹ năng cấp 120
        elseif me.nFaction == 6 and me.nRouteId == 1 then    --Thúy Yên 
            --Kiếm Thúy 
            me.AddFightSkill(111 ,20);  -- Phong Quyển Tàn Tuyết 
            me.AddFightSkill(112 ,10);  -- Thúy Yên Kiếm Pháp 
            me.AddFightSkill(113 ,20);  -- Hộ Thể Hàn Băng 
            me.AddFightSkill(115 ,20);  -- Tuyết Ảnh 
            me.AddFightSkill(114 ,20);  -- Bích Hải Triều Sinh 
            me.AddFightSkill(483 ,10);  -- Huyền Băng Vô Tức 
            me.AddFightSkill(116 ,20);  -- Tuyết Ánh Hồng Trần 
            me.AddFightSkill(119 ,20);  -- Băng Cốt Tuyết Tâm 
            me.AddFightSkill(117 ,20);  -- Băng Tâm Tiên Tử 
            me.AddFightSkill(485 ,10);  -- Phù Vân Tán Tuyết 
            me.AddFightSkill(839 ,10);  -- Thập Diện Mai Phục 
            me.AddFightSkill(840 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 6 and me.nRouteId == 2 then
            --Đao Thúy 
            me.AddFightSkill(120 ,20);  -- Phong Hoa Tuyết Nguyệt 
            me.AddFightSkill(121 ,10);  -- Thúy Yên Đao Pháp 
            me.AddFightSkill(122 ,20);  -- Ngự Tuyết Ẩn 
            me.AddFightSkill(115 ,20);  -- Tuyết Ảnh 
            me.AddFightSkill(123 ,20);  -- Mục Dã Lưu Tinh 
            me.AddFightSkill(483 ,10);  -- Huyền Băng Vô Tức 
            me.AddFightSkill(124 ,20);  -- Băng Tâm Thiến Ảnh 
            me.AddFightSkill(127 ,20);  -- Băng Cơ Ngọc Cốt 
            me.AddFightSkill(125 ,20);  -- Băng Tung Vô Ảnh 
            me.AddFightSkill(486 ,10);  -- Thiên Lý Băng Phong 
            me.AddFightSkill(841 ,10);  -- Quy Khứ Lai Hề 
            me.AddFightSkill(842 ,10);  -- Kỹ năng cấp 120
        elseif me.nFaction == 7 and me.nRouteId == 1 then    --Cái Bang 
            --Chưởng Cái 
            me.AddFightSkill(128 ,20);  -- Kiến Nhân Thân Thủ 
            me.AddFightSkill(129 ,10);  -- Cái Bang Chưởng Pháp 
            me.AddFightSkill(130 ,20);  -- Hóa Hiểm Vi Di 
            me.AddFightSkill(132 ,20);  -- Hoạt Bất Lưu Thủ 
            me.AddFightSkill(131 ,20);  -- Hàng Long Hữu Hối 
            me.AddFightSkill(489 ,10);  -- Thời Thừa Lục Long 
            me.AddFightSkill(133 ,20);  -- Túy Điệp Cuồng Vũ 
            me.AddFightSkill(136 ,20);  -- Tiềm Long Tại Uyên 
            me.AddFightSkill(134 ,20);  -- Phi Long Tại Thiên 
            me.AddFightSkill(487 ,10);  -- Giáng Long Chưởng 
            me.AddFightSkill(843 ,10);  -- Trảo Long Công 
            me.AddFightSkill(844 ,10);  -- Kỹ năng cấp 120 
			   elseif me.nFaction == 7 and me.nRouteId == 2 then
            --Côn Cái 
            me.AddFightSkill(137 ,20);  -- Duyên Môn Thác Bát 
            me.AddFightSkill(138 ,10);  -- Cái Bang Bổng Pháp 
            me.AddFightSkill(139 ,20);  -- Tiêu Dao Công 
            me.AddFightSkill(132 ,20);  -- Hoạt Bất Lưu Thủ 
            me.AddFightSkill(140 ,20);  -- Bổng Đả Ác Cẩu 
            me.AddFightSkill(491 ,10);  -- Ác Cẩu Lan Lộ 
            me.AddFightSkill(238 ,20);  -- Hỗn Thiên Khí Công 
            me.AddFightSkill(142 ,20);  -- Bôn Lưu Đáo Hải 
            me.AddFightSkill(141 ,20);  -- Thiên Hạ Vô Cẩu 
            me.AddFightSkill(488 ,10);  -- Đả Cẩu Bổng Pháp 
            me.AddFightSkill(845 ,10);  -- Đả Cẩu Trận Pháp 
            me.AddFightSkill(846 ,10);  -- Kỹ năng cấp 120 
        elseif me.nFaction == 8 and me.nRouteId == 1 then    --Thiên Nhẫn 
            --Chiến Nhẫn 
            me.AddFightSkill(143 ,20);  -- Tàn Dương Như Huyết 
            me.AddFightSkill(144 ,10);  -- Thiên Nhẫn Mâu Pháp 
            me.AddFightSkill(492 ,20);  -- Huyễn Ảnh Truy Hồn Thương 
            me.AddFightSkill(145 ,20);  -- Kim Thiền Thoát Xác 
            me.AddFightSkill(146 ,20);  -- Liệt Hỏa Tình Thiên 
            me.AddFightSkill(147 ,10);  -- Bi Tô Thanh Phong 
            me.AddFightSkill(148 ,20);  -- Ma Âm Phệ Phách 
            me.AddFightSkill(150 ,20);  -- Thiên Ma Giải Thể 
            me.AddFightSkill(149 ,20);  -- Vân Long Kích 
            me.AddFightSkill(493 ,10);  -- Ma Viêm Tại Thiên 
            me.AddFightSkill(847 ,10);  -- Phi Hồng Vô Tích 
            me.AddFightSkill(848 ,10);  -- Kỹ năng cấp 120 
			 elseif me.nFaction == 8 and me.nRouteId == 2 then
            --Ma Nhẫn 
            me.AddFightSkill(151 ,20);  -- Đạn Chỉ Liệt Diệm 
            me.AddFightSkill(152 ,10);  -- Thiên Nhẫn Đao Pháp 
            me.AddFightSkill(154 ,20);  -- Lệ Ma Đoạt Hồn 
            me.AddFightSkill(145 ,20);  -- Kim Thiền Thoát Xác 
            me.AddFightSkill(153 ,20);  -- Thôi Sơn Điền Hải 
            me.AddFightSkill(494 ,10);  -- Hỏa Liên Phần Hoa 
            me.AddFightSkill(155 ,20);  -- Nhiếp Hồn Loạn Tâm 
            me.AddFightSkill(158 ,20);  -- Xí Không Ma Diệm 
            me.AddFightSkill(156 ,20);  -- Thiên Ngoại Lưu Tinh 
            me.AddFightSkill(496 ,10);  -- Ma Diệm Thất Sát 
            me.AddFightSkill(849 ,10);  -- Thúc Phọc Chú 
            me.AddFightSkill(850 ,10);  -- Kỹ năng cấp 120 
        elseif me.nFaction == 9 and me.nRouteId == 1 then    --Võ Đang 
            --Khí Võ 
            me.AddFightSkill(159 ,20);  -- Bác Cập Nhi Phục 
            me.AddFightSkill(160 ,10);  -- Võ Đang Quyền Pháp 
            me.AddFightSkill(161 ,20);  -- Tọa Vọng Vô Ngã 
            me.AddFightSkill(163 ,20);  -- Thê Vân Tung 
            me.AddFightSkill(162 ,20);  -- Vô Ngã Vô Kiếm 
            me.AddFightSkill(497 ,10);  -- Thuần Dương Vô Cực 
            me.AddFightSkill(164 ,20);  -- Chân Vũ Thất Tiệt 
            me.AddFightSkill(166 ,20);  -- Thái Cực Vô Ý 
            me.AddFightSkill(165 ,20);  -- Thiên Địa Vô Cực 
            me.AddFightSkill(498 ,10);  -- Thái Cực Thần Công 
            me.AddFightSkill(851 ,10);  -- Võ Đang Cửu Dương 
            me.AddFightSkill(852 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 9 and me.nRouteId == 2 then 
            --Kiếm Võ 
            me.AddFightSkill(167 ,20);  -- Kiếm Phi Kinh Thiên 
            me.AddFightSkill(168 ,10);  -- Võ Đang Kiếm Pháp 
            me.AddFightSkill(783 ,20);  -- Vô Ngã Tâm Pháp 
            me.AddFightSkill(163 ,20);  -- Thê Vân Tung 
            me.AddFightSkill(169 ,20);  -- Tam Hoàn Sáo Nguyệt 
            me.AddFightSkill(499 ,10);  -- Thái Nhất Chân Khí 
            me.AddFightSkill(170 ,20);  -- Thất Tinh Quyết 
            me.AddFightSkill(174 ,20);  -- Kiếm Khí Tung Hoành 
            me.AddFightSkill(171 ,20);  -- Nhân Kiếm Hợp Nhất 
            me.AddFightSkill(500 ,10);  -- Thái Cực Kiếm Pháp 
            me.AddFightSkill(853 ,10);  -- Mê Tung Huyễn Ảnh 
            me.AddFightSkill(854 ,10);  -- Kỹ năng cấp 120
        elseif me.nFaction == 10 and me.nRouteId == 1 then    --Côn Lôn 
            --Đao Côn 
            me.AddFightSkill(175 ,20);  -- Hô Phong Pháp 
            me.AddFightSkill(176 ,10);  -- Côn Lôn Đao Pháp 
            me.AddFightSkill(179 ,20);  -- Huyền Thiên Vô Cực 
            me.AddFightSkill(177 ,20);  -- Thanh Phong Phù 
            me.AddFightSkill(178 ,20);  -- Cuồng Phong Sậu Điện 
            me.AddFightSkill(697 ,10);  -- Khai Thần Thuật 
            me.AddFightSkill(180 ,20);  -- Nhất Khí Tam Thanh 
            me.AddFightSkill(183 ,20);  -- Thiên Thanh Địa Trọc 
            me.AddFightSkill(181 ,20);  -- Ngạo Tuyết Tiếu Phong 
            me.AddFightSkill(698 ,10);  -- Sương Ngạo Côn Lôn 
            me.AddFightSkill(855 ,10);  -- Vô Nhân Vô Ngã 
            me.AddFightSkill(856 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 10 and me.nRouteId == 2 then
            --Kiếm Côn 
            me.AddFightSkill(188 ,20);  -- Cuồng Lôi Chấn Địa 
            me.AddFightSkill(189 ,10);  -- Côn Lôn Kiếm Pháp 
            me.AddFightSkill(179 ,20);  -- Huyền Thiên Vô Cực 
            me.AddFightSkill(177 ,20);  -- Thanh Phong Phù 
            me.AddFightSkill(190 ,20);  -- Thiên Tế Tấn Lôi 
            me.AddFightSkill(699 ,10);  -- Túy Tiên Thác Cốt 
            me.AddFightSkill(191 ,20);  -- Đạo Cốt Tiên Phong 
            me.AddFightSkill(193 ,20);  -- Ngũ Lôi Chánh Pháp 
            me.AddFightSkill(192 ,20);  -- Lôi Động Cửu Thiên 
            me.AddFightSkill(767 ,10);  -- Hỗn Nguyên Càn Khôn 
            me.AddFightSkill(857 ,10);  -- Lôi Đình Quyết 
            me.AddFightSkill(858 ,10);  -- Kỹ năng cấp 120 
       elseif me.nFaction == 11 and me.nRouteId == 1 then   --Minh Giáo 
            --Chùy Minh 
            me.AddFightSkill(194 ,20);  -- Khai Thiên Thức 
            me.AddFightSkill(196 ,10);  -- Minh Giáo Chùy Pháp 
            me.AddFightSkill(199 ,20);  -- Khốn Hổ Vân Tiếu 
            me.AddFightSkill(768 ,20);  -- Huyền Dương Công 
            me.AddFightSkill(198 ,20);  -- Phách Địa Thế 
            me.AddFightSkill(201 ,10);  -- Kim Qua Thiết Mã 
            me.AddFightSkill(197 ,20);  -- Ngự Mã Thuật 
            me.AddFightSkill(204 ,20);  -- Trấn Ngục Phá Thiên Kình 
            me.AddFightSkill(202 ,20);  -- Long Thôn Thức 
            me.AddFightSkill(769 ,10);  -- Không Tuyệt Tâm Pháp 
            me.AddFightSkill(859 ,10);  -- Cửu Hi Hỗn Dương 
            me.AddFightSkill(860 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 11 and me.nRouteId == 2 then
            --Kiếm Minh 
            me.AddFightSkill(205 ,20);  -- Thánh Hỏa Phần Tâm 
            me.AddFightSkill(206 ,10);  -- Minh Giáo Kiếm Pháp 
            me.AddFightSkill(207 ,20);  -- Di Khí Phiêu Tung 
            me.AddFightSkill(209 ,20);  -- Phiêu Dực Thân Pháp 
            me.AddFightSkill(208 ,20);  -- Vạn Vật Câu Phần 
            me.AddFightSkill(210 ,10);  -- Càn Khôn Đại Na Di 
            me.AddFightSkill(770 ,20);  -- Thâu Thiên Hoán Nhật 
            me.AddFightSkill(212 ,20);  -- Ly Hỏa Đại Pháp 
            me.AddFightSkill(211 ,20);  -- Thánh Hỏa Liêu Nguyên 
            me.AddFightSkill(772 ,10);  -- Thánh Hỏa Thần Công 
            me.AddFightSkill(861 ,10);  -- Thánh Hỏa Lệnh Pháp 
            me.AddFightSkill(862 ,10);  -- Kỹ năng cấp 120 
        elseif me.nFaction == 12 and me.nRouteId == 1 then    --Đoàn Thị 
            --Chỉ Đoàn 
            me.AddFightSkill(213 ,20);  -- Thần Chỉ Điểm Huyệt 
            me.AddFightSkill(215 ,10);  -- Đoàn Thị Chỉ Pháp 
            me.AddFightSkill(216 ,20);  -- Nhất Dương Chỉ 
            me.AddFightSkill(219 ,20);  -- Lăng Ba Vi Bộ 
            me.AddFightSkill(217 ,20);  -- Nhất Chỉ Càn Khôn 
            me.AddFightSkill(773 ,10);  -- Từ Bi Quyết 
            me.AddFightSkill(220 ,20);  -- Thí Nguyên Quyết 
            me.AddFightSkill(225 ,20);  -- Kim Ngọc Chỉ Pháp 
            me.AddFightSkill(223 ,20);  -- Càn Dương Thần Chỉ 
            me.AddFightSkill(775 ,10);  -- Càn Thiên Chỉ Pháp 
            me.AddFightSkill(863 ,10);  -- Diệu Đề Chỉ 
            me.AddFightSkill(864 ,10);  -- Kỹ năng cấp 120 
			elseif me.nFaction == 12 and me.nRouteId == 2 then
            --Khí Đoàn 
            me.AddFightSkill(226 ,20);  -- Phong Vân Biến Huyễn 
            me.AddFightSkill(227 ,10);  -- Đoàn Thị Tâm Pháp 
            me.AddFightSkill(228 ,20);  -- Bắc Minh Thần Công 
            me.AddFightSkill(230 ,20);  -- Thiên Nam Bộ Pháp 
            me.AddFightSkill(229 ,20);  -- Kim Ngọc Mãn Đường 
            me.AddFightSkill(776 ,10);  -- Lục Kiếm Tề Phát 
            me.AddFightSkill(231 ,20);  -- Khô Vinh Thiền Công 
            me.AddFightSkill(233 ,20);  -- Thiên Long Thần Công 
            me.AddFightSkill(232 ,20);  -- Lục Mạch Thần Kiếm 
            me.AddFightSkill(778 ,10);  -- Đoàn Gia Khí Kiếm 
            me.AddFightSkill(865 ,10);  -- Kinh Thiên Nhất Kiếm 
            --me.AddFightSkill(1662 ,20);  --Ám Hương 
            me.AddFightSkill(866 ,10);  --Sơ Ảnh 
        end 
    end 
end

function tbGMCard:OnDialog_taytuy()
 local tbOpt = {};
 
 local nChangeGerneIdx = Faction:GetChangeGenreIndex(me);
 if(nChangeGerneIdx >= 1)then
  local szMsg;
  if(Faction:Genre2Faction(me, nChangeGerneIdx) > 0 )then --كז`ӑў
   szMsg = "Tôi muốn chọn phái song tu";
  else
   szMsg = "Tôi muốn tẩy điểm võ công";
  end
  table.insert(tbOpt, {szMsg, self.OnChangeGenreFaction, self, me});
 end
 
 table.insert(tbOpt, {"Tẩy điểm tiềm năng", self.OnResetDian, self, me, 1});
 table.insert(tbOpt, {"Tẩy điểm kỹ năng", self.OnResetDian, self, me, 2});
 table.insert(tbOpt, {"Tẩy điểm Tiềm năng và kỹ năng", self.OnResetDian, self, me, 0});
 table.insert(tbOpt, {"Không thèm tẩy nữa"});
 local szMsg = "Tôi sẽ rửa được điểm được giao và điểm kỹ năng của tiềm năng cho bạn để phân bổ lại. Ở phía sau có một hang động, nơi bạn có thể trải nghiệm những cuộc chiến sau khi thử nghiệm hiệu quả của việc phân phối lại. Nếu không, bạn có thể quay lại với tôi. Khi bạn đã hài lòng với việc chuyển giao của người dân từ võ nghệ thuật ở mặt sau của võ nghệ thuật của bạn.";
 Dialog:Say(szMsg, tbOpt);
end
function tbGMCard:OnResetDian(pPlayer, nType)
 local szMsg = "";
 if (1 == nType) then
  pPlayer.SetTask(2,1,1);
  pPlayer.UnAssignPotential();
  szMsg = "Tẩy điểm thành công. có thể lại điểm Tiềm Năng";
 elseif (2 == nType) then
  pPlayer.ResetFightSkillPoint();
  szMsg = "Tẩy điểm thành công. có thể cộng lại điểm Kỹ Năng";
 elseif (0 == nType) then
  pPlayer.ResetFightSkillPoint();
  pPlayer.SetTask(2,1,1);
  pPlayer.UnAssignPotential();
  szMsg = "Tẩy điểm thành công, có thể cộng lại điểm Tiềm Năng và Kỹ Năng.";
 end
 Setting:SetGlobalObj(pPlayer);
 Dialog:Say(szMsg);
 Setting:RestoreGlobalObj();
end
function tbGMCard:OnChangeGenreFaction(pPlayer)
 local tbOpt = {};
 local nFactionGenre = Faction:GetChangeGenreIndex(pPlayer);
 for nFactionId, tbFaction in ipairs(Player.tbFactions) do
  if (Faction:CheckGenreFaction(pPlayer, nFactionGenre, nFactionId) == 1) then
   table.insert(tbOpt, {tbFaction.szName, self.OnChangeGenreFactionSelected, self, pPlayer, nFactionId});
  end
 end
 table.insert(tbOpt,{"Kết thúc đối thoại"});
 
 local szMsg = "Hãy chọn lại môn phái mà bạn muốn gia nhập vào.";
 
 Setting:SetGlobalObj(pPlayer);
 Dialog:Say(szMsg, tbOpt);
 Setting:RestoreGlobalObj();
end
function tbGMCard:OnChangeGenreFactionSelected(pPlayer, nFactionId)
 
 local nGenreId   = Faction:GetChangeGenreIndex(pPlayer);
 local nPrevFaction   = Faction:Genre2Faction(pPlayer, nGenreId);
 local nResult, szMsg = Faction:ChangeGenreFaction(pPlayer, nGenreId, nFactionId);
 if(nResult == 1)then
  if (nPrevFaction == 0) then -- ֚һՎנў
   szMsg = "Bạn đã chọn %s Hãy tìm gặp thương nhân tẩy tủy để mua loại vũ khí của môn phái bạn vừa chọn dùng. Hãy chú ý lựa chọn đúng loại vũ khí của môn phái đó nhé.";
  else
   szMsg = "Bạn đã chuyển sang %s，Chú ý khi thay đổi phái thì Hệ trên phi phong và Hệ của ngũ hành ấn cũng thay đổi theo."
  end
  szMsg = string.format(szMsg, Player.tbFactions[nFactionId].szName);
 end
 
 Setting:SetGlobalObj(pPlayer);
 Dialog:Say(szMsg);
 Setting:RestoreGlobalObj();
end 
