----------------------------------------
-- nhưng tiêu trừ bách trảm cát Kim chung tráo đích đạo cụ 
-- ZhangDeheng
-- 2008/10/28 10:41
----------------------------------------

local tbFnsItem = Item:GetClass("chickenblood");

tbFnsItem.SKILL_ID 	= 1123;
tbFnsItem.ADVICE_RANGE	= 41; 	-- dùng sinh phán đoán cục phạm vây nội có hay không có bách trảm cát 

-- phán đoán một ngoạn gia có hay không ở chỉ định đích phạm vây nội 
function tbFnsItem:IsPlayerInRange(pPlayer, nRange)
	local tbPlayerList = KPlayer.GetAroundPlayerList(me.nId, nRange);
	if not tbPlayerList then
		return false;
	end;
	
	for _, player in ipairs(tbPlayerList) do
		if pPlayer.nId == player.nId then
			return true;
		end;
	end;
	return false;
end;

-- một phạm vây nội đích đội ngũ trung thành viên bày tin tức 
function tbFnsItem:Msg2Team(szMsg)
	if (MODULE_GAMESERVER) then
		local tbTeamMemberList = me.GetTeamMemberList();
		if tbTeamMemberList then
			for _, pPlayer in ipairs(tbTeamMemberList) do
				-- cận hướng ở 100phạm vây nội đích đội ngũ trung ngoạn gia bày tin tức 
				if self:IsPlayerInRange(pPlayer, 100) then
					Dialog:SendBlackBoardMsg(pPlayer, szMsg);	
				end;
			end;
		end;
		Dialog:SendBlackBoardMsg(me, szMsg);		
	end;
end

function tbFnsItem:OnUse()
	local bExist = false;
	-- phán đoán ngoạn gia chu vây có hay không có bách trảm cát tồn tại 
	local tbNpcList = KNpc.GetAroundNpcList(me, self.ADVICE_RANGE);
	if tbNpcList then
		for _, pNpc in ipairs(tbNpcList) do
			if 4111 == pNpc.nTemplateId then
				bExist = true;
			end;
		end;
	end
	
	if bExist then -- tồn tại 
		if me.nFightState == 1 then -- có hay không bị vây chiến đấu trạng thái 
			me.CastSkill(tbFnsItem.SKILL_ID, 1, -1, me.GetNpc().nIndex);
			local szMsg ="Kim chung tráo dĩ phá ！"
			self:Msg2Team(szMsg);
			return 1;
		else -- phi chiến đấu trạng thái 
			local szMsg ="phi chiến đấu trạng thái ，bất năng sử dụng đáng vật phẩm ！"
			Dialog:SendInfoBoardMsg(me, szMsg);
			return 0;
		end;
	else -- không tồn tại 
		local szMsg ="vật ấy chỉ có đối bách trảm cát sử dụng mới có hiệu ！"
		Dialog:SendInfoBoardMsg(me, szMsg);
		return 0;
	end;	
end
