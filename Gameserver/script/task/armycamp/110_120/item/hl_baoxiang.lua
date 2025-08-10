
local tbHLTreasureBox = Npc:GetClass("hl_baoxiang");

tbHLTreasureBox.ALL_LOCK_COUNT 	= 5; 	--cái rương đích tổng tằng sổ 
tbHLTreasureBox.COST_TIME			= 100	--khai rương cần thời gian 
tbHLTreasureBox.TIRED_DURATION		= 10 * Env.GAME_FPS;	-- lao luy kéo dài thời gian 
tbHLTreasureBox.TIRED_SKILLID		= 389;	--kỹ năng dùng sinh khống chế thời gian khoảng cách 

tbHLTreasureBox.tbProlibity = {
			50,
			30,
			20,
		}

-- ở khai khải mỗi tằng bảo rương thì rơi xuống vật phẩm cập vật phẩm đích số lượng 
tbHLTreasureBox.tbDrapItem = 
{
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv1.txt", nDrapItemCount = 6,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv2.txt", nDrapItemCount = 6,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv3.txt", nDrapItemCount = 6,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv4.txt", nDrapItemCount = 6,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv5.txt", nDrapItemCount = 6,},
}

-- mở nhất tằng 
function tbHLTreasureBox:DecreaseLockLayer(pPlayer, pNpc)
	if not pPlayer or not pNpc then
		return;	
	end
	
	local tbNpcData = pNpc.GetTempTable("Task"); 
	assert(tbNpcData);
	
	if (5 <= tbNpcData.CUR_LOCK_COUNT) then
		return;
	end
	
	tbNpcData.CUR_LOCK_COUNT = tbNpcData.CUR_LOCK_COUNT + 1;
	KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."mở liễu bảo rương đích thứ <color=yellow>".. tbNpcData.CUR_LOCK_COUNT.."<color>tằng tỏa ！");
	
	if (tbNpcData.CUR_LOCK_COUNT <= 5) then
		local tbLayerInfo = self.tbDrapItem[tbNpcData.CUR_LOCK_COUNT];
		pPlayer.DropRateItem(tbLayerInfo.szDropItemFilePath, tbLayerInfo.nDrapItemCount, -1, -1, pNpc);
	end
	--cuối cùng nhất tằng 
	if(tbNpcData.CUR_LOCK_COUNT == 5) then 
		KTeam.Msg2Team(pPlayer.nTeamId,"<color=yellow>bảo rương đã bị mở<color>！");
		tbNpcData.CUR_LOCK_COUNT = 0;
		local nEntryWayRate = MathRandom(100);
		--print(self.tbProlibity[tbNpcData.nHongLianDiYu], nEntryWayRate);
		if (tbNpcData.nHongLianDiYu and tbNpcData.nHongLianDiYu> 0 and tbNpcData.nHongLianDiYu <4 and self.tbProlibity[tbNpcData.nHongLianDiYu]> nEntryWayRate) then	
			local nMapId, nPosX, nPosY = pNpc.GetWorldPos();
			local pBox = KNpc.Add2(4277, 120, -1, nMapId, nPosX, nPosY);
			local tbData = pBox.GetTempTable("Task");
			tbData.nHongLianDiYu = tbNpcData.nHongLianDiYu;
			local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nMapId);
			if (tbInstancing) then
				--Lib:ShowTB(tbInstancing.tbKuoZhanQuOut);
				tbInstancing.tbKuoZhanQuOut[tbData.nHongLianDiYu] = 1;
			end;
			
			local tbPlayList,_ = KPlayer.GetMapPlayer(nMapId);
			for _, teammate in ipairs(tbPlayList) do
				Task.tbArmyCampInstancingManager:ShowTip(teammate,"một đạo thần bí địa đạo nhập khẩu xuất hiện ở trước mắt");
			end;
		end;
		pNpc.Delete();
	end
end

--khai khải bảo rương 
function tbHLTreasureBox:OnCheckOpen(nPlayerId, nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc or pNpc.nIndex == 0) then
		return;
	end
	
	local tbNpcData = pNpc.GetTempTable("Task"); 
	assert(tbNpcData);
	
	local nCurLockLayer = tbNpcData.CUR_LOCK_COUNT;
	if (5 <= nCurLockLayer) then
		-- đã toàn bộ mở 
		return;
	end
	
	pPlayer.AddSkillState(self.TIRED_SKILLID, 1, 1, self.TIRED_DURATION);
	self:DecreaseLockLayer(pPlayer, pNpc);
end

--điểm kích bảo rương thì đối thoại 
function tbHLTreasureBox:OnDialog()
	
	local pNpc = KNpc.GetById(him.dwId);
	if (not pNpc or pNpc.nIndex == 0) then
		return;
	end
	--khoảng cách thời gian có hay không đáo 	
	local nRet = me.GetSkillState(self.TIRED_SKILLID);
	if (nRet ~= -1) then
		Dialog:SendInfoBoardMsg(me,"<color=red>ngươi quá mệt mỏi cần nghỉ ngơi một hồi tài năng tiếp theo mở bảo rương ！<color>");
		return;
	end
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
	GeneralProcess:StartProcess("đang mở bảo rương", tbHLTreasureBox.COST_TIME, {self.OnCheckOpen, self, me.nId, him.dwId}, {me.Msg,"mở bị đánh đoạn"}, tbEvent);
end
