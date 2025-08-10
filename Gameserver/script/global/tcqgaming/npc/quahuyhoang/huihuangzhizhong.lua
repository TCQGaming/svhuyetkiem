-- 文件名　：huihuangzhizhong.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-10-10 17:53:23
-- npc辉煌之种，玩家点击，提示需要等待种子成熟才能摘取

local tbNpcHuiHuangZhiZhong = Npc:GetClass("huihuangzhizhong");

tbNpcHuiHuangZhiZhong.nGrowTime			= 5; --成熟的时间

function tbNpcHuiHuangZhiZhong:OnDialog()
		if me.nFaction <= 0 then
	Dialog:Say("Ngươi chưa gia nhập Môn Phái không thể nhặt quả này");
	return 0;
	end
	local tbNpcInfo	= him.GetTempTable("HuiHuangZhiGuo");
	local nFiveMinute = 300 --单位(秒)
	local nTime = nFiveMinute - GetTime() + tbNpcInfo.nPlantTime
	local nHour, nMinute, nSecond = Lib:TransferSecond2NormalTime(nTime)
	local szTime = ""
	if (nHour ~= 0) then
		szTime = string.format("%s%d giờ",szTime,nHour)
	end
	if (nMinute ~= 0) then
		szTime = string.format("%s%d phút",szTime,nMinute)
	end
	szTime = string.format("%s%d giây",szTime,nSecond)
	me.Msg(string.format("Hiện nay hạt giống vẫn chưa chín mùi, cần thêm <color=yellow>%s<color> nữa.", szTime));
end;
