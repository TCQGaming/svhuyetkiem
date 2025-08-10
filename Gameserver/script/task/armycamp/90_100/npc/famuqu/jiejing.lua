local tbNpc = Npc:GetClass("jiejing");


function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	
	local szMsg ="đây là nhất điều đi thông sừng tê giác quáng và loạn thạch bãi đích tiệp kính ，nếu như ngươi hoặc của ngươi đội hữu đã khai khải liễu thông quan đích điều kiện ，liền có thể thông qua này điều tiệp kính trực tiếp đi trước chỗ đó 。nhưng nhu tiền trả 500lượng bạc 。";
	local tbOpt = 
	{
		{"ta muốn đi trước sừng tê giác quáng", tbNpc.JieJing, self, 1, tbInstancing, me.nId},
		{"ta muốn đi trước loạn thạch bãi", tbNpc.JieJing, self, 2, tbInstancing, me.nId},
		{"kết thúc đối thoại"},
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:JieJing(nPosType, tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	if (pPlayer.nCashMoney <500) then
		Task.tbArmyCampInstancingManager:Warring(pPlayer,"trên người ngươi đích tiền không đủ ！");
		return;
	end
	
	if (nPosType == 1 and tbInstancing.nFaMuQuTrapOpen == 1) then
		assert(pPlayer.CostMoney(500, Player.emKPAY_CAMPSEND) == 1);
		pPlayer.NewWorld(tbInstancing.nMapId, 1919, 3308);	
		pPlayer.SetFightState(1);
		return;
	elseif (nPosType == 2 and tbInstancing.nCaiKuangQuPass == 1) then
		assert(pPlayer.CostMoney(500, Player.emKPAY_CAMPSEND) == 1);
		pPlayer.NewWorld(tbInstancing.nMapId, 1668,3764);
		pPlayer.SetFightState(1);
		return;
	end
	
	Task.tbArmyCampInstancingManager:Warring(pPlayer,"chỉ có thông qua quan tạp sau khi tài có thể sử dụng tiệp kính");
end

