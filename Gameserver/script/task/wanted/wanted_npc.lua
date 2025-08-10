--quan phủ phát lệnh truy nã nhiệm vụ 
--tôn đa lương 
--2008.08.06
Require("\\script\\task\\wanted\\wanted_def.lua");

function Wanted:OnDialog()
	local nFlag = self:Check_Task();
	if nFlag == 1 then
		self:OnDialog_Finish()
	elseif nFlag == 2 then
		self:OnDialog_NoFinish()
	elseif nFlag == 3 then
		self:OnDialog_NoAccept()
	else
		self:OnDialog_Accept()
	end
end

function Wanted:OnDialog_Accept()
	local szMsg = string.format("Bổ Đầu Hình Bộ: Gần đây bọn Hải tặc luôn gây hại cho dân, ngươi có đồng ý giúp đỡ Nha Môn bắt giữ chúng để trừ hại cho dân?\n\n<color=yellow>Hôm nay ngươi còn %s lần<color>", self:GetTask(self.TASK_COUNT));
	local tbOpt = {
		{"Ta muốn truy bắt Hải Tặc", self.SingleAcceptTask, self},
		 {"Dùng Danh Bổ Lệnh Đổi phần thưởng", self.OnGetAward, self},
		{"Để ta suy nghĩ đã"},
	}
	if me.IsCaptain() == 1 then
		table.insert(tbOpt, 1, {"Ta muốn cùng đồng đội truy bắt Hải Tặc", self.CaptainAcceptTask, self})
	end
	Dialog:Say(szMsg, tbOpt);
end

function Wanted:OnDialog_NoAccept()
	local szMsg = string.format("Bổ Đầu Hình Bộ: Gần đây bọn Hải tặc luôn gây hại cho dân, ngươi có đồng ý giúp đỡ Nha Môn bắt giữ chúng để trừ hại cho dân? Nhưng ta thấy ngươi vẫn chưa đủ thực lực, sau khi đạt cấp 50 hãy quay lại tìm ta.");
	local tbOpt = {
		{"Ta biết rồi"},
	}
	Dialog:Say(szMsg, tbOpt);
end

function Wanted:OnDialog_Finish()
	local nTask = Task:GetPlayerTask(me).tbTasks[self.TASK_MAIN_ID].nReferId;
	local szMsg = self:CreateText(nTask)
	local tbOpt = {
		{"Hoàn thành nhiệm vụ, đến nhận thưởng", self.FinishTask, self},
		-- {"Dùng Danh Bổ Lệnh Đổi phần thưởng", self.OnGetAward, self},
		{"Để ta suy nghĩ đã"},		
	}
	Dialog:Say(szMsg, tbOpt);
end

function Wanted:OnDialog_NoFinish()
	local nTask = Task:GetPlayerTask(me).tbTasks[self.TASK_MAIN_ID].nReferId;
	local szMsg = self:CreateText(nTask)
	local tbOpt = {
		{"Ta muốn hủy nhiệm vụ", self.CancelTask, self},
		-- {"Dùng Danh Bổ Lệnh Đổi phần thưởng", self.OnGetAward, self},
		{"Để ta suy nghĩ đã"},	
	};
	Dialog:Say(szMsg, tbOpt);
end

function Wanted:CreateText(nTask)
	local szMsg = string.format("Tên nhiệm vụ: [<color=green>Tuy bắt Hải Tặc %s<color>]\nMiêu tả nhiệm vụ: Nghe nói<color=green> Hải Tặc %s<color> gần đây xuất hiện tại <color=yellow>%s<color>, tọa độ <color=yellow>(%s,%s)<color>, ngươi phải truy bắt hắn về quy án, khôi phục an ninh nơi đó.",self.TaskFile[nTask].szTaskName, self.TaskFile[nTask].szTaskName, self.TaskFile[nTask].szMapName, math.floor(self.TaskFile[nTask].nPosX/8), math.floor(self.TaskFile[nTask].nPosY/16));
	return szMsg;	
end

function Wanted:OnGetAward()
	local szMsg ="Bổ Đầu Hình Bộ: Bọn Hải tặc đã bị bắt về quy án, triều đình ban thưởng. Các vị đại hiệp có thể đem Danh Bổ Lệnh đến đổi phần thưởng.";
	local tbOpt = 
	{
		 {"Ta muốn đổi Võ Lâm Mật Tịch (sơ)",self.OnGift, self, self.ITEM_WULINMIJI},
		 {"Ta muốn đổi Tẩy Tủy Kinh (sơ)",self.OnGift, self, self.ITEM_XISUIJING},
		{"Ta muốn đổi Tẩy Tủy Kinh (trung)",self.taytuykinh, self},
		{"Ta muốn đổi Võ Lâm Mật Tịch (trung)",self.volammattich, self},
		{"Để ta suy nghĩ đã"}
	}
	Dialog:Say(szMsg, tbOpt);
end
--
function Wanted:taytuykinh()
if me.CountFreeBagCell() < 2 then
		Dialog:Say("Phải Có 2 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,190,1,0,0}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,190,1) -- Mảnh Vũ Khí Đồng Hành
local tienxu = me.GetJbCoin();
if nCount1 < 600  then
Dialog:Say("cần 600 danh bổ lệnh")
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddItem(18,1,192,2); --
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 600 danh bổ lệnh  ghép tẩy tủy kinh trung<color=green>Quá Ghê gớm<color> gia tăng sức mạnh !<color>");	
Task:DelItem(me, tbGiftId1, 600);
end
--
function Wanted:volammattich()
if me.CountFreeBagCell() < 2 then
		Dialog:Say("Phải Có 2 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,190,1,0,0}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,190,1) -- Mảnh Vũ Khí Đồng Hành
local tienxu = me.GetJbCoin();
if nCount1 < 600  then
Dialog:Say("cần 600 danh bổ lệnh")
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddItem(18,1,191,2); --
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> dùng 600 danh bổ lệnh ghép võ lâm mật tịch trung<color=green>Quá Ghê gớm<color> gia tăng sức mạnh  !<color>");	
Task:DelItem(me, tbGiftId1, 600);
end
function Wanted:OnGift(tbItem)
	local tbParam = {
		tbAward = {
			{
				nGenre 		= tbItem[1][1],
				nDetail 	= tbItem[1][2],
				nParticular = tbItem[1][3],
				nLevel 		= tbItem[1][4],
				nCount		= 1,
			}
		},
		tbMareial = {
			{
				nGenre 		= self.ITEM_MINGBULING[1], 
				nDetail 	= self.ITEM_MINGBULING[2], 
				nParticular = self.ITEM_MINGBULING[3], 
				nLevel 		= self.ITEM_MINGBULING[4],
				nCount		= tbItem[2],
			}
		}
		};
	local szContent = string.format("\nĐổi <color=yellow>%s<color> cần <color=yellow>%s<color> <color=yellow>%s<color>", KItem.GetNameById(unpack(tbItem[1])),tbItem[2], KItem.GetNameById(unpack(self.ITEM_MINGBULING)));
	Wanted.Gift:OnOpen(szContent, tbParam)
end
