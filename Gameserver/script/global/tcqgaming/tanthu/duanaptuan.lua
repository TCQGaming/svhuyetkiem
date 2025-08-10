local tbDuaNapTuan ={};
SpecialEvent.tbDuaNapTuan= tbDuaNapTuan;
tbDuaNapTuan.Folder_nDuaNapTuan = "\\script\\global\\tcqgaming\\tanthu\\"; -- duong dan folder
tbDuaNapTuan.List_Nap_Tuan = "\\tanthu\\listnaptuan.txt"; -- list 
tbDuaNapTuan.AddTaskGroup = 9167;
tbDuaNapTuan.AddTaskId = 14;-- task lưu lãnh thưởng
function tbDuaNapTuan:OnDialog()
DoScript("\\script\\global\\tcqgaming\\tanthu\\duanaptuan.lua");
	local szMsg = "Xem TOP<color=cyan>  ";
	local tbOpt =
	{
		{"<color=yellow>Xem Bảng Xếp Hạng TOP Nạp Tuần<color>", self.xembxh,self},
		-- {"<color=yellow>Lãnh Thưởng TOP Xếp Hạng 10<color>", self.lanhthuong,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbDuaNapTuan:xembxh()
DoScript("\\script\\global\\tcqgaming\\tanthu\\duanaptuan.lua");
	--------------------------------------
	local szPlayer1 = "Không 1";
	local nTotalVSV1 = 0;
	local szPlayer2 = "Không 2";
	local nTotalVSV2 = 0;
	local szPlayer3 = "Không 3";
	local nTotalVSV3 = 0;
	local szPlayer4 = "Không 4";
	local nTotalVSV4 = 0;	
	local szPlayer5 = "Không 5";
	local nTotalVSV5 = 0;	
	local szPlayer6 = "Không 6";
	local nTotalVSV6 = 0;	
	local szPlayer7 = "Không 7";
	local nTotalVSV7 = 0;	
	local szPlayer8 = "Không 8";
	local nTotalVSV8 = 0;	
	local szPlayer9 = "Không 9";
	local nTotalVSV9 = 0;	
	local szPlayer10 = "Không 10";
	local nTotalVSV10 = 0;		

	---load BXH-------------------------------------------------------
	 local tbsortpos = Lib:LoadTabFile("\\script\\global\\tcqgaming\\tanthu\\ListNapTuan.txt")
	 
	local nLineCount = #tbsortpos;
	local nId1 = nLineCount;
	tbDuaNapTuan.tbDanhSach = {};
	tbDuaNapTuan.tbTopList = {};
	
	for nLine=1, nLineCount do
		local nId  = #self.tbDanhSach + 1;
		local szNames = tbsortpos[nLine].szName;
		local nCount_1 = tonumber(tbsortpos[nLine].nTongNap) or 0;		
		self.tbDanhSach[szNames] = nCount_1;
	end
	
	local tempTop = {};
	for i=1, 10 do
		tempTop[i] = 0
		if i == 1 then
			for sPlayerName, nCount in pairs(self.tbDanhSach) do
				if nCount > tempTop[i] then
					self.tbTopList[i] = {};
					self.tbTopList[i].szName = sPlayerName;
					self.tbTopList[i].nTotal = nCount;
					tempTop[i] = nCount;
				end
			end
		else
			for sPlayerName, nCount in pairs(self.tbDanhSach) do
				if nCount > tempTop[i] and nCount <= tempTop[(i-1)] then
					local nCheckTop = 0
					for _, v in pairs(self.tbTopList) do
						if v.szName == sPlayerName then
							nCheckTop = 1; break;
						end
					end
					if nCheckTop == 0 then
						self.tbTopList[i] = {};
						self.tbTopList[i].szName = sPlayerName;
						self.tbTopList[i].nTotal = nCount;
						tempTop[i] = nCount;
					end
				end
			end
		end
	end
		
	local nXepHang = 0;
	for k,v in pairs(self.tbTopList) do
		if me.szName == v.szName then
			nXepHang = k;
			break;
		end
	end
		local diemtk = me.GetTask(9167,12);	
	local tbOpt = {};
		local szTitle =	"BXH <color=red>Đua TOP Nạp Tuần Này<color><enter>\n"..

						"<color=yellow>Top 1:   "..(self.tbTopList[1].szName).."     "..(self.tbTopList[1].nTotal).." VạnĐồng<color>\n"..
						"<color=gold>Top 2:   "..(self.tbTopList[2].szName).."     "..(self.tbTopList[2].nTotal).." VạnĐồng<color>\n"..
						"<color=green>Top 3:   "..(self.tbTopList[3].szName).."     "..(self.tbTopList[3].nTotal).." VạnĐồng<color>\n"..
						"Top 4:   "..(self.tbTopList[4].szName).."     "..(self.tbTopList[4].nTotal).." VạnĐồng\n"..
						"Top 5:   "..(self.tbTopList[5].szName).."     "..(self.tbTopList[5].nTotal).." VạnĐồng\n"..
						"Top 6:   "..(self.tbTopList[6].szName).."     "..(self.tbTopList[6].nTotal).." VạnĐồng\n"..
						"Top 7:   "..(self.tbTopList[7].szName).."     "..(self.tbTopList[7].nTotal).." VạnĐồng\n"..
						"Top 8:   "..(self.tbTopList[8].szName).."     "..(self.tbTopList[8].nTotal).." VạnĐồng\n"..
						"Top 9:   "..(self.tbTopList[9].szName).."     "..(self.tbTopList[9].nTotal).." VạnĐồng\n"..
						"Top 10:   "..(self.tbTopList[10].szName).."     "..(self.tbTopList[10].nTotal).." VạnĐồng\n\n"..

						"=> Nhận thưởng vào: <color=green>Chủ Nhật sau 22h00\nĐến 23h59 Cùng ngày<color>"..														
						"\n=><color=red> Sang thứ 2 là không thể lãnh thưởng<color>"..														
						"\n=> Số lượng đã nạp tuần này của bạn: <color=red>"..diemtk.."<color> VạnĐồng\n"..						
						"=> Xếp hạng hiện tại: <color=yellow>Top "..nXepHang.."<color>\n"..
						"";
		table.insert(tbOpt,{"Đồng ý <color=yellow>Xem phần thưởng tuần này<color>",self.xemphanthuongtuan, self});	
		table.insert(tbOpt,{"Đồng ý <color=yellow>Nhận Thưởng<color>",self.NhanThuong, self,nXepHang});	
		table.insert(tbOpt,{"Kết thúc "});

	Dialog:Say(szTitle, tbOpt);
end
function tbDuaNapTuan:xemphanthuongtuan()
local nTenBang = "Danh sách quà tặng thưởng TOP Nạp tuần này"
-- local szTitle = "<color=gold>TOP 1:\n<color><color=red>2 Huyền Tinh cấp 8(Khóa)\n10 Lệnh bài đồ hải tặc cấp 2(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n100 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "<color=gold>TOP 2:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n10 Lệnh bài đồ hải tặc cấp 2(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n70 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "<color=gold>TOP 3:\n<color><color=red>1 Huyền Tinh cấp 7(Khóa)\n10 Lệnh bài đồ hải tặc cấp 2(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n50 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "<color=gold>TOP 4:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n10 Lệnh bài đồ hải tặc cấp 2(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n30 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "<color=gold>TOP 5:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n10 Lệnh bài đồ hải tặc cấp 2(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n30 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "<color=gold>TOP 6-10:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n15 Rương trang bị đồng hành(Không Khóa)\n"..
				-- "";
				local szTitle = "<color=gold>TOP 1:\n<color><color=red>2 Huyền Tinh cấp 9(Khóa)\n10 Lệnh bài đồ hải tặc cấp 3(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n500 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 2:\n<color><color=red>1 Huyền Tinh cấp 9(Khóa)\n10 Lệnh bài đồ hải tặc cấp 3(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n500 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 3:\n<color><color=red>2 Huyền Tinh cấp 8(Khóa)\n10 Lệnh bài đồ hải tặc cấp 3(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n500 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 4:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n10 Lệnh bài đồ hải tặc cấp 3(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n200 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 5:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n10 Lệnh bài đồ hải tặc cấp 3(Khóa)\n1 Bổ Tu Lệnh(Khóa)\n150 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 6-10:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n100 Rương trang bị đồng hành(Không Khóa)\n"..
				"";
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end 
function tbDuaNapTuan:NhanThuong(nXepHang)

		local nNgayMoSV = DietQuai:NgayMoMayChu();
if nNgayMoSV < 7 then 
			Dialog:Say("Tuần sau mới mở tính năng này!! Hiện nay sever mở từ thứ 7 , tới hôm nay mới mở được <color=yellow>"..nNgayMoSV.." ngày\nTOP này khai mở từ tuần thứ 2 trở đi!!");
		return 0;
end 
local tbItemInfo = {bForceBind = 1};
	local nCount = me.GetTask(self.AddTaskGroup,self.AddTaskId);
 	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay == 0 then
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	if nCurTime > 2159 then 
	if nCount > 0 then
		Dialog:Say("Một tuần chỉ có thể nhận thưởng 1 lần");
		return 0;
	end
		if me.CountFreeBagCell() < 5 then
		Dialog:Say("Trống 5 ô mới nhận được Phần Thưởng");
		return 0;
	end	
	if nXepHang == 1 then
ConfigAll.Top_1_NapTuan()
		me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 2 then
ConfigAll.Top_2_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 3 then
ConfigAll.Top_3_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 4 then
ConfigAll.Top_4_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	
	elseif nXepHang == 5 then
ConfigAll.Top_5_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------
	
	elseif nXepHang == 6 then
ConfigAll.Top_6_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 7 then
ConfigAll.Top_7_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 8 then
ConfigAll.Top_8_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 9 then
ConfigAll.Top_9_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
----------------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);


	elseif nXepHang == 10 then
ConfigAll.Top_10_NapTuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tích Lũy Nạp Tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	
	else
	Dialog:Say("Ngươi không có trong bảng xếp hạng TOP 10 nạp tuần này<color>");
	end
	

	else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
end
else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
end	
end

function tbDuaNapTuan:GhiFile_duanaptuan()
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local nTongNap = me.GetTask(9167, 12)
    local szFile = "\\script\\global\\tcqgaming\\tanthu\\ListNapTuan.txt"
    local szData = KFile.ReadTxtFile(szFile)
    -- Kiểm tra xem người chơi có tồn tại trong bảng hay không
    local bDataExists = false
    -- Kiểm tra xem dữ liệu có thay đổi hay không
    local bDataChanged = false
    local lines = {}
    
    if szData then
        for line in szData:gmatch("[^\r\n]+") do
            local name, vsv, date = line:match("([^\t]+)\t([^\t]+)\t([^\t]+)")
            if name and vsv and date then
                if name == me.szName then
                    bDataExists = true -- Đánh dấu rằng người chơi tồn tại trong bảng
                    if tonumber(vsv) ~= nTongNap then
                        -- Giá trị của task khác với giá trị đã lưu trong bảng
                        bDataChanged = true
                        vsv = nTongNap -- Cập nhật giá trị vsv trong tệp log
                        date = szDate -- Cập nhật lại thời gian trong tệp log
                    end
                end
                table.insert(lines, name .. "\t" .. vsv .. "\t" .. date)
            end
        end
    end
    
    -- Nếu người chơi không tồn tại trong bảng, thêm dòng mới vào tệp log
    if not bDataExists then
        bDataChanged = true -- Đánh dấu dữ liệu đã thay đổi
        table.insert(lines, me.szName .. "\t" .. nTongNap .. "\t" .. szDate)
    end
    
    -- Thêm dòng trống vào cuối tệp log
    table.insert(lines, "")
    
    -- Ghi log vào tệp
    KFile.WriteFile(szFile, table.concat(lines, "\r\n"))
end

function tbDuaNapTuan:ResetFile_duanaptuan()
        local szFile = "\\script\\global\\tcqgaming\\tanthu\\ListNapTuan.txt"
	KFile.WriteFile(szFile, "szName\tnTongNap\tszDate\nKhông xác định 1\t1\t2021-08-05 11:25:08\nKhông xác định 2\t2\t2021-08-05 11:25:34\nKhông xác định 3\t3\t2021-08-05 11:25:49\nKhông xác định 4\t4\t2021-08-05 11:25:56\nKhông xác định 5\t5\t2021-08-05 11:25:56\nKhông xác định 6\t6\t2021-08-05 11:25:56\nKhông xác định 7\t7\t2021-08-05 11:25:56\nKhông xác định 8\t8\t2021-08-05 11:25:56\nKhông xác định 9\t9\t2021-08-05 11:25:56\nKhông xác định 10\t10\t2021-08-05 11:25:56\n");	
end

local function fnStrValue(szVal)
	local varType = loadstring("return "..szVal)();
	if type(varType) == 'function' then
		return varType();
	else
		return varType;
	end
end
function tbDuaNapTuan:StrVal(szParam)	--加载题库
	local szText = string.gsub(szParam, "<%%(.-)%%>", fnStrValue);
	return szText;
end

