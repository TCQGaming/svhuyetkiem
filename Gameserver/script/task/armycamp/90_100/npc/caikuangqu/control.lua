-- khống chế khí ，dùng sinh mở một ít Trap

local tbNpc = Npc:GetClass("funiushan_control");


function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	local nTrapIndex = 0;
	for nIndex = 1, #tbInstancing.tbBarrierPairs do
		if (tbInstancing.tbBarrierPairs[nIndex][1] == him.dwId) then
			nTrapIndex = nIndex;
			break;
		end
	end
	assert(nTrapIndex ~= 0);
	
	if (tbInstancing.tbBarrierPairs[nTrapIndex][3] == 1) then
		Task.tbArmyCampInstancingManager:ShowTip(me,"đáng ki quan đã bị mổ khai ！");
		return;
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
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
	}
	
	GeneralProcess:StartProcess("đang ở khai khải ki quan", 15 * 18, {self.OnOpen, self, me.nId, nSubWorld, nTrapIndex}, {me.Msg,"khai khải bị đánh đoạn ！"}, tbEvent);		
end;


function tbNpc:OnOpen(nPlayerId, nMapId, nTrapIndex)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);
	tbInstancing.tbBarrierPairs[nTrapIndex][3] = 1;
	local pBarrier = KNpc.GetById(tbInstancing.tbBarrierPairs[nTrapIndex][2]);
	if (pBarrier) then
		pBarrier.Delete();
	end
	Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"một trận tiếng vang quá hậu ，một đạo áp môn ứng thanh khai khải 。");
end;
