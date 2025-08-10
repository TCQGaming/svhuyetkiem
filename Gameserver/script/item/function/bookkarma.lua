
-- ????DT?a1|?��?��1?

-- 1|?��o����y/??�̡�o����y?��?����????��????DT?a�ꡧ��t????��?

Item.emXIUWEI_ADD_TYPE_NORMAL			= 0;	-- ?��?��??��?DT?a
Item.emXIUWEI_ADD_TYPE_XIULIANZHU		= 1;	-- ����1y?a??DT��??��??��?DT?a

function Item:AddBookKarma(pPlayer, nAddKarma, nAddType)
	if (0 == self:IsCanAddBookKarma(pPlayer, nAddType)) then
		return 0;
	end

	local pItem = pPlayer.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
		return	0;								-- ������???��D????��?����㨹
	end

	local tbSetting = self:GetExternSetting("book", pItem.nVersion);
	if (not tbSetting) then
		return	0;
	end

	local tbSkill =								-- ?????��??��|???��ID��D����
	{
		pItem.GetExtParam(17),
		pItem.GetExtParam(18),
		pItem.GetExtParam(19),
		pItem.GetExtParam(20),
	};

	local nLevel = pItem.GetGenInfo(1);			-- ????�̡�?��̨�??
	local nKarma = pItem.GetGenInfo(2);			-- ????�̡�?��DT?a
	
	local nUpExp;
	if pItem.nLevel == 3 then 
		nUpExp = tbSetting.m_tbHighLevelKarma[nLevel];
	else
		nUpExp = tbSetting.m_tbLevelKarma[nLevel];
	end
	
	if ((not nUpExp) or (nUpExp <= 0)) then		-- ��y��??��??��?
		return 1;
	end
	
	if (nLevel > pPlayer.nLevel + 5) then		-- ????�̨�??3?1y??��?�̨�??5??��?��?��?2??��?��DT?a
			return	1;								
	elseif (nLevel == pPlayer.nLevel + 5) then	-- ????�̨�??�̨�����??��?�̨�??5??��?����o����????����??��?a?1?��?��
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
				pPlayer.AddFightSkill(nSkill, 1);		-- ??��???��D??????��|��????����??��?����??????��
			end
			pPlayer.AddSkillExp(nSkill, nAddKarma);	-- ???��??��?��????����������?��
		end
	end

	while (true) do
		local nLevelUp;	-- ????��y????��????��D����?DT?a
		if pItem.nLevel == 3 then
			nLevelUp = tbSetting.m_tbHighLevelKarma[nLevel];
		else
			nLevelUp = tbSetting.m_tbLevelKarma[nLevel];
		end
		if (not nLevelUp) or (nLevelUp <= 0) then
			nKarma = 0;							-- ��??-��y?��?��??��?2??��???��DT?a
			pPlayer.Msg("M?t t?ch hi?n t?i ?? c?p cao nh?t, ti?p t?c tu luy?n kh?ng th? t?ng k? n?ng m?t t?ch.");
			break;
		end
		if (nKarma > nLevelUp) then			-- ��y??
			nLevel = nLevel + 1;
			nKarma = nKarma - nLevelUp;
		else
			break;
		end
	end

	if (pPlayer.UpdateBook(nLevel, nKarma) == 1) then		-- ????��?D??��D?��|����
		pPlayer.Msg("Nh?n ???c "..nAddKarma.." ?i?m tu luy?n m?t t?ch!!");	-- ����ϵͳ��Ϣ
	end

	if (nLevel ~= nOrgLevel) then				-- �̨�??���騦����??��
		pPlayer.Msg("T?ng ??ng c?p m?t t?ch!");		-- ����ϵͳ��Ϣ
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
	
	-- ����1yDT��??��?a????��?DT?a
	if (nAddType == self.emXIUWEI_ADD_TYPE_XIULIANZHU) then
		local nXiuSkillLevel = pPlayer.GetSkillState(380);
		if (not nXiuSkillLevel or nXiuSkillLevel <= 0) then
			return 0;
		end
	end
	return 1;
end
