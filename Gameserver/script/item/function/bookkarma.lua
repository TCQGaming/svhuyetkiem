
-- ????DT?a1|?ü?à1?

-- 1|?üoˉêy/??μ÷oˉêy?ó?ú￡????ó????DT?a￡¨·t????￡?

Item.emXIUWEI_ADD_TYPE_NORMAL			= 0;	-- ?±?ó??μ?DT?a
Item.emXIUWEI_ADD_TYPE_XIULIANZHU		= 1;	-- í¨1y?a??DTá??é??μ?DT?a

function Item:AddBookKarma(pPlayer, nAddKarma, nAddType)
	if (0 == self:IsCanAddBookKarma(pPlayer, nAddType)) then
		return 0;
	end

	local pItem = pPlayer.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
		return	0;								-- éíé???óD????￡?ê§°ü
	end

	local tbSetting = self:GetExternSetting("book", pItem.nVersion);
	if (not tbSetting) then
		return	0;
	end

	local tbSkill =								-- ?????ù??ó|???üIDáD±í
	{
		pItem.GetExtParam(17),
		pItem.GetExtParam(18),
		pItem.GetExtParam(19),
		pItem.GetExtParam(20),
	};

	local nLevel = pItem.GetGenInfo(1);			-- ????μ±?°μè??
	local nKarma = pItem.GetGenInfo(2);			-- ????μ±?°DT?a
	
	local nUpExp;
	if pItem.nLevel == 3 then 
		nUpExp = tbSetting.m_tbHighLevelKarma[nLevel];
	else
		nUpExp = tbSetting.m_tbLevelKarma[nLevel];
	end
	
	if ((not nUpExp) or (nUpExp <= 0)) then		-- éyμ??ú??á?
		return 1;
	end
	
	if (nLevel > pPlayer.nLevel + 5) then		-- ????μè??3?1y??é?μè??5??ò?é?￡?2??ù?óDT?a
			return	1;								
	elseif (nLevel == pPlayer.nLevel + 5) then	-- ????μè??μèóú??é?μè??5??μ?ê±oò￡????óμ??ú?a?1?′?é
		if (nKarma >= nUpExp) then
			return 1;
		end
		if (nAddKarma + nKarma > nUpExp) then
			nAddKarma = nUpExp - nKarma;
		end
	end
	
	local nOrgLevel = nLevel;
	nKarma = nKarma + nAddKarma;

	for _, nSkill in ipairs(tbSkill) do
		if (nSkill > 0) then
			if (1 ~= pPlayer.IsHaveSkill(nSkill)) then
				pPlayer.AddFightSkill(nSkill, 1);		-- ??é???óD??????ó|μ????ü￡??ò?óé??????ü
			end
			pPlayer.AddSkillExp(nSkill, nAddKarma);	-- ???ó??é?μ????üêìá·?è
		end
	end

	while (true) do
		local nLevelUp;	-- ????éy????ò????ùDèμ?DT?a
		if pItem.nLevel == 3 then
			nLevelUp = tbSetting.m_tbHighLevelKarma[nLevel];
		else
			nLevelUp = tbSetting.m_tbLevelKarma[nLevel];
		end
		if (not nLevelUp) or (nLevelUp <= 0) then
			nKarma = 0;							-- ò??-éy?á?￥??￡?2??ù???óDT?a
			pPlayer.Msg("M?t t?ch hi?n t?i ?? c?p cao nh?t, ti?p t?c tu luy?n kh?ng th? t?ng k? n?ng m?t t?ch.");
			break;
		end
		if (nKarma > nLevelUp) then			-- éy??
			nLevel = nLevel + 1;
			nKarma = nKarma - nLevelUp;
		else
			break;
		end
	end

	if (pPlayer.UpdateBook(nLevel, nKarma) == 1) then		-- ????ê?D??üD?′|àí
		pPlayer.Msg("Nh?n ???c "..nAddKarma.." ?i?m tu luy?n m?t t?ch!!");	-- 发送系统消息
	end

	if (nLevel ~= nOrgLevel) then				-- μè??·￠éú±??ˉ
		pPlayer.Msg("T?ng ??ng c?p m?t t?ch!");		-- 发送系统消息
	end

	return	1;

end

function Item:IsCanAddBookKarma(pPlayer, nAddType)
	if (not pPlayer) then
		return 0;
	end
	if (not nAddType) then
		return 1;
	end
	
	-- í¨1yDTá??é?a????μ?DT?a
	if (nAddType == self.emXIUWEI_ADD_TYPE_XIULIANZHU) then
		local nXiuSkillLevel = pPlayer.GetSkillState(380);
		if (not nXiuSkillLevel or nXiuSkillLevel <= 0) then
			return 0;
		end
	end
	return 1;
end
