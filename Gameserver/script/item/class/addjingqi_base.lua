-- 文件名　：addjingqi_base.lua
-- 创建者　：sunduoliang
-- 创建时间：2009-11-11 14:48:58
-- 描  述  ：增加精力通用
-- ExtParam1:精力

local tbBase = Item:GetClass("addjingqi_base");

function tbBase:OnUse()
	  local nNgay    = tonumber(GetLocalDate("%d%m%y"));
	if me.GetTask(9156,4) ~= nNgay then 
		me.SetTask(9156,4, nNgay);
		me.SetTask(9156,3, 0);----
	end 
	local nGioiHan = me.GetTask(9156,3)
	if nGioiHan > 0 then 
			Dialog:Say("Mỗi ngày chỉ được sử dụng 1 lần");
	return 0;
end 
	local nValue  = it.GetExtParam(1);
	me.ChangeCurMakePoint(nValue);
	me.SetTask(9156,3,1)
	me.Msg(string.format("Bạn nhận được %s tinh lực", nValue));
	local szLog = string.format("%s nhận được %s tinh lực", me.szName, nValue);
	Dbg:WriteLog("UseItem",  szLog);
	me.PlayerLog(Log.emKPLAYERLOG_TYPE_JOINSPORT, szLog);
	return 1;
end

