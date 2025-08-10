-------------------------------------------------------
-- τݾĻaúvn_pve_boss_huoqilin_shadow.lua
-- Դݨ֟aúzhangjinpin@kingsoft
-- Դݨʱݤú2009-06-11 19:56:05
-- τݾĨ˶ú
-------------------------------------------------------

-- Ƥ׃τݾ("\\setting\\npc\npc.txt")

-- Șʼ܊boss
local tbQinshihuangBoss	= Npc:GetClass("vn_pve_boss_huoqilin_shadow");

-- ה۰˂ݾ
function tbQinshihuangBoss:OnDialog()
	me.Msg("mm");
end

-- ִäϯƷܘַ
function tbQinshihuangBoss:DeathLoseItem(tbLoseItem)
	
	local tbItem = tbLoseItem.Item;
	local szMsg ="<color=green>Các trang bị rơi ra: <color>\n";
	local tbList = {};
	
	-- ȥե
	for _, nItemId in pairs(tbItem or {}) do
		local pItem = KItem.GetObjById(nItemId);
		if pItem then
			local szName = pItem.szName;					
			if not tbList[szName] then
				tbList[szName] = 1;
			else
				tbList[szName] = tbList[szName] + 1;
			end
		end
	end
	
	for szItemName, nCount in pairs(tbList or {}) do
		szMsg = szMsg.."<color=yellow>".. szItemName.."-".. nCount.."cái<color>\n";
	end
	
	self:BroadCast(szMsg);
end

-- ڣҥٸΦݒ
function tbQinshihuangBoss:BroadCast(szMsg)		
	if Boss.Qinshihuang.tbPlayerList then
		for nPlayerId, tbPlayerMap in pairs(Boss.Qinshihuang.tbPlayerList) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.Msg(szMsg);
			end
		end
	end
end

-- ̀ζ˂ݾ
function tbQinshihuangBoss:OnDeath(pNpcKiller)
	
	-- ژݼ֮ԦúȥԽ֙۽ҭ
	Boss.tbUniqueBossCallOut[him.nTemplateId] = nil;
	
	-- ȥԾԫ̍NPCۍхϢ
	Boss.Qinshihuang:ClearPassNpc();
	Boss.Qinshihuang:ClearInfo();
	
	-- ֒սΦݒ
	local pPlayer = pNpcKiller.GetPlayer();
	
	-- ֒һս׵ܘ
	if not pPlayer then
		return 0;
	end
	
	-- նݓξλ
	local nTeamId = pPlayer.nTeamId;
	if nTeamId == 0 then
		pPlayer.AddKinReputeEntry(5,"vn_pve_boss_huoqilin_shadow");
	else
		local tbPlayerId, nMemberCount = KTeam.GetTeamMemberList(nTeamId);
		for i, nPlayerId in pairs(tbPlayerId) do
			local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pTeamPlayer and pTeamPlayer.nMapId == him.nMapId) then
				pTeamPlayer.AddKinReputeEntry(5,"vn_pve_boss_huoqilin_shadow");
			end
		end
	end
	
	-- Ƶր٫٦
	local szMsg ="Hảo hữu của bạn ["..pPlayer.szName.."] đánh bại"..him.szName.."c";
	pPlayer.SendMsgToFriend(szMsg);
	Player:SendMsgToKinOrTong(pPlayer,"đánh bại"..him.szName.."c", 0);
	
	local szMsg = string.format("Trong lăng mộ Tần Thủy Hoàng, Nhóm các chiến binh dũng cảm <color=green>%s<color> đã dành chiến thắng", pPlayer.szName);
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	self:BroadCast(szMsg);
	
	-- ډ؝ۍəԾ
	local nStockBaseCount = 1500;
	local nHonor = 20;

	--նݓݨʨ؊ްۍѯ׷bإӤbٶɋքډ؝
	Tong:AddStockBaseCount_GS1(pPlayer.nId, nStockBaseCount, 0.1, 0.5, 0.1, 0.1, 0.3);	
	
	-- ׮΢ݱxܘַ
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pPlayer);
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	
	-- דԑٲЭ
	local tbMember = pPlayer.GetTeamMemberList();
	if tbMember then
		for _, pMember in ipairs(tbMember) do
			-- Ѿɋք۰ӑޭݓڽ
			if pMember.nId ~= pPlayer.nId then		
				--նݓݨʨ؊ްۍѯ׷bإӤbٶɋքډ؝		
				Tong:AddStockBaseCount_GS1(pMember.nId, nStockBaseCount, 0.1, 0.5, 0.1, 0.1, 0.3);
				-- ׮΢ݱxܘַ
				local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pMember);
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
			end
		end
	end
	
	-- նݓإӤۍѯ׷ք¬ѤəԾ
	local nKinId, nMemberId = pPlayer.GetKinMember();	
	local pKin = KKin.GetKin(nKinId);
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	
	if pTong then
		-- նݓѯ׷ք¬ѤəԾ
		local nMasterId = Tong:GetMasterId(pPlayer.dwTongId);
		if nMasterId ~= 0 then	
			PlayerHonor:AddPlayerHonorById_GS(nMasterId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor);
		end
		-- նݓ؇ѯ׷إӤք¬ѤəԾ			
		local pKinItor = pTong.GetKinItor()
		local nKinInTongId = pKinItor.GetCurKinId();
		while (nKinInTongId> 0) do
			local pKinInTong = KKin.GetKin(nKinInTongId);
			local nCaptainId = Kin:GetPlayerIdByMemberId(nKinInTongId, pKinInTong.GetCaptain());
			if nMasterId ~= nCaptainId then
				PlayerHonor:AddPlayerHonorById_GS(nCaptainId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor/2);
			end
			nKinInTongId = pKinItor.NextKinId();
		end
		
	elseif pKin then
		-- նݓKhong co bangإӤք¬ѤəԾ
		local nCaptainId = Kin:GetPlayerIdByMemberId(nKinId, pKin.GetCaptain());
		PlayerHonor:AddPlayerHonorById_GS(nCaptainId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor/2);
	end

	local szTongName ="Khong co bang";
	local szBossName = him.szName;
	local szKillPlayerName = pPlayer.szName;
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	if pTong then
		szTongName = pTong.GetName();
	end
	Dbg:WriteLog("[BossDeath]", szBossName, szKillPlayerName, szTongName);
	
end;


-- Ѫԥע
function tbQinshihuangBoss:OnLifePercentReduceHere(nLifePercent)
	
	local pNpc = him;
	if nLifePercent == 80 then
		
		if Boss.Qinshihuang:GetBossStep() == 0 then

			local szMsg ="Quả nhân mệt rồi, Người đâu ra tiếp các vị khách cho ta";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng Say:"..szMsg);
						
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(20005, 120, -1, 88, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 1, pNpc.GetDamageTable());
		
			-- նݓ4ٶҸíͰ
			KNpc.Add2(2439, 120, -1, 88, 1825, 3266);
			KNpc.Add2(2439, 120, -1, 88, 1820, 3266);
			KNpc.Add2(2439, 120, -1, 88, 1835, 3282);
			KNpc.Add2(2439, 120, -1, 88, 1837, 3282);
			KNpc.Add2(2439, 120, -1, 88, 1804, 3282);
			KNpc.Add2(2439, 120, -1, 88, 1806, 3286);
			KNpc.Add2(2439, 120, -1, 88, 1820, 3297);
			KNpc.Add2(2439, 120, -1, 88, 1827, 3297);
			
			-- նݓ}ٶԫ̍npc
			local pNpc1 = KNpc.Add2(2456, 120, -1, 1539, 1609, 3899);
			local pNpc2 = KNpc.Add2(2457, 120, -1, 1539, 1985, 3532);
			
			Boss.Qinshihuang.tbBoss.nPassId1 = pNpc1.dwId;
			Boss.Qinshihuang.tbBoss.nPassId2 = pNpc2.dwId;
			
			pNpc.Delete();
		end
		
	elseif nLifePercent == 50 then
		
		if Boss.Qinshihuang:GetBossStep() == 1 then

			local szMsg ="Các ngươi cũng gớm mặt quá nhỉ, Để ta gọi GM ra trị các người =.=";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng nói:"..szMsg);
						
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(20005, 120, -1, 88, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 2, pNpc.GetDamageTable());
			
			-- նݓ4ٶ֐ܪʦ
			KNpc.Add2(2440, 120, -1, 88, 1820, 3266);
			KNpc.Add2(2440, 120, -1, 88, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1820, 3297);
			KNpc.Add2(2440, 120, -1, 88, 1820, 3266);
			KNpc.Add2(2440, 120, -1, 88, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1820, 3297);
			
			pNpc.Delete();
		end
		
	elseif nLifePercent == 20 then
		
		if Boss.Qinshihuang:GetBossStep() == 2 then
			
			local szMsg ="Đừng đánh nữa, không ta không rớt đồ cho mà nhặt đâu =.=";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng nói:"..szMsg);
			
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(20005, 120, -1, 88, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 3, pNpc.GetDamageTable());
			
			-- նݓ2ٶҸíͰì2ٶ֐ܪʦ
			KNpc.Add2(2439, 120, -1, 88, 1820, 3266);
			KNpc.Add2(2439, 120, -1, 88, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1820, 3297);
			KNpc.Add2(2439, 120, -1, 88, 1820, 3266);
			KNpc.Add2(2439, 120, -1, 88, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 88, 1820, 3297);
	
			pNpc.Delete();
		end
	end
end

-- Ҹíٸ
local tbBingmayong = Npc:GetClass("boss_bingmayong");
function tbBingmayong:OnDeath(pNpcKiller)
	Boss.Qinshihuang:AddDeathCount();
end
		
-- ֐ܪʦ
local tbZhaohunshi = Npc:GetClass("boss_zhaohunshi");
function tbZhaohunshi:OnDeath(pNpcKiller)
	Boss.Qinshihuang:AddDeathCount();
end

-- ޫӢ
local tbJingying = Npc:GetClass("boss_qinjingying");
function tbJingying:OnDeath(pNpcKiller)
	
	Boss.tbUniqueBossCallOut[him.nTemplateId] = nil;
	
	local pPlayer = pNpcKiller.GetPlayer();
	if not pPlayer then
		return 0;
	end
	
	-- ׮΢ݱxܘַ
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pPlayer);
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	
	-- דԑٲЭ
	local tbMember = pPlayer.GetTeamMemberList();
	if tbMember then
		for _, pMember in ipairs(tbMember) do
			if pMember.nId ~= pPlayer.nId then		
				local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pMember);
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
			end
		end
	end
end

-- Сboss
local tbSmallBoss = Npc:GetClass("boss_qinlingsmall");
function tbSmallBoss:OnDeath(pNpcKiller)
	
	Boss.tbUniqueBossCallOut[him.nTemplateId] = nil;
	
	local pPlayer = pNpcKiller.GetPlayer();
	if not pPlayer then
		return 0;
	end
	
	-- ׮΢ݱxܘַ
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pPlayer);
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	
	-- דԑٲЭ
	local tbMember = pPlayer.GetTeamMemberList();
	if tbMember then
		for _, pMember in ipairs(tbMember) do
			if pMember.nId ~= pPlayer.nId then		
				local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pMember);
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
			end
		end
	end
	
	pPlayer.SendMsgToFriend("Hảo hữu của bạn ["..pPlayer.szName.."] dũng cảm đánh bại"..him.szName.."c");
	Player:SendMsgToKinOrTong(pPlayer,"Người chơi"..him.szName.."。", 0);
	self:BroadCast(string.format("Tổ đội <color=green>%s<color> chiến thắng %s", pPlayer.szName, him.szName));
	
	local szTongName ="Khong co bang";
	local szBossName = him.szName;
	local szKillPlayerName = pPlayer.szName;
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	if pTong then
		szTongName = pTong.GetName();
	end
	Dbg:WriteLog("[BossDeath]", szBossName, szKillPlayerName, szTongName);
		
end

function tbSmallBoss:BroadCast(szMsg)		
	if Boss.Qinshihuang.tbPlayerList then
		for nPlayerId, tbPlayerMap in pairs(Boss.Qinshihuang.tbPlayerList) do
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.Msg(szMsg);
			end
		end
	end
end
