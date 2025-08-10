--准备场npc
--孙多良
--2008.12.29

local tbNpc = Npc:GetClass("esport_yanruoxue2");

function tbNpc:OnDialog()
	local szMsg = "Trận đấu sắp diễn ra, bạn đã sẵn sàng?\n";
	local tbOpt = {
		{"Rời khỏi trận đấu", self.OnLeave, self},
		{"Ta xem rồi"},
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:OnLeave()
	local nMapId, nPosX, nPosY = EPlatForm:GetLeaveMapPos();
	local tbMCfg = EPlatForm:GetMacthTypeCfg(EPlatForm:GetMacthType());
	if (not tbMCfg) then
		Dialog:Say("Các hoạt động bất thường, xin hãy để lại một cách nhanh chóng chuẩn bị lĩnh vực");
		me.NewWorld(nMapId, nPosX, nPosY);
		return 0;
	end

	local nNpcMapId = him.nMapId;
	local nReadyId = 0;
	for nId, nReadyMapId in pairs(tbMCfg.tbReadyMap) do
		if (nNpcMapId == nReadyMapId) then
			nReadyId = nId;
			break;
		end
	end
	
	if (nReadyId <= 0) then
		Dialog:Say("Các hoạt động bất thường, xin hãy để lại một cách nhanh chóng chuẩn bị lĩnh vực");
		me.NewWorld(nMapId, nPosX, nPosY);
		return 0;
	end
	
	if EPlatForm.ReadyTimerId > 0 then
		if Timer:GetRestTime(EPlatForm.ReadyTimerId) < EPlatForm.DEF_READY_TIME_ENTER then
			Dialog:Say("Trận đấu sắp bắt đầu, bạn không nên thoát ra.");
			return 0;
		end
	end
	if EPlatForm.ReadyTimerId <= 0 then
		Dialog:Say("Bạn đã sẵn sàng chiến đấu, bạn không nên thoát ra.")
		return 0;
	end
	me.TeamApplyLeave();			--离开队伍
	me.NewWorld(nMapId, nPosX, nPosY);
end

