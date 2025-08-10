
local tbYiCengBox = Npc:GetClass("yc_baoxiang");

tbYiCengBox.OPEN_NPC = {
		{4283, 20},
		{4284, 40},
		{4285, 60},
		{2756, 90},
	}
tbYiCengBox.NPC_OUT_COUNT		= 8;
tbYiCengBox.COST_TIME			= 100	--khai rương cần thời gian 
-- ở khai khải mỗi tằng bảo rương thì rơi xuống vật phẩm cập vật phẩm đích số lượng 
tbYiCengBox.tbDrapItem = {szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\hailingwang_lv1.txt", nDrapItemCount = 8,};

--khai khải bảo rương 
function tbYiCengBox:OnCheckOpen(nPlayerId, nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc or pNpc.nIndex == 0) then
		return;
	end
	
	local nMapId, nX, nY = pNpc.GetWorldPos();
	
	local nRate = MathRandom(100);
	if (nRate <self.OPEN_NPC[1][2]) then
		for i = 1, self.NPC_OUT_COUNT do
			KNpc.Add2(self.OPEN_NPC[1][1], 120, -1, nMapId, nX, nY);
		end;
		local szName = KNpc.GetNameByTemplateId(self.OPEN_NPC[1][1]);
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương ，gặp một đám".. szName.."。");
	elseif (nRate <self.OPEN_NPC[2][2]) then
		for i = 1, self.NPC_OUT_COUNT do
			KNpc.Add2(self.OPEN_NPC[2][1], 120, -1, nMapId, nX, nY);
		end;
		local szName = KNpc.GetNameByTemplateId(self.OPEN_NPC[2][1]);
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương ，gặp một đám".. szName.."。");
	elseif (nRate <self.OPEN_NPC[3][2]) then
		for i = 1, self.NPC_OUT_COUNT do
			KNpc.Add2(self.OPEN_NPC[3][1], 120, -1, nMapId, nX, nY);
		end;
		local szName = KNpc.GetNameByTemplateId(self.OPEN_NPC[3][1]);
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương ，gặp một đám".. szName.."。");
	elseif (nRate <self.OPEN_NPC[4][2]) then
		for i = 1, self.NPC_OUT_COUNT do
			KNpc.Add2(self.OPEN_NPC[4][1], 120, -1, nMapId, nX, nY);
		end;
		local szName = KNpc.GetNameByTemplateId(self.OPEN_NPC[4][1]);
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương ，gặp một đám".. szName.."。");
	else
		pPlayer.DropRateItem(self.tbDrapItem.szDropItemFilePath, self.tbDrapItem.nDrapItemCount, -1, -1, pNpc);
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương ！");
	end;
	
	pNpc.Delete();
end

--điểm kích bảo rương thì đối thoại 
function tbYiCengBox:OnDialog()
	--đả đoạn khai khải sự món 
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
	--khai khải bảo rương 
	GeneralProcess:StartProcess("đang mở bảo rương", self.COST_TIME, {self.OnCheckOpen, self, me.nId, him.dwId}, {me.Msg,"mở bị đánh đoạn"}, tbEvent);
end
