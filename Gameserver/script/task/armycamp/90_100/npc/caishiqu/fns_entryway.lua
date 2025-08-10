----------------------------------------
-- Phục Ngưu Sơn Trang cựu chỉ nhập khẩu 
-- ZhangDeheng
-- 2008/10/29 8:41
----------------------------------------

local tbFnsEntryWay = Npc:GetClass("fnsentryway");
tbFnsEntryWay.NEW_WORLD_POSX = 1567;
tbFnsEntryWay.NEW_WORLD_POSY = 3547;

function tbFnsEntryWay:OnDialog()
	local tbNpcData = him.GetTempTable("Task");
	assert(tbNpcData.nEntrancePlayerId);
	local pOpener = KPlayer.GetPlayerObjById(tbNpcData.nEntrancePlayerId);
	if (not pOpener) then
		return;
	end
	
	local nTeamId = pOpener.nTeamId;
	
	if (me.nTeamId == 0) then
		local szMsg ="chỉ có tổ đội tài năng tiến nhập ！"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	
	if (me.nTeamId ~= nTeamId) then
		local szMsg ="chỉ có <color=yellow>"..pOpener.szName.."<color>chỗ ở đội ngũ tài năng tiến nhập ！"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return;
	end
	
	local nEntryMapId = tbNpcData.nEntryMapId;

	Dialog:Say("có hay không bây giờ tiến nhập Phục Ngưu Sơn Trang cựu chỉ ？", 
		{"hảo", self.Enter, self, me, him.dwId, nEntryMapId},
		{"tạm thì không đi"})
end

function tbFnsEntryWay:Enter(pPlayer, nNpcId, nEntryMapId)
	pPlayer.NewWorld(nEntryMapId, self.NEW_WORLD_POSX, self.NEW_WORLD_POSY);
	pPlayer.SetFightState(1);
end


