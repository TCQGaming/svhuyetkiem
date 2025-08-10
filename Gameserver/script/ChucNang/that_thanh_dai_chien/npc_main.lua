-----Dev TCQGaming
-----date : 28/09/2023
local tbNpcThatThanh = Npc:GetClass("npc_thatthanh");
tbNpcThatThanh.ISOPEN = 1;
tbNpcThatThanh.HONOR_CLASS_MONEY		= 8;	
tbNpcThatThanh.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbNpcThatThanh.HONOR_CLASS_MONEY,
	},
};
function tbNpcThatThanh:OnDialog()
DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\npc_main.lua");
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	local nDateTuan = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(9182,1) ~= nDateTuan then
		me.SetTask(9182,1, nDateTuan);
		me.SetTask(9182,2, 0);------Cá nhân PT
		me.SetTask(9182,3, 0);------Cá nhân BK
		me.SetTask(9182,4, 0);------Cá nhân LA
		me.SetTask(9182,5, 0);------Cá nhân DC
		me.SetTask(9182,6, 0);------Cá nhân DL
		me.SetTask(9182,7, 0);------Cá nhân TuongDuong
		me.SetTask(9182,8, 0);------Cá nhân ThanhDo
		me.SetTask(9182,9, 0);------Cá nhân ThanhDo
	end 
	
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szPT = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local szBK = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local szLA = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local szDC = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local szThanhDo = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local szTD = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local szDL = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local szDataPT = KFile.ReadTxtFile(szPT)
    local szDataBK = KFile.ReadTxtFile(szBK)
    local szDataLA = KFile.ReadTxtFile(szLA)
    local szDataDC = KFile.ReadTxtFile(szDC)
    local szDataTD = KFile.ReadTxtFile(szTD)
    local szDataThanhDo = KFile.ReadTxtFile(szThanhDo)
    local szDataDL = KFile.ReadTxtFile(szDL)
	if not szDataBK and not szDataLA then 
	szDataBK = " Vô Hệ"
	end 
	local szMsg = ""
    szMsg = szMsg .. "<color=green>Danh sách chiếm thành tuần này :\n<color>" ..
                    "<color=gold>Phượng Tường<color> : " .. (szDataPT or "Vô Hệ") .. "\n" ..
                    "<color=gold>Biện Kinh<color> : " .. (szDataBK or "Vô Hệ") .. "\n" ..
                    "<color=gold>Lâm An<color> : " .. (szDataLA or "Vô Hệ") .. "\n" ..
                    "<color=gold>Dương Châu<color> : " .. (szDataDC or "Vô Hệ") .. "\n" ..
                    "<color=gold>Thành Đô<color> : " .. (szDataThanhDo or "Vô Hệ") .. "\n" ..
                    "<color=gold>Tương Dương<color> : " .. (szDataTD or "Vô Hệ") .. "\n" ..
                    "<color=gold>Đại Lý<color> : " .. (szDataDL or "Vô Hệ") .. "\n" ..
                    ""

    local tbOpt =     {}
	
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	table.insert(tbOpt, {"Báo danh Thất Thành Đại Chiến",self.MenuDiChuyen,self});
	table.insert(tbOpt, {"Ta muốn đưa cả tổ đội tiến vào",self.vaomapctc,self});
	table.insert(tbOpt, {"Mua máu toàn tổ đội",self.muamau,self});
    table.insert(tbOpt, {"Nhận Thưởng Toàn Bang\n<color=green>(Bang Chủ Nhận)",self.thuongtoanbang,self});
    table.insert(tbOpt, {"Nhận Thưởng Cá Nhân\n<color=green>(Thành Viên Nhận)",self.thuongcanhan,self});
    table.insert(tbOpt, {"Ta muốn nhận viên đá dịch chuyển",self.nhandadichchuyen,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end
function tbNpcThatThanh:nhandadichchuyen()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể nhận thưởng vào "..nThu.." hàng tuần")
        return 0
    end
	
	local thamgia = me.GetTask(9182,9);
	if thamgia > 0 then
	Dialog:Say("Tuần này ngươi đã nhận đá dịch chuyển rồi");
		return 0;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0
    end
	   local pItem =   me.AddItem(18, 1, 2034, 11); -- rương ngoại trang quốc chủ biện kinh
   	me.SetItemTimeout(pItem, 2*60, 0);
	me.SetTask(9182,9,1)
end 
function tbNpcThatThanh:muamau()
CTC_7_Thanh:MuaMauNhanh()
end 

function tbNpcThatThanh:vaomapctc()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
	
	local szMsg =  [[
	<color=green>Bang hội của bạn chiếm thành nào nhận thưởng thành đó<color>
		]]

    local tbOpt =     {}
    table.insert(tbOpt, {"<color=cyan>Phượng Tường<color>",self.tienvaophuongtuong,self});
    table.insert(tbOpt, {"<color=cyan>Biện Kinh<color>",self.tienvaobienkinh,self});
    table.insert(tbOpt, {"<color=cyan>Dương Châu<color>",self.tienvaoduongchau,self});
    table.insert(tbOpt, {"<color=cyan>Đại Lý<color>",self.tienvaodaily,self});
    table.insert(tbOpt, {"<color=cyan>Lâm An<color>",self.tienvaolaman,self});
    table.insert(tbOpt, {"<color=cyan>Tương Dương<color>",self.tienvaotuongduong,self});
    table.insert(tbOpt, {"<color=cyan>Thành Đô<color>",self.tienvaothanhdo,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
else 
me.Msg("Bang của bạn chưa báo danh Thất Thành Đại Chiến")
return 
end 
end 

function tbNpcThatThanh:thuongtoanbang()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.TimeNhanThuongStart or nCurTimer > CTC_7_Thanh.TimeNhanThuongEnd then
        Dialog:Say("Thời gian nhận thưởng từ "..CTC_7_Thanh.TimeNhanThuongStart.." đến "..CTC_7_Thanh.TimeNhanThuongEnd.." cùng ngày diễn ra Thất Thành Đại Chiến")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể nhận thưởng vào "..nThu.." hàng tuần")
        return 0
    end
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szPT = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local szBK = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local szLA = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local szDC = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local szThanhDo = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local szTD = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local szDL = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local szDataPT = KFile.ReadTxtFile(szPT)
    local szDataBK = KFile.ReadTxtFile(szBK)
    local szDataLA = KFile.ReadTxtFile(szLA)
    local szDataDC = KFile.ReadTxtFile(szDC)
    local szDataTD = KFile.ReadTxtFile(szTD)
    local szDataThanhDo = KFile.ReadTxtFile(szThanhDo)
    local szDataDL = KFile.ReadTxtFile(szDL)
	if not szDataBK and not szDataLA then 
	szDataBK = " Vô Hệ"
	end 
	local szMsg = ""
    szMsg = szMsg .. "<color=green>Danh sách chiếm thành tuần này :\n<color>" ..
                    "<color=gold>Phượng Tường<color> : " .. (szDataPT or "Vô Hệ") .. "\n" ..
                    "<color=gold>Biện Kinh<color> : " .. (szDataBK or "Vô Hệ") .. "\n" ..
                    "<color=gold>Lâm An<color> : " .. (szDataLA or "Vô Hệ") .. "\n" ..
                    "<color=gold>Dương Châu<color> : " .. (szDataDC or "Vô Hệ") .. "\n" ..
                    "<color=gold>Thành Đô<color> : " .. (szDataThanhDo or "Vô Hệ") .. "\n" ..
                    "<color=gold>Tương Dương<color> : " .. (szDataTD or "Vô Hệ") .. "\n" ..
                    "<color=gold>Đại Lý<color> : " .. (szDataDL or "Vô Hệ") .. "\n" ..
                    ""


    local tbOpt =     {}
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Phượng Tường<color>",self.nhanthuongpt,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Biện Kinh<color>",self.nhanthuongbk,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Lâm An<color>",self.nhanthuonglaman,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Dương Châu<color>",self.nhanthuongduongchau,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Đại Lý<color>",self.nhanthuongdaily,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Tương Dương<color>",self.nhanthuongtuongduong,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Thành Đô<color>",self.nhanthuongthanhdo,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end 

function tbNpcThatThanh:thuongcanhan()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.TimeNhanThuongStart or nCurTimer > CTC_7_Thanh.TimeNhanThuongEnd then
        Dialog:Say("Thời gian nhận thưởng từ "..CTC_7_Thanh.TimeNhanThuongStart.." đến "..CTC_7_Thanh.TimeNhanThuongEnd.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể nhận thưởng vào "..nThu.." hàng tuần")
        return 0
    end
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szPT = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local szBK = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local szLA = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local szDC = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local szThanhDo = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local szTD = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local szDL = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local szDataPT = KFile.ReadTxtFile(szPT)
    local szDataBK = KFile.ReadTxtFile(szBK)
    local szDataLA = KFile.ReadTxtFile(szLA)
    local szDataDC = KFile.ReadTxtFile(szDC)
    local szDataTD = KFile.ReadTxtFile(szTD)
    local szDataThanhDo = KFile.ReadTxtFile(szThanhDo)
    local szDataDL = KFile.ReadTxtFile(szDL)
	if not szDataBK and not szDataLA then 
	szDataBK = " Vô Hệ"
	end 
	local szMsg = ""
    szMsg = szMsg .. "<color=green>Danh sách chiếm thành tuần này :\n<color>" ..
                    "<color=gold>Phượng Tường<color> : " .. (szDataPT or "Vô Hệ") .. "\n" ..
                    "<color=gold>Biện Kinh<color> : " .. (szDataBK or "Vô Hệ") .. "\n" ..
                    "<color=gold>Lâm An<color> : " .. (szDataLA or "Vô Hệ") .. "\n" ..
                    "<color=gold>Dương Châu<color> : " .. (szDataDC or "Vô Hệ") .. "\n" ..
                    "<color=gold>Thành Đô<color> : " .. (szDataThanhDo or "Vô Hệ") .. "\n" ..
                    "<color=gold>Tương Dương<color> : " .. (szDataTD or "Vô Hệ") .. "\n" ..
                    "<color=gold>Đại Lý<color> : " .. (szDataTD or "Vô Hệ") .. "\n" ..
                    ""


    local tbOpt =     {}
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Phượng Tường<color>",self.nhanthuong_canhan_pt,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Biện Kinh<color>",self.nhanthuong_canhan_bk,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Lâm An<color>",self.nhanthuong_canhan_laman,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Dương Châu<color>",self.nhanthuong_canhan_duongchau,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Đại Lý<color>",self.nhanthuong_canhan_daily,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Tương Dương<color>",self.nhanthuong_canhan_tuongduong,self});
    table.insert(tbOpt, {"Lãnh Thưởng bang chiếm <color=yellow>Thành Đô<color>",self.nhanthuong_canhan_thanhdo,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end 
function tbNpcThatThanh:nhanthuong_canhan_pt()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,2);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm phượng tường trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_PT_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Phượng Tường hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_bk()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,3);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Biện Kinh trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_BK_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Biện Kinh hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_duongchau()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,4);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Dương Châu trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_DC_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Dương Châu hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_laman()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,5);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Lâm An trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_LamAn_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Lâm An hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_tuongduong()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,6);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Tương Dương trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_TuongDuong_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Tương Dương hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_daily()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,7);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Đại Lý trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_DaiLy_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Đại Lý hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:nhanthuong_canhan_thanhdo()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
	    -- local nTongId = me.dwTongId;
    -- local checkResult = self:CheckDeclareWarRight(nTongId);

    -- if checkResult == 0 then
        -- return 0; 
    -- end
	
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if szTongName == tbRow.szTongName and me.szName == tbRow.szName then						
					nRank = tonumber(tbRow.Rank);
				end
			end
	end	
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
	local thamgia = me.GetTask(9182,8);
	if thamgia > 0 then
	Dialog:Say("Bạn đã nhận thưởng thành viên chiếm Thành Đô trước đó rồi");
		return 0;
	end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
ConfigAll.Thuong_Chiem_ThanhDo_CaNhan()
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Đô hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 
---------------------End cá nhân

function tbNpcThatThanh:nhanthuongpt()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_pt.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruphuongtuong.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_pt()
 me.AddStackItem(18, 1, 2034, 8, nil, 20); -- rương ctc
 	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_PT	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Phượng Tường hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_pt()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_pt.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:nhanthuongbk()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_bk.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrubienkinh.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_BK()
  	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_BK	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
 me.AddStackItem(18, 1, 2034, 8, nil, 30); -- rương ctc
   local pItem =   me.AddItem(18, 1, 2034, 10); -- rương ngoại trang quốc chủ biện kinh
   	me.SetItemTimeout(pItem, 1*24*60, 0);
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Biện Kinh hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_BK()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_bk.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end


function tbNpcThatThanh:nhanthuongduongchau()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_duongchau.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruduongchau.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
	self.GhiLogTenBang_NhanThuong_DC()
	   	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_DC	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
   me.AddStackItem(18, 1, 2034, 8, nil, 10); -- rương ctc
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Dương Châu hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_DC()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_duongchau.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:nhanthuonglaman()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_laman.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrulaman.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_la()
   	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_LA	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
me.AddStackItem(18, 1, 2034, 8, nil, 50); -- rương ctc
   local pItem = me.AddItem(18, 1, 2034, 9); -- rương ngoại trang quốc chủ lâm an
   	me.SetItemTimeout(pItem, 1*24*60, 0);
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Lâm An hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_la()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_laman.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:nhanthuongdaily()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_daily.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrudaily.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_DL()
 	   	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_DaiLy	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
   me.AddStackItem(18, 1, 2034, 8, nil, 10); -- rương ctc
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Đại Lý hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_DL()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_daily.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:nhanthuongtuongduong()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_tuongduong.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_tuongduong()
  	   	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_TuongDuong	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
   me.AddStackItem(18, 1, 2034, 8, nil, 10); -- rương ctc
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Tương Dương hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_tuongduong()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_tuongduong.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:nhanthuongthanhdo()
    if me.CountFreeBagCell() < 5 then
        Dialog:Say("Cần 5 ô trống hành trang!")
        return 0
    end
	
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
	
    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_thanhdo.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        Dialog:Say("Bang của bạn đã nhận thưởng từ Bang Chủ trước đó ngươi định bịp ta ư, nhận thưởng rồi mà.");
        return 0;
    end 

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtruthanhdo.txt"
    local szData = KFile.ReadTxtFile(szFile)

 if szData and string.find(szData, szTongName) then
 -------Phần thưởng
 self.GhiLogTenBang_NhanThuong_thanhdo()
   	   	local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_ThatThanh_ThanhDo	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
   me.AddStackItem(18, 1, 2034, 8, nil, 10); -- rương ctc
else 
        Dialog:Say("<color=yellow>Ta thấy bang hội của ngươi không chiếm được Thành Đô hiện nay bang hội : "..szData.." đã chiếm thành này")
end
end 

function tbNpcThatThanh:GhiLogTenBang_NhanThuong_thanhdo()
    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\nhanthuong\\bangchunhanthuong_thanhdo.txt"
    tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
end

function tbNpcThatThanh:WriteUsedCodeToFile(szTongName, szFile)
    local szData = KFile.ReadTxtFile(szFile)
    
    -- Chúng ta sẽ kiểm tra xem tên Bang Hội đã tồn tại trong file hay chưa trước khi thêm vào
    if not szData or not szData:find(szTongName) then
        szData = szData and (szData .. "\n" .. szTongName) or szTongName
        KFile.WriteFile(szFile, szData)
    end
end

function tbNpcThatThanh:CheckDeclareWarRight(nTongId)
    local nSelfKinId, nSelfMemberId = me.GetKinMember();
    local nMasterCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_MASTER);-----Chỉ Bang Chủ
    local nGeneralCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_WAR);-----Bang Chủ Và Phó Bang Chủ

    if nMasterCheck ~= 1 then
        Dialog:Say("<color=yellow>Chỉ Bang Chủ Mới Nhận Phần Thưởng Này");
        return 0;
    end
    return 1; 
end

function tbNpcThatThanh:tienvaophuongtuong()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
		    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end
        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2168,1864,3424)---- PT 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2168,1916,3638)---- PT 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2168,1651,3374)---- PT 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2168,1700,3616)---- PT 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2168,1864,3424)---- PT 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2168,1916,3638)---- PT 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2168,1651,3374)---- PT 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2168,1700,3616)---- PT 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end

function tbNpcThatThanh:tienvaobienkinh()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
		
		local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2163,1653,3186)---- BK 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2163,1492,3033)---- BK 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2163,1494,3199)---- BK 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2163,1567,2965)---- BK 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2163,1653,3186)---- BK 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2163,1492,3033)---- BK 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2163,1494,3199)---- BK 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2163,1567,2965)---- BK 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end

function tbNpcThatThanh:tienvaoduongchau()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
		
				    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2164,1510,3125)---- DC 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2164,1637,3133)---- DC 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2164,1633,3332)---- DC 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2164,1482,3292)---- DC 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2164,1510,3125)---- DC 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2164,1637,3133)---- DC 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2164,1633,3332)---- DC 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2164,1482,3292)---- DC 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end

function tbNpcThatThanh:tienvaolaman()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
		
				    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2165,1463,4144)---- LA 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2165,1478,3777)---- LA 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2165,1747,3829)---- LA 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2165,1796,4118)---- LA 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2165,1463,4144)---- LA 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2165,1478,3777)---- LA 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2165,1747,3829)---- LA 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2165,1796,4118)---- LA 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end


function tbNpcThatThanh:tienvaodaily()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
				    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2169,1629,3425)---- DL 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2169,1647,3154)---- DL 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2169,1384,3198)---- DL 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2169,1386,3436)---- DL 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2169,1629,3425)---- DL 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2169,1647,3154)---- DL 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2169,1384,3198)---- DL 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2169,1386,3436)---- DL 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end

function tbNpcThatThanh:tienvaotuongduong()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
				    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2166,1753,3043)---- TuongDuong 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2166,1458,2951)---- TuongDuong 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2166,1753,3305)---- TuongDuong 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2166,1514,3241)---- TuongDuong 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2166,1753,3043)---- TuongDuong 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2166,1458,2951)---- TuongDuong 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2166,1753,3305)---- TuongDuong 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2166,1514,3241)---- TuongDuong 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end

function tbNpcThatThanh:tienvaothanhdo()
    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianThamGiaBatDau or nCurTimer > CTC_7_Thanh.ThoiGianThamGiaKetThuc then
        Dialog:Say("Thời gian tham gia từ "..CTC_7_Thanh.ThoiGianThamGiaBatDau.." đến "..CTC_7_Thanh.ThoiGianThamGiaKetThuc.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)

    if szData and string.find(szData, szTongName) then
        local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
        local szMemberData = KFile.ReadTxtFile(szMemberFile)
        local bIsMemberExists = false

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if bangName == szTongName and playerName == me.szName then
                    bIsMemberExists = true
                    break
                end
            end
        end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId); -- Đây là thông tin tổ đội
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0;
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0;
    end

    for i = 1, #tbMember do
        local nMapId = 8
        local nPlayerId = tbMember[i];
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;

        if not pPlayer or pPlayer.nMapId ~= nMapId then
            me.Msg("Trong đội các ngươi "..playerName.." không ở gần đây, nên hắn không tiến vào được!");
            return 
        end
		      if pPlayer.GetCamp() == 0 then
            Dialog:Say(""..playerName.." chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta");
            return 0;
        end
				    local pTong_Mem = KTong.GetTong(pPlayer.dwTongId)
			local szTongNameMem = pTong_Mem.GetName()
		    local pTong_Me = KTong.GetTong(me.dwTongId)
			local szTongNameMe = pTong_Me.GetName()
		if szTongNameMe ~= szTongNameMem then 
		            me.Msg("Lạ thật , ngươi định nối giáo cho giặc hay sao trong tổ đội có <color=yellow>Bang Địch "..szTongNameMem.."<color> hãy trục xuất hắn ngay đi");
            return 0
        end

        if not bIsMemberExists then
            local nMemberCount = 0

            if szMemberData then
                for line in szMemberData:gmatch("[^\r\n]+") do
                    local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                    if bangName == szTongName then
                        nMemberCount = nMemberCount + 1
                    end
                end
            end

            if nMemberCount >= CTC_7_Thanh.SoNguoi then
                Dialog:Say("Bang của bạn đã đủ "..CTC_7_Thanh.SoNguoi.." thành viên tham gia. Không thể tham gia thêm.")
                return
            end
			table.insert(CTC_7_Thanh.PlayerList,pPlayer.nId);
            self:ghilogthanhvienthamgia(szTongName, pPlayer.szName)
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2167,1688,3301)---- ThanhDo 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2167,1666,3137)---- ThanhDo 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2167,1537,3147)---- ThanhDo 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2167,1568,3327)---- ThanhDo 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        else
			local nRandomToaDo = MathRandom(1,4)
			if nRandomToaDo == 1 then 
            pPlayer.NewWorld(2167,1688,3301)---- ThanhDo 
			elseif nRandomToaDo == 2 then 
            pPlayer.NewWorld(2167,1666,3137)---- ThanhDo 			
			elseif nRandomToaDo == 3 then 
            pPlayer.NewWorld(2167,1537,3147)---- ThanhDo 			
			elseif nRandomToaDo == 4 then 
            pPlayer.NewWorld(2167,1568,3327)---- ThanhDo 
			end 
			me.Msg("Bạn đã tham gia <color=yellow>Thất Thành Đại Chiến<color>")
        end
	end 
        local tbBangMembers = {} -- Bảng lưu trữ số lượng thành viên từng bang hội

        if szMemberData then
            for line in szMemberData:gmatch("[^\r\n]+") do
                local bangName, playerName = line:match("^(%S+)%s+(%S+)$")

                if not tbBangMembers[bangName] then
                    tbBangMembers[bangName] = 1
                else
                    tbBangMembers[bangName] = tbBangMembers[bangName] + 1
                end
            end
        end
        local nTongMemberCount = tbBangMembers[szTongName] or 0
        nTongMemberCount = nTongMemberCount + 1 -- Tăng lên 1 để bắt đầu từ 1
	local szBangInfo = string.format("<color=cyan>"..me.szName.."<color> của Bang Hội <color=cyan>%s<color> đã tham gia vào Thất Thành Đại Chiến tổng số tham gia: <color=yellow>%d/%d thành viên<color>", szTongName, nTongMemberCount, CTC_7_Thanh.SoNguoi)
		    KDialog.MsgToGlobal(szBangInfo)
    else
        Dialog:Say("Bang hội của bạn chưa báo danh Thất Thành Đại Chiến.")
    end
end


function tbNpcThatThanh:ghilogthanhvienthamgia(szTongName, szPlayerName)
    local szMemberFile = "\\script\\ChucNang\\that_thanh_dai_chien\\thanhvienthamgia.txt"
    local logMessage = ""..szTongName.."\t"..szPlayerName.."\r\n"
    KFile.AppendFile(szMemberFile, logMessage)
end


function tbNpcThatThanh:MenuDiChuyen()
DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\npc_main.lua");
    local nTongId = me.dwTongId;
    local checkResult = self:CheckDeclareWarRight(nTongId);

    if checkResult == 0 then
        return 0; -- Người chơi không có quyền tuyên chiến, dừng menu
    end
	    local nCurTime = GetTime()
    local nWeekDay = tonumber(os.date("%w", nCurTime))
    local nCurTimer = tonumber(GetLocalDate("%H%M"))
	    local pTong = KTong.GetTong(me.dwTongId)

    if not pTong then
        Dialog:Say("Bạn chưa có bang hội.")
        return 0
    end
	
    if nCurTimer < CTC_7_Thanh.ThoiGianBaoDanh7Thanh or nCurTimer > CTC_7_Thanh.ThoiGianEndBaoDanh7Thanh then
        Dialog:Say("Thời gian Báo Danh từ "..CTC_7_Thanh.ThoiGianBaoDanh7Thanh.." đến "..CTC_7_Thanh.ThoiGianEndBaoDanh7Thanh.."")
        return
    end
  if nWeekDay ~= CTC_7_Thanh.WEEKDAY then 
        local nThu = ""
        if CTC_7_Thanh.WEEKDAY == 0 then 
            nThu = "Chủ Nhật"
        elseif CTC_7_Thanh.WEEKDAY == 1 then 
            nThu = "Thứ 2"	
        elseif CTC_7_Thanh.WEEKDAY == 2 then 
            nThu = "Thứ 3"
        elseif CTC_7_Thanh.WEEKDAY == 3 then 
            nThu = "Thứ 4"	
        elseif CTC_7_Thanh.WEEKDAY == 4 then 
            nThu = "Thứ 5"	
        elseif CTC_7_Thanh.WEEKDAY == 5 then 
            nThu = "Thứ 6"
        elseif CTC_7_Thanh.WEEKDAY == 6 then 
            nThu = "Thứ 7"
        end 
        Dialog:Say("Người chơi có thể báo danh tham gia hoạt động vào "..nThu.." hàng tuần")
        return 0
    end

	local szMsg =  [[
	<color=green>Thất Thành Đại Chiến<color>
		]]
    local tbOpt =     {}
	
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	table.insert(tbOpt, {"Ta là Bang Chủ ta đến để báo danh Thất Thành Đại Chiến",self.baodanhloidai,self});
    table.insert(tbOpt, {"Kết thúc đối thoại"});

    Dialog:Say(szMsg, tbOpt)
end


function tbNpcThatThanh:CheckDeclareWarRight(nTongId)
    local nSelfKinId, nSelfMemberId = me.GetKinMember();
    local nMasterCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_MASTER);
    local nGeneralCheck = Tong:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, Tong.POW_WAR);

    if nGeneralCheck ~= 1 then
        Dialog:Say("<color=yellow>Ngươi không có quyền báo danh Thất Thành Đại Chiến \nChỉ bang chủ mới được báo danh.");
        return 0;
    end
    return 1; -- Người chơi có quyền tuyên chiến
end


function tbNpcThatThanh:baodanhbanghoi(pPlayer)
    if not pPlayer then 
        return;
    end
    
    local pTong = KTong.GetTong(pPlayer.dwTongId);
    local szTongName = pTong.GetName();
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt";
    
    local logMessage = ""..szTongName.."\r\n";
    KFile.AppendFile(szFile, logMessage);
end

function tbNpcThatThanh:baodanhloidai()
    DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\npc_main.lua")
	
    local nDong = me.GetJbCoin()
if nDong < 300*10000 then 
	Dialog:Say("Bạn chưa đủ 300 vạn đồng thường rồi")
return 
end

    local pTong = KTong.GetTong(me.dwTongId)
    local szTongName = pTong.GetName()
    local szFile = "\\script\\ChucNang\\that_thanh_dai_chien\\baodanh.txt"
    local szData = KFile.ReadTxtFile(szFile)  
    local tbRegisteredBangHois = {}
    if szData then
        for line in szData:gmatch("[^\r\n]+") do
            table.insert(tbRegisteredBangHois, line)
        end
        if #tbRegisteredBangHois < CTC_7_Thanh.SoLuongBangBaoDanh then
            local bTongExistsInLog = false
            for _, registeredTongName in ipairs(tbRegisteredBangHois) do
                if registeredTongName == szTongName then
                    bTongExistsInLog = true
                    break
                end
            end

            if not bTongExistsInLog then
                table.insert(tbRegisteredBangHois, szTongName)
                local updatedLogContent = table.concat(tbRegisteredBangHois, "\n")
                KFile.WriteFile(szFile, updatedLogContent, false)
				KDialog.MsgToGlobal("Bang Hội <color=yellow>"..szTongName.." <color>Báo danh Thất Thành Đại Chiến thành công")
            else
                Dialog:Say("Bang hội đã báo danh trước đó rồi.")
            end
        else
            Dialog:Say("Đã đạt đến số lượng tối đa (10) bang hội đã báo danh bạn đến đây quá trễ.")
        end
    else
        local logMessage = ""..szTongName.."\n"
        KFile.WriteFile(szFile, logMessage)
		KDialog.MsgToGlobal("Bang Hội <color=yellow>"..szTongName.." <color>Báo danh Thất Thành Đại Chiến thành công")
    end
		me.AddJbCoin(-300*10000)
end

