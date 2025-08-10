--giang hồ uy vọng lệnh bài 
--tôn đa lương 
--2008.10.30

local tbItem = Item:GetClass("tienthaolo1h");
tbItem.TASKGROUP			= 3003;			-- nhân vật nhiệm vụ lượng biến đổi đích groupID
tbItem.TASKLASTTIME_ID		= 1;			-- nhân vật nhiệm vụ lượng biến đổi đích tối hậu thời gian bảo tồn đích ID
tbItem.TASKREMAINTIME_ID	= 2;			-- nhân vật nhiệm vụ lượng biến đổi đích thặng dư tích lũy thời gian ID đơn vị ：tiếng đồng hồ ngồi 10
tbItem.SKILL_ID_EXP			= 332;			-- 332，kinh nghiệm gấp bội kỹ năng ID
tbItem.SKILL_ID_EXP_LEVEL	= 10;			-- 332，kinh nghiệm gấp bội kỹ năng đẳng cấp 
-- by zhangjinpin@kingsoft


tbItem.tbEffect = 
{
	[1] = 1;
}


function tbItem:OnUse()
	self:Update();
		local nRemainTime = self:GetRemainTime();

		local nExpSkillLevel, nExpStateType, nExpEndTime, bExpIsNoClearOnDeath			= me.GetSkillState(self.SKILL_ID_EXP);
		local nNewExpTime		= 0;
		
		if (not nExpEndTime) then
			nExpEndTime = 0;
		end
		nRemainTime = nRemainTime - self.tbEffect[it.nLevel];

		nNewExpTime			= self.tbEffect[it.nLevel] * 18 * 3600 + nExpEndTime;

		me.AddSkillState(self.SKILL_ID_EXP, self.SKILL_ID_EXP_LEVEL, 1, nNewExpTime, 1);

		me.Msg(string.format("Bạn nhận được <color=yellow>%s giờ <color> nhân đôi kinh nghiệm.",self.tbEffect[it.nLevel]))
	return 1;
end

function tbItem:Update()
	local nLastTime		= me.GetTask(self.TASKGROUP, self.TASKLASTTIME_ID);
	local nNowTime		= GetTime();
	local nDays			= self:CalculateDay(nLastTime, nNowTime);
	local nRemainTime	= nDays * 1.5 + self:GetRemainTime();
	if (nRemainTime <0.1) then
		nRemainTime = 0;
	end
	
	if (nLastTime <= 0) then
		nRemainTime = 1.5;
	end
	
	me.SetTask(self.TASKGROUP, self.TASKLASTTIME_ID, nNowTime);
	me.SetTask(self.TASKGROUP, self.TASKREMAINTIME_ID, nRemainTime * 10); -- tồn chính là tiếng đồng hồ đích thập bội 
end

-- tính toán ly lần trước thời gian đổi mới qua nhiều ít thiên 
function tbItem:CalculateDay(nLastTime, nNowTime)
	local nLastDay 	= Lib:GetLocalDay(nLastTime);
	local nNowDay	= Lib:GetLocalDay(nNowTime);
	local nDays		= nNowDay - nLastDay;
	if (nDays <0) then
		nDays = 0;
	end
	return nDays;
end
function tbItem:GetRemainTime()
	return me.GetTask(self.TASKGROUP, self.TASKREMAINTIME_ID) / 10;
end
