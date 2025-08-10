-- 文件名　：qiancengtower_room.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-05-29 14:28:55

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");

QianCengTower.tbMapMgr = QianCengTower.tbMapMgr or {};
local tbMapMgr = QianCengTower.tbMapMgr;

function tbMapMgr:OnEnter()
	local nMapId = me.nMapId;
	local nMissionId = QianCengTower.tbMapId2MisId[nMapId];
	if (not nMissionId) then
		return 0;
	end
	
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (tbMission) then
		return 0;
	end

	tbMission = QianCengTower.tbMissionList[nMissionId];
	tbMission:JoinPlayer(me, 1);
	me.GetTempTable("QianCengTower").tbMission = tbMission;
	return 1;
end

function tbMapMgr:OnPlayerTrap(szClassName)
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 0;
	end

	tbMission:OnPlayerTrap(szClassName);
end

function QianCengTower:ReloadMapFun()
	for nTempId, tbInfo in pairs(self.tbMap2PosCfg) do
		local tbGameMap = Map:GetClass(nTempId);		
		for szFnc in pairs(QianCengTower.tbMapMgr) do
			tbGameMap[szFnc] = tbMapMgr[szFnc];
		end
	end
end

ServerEvent:RegisterServerStartFunc(QianCengTower.ReloadMapFun, QianCengTower);
