-- 宋金马夫（车夫）脚本

local tbNpc	= Npc:GetClass("Longtruphekim");
tbNpc.nGouhuoSkillId		= 377;		-- 篝火的技能Id
function tbNpc:OnDialog()
local nCmp = me.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);
	if nCmp == 2 then
	return 0;
	end
local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
	}
	 local tbOpt = {
				 GeneralProcess:StartProcess("Đang chiếm lĩnh", 15 * Env.GAME_FPS, {self.OnDialog4, self,nCmp,him.dwId}, nil, tbEvent);
	 };
end
function tbNpc:OnDialog4(nCmp,nNpcId)
	if nCmp ~= 1 then
	return
	end 
	
	local pNpc = KNpc.GetById(nNpcId);
	local nMapId, nX, nY = pNpc.GetWorldPos();
	if not pNpc then
		return 0
	end
	ClearMapNpcWithName(nMapId,"Điêu Tượng Phe Kim");
	if nCmp == 1 then 
		local tbNpc	= Npc:GetClass("Longtruphetong");
		local pNpc2 = KNpc.Add2(7411,100,-1,nMapId, nX, nY);
		tbNpc:StartNpcTimer(pNpc2.dwId)
	end
			KGblTask.SCSetDbTaskInt(DBTASD_TuongPheKim, 0);
		KGblTask.SCSetDbTaskInt(DBTASD_TuongPheTong, 1);
KDialog.MsgToGlobal("<color=yellow><color=pink>Phe Tống<<color> đã chiếm Long Trụ Tống Kim <color=yellow>Người Kim mau mau chiếm lĩnh lại...<color>");
end

function tbNpc:StartNpcTimer(nNpcId)
		local pNpc = KNpc.GetById(nNpcId);
		if not pNpc then
			return 0
		end
		local tbTmp = pNpc.GetTempTable("Npc");
		Timer:Register(15 * Env.GAME_FPS, self.OnNpcTimer, self, nNpcId);
end
function tbNpc:OnNpcTimer(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	self:AddAroundPlayersExp(nNpcId);							-- 给Npc周围队伍玩家加经验
	return 15 * Env.GAME_FPS;
end 
function tbNpc:AddAroundPlayersExp(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	local tbTmp			 = pNpc.GetTempTable("Npc");
	local tbPlayer = KNpc.GetAroundPlayerList(nNpcId, 120);
	local tbPlayerId = {};
	if tbPlayer then
		for _, pPlayer in pairs(tbPlayer) do
			local nCmp = pPlayer.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);
			if nCmp == 2 then
			table.insert(tbPlayerId, pPlayer.nId);
			end
		end
	end
	for _, nPlayerId in pairs(tbPlayerId) do
		self:AddExp2Player(nPlayerId, nNpcId);
	end
	
end
function tbNpc:AddExp2Player(nPlayerId, nNpcId)
	local szMsg		= "Ngươi có công bảo vệ long trụ, nhận được <color=yellow>5<color> điểm tích lũy.";
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	local tbTmp		= pNpc.GetTempTable("Npc");
	pPlayer.CastSkill(self.nGouhuoSkillId, 10, -1, pPlayer.GetNpc().nIndex);
	--pPlayer.AddExp(7000000000);
	pPlayer.AddBindMoney(2000,0);
	local tbBattleInfo	= Battle:GetPlayerData(pPlayer);
					if (0 < tbBattleInfo:AddBounsWithoutCamp(5)) then
						tbBattleInfo.nProtectBouns = tbBattleInfo.nProtectBouns + 5;
					end
					pPlayer.Msg(szMsg);

end


