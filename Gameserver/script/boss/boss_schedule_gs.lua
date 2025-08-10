-------------------------------------------------------------------
--File: boss_schedule_gs.lua
--Author: lbh
--Date: 2008-1-21 10:24
--Describe: 刷Boss脚本gameserver端
-------------------------------------------------------------------
if not Boss then
	Boss = {};
elseif not MODULE_GAMESERVER then
	return;
end

-- 记录哪些Boss已被召出
if not Boss.tbUniqueBossCallOut then
	Boss.tbUniqueBossCallOut = {};
end

function Boss:DoCallOut(nTemplateId, nLevel, nSeries, nMapId, nMapX, nMapY)
	local nMapIndex = SubWorldID2Idx(nMapId);
	if nMapIndex < 0 then
		return;
	end
	-- Boss已被召出而且未被打死
	if self.tbUniqueBossCallOut[nTemplateId] then
		return 0;
	end	
	-- Call Boss
	local pNpc = KNpc.Add(nTemplateId, nLevel, nSeries, nMapIndex, nMapX, nMapY, 0, 1)
	
	if pNpc then
		self:AddBoss(nMapId, pNpc.dwId); 
		self.tbUniqueBossCallOut[nTemplateId] = 1;
		 -- Jie add
        pNpc.SetLoseItemCallBack(1);
		-- by zhangjinpin@kingsoft
		if Boss.Qinshihuang:OnBossCallOut(pNpc) == 1 then
			return;
		end
		
		local szMsg = string.format("Nghe nói võ lâm cao thủ <color=white>%s<color> xuất hiện ở <color=green>%s<color>!", 
			pNpc.szName, GetMapNameFormId(nMapId));
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
		KDialog.MsgToGlobal(szMsg);				
	end
end
Boss.SYNC_TIME = 1 * Env.GAME_FPS; -- cùng bước thời gian 
Boss.NEAR_DIS = 56; -- khoảng cách 
Boss.MAX_AWARD_NUM = 3; -- lớn nhất tưởng thưởng đơn vị 
Boss.MIN_AWARD_PER = 0.04; -- nhỏ nhất phần trăm so 
Boss.MAX_AWARD_PER = 0.8; -- lớn nhất lấy được tưởng thưởng phần trăm so 
Boss.BELONG_TIME = 300 * Env.GAME_FPS; -- quy chúc thời gian 
Boss.CLOSE_MSG_DAY = 100; -- khai dùng/uống 100 ngày sau bất công cáo bang hội cùng gia tộc 
Boss.DROP_TIMES = 
{ 
["uniqueboss"] = 50, 
["boss_qinlingsmall"]= 100, 
["boss_qinshihuang"] = 100, 
}; 
function Boss:InitMgr() 
self.tbBossMgr = self.tbBossMgr or {}; 
self.tbTimerMgr = self.tbTimerMgr or {}; 
end 
Boss:InitMgr(); 

function Boss:AddBoss(nMapId, nBossId) 
local pBoss = KNpc.GetById(nBossId); 
if not pBoss then 
return 0; 
end 
-- pBoss.OpenCalcBossDamage(); 
self.tbBossMgr[nMapId] = self.tbBossMgr[nMapId] or {}; 
self.tbBossMgr[nMapId][nBossId] = self.tbBossMgr[nMapId][nBossId] or {}; 
if not self.tbTimerMgr[nMapId] then 
local nTimerId = Timer:Register(self.SYNC_TIME, self.Sync, self, nMapId); 
if not nTimerId or nTimerId <= 0 then 
return; 
end 
self.tbTimerMgr[nMapId] = nTimerId; 
end 

-- bản đồ trở về điều 
if Lib:CountTB(self.tbBossMgr[nMapId]) == 1 then 
local tbMap = Map:GetClass(nMapId); 
tbMap:RegisterMapLeaveFun("UnnicelBoss", Boss.OnLeaveMap, Boss); 
end 
end 
function Boss:Sync(nMapId) 
local tbNearPlayer = {}; 
if self.tbBossMgr[nMapId] then 
tbNearPlayer[nMapId] = tbNearPlayer[nMapId] or {}; 
for nBossId, tbPlayerList in pairs(self.tbBossMgr[nMapId]) do 
tbNearPlayer[nMapId][nBossId] = tbNearPlayer[nMapId][nBossId] or {}; 
local tbPlayer = KNpc.GetAroundPlayerList(nBossId, self.NEAR_DIS); 
if not tbPlayer then 
-- Dbg:WriteLog("Boss", "BossSyncError", nMapId, nBossId); 
end 
tbPlayer = tbPlayer or {}; 
for _, pPlayer in pairs(tbPlayer) do 
if not tbPlayerList[pPlayer.nId] then 
self:JoinPlayer(nMapId, nBossId, pPlayer.nId, pPlayer); 
end 
tbNearPlayer[nMapId][nBossId][pPlayer.nId] = pPlayer; 
end 
end 
end 
local nCount = "oke";
if self.tbBossMgr[nMapId] then 
for nBossId, tbPlayerList in pairs(self.tbBossMgr[nMapId]) do 
local szBattleInfo = self:GetBattleInfo(nBossId,pPlayer); 
for nId, _ in pairs(tbPlayerList) do 
local pPlayer = KPlayer.GetPlayerObjById(nId); 
if not tbNearPlayer[nMapId][nBossId][nId] or not pPlayer then 
self:KickOutPlayer(nMapId, nBossId, nId, pPlayer); 
elseif pPlayer then 
Dialog:SendBattleMsg(pPlayer, szBattleInfo); 
Dialog:ShowBattleMsg(pPlayer, 1, 0); 
end 
end 
end 
end 
end 
function Boss:KickOutPlayer(nMapId, nBossId, nId, pPlayer) 
if pPlayer then 
local tbTemp = pPlayer.GetTempTable("Boss"); 
if tbTemp.tbUniqueBossId and tbTemp.tbUniqueBossId[nBossId] then 
Dialog:ShowBattleMsg(pPlayer, 0, 0); 
tbTemp.tbUniqueBossId[nBossId]= nil; 

-- hoàng lăng đặc thù xử lý một chút 
if GetMapType(nMapId) == "qinshihuangling" then 
local nUseTime = pPlayer.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME); 
local nFrame = (Boss.Qinshihuang.MAX_DAILY_TIME - nUseTime) * Env.GAME_FPS; 
Boss.Qinshihuang:OpenRightUI(pPlayer, nFrame); 
end 
end 
end 
if self.tbBossMgr[nMapId] and self.tbBossMgr[nMapId][nBossId] and self.tbBossMgr[nMapId][nBossId][nId] then 
self.tbBossMgr[nMapId][nBossId][nId] = nil; 
end 
end 
function Boss:OnLeaveMap() 
local tbTemp = me.GetTempTable("Boss"); 
if tbTemp.tbUniqueBossId then 
Dialog:ShowBattleMsg(me, 0, 0); 
tbTemp.tbUniqueBossId = nil; 
end 
end 
function Boss:JoinPlayer(nMapId, nBossId, nId, pPlayer) 
if not self.tbBossMgr[nMapId][nBossId][nId] and pPlayer then 
self.tbBossMgr[nMapId][nBossId][nId] = pPlayer; 
local tbTemp = pPlayer.GetTempTable("Boss"); 
tbTemp.tbUniqueBossId = tbTemp.tbUniqueBossId or {}; 
tbTemp.tbUniqueBossId[nBossId] = 1; 
end 
end 
Boss._SortDamage = function(tbDamage1, tbDamage2)
	return tbDamage1.nDamage > tbDamage2.nDamage;
end
function Boss:GetBattleInfo(nBossId) 

	local szMsg = "";

local pBoss = KNpc.GetById(nBossId); 
	if not pBoss then
		return;
	end
	local tbSort = {unpack(pBoss.GetDamageTable())};
	table.sort(tbSort, self._SortDamage);
	szMsg = szMsg .."<color=green>Tên Boss: <color=white>"..pBoss.szName.."<color>\n";
	
	for i = 1, 3 do
		if tbSort[i] then
			local szCaptainName = nil;
			if tbSort[i].nPlayerId > 0 then
				if tbSort[i].nTeamId == 0 then
					szCaptainName = KGCPlayer.GetPlayerName(tbSort[i].nPlayerId);
				else
					local tbPlayer = KTeam.GetTeamMemberList(tbSort[i].nTeamId) or {};
					if tbPlayer[1] then
						szCaptainName = KGCPlayer.GetPlayerName(tbPlayer[1]);
					end
				end
			end	
----------------------------------
		
			if szCaptainName then
	-- szMsg = szMsg .. string.format("<color=green>Hạng %d: <color>", i) .. "Đội của <color=yellow>" .. szCaptainName .. "<color>: <color=yellow> ".. math.floor(tbSort[i].nDamage) .."<color> <color=white>sát thương<color>\n";
				szMsg = szMsg .. string.format("<color=green>%d: <color>", i) .. "<color=red>Đội <color=yellow>" .. szCaptainName .. "<color> : <color=yellow> ".. math.floor(tbSort[i].nDamage) .."<color> <color=red>ST<color>\n";
			end
		end
	end
return szMsg; 

end 