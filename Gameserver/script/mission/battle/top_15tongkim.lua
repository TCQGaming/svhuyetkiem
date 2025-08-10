
Battle.Folder_top_15tongkim = "\\script\\mission\\battle\\"; -- duong dan folder
Battle.List_top_15tongkim = "top_15tongkim.txt"; -- list 
Battle.AddTaskGroup = 9152;
Battle.AddTaskCount = 1;-- task save vsv
Battle.nTaskIdWeek = 2;-- task ngay
Battle.AddTaskId = 3;-- task nhận thưởng

function Battle:top_15tongkim()
DoScript("\\script\\mission\\battle\\top_15tongkim.lua");
	--------------------------------------
	local szPlayer1 = "Chưa xác định 1";
	local nTotalVSV1 = 0;
	local szPlayer2 = "Chưa xác định 2";
	local nTotalVSV2 = 0;
	local szPlayer3 = "Chưa xác định 3";
	local nTotalVSV3 = 0;
	local szPlayer4 = "Chưa xác định 4";
	local nTotalVSV4 = 0;	
	local szPlayer5 = "Chưa xác định 5";
	local nTotalVSV5 = 0;	
	local szPlayer6 = "Chưa xác định 6";
	local nTotalVSV6 = 0;	
	local szPlayer7 = "Chưa xác định 7";
	local nTotalVSV7 = 0;	
	local szPlayer8 = "Chưa xác định 8";
	local nTotalVSV8 = 0;	
	local szPlayer9 = "Chưa xác định 9";
	local nTotalVSV9 = 0;	
	local szPlayer10 = "Chưa xác định 10";
	local nTotalVSV10 = 0;		

	---load BXH-------------------------------------------------------
	local tbsortpos = Lib:LoadTabFile(Battle.Folder_top_15tongkim..Battle.List_top_15tongkim.."");
	local nLineCount = #tbsortpos;
	local nId1 = nLineCount;
	Battle.tbDanhSach = {};
	Battle.tbTopList = {};
	
	for nLine=1, nLineCount do
		local nId  = #self.tbDanhSach + 1;
		local szNames = tbsortpos[nLine].szName;
		local nCount_1 = tonumber(tbsortpos[nLine].nVSV) or 0;		
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
		local diemtk = me.GetTask(9152,1);	
	local tbOpt = {};
		local szTitle =	"BXH <color=red>Tống Kim Tuần (Trận 21h)<color><enter>\n"..

						"<color=yellow>Top 1:   "..(self.tbTopList[1].szName).."     "..(self.tbTopList[1].nTotal).." Điểm<color>\n"..
						"<color=gold>Top 2:   "..(self.tbTopList[2].szName).."     "..(self.tbTopList[2].nTotal).." Điểm<color>\n"..
						"<color=green>Top 3:   "..(self.tbTopList[3].szName).."     "..(self.tbTopList[3].nTotal).." Điểm<color>\n"..
						"Top 4:   "..(self.tbTopList[4].szName).."     "..(self.tbTopList[4].nTotal).." Điểm\n"..
						"Top 5:   "..(self.tbTopList[5].szName).."     "..(self.tbTopList[5].nTotal).." Điểm\n"..
						"Top 6:   "..(self.tbTopList[6].szName).."     "..(self.tbTopList[6].nTotal).." Điểm\n"..
						"Top 7:   "..(self.tbTopList[7].szName).."     "..(self.tbTopList[7].nTotal).." Điểm\n"..
						"Top 8:   "..(self.tbTopList[8].szName).."     "..(self.tbTopList[8].nTotal).." Điểm\n"..
						"Top 9:   "..(self.tbTopList[9].szName).."     "..(self.tbTopList[9].nTotal).." Điểm\n"..
						"Top 10:   "..(self.tbTopList[10].szName).."     "..(self.tbTopList[10].nTotal).." Điểm\n\n"..

						"=> Nhận thưởng vào: \n<color=green>Chủ Nhật sau 22h00 \nĐến 23h59 Kết Thúc nhận<color>\n"..															
						"=> Điểm TK Tuần của bạn: <color=red>"..diemtk.."<color> Điểm\n"..						
						"=> Xếp hạng hiện tại: <color=yellow>Top "..nXepHang.."<color>\n"..
						"";
				table.insert(tbOpt,{"Đồng ý <color=yellow>Xem phần thưởng tuần này<color>",self.xemphanthuongtuan, self});	
			table.insert(tbOpt,{"Đồng ý <color=yellow>Nhận Thưởng<color>",self.NhanThuongTop_tk, self,nXepHang});	
		table.insert(tbOpt,{"Kết thúc "});

	Dialog:Say(szTitle, tbOpt);
end

function Battle:xemphanthuongtuan()
local nTenBang = "Danh sách quà tặng thưởng TOP Tống Kim tuần"
-- local szTitle = "<color=gold>TOP 1:\n<color><color=red>2 Huyền Tinh cấp 8(Khóa)\n2000 Vỏ Sò Vàng(Khóa)\n"..
				-- "<color=gold>TOP 2:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n1500 Vỏ Sò Vàng(Khóa)\n"..
				-- "<color=gold>TOP 3:\n<color><color=red>1 Huyền Tinh cấp 7(Khóa)\n1000 Vỏ Sò Vàng(Khóa)\n"..
				-- "<color=gold>TOP 4:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n500 Vỏ Sò Vàng(Khóa)\n"..
				-- "<color=gold>TOP 5-10:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n250 Vỏ Sò Vàng(Khóa)\n"..
				-- "";
				local szTitle = "<color=gold>TOP 1:\n<color><color=red>2 Huyền Tinh cấp 9(Khóa)\n2000 Vỏ Sò Vàng(Khóa)\n500 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 2:\n<color><color=red>2 Huyền Tinh cấp 8(Khóa)\n1500 Vỏ Sò Vàng(Khóa)\n250 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 3:\n<color><color=red>1 Huyền Tinh cấp 8(Khóa)\n1000 Vỏ Sò Vàng(Khóa)\n200 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 4:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n500 Vỏ Sò Vàng(Khóa)\n150 Rương trang bị đồng hành(Không Khóa)\n"..
				"<color=gold>TOP 5-10:\n<color><color=red>2 Huyền Tinh cấp 7(Khóa)\n250 Vỏ Sò Vàng(Khóa)\n100 Rương trang bị đồng hành(Không Khóa)\n"..
				"";
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end 

function Battle:NhanThuongTop_tk(nXepHang)
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
		ConfigAll.TOP_1_TongKim_Tuan()
		me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 2 then
	ConfigAll.TOP_2_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 3 then
	ConfigAll.TOP_3_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 4 then
	ConfigAll.TOP_4_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	
	elseif nXepHang == 5 then
	ConfigAll.TOP_5_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
		
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	
	elseif nXepHang == 6 then
	ConfigAll.TOP_6_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 7 then
	ConfigAll.TOP_7_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 8 then
	ConfigAll.TOP_8_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 9 then
	ConfigAll.TOP_9_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
----------------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);


	elseif nXepHang == 10 then
	ConfigAll.TOP_10_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Tống Kim hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	
else
    -- Người chơi không có trên bảng xếp hạng, hiển thị thông báo chặn
    Dialog:Say("Bạn không có trên bảng xếp hạng. Không thể nhận thưởng.");	
end
	

	else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
end
else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
end	
end

function Battle:Save_top_15tongkim(pPlayer)
	if not pPlayer then
		return 0;
	end
		local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime());
	local nVSV = pPlayer.GetTask(9152,1);
		local szFile = Battle.Folder_top_15tongkim..Battle.List_top_15tongkim.."";
		KFile.AppendFile(szFile, ""..pPlayer.szName.."\t"..nVSV.."\t"..szDate.."\r\n");
end
function Battle:ResetFile_15tongkim()
		local szFile = Battle.Folder_top_15tongkim..Battle.List_top_15tongkim.."";
	KFile.WriteFile(szFile, "szName\tnVSV\tszDate\nKhông xác định 1\t1\t2021-08-05 11:25:08\nKhông xác định 2\t2\t2021-08-05 11:25:34\nKhông xác định 3\t3\t2021-08-05 11:25:49\nKhông xác định 4\t4\t2021-08-05 11:25:56\nKhông xác định 5\t5\t2021-08-05 11:25:56\nKhông xác định 6\t6\t2021-08-05 11:25:56\nKhông xác định 7\t7\t2021-08-05 11:25:56\nKhông xác định 8\t8\t2021-08-05 11:25:56\nKhông xác định 9\t9\t2021-08-05 11:25:56\nKhông xác định 10\t10\t2021-08-05 11:25:56\n");	
	
end

function Battle:ResetFile_BanTreoTK()
local szBanFile = "\\script\\global\\tcqgaming\\npc\\ban\\BanTongKimTreo.txt"
local szHeader = "dwHardWareId\tszName"
KFile.WriteFile(szBanFile, szHeader)
end

local function fnStrValue(szVal)
	local varType = loadstring("return "..szVal)();
	if type(varType) == 'function' then
		return varType();
	else
		return varType;
	end
end
function Battle:StrVal(szParam)	--加载题库
	local szText = string.gsub(szParam, "<%%(.-)%%>", fnStrValue);
	return szText;
end