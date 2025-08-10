
-- huy?n tinh h?p th¨¤nh c?ng n?ng k?ch b?n g?c 

------------------------------------------------------------------------------------------
local COMITEM_CLASS ="xuanjing";	-- ??o c? lo?i h¨¬nh £ºhuy?n tinh 
local PEEL_ITEM = { nGenre = Item.SCRIPTITEM, nDetail = 1, nParticular = 1 };	-- huy?n tinh 

-- c¨¢c c?p c?p huy?n tinh ?¨ªch tin t?c bi?u 
local tbCrystal;

local function InitCrystalTable(tbComItem)
	tbCrystal = {};
	for i = 1, 12 do
		tbCrystal[i] = KItem.GetItemBaseProp(18, 1, 1, i);
	end 
end

-- t¨ªnh to¨¢n h?p th¨¤nh gi¨¢ tr? d? to¨¢n (ph?c v? ?oan h? kh¨¢ch ?oan x¨¤i chung)
function Item:GetComposeBudget(tbComItem, nMoneyType)
	local nTotalValue = 0;
	local bBind = 0;
	if not tbCrystal then
		InitCrystalTable();
	end
	local nTime = 0;
	local tbAbsTime;
	local tbCalcuate = {};
	for i, pItem in pairs(tbComItem) do
		nTotalValue = nTotalValue + pItem.nValue;
		if pItem.IsBind() == 1 then	-- c¨® m?t huy?n tinh b?ng ??nh t?c b?ng ??nh 
			bBind = 1;
		end
		if pItem.szClass ~= COMITEM_CLASS then
			return 0;
		end
		local tbTime = me.GetItemAbsTimeout(pItem);
		if tbTime then
			local nNewTime = tbTime[1] * 100000000 + tbTime[2] * 1000000 + 
				tbTime[3] * 10000 + tbTime[4] * 100 + tbTime[5];
			if nTime == 0 or nNewTime <nTime then
				nTime = nNewTime;
				tbAbsTime = tbTime;
			end
		end
		local szName = pItem.szName
		if not tbCalcuate[szName] then
			tbCalcuate[szName] = 0;
		end
		tbCalcuate[szName] = tbCalcuate[szName] + 1;
	end
	local szLog =""
	if MODULE_GAMESERVER then
		for szName, nCount in pairs(tbCalcuate) do
			szLog = szLog..szName..nCount.."m?t ";
		end
	end
	local nMinLevel = 0;
	for i = 1, 12 do
		if nTotalValue>= tbCrystal[i].nValue then
			nMinLevel = i;
		end
	end
	local nFee = math.ceil(nTotalValue / 10 * self:GetJbPrice());
	
	local nMinLevelRate = 0;
	local nMaxLevelRate = 0
	if nMinLevel>= 12 then
		nMinLevel = 11;
		nMinLevelRate = 0;
		nMaxLevelRate = 1;
	else
		nMinLevelRate = tbCrystal[nMinLevel + 1].nValue - nTotalValue;
		nMaxLevelRate = nTotalValue - tbCrystal[nMinLevel].nValue;
	end
	if (bBind == 0) and (nMoneyType == Item.BIND_MONEY) then
		bBind = 1;
	end
	return nMinLevel, nMinLevelRate, nMinLevel + 1, nMaxLevelRate, nFee, bBind, tbAbsTime, szLog;
end

function Item:Compose(tbComItem, nMoneyType, nParam)
	if (me.nFightState ~= 0) then
		me.Msg("Tr?ng th¨¢i chi?n ??u kh?ng ???c ti?n h¨¤nh thao t¨¢c n¨¤y!");
		return 0;
	end
	
	local nIbValue = 0;
	local nMinLevel, nMinLevelRate, nMaxLevel, nMaxLevelRate, nFee, bBind, tbAbsTime, szLog = Item:GetComposeBudget(tbComItem, nMoneyType);
	--- nMinLevelRate l¨¤ t? l? x?t nMinLevel l¨¤ level c?a huy?n tinh x?t ---nMaxLevelRate l¨¤ t? l? l¨ºn  nMaxLevel l¨¤ level c?a huy?n tinh ¨¦p l¨ºn
	-- nMinLevelRate + 10 l¨¤ t?ng t? l? x?t l¨ºn 10   nMaxLevelRate -10 l¨¤ gi?m t? l? th¨¤nh c?ng ?i 10%
	if nMinLevel <1 then
		me.Msg("Kh?ng h?p th¨¤nh ???c! C¨® v?t ph?m kh?ng ph?i huy?n tinh")
		return 0;
	end
	
	-- h?p th¨¤nh huy?n tinh kh?ng n¨ºn ki?m tra ba l? kh?ng gian ?¨ªch ?i?u ki?n ti¨ºn quy?t l¨¤ huy?n tinh b?t kh? ch?ng £¬n?u nh? nh?ng ch?ng c?n ki?m tra ba l? kh?ng gian 
	-- TODO
	if (nMoneyType == Item.NORMAL_MONEY and me.CostMoney(nFee, Player.emKPAY_COMPOSE) ~= 1) then	-- kh?u tr? ti?n t¨¤i 
		me.Msg("Ng??i kh?ng ?? b?c, kh?ng th? h?p th¨¤nh!");
		return 0;
	elseif (nMoneyType == Item.BIND_MONEY and me.CostBindMoney(nFee, Player.emKBINDMONEY_COST_COMPOSE) ~= 1) then
		me.Msg("Kh?ng ?? b?c kh¨®a, kh?ng th? h?p th¨¤nh!");
		return 0;
	elseif (nMoneyType ~= Item.NORMAL_MONEY)and (nMoneyType ~= Item.BIND_MONEY) then
		return 0;
	end
	
	if nMoneyType == Item.NORMAL_MONEY then
		KStatLog.ModifyAdd("jxb","[Ti¨ºu hao] Gh¨¦p huy?n tinh","t?ng", nFee);
	end
	
	if nMoneyType == Item.BIND_MONEY then
		KStatLog.ModifyAdd("bindjxb","[Ti¨ºu hao] Gh¨¦p huy?n tinh","t?ng", nFee);
	end
	
	--if nMoneyType == Item.NORMAL_MONEY then
	--	nIbValue = nIbValue + nFee / Spreader.ExchangeRate_Gold2Jxb;
	--end
	
	local szSucc ="T? l? th¨¤nh c?ng:"..nMaxLevelRate.."/"..(nMinLevelRate + nMaxLevelRate).."c¨® th? h?p th¨¤nh"..nMaxLevel.."(c?p)";
	Dbg:WriteLog("Compose","T¨ºn nhan v?t:"..me.szName,"T¨¤i kho?n:"..me.szAccount,"Nguy¨ºn li?u:"..szLog, szSucc);
	
	-- c?t b? huy?n tinh 
	for i = 1, #tbComItem do
		if tbComItem[i].nBuyPrice> 0 then -- c¨® Ibgi¨¢ tr? l??ng 
			nIbValue = nIbValue + tbComItem[i].nBuyPrice; -- Ibgi¨¢ tr? v?n ?ang b¨¢m v¨¤o phi b?ng ??nh huy?n tinh th??ng 
		end

		local szItemName = tbComItem[i].szName;
		local nRet = me.DelItem(tbComItem[i], Player.emKLOSEITEM_TYPE_COMPOSE);		-- kh?u tr? huy?n tinh 
		if nRet ~= 1 then
			Dbg:WriteLog("Compose","T¨ºn nhan v?t:"..me.szName,"T¨¤i kho?n:"..me.szAccount,"tr?"..szItemName.."Th?t b?i");
			return 0;
		end
	end
	
	local nRandom = Random(nMinLevelRate + nMaxLevelRate);
	local nResultLevel = 0;
	if nRandom <nMinLevelRate then
		nResultLevel = nMinLevel;
	else
		-- h?p th¨¤nh li?u t?t h?n ?¨ªch huy?n tinh 
		nResultLevel = nMaxLevel;
	end
	-- d¨¤nh cho huy?n tinh 
	local pItem;
	local tbGive = {}
	tbGive.bForceBind = bBind;
	if tbAbsTime then
		tbGive.bTimeOut = 1;
	end
	pItem = me.AddItemEx(PEEL_ITEM.nGenre, PEEL_ITEM.nDetail, PEEL_ITEM.nParticular, nResultLevel, tbGive, Player.emKITEMLOG_TYPE_COMPOSE);
	if pItem and tbAbsTime then
		local nTime = os.time({year = tbAbsTime[1], month=tbAbsTime[2], day=tbAbsTime[3], hour=tbAbsTime[4], min=tbAbsTime[5]});
		me.SetItemTimeout(pItem, os.date("%Y/%m/%d/%H/%M/00", nTime));
	end
	if not pItem then
		-- d¨¤nh cho huy?n tinh th?t b?i £¿nh? m?t logba 
		Dbg:WriteLog("Compose","T¨ºn nhan v?t:"..me.szName,"T¨¤i kho?n:"..me.szAccount,"cho"..nResultLevel.."(c?p) th?t b?i!");
		return 0;
	else
		Dbg:WriteLog("Compose","T¨ºn nhan v?t:"..me.szName,"h?p th¨¤nh 1"..pItem.szName);
	end

	if bBind ~= 1 then
		pItem.nBuyPrice = nIbValue;
	else
		Spreader:AddConsume(nIbValue);
	end

	return nResultLevel;
end

