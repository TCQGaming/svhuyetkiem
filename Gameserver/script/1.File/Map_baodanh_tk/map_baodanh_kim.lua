-------------------------------------------------------
-- 文件名　：qinshihuangling_5.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-06-09 13:06:16
-- 文件描述：
-------------------------------------------------------

-------------- 定义特定地图回调 ---------------
local tbDaoHoaNguyen = Map:GetClass(185);

-- 定义玩家进入事件
function tbDaoHoaNguyen:OnEnter(szParam)
	me.TeamDisable(0);	
	me.SetDisableTeam(0);
-----------------reset diem tong kim tuan-------------------------
	local nWeek = me.GetTask(9152, 2);
	local nCurWeek = tonumber(GetLocalDate("%y%W"));
	if nCurWeek > nWeek then
		me.SetTask(9152, 2, nCurWeek);	
	    me.SetTask(9152, 1, 0);
		me.SetTask(9152, 3, 0);		
		
	end
	--------------------------------------
end;
