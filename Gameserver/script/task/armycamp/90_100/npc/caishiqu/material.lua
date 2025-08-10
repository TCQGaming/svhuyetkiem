-- bất luận cái gì ngoạn gia quân nhưng thu thập vật ấy phẩm 

-- tài liệu ，bất luận cái gì ngoạn gia điểm kích hội thải đắc vật ấy phẩm 
--[[
local tbNpc = Npc:GetClass(""); 

function tbNpc:OnDialog()
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
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
	}
	
	GeneralProcess:StartProcess("đang ở thu thập", 15 * 18, {self.OnCollect, self, him.dwId, me.nId}, {me.Msg,"thu thập thất bại"}, tbEvent);		
end;


function tbNpc:OnCollect(nNpcId, nPlayerId)
	-- bỏ đi thử Npc
	
	-- tăng thêm tài liệu 
end
--]]
