-- 文件名　:chenchongzhen_gs.lua
-- 创建者　:zhangjunjie
-- 创建时间:2012-02-20 14:37:34
-- 描述:gs

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\boss\\chenchongzhen\\chenchongzhen_def.lua")

ChenChongZhen.tbGameManager = {};
local tbGameManager = ChenChongZhen.tbGameManager;

function tbGameManager:InitManager()
	self.tbGame = {};
	self.tbMap = {};
	self.tbPlayer = {};	--存储是谁开的副本
	self.tbMap_Time = {};
	self.nMapCount = 0;
	self.nGameCount = 0;
end

--gs根据server id申请fb
function tbGameManager:ApplyGame(nPlayerId,nServerId,nApplyMapId)
	self:ClearOutData(self.nMapCount);--申请超时删除
	if self.tbPlayer[nPlayerId] then
		return 0;
	end
	for i = 1, self.nMapCount do
		if not self.tbGame[self.tbMap[i]] and self.tbMap[i] and self.tbMap[i] ~= 0 then
			self.tbPlayer[nPlayerId] = self.tbMap[i];
			self.tbMap[i] = self.tbMap[i];
			self.tbGame[self.tbMap[i]] = Lib:NewClass(ChenChongZhen.tbBase);
			self.tbGame[self.tbMap[i]]:InitGame(self.tbMap[i],nServerId,nPlayerId);
			self.nGameCount = self.nGameCount + 1;
			Map:RegisterMapForbidReviveType(self.tbMap[i],0,0, "Bản đồ hiện tại cấm hồi sinh tại chỗ và hồi sinh kỹ năng ");
--			Map:RegisterMapForbidRemoteRevive(self.tbMap[i],0,"Bản đồ hiện tại tạm thời cấm quay lại thành phố để chữa bệnh ");
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			local szName = pPlayer and pPlayer.szName or "";
			GCExcute{"ChenChongZhen:SyncGameMapInfo_GC",nPlayerId,szName,nApplyMapId};	--同步申请信息到每个gs，保证一个队伍只开启一个副本
			if pPlayer then
				pPlayer.Msg("<color=yellow>Bạn đã mở thành công phó bản Thần Trùng Trấn <color>, hãy kêu gọi đồng đội cùng vào phó bản. ");
				KTeam.Msg2Team(pPlayer.nTeamId, "Đội trưởng đã mở phó bản Thần Trùng Trấn thành công . ");	
			end
			return 1;
		end
	end
	if self.nMapCount >= ChenChongZhen.MAX_GAME then
		return 0;
	end
	if (Map:LoadDynMap(Map.DYNMAP_TREASUREMAP,ChenChongZhen.nTemplateMapId, {self.OnLoadMapFinish,self,nPlayerId,nServerId,nApplyMapId}) == 1)then
		self.nMapCount = self.nMapCount + 1; 	-- 先占一个名额~不用等GC响应也能判断是否已经到达副本上限
		self.tbMap[self.nMapCount] = 0; 		-- 先标0防止其他副本使用本地图
		self.tbPlayer[nPlayerId] = 0;
		self.tbMap_Time[self.nMapCount] = {nPlayerId,GetTime()};
		return 1;
	end
end

function tbGameManager:ClearOutData(nIdx)
	local nNowTime = GetTime();
	for j = nIdx, 1 , -1 do
		if self.tbMap[j] == 0 and self.tbMap_Time then
			local tbInfo = self.tbMap_Time[j];
			if tbInfo and nNowTime - tbInfo[2] >= 600 then
				table.remove(self.tbMap,j);
				self.tbPlayer[tbInfo[1]] = nil;
				self.tbMap_Time[j] = nil;
				self.nMapCount = self.nMapCount - 1;
			end
		end
	end	
end

--地图加载完成后的回调
function tbGameManager:OnLoadMapFinish(nPlayerId,nServerId,nApplyMapId,nMapId)
	for nPlayerId, nIsFinishLoad in pairs(self.tbPlayer) do
		if nIsFinishLoad == 0 then
			for i = 1,  #self.tbMap do
				if self.tbMap[i] == 0 then
					self.tbPlayer[nPlayerId] = nMapId;
					self.tbMap[i] = nMapId;
					self.tbGame[self.tbMap[i]] = Lib:NewClass(ChenChongZhen.tbBase);
					self.tbGame[self.tbMap[i]]:InitGame(self.tbMap[i],nServerId,nPlayerId);
					self.nGameCount = self.nGameCount + 1;
					Map:RegisterMapForbidReviveType(nMapId,0,0, "Bản đồ hiện tại cấm hồi sinh tại chỗ và hồi sinh kỹ năng ");
--					Map:RegisterMapForbidRemoteRevive(nMapId,0,"Bản đồ hiện tại tạm thời cấm quay lại thành phố để chữa bệnh ");
					local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
					local szName = pPlayer and pPlayer.szName or "";
					GCExcute{"ChenChongZhen:SyncGameMapInfo_GC",nPlayerId,szName,nApplyMapId};	--同步申请信息到每个gs，保证一个队伍只开启一个副本
					if pPlayer then
						pPlayer.Msg("<color=yellow>Bạn đã mở thành công phó bản Thần Trùng Trấn <color>, hãy kêu gọi đồng đội cùng vào phó bản.. ");
						KTeam.Msg2Team(pPlayer.nTeamId, "Đội trưởng đã mở phó bản Thần Trùng Trấn thành công .. ");	
					end
					return 1;
				end
			end
		end
	end
	return 0;
end

function ChenChongZhen:Init()
	self.tbManager = {};
end

if not ChenChongZhen.tbManager then
	ChenChongZhen:Init();
end

--通过地图id获取fb对象
function ChenChongZhen:GetGameObjByMapId(nMapId)
	local tbManager = self.tbManager;
	if tbManager[GetServerId()] and tbManager[GetServerId()].tbGame and tbManager[GetServerId()].tbGame[nMapId] then
		return tbManager[GetServerId()].tbGame[nMapId];
	end
end

--通过playerid 获取对象
function ChenChongZhen:GetGameObjByPlayerId(nPlayerId)
	local tbManager = self.tbManager;
	if tbManager[GetServerId()] and tbManager[GetServerId()].tbPlayer[nPlayerId] and
		tbManager[GetServerId()].tbGame and tbManager[GetServerId()].tbGame[tbManager[GetServerId()].tbPlayer[nPlayerId]] then
		return tbManager[GetServerId()].tbGame[tbManager[GetServerId()].tbPlayer[nPlayerId]];
	end
end

function ChenChongZhen:GetGameObjByTeamId(nTeamId)
	if nTeamId <= 0 then
		return;
	end
	local tbTeamList = KTeam.GetTeamMemberList(nTeamId);	
	if not tbTeamList then
		return;
	end
	for _,nPlayerId in pairs(tbTeamList) do
		local pGame = self:GetGameObjByPlayerId(nPlayerId);
		if pGame then
			return pGame;
		end
	end
end

--申请
function ChenChongZhen:ApplyGame_GS(nPlayerId,nServerId,nApplyMapId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not self.tbManager[nServerId] then
		self.tbManager[nServerId] = Lib:NewClass(tbGameManager);
		self.tbManager[nServerId]:InitManager();
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then	--已经有申请过了
		return 0;
	end
	local nRet = self.tbManager[nServerId]:ApplyGame(nPlayerId,nServerId,nApplyMapId);
	if nRet ~= 1 and pPlayer then
		--todo，通知申请 thất bại, 地图满了, xin thử lại sau
		pPlayer.Msg("Hiệp sĩ đã được thử thách trên bản đồ dungeon hiện tại, xin sẽ quay lại sau !");
		return 0;
	end
end

--是否有申请过的副本存在
function ChenChongZhen:IsAlreadyApply(nPlayerId)
	if not self.tbGameMapInfo then
		return 0;
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
		return 1,self.tbGameMapInfo[nPlayerId];
	end
	return 0;
end

--同步申请的信息，保证所有server一个队伍里只能申请一个
function ChenChongZhen:SyncGameMapInfo_GS(nPlayerId,szName,nApplyMapId)
	if not self.tbGameMapInfo then
		self.tbGameMapInfo = {};
	end
	if not self.tbGameMapInfo[nPlayerId] then
		self.tbGameMapInfo[nPlayerId] = {};
	end
	self.tbGameMapInfo[nPlayerId].szName = szName;
	self.tbGameMapInfo[nPlayerId].nApplyMapId = nApplyMapId;
end

-- 关闭
function ChenChongZhen:EndGame_GS(nPlayerId,nServerId,nMapId)
	if self.tbManager and self.tbManager[nServerId] and 
		self.tbManager[nServerId].tbGame and self.tbManager[nServerId].tbGame[nMapId] then
		Map:UnRegisterMapForbidRemoteRevive(nMapId);
		Map:UnRegisterMapForbidReviveType(nMapId);
		self.tbManager[nServerId].tbGame[nMapId] = nil;
		self.tbManager[nServerId].nGameCount = self.tbManager[nServerId].nGameCount - 1;
		self.tbManager[nServerId].tbPlayer[nPlayerId] = nil;
	end
	if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
		self.tbGameMapInfo[nPlayerId] = nil;
	end
end

function ChenChongZhen:GetGameNum(nServerId)
	if not self.tbManager[nServerId] then
		return 0;
	end
	return self.tbManager[nServerId].nGameCount;
end

--加入游戏
function ChenChongZhen:JoinGame()
--[[	if me.GetTiredDegree1() == 2 then
		Dialog:Say("Bạn mệt quá, hãy nghỉ ngơi đi !");
		return;
	end]]
	local nRet,szMsg  = self:CheckCanJoin();
	if nRet ~= 1  then
		Dialog:Say(szMsg);
		return 0;
	end	
	local pGame = self:GetGameObjByTeamId(me.nTeamId);
	if not pGame then
		return 0;
	end
	pGame:JoinGame(me);
end

function ChenChongZhen:CheckCanJoin()
	local nTeamId = me.nTeamId;
	if nTeamId <= 0 then
		return 0,"Vui lòng tham gia vào một đội !";
	end
	local nRet,szMsg = self:CheckCondition();
	if nRet ~= 1 then
		return 0,szMsg;
	end
	local pGame = self:GetGameObjByTeamId(me.nTeamId);
	if not pGame then
		return 0,"Tổ đội của bạn chưa mở Thần Trùng Trấn . ";
	end
	--检查道具
	-- local bHasItem = self:CheckHaveJoinItem(me);
	-- if bHasItem ~= 1 and pGame:FindLogOutPlayer(me.nId) ~= 1 then	--进入过的就不用再判断是不是有道具了
		-- return 0,"Bạn không có gì đó!"
	-- end
	local nPlayerNum = pGame:GetPlayerCount();
	if nPlayerNum >= ChenChongZhen.MAX_PLAYER then
		return 0,"Số người trong bản sao đã đạt đến giới hạn trên !"
	end
--[[	if not Task:GetPlayerTask(me).tbTasks[ChenChongZhen.nHaveTaskId] then
		return 0,"Bạn đã không nhận nhiệm vụ Thần Trùng Trấn !";
	end
	if Task:GetPlayerTask(me).tbTasks[ChenChongZhen.nHaveTaskId].nCurStep ~= ChenChongZhen.nTaskNeedStep then
		return 0,"Bạn không chấp nhận bước nhiệm vụ do Thần Trùng Trấn chỉ định !";
	end]]
	return 1;
end

function ChenChongZhen:CheckCondition()
	local tbTeamList = KTeam.GetTeamMemberList(me.nTeamId);	
	if not tbTeamList then
		return 0,"Không thể nhận thông tin nhóm !";
	end
	local tbGame = {};
	local nGameCount = 0;
	for _,nPlayerId in pairs(tbTeamList) do
		if self:GetGameObjByPlayerId(nPlayerId) then
			tbGame[nPlayerId] = 1;
			nGameCount = nGameCount + 1;
		end
	end
	if nGameCount < 1 then
		local nGameNum = 0;
		local szMap = "";
		for _,nPlayerId in pairs(tbTeamList) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
				nGameNum = nGameNum + 1;
			end
		end
		if nGameNum < 1 then
			return 0,"Đội của bạn chưa báo danh Thần Trùng Trấn, đội trưởng xin đến để mở Thần Trùng Trấn !";
		end
		if nGameNum > 1 then
			local szName = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
				end
			end
			return 0,string.format("Những người chơi khác nhau trong nhóm của Bạn đã mở ngục tối! Người chơi đã mở ngục tối : \n",szName);		
		end
		if nGameNum == 1 then
			local szMap = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szMap = szMap ..  GetMapNameFormId(self.tbGameMapInfo[nPlayerId].nApplyMapId);
					break;
				end
			end
			return 0,string.format("Nhóm của bạn đã có một bản sao trong %s open! Vui lòng đến nơi để vào !",szMap);	
		end
	end
	if nGameCount > 1 then
		local szMsg = "BạnHơn hai người trong đội đã mở một ngục tối và một đội chỉ có thể mở một ngục tối! Người chơi đã mở dungeon  là: \n"
		local szName = "";
		for nId,_ in pairs(tbGame) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nId] then
				szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
			end
		end
		szMsg = szMsg .. szName;
		return 0,szMsg;
	end
	return 1;
end

function ChenChongZhen:CheckCanApply()
	local tbTeamList = KTeam.GetTeamMemberList(me.nTeamId);	
	if not tbTeamList then
		return 0,"Không thể nhận thông tin nhóm !";
	end
	local tbGame = {};
	local nGameCount = 0
	for _,nPlayerId in pairs(tbTeamList) do
		if self:GetGameObjByPlayerId(nPlayerId) then
			tbGame[nPlayerId] = 1;
			nGameCount = nGameCount + 1;
		end
	end
	if nGameCount < 1 then
		local nGameNum = 0;
		local szMap = "";
		for _,nPlayerId in pairs(tbTeamList) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
				nGameNum = nGameNum + 1;
			end
		end
		if nGameNum > 1 then
			local szName = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
				end
			end
			return 0,string.format("Những người chơi khác nhau trong nhóm của Bạn đã mở ngục tối! Người chơi đã mở ngục tối : \n",szName);		
		end
		if nGameNum == 1 then
			local szMap = "";
			for _,nPlayerId in pairs(tbTeamList) do
				if self.tbGameMapInfo and self.tbGameMapInfo[nPlayerId] then
					szMap = szMap ..  GetMapNameFormId(self.tbGameMapInfo[nPlayerId].nApplyMapId);
					break;
				end
			end
			return 0,string.format("Nhóm của bạn đã có một bản sao trong %s open! Vui lòng truy cập và nhập !",szMap);	
		end
	end
	if nGameCount > 1 then
		local szMsg = "BạnHơn hai người trong đội đã mở một ngục tối và một đội chỉ có thể mở một ngục tối! Người chơi đã mở dungeon  là: \n"
		local szName = "";
		for nId,_ in pairs(tbGame) do
			if self.tbGameMapInfo and self.tbGameMapInfo[nId] then
				szName = szName .. self.tbGameMapInfo[nId].szName .. "\n";
			end
		end
		szMsg = szMsg .. szName;
		return 0,szMsg;
	end
--[[	if not Task:GetPlayerTask(me).tbTasks[ChenChongZhen.nHaveTaskId] then
		return 0,"Bạn đã không nhận nhiệm vụ Thần Trùng Trấn !!";
	end
	if Task:GetPlayerTask(me).tbTasks[ChenChongZhen.nHaveTaskId].nCurStep ~= ChenChongZhen.nTaskNeedStep then
		return 0,"Bạn không chấp nhận bước nhiệm vụ do Thần Trùng Trấn chỉ định !!";
	end]]
	return 1;
end


function ChenChongZhen:CheckHaveJoinItem(pPlayer)
	if not pPlayer then
		return 0;
	end
	local tbFind = pPlayer.FindItemInBags(unpack(self.ENTER_ITEM_GDPL));
	if #tbFind < 1 then
		return 0;
	end
	return 1;
end

--扣玩家道具
function ChenChongZhen:ConsumePlayerItem(pPlayer)
	if not pPlayer then
		return 0;
	end
	local tbFind = pPlayer.FindItemInBags(unpack(ChenChongZhen.ENTER_ITEM_GDPL));
	if #tbFind < 1 then
		return 0;
	end
	if #tbFind > 0 then
		pPlayer.ConsumeItemInBags(1, unpack(ChenChongZhen.ENTER_ITEM_GDPL));
--		StatLog:WriteStatLog("stat_info","chenchongzhen","enter",pPlayer.nId,1);	--数据埋点
		return 1;
	end	
end

--给予每周的令牌
function ChenChongZhen:GiveChenChongZhenItem()
	local szMsg = string.format("    如果你的家族威望排行达到了前<color=yellow>%d<color>名，并且你的uy danh giang hồ排名达到了前<color=yellow>%d<color>名，每周星期二中午12点之后，我可以给你发放<color=yellow>%d<color>个进入Thần Trùng Trấn的令牌，不过要在服务器开放皇陵后的第二周才可以进行发放. (<color=yellow>请在当周之内领取令牌<color>)",ChenChongZhen.nGetJoinItemBaseKinLevel,ChenChongZhen.nGetJoinItemBasePlayerLevel,ChenChongZhen.nEnterItemNum);
	local tbOpt = {};
	tbOpt[#tbOpt + 1] = {"Xác định nhận",self.OnGiveChenChongZhenEnterItem,self};
	tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
	Dialog:Say(szMsg,tbOpt);
	return 1;
end

function ChenChongZhen:OnGiveChenChongZhenEnterItem()
	local nOpenBoss120Week = Lib:GetLocalWeek(TimeFrame:GetTime("OpenBoss120"));
	local nNowWeek = Lib:GetLocalWeek(GetTime());
	if TimeFrame:GetState("OpenBoss120") ~= 1 then
		Dialog:Say("Xin lỗi, các ngươi phục vụ khí còn chưa mở ra Hoàng Lăng, không có cách nào tiến hành nhận lệnh bài Thần Trùng Trấn!",{"Ta biết rồi"});
		return 0;
	end
	if nNowWeek <= nOpenBoss120Week then
		Dialog:Say("Xin lỗi, Hoàng Lăng mở được thực hiện sau tuần thứ hai của Thần Trùng Trấn thu thập các thẻ!!",{"Ta biết rồi"});
		return 0;
	end
	local nKinId, nMemberId = me.GetKinMember();	
	local cKin = KKin.GetKin(nKinId);
	if not cKin then
		Dialog:Say("Xin lỗi, ngươi còn không có gia tộc, chờ ngươi có gia tộc thì tới tìm ta !!",{"Ta biết rồi"});
		return 0;
	end
	local nTimeSec = GetTime();
	local nWeek = tonumber(os.date("%w",nTimeSec));
	nWeek = (nWeek == 0 and 7 or nWeek);
	local nTime = nWeek * 10000 + tonumber(os.date("%H%M",nTimeSec));
	if nTime < ChenChongZhen.nGetEnterItemLimitTime then
		Dialog:Say("Xin lỗi, không có thời gian để thu thập thẻ, xin vui lòng thứ Ba 12:00 đến sau khi nhận được!!",{"Ta biết rồi"});
		return 0;
	end
	local nKinRank = HomeLand:GetKinRank(nKinId);
	if nKinRank <= 0 or nKinRank > ChenChongZhen.nGetJoinItemBaseKinLevel then
		Dialog:Say("Thật xin lỗi, danh vọng xếp hạng gia tộc của bạn nhận được e sâu không đáp ứng các điều kiện của  Thần Trùng Trấn, không thể nhận được!!",{"Ta biết rồi"});
		return 0;
	end
	local nPlayerRank = GetPlayerHonorRank(me.nId,11,0,0);	--获取个人uy danh giang hồ排行
	if nPlayerRank <= 0 or nPlayerRank > ChenChongZhen.nGetJoinItemBasePlayerLevel then
		Dialog:Say("Thật xin lỗi, 你uy danh giang hồ排行未达到领取Thần Trùng Trấn令牌的条件，无法进行领取!",{"Ta biết rồi"});
		return 0;
	end
	local nLastGetTime = Lib:GetLocalWeek(me.GetTask(ChenChongZhen.nTaskGroupId,ChenChongZhen.nTaskGetItemTime));
	local nNowWeekTime = Lib:GetLocalWeek(GetTime());
	if nLastGetTime == nNowWeekTime then
		Dialog:Say("Thật xin lỗi tuần này bạn đã nhận rồi xin quay lại vào tuần sau!!",{"Ta biết rồi"});
		return 0;
	end
	if me.CountFreeBagCell() < ChenChongZhen.nEnterItemNum then
		local szMsg = "Hành trang ô trống không đủ，không thể nhận thưởng!!";
		me.Msg(szMsg);
		return 0;
	end
	local tbItemGdpl = ChenChongZhen.ENTER_ITEM_GDPL;
	local nRemainWeekDay = 7 - (tonumber(os.date("%w",nTimeSec)) == 0 and 7 or tonumber(os.date("%w",nTimeSec)));
	local nRemainDayTime = Lib:GetDate2Time(tonumber(os.date("%Y%m%d",GetTime()))) + 3600 * 24 * (nRemainWeekDay + 1);
	for i = 1 , ChenChongZhen.nEnterItemNum do
		local pItem = me.AddItemEx(tbItemGdpl[1],tbItemGdpl[2],tbItemGdpl[3],tbItemGdpl[4],nil,nil,nRemainDayTime);
		if not pItem then
			Dbg:WriteLog("ChenChongZhen", "Give Enter Item failed",me.szName);
		end	
	end
	local szKinName = cKin.GetName();
--	StatLog:WriteStatLog("stat_info","chenchongzhen","get",me.nId,szKinName,2);	--数据埋点
	me.SetTask(ChenChongZhen.nTaskGroupId,ChenChongZhen.nTaskGetItemTime,GetTime());
	return 1;
end