--//擂台地图内 擂台侍卫对话脚本
-- //可以在比赛中 查看比赛号码
-- //或者离开赛场
local NPC_ZhangSan = Npc:GetClass("webjx_duobao_npc");

function NPC_ZhangSan:OnDialog()
	Dialog:Say(string.format("%s： Ngươi muốn tạm thời rời khỏi <color=yellow> đấu trường <color> không? Nếu ngươi muốn thì ta sẽ đưa ngươi ra!",him.szName), {
			{"Vâng, đưa tôi đi ra ngoài", self.yes, self},
			{"Kết thúc đối thoại"},
		});
end;

function NPC_ZhangSan:yes()
	local nMapId, nPosX, nPosY = him.GetWorldPos();
	if nMapId == DuoBao.MAP_INFO[1] then
		DuoBao.tbMission[1]:DropBox(me,0);
		DuoBao.tbMission[1]:KickPlayer(me);
	elseif nMapId == DuoBao.MAP_INFO[2] then
		DuoBao.tbMission[2]:DropBox(me,0);
		DuoBao.tbMission[2]:KickPlayer(me);	
	end
	--[[
	DuoBao.tbMission[1]:GSOpenGame();
	me.SetLogoutRV(0);
	local nW, nX, nY = me.GetTask(DuoBao.TSKG_DUOBAO, DuoBao.TSK_SIGNPOSWORLD),me.GetTask(DuoBao.TSKG_DUOBAO, DuoBao.TSK_SIGNPOSX),me.GetTask(DuoBao.TSKG_DUOBAO, DuoBao.TSK_SIGNPOSY);
	if (nW ~= 0 and nX ~= 0 and nY ~= 0) then
		me.NewWorld(nW, nX, nY);
	else
		me.NewWorld(23, 1450, 3153);
	end;
	]]
end;
