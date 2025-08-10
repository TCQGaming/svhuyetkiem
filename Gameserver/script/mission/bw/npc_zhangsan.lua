--//擂台地图内 擂台侍卫对话脚本
-- //可以在比赛中 查看比赛号码
-- //或者离开赛场
local NPC_ZhangSan = Npc:GetClass("leitaishiwei");

function NPC_ZhangSan:OnDialog()
	local nMapId = me.GetMapId()
	Dialog:Say(string.format("%s：Bạn có đang tạm rời khỏi sàn đấu không？",him.szName), {
			{"Vâng, tôi sẽ ra ngoài một lát", self.yes, self},
			{"Tôi là Đội trưởng, tôi muốn biết số vào", "BiWu:OnShowKey", nMapId},
			{"Ta nhầm", "BiWu:OnCancel"},
		});
end;

function NPC_ZhangSan:yes()
	local nMapId = me.GetMapId();
	if(BiWu.tbMission and BiWu.tbMission[nMapId]) then
		BiWu.tbMission[nMapId]:KickPlayer(me);--Mission:KickMe(BiWu.MISSIONID);		--DelMSPlayer(self.MISSIONID, PlayerIndex);
	end;
	me.SetLogoutRV(0);
	local nW, nX, nY = me.GetTask(BiWu.TSKG_BIWU, BiWu.TSK_SIGNPOSWORLD),me.GetTask(BiWu.TSKG_BIWU, BiWu.TSK_SIGNPOSX),me.GetTask(BiWu.TSKG_BIWU, BiWu.TSK_SIGNPOSY);
	if (nW ~= 0 and nX ~= 0 and nY ~= 0) then
		me.NewWorld(nW, nX, nY);
	else
		me.NewWorld(7, 1521, 3280);
	end;
end;
