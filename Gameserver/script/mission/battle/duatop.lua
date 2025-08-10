
Battle.Folder_top_15tongkim1 = "\\script\\mission\\battle\\"; -- duong dan folder
Battle.List_top_15tongkim1 = "logduatop.txt"; -- list 
Battle.AddTaskGroup = 9153;
Battle.AddTaskCount = 1;-- task giao vp
Battle.nTaskIdWeek = 2;-- task ngay giao
Battle.AddTaskId = 3;-- task nhận thưởng ok rồi a

function Battle:TOP_CONGTRANG()
DoScript("\\script\\mission\\battle\\duatop.lua");
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
	local tbsortpos = Lib:LoadTabFile(Battle.Folder_top_15tongkim1..Battle.List_top_15tongkim1.."");
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

		local diemtk = me.GetTask(9153,1);	
	local tbOpt = {};
		local szTitle =			
						"<color=yellow>Top 1 Bang:   "..(self.tbTopList[1].szName).."     "..(self.tbTopList[1].nTotal).." điểm<color>\n"..
						"<color=gold>Top 2 Bang:   "..(self.tbTopList[2].szName).."     "..(self.tbTopList[2].nTotal).." điểm<color>\n"..
						"<color=green>Top 3 Bang:   "..(self.tbTopList[3].szName).."     "..(self.tbTopList[3].nTotal).." điểm<color>\n"..
						"Top 4 Bang:   "..(self.tbTopList[4].szName).."     "..(self.tbTopList[4].nTotal).." điểm\n"..
						"Top 5 Bang:   "..(self.tbTopList[5].szName).."     "..(self.tbTopList[5].nTotal).." điểm\n"..
						"Top 6 Bang:   "..(self.tbTopList[6].szName).."     "..(self.tbTopList[6].nTotal).." điểm\n"..
						"Top 7 Bang:   "..(self.tbTopList[7].szName).."     "..(self.tbTopList[7].nTotal).." điểm\n"..
						"Top 8 Bang:   "..(self.tbTopList[8].szName).."     "..(self.tbTopList[8].nTotal).." điểm\n"..
						"Top 9 Bang:   "..(self.tbTopList[9].szName).."     "..(self.tbTopList[9].nTotal).." điểm\n"..
						"Top 10 Bang:   "..(self.tbTopList[10].szName).."     "..(self.tbTopList[10].nTotal).." điểm\n"..

						"=> Nhận thưởng vào: <color=green>00h02 đến hết 23h59 ngày thứ 2 mỗi tuần<color>\n"..														
						"=> Số lượng điểm nộp đợt trước của bạn: <color=red>"..diemtk.."<color> điểm\n"..					
												"=> <color=gold> Danh sách hoạt động nhận thẻ công trạng:\n"..
												"=> <color=gold> Boss VLCT 55/75/95 > 1 thẻ / boss khung giờ 19h30 - 22h30\n"..
												"=> <color=gold>Thất Thành Đại Chiến > 1 thành viên tham gia 1 thẻ\n"..
												"=> <color=gold>Tống Kim 21h00 > Đạt tích lũy ít nhất 10.000 thẻ nhận 1 thẻ công trạng\n"..
												"=> <color=gold>Hái quả Huy Hoàng  > Hái 1 quả huy hoàng nhận 1 thẻ công trạng  - Hái 1 quả hoàng kim nhận 2 thẻ công trạng<color>\n"..						
						"=> Thông tin phần thưởng:\n"..
						"=> <color=gold>BXH TOP 1 :<color>2500 Kim Nguyên Bảo + 10 Túi quà mốc nạp (mỗi túi khi sử dụng tăng 100k Mốc Tích Nạp)<color>\n"..
						"<color=red>Yêu cầu Yêu Cầu 250 Điểm công trạng Tối Thiểu ( trong 7 ngày ) Bang Hội Đạt Nhân Số Thành Viên từ 10 người chơi lên ( DISCORD )<color>\n"..
						"=> <color=gold> BXH TOP 2:<color>1500 Kim Nguyên Bảo 10 Túi quà mốc nạp (mỗi túi khi sử dụng tăng 100k Mốc Tích Nạp)\n"..
						"<color=red>Yêu Cầu 115 Điểm công trạng Tối Thiểu ( trong 7 ngày ) Bang Hội Đạt Nhân Số Thành Viên từ 10 người chơi lên ( DISCORD ) <color>\n"..
						"=> <color=gold> BXH TOP 3:<color>1000 Kim Nguyên Bảo 10 Túi quà mốc nạp (mỗi túi khi sử dụng tăng 100k Mốc Tích Nạp)\n"..
							"<color=red>Yêu Cầu 100 Điểm công trạng Tối Thiểu ( trong 7 ngày ) Bang Hội Đạt Nhân Số Thành Viên từ 7 người chơi lên ( DISCORD )<color>\n"..
						"=> <color=gold> BXH TOP 4:<color>500 Kim Nguyên Bảo 10 Túi quà mốc nạp (mỗi túi khi sử dụng tăng 100k Mốc Tích Nạp)\n"..
						"<color=red>Yêu Cầu 70 Điểm công trạng Tối Thiểu ( trong 7 ngày ) Bang Hội Đạt Nhân Số Thành Viên từ 5 người chơi lên ( DISCORD )<color>\n"..
						"";
								local szTitle1 =			
						"<color=yellow>Tính năng Đua TOP Công Trạng Bang Hội nhận hỗ trợ từ Admin đẹp trai<color>\n"..
												"=> Số lượng điểm nộp đợt trước của bạn: <color=red>"..diemtk.."<color> điểm\n"..			
						"";
			table.insert(tbOpt, {"Xem <color=yellow>Bảng Xếp Hạng<color>", self.XemBXHNE,self,szTitle});	
			table.insert(tbOpt, {"Giao  <color=yellow>Vật Phẩm<color>", self.giao_vp123, self});	
			 -- table.insert(tbOpt,{"Đồng ý <color=yellow>Nhận Thưởng TOP Xếp Hạng<color>",self.NhanThuongTop_tk1, self,nXepHang});	
		table.insert(tbOpt,{"Kết thúc "});

	Dialog:Say(szTitle1, tbOpt);
end

function Battle:XemBXHNE(szTitle)
		local nTenBang = "BXH <color=red>Đua TOP Công Trạng Bang Hội<color>"
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end 

function Battle:Nhan_Thuong_ToanSV()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
		local szTitle =	"Tổng Điểm Nộp Toàn Sever :<color=yellow>"..nSoDiemNopCuaToanSever.."<color>"
	local tbOpt = {};
					if nSoDiemNopCuaToanSever >= 50 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>50<color> Vật Phẩm", self.Thuong50sv, self});	
					end 
					if nSoDiemNopCuaToanSever >= 200 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>200<color> Vật Phẩm", self.Thuong200sv, self});
				end
					if nSoDiemNopCuaToanSever >= 1000 then 				
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>1000<color> Vật Phẩm", self.Thuong500sv, self});	
				end
					if nSoDiemNopCuaToanSever >= 5000 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>5000<color> Vật Phẩm", self.Thuong1000sv, self});	
				end
					if nSoDiemNopCuaToanSever >= 10000 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>10000<color> Vật Phẩm", self.Thuong1500sv, self});	
				end
					if nSoDiemNopCuaToanSever >= 15000 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>15000<color> Vật Phẩm", self.Thuong2000sv, self});	
				end
					if nSoDiemNopCuaToanSever >= 20000 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>20000<color> Vật Phẩm", self.Thuong2500sv, self});	
				end
					if nSoDiemNopCuaToanSever >= 30000 then 
				table.insert(tbOpt, {"Lãnh Thưởng Toàn Sever Nộp <color=yellow>30000<color> Vật Phẩm", self.Thuong3000sv, self});	
				end 
		table.insert(tbOpt,{"Kết thúc "});

	Dialog:Say(szTitle, tbOpt);
end

function Battle:Thuong50sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong50 = me.GetTask(9179,21)
			if nGioiHanThuong50 > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 50 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 50 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 50 then 
	me.AddStackItem(18,1,114,4,{bForceBind=1},2)
	me.SetTask(9179,21,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 50 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 4 X2<color>");
	end 
end 
function Battle:Thuong200sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,22)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 200 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 200 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 200 then 
	me.AddStackItem(18,1,114,5,{bForceBind=1},2)
	me.SetTask(9179,22,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 200 vật phẩm đua top Tháng 12 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 5 X2<color>");
	end 
end 

function Battle:Thuong500sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,23)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 1000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 500 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 1000 then 
	me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.SetTask(9179,23,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 1000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 6 X2<color>");
	end 
end 

function Battle:Thuong1000sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,24)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 5000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 5000 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 5000 then 
	me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.SetTask(9179,24,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 5000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 6 X2<color>");
	end 
end 

function Battle:Thuong1500sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,25)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 10000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 10000 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 10000 then 
	me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.SetTask(9179,25,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 10000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 6 X2<color>");
	end 
end 

function Battle:Thuong2000sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,26)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 15000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 15000 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 15000 then 
	me.AddStackItem(18,1,114,7,{bForceBind=1},1)
	me.SetTask(9179,26,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 15000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 7 X1<color>");
	end 
end 

function Battle:Thuong2500sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,27)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 20000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 20000 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 20000 then 
	me.AddStackItem(18,1,114,8,{bForceBind=1},1)
	me.SetTask(9179,27,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 20000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 8 X1<color>");
	end 
end 

function Battle:Thuong3000sv()
	local nSoDiemNopCuaToanSever = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_DuaTOPToanSeverT6)
	local nGioiHanThuong = me.GetTask(9179,28)
			if nGioiHanThuong > 0 then 
					Dialog:Say("Hiện nay ta thấy ngươi đã nhận phần thưởng này rồi");
			return 0;
			end
			if nSoDiemNopCuaToanSever < 30000 then 
					Dialog:Say("Hiện nay ta thấy sever chưa giao nộp đủ 30000 vật phẩm");
			return 0;
			end
	if nSoDiemNopCuaToanSever >= 30000 then 
	me.AddStackItem(18,1,114,9,{bForceBind=1},1)
	me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
	me.SetTask(9179,28,1)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã nhận phần thưởng toàn sever tích lũy 30000 vật phẩm đua top Tháng 6 Tại NPC Sứ Giả Sự Kiện nhận được Huyền Tinh Cấp 9 X1 và 1 Bổ Tu Lệnh<color>");
	end 
end 

function Battle:giao_vp123()
 	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay == 1 then
			Dialog:Say("Thứ 2 là ngày nhận thưởng không thể nộp hãy để ngày mai");
		return 0;
	end	
 local nHoaDo1 = me.GetItemCountInBags(18,1,2033,9) -- Hoa hồng đỏ
	local nCountNV123 = me.GetTask(9153,1);
	if nCountNV123 > 0 then 
	me.SetTask(9153,1,0);
	end 
if nHoaDo1 < 1 then
	Dialog:Say("Bạn thiếu Vật Phẩm rồi \n hãy mang nó tới đây gặp ta")
return 
end
 Dialog:AskNumber("Nhập số Lượng VP", nHoaDo1, self.TichLuy1, self);--Nhập số tích luỹ

end
function Battle:TichLuy1(nHoaDo1)
	local tbItemId1 = {18,1,2033,9,0,0}; -- voucher
	-- me.AddStackItem(18,1,205,1,nil,8000);------NHHT
	local nCount1 = me.GetItemCountInBags(18,1,2033,9);
	if nCount1 < nHoaDo1 then
	Dialog:SendBlackBoardMsg(me,"Rương của bạn <color=yellow>Không đủ số vật phẩm cần giao<color>");
		else
		Task:DelItem(me, tbItemId1, nHoaDo1);
	local nCountNV123 = me.GetTask(9153,1);
		me.SetTask(9153,1,nCountNV123 + nHoaDo1);
	Battle:Save_top_15tongkim1(me)
	me.Msg("Đã giao thành công <color=gold>"..nHoaDo1.." Vật Phẩm <color>");		
end
end
function Battle:NhanThuongTop_tk1(nXepHang)
	local nCount = me.GetTask(9179,29)
	if nCount > 0 then
		Dialog:Say("Một tuần chỉ có thể nhận thưởng 1 lần");
		return 0;
	end
 	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	if nWeekDay == 1 then
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	if nCurTime > 0001 then 
		if me.CountFreeBagCell() < 15 then
		Dialog:Say("Trống 15 ô mới nhận được Phần Thưởng");
		return 0;
	end	
 if nXepHang == 1 then

me.SetTask(9179,29,1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 1 Sự Kiện Đua TOP Vật Phẩm T6 Nhận 1 Bộ Ngoại Trang VIP\n3000 Tiền Du Long\n3 Viên HT10\n30 Trứng Rồng\n250 Vạn Bạc Khóa\n250 Vạn Đồng Khóa\n1 Thú Cưỡi Thủy Long Vương\nXin chúc mừng<color>");
	------------------------------------------------------------------------------------------------------------

    elseif nXepHang == 2 then

me.SetTask(9179,29,1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 2 Sự Kiện Đua TOP Vật Phẩm T6 Nhận 1 Bộ Ngoại Trang VIP\n2000 Tiền Du Long\n1 Viên HT10\n2 Viên HT9\n20 Trứng Rồng\n250 Vạn Bạc Khóa\n250 Vạn Đồng Khóa\nXin chúc mừng<color>");

	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 3 then

me.SetTask(9179,29,1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã nhận quà TOP 3 Sự Kiện Đua TOP Vật Phẩm T6 Nhận 1 Bộ Ngoại Trang VIP\n1000 Tiền Du Long\n2 Viên HT9\n10 Trứng Rồng\n250 Vạn Bạc Khóa\n250 Vạn Đồng Khóa\nXin chúc mừng<color>");

	------------------------------------------------------------------------------------------------------------
	else 
		Dialog:Say("Ngươi không nằm trong top 1234 hiện nay ngươi đang nằm ở <color=yellow>hạng "..nXepHang.."<color> thật đáng tiếc");	
end

	else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày thứ 2 từ 00h02 - 23h59 cùng ngày<color>");	
end
else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày thứ 2 từ 00h02 - 23h59 cùng ngày<color>");	
end	
end

function Battle:Save_top_15tongkim1(pPlayer)
    if not pPlayer then
        return 0
    end

    local pTong = KTong.GetTong(pPlayer.dwTongId)
    if not pTong then
        return 0
    end

    local szTongName = pTong.GetName()  -- Tên bang hội
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())  -- Thời gian hiện tại
    local nVSV = pPlayer.GetTask(9153, 1)  -- Số điểm (VSV) của người chơi
    local szFile = Battle.Folder_top_15tongkim1..Battle.List_top_15tongkim1..""

    -- Đọc dữ liệu từ tệp
    local szData = KFile.ReadTxtFile(szFile)
    local newData = {}  -- Bảng lưu trữ các dòng mới sẽ ghi lại vào tệp
    local found = false  -- Biến kiểm tra xem tên bang hội có tồn tại hay không

    -- Nếu không có dữ liệu, tạo dữ liệu mới
    if not szData then
        szData = ""
    end

    -- Duyệt qua từng dòng trong tệp
    for line in string.gmatch(szData, "([^\n]+)") do
        local columns = {}
        -- Tách các cột trong dòng
        for col in string.gmatch(line, "([^\t]+)") do
            table.insert(columns, col)
        end

        -- Kiểm tra nếu tên bang hội đã tồn tại
        if columns[1] == szTongName then
            -- Nếu tồn tại, cộng điểm vào cột 2
            columns[2] = tonumber(columns[2]) + nVSV
            found = true
            -- Thay đổi dòng cũ với dòng đã cập nhật
            table.insert(newData, table.concat(columns, "\t"))
        else
            -- Nếu không, giữ nguyên dòng
            table.insert(newData, line)
        end
    end

    -- Nếu không tìm thấy tên bang hội, thêm dòng mới
    if not found then
        table.insert(newData, szTongName.."\t"..nVSV.."\t"..szDate)
    end

    -- Ghi lại dữ liệu vào tệp
    -- local updatedData = table.concat(newData, "\n")  -- Kết nối các dòng lại thành chuỗi
	    local updatedData = table.concat(newData, "\n") .. "\n"  -- Thêm \n ở cuối để đảm bảo dòng cuối có xuống dòng
    KFile.WriteFile(szFile, updatedData)  -- Ghi dữ liệu đã cập nhật vào tệp
end


function Battle:ResetFile_15tongkim1()
		local szFile = Battle.Folder_top_15tongkim1..Battle.List_top_15tongkim1.."";
	KFile.WriteFile(szFile, "szName\tnVSV\tszDate\nKhông xác định 1\t1\t2021-08-05 11:25:08\nKhông xác định 2\t2\t2021-08-05 11:25:34\nKhông xác định 3\t3\t2021-08-05 11:25:49\nKhông xác định 4\t4\t2021-08-05 11:25:56\nKhông xác định 5\t5\t2021-08-05 11:25:56\nKhông xác định 6\t6\t2021-08-05 11:25:56\nKhông xác định 7\t7\t2021-08-05 11:25:56\nKhông xác định 8\t8\t2021-08-05 11:25:56\nKhông xác định 9\t9\t2021-08-05 11:25:56\nKhông xác định 10\t10\t2021-08-05 11:25:56\n");	
	
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