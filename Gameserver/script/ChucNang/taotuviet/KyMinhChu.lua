-----Dev TCQGaming
-----date : 15/09/2023

local tbCoMinhChu = Npc:GetClass("kyminhchu");
function tbCoMinhChu:OnDialog()
DoScript("\\script\\ChucNang\\taotuviet\\KyMinhChu.lua");
local nCurTime = tonumber(GetLocalDate("%H%M"));
if nCurTime < 2030 or nCurTime > 2050 then
	me.Msg("Chỉ được phép đoạt cờ trong thời gian từ <color=yellow>20h30 đến 20h50<color>");
	return 0;
end

local nFaction = me.nFaction;
if nFaction <= 0 then
	Dialog:Say("Bạn chưa gia nhập môn phái, Không cho phép thực hiện thao tác này");
	return 0;
end

local tbPlayer, nSoNguoi = KPlayer.GetMapPlayer(2021);
if nSoNguoi > 1 then
	me.Msg("<color=yellow>Số người trong bản đồ hiện tại là <color=cyan>"..nSoNguoi.."<color><enter>Yêu cầu chỉ còn <color=cyan>1<color> người trong bản đồ mới có thể đoạt cờ<color>");
	return 0;
end

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
    GeneralProcess:StartProcess("<color=blue>Đang đoạt cờ<color>", 30 * Env.GAME_FPS, {self.GetQuest, self, me.nId, him.dwId}, nil, tbEvent); -- 60s đoạt cờ

	 };
end
function tbCoMinhChu:GetQuest(nPlayerId, nNpcId)
local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
if (not pPlayer) then
    return;
end    
-------

local pNpc = KNpc.GetById(nNpcId);
if (not pNpc) then
return;
end
pPlayer.AddTitle(74,1,1,1);-- danh hieu võ lâm minh chủ
local nCountt = pPlayer.GetTask(3140,32)
pPlayer.SetTask(3140,32, nCountt + 1);

GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=green><color=cyan>["..pPlayer.szName.."]<color> đoạt thành công chiến kỳ chính thức trở thành Võ Lâm Minh Chủ của tuần<color>"}); -- Thông Báo 
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=green><color=cyan>["..pPlayer.szName.."]<color> đoạt thành công chiến kỳ chính thức trở thành Võ Lâm Minh Chủ của tuần<color>"); -- Thông Báo 
KDialog.MsgToGlobal("<color=green><color=cyan>["..pPlayer.szName.."]<color> đoạt thành công chiến kỳ chính thức trở thành Võ Lâm Minh Chủ của tuần<color>"); -- Thông Báo 

-- pNpc.Delete();
pPlayer.NewWorld(24,1749,3495);
pPlayer.nForbidChangePK	= 0;			
PKVLMC:AddMoveHSLK_GS()					 							
return 0;
end
