-- 文件名　:crosstimeroom_item.lua
-- 创建者　:zhangjunjie
-- 创建时间:2011-08-12 16:59:46
-- 描述:时光屋item

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

----对紫轩伤害的道具
local tbDamageItem = Item:GetClass("crosstimeroom_damage");

function tbDamageItem:OnUse()
	local nMapIndex 		= SubWorldID2Idx(me.nMapId);
	local nMapTemplateId	= SubWorldIdx2MapCopy(nMapIndex);
	if nMapTemplateId ~= CrossTimeRoom.nTemplateMapId then
		me.Msg("Phó bản không thể sử dụng đạo cụ này!");
		return 0;
	end
	if me.nFightState == 0 then
		me.Msg("Phi chiến đấu không thể sử dụng đạo cụ!");
		return 0;
	end
	return 0;
end

function tbDamageItem:InitGenInfo()
	it.SetTimeOut(1,20 * 60);	--时长20 phút
	return {};
end


----蓝天玉
local tbStone = Item:GetClass("crosstimeroom_stone");

function tbStone:OnUse()
	local szName = KItem.GetNameById(unpack(CrossTimeRoom.tbMakeStoneGDPL));
	local szMsg = string.format("Nâm khả dĩ tiêu hao tinh lực, sức sống các %s điểm, tương tha mài thành một khối <color=yellow>%s<color>(<color=red> buộc định <color>), khả tăng 20 điểm Tần Thủy Hoàng lăng - phát khâu môn danh vọng. \n\n xác định chế tác sao?",CrossTimeRoom.nMakeStoneJinghuo,szName);
	local tbOpt = 
	{
		{"Xác định", self.MakeStone,self,me.nId,it.dwId},
		{"Để Ta xem đã"},	
	};
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbStone:MakeStone(nPlayerId,nItemId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local pItem = KItem.GetObjById(nItemId);
	if not pItem then
		return 0;
	end
	local bCanMake,szError = self:CheckCanMake(pPlayer);
	if bCanMake ~= 1 then
		Dialog:Say(szError);
		return 0;
	end
	GeneralProcess:StartProcess("Đánh bóng lại...", 5 * Env.GAME_FPS, {self.DoMake,self,nPlayerId,pItem.dwId},nil,tbEvent);
end

function tbStone:DoMake(nPlayerId,nItemId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local pItem = KItem.GetObjById(nItemId);
	if not pItem then
		return 0;
	end
	local bCanMake,szError = self:CheckCanMake(pPlayer);
	if bCanMake ~= 1 then
		Dialog:Say(szError);
		return 0;
	end
	local tbStoneInfo = CrossTimeRoom.tbMakeStoneGDPL;
	local nNeedGTPMKP = CrossTimeRoom.nMakeStoneJinghuo;
	local nCount = pItem.nCount or 0;
	if nCount <= 0 then
		Dbg:WriteLog("CrossTimeRoom","Item Not Found!",me.nId,me.szName);
		return 0;
	end
	if nCount > 1 then
		if pItem.SetCount(nCount - 1) ~= 1 then
			Dbg:WriteLog("CrossTimeRoom","Item Delete Failed!",me.nId,me.szName);
			return 0;
		end	
	else 
		if me.DelItem(pItem,Player.emKLOSEITEM_USE) ~= 1 then
			Dbg:WriteLog("CrossTimeRoom","Item Delete Failed!",me.nId,me.szName);
			return 0;
		end	
	end
	me.ChangeCurGatherPoint(-nNeedGTPMKP);
	me.ChangeCurMakePoint(-nNeedGTPMKP);
	local pItem = me.AddItem(tbStoneInfo[1],tbStoneInfo[2],tbStoneInfo[3],tbStoneInfo[4]);
	if pItem then
		pItem.Bind(1);
		CrossTimeRoom:RecordAward(0,me.nId,pItem.szName);
	end
	return 1;
end

function tbStone:CheckCanMake(pPlayer)
	if not pPlayer then
		return 0;
	end
	if GetMapType(pPlayer.nMapId) ~= "city" and GetMapType(pPlayer.nMapId) ~= "village" then
		return 0, "Chỉ có thể chế tạo tại thành thì hoặc thôn trấn!";
	end
	local szErrMsg = "";
	if pPlayer.CountFreeBagCell() < 1 then
		szErrMsg = "Hành trang cần 1 khoảng trống";
		return 0, szErrMsg;
	end
	local nNeedGTPMKP = CrossTimeRoom.nMakeStoneJinghuo;
	if pPlayer.dwCurGTP < nNeedGTPMKP or pPlayer.dwCurMKP < nNeedGTPMKP then
		szErrMsg = string.format("Của ngươi tinh sống bất túc, mài lam điền mỹ ngọc cần tiêu hao tinh lực hòa sức sống các <color=yellow>%s điểm <color>. ",nNeedGTPMKP);
		return 0, szErrMsg;
	end
	return 1;
end


--------------记录产出点
function CrossTimeRoom:RecordAward(bAdd,nId,szItemName)
	if bAdd and bAdd == 1 then
		--StatLog:WriteStatLog("stat_info","yinyangshiguangdian","gain",nId,szItemName or "蓝天玉",1);	--数据埋点
	else
		--StatLog:WriteStatLog("stat_info","yinyangshiguangdian","process",nId,szItemName or "蓝天美玉",1);	--数据埋点
	end
end