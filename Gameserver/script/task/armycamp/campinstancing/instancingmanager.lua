Require("\\script\\task\\armycamp\\define.lua")

-- quân doanh FBquản lý khí 
local tbManager = Task.tbArmyCampInstancingManager;
tbManager.tbInstancingUsable = {};		-- phó bản sử dụng tình huống 
tbManager.tbWaitQueue = {};				-- đợi GChoàn thành địa đồ tái nhập đích ngoạn gia đội liệt 
tbManager.tbInstancingLib = {};			-- phó bản cơ loại khố 


-- cây cứ FBthu được phó bản đích cơ loại 
function tbManager:GetInstancingBase(nInstancingTemplateId)
	if (not self.tbInstancingLib[nInstancingTemplateId]) then
		self.tbInstancingLib[nInstancingTemplateId] = {};
		self.tbInstancingLib[nInstancingTemplateId].nInstancingTemplateId = nInstancingTemplateId;
		self.tbInstancingLib[nInstancingTemplateId].tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	end
	
	return self.tbInstancingLib[nInstancingTemplateId];
end


-- và Npcđối thoại đăng khan báo danh thân thỉnh FB
function tbManager:AskRegisterInstancing(nInstancingTemplateId, nPlayerId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);	
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	
	-- mỗi cá thời gian đoạn chỉ năng báo một lần danh 
	local tbNow	= os.date("*t", GetTime());
	if (self:Time2Int(tbNow) == pPlayer.GetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId)) then
		self:Warring(pPlayer,"Lúc này đã báo danh rồi, không thể báo danh phó bản, xin vui lòng đợi");
		return;
	end
	
	-- mỗi cá thời gian đoạn đích phó bản có hạn mức cao nhất 
	if (self:GetCurOpenInstancingNum(tbNow.hour)>= self.nInstancingMaxCount) then
		self:Warring(pPlayer,"Số phó bản đã đến giới hạn");
		return;
	end
	
	-- phải tổ đội thả đội trường tài năng báo danh 
	if (pPlayer.nTeamId <= 0 or pPlayer.IsCaptain() ~= 1) then
		self:Warring(pPlayer,"Đội trưởng mới được báo danh");
		return;
	end
	
	
	-- chỉ tài năng ở chỉ định thời gian nội tài năng báo danh 
	if (self:CheckRegisterTime(nInstancingTemplateId, nPlayerId) ~= 1) then
		self:Warring(pPlayer,"Xin báo danh đúng thời gian quy định");
		return;
	end
	
	
	-- phụ cận đội hữu sổ ，có hay không có phi pháp đội hữu ，thả cần hạn chế FBtổng số 
	if (self:CheckTeamRegisterCondition(nInstancingTemplateId, nPlayerId) ~= 1) then
		return;
	end
	
	
	-- thành công thân thỉnh hậu hội cấp phụ cận đội hữu Nhắc nhở 
	local szMsg ="Đội này đã báo danh phó bản"..tbSetting.szName;
	KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
	
	self:RegisterSucess(nInstancingTemplateId, nPlayerId);
end



-- phán đoán có hay không ở chỉ định đích thời gian nội 
function tbManager:CheckRegisterTime(nInstancingTemplateId, nPlayerId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local nNowTime	= GetTime();
	local tbToday	= os.date("*t", nNowTime);
	local nHour 	= tbToday.hour;
	local nMin		= tbToday.min;
	local bOK		= 0;
	for _, nOpenHour in ipairs(tbSetting.tbOpenHour) do
		if (nOpenHour == nHour) then
			bOK = 1;
		end
	end
	if (bOK ~= 1) then
		return 0;
	end

	if (nMin> tbSetting.tbOpenDuration) then
		return 0;
	end
	
	return 1;
end

-- kiểm tra đội hữu có hay không hợp pháp 
function tbManager:CheckTeamRegisterCondition(nInstancingTemplateId, nPlayerId)
	local pCaptain = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pCaptain) then
		return 0;
	end
	
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local tbTeammateList,_ = pCaptain.GetTeamMemberList();
	
	local nCount = 0;
	for _, pPlayer in ipairs(tbTeammateList) do
		if (pPlayer.nMapId == pCaptain.nMapId) then
			local nRet, szMsg = self:CheckRegisterCondition(nInstancingTemplateId, pPlayer.nId);
			if (nRet ~= 1) then
				self:Warring(pCaptain, szMsg);
				return 0;
			end	
			
			if (pPlayer.nMapId == pCaptain.nMapId) then
				nCount = nCount + 1;
			end
		end
	end
	
	-- if (nCount <tbSetting.nMinPlayer) then
		-- self:Warring(pCaptain,"Phải có"..(tbSetting.nMinPlayer-nCount).."đội viên ở gần.");
		-- return 0;
	-- end
	
	return 1;
end



-- thân thỉnh thành công 
function tbManager:RegisterSucess(nInstancingTemplateId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	local tbInstancingList = self:GetRunInstancingList();
	for _, tbInstancing in pairs(tbInstancingList) do
		if (tbInstancing.nTeamId == pPlayer.nTeamId) then
			tbInstancing.nTeamId = nil;
		end
	end;
	
	local nMapId = self:GetFreeInstancing(nInstancingTemplateId);
	if (nMapId) then
		self:OpenMap(nMapId, nInstancingTemplateId, nPlayerId)
	else
		local nMapTemplateId = self:GetInstancingSetting(nInstancingTemplateId).nInstancingMapTemplateId;
		if (LoadDynMap(Map.DYNMAP_TREASUREMAP, nMapTemplateId, nInstancingTemplateId) == 1) then
			self.tbWaitQueue[#self.tbWaitQueue + 1] = {nPlayerId = nPlayerId, nInstancingTemplateId = nInstancingTemplateId};
		end
	end
end


-- thân thỉnh tiến nhập FB
function tbManager:AskEnterInstancing(nInstancingTemplateId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	local nRet, szErrorMsg = self:CheckEnterCondition(nInstancingTemplateId, nPlayerId);
	if (nRet ~= 1) then
		self:Warring(pPlayer, szErrorMsg);
		return;
	end

	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local tbInstancingList = self:GetRunInstancingList();
	assert(tbInstancingList);

	for _, tbInstancing in pairs(tbInstancingList) do 
		if ((tbInstancing.nTeamId == pPlayer.nTeamId) and
			(tbInstancing.nInstancingTemplateId == nInstancingTemplateId) and
			self:Time2Int(tbInstancing.tbOpenTime)> pPlayer.GetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId)) then -- TODO:liuchang nhảy qua năm thì hậu hội có vấn đề 
				if (self:CheckTaskLimit(pPlayer, tbSetting.nInstancingEnterLimit_D) ~= 1) then
					self:Warring(pPlayer,"Số lần ngươi vào phó bản đã đến giới hạn.");
					return;
				else
					self:BindPlayer2Instancing(pPlayer.nId, nInstancingTemplateId, tbInstancing.tbOpenTime, tbInstancing.nMapId, tbInstancing.nRegisterMapId); -- TODO:liuchang có lỗ thủng 
					tbInstancing:OnPlayerAskEnter(pPlayer.nId);
					return;
				end
		end
	end
	
	for _, tbInstancing in pairs(tbInstancingList) do		
		local nPlayerInstancingMapId = pPlayer.GetTask(tbSetting.tbInstancingMapId.nTaskGroup, tbSetting.tbInstancingMapId.nTaskId);
		if (tbInstancing.nMapId == nPlayerInstancingMapId) and
			(tbInstancing.nInstancingTemplateId == nInstancingTemplateId) then
			if (self:Time2Int(tbInstancing.tbOpenTime) == pPlayer.GetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId)) then
				tbInstancing:OnPlayerAskEnter(pPlayer.nId);
				return;
			end
		end
	end

	local nRegisterMapId = pPlayer.GetTask(tbSetting.nRegisterMapId.nTaskGroup, tbSetting.nRegisterMapId.nTaskId);
	local tbNow	= os.date("*t", GetTime());
	local nLastHour = (self:Time2Int(tbNow) - pPlayer.GetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId));
	local nLastMin = nLastHour * 60 + tbNow.min;	
		-- trước chú sách đích FBhoàn vị quan bế tắc tiên tiến nhập đáng phục vụ khí đích quân doanh 
	if (nLastMin * 60 <tbSetting.nInstancingExistTime) then
		if (nRegisterMapId ~= pPlayer.nMapId and nRegisterMapId ~= 0) then
			self:Send2RegisterMap(nRegisterMapId, nPlayerId);
			return;
		end
	end
		
	self:Warring(pPlayer,"Báo danh trước hoặc tìm được khu quân doanh của đội lúc báo danh vào phó bản");
end

-- đăng khan khứ báo danh địa đồ 
function tbManager:Send2RegisterMap(nRegisterMapId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	Setting:SetGlobalObj(pPlayer, him, it)
	local szRegisterMapName = Task:GetMapName(nRegisterMapId);
	
	local szMainMsg ="Bạn là người thứ"..szRegisterMapName.."báo danh, xin tới khu vực này để vào phó bản";
	
	local tbOpt = {
		{"Bây giờ đi", self.ChoseCamp, self, nPlayerId, nRegisterMapId, 1631, 3142},		
		{"Kết thúc đối thoại"}
	}
	
	Dialog:Say(szMainMsg, tbOpt);
	Setting:RestoreGlobalObj();
end

function tbManager:ChoseCamp(nPlayerId, nMapId, nPosX, nPosY)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	
	pPlayer.NewWorld(nMapId, nPosX, nPosY);
end

-- tiến nhập FBđích điều kiện 
function tbManager:CheckEnterCondition(nInstancingTemplateId, nPlayerId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return 0,"Người chơi không tồn tại";
	end
	
	-- bạch danh ngoạn gia 
	if (pPlayer.nFaction <= 0) then
		return 0, pPlayer.szName.."Là người chơi chữ trắng!";
	end
	
	-- chờ cấp hạn chế 
	if (pPlayer.nLevel <tbSetting.nMinLevel) then
		return 0, pPlayer.szName.."(đẳng cấp) nhỏ hơn"..tbSetting.nMinLevel;
	end
	
	if (pPlayer.nLevel> tbSetting.nMaxLevel) then
		return 0, pPlayer.szName.."(đẳng cấp) lớn hơn"..tbSetting.nMaxLevel;
	end
	
	local nHaveTask = 0;
	for _, nTaskId in ipairs(tbSetting.tbHaveTask) do
		if (Task:HaveTask(pPlayer, nTaskId) == 1) then
			nHaveTask = 1;
			break;
		end
	end
	
	if (nHaveTask ~= 1 and #tbSetting.tbHaveTask> 0) then
		return 0, pPlayer.szName..tbSetting.szNoTaskMsg;
	end
	
	return 1;
end


-- kiểm tra ngoạn gia đích báo danh điều kiện 
function tbManager:CheckRegisterCondition(nInstancingTemplateId, nPlayerId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return 0,"Người chơi không tồn tại";
	end
	
	
	-- bạch danh ngoạn gia 
	if (pPlayer.nFaction <= 0) then
		return 0, pPlayer.szName.."Là người chơi chữ trắng!";
	end
	
	-- chờ cấp hạn cuối 
	if (pPlayer.nLevel <tbSetting.nMinLevel) then
		return 0, pPlayer.szName.."(đẳng cấp) nhỏ hơn"..tbSetting.nMinLevel;
	end
	
	-- chờ cấp hạn mức cao nhất 
	if (pPlayer.nLevel> tbSetting.nMaxLevel) then
		return 0, pPlayer.szName.."(đẳng cấp) lớn hơn"..tbSetting.nMaxLevel;
	end
	
	-- mỗi ngày tiến nhập FBđích hạn mức cao nhất 
	if (self:CheckTaskLimit(pPlayer, tbSetting.nInstancingEnterLimit_D) ~= 1) then
		return 0, pPlayer.szName.."Số lần vào phó bản hôm nay đã đến giớn hạn.";
		
	end
	
	-- này thời gian điểm đã báo quá danh đích bất năng tái tham dự báo danh 
	local tbNow	= os.date("*t", GetTime());
	if (self:Time2Int(tbNow) == pPlayer.GetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId)) then
		return 0, pPlayer.szName.."Lúc này đã báo danh rồi";
	end
	
	local nHaveTask = 0;
	for _, nTaskId in ipairs(tbSetting.tbHaveTask) do
		if (Task:HaveTask(pPlayer, nTaskId) == 1) then
			nHaveTask = 1;
			break;
		end
	end
	if (nHaveTask ~= 1 and #tbSetting.tbHaveTask> 0) then
		return 0, pPlayer.szName..tbSetting.szNoTaskMsg;
	end
	
	-- ký lục tham gia thứ sổ 
	local nNum = pPlayer.GetTask(StatLog.StatTaskGroupId, 5) + 1;
	pPlayer.SetTask(StatLog.StatTaskGroupId, 5, nNum);
	return 1;
end


-- GCthông tri một địa đồ bị tái nhập 
function tbManager:OnLoadMapFinish(nMapId, nMapTemplateId, nInstancingTemplateId)
	if (#self.tbWaitQueue == 0) then
		assert(false);
		return;
	end
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	for nIndex = 1, #self.tbWaitQueue do
		if (nInstancingTemplateId == self.tbWaitQueue[nIndex].nInstancingTemplateId) then
			local pPlayer = KPlayer.GetPlayerObjById(self.tbWaitQueue[nIndex].nPlayerId);
			if (pPlayer and pPlayer.nTeamId ~= 0) then
				self.tbInstancingUsable[nInstancingTemplateId][#self.tbInstancingUsable[nInstancingTemplateId] + 1] = {MapTemplateId = nMapTemplateId, MapId = nMapId, Free = 0};
				self:OpenMap(nMapId, nInstancingTemplateId, pPlayer.nId);
				table.remove(self.tbWaitQueue, nIndex);
				break;
			else
				self.tbInstancingUsable[nInstancingTemplateId][#self.tbInstancingUsable[nInstancingTemplateId] + 1] = {MapTemplateId = nMapTemplateId, MapId = nMapId, Free = 1};
				table.remove(self.tbWaitQueue, nIndex);
				break;
			end
		end
	end
end


-- thu được một Trống nhàn đích phó bản 
function tbManager:GetFreeInstancing(nInstancingTemplateId)
	if (not self.tbInstancingUsable[nInstancingTemplateId]) then
		self.tbInstancingUsable[nInstancingTemplateId] = {};
		return;
	end
	
	for _, tbInstancing in ipairs(self.tbInstancingUsable[nInstancingTemplateId]) do
		if (tbInstancing.Free == 1) then
			return tbInstancing.MapId;
		end
	end
end


-- phán đoán một gỗ cốp pha địa đồ có phải là hay không quân doanh nhiệm vụ đích địa đồ 
function tbManager:IsArmyCampInstancingMap(nMapTemplateId)
	for _, tbSetting in pairs(self.tbSettings) do
		if (tbSetting.nInstancingMapTemplateId == nMapTemplateId) then
			return 1;
		end
	end
	
	return 0;
end

function tbManager:GetNpcLevel(pPlayer)
	local tbDay2Level = {
		-- khai phục XXthiên ，quái vật chờ cấp để tuyến 
			[1] = {80, 90},
			[2] = {120, 100},
			[3] = {210, 110},
			[4] = {390, 120},
			[5] = {720, 130},
		};
	local nNowTime = GetTime();
	local nNowDay	= Lib:GetLocalDay(nNowTime);
	local nOpenTime = KGblTask.SCGetDbTaskInt(DBTASD_SERVER_STARTTIME);
	local nOpenDay	= Lib:GetLocalDay(nOpenTime);
	local nDetDay	= nNowDay - nOpenDay;
	local nNpcLevel = 0;
	local nLimitLevel	= 0;
	for _, tbInfo in ipairs(tbDay2Level) do
		if (nDetDay <tbInfo[1]) then
			break;
		end
		nLimitLevel = tbInfo[2];
	end
	-- giữ gốc chờ cấp thị 90cấp 
	if (nOpenTime <= 0 or nLimitLevel <= 0) then
		nLimitLevel = 90;
	end
	if (not pPlayer) then
		return nLimitLevel;
	end
	local tbTeammateList, nMemCount = pPlayer.GetTeamMemberList();
	if (tbTeammateList) then
		for _, pPlayer in ipairs(tbTeammateList) do
			nNpcLevel = nNpcLevel + pPlayer.nLevel;
		end
		if (nMemCount> 0) then
			nNpcLevel = math.ceil(nNpcLevel/nMemCount);
		end
	end
	if (nNpcLevel <nLimitLevel) then
		nNpcLevel = nLimitLevel;
	end
	return nNpcLevel;
end

-- khai khải một FB
function tbManager:OpenMap(nMapId, nInstancingTemplateId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	
	-- nặng đưa địa đồ đích Npcvà Obj
	ResetMapNpc(nMapId);
	local tbInstancingBase = self:GetInstancingBase(nInstancingTemplateId);
	local tbInstancing = Lib:NewClass(tbInstancingBase);
	tbInstancing.nMapId = nMapId;
	tbInstancing.nTeamId = pPlayer.nTeamId;
	tbInstancing.nOpenerId = nPlayerId;
	tbInstancing.szOpenerName = pPlayer.szName;
	tbInstancing.nPlayerCount = 0;
	tbInstancing.tbOpenTime	= os.date("*t", GetTime());
	tbInstancing.nRegisterMapId = pPlayer.nMapId;
	tbInstancing.szRegisterMapName = Task:GetMapName(tbInstancing.nRegisterMapId);
	tbInstancing.nNpcLevel = self:GetNpcLevel(pPlayer);
	local tbInstancingList = self:GetRunInstancingList();
	assert(not tbInstancingList[nMapId]);
	tbInstancingList[nMapId] = tbInstancing;
	self:BindTeam2Instancing(nPlayerId, nInstancingTemplateId, tbInstancing.tbOpenTime, nMapId, pPlayer.nMapId);
	tbInstancing:OnOpen();
	
	
	for _, tbInstancing in ipairs(self.tbInstancingUsable[nInstancingTemplateId]) do
		if (tbInstancing.MapId == nMapId) then
			tbInstancing.Free = 0;
			break;
		end
	end
	
	--ngạch ngoại sự món ，hoạt động hệ thống 
	SpecialEvent.ExtendEvent:DoExecute("Open_ArmyCamp", nMapId, nInstancingTemplateId);
	
end

-- đội ngũ và thử FBbảng định 
function tbManager:BindTeam2Instancing(nPlayerId, nInstancingTemplateId, tbOpenTime, nMapId, nRegisterMapId)
	local pCaptain = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pCaptain);
	local tbTeammateList,_ = pCaptain.GetTeamMemberList();
	for _, pPlayer in ipairs(tbTeammateList) do
		if (pPlayer.nMapId == nRegisterMapId) then
			-- ở thân thỉnh FBthành công đáo GCđáp phục FBtái nhập thành công trung gian có một đoạn ngắn thời gian ，này đoạn thời gian nội ，khả năng có phi pháp đội hữu tiến lai 
			if (self:CheckRegisterCondition(nInstancingTemplateId, pPlayer.nId) == 1) then
				self:BindPlayer2Instancing(pPlayer.nId, nInstancingTemplateId, tbOpenTime, nMapId, nRegisterMapId);
			end
		end
	end
end


-- đội viên và thử FBbảng định 
function tbManager:BindPlayer2Instancing(nPlayerId, nInstancingTemplateId, tbOpenTime, nMapId, nRegisterMapId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	pPlayer.DirectSetTask(tbSetting.tbInstancingMapId.nTaskGroup, tbSetting.tbInstancingMapId.nTaskId, nMapId, 1); 									-- ngoạn gia ký lục tương ứng đích FBđịa đồ Id
	pPlayer.DirectSetTask(tbSetting.tbInstancingTimeId.nTaskGroup, tbSetting.tbInstancingTimeId.nTaskId, self:Time2Int(tbOpenTime), 1);	-- ngoạn gia ký lục mình và phó bản bảng định thời gian 
	pPlayer.SetTask(tbSetting.nRegisterMapId.nTaskGroup, tbSetting.nRegisterMapId.nTaskId, nRegisterMapId);										-- ngoạn gia ký lục hắn báo danh địa đồ Id
end


-- quan bế một FB
function tbManager:CloseMap(nMapId)
	local tbInstancingList = self:GetRunInstancingList();
	assert(tbInstancingList[nMapId]);
	local tbInstancing = tbInstancingList[nMapId];
	local nInstancingTemplateId = tbInstancing.nInstancingTemplateId;
	for _, tbInstancing in ipairs(self.tbInstancingUsable[nInstancingTemplateId]) do
		if (tbInstancing.MapId == tbInstancingList[nMapId].nMapId) then
			tbInstancing.Free = 1;
			break;
		end
	end
	
	tbInstancingList[nMapId] = nil;
end


-- thu được lúc này vận được phó bản liệt biểu ，nó khả năng điều không phải liên tục đích hướng dẫn tra cứu 
function tbManager:GetRunInstancingList()
	if (not self.tbInstancingList) then
		self.tbInstancingList = {};
	end
	
	return self.tbInstancingList;
end

function tbManager:GetInstancing(nMapId)
	return self.tbInstancingList[nMapId];
end


--------------------------------------------------------------
-- thu được chỉ định FBđích phối trí 
function tbManager:GetInstancingSetting(nInstancingTemplateId)
	assert(self.tbSettings[nInstancingTemplateId])
	return self.tbSettings[nInstancingTemplateId];
end

-- thu được chỉ định FBđích lâm thì sống lại điểm 
function tbManager:GetRevivePos(nInstancingTemplateId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return unpack(tbSetting.tbRevivePos);
end

-- thu được chỉ định FBđích sinh tồn thời gian 
function tbManager:GetInstancingExistTime(nInstancingTemplateId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return tbSetting.nInstancingExistTime;
end

-- thu được khai khải FBcần nhỏ nhất ngoạn gia sổ 
function tbManager:GetMinPlayerCount(nInstancingTemplateId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return tbSetting.nMinPlayer;
end

-- FBcó thể chứa nạp đích lớn nhất ngoạn gia sổ 
function tbManager:GetMaxPlayerCount(nInstancingTemplateId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return tbSetting.nMaxPlayer;
end

-- thu được tiến nhập FBđích chờ cấp hạn cuối 
function tbManager:GetLevelMinLimit(nInstancingTemplateId)
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return tbSetting.nMinLevel;
end

-- thu được tiến nhập FBđích chờ cấp hạn mức cao nhất 
function tbManager:GetLevelMaxLimit()
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	return tbSetting.nMaxLevel;
end

-- thu được ly báo danh đích thời gian (phân)
function tbManager:GetRegisterWaitTime(nInstancingTemplateId)
	if (not nInstancingTemplateId) then
		nInstancingTemplateId = 1;
	end
	
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local nNowTime	= GetTime();
	local tbToday	= os.date("*t", nNowTime);
	local nHour 	= tbToday.hour;
	local nNextHour	= 0;
	local nMin		= tbToday.min;
	local bOK		= 0;
	
	for _, nOpenHour in ipairs(tbSetting.tbOpenHour) do
		if (nOpenHour == nHour and nMin <= tbSetting.tbOpenDuration) then
			return 0;
		elseif (nOpenHour> nHour) then
			return (60 - nMin) + (nOpenHour - nHour -1) * 60;
		end
	end
	
	return (tbSetting.tbOpenHour[1] + 24 - nHour -1) * 60 + (60 - nMin);
end

--ngoạn gia tiến nhập phó bản mở thời gian kế thì bày 
function tbManager:OpenArmyCampUi(nPlayerId, nTimerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);

	if nTimerId <= 0 then
		return 0;
	end
	local nLastFrameTime = tonumber(Timer:GetRestTime(nTimerId));
	local szMsg ="<color=green>Phó bản kết thúc còn<color> <color=white>%s<color>"
	Dialog:SetBattleTimer(pPlayer, szMsg, nLastFrameTime);
	Dialog:ShowBattleMsg(pPlayer, 1, 0); --khai khải mặt biên 
		
end

--ngoạn gia rời khỏi phó bản quan bế thời gian kế thì bày 
function tbManager:CloseArmyCampUi(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);	
	Dialog:ShowBattleMsg(pPlayer, 0, 0); -- quan bế mặt biên 
end

-- thu được tuần này hoàn thành phó bản kịch chuyện nhiệm vụ đích thứ sổ 
function tbManager:GetGutTaskTimesThisWeek(nInstancingTemplateId, nPlayerId)
	local pPlayer = nil;
	if (MODULE_GAMECLIENT) then
		pPlayer = me;
	else
		pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	end
	
	if (not pPlayer) then
		return;
	end
	
	if (not nInstancingTemplateId) then
		nInstancingTemplateId = 1;
	end
	
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	
	return pPlayer.GetTask(tbSetting.nJuQingTaskLimit_W.nTaskGroup, tbSetting.nJuQingTaskLimit_W.nTaskId);
end

-- thu được lúc này đã khai khải đích phó bản sổ con mắt 
function tbManager:GetCurOpenInstancingNum(nHour)
	local tbRunInstancingList = self:GetRunInstancingList();
	local nCount = 0;
	for _, Instancing in pairs(tbRunInstancingList) do
		if (Instancing.tbOpenTime.hour == nHour) then
			nCount = nCount + 1;
		end
	end
	
	return nCount;
end

-- tuần này hoàn thành phó bản hằng ngày nhiệm vụ thứ sổ vi 
function tbManager:GetDailyTaskTimesThisWeek(nInstancingTemplateId, nPlayerId)
	local pPlayer = nil;
	
	if (MODULE_GAMECLIENT) then
		pPlayer = me;
	else
		pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	end

	if (not pPlayer) then
		return;
	end
	
	if (not nInstancingTemplateId) then
		nInstancingTemplateId = 1;
	end
	
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	
	return pPlayer.GetTask(tbSetting.nDailyTaskLimit_W.nTaskGroup, tbSetting.nDailyTaskLimit_W.nTaskId);
end

-- ngày hôm nay tiến nhập FBđích thứ sổ 
function tbManager:EnterInstancingThisDay(nInstancingTemplateId, nPlayerId)
	local pPlayer = nil;
	if (MODULE_GAMECLIENT) then
		pPlayer = me;
	else
		pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	end

	assert(pPlayer);
	
	if (not nInstancingTemplateId) then
		nInstancingTemplateId = 1;
	end
	
	local tbSetting = self:GetInstancingSetting(nInstancingTemplateId);
	local nTimes = pPlayer.GetTask(tbSetting.nInstancingEnterLimit_D.nTaskGroup, tbSetting.nInstancingEnterLimit_D.nTaskId);
	
	return nTimes;
end


-- ngày hôm nay độc binh thư đích số lượng 
function tbManager:GetBingShuReadTimesThisDay(nPlayerId)
	local pPlayer;
	if (MODULE_GAMECLIENT) then
		pPlayer = me;
	else
		pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	end
	
	assert(pPlayer);
	
	local nReadCount = 0;
	if (pPlayer.nLevel <110) then
		nReadCount = 1 - pPlayer.GetTask(1022, 118);
	else
		nReadCount = 1 - pPlayer.GetTask(1022, 164);
	end;
	return nReadCount;
end

-- ngày hôm nay độc ki quan thư đích số lượng 
function tbManager:JiGuanShuReadedTimesThisDay(nPlayerId)
	local pPlayer;
	if (MODULE_GAMECLIENT) then
		pPlayer = me;
	else
		pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	end
	
	assert(pPlayer);
	
	local nReadCount = 0;
	if (pPlayer.nLevel <110) then
		nReadCount = 1 - pPlayer.GetTask(1022, 131);
	else
		nReadCount = 1 - pPlayer.GetTask(1022, 166);
	end;
	return nReadCount;
end


-- kiểm tra nhiệm vụ biến lượng 
function tbManager:CheckTaskLimit(pPlayer, tbTask)
	if (pPlayer.GetTask(tbTask.nTaskGroup, tbTask.nTaskId)>= tbTask.nLimitValue) then
		return 0;
	end
	
	return 1;
end


-- mỗi tuần thanh một lần 
function tbManager:WeekEvent()
	me.SetTask(1024, 52, 0, 1);
	me.SetTask(1024, 51, 0, 1);
	me.SetTask(1024, 55, 0, 1);
	me.SetTask(1024, 58, 0, 1);
	me.SetTask(1022, 174, 0, 1);
	me.SetTask(1022, 180, 0, 1);
	me.SetTask(1022, 187, 1, 1);
end

-- mỗi ngày thanh một lần 
function tbManager:DailyEvent()
	if (me.nLevel <110) then
		me.SetTask(1022, 118, 1, 1);	-- độc binh thư tiêu ký 
		me.SetTask(1022, 131, 1, 1);	-- ki quan thư 
		me.SetTask(1022, 132, 1, 1);	
	elseif (me.nLevel> 109 and me.nLevel <130) then
		me.SetTask(1022, 164, 1, 1);  -- độc binh thư tiêu ký 
		me.SetTask(1022, 166, 1, 1);  -- ki quan thư 
		me.SetTask(1022, 171, 1, 1);
	else
		me.SetTask(1022, 181, 1, 1);  -- độc binh thư tiêu ký 
		me.SetTask(1022, 183, 1, 1);  -- ki quan thư 
		me.SetTask(1022, 185, 1, 1);	
	end;
	
	me.SetTask(2043, 1, 0, 1);
	me.SetTask(1022, 173, 1, 1);
end

function tbManager:Warring(pPlayer, szMsg, nTime)
	if (MODULE_GAMESERVER) then
		pPlayer.CallClientScript({"Ui:ServerCall","UI_TASKTIPS","Begin", szMsg, nTime});		
	end
end


function tbManager:ShowTip(pPlayer, szMsg, nTime)
	if (MODULE_GAMESERVER) then
		pPlayer.CallClientScript({"Ui:ServerCall","UI_TASKTIPS","Begin", szMsg, nTime});		
	end
end

function tbManager:Tip2MapPlayer(nMapId, szMsg, nTime)
	local tbPlayList, nCount = KPlayer.GetMapPlayer(nMapId);
	for _, pPlayer in ipairs(tbPlayList) do
		self:ShowTip(pPlayer, szMsg, nTime);
	end
end

function tbManager:Time2Int(tbTime)
	local nYear = tbTime.year or 0;
	local nDay	= tbTime.yday or 0;
	local nHour = tbTime.hour or 0;
	return	nYear * 1000 * 100 + nDay * 100 + nHour;
end

PlayerSchemeEvent:RegisterGlobalDailyEvent({Task.tbArmyCampInstancingManager.DailyEvent, Task.tbArmyCampInstancingManager});

PlayerSchemeEvent:RegisterGlobalWeekEvent({Task.tbArmyCampInstancingManager.WeekEvent, Task.tbArmyCampInstancingManager});
