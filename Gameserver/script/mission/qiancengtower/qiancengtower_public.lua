-- 文件名　：qiancengtower_public.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-06-16 12:47:03

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");

function QianCengTower:GetPlayerTodayJoinCount(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_TODAY_JOIN_COUNT);
end

function QianCengTower:SetPlayerTodayJoinCount(pPlayer, nCount)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_TODAY_JOIN_COUNT, nCount);
	return 1;
end

function QianCengTower:SetPlayerGameMap(pPlayer, nDynMapId)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_OPEN_MAPID, nDynMapId);
	return 1;
end

function QianCengTower:GetPlayerGameMap(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_OPEN_MAPID);
end

function QianCengTower:SetOpenGameTime(pPlayer, nOpenTime)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_OPEN_TIME, nOpenTime);
	return 1;
end

function QianCengTower:GetOpenGameTime(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_OPEN_TIME);
end

function QianCengTower:SetPlayerRoomSave(pPlayer, nRoomNum)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_ROOM_NUM_SAVE, nRoomNum);
	return 1;
end

function QianCengTower:GetPlayerRoomSave(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_ROOM_NUM_SAVE);
end

function QianCengTower:SetPlayerMissionId(pPlayer, nMissionId)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_ROOM_MISSION_ID, nMissionId);
	return 1;
end

function QianCengTower:GetPlayerMissionId(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_ROOM_MISSION_ID);
end

function QianCengTower:SetPlayerOpenRoom(pPlayer, nRoomNum)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_OPEN_ROOM_NUM, nRoomNum);
	return 1;
end

function QianCengTower:GetPlayerOpenRoom(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_OPEN_ROOM_NUM);
end

function QianCengTower:SetPlayerReviveNum(pPlayer, nReviveCount)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_PLAYER_REVIVE_COUNT, nReviveCount);
	return 1;
end

function QianCengTower:GetPlayerReviveNum(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_PLAYER_REVIVE_COUNT);
end

function QianCengTower:SetPlayerFanPaiCount(pPlayer, nCount)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_FAN_PAI_COUNT, nCount);
	return 1;
end

function QianCengTower:GetPlayerFanPaiCount(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_FAN_PAI_COUNT);
end

function QianCengTower:SetPlayerLeavePos(pPlayer, nMapId, nMapX, nMapY)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPID, nMapId);
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPX, nMapX);
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPY, nMapY);
	return 1;
end

function QianCengTower:GetPlayerLeavePos(pPlayer)
	local nMapId = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPID);
	local nMapX = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPX);
	local nMapY = pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_LEAVE_MAPY);
	return nMapId, nMapX, nMapY;
end

function QianCengTower:SetPlayerBuyFanPaiType(pPlayer, nType)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUY_FAN_PAI_TYPE, nType);
	return 1;
end

function QianCengTower:GetPlayerBuyFanPaiType(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_BUY_FAN_PAI_TYPE);
end

function QianCengTower:SetPlayerFanResult(pPlayer, nType)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_BUY_FAN_PAI_RET, nType);
	return 1;
end

function QianCengTower:GetPlayerFanResult(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_BUY_FAN_PAI_RET);
end

function QianCengTower:SetPlayerFinishAward(pPlayer, nType)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_FINISH_AWARD, nType);
	return 1;
end

function QianCengTower:GetPlayerFinishAward(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_FINISH_AWARD);
end

function QianCengTower:SetPlayerFinishAwardStartRoom(pPlayer, nRoomNum)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_FINISH_AWARD_START_ROOM, nRoomNum);
	return 1;
end

function QianCengTower:GetPlayerFinishAwardStartRoom(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_FINISH_AWARD_START_ROOM);
end

function QianCengTower:SetPlayerBuyFanPaiCount(pPlayer, nCount)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_LAST_FANPAI_COUNT, nCount);
	return 1;
end

function QianCengTower:GetPlayerBuyFanPaiCount(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_LAST_FANPAI_COUNT);
end

function QianCengTower:SetPlayerYueJiaBuffCount(pPlayer, nCount)
	pPlayer.SetTask(self.TASK_GROUP_ID, self.TASK_YUEJIA_BUFF, nCount);
	return 1;
end

function QianCengTower:GetPlayerYueJiaBuffCount(pPlayer)
	return pPlayer.GetTask(self.TASK_GROUP_ID, self.TASK_YUEJIA_BUFF);
end

-- tbQianCengLadder = { [1] = { nRoomNum, nTime, szName },}
function QianCengTower:InsertQianCengLadderInfo(szName, nRoomNum)
	local tbInfo = self.tbQianCengLadder[szName];
	if (not tbInfo) then
		self.tbQianCengLadder[szName] = {nRoomNum, 999999};
	elseif (tbInfo[1] < nRoomNum) then
		self.tbQianCengLadder[szName][1] = nRoomNum;
		if (MODULE_GC_SERVER) then
			GlobalExcute({"QianCengTower:InsertQianCengLadderInfo", szName, nRoomNum});
		end
	end
	return 1;
end

function QianCengTower:LoadQianCengLadder()
	self.tbQianCengLadder = {};
	
	self.tbFirstLadderPlayer = {};
	for szName, tbInfo in pairs(self.tbQianCengLadder) do
		if (tbInfo[2] == 1) then
			self.tbFirstLadderPlayer = {szName, tbInfo[1], tbInfo[2]};
			break;
		end
	end
end

function QianCengTower:UpdateQianCengFirstLadderInfo(tbInfo)
	self.tbFirstLadderPlayer = tbInfo;
end

function QianCengTower:AlterRoleName(szOldName, szNewName)
	if (not szOldName or not szNewName) then
		return 0;
	end
	
	local tbInfo = self.tbQianCengLadder[szOldName];
	if (not tbInfo) then
		return 0;
	end
	
	self.tbQianCengLadder[szOldName] = nil;
	self.tbQianCengLadder[szNewName] = tbInfo;
	if (MODULE_GC_SERVER) then
		GlobalExcute({"QianCengTower:AlterRoleName", szOldName, szNewName});
	end
	return 1;
end


