--联赛准备场官员
--孙多良
--2008.09.12

local tbNpc = Npc:GetClass("wlls_guanyuan4");

function tbNpc:OnDialog()
	local szMsg = "Cán bộ sân chuẩn bị: Trận đấu sắp bắt đầu, bạn có chắc chắn muốn rời sân chuẩn bị không?";
	local tbOpt = 
	{
		{"Ta chắc", self.LevelGame, self},
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:LevelGame(nFlag)
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		Dialog:Say("Bạn chưa có đội nào！");
		return 0;
	end
	
	local nInReadyMap = 0;
	for _,nReadyMapId in pairs(Wlls.MACTH_TO_MAP) do
		if nReadyMapId == me.nMapId then
			nInReadyMap = 1;
			break;
		end
	end
	
	if nInReadyMap == 0 then
		return 0;
	end
	if not nFlag then
		local tbOpt = {
			{"Ta chắc", self.LevelGame, self, 1},
			{"Không"},
		}
		Dialog:Say("Viên chức lĩnh vực chuẩn bị: Nếu bạn rời đi bây giờ, bạn có thể không tham gia được vòng thi này <color>. Bạn có chắc chắn muốn rời khỏi lĩnh vực chuẩn bị không?", tbOpt);
		return 0;
	end
	--local nEnterReadyId = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ATTEND);
	local nGameLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	Wlls:KickPlayer(me, "Bạn đã rời khỏi trường chuẩn bị", nGameLevel);
end
