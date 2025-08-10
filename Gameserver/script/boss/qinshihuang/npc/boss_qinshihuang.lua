-------------------------------------------------------
---------Edit Script By : TCQGaming 
---------Date : 18/02/2023
-------------------------------------------------------

local tbQinshihuangBoss	= Npc:GetClass("boss_qinshihuang");
function tbQinshihuangBoss:OnDialog()
	me.Msg("mm");
end

function tbQinshihuangBoss:DeathLoseItem(tbLoseItem)
	
	local tbItem = tbLoseItem.Item;
	local szMsg ="<color=green>Tần Thủy Hoàng Chết: <color>\n";
	local tbList = {};
	
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
		szMsg = szMsg.."<color=yellow>".. szItemName.."-".. nCount.." Cái<color>\n";
	end
	
	self:BroadCast(szMsg);
end

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

function tbQinshihuangBoss:OnDeath(pNpcKiller)
	
	Boss.tbUniqueBossCallOut[him.nTemplateId] = nil;
	
	Boss.Qinshihuang:ClearPassNpc();
	Boss.Qinshihuang:ClearInfo();
	
	local pPlayer = pNpcKiller.GetPlayer();
		if not pPlayer then
		KDialog.MsgToGlobal("NGƯỜI KẾT LIỂU BOSS KHÔNG ĐỨNG TRONG MAP HOẶC RỜI KHỎI GAME, KHÔNG THỂ TRAO THƯỞNG CỨNG");
		return 0;
	end
		local ngaunhien = MathRandom(1,100)
		local nRandomHT = MathRandom(6,8)
		local nRandomHTB = MathRandom(1,3)
	-- me.AddStackItem(18,1,20400,1,nil,5);------Trứng Rồng
    -- me.AddStackItem(18,1,2024,1,nil,20);------Voucher Thần Long
    me.AddStackItem(18,1,1,7,nil,3);------Huyền Tinh 7
	me.AddStackItem(18,1,543,1,nil,10);-----Sách Kinh nghiệm đồng hành
	me.AddStackItem(18,1, 1875,1,nil,10);------Ruong TB Đồng hành
	me.AddStackItem(22,1,81,1,nil,1);------Hòa Thì Ngọc
		local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_KetLieu_TTH	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
			local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được phần thưởng thêm<color=yellow> : \nRương Ngọc Vỡ Cấp 1 "..nSoLuongRuongDa.." Rương");
			KDialog.MsgToGlobal(szThongBaoTheGioi);	
		end 
	if ngaunhien < 50 then 
	    me.AddStackItem(18,1,1,nRandomHT,nil,1);------HT random 678
	local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được phần thưởng thêm<color=yellow> : \nHuyền Tinh cấp "..nRandomHT.." - 1 Viên");
	KDialog.MsgToGlobal(szThongBaoTheGioi);	
		elseif ngaunhien < 70 then
		me.AddStackItem(22,1,81,1,nil,nRandomHTB);-------Hòa Thì Ngọc
	local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được phần thưởng thêm<color=yellow> : Hòa Thị Ngọc "..nRandomHTB.." Cái ");
	KDialog.MsgToGlobal(szThongBaoTheGioi);	
		else
	end

	-- նݓξλ
	local nTeamId = pPlayer.nTeamId;
	if nTeamId == 0 then
		pPlayer.AddKinReputeEntry(5,"boss_qinshihuang");
	else
		local tbPlayerId, nMemberCount = KTeam.GetTeamMemberList(nTeamId);
		for i, nPlayerId in pairs(tbPlayerId) do
			local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pTeamPlayer and pTeamPlayer.nMapId == him.nMapId) then
				pTeamPlayer.AddKinReputeEntry(5,"boss_qinshihuang");
			end
		end
	end
	
	-- Ƶր٫٦
	local szMsg ="Hảo hữu của bạn ["..pPlayer.szName.."] đánh bại"..him.szName.."c";
	pPlayer.SendMsgToFriend(szMsg);
	Player:SendMsgToKinOrTong(pPlayer,"đánh bại"..him.szName.."c", 0);
	local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được: <color=yellow>\nHuyền Tinh Cấp 7 - 3 Viên\nSách Kinh Nghiệm Đồng Hành - 10 Quyển\nRương Trang Bị Đồng Hành - 10 Rương\nHòa Thị Ngọc - 1 Viên");
	KDialog.MsgToGlobal(szThongBaoTheGioi);	
	-- self:BroadCast(szMsg);
	
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

			local szMsg ="Đang đánh tạm nghĩ, Người đâu dân mỹ nữ ra tiếp khách";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng Say:"..szMsg);
						
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(2450, 120, -1, 1540, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 1, pNpc.GetDamageTable());
		
			-- նݓ4ٶҸíͰ
			KNpc.Add2(2439, 120, -1, 1540, 1820, 3266);
			KNpc.Add2(2439, 120, -1, 1540, 1835, 3282);
			KNpc.Add2(2439, 120, -1, 1540, 1804, 3282);
			KNpc.Add2(2439, 120, -1, 1540, 1820, 3297);
			
			-- նݓ}ٶԫ̍npc
			local pNpc1 = KNpc.Add2(2456, 120, -1, 1539, 1609, 3899);
			local pNpc2 = KNpc.Add2(2457, 120, -1, 1539, 1985, 3532);
			
			Boss.Qinshihuang.tbBoss.nPassId1 = pNpc1.dwId;
			Boss.Qinshihuang.tbBoss.nPassId2 = pNpc2.dwId;
			
			pNpc.Delete();
		end
		
	elseif nLifePercent == 50 then
		
		if Boss.Qinshihuang:GetBossStep() == 1 then

			local szMsg ="Đang đánh tạm nghĩ, Người đâu dân mỹ nữ ra tiếp khách =.=";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng nói:"..szMsg);
						
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(2450, 120, -1, 1540, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 2, pNpc.GetDamageTable());
			
			-- նݓ4ٶ֐ܪʦ
			KNpc.Add2(2440, 120, -1, 1540, 1820, 3266);
			KNpc.Add2(2440, 120, -1, 1540, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 1540, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 1540, 1820, 3297);
			
			pNpc.Delete();
		end
		
	elseif nLifePercent == 20 then
		
		if Boss.Qinshihuang:GetBossStep() == 2 then
			
			local szMsg ="Tạm Nghĩ";
			pNpc.SendChat(szMsg);
			Boss.Qinshihuang:Broadcast("Tần Thủy Hoàng nói:"..szMsg);
			
			-- նݓה۰Npc
			local pTempNpc = KNpc.Add2(2450, 120, -1, 1540, 1820, 3282);
			
			-- ݇¼һЩ״̬
			Boss.Qinshihuang:OnProtectBoss(pTempNpc.dwId, 3, pNpc.GetDamageTable());
			
			-- նݓ2ٶҸíͰì2ٶ֐ܪʦ
			KNpc.Add2(2439, 120, -1, 1540, 1820, 3266);
			KNpc.Add2(2439, 120, -1, 1540, 1835, 3282);
			KNpc.Add2(2440, 120, -1, 1540, 1804, 3282);
			KNpc.Add2(2440, 120, -1, 1540, 1820, 3297);
				
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
		local ngaunhien = MathRandom(1,100)
		local nRandomHT = MathRandom(6,8)
		local nRandomHTB = MathRandom(1,3)
		local nRandomHT4SL = MathRandom(1,4)
		local nRandomHT5SL = MathRandom(1,2)
		local nRandomHT6SL = MathRandom(1,2)
	-- me.AddStackItem(18,1,20400,1,nil,5);------Trứng Rồng
    me.AddStackItem(18,1,114,4,nil,nRandomHT4SL);------Huyền Tinh 4
    me.AddStackItem(18,1,114,5,nil,nRandomHT5SL);------Huyền Tinh 4
    -- me.AddStackItem(18,1,114,6,nil,nRandomHT6SL);------Huyền Tinh 4
	if ngaunhien < 50 then 
    me.AddStackItem(18,1,114,5,nil,1);------Huyền Tinh 4
	-- local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được phần thưởng thêm<color=yellow> : \nHuyền Tinh cấp "..nRandomHT.." - 1 Viên");
	-- KDialog.MsgToGlobal(szThongBaoTheGioi);	
		elseif ngaunhien < 70 then
    me.AddStackItem(18,1,114,5,nil,1);------Huyền Tinh 4
	-- local szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Trong lăng mộ Kết Liễu Tần Thủy Hoàng nhận được phần thưởng thêm<color=yellow> : Hòa Thị Ngọc "..nRandomHTB.." Cái ");
	-- KDialog.MsgToGlobal(szThongBaoTheGioi);	
		else
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
	Player:SendMsgToKinOrTong(pPlayer,"Người chơi"..him.szName.."đánh bại", 0);
	self:BroadCast(string.format("<color=green>%s<color>Tổ đội chiến thắng Tần Thủy Hoàng là %s", pPlayer.szName, him.szName));
	
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
