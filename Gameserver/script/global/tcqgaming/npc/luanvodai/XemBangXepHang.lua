local tbLuanVoDai ={};
SpecialEvent.tbLuanVoDai= tbLuanVoDai;

tbLuanVoDai.AddTaskGroup = 9190;
tbLuanVoDai.AddTaskId = 4;-- task lưu lãnh thưởng
function tbLuanVoDai:OnDialog()

	local szMsg = "Xem TOP<color=cyan>  ";
	local tbOpt =
	{
		{"<color=yellow>Xem Bảng Xếp Hạng Luận Võ Đài<color>", self.xembxh,self},
		-- {"<color=yellow>Lãnh Thưởng TOP Xếp Hạng 10<color>", self.lanhthuong,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbLuanVoDai:xembxh()
-- DoScript("\\script\\global\\tcqgaming\\tanthu\\duanaptuan.lua");
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
	 local tbsortpos = Lib:LoadTabFile("\\script\\global\\tcqgaming\\npc\\luanvodai\\BangXepHang.txt")

	local nLineCount = #tbsortpos;
	local nId1 = nLineCount;
	tbLuanVoDai.tbDanhSach = {};
	tbLuanVoDai.tbTopList = {};
	
	for nLine=1, nLineCount do
		local nId  = #self.tbDanhSach + 1;
		local szNames = tbsortpos[nLine].szName;
		local nCount_1 = tonumber(tbsortpos[nLine].nTongDame) or 0;		
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
	local tbOpt = {};
		local szTitle =	"BXH <color=red>Danh sách người chơi top Luận Võ<color><enter>\n"..

						"<color=yellow>Top 1:   "..(self.tbTopList[1].szName).."     "..(self.tbTopList[1].nTotal).." ST<color>\n"..
						"<color=gold>Top 2:   "..(self.tbTopList[2].szName).."     "..(self.tbTopList[2].nTotal).." ST<color>\n"..
						"<color=green>Top 3:   "..(self.tbTopList[3].szName).."     "..(self.tbTopList[3].nTotal).." ST<color>\n"..
						"Top 4:   "..(self.tbTopList[4].szName).."     "..(self.tbTopList[4].nTotal).." ST\n"..
						"Top 5:   "..(self.tbTopList[5].szName).."     "..(self.tbTopList[5].nTotal).." ST\n"..
						"Top 6:   "..(self.tbTopList[6].szName).."     "..(self.tbTopList[6].nTotal).." ST\n"..
						"Top 7:   "..(self.tbTopList[7].szName).."     "..(self.tbTopList[7].nTotal).." ST\n"..
						"Top 8:   "..(self.tbTopList[8].szName).."     "..(self.tbTopList[8].nTotal).." ST\n"..
						"Top 9:   "..(self.tbTopList[9].szName).."     "..(self.tbTopList[9].nTotal).." ST\n"..
						"Top 10:   "..(self.tbTopList[10].szName).."     "..(self.tbTopList[10].nTotal).." ST\n\n"..

						"=> Nhận thưởng vào: <color=green>\n22h00 Đến 23h59 Mỗi ngày<color>"..														
						"\n=><color=red> Sang ngày mới hệ thống tự động làm mới BXH<color>"..																
						"=> Xếp hạng hiện tại: <color=yellow>Top "..nXepHang.."<color>\n"..
						"";
		table.insert(tbOpt,{"Đồng ý <color=yellow>Xem phần thưởng Luận Võ Đài<color>",self.xemphanthuongtuan, self});	
		table.insert(tbOpt,{"Đồng ý <color=yellow>Nhận Thưởng<color>",self.NhanThuong, self,nXepHang});	
		table.insert(tbOpt,{"Kết thúc "});

	Dialog:Say(szTitle, tbOpt);
end
function tbLuanVoDai:xemphanthuongtuan()
local nTenBang = "Danh sách quà tặng thưởng TOP Luận Võ Đài hôm nay"
local szTitle = "<color=gold>TOP 1:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n30 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n50 Kim Nguyên Bảo\n"..
				"<color=gold>TOP 2:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n25 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n40 Kim Nguyên Bảo\n"..
				"<color=gold>TOP 3:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n20 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n30 Kim Nguyên Bảo\n"..
				"<color=gold>TOP 4:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n15 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n20 Kim Nguyên Bảo\n"..
				"<color=gold>TOP 5:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n10 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n10 Kim Nguyên Bảo\n"..
				"<color=gold>TOP 6-10:\n<color><color=red>1 Huyền Tinh cấp 6(Khóa)\n5 Điểm Đại Hội Võ Lâm(Dv Nhẫn)\n5 Kim Nguyên Bảo"..
				"";
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end 
function tbLuanVoDai:NhanThuong(nXepHang)

local tbItemInfo = {bForceBind = 1};
	local nCount = me.GetTask(self.AddTaskGroup,self.AddTaskId);
 	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	if nCurTime > 2159 then 
	if nCount > 0 then
		Dialog:Say("Một ngày chỉ có thể nhận thưởng 1 lần");
		return 0;
	end
		if me.CountFreeBagCell() < 5 then
		Dialog:Say("Trống 5 ô mới nhận được Phần Thưởng");
		return 0;
	end	
	if nXepHang == 1 then
ConfigAll.Top_1_LuanVoDai()
		me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 2 then
ConfigAll.Top_2_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 3 then
ConfigAll.Top_3_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 4 then
ConfigAll.Top_4_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	
	elseif nXepHang == 5 then
ConfigAll.Top_5_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------
	
	elseif nXepHang == 6 then
ConfigAll.Top_6Den10_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 7 then
ConfigAll.Top_6Den10_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 8 then
ConfigAll.Top_6Den10_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 9 then
ConfigAll.Top_6Den10_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
----------------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);


	elseif nXepHang == 10 then
ConfigAll.Top_6Den10_LuanVoDai()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Luận Võ Đài thành công xin chúc mừng<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	
	else
	Dialog:Say("Ngươi không có trong bảng xếp hạng TOP 10 hôm nay<color>");
	end
	

	else
	Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Hàng ngày sau 22h00<color>");	
end
end



local function fnStrValue(szVal)
	local varType = loadstring("return "..szVal)();
	if type(varType) == 'function' then
		return varType();
	else
		return varType;
	end
end
function tbLuanVoDai:StrVal(szParam)	--加载题库
	local szText = string.gsub(szParam, "<%%(.-)%%>", fnStrValue);
	return szText;
end

