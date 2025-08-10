
local tbQinshihuangBoss	= Npc:GetClass("boss_45_new_tcqgaming");
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

-- 死亡事件
function tbQinshihuangBoss:OnDeath(pNpcKiller)
	
	-- 关键之处：清除召唤表
	Boss.tbUniqueBossCallOut[him.nTemplateId] = nil;
	
	-- 清楚传送NPC和信息
	Boss.Qinshihuang:ClearPassNpc();
	Boss.Qinshihuang:ClearInfo();

	local pPlayer = pNpcKiller.GetPlayer();
	
	-- 找不到返回
	if not pPlayer then
		return 0;
	end

	-- 增加威望
	local nTeamId = pPlayer.nTeamId;
	if nTeamId == 0 then
		pPlayer.AddKinReputeEntry(5, "boss_45_new_tcqgaming");
	else
		local tbPlayerId, nMemberCount = KTeam.GetTeamMemberList(nTeamId);
		for i, nPlayerId in pairs(tbPlayerId) do
			local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if (pTeamPlayer and pTeamPlayer.nMapId == him.nMapId) then
				pTeamPlayer.AddKinReputeEntry(5, "boss_45_new_tcqgaming");
			end
		end
	end
	
	-- 频道公告
	local szMsg = "Hảo hữu của bạn ["..pPlayer.szName.."] đánh bại "..him.szName..".";
	pPlayer.SendMsgToFriend(szMsg);
	Player:SendMsgToKinOrTong(pPlayer, " đánh bại "..him.szName..".", 0);
	
		local nMapId,nX,nY = me.GetWorldPos();

		local szMsg = "Hảo hữu của bạn ["..pPlayer.szName.."] đã đánh bại võ lâm cao thủ "..him.szName.."。";
		pPlayer.SendMsgToFriend(szMsg);
		Player:SendMsgToKinOrTong(pPlayer, " đã đánh bại võ lâm cao thủ "..him.szName.."。", 0);
	local nMapId,nX,nY = me.GetWorldPos();
	local szThongBaoTheGioi1 = string.format("Tổ đội của <color=green>%s<color> Kết Liễu Boss Võ Lâm Cao Thủ<color><color=yellow> "..him.szName.."", pPlayer.szName);
	KDialog.MsgToGlobal(szThongBaoTheGioi1);	
	
		local nNpcMapId, nNpcPosX, nNpcPosY = him.GetWorldPos();
		local ngaunhiensaochientich = MathRandom(1,2)
		local ngaunhiensoluong = MathRandom(1,5)
				local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	local nCoDuaTOP = ConfigAll.KhoiDong_VatPham_DuaTOP_TongKim
	local VatPham_DuaTOP = ConfigAll.VatPham_DuaTOP
	
	--==========Thưởng boss VLCT ==========
			pPlayer.AddStackItem(18,1,1338,2,nil,10);-- Tiểu Kim Nguyên Bảo
			-- pPlayer.AddStackItem(18,1,215,1,nil,1);-- thẻ hắc thiết liên đấu
			pPlayer.SetTask(3028,1,pPlayer.GetTask(3028,1) + 10)
			pPlayer.AddStackItem(18,1,2028,7,nil,ngaunhiensaochientich)-- sao chiến tích 
		local	szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Kết Liễu Boss Võ Lâm Cao Thủ<color=yellow> "..him.szName.." <color>nhận được: <color=yellow>\n10k Mốc Tích Nạp Thẻ\n10 Kim Nguyên Bảo\n"..ngaunhiensaochientich.." Sao chiến tích");
		-- local	szThongBaoTheGioi = string.format("Người chơi <color=green>"..pPlayer.szName.."<color>Kết Liễu Boss Võ Lâm Cao Thủ<color=yellow> "..him.szName.." <color>nhận được: <color=yellow>\n10k Mốc Tích Nạp Thẻ\n5 Kim Nguyên Bảo\n2 Lệnh bài hắc thiết liên đấu\n"..ngaunhiensaochientich.." Sao chiến tích");
						KDialog.MsgToGlobal(szThongBaoTheGioi);	
		--================================
					local nTongBossGiet = pPlayer.GetTask(9176,1)
						pPlayer.AddTitle(20,1,1,1); -- danh hieu
						pPlayer.SetTask(9176,1,nTongBossGiet + 1); -- danh hieu


	-- 股份和荣誉
	local nStockBaseCount = 1500;
	local nHonor = 20;

	--增加建设资金和帮主、族长、个人的股份
	Tong:AddStockBaseCount_GS1(pPlayer.nId, nStockBaseCount, 0.1, 0.5, 0.1, 0.1, 0.3);	
	
	-- 额外奖励回调
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pPlayer);
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	
	-- 队友共享
	local tbMember = pPlayer.GetTeamMemberList();
	if tbMember then
		for _, pMember in ipairs(tbMember) do
			-- 本人的话已经加过了
			if pMember.nId ~= pPlayer.nId then		
				--增加建设资金和帮主、族长、个人的股份		
				Tong:AddStockBaseCount_GS1(pMember.nId, nStockBaseCount, 0.1, 0.5, 0.1, 0.1, 0.3);
				-- 额外奖励回调
				local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("QinlingBoss", pMember);
				SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
			end
		end
	end
	
	-- 增加族长和帮主的领袖荣誉
	local nKinId , nMemberId = pPlayer.GetKinMember();	
	local pKin = KKin.GetKin(nKinId);
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	
	if pTong then
		-- 增加帮主的领袖荣誉
		local nMasterId = Tong:GetMasterId(pPlayer.dwTongId);
		if nMasterId ~= 0 then	
			PlayerHonor:AddPlayerHonorById_GS(nMasterId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor);
		end
		-- 增加非帮主族长的领袖荣誉			
		local pKinItor = pTong.GetKinItor()
		local nKinInTongId = pKinItor.GetCurKinId();
		while (nKinInTongId > 0) do
			local pKinInTong = KKin.GetKin(nKinInTongId);
			local nCaptainId = Kin:GetPlayerIdByMemberId(nKinInTongId, pKinInTong.GetCaptain());
			if nMasterId ~= nCaptainId then
				PlayerHonor:AddPlayerHonorById_GS(nCaptainId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor/2);
			end
			nKinInTongId = pKinItor.NextKinId();
		end
		
	elseif pKin then
		-- 增加Không bang hội族长的领袖荣誉
		local nCaptainId = Kin:GetPlayerIdByMemberId(nKinId, pKin.GetCaptain());
		PlayerHonor:AddPlayerHonorById_GS(nCaptainId, PlayerHonor.HONOR_CLASS_LINGXIU, 0, nHonor/2);
	end

	local szTongName = "Không bang hội";
	local szBossName = him.szName;
	local szKillPlayerName = pPlayer.szName;
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	if pTong then
		szTongName = pTong.GetName();
	end
	Dbg:WriteLog("[BossDeath]", szBossName, szKillPlayerName, szTongName);
Dialog:ShowBattleMsg(pPlayer, 0, 0); 
end;

function tbQinshihuangBoss:DeathLoseItem(tbLoseItem)    
    local tbItem = tbLoseItem.Item;
    local szMsg = "<color=green>"..him.szName.." chết để lại vật phẩm:<color>\n";
    -- local szMsg = "<color=green>"..him.szName.." chết để lại vật phẩm:<color>\n<color=yellow> Voucher Thần Long - 1\n";
    local tbList = {};
    
    -- 列清单
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
        szMsg = szMsg .. "<color=yellow>" .. szItemName .. " - " .. nCount .. " cái<color>\n";
    end
    KDialog.MsgToGlobal(szMsg);    
end
