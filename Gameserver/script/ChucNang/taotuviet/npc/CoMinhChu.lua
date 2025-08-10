-----script by iDoctor
-----date : 31/10/2017

local tbCoMinhChu = Npc:GetClass("cominhchuu");
function tbCoMinhChu:OnDialog()
DoScript("\\script\\ChucNang\\taotuviet\\npc\\CoMinhChu.lua");

local nCurTime = tonumber(GetLocalDate("%H%M"));
if nCurTime < 2015 or nCurTime > 2050 then
	me.Msg("Chỉ được phép đoạt cờ trong thời gian từ <color=yellow>20h15 đến 20h50<color>");
	return 0;
end

local nFaction = me.nFaction;
if nFaction <= 0 then
	Dialog:Say("Bạn chưa gia nhập môn phái, Không cho phép thực hiện thao tác này");
	return 0;
end
 local sIdMap = 0;
if me.nSeries == 1 then
	sIdMap = 2016;
elseif me.nSeries == 2 then
	sIdMap = 2017;
elseif me.nSeries == 3 then
	sIdMap = 2018;
elseif me.nSeries == 4 then
	sIdMap = 2019;
elseif me.nSeries == 5 then
	sIdMap = 2020;
end

local tbPlayer, nSoNguoi = KPlayer.GetMapPlayer(sIdMap);
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
	local sIdMap = 0;
	if pPlayer.nSeries == 1 then
	sIdMap = 1;
	elseif pPlayer.nSeries == 2 then
	sIdMap = 2;
	elseif pPlayer.nSeries == 3 then
	sIdMap = 3;
	elseif pPlayer.nSeries == 4 then
	sIdMap = 4;
	elseif pPlayer.nSeries == 5 then
	sIdMap = 5;
	end
	 pPlayer.AddTitle(70,1,sIdMap,1); -- danh hieu
local nCountt = pPlayer.GetTask(3140,28)
pPlayer.SetTask(3140,28, nCountt + 1);
local szMsg = "";
if pPlayer.nSeries == 1 then
	szMsg = "<color=yellow>Thiên Hạ Đệ Nhất Hệ Kim";
elseif pPlayer.nSeries == 2 then
	szMsg = "<color=green>Thiên Hạ Đệ Nhất Hệ Mộc";
elseif pPlayer.nSeries == 3 then
	szMsg = "<color=blue>Thiên Hạ Đệ Nhất Hệ Thủy";
elseif pPlayer.nSeries == 4 then
	szMsg = "<color=red>Thiên Hạ Đệ Nhất Hệ Hỏa";
elseif pPlayer.nSeries == 5 then
	szMsg = "<color=wheat>Thiên Hạ Đệ Nhất Hệ Thổ";
end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=pink><color=cyan>["..pPlayer.szName.."]<color>,Dồn Hết Khí Vào Đan Điền Rút Thành Công Cờ Vô Địch Hệ Phái<color>"..szMsg.."<color>"}); -- Thông Báo 
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=pink><color=cyan>["..pPlayer.szName.."]<color>,Vận Hết Nội Công Rút Thành Công Cờ Vô Địch Hệ Phái<color>"..szMsg.."<color>"); -- Thông Báo 
KDialog.MsgToGlobal("<color=pink><color=cyan>["..pPlayer.szName.."]<color>Vận Hết Nội Công Rút Thành Công Cờ Vô Địch Hệ Phái, <color>"..szMsg.."<color>"); -- Thông Báo 
pNpc.Delete();
local nCurTimer = tonumber(GetLocalDate("%H%M"));
if nCurTimer > 2029 then
			pPlayer.NewWorld(2021,1656,3269);
			pPlayer.nInBattleState	= 1;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
			pPlayer.SetFightState(1);
else 
pPlayer.NewWorld(2021,1656,3269);
pPlayer.nForbidChangePK	= 0;
return 0;
end
end 
