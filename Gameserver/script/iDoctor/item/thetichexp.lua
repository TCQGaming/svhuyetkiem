
local tbtheexp = Item:GetClass("thetichexp");
tbtheexp.TASKGROUP            = 3105;-- taskgroupID
tbtheexp.TASKLASTTIME_ID        = 1;            -- task
tbtheexp.TASKREMAINTIME_ID    = 2;            -- task
tbtheexp.SKILL_ID_EXP            = 1994;            -- 1994 id skill
tbtheexp.SKILL_ID_EXP_LEVEL    = 10;            -- Cấp độ của skill.Cấp 10 sẽ là + thêm 100% kinh nghiệm.Cấp 20 là cộng 200%(tương đương x3)
tbtheexp.Cap_Ho_Tro = 95; -- Cấp độ có thể sử dụng item

tbtheexp.tbEffect = {   
 [1] = 1;--(Thời gian hiệu nghiệm của thẻ.Đơn vị tính bằng Giờ)
}

function tbtheexp:OnUse()

	if me.GetSkillState(332) > 0 then
		Dialog:Say("Bạn đang trong thời gian hiệu quả<color=gold> Tu luyện châu<color>, không thể sử dụng");
		return 0;
	end

	if me.nLevel >= self.Cap_Ho_Tro then
		Dialog:Say("Cấp độ của bạn đã vượt quá<color=gold> "..self.Cap_Ho_Tro.."<color>, không thể sử dụng");
		return 0;
	end

    self:Update();
        local nRemainTime = self:GetRemainTime();
        local nExpSkillLevel, nExpStateType, nExpEndTime, bExpIsNoClearOnDeath            = me.GetSkillState(self.SKILL_ID_EXP);
        local nNewExpTime        = 0;
         if (not nExpEndTime) then 
           nExpEndTime = 0;
        end
        nRemainTime = nRemainTime - self.tbEffect[it.nLevel];
        nNewExpTime            = self.tbEffect[it.nLevel] * 18 * 3600 + nExpEndTime;
        me.AddSkillState(self.SKILL_ID_EXP, self.SKILL_ID_EXP_LEVEL, 1, nNewExpTime, 1);
        me.Msg(string.format("Bạn nhận được <color=yellow>%s giờ <color> nhân đôi kinh nghiệm.",self.tbEffect[it.nLevel]))    
return 1;
end
function tbtheexp:Update()
    local nLastTime        = me.GetTask(self.TASKGROUP, self.TASKLASTTIME_ID);
    local nNowTime        = GetTime(); 
   local nDays            = self:CalculateDay(nLastTime, nNowTime); 
   local nRemainTime    = nDays * 1.5 + self:GetRemainTime();
    if (nRemainTime < 0.1) then        nRemainTime = 0;
    end
        if (nLastTime <= 0) then
        nRemainTime = 1.5;
    end
        me.SetTask(self.TASKGROUP, self.TASKLASTTIME_ID, nNowTime);    me.SetTask(self.TASKGROUP, self.TASKREMAINTIME_ID, nRemainTime * 10); -- 存的是小时的十倍
end
-- 计算离上次更新时间过了多少天
function tbtheexp:CalculateDay(nLastTime, nNowTime)
    local nLastDay     = Lib:GetLocalDay(nLastTime);
    local nNowDay    = Lib:GetLocalDay(nNowTime); 
   local nDays        = nNowDay - nLastDay;    if (nDays < 0) then
        nDays = 0; 
   end
    return nDays;
end
function tbtheexp:GetRemainTime() 
   return me.GetTask(self.TASKGROUP, self.TASKREMAINTIME_ID) / 10;
end  
