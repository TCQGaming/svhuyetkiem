-- 文件名　：qiancengtower_npc.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-05-27 19:30:15

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");

local tbSignNpc = Npc:GetClass("qiancengtower_sign_npc");

function tbSignNpc:OnDialog()
	QianCengTower:UpdateDaliyFreeCount(me);
	local szMsg = "Thiên Tầng Tháp chứa nhiều báu vật giá trị, mỗi Tầng Tháp là một độ khó khác nhau hãy cẩn thận.";
	local tbOpt = {
			{"Ta muốn thử thách Thiên Tầng Tháp", QianCengTower.OnApplyOpen, QianCengTower},
			{"Hãy đưa ta vào Tháp", QianCengTower.OnEnterTower, QianCengTower},
			{"Để ta suy nghĩ lại"},
		};
	
		
	Dialog:Say(szMsg, tbOpt);
	return 1;
end

local tbBoxNpc = Npc:GetClass("qiancengtower_box_npc");

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

tbBoxNpc.tbItem = {18,1,2106,1};

tbBoxNpc.tbId2Key = {
	[11589] = {18,1,2106,1},
	[11590] = {18,1,2107,1},
	[11591] = {18,1,2108,1},
	[11592] = {18,1,2109,1},
	[11593] = {18,1,2110,1},
	[11594] = {18,1,2111,1},
	[11595] = {18,1,2222,1},
	[11596] = {18,1,2223,1},
	[11597] = {18,1,2224,1},
	[11598] = {18,1,2225,1},
};

function tbBoxNpc:OnDialog()
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 0;
	end
	
	local tbKey = self.tbId2Key[him.nTemplateId];
	
	local nCount = me.GetItemCountInBags(unpack(tbKey));
	if (nCount <= 0) then
		local szItem = KItem.GetNameById(unpack(tbKey))
		me.Msg("Ngươi không có " .. szItem .. " không thể thao tác!");
		return 0;
	end
	
	GeneralProcess:StartProcess("Đang thao tác...", 5 * Env.GAME_FPS, {self.OnSureOpen,self, me.nId, him.dwId, tbKey},nil,tbEvent);
	return 1;
end

function tbBoxNpc:OnSureOpen(nPlayerId, nNpcId, tbKey)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return 0;
	end

	pPlayer.ConsumeItemInBags2(1, tbKey[1], tbKey[2], tbKey[3], tbKey[4]);
	local tbMission = pPlayer.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 0;
	end
	
	tbMission:OnProcessBox(pPlayer, nNpcId);
end

local tbYaoShang = Npc:GetClass("qiancengtower_medicine_npc");

function tbYaoShang:OnDialog()
	local szMsg = "Tại đây ta có nhiều loại thuốc chữa trị ngươi có muốn mua dùng thử?";
	local tbOpt = 
	{
	--	{"<color=yellow>Ta muốn mua thuốc<color>", self.OnBuyYaoBind, self},
	--	{"<color=yellow>Ta muốn mua thuốc<color>", self.OnBuyCaiBind, self},
		{"Ta muốn mua thuốc", self.OnBuyYao, self},
		{"Ta chưa cần"},
	};
	Dialog:Say(szMsg, tbOpt);	
end

-- 买药
function tbYaoShang:OnBuyYaoBind()
	me.OpenShop(14,7);
end

function tbYaoShang:OnBuyYao()
	me.OpenShop(14,1);
end

-- 买菜
function tbYaoShang:OnBuyCaiBind()
	me.OpenShop(21,7);
end

----- 奇遇boss
local tbAwardBoss = Npc:GetClass("qiancengtower_npc_awardboss");

-- 死亡事件
function tbAwardBoss:OnDeath(pNpcKiller)
	local nPlayerId = pNpcKiller.GetPlayer() and pNpcKiller.GetPlayer().nId or 0;
	local pPlayer = pNpcKiller.GetPlayer();
	if not pPlayer then
		return 1;
	end
	
	local tbMission = pPlayer.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		return 1;
	end
	
	tbMission:OnAwardBossDeath(him, pPlayer);
	return 1;
end;

----- 奇遇boss
local tbRandomBoss = Npc:GetClass("qiancengtower_npc_randomboss");

function tbRandomBoss:OnDialog()
	local nBossIndex = him.GetTempTable("QianCengTower").nRandomBossIndex or 1;
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	him.Delete();
	if (not tbMission) then
		return 1;
	end
	tbMission:RandomAwardBoss(nBossIndex);
	return 1;
end

-- 宝箱
local tbAwardBox = Npc:GetClass("qiancengtower_npc_awardbox");

function tbAwardBox:OnDialog()
	if (me.CountFreeBagCell() < 1) then
		me.Msg("Hành trang cần 1 ô trống!!!");
		return 0;
	end
	
	local nOpenDay = math.floor((GetTime() - KGblTask.SCGetDbTaskInt(DBTASD_SERVER_STARTTIME)) / (60 * 60 * 24));
	local tbAward = Lib._CalcAward:RandomAward(3, 4, 2, nValue, Lib:_GetXuanReduce(nOpenDay), {8, 2, 0});
	local nMaxMoney = XmasLottery2012:GetMaxMoney(tbAward);
	if nMaxMoney + me.GetBindMoney() > me.GetMaxCarryMoney() then
		Dialog:Say("Bạc trên người vượt quá giới hạn!");
		return 0;
	end
	XmasLottery2012:RandomAward(me, tbAward, 1, szItemName);	
end

-- 
local tbFinishNpc = Npc:GetClass("qiancengtower_npc_finish");

function tbFinishNpc:OnDialog()
	local szMsg = "Ngươi cần ta giúp gì???";
	
	local tbOpt = {};
	
	local nAward = QianCengTower:GetPlayerFinishAward(me);
	--if (nAward > 0) then
	--	tbOpt[#tbOpt + 1] = {"<color=yellow>Nhận thưởng<color>", QianCengTower.ShowPingJiaWindow, QianCengTower, me};
	--end
	
	tbOpt[#tbOpt + 1] = {"Đưa ta qua Tầng", QianCengTower.ApplyLeaveQianCengRoom, QianCengTower, me};
	tbOpt[#tbOpt + 1] = {"Kết thúc đối thoại"};
	
	Dialog:Say(szMsg, tbOpt);
	return 1;
end

	