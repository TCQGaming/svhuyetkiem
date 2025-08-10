-- 文件名　：addhuoqi_base.lua
-- 创建者　：sunduoliang
-- 创建时间：2009-11-11 14:46:47
-- 描  述  ：增加活力通用
-- ExtParam1:活力


local tbBase = Item:GetClass("addhuoqi_base");

function tbBase:OnUse()
		  local nNgay    = tonumber(GetLocalDate("%d%m%y"));
	if me.GetTask(9156,2) ~= nNgay then 
		me.SetTask(9156,2, nNgay);
		me.SetTask(9156,1, 0);----
	end 
	local nGioiHan = me.GetTask(9156,1)
	if nGioiHan > 0 then 
			Dialog:Say("Mỗi ngày chỉ được sử dụng 1 lần");
	return 0;
end 
	local nValue  = it.GetExtParam(1);
	me.ChangeCurGatherPoint(nValue);
		me.SetTask(9156,1,1)
	me.Msg(string.format("Bạn nhận được %s hoạt lực", nValue));
	local szLog = string.format("%s nhận được %s hoạt lực", me.szName, nValue);
	Dbg:WriteLog("UseItem",  szLog);
	me.PlayerLog(Log.emKPLAYERLOG_TYPE_JOINSPORT, szLog);
	return 1;
end

