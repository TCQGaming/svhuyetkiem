--quân doanh log2tiếp lời 

Require("\\script\\task\\armycamp\\define.lua");

local StatLog = {};
Task.tbArmyCampInstancingManager.StatLog = StatLog;

--tối đa 15vị ，16vị －32vị ký lục chu 
--15vị ký lục loại hình vi 1đích ，phía sau ký lục loại hình vi 2đích 
StatLog.LogList = 
{
	-- {miêu tả ，loại hình （1,án nhân đầu toán ，2,tổng lượng ）}
	[1] = {"tuần này có bao nhiêu ngoạn gia tiến nhập quá phó bản", 1};
	[2] = {"tuần này có bao nhiêu ngoạn gia tiếp lấy kịch chuyện phó bản",1};
	[3] = {"tuần này có bao nhiêu ngoạn gia tiếp lấy hằng ngày phó bản",1};
	[4] = {"tuần này có bao nhiêu ngoạn gia hoàn thành kịch chuyện phó bản",1};
	[5] = {"tuần này có bao nhiêu ngoạn gia hoàn thành hằng ngày phó bản",1};
	[6] = {"tuần này có bao nhiêu ngoạn gia độc quá ki quan thư",1};
	[7] = {"tuần này có bao nhiêu ngoạn gia độc quá binh thư",1};
	[8] = {"tuần này có bao nhiêu ngoạn gia độc xong ki quan thư",1};
	[9] = {"tuần này có bao nhiêu ngoạn gia độc xong binh thư",1};
	[10] = {"tuần này có bao nhiêu ngoạn gia tiếp lấy phó bản nội đích tùy ki nhiệm vụ",1};
	[11] = {"tuần này sản ra ki quan học tạo nghệ",2};
	[12] = {"tuần này sản ra ki quan bền độ",2};
	[13] = {""};
	[14] = {""};
	[15] = {""};
	[16] = {"tuần này sản đứng ra cụ (loại hình %s)số lượng", 2};
}
StatLog.nTaskGroupId = 2044;
StatLog.nTaskId = 11;

function StatLog:WriteLog(nLogId, nValue, pPlayer, nArg)
	if not self.LogList[nLogId] then
		return 0;
	end
	if (pPlayer) then
		Setting:SetGlobalObj(pPlayer, him, it);
	end
	local nWeek = tonumber(GetLocalDate("%W"));
	local nYear	= tonumber(GetLocalDate("%Y"));
	local szKey = string.format("%sthứ %schu", nYear, nWeek);
	local szField = self.LogList[nLogId][1];
	if nArg then
		szField = string.format(szField, nArg);
	end
	if self.LogList[nLogId][2] == 2 then
		KStatLog.ModifyAdd("armycamp", szKey, szField, nValue)
	elseif self.LogList[nLogId][2] == 1 then
		local nTaskValue = me.GetTask(self.nTaskGroupId, self.nTaskId);
		if self:GetWeek(nTaskValue) <nWeek then
			nTaskValue = self:SetWeek(nWeek);
		end
		if KLib.GetBit(nTaskValue, nLogId) == 0 then
			local nSetTask = KLib.SetBit(nTaskValue, nLogId, 1) 
			me.SetTask(self.nTaskGroupId, self.nTaskId, nSetTask);
			KStatLog.ModifyAdd("armycamp", szKey, szField, nValue)
		end
	end
	if (pPlayer) then
		Setting:RestoreGlobalObj();
	end
end

function StatLog:GetWeek(nTaskValue)
	local nWeek = math.floor(nTaskValue/2^15)
	return nWeek;
end

function StatLog:SetWeek(nWeek)
	local nSetTaskValue = (nWeek * 2^15);
	me.SetTask(self.nTaskGroupId, self.nTaskId, nSetTaskValue);
	return nSetTaskValue;
end
