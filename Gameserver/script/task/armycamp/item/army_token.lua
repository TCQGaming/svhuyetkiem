--quân doanh lệnh bài 
--tôn đa lương 
--2008.08.19
local tbItem = Item:GetClass("army_token")
tbItem.tbItemId = 
{
	[606] = 0,	--đan thứ 
	[607] = 1,	--vô hạn quân doanh lệnh bài 
	[195] = 1,	--vô hạn truyện tống phù 
	[235] = 1,
}
-- （thử biểu hội bị cái khác khuông khối trích dẫn ）
tbItem.tbTransMap = {
	{"Phục Ngưu Sơn Quân Doanh [Thanh Long]",556,1631,3142},
	{"Phục Ngưu Sơn Quân Doanh [Chu Tước]",558,1631,3142},
	{"Phục Ngưu Sơn Quân Doanh [Huyền Vũ]",559,1631,3142}
}
tbItem.nTime = 5;

-- （thử hàm sổ hội bị cái khác khuông khối điều dùng ）
function tbItem:OnUse()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local szMsg ="Mời chọn Quân doanh bạn muốn đến";
	local tbOpt = {}
	for i, tbItem in ipairs(self.tbTransMap) do
		table.insert(tbOpt, {tbItem[1], self.OnTrans, self, it.dwId, i})
	end
	
	Lib:SmashTable(tbOpt);
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
end

function tbItem:OnTrans(nItemId, nTransId)
	local pPlayer = me;
	if pPlayer.nLevel <60 then
		pPlayer.Msg("Người chơi <cấp 60 không được vào Quân doanh");
		return;
	end
	local tbEvent	= {						-- hội trung đoạn diên thì chuyện món 
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
	};
	if (0 == pPlayer.nFightState) then				-- ngoạn gia ở phi chiến đấu trạng thái hạ truyện tống vô diên thì bình thường truyện tống 
		self:TransSure(nItemId, nTransId, pPlayer.nId);
		return 0;
	end

	GeneralProcess:StartProcess("Đang chuyển đến Quân doanh...", self.nTime * Env.GAME_FPS, {self.TransSure, self, nItemId, nTransId, pPlayer.nId}, nil, tbEvent);	-- ở chiến đấu trạng thái hạ cần nTimemiểu đích diên thì 
end

function tbItem:TransSure(nItemId, nTransId, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local pItem = KItem.GetObjById(nItemId);
	if not pItem or not pPlayer then
		return 0;
	end
	if self.tbItemId[pItem.nParticular] ~= 1 then
		local nCount = pItem.nCount;
		if nCount <= 1 then
			if (pPlayer.DelItem(pItem, Player.emKLOSEITEM_USE) ~= 1) then
				pPlayer.Msg("Xóa Chiêu Thư Tống Kim thất bại!");
				return 0;
			end
		else
			pItem.SetCount(nCount - 1);
			pItem.Sync();
		end
	end
	pPlayer.NewWorld(self.tbTransMap[nTransId][2], self.tbTransMap[nTransId][3], self.tbTransMap[nTransId][4]);
end
