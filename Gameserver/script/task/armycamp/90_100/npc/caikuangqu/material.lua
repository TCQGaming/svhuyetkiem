-- tài liệu ，bất luận cái gì ngoạn gia điểm kích hội thải đắc vật ấy phẩm 

local tbNpc = Npc:GetClass("funiushan_caikuangqu_masheng"); 

-- TODO: liuchang nảy sinh cái mới điểm 
tbNpc.tbGrowPoses = 
{
	{1886,3478},
	{1895,3477},
	{1928,3298},
	{1950,3439},
	{1976,3302},
	{2002,3355},
	{2018,3423},
	{2038,3389},
}


-- cà tài liệu mới 
function tbNpc:Grow(nMapId)	
	for _, tbPos in ipairs(self.tbGrowPoses) do
		KNpc.Add2(4013, 1, -1, nMapId, tbPos[1], tbPos[2]);
	end
end


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
	local pNpc = KNpc.GetById(nNpcId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pNpc or not pPlayer) then
		return;
	end
	local nMapId, nPosX, nPosY = pNpc.GetWorldPos();
	-- TODO:liuchang sau khi đắc chú sách FBkế thì khí ，đương FBquan bế đích thì hậu hội quan bế việc này kế thì khí 
	Timer:Register(Env.GAME_FPS*20, self.Rebirth, self, pNpc.nTemplateId, nMapId, nPosX, nPosY);
	pNpc.Delete();
	
	-- tăng thêm tài liệu 
	pPlayer.AddItem(20, 1, 604, 1);
end


function tbNpc:Rebirth(nTemplateId, nMapId, nPosX, nPosY)
	KNpc.Add2(nTemplateId, 1, -1, nMapId, nPosX, nPosY);
	
	return 0;
end


local tbNpc1 = Npc:GetClass("funiushan_caikuangqu_mubang"); 

-- TODO: liuchang nảy sinh cái mới điểm 
tbNpc1.tbGrowPoses = 
{
	{1886,3469},
	{1891,3482},
	{1897,3473},
	{1931,3413},
	{1952,3257},
	{1960,3327},
	{1956,3424},
	{1976,3307},
	{1993,3431},
	{2013,3411},
	{2024,3337},
}


-- cà tài liệu mới 
function tbNpc1:Grow(nMapId)	
	for _, tbPos in ipairs(self.tbGrowPoses) do
		KNpc.Add2(4014, 1, -1, nMapId, tbPos[1], tbPos[2]);
	end
end


function tbNpc1:OnDialog()
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


function tbNpc1:OnCollect(nNpcId, nPlayerId)
	-- bỏ đi thử Npc
	local pNpc = KNpc.GetById(nNpcId);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not pNpc or not pPlayer) then
		return;
	end
	local nMapId, nPosX, nPosY = pNpc.GetWorldPos();
	-- TODO:liuchang sau khi đắc chú sách FBkế thì khí ，đương FBquan bế đích thì hậu hội quan bế việc này kế thì khí 
	Timer:Register(Env.GAME_FPS*20, self.Rebirth, self, pNpc.nTemplateId, nMapId, nPosX, nPosY);
	pNpc.Delete();
	
	-- tăng thêm tài liệu 
	pPlayer.AddItem(20, 1, 605, 1);
end


function tbNpc1:Rebirth(nTemplateId, nMapId, nPosX, nPosY)
	KNpc.Add2(nTemplateId, 1, -1, nMapId, nPosX, nPosY);
	
	return 0;
end
