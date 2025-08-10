------------------------------------------------------
-- ÎÄ¼þÃû¡¡£ºtianyanmiyuwan.lua
-- Dev¡¡£ºdengyong
-- Time£º2009-12-07 11:35:10
--Edit : TCQGaming
-- 5/5/2023
------------------------------------------------------

local tbItem = Item:GetClass("tianyanmiyuwan");

tbItem.nProcessTime 			  = 5;		-- Trong qu¨¢ tr¨¬nh s? d?ng ??o c?, ph?i m?t 5 giay ?? ??c
tbItem.nPersuadeSkillId          = 1526;	-- tr?ng th¨¢i thuy?t ph?c, ng??i ch?i
tbItem.nBePersuadeSkillId 		  = 1527;	-- tr?ng th¨¢i thuy?t ph?c

-- Tham s? ph?i l¨¤ ID c?a NPC ?? ch?n
function tbItem:OnUse(nParam)
	if (Partner.bOpenPartner ~= 1) then
		me.Msg("Tính năng hiện chưa mở");
		return 0;
	end
	
	-- if me.nLevel < 100 then
		-- me.Msg("Tính năng hiện chưa mở");
		-- return 0;
	-- end
    local nPlayerLevel = me.nLevel
    if nPlayerLevel < 90 and it.nLevel == 1 then
        me.Msg("Bạn cần đạt cấp độ 90 để sử dụng thiệp lụa.");
        return 0;
    elseif nPlayerLevel < 100 and it.nLevel == 2 then
        me.Msg("Bạn cần đạt cấp độ 100 để sử dụng thiệp bạc.");
        return 0;
    end
	
	local dwId = nParam;
	local pNpc = KNpc.GetById(dwId);
	
	if dwId == 0 or not pNpc then
		me.Msg("Hãy chọn 1 NPC rồi sử dụng thiệp");
		return 0;
	end
local nTieuKim = me.GetItemCountInBags(18,1,1327,15) -- Tâm tâm tương ánh phù
if nTieuKim < 2 then 
	Dialog:Say("Bạn không có đủ ít nhất 2 Tâm Tâm Tương Ánh Phù rồi không thể thu phục đồng hành")
	return 
end
	-- ?i?u ki?n thuy?t ph?c c¨® ???c ?¨¢p ?ng hay kh?ng
	local nRes, varMsg = Partner:TryToPersuade(me, pNpc, it.nLevel);
	if nRes == 0 then
		me.Msg(varMsg);		-- Kh?ng thuy?t ph?c ???c, tr? v? th?ng b¨¢o l?i
		Partner:SendClientMsg(varMsg);
		return 0;
	end
	
-- B?n c¨® th? b? thuy?t ph?c, h?y ??c b¨¤i b¨¢o. .
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
	

-- C?ng c?n th¨ºm tr?ng th¨¢i ??c bi?t cho ng??i ch?i v¨¤ NPC, bi?u th? ?ang trong qu¨¢ tr¨¬nh ??c b¨¤i vi?t
	if not me.GetTempTable("Partner").nPersuadeRefCount then
		me.GetTempTable("Partner").nPersuadeRefCount = 0;
	end
	me.GetTempTable("Partner").nPersuadeRefCount = me.GetTempTable("Partner").nPersuadeRefCount + 1;
	
	me.AddSkillState(self.nPersuadeSkillId, 1, 1, self.nProcessTime * Env.GAME_FPS);
	
	local nCount = pNpc.GetTempTable("Partner").nPersuadeRefCount or 0;
	if nCount <= 0 then
		pNpc.AddTaskState(self.nBePersuadeSkillId);
		nCount = 0;
	end
	
	pNpc.GetTempTable("Partner").nPersuadeRefCount = nCount + 1;	
	
	GeneralProcess:StartProcess("Đang thu phục", self.nProcessTime * Env.GAME_FPS, 
		{Partner.CreatePartner, Partner, me.nId, dwId, it.dwId}, 
		{self.OnBreak, self, me.nId, pNpc.dwId}, 
		tbEvent);
	
	return 0;
end 

-- Nh?n ??i t??ng NPC ?? ch?n t? m¨¢y kh¨¢ch v¨¤ tr? l?i ID cho m¨¢y ch?
-- Tr? v? 0 n?u kh?ng c¨® ??i t??ng NPC n¨¤o ???c ch?n
function tbItem:OnClientUse()
	local pSelectNpc = me.GetSelectNpc();
	if not pSelectNpc then
		return 0;
	end

	return pSelectNpc.dwId;
end

-- Sau khi ng?t, b? tr?ng th¨¢i ??c bi?t
function tbItem:OnBreak(nPlayerId, nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pNpc = KNpc.GetById(nNpcId);
	
	if pPlayer and pPlayer.GetTempTable("Partner").nPersuadeRefCount <= 1 then
		pPlayer.RemoveSkillState(self.nPersuadeSkillId);
		pPlayer.GetTempTable("Partner").nPersuadeRefCount = 0;
	else
		pPlayer.GetTempTable("Partner").nPersuadeRefCount = pPlayer.GetTempTable("Partner").nPersuadeRefCount - 1;
	end	
	
	if not pNpc or not pNpc.GetTempTable("Partner").nPersuadeRefCount then
		return;
	end
		
	pNpc.GetTempTable("Partner").nPersuadeRefCount = pNpc.GetTempTable("Partner").nPersuadeRefCount - 1;
	if pNpc.GetTempTable("Partner").nPersuadeRefCount <= 0 then
		pNpc.RemoveTaskState(self.nBePersuadeSkillId);
	end

end