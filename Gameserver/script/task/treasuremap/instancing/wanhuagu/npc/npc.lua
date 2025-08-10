
-- ====================== 文件信息 ======================

-- 萬花谷副本 NPC 腳本
-- Edited by peres
-- 2008/11/09 PM 16:53

-- 她的眼淚輕輕地掉落下來
-- 撫摸著自己的肩頭，寂寥的眼神
-- 是，褪掉繁華和名利帶給的空洞安慰，她隻是一個一無所有的女子
-- 不愛任何人，亦不相信有人會愛她

-- ======================================================

Require("\\script\\task\\treasuremap\\instancing\\wanhuagu\\main.lua");

local tbNpc_Captain			= Npc:GetClass("wanhuagu_captain");
local tbNpc_Boss_1			= Npc:GetClass("wanhuagu_boss_1");
local tbNpc_TaoZi_Fight_1	= Npc:GetClass("wanhuagu_taozi_fight_1");
local tbNpc_TaoZi_Fight_Npc	= Npc:GetClass("wanhuagu_taozi_npc");
local tbNpc_TaoZi_Fight_2	= Npc:GetClass("wanhuagu_taozi_fight_2");
local tbNpc_QingQing_Fight	= Npc:GetClass("wanhuagu_qingqing_fight");
local tbNpc_QingQing_Npc	= Npc:GetClass("wanhuagu_qingqing_npc");
local tbNpc_Boss_2			= Npc:GetClass("wanhuagu_boss_2");
local tbNpc_Boss_3			= Npc:GetClass("wanhuagu_boss_3");
local tbNpc_Boss_Male_4		= Npc:GetClass("wanhuagu_boss_male_4");
local tbNpc_Boss_Female_4	= Npc:GetClass("wanhuagu_boss_female_4");
local tbNpc_Boss_5			= Npc:GetClass("wanhuagu_boss_5");
local tbNpc_Boss_6			= Npc:GetClass("wanhuagu_boss_6");
local tbNpc_Soldier			= Npc:GetClass("wanhuagu_soldier");
local tbNpc_BlackBear		= Npc:GetClass("wanhuagu_blackbear");
local tbNpc_Oryx			= Npc:GetClass("wanhuagu_oryx");
local tbNpc_Leopard			= Npc:GetClass("wanhuagu_leopard");
local tbNpc_Boss_6_Npc		= Npc:GetClass("wanhuagu_boss_6_npc");
local tbNpc_Boss_6_Fight	= Npc:GetClass("wanhuagu_boss_6_fight");

local tbNpc_Door			= Npc:GetClass("wanhuagu_door_1");
local tbNpc_Aster			= Npc:GetClass("wanhuagu_aster");
local tbNpc_Bag				= Npc:GetClass("wanhuagu_bag_1");
local tbNpc_Bag_2			= Npc:GetClass("wanhuagu_bag_2");

local tbNpc_TalkNpc_1		= Npc:GetClass("wanhuagu_talk_npc_1");		-- 牧童
local tbNpc_TalkNpc_2		= Npc:GetClass("wanhuagu_talk_npc_2");		-- 綿羊

local tbNpc_TalkNpc_3		= Npc:GetClass("wanhuagu_talk_npc_3");		-- 船夫
local tbNpc_Boss_3_talk		= Npc:GetClass("wanhuagu_boss_3_talk");		-- 藥劑師對話

local tbNpc_Box				= Npc:GetClass("wanhuagu_box");				-- 箱子
local tbNpc_TaoZi_Talk_2	= Npc:GetClass("wanhuagu_taozi_npc_2");		-- 陶子對話2

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


-- 殺死鐵莫西
function tbNpc_Captain:OnDeath(pNpc)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nCaptainFight = 1;
end;

-- 陶子對話
function tbNpc_TaoZi_Fight_Npc:OnDialog()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	if tbInstancing.nTaoZiEscort == 0 then
		local szTalk	= [[<color=red><npc=2762><color>：Hãy hộ tống tớ<end>
							<color=red><npc=2762><color>：Ahihi đồ ngốc。<end>
							<color=red><npc=2762><color>：Nếu không có cậu, có lẽ tớ đã...<end>
							<color=red><npc=2762><color>：Vui lòng! Để không phá hủy vùng đất thuần khiết này, hãy giải cứu chị Thanh Thanh khỏi tay họ!]];
							
		TaskAct:Talk(szTalk, self.TalkEnd, self, him.dwId, me.nId);
	
	end;
end;


function tbNpc_TaoZi_Fight_Npc:TalkEnd(nNpcId, nPlayerId)
	local pPlayer	= KPlayer.GetPlayerObjById(nPlayerId)
	local pNpc		= KNpc.GetById(nNpcId);
	
	if not pPlayer or not pNpc then return 1; end;
	
	local nMapId, nMapX, nMapY	= pNpc.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	if tbInstancing.nTaoZiEscort == 1 then
		return 1;
	end;
	
	if pPlayer and pNpc then
		pNpc.Delete();
		tbInstancing.pTaoZi_Fight_2 = tbInstancing:AddSeekNpc(2763, 50, 1598, 3177, tbInstancing.tbTaoZiSeekPos, 0, pPlayer, 1, self);		
		if tbInstancing.pTaoZi_Fight_2 then
			tbInstancing.dwTaoZi_Fight_2 = tbInstancing.pTaoZi_Fight_2.dwId;
		end;
		tbInstancing.nTaoZiEscort = 1;
	end;
end;


function tbNpc_TaoZi_Fight_Npc:OnArrive(pFightNpc, pPlayer)
	-- print ("tbNpc_TaoZi_Fight_Npc:OnArrive");
	local nMapId, nMapX, nMapY	= pFightNpc.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nTaoZiEscort = 2;
	pFightNpc.SendChat("Xem kìa ! có một toán quan binh đến !");
	
end;

function tbNpc_TaoZi_Fight_1:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nTaoZi_Death	= 1;
	tbInstancing.nDoorOpen		= 1;
	
	-- 刪掉大門
	local pNpcDoor = KNpc.GetById(tbInstancing.dwIdDoor);
	if pNpcDoor then pNpcDoor.Delete(); end;	
end;

function tbNpc_TaoZi_Fight_2:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nTaoZi_Death	= 1;
	tbInstancing.nDoorOpen		= 1;
	
	-- 刪掉大門
	local pNpcDoor = KNpc.GetById(tbInstancing.dwIdDoor);
	if pNpcDoor then pNpcDoor.Delete(); end;
		
end;


function tbNpc_Soldier:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nSoldierFight = tbInstancing.nSoldierFight + 1;
	
	-- print ("tbInstancing.nSoldierFight：", tbInstancing.nSoldierFight);
end;


function tbNpc_Boss_1:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	local pQingQing_Fight_1 = KNpc.GetById(tbInstancing.dwQingQing_F_1);
	if pQingQing_Fight_1 then
		pQingQing_Fight_1.Delete();
	end;
	
	if tbInstancing.nTaoZi_Death == 0 then
		local pTaoZi_Fight_2 = KNpc.GetById(tbInstancing.dwTaoZi_Fight_2);
		pTaoZi_Fight_2.Delete();
		
		-- 加對話 NPC
		tbInstancing:AddNpc(tbInstancing.tbNpcPos[6], nMapId);
		tbInstancing:AddNpc(tbInstancing.tbNpcPos[7], nMapId);
		
		-- 加袋子
		tbInstancing:AddNpc(tbInstancing.tbObjPos[6], nMapId);
		
		tbInstancing.nBoss_1	= 1;
	end;
	
end;


function tbNpc_Boss_2:OnDeath(pNpc)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	tbInstancing:AddNpc(tbInstancing.tbObjPos[9], nMapId);
end;

function tbNpc_Boss_2:OnLifePercentReduceHere(nLifePercent)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	if nLifePercent == 50 and tbInstancing.tbBossLifePoint[2] == 0 then
		-- 在這裡生產可重生的熊
		for i=14, 16 do
			KNpc.Add2(tbInstancing.tbNpcPos[i][1],
						tbInstancing.tbNpcPos[i][2],
						-1,
						nMapId,
						tbInstancing.tbNpcPos[i][4],
						tbInstancing.tbNpcPos[i][5],
						1,
						0,
						1);
		end;
		tbInstancing.tbBossLifePoint[2] = 1;
		him.SendChat("Xuất chiến, mãnh thú của ta !");
	end;
end;


function tbNpc_Boss_3:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	tbInstancing.nBoss_3	= 1;
	
	-- 刪除障礙物
	for i=1, #tbInstancing.tb_dwIdAster do
		local pNpc	= KNpc.GetById(tbInstancing.tb_dwIdAster[i]);
		if pNpc then
			pNpc.Delete();
		end;
	end;
	
	-- 變成非戰斗狀態
	tbInstancing:AddNpc(tbInstancing.tbNpcPos[13], nMapId);	
end;


-- 擊敗柳生時出現袋子
function tbNpc_Boss_Male_4:OnDeath()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);	
	tbInstancing:AddNpc(tbInstancing.tbObjPos[7], nMapId);
	
	tbInstancing.nBoss_4	= 1;
end;

-- 柳生 60% 血量時賈茹出現
function tbNpc_Boss_Male_4:OnLifePercentReduceHere(nLifePercent)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	if nLifePercent == 60 and tbInstancing.tbBossLifePoint[4] == 0 then
		tbInstancing:AddNpc(tbInstancing.tbBossPos[5], nMapId);
		tbInstancing.tbBossLifePoint[4] = 1;
		him.SendChat("Cổ Như, ta bị thương rất nặng...");
	end;
	
end;	


function tbNpc_Boss_5:OnDeath(pNpc)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	tbInstancing:AddNpc(tbInstancing.tbObjPos[10], nMapId);
end;

function tbNpc_Boss_6:OnDeath(pNpc)
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);	
	
	-- 加船夫
	tbInstancing:AddNpc(tbInstancing.tbNpcPos[12], nMapId);
	
	local pPlayer = pNpc.GetPlayer();
	if (pPlayer) then
--		pPlayer.DropRateItem(TreasureMap.tbDrop_Level_3["Npc_Boss2"], 28, -1, -1, him);
		TreasureMap:AwardWeiWangAndXinde(pPlayer, 2, 5, 1, 100000);
		
		-- 副本任務的處理
		local tbTeamMembers, nMemberCount	= pPlayer.GetTeamMemberList();
		
		-- 師徒成就：副本萬花谷
		TreasureMap:GetAchievement(tbTeamMembers, Achievement.FUBEN_WANHUA, pPlayer.nMapId);
		
		if (not tbTeamMembers) or (nMemberCount <= 0) then
			TreasureMap:InstancingTask(pPlayer, tbInstancing.nMapTemplateId);
			return;
		else
			for i=1, nMemberCount do
				local pNowPlayer	= tbTeamMembers[i];
				TreasureMap:InstancingTask(pNowPlayer, tbInstancing.nMapTemplateId);
			end
		end
		
		-- 用於老玩家召回任務完成任務記錄
		local tbMemberList = pPlayer.GetTeamMemberList();	
		for _, player in ipairs(tbMemberList) do 
			Task.OldPlayerTask:AddPlayerTaskValue(player.nId, 2082, 5);
		end;
	end;
	
	-- 加箱子
	for i=11, 13 do
		tbInstancing:AddNpc(tbInstancing.tbObjPos[i], nMapId);
	end;
	
	KStatLog.ModifyAdd("mixstat", "Giết Boss thông quan", "Tổng", 1);
	
end;


function tbNpc_Door:OnDialog()
	local nMapId, nMapX, nMapY	= him.GetWorldPos();
	local tbInstancing = TreasureMap:GetInstancing(nMapId);
	
	local nKeys		= me.GetItemCountInBags(18,1,246,1);
	
	if nKeys > 0 then
		GeneralProcess:StartProcess("Đang mở...", 10 * 18, {self.OnOpened, self, me.nId, him.dwId}, {me.Msg, "Mở gián đoạn"}, tbEvent);
	end;
	
end;

-- 用鑰匙打開大門
function tbNpc_Door:OnOpened(nPlayerId, dwNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;

	local pNpc = KNpc.GetById(dwNpcId);
	if (pNpc and pNpc.nIndex > 0) then
		local nMapId, nMapX, nMapY	= pNpc.GetWorldPos();
		local tbInstancing = TreasureMap:GetInstancing(nMapId);
		tbInstancing.nDoorOpen = 1;
		me.ConsumeItemInBags(1, 18, 1, 246, 1);
		pNpc.Delete();
	end;
end;

function tbNpc_Aster:OnDialog()
	return;
end;


-- 打開袋子拿到鑰匙
function tbNpc_Bag:OnDialog()
	
	local nFreeCell = me.CountFreeBagCell();
	if nFreeCell < 2 then
		Dialog:SendInfoBoardMsg(me, "Hành trang không đủ chổ trống, cần <color=yellow> 2 ô mới có thể tiếp tục<color>");
		return;
	end;
	
	-- TODO:liucahng 10寫到head中去
	GeneralProcess:StartProcess("Đang mở...", 10 * 18, {self.OnOpened, self, me.nId, him.dwId}, {me.Msg, "Mở gián đoạn"}, tbEvent);

end;

function tbNpc_Bag:OnOpened(nPlayerId, dwNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;

	local pNpc = KNpc.GetById(dwNpcId);
	if (pNpc and pNpc.nIndex > 0) then
		
		local nMapId, nMapX, nMapY	= pNpc.GetWorldPos();
		local tbInstancing = TreasureMap:GetInstancing(nMapId);	
		
		if tbInstancing.nBoss_1 == 1 and tbInstancing.nBoss_3 == 0 then
			pPlayer.AddItem(18, 1, 246, 1);
			pPlayer.Msg("<color=yellow>Ngươi nhận được 1 chìa khóa !<color>");	
			-- 通知附近的玩家
			TreasureMap:NotifyAroundPlayer(pPlayer, "<color=yellow>"..pPlayer.szName.."Đã được 1 chìa khóa !<color>");
		elseif tbInstancing.nBoss_3 == 1 then
			pPlayer.AddItem(18, 1, 249, 1);
			pPlayer.Msg("<color=yellow>Ngươi nhận được 1 lọ Nữ Nhi Hồng !<color>");	
			-- 通知附近的玩家
			TreasureMap:NotifyAroundPlayer(pPlayer, "<color=yellow>"..pPlayer.szName.."Đã được 1 lọ Nữ Nhi Hồng !<color>");		
		end;
		pNpc.Delete();
	end;
end;


function tbNpc_Bag_2:OnDialog()
	local nFreeCell = me.CountFreeBagCell();
	if nFreeCell < 2 then
		Dialog:SendInfoBoardMsg(me, "Hành trang không đủ chổ trống, cần <color=yellow> 2 ô trống để tiếp tục<color> !");
		return;
	end;
	
	-- TODO:liucahng 10寫到head中去
	GeneralProcess:StartProcess("Đang mở...", 10 * 18, {self.OnOpened, self, me.nId, him.dwId}, {me.Msg, "Mở gián đoạn"}, tbEvent);
end;

function tbNpc_Bag_2:OnOpened(nPlayerId, dwNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end;

	local pNpc = KNpc.GetById(dwNpcId);
	if (pNpc and pNpc.nIndex > 0) then
		pPlayer.AddItem(18, 1, 250, 1);
		pPlayer.Msg("<color=yellow>Bạn nhận được 1 cây Sáo<color>");	
		-- 通知附近的玩家
		TreasureMap:NotifyAroundPlayer(pPlayer, "<color=yellow>"..pPlayer.szName.." Nhận được 1 cây Sáo<color>");
		pNpc.Delete();	
	end;
end;


function tbNpc_TalkNpc_1:OnDialog()
	local szTalk	= [[<color=red><npc=2787><color>：Woooooo... Có hai con báo hung ác trong rừng đào trước mặt tôi, chúng đã giết cừu của tôi chỉ bằng một đòn! Tôi nghe chị Thanh Thanh nói rằng <color=orange> trong rừng có một cây sáo <color>, chỉ cần nó được thổi lên, những con thú này sẽ im lặng...<end>
						<color=red><npc=2787><color>：nhưng trừ khi bạn có thể<color=orange>lẻn qua<color>Đừng để những con thú đó nhìn thấy, hoặc đừng đến gần chúng! Chúng quá nguy hiểm!]];
						
	TaskAct:Talk(szTalk, Npc:GetClass("wanhuagu_talk_npc_1").TalkEnd, Npc:GetClass("wanhuagu_talk_npc_1"), him, me);
end;

function tbNpc_TalkNpc_1:TalkEnd(pNpc, pPlayer)
	Dialog:SendBlackBoardMsg(pPlayer, "Dùng Sáo Đồng để xoa dịu Báo Hoa");
end;

function tbNpc_TalkNpc_2:OnDialog()
	Dialog:Say("Beee.......");
end;

-- 船夫對話
function tbNpc_TalkNpc_3:OnDialog()
	local nTreasureId			= TreasureMap:GetMyInstancingTreasureId(me);
		if not nTreasureId or nTreasureId <= 0 then
			me.Msg("Lỗi đọc địa điểm, trở về địa điểm cũ.");
			return;
		end;
	local tbInfo				= TreasureMap:GetTreasureInfo(nTreasureId);
	local nMapId, nMapX, nMapY	= tbInfo.MapId, tbInfo.MapX, tbInfo.MapY;
	
	Dialog:Say(
		"Vị khách quan này, cần gì ? Ngươi đã đi du ngoạn hòn đảo này chưa ? Nếu muốn quay trở lại, Tiểu Lục sẽ đưa ngươi đi !",
		{"Vâng", self.SendOut, self, me, nMapId, nMapX, nMapY},
		{"Đóng lại"}
	);
end;

function tbNpc_TalkNpc_3:SendOut(pPlayer, nMapId, nMapX, nMapY)
	pPlayer.NewWorld(nMapId, nMapX, nMapY);
end;


-- 黃散一對話
function tbNpc_Boss_3_talk:OnDialog()
	Dialog:Say(
		"Được lắm, ngươi đã thắng. ",
		{"Ta muốn làm thuốc Ẩn Thân[Cần 10 mảnh Hùng Bì]", self.MakeIt, self, me},
		{"Đóng lại"}
	);	
	return;
end;


function tbNpc_Boss_3_talk:MakeIt(pPlayer)
	local nBearSkin		= pPlayer.GetItemCountInBags(18,1,247,1);
	if nBearSkin < 10 then
		Dialog:Say("Hả ? người mang không đủ<color=yellow> 10 da Gấu<color>, ngươi muốn lừa ta à ?");
		return;
	end;
	pPlayer.ConsumeItemInBags(10, 18, 1, 247, 1);
	pPlayer.AddItem(18,1,248,1);
	Dialog:Say("Được lắm, đây là thuốc Ẩn Thân, ngươi tùy ý sử dụng,<color=yellow> Tối đa duy trì 1 phút<color>。");
	return;
end;



function tbNpc_Box:OnDialog()
	GeneralProcess:StartProcess("Mở bảo rương", 10 * 18, {self.OpenTreasureBox, self, me.nId, him.dwId}, {me.Msg, "Mở gián đoạn"}, tbEvent);
end;

function tbNpc_Box:OpenTreasureBox(nPlayerId, dwNpcId)
	-- 爆物品
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pPlayer) then
		return;
	end
	local pNpc = KNpc.GetById(dwNpcId);
	if (pNpc and pNpc.nIndex > 0) then
		pPlayer.DropRateItem(TreasureMap.szInstancingBox_Level3, TreasureMap.nTreasureBoxDropCount, -1, -1, pNpc)
		pPlayer.Msg("<color=yellow>Mở hoàn tất !<color>")
		pNpc.Delete();
	end
end


function tbNpc_QingQing_Npc:OnDialog()
	local szTalk	= [[<color=red><npc=2765><color>：Cảm ơn bạn, một thung lũng yên tĩnh như vậy thực sự không thể chịu đựng được những kẻ man rợ đó. Suy cho cùng, tôi cũng là người phiêu bạt tứ xứ, tôi biết bình yên khó đến nhường nào.<end>
						<color=red><npc=2765><color>：Nhân tiện, đây là chìa khóa để vào Thung lũng vạn hoa, có một số người thú vị trong đó, nếu muốn, bạn có thể trao đổi ý kiến ​​​​với họ.]];
						
	TaskAct:Talk(szTalk, self.TalkEnd, self, him.dwId, me.nId);
end;

function tbNpc_QingQing_Npc:TalkEnd()
	return 1;
end;


function tbNpc_TaoZi_Talk_2:OnDialog()
	local szTalk	= [[<color=red><npc=2792><color>： Cảm ơn bạn đã xua đuổi những kẻ man rợ đó, đây là chìa khóa của Thung lũng vạn hoa cốc, nếu bạn muốn đến thăm những người kỳ lạ trong thung lũng đó, hãy lấy nó, tôi tin rằng bạn sẽ thích nó ở đây.<end>
						<color=red><npc=2792><color>：À, đúng rồi, ở sâu trong thung lũng có một tu sĩ nghiện rượu, quanh năm ít thấy. Nghe nói người này võ công cao thâm bất phàm, trong sơn cốc mọi người đều có chút kính nể, nếu may mắn gặp được hắn, nhất định phải cẩn thận trong lời nói và hành động, hắn thích cùng người khác học võ công. hầu hết. Tất nhiên, nếu bạn đánh bại anh ta, bạn sẽ được coi là bậc thầy ... haha.]];

						
	TaskAct:Talk(szTalk, self.TalkEnd, self, him.dwId, me.nId);
end;

function tbNpc_TaoZi_Talk_2:TalkEnd()
	return 1;
end;
