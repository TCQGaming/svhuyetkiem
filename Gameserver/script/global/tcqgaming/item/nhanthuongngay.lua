
local tbPhanThuong = {};
SpecialEvent.PhanThuong = tbPhanThuong;

tbPhanThuong.TaskGourp = 3000; --task mới phải add vào gameserver\setting\player\task_def.txt
tbPhanThuong.TaskId_Day = 1; --task lưu ngày
tbPhanThuong.TaskId_Count = 2; --task lưu lần nhận
tbPhanThuong.TaskId_Last = 3; --task lưu thời gian nhận
tbPhanThuong.Relay_Time = 15*60; --thời gian giữa 2 lần nhận mình để 15p 1 lần
tbPhanThuong.Use_Max =8; --số lần nhận tối đa

function tbPhanThuong:OnDialog()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if me.GetTask(self.TaskGourp, self.TaskId_Day) < nDate then
		me.SetTask(self.TaskGourp, self.TaskId_Day, nDate);
		me.SetTask(self.TaskGourp, self.TaskId_Count, 0);
		me.SetTask(self.TaskGourp, self.TaskId_Last, 0);
	end 
	local nCount = me.GetTask(self.TaskGourp, self.TaskId_Count);
local szMsg = string.format("<color=orange>Phần Thưởng Hàng Ngày<color> \n\nMỗi <color=yellow>15 phút online<color> hàng ngày có thể nhận thưởng, tối đa <color=yellow>8<color> lần\n<color=green>Hôm nay bạn đã nhận <color=red>%d<color> phần thưởng.<color>",nCount);
local szColor = "<color=Gray>"
	local szColorx = "<color>"
	szMsg = szMsg.."\n<color=yellow>Lần 1:<color> "..((nCount >= 1 and szColor) or "").."5 Vạn Bạc khóa<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 2:<color> "..((nCount >= 2 and szColor) or "").."1 Viên Huyền Tinh 5<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 3:<color> "..((nCount >= 3 and szColor) or "").."5000 Đồng khóa<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 4:<color> "..((nCount >= 4 and szColor) or "").."5 Vạn Bạc khóa<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 5:<color> "..((nCount >= 5 and szColor) or "").."1 Viên Huyền Tinh 5<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 6:<color> "..((nCount >= 6 and szColor) or "").."5000 đồng khóa<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 7:<color> "..((nCount >= 7 and szColor) or "").."5 Vạn Bạc khóa<color>";
	szMsg = szMsg.."\n<color=yellow>Lần 8:<color> "..((nCount >= 8 and szColor) or "").."1 Viên Huyền Tinh 5<color>";

	szMsg = szMsg..string.format("\n\n<color=yellow>Hôm nay bạn đã nhận "..((nCount >= self.Use_Max and "đủ") or nCount).." phần thưởng.<color>");
	-- local szMsg = string.format("Mỗi <color=yellow>15 phút online<color> hàng ngày có thể nhận thưởng, tối đa <color=yellow>8<color> lần.<enter><color=yellow>Hôm nay bạn đã nhận %d lần<color>",nCount);
	local tbOpt = {};
	if (nCount<self.Use_Max) then
		table.insert(tbOpt , {"Nhận thưởng online",  self.nhanthuong, self});
	end
	table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
	Dialog:Say(szMsg, tbOpt);
end

function tbPhanThuong:nhanthuong()
	local nCount = me.GetTask(self.TaskGourp, self.TaskId_Count);
    if nCount >= self.Use_Max then
        Dialog:Say(string.format("Hôm nay bạn đã nhận đủ phần thưởng."));
        return 0; 
    end    
	local nLast = me.GetTask(self.TaskGourp, self.TaskId_Last);
	local nHour = tonumber(GetLocalDate("%Y%m%d%H%M%S"));
	local nSec1 = Lib:GetDate2Time(nHour);
	local nSec2 = nLast + self.Relay_Time;
		if nSec1 < nSec2 then
			if ((nSec2 - nSec1)<=60) then
				me.Msg(string.format("Còn <color=yellow>%s giây<color> nữa mới nhận được phần thưởng tiếp theo.", (nSec2 - nSec1)));
			else
				me.Msg(string.format("Còn <color=yellow>%d phút<color> nữa mới nhận được phần thưởng tiếp theo.", (nSec2 - nSec1)/60));
			end
			return 0;
		end
	if (nCount == 0) then
		me.AddBindMoney(50000); -- Phần thưởng 1
	elseif (nCount == 1) then
		me.AddItem(18,1,114,5); -- Phần thưởng 2
	elseif (nCount == 2) then
		me.AddBindCoin(5000); -- Phần thưởng 3
	elseif (nCount == 3) then
		me.AddBindMoney(50000); -- Phần thưởng 4
	elseif (nCount == 4) then
		me.AddItem(18,1,114,5); -- Phần thưởng 5
	elseif (nCount == 5) then
		me.AddBindCoin(5000); -- Phần thưởng 6
	elseif (nCount == 6) then
		me.AddBindMoney(50000); -- Phần thưởng 7
	elseif (nCount == 7) then
		me.AddItem(18,1,114,5); -- Phần thưởng 8
	end
	me.Msg(string.format("Mỗi 15 phút online hàng ngày có thể nhận thưởng, tối đa 8 lần. Hôm nay bạn đã nhận lần thứ <color=yellow>%d<color>",nCount + 1));
	me.SetTask(self.TaskGourp, self.TaskId_Count, nCount + 1);
	local nHourS = tonumber(GetLocalDate("%Y%m%d%H%M%S"));
	local nSec3 = Lib:GetDate2Time(nHourS);
	me.SetTask(self.TaskGourp, self.TaskId_Last, nSec3);
end
