-- 宋金马夫（车夫）脚本
Require("\\script\\mission\\battle\\rule\\rulebase.lua");

local tbNpc	= Npc:GetClass("Longtrutrunglap");
function tbNpc:OnDialog()
local nCmp = me.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);

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
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
	}
	 local tbOpt = {
				 GeneralProcess:StartProcess("Đang chiếm lĩnh", 15 * Env.GAME_FPS, {self.OnDialog4, self,nCmp,him.dwId}, nil, tbEvent);
	 };
end
function tbNpc:OnDialog4(nCmp,nNpcId)
	if nCmp ~= 1 and nCmp ~= 2 then
	return
	end 
	
	local pNpc = KNpc.GetById(nNpcId);
	local nMapId, nX, nY = pNpc.GetWorldPos();
	if not pNpc then
		return 0
	end
	ClearMapNpcWithName(nMapId,"Điêu Tượng Trung Lập");
	if nCmp == 1 then 
		local tbNpc	= Npc:GetClass("Longtruphetong");
		local pNpc2 = KNpc.Add2(7411,100,-1,nMapId, nX, nY);
		tbNpc:StartNpcTimer(pNpc2.dwId)
		KDialog.MsgToGlobal("<color=yellow><color=pink>Phe Tống<<color> đã chiếm Long Trụ Tống Kim <color=yellow>Người Kim mau mau chiếm lĩnh lại...<color>");
		KGblTask.SCSetDbTaskInt(DBTASD_TuongPheKim, 0);
		KGblTask.SCSetDbTaskInt(DBTASD_TuongPheTong, 1);
	elseif nCmp == 2 then 
		local tbNpc	= Npc:GetClass("Longtruphekim");
		local pNpc2 = KNpc.Add2(7412,100,-1,nMapId, nX, nY);
		tbNpc:StartNpcTimer(pNpc2.dwId)
				KGblTask.SCSetDbTaskInt(DBTASD_TuongPheKim, 1);
		KGblTask.SCSetDbTaskInt(DBTASD_TuongPheTong, 0);
		KDialog.MsgToGlobal("<color=yellow><color=pink>Phe Kim<<color> đã chiếm Long Trụ Tống Kim <color=yellow>Người Tống mau mau chiếm lĩnh lại...<color>");
	end
		-- local szMsg	= "Long Trụ đã xuất hiện,hãy mau mau chiếm lĩnh...";
	-- local tbPlayerList	= self.tbMission:GetPlayerList(nCmp);
	-- for _, pPlayer in pairs(tbPlayerList) do
		-- Dialog:SendInfoBoardMsg(pPlayer, szMsg);
	-- end

end