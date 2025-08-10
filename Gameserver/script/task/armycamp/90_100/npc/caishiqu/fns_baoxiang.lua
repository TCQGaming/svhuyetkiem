----------------------------------------
-- Phục Ngưu Sơn Trang bảo rương 
-- ZhangDeheng
-- 2008/10/28 10:41
----------------------------------------

local tbFnsTreasureBox = Npc:GetClass("fnsbaoxiang");

tbFnsTreasureBox.ALL_LOCK_COUNT 	= 5; 	--cái rương đích tổng tằng sổ 
tbFnsTreasureBox.COST_TIME			= 100	--khai rương cần thời gian 
tbFnsTreasureBox.TIRED_DURATION		= 10 * Env.GAME_FPS;	-- lao luy kéo dài thời gian 
tbFnsTreasureBox.TIRED_SKILLID		= 389;	--kỹ năng dùng sinh khống chế thời gian khoảng cách 

-- ở khai khải mỗi tằng bảo rương thì rơi xuống vật phẩm cập vật phẩm đích số lượng 
tbFnsTreasureBox.tbDrapItem = 
{
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv1.txt", nDrapItemCount = 8,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv2.txt", nDrapItemCount = 8,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv3.txt", nDrapItemCount = 8,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv4.txt", nDrapItemCount = 8,},
	{szDropItemFilePath ="setting\\npc\\droprate\\renwudiaoluo\\baoxiang_lv5.txt", nDrapItemCount = 8,},
}

-- mở nhất tằng 
function tbFnsTreasureBox:DecreaseLockLayer(pPlayer, pNpc)
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
		KTeam.Msg2Team(pPlayer.nTeamId,"<color=yellow>bảo rương đã bị đánh khai <color>！");
		tbNpcData.CUR_LOCK_COUNT = 0;
		pNpc.Delete();
	end
end

--khai khải bảo rương 
function tbFnsTreasureBox:OnCheckOpen(nPlayerId, nNpcId)
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
function tbFnsTreasureBox:OnDialog()
	
	local pNpc = KNpc.GetById(him.dwId);
	if (not pNpc or pNpc.nIndex == 0) then
		return;
	end

	local tbNpcData = him.GetTempTable("Task"); 
	--assert(tbNpcData.nOwnerPlayerId); đổi thành return zounan
	if not tbNpcData.nOwnerPlayerId then
		return;
	end
	
	local pOpener = KPlayer.GetPlayerObjById(tbNpcData.nOwnerPlayerId);
	--không tồn tại 
	if not pOpener then
		local szMsg ="ngươi bất năng khai khải người khác đích bảo rương ！"
		Dialog:SendInfoBoardMsg(me, szMsg);		
		return;
	end;
	
	local nTeamId = pOpener.nTeamId;
	--có hay không tổ đội 
	if (me.nTeamId == 0) then
		local szMsg ="chỉ có tổ đội tài năng khai khải bảo rương ！"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	--bảo rương có phải là hay không chỗ đội vân vân bảo rương 
	if (me.nTeamId ~= nTeamId) then
		local szMsg ="chỉ có <color=yellow>"..pOpener.szName.."<color>chỗ ở đội ngũ tài năng tiến khai khải thử bảo rương ！"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	--khoảng cách thời gian có hay không đáo 	
	local nRet = me.GetSkillState(self.TIRED_SKILLID);
	if (nRet ~= -1) then
		Dialog:SendInfoBoardMsg(me,"<color=red>ngươi quá mệt mỏi cần nghỉ ngơi một hồi tài năng tiếp theo khai khải bảo rương ！<color>");
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
	GeneralProcess:StartProcess("khai khải bảo rương", tbFnsTreasureBox.COST_TIME, {self.OnCheckOpen, self, me.nId, him.dwId}, {me.Msg,"khai khải bị đánh đoạn"}, tbEvent);
end
