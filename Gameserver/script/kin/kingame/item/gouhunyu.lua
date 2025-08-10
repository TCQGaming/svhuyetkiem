----------------------------------------------------------------
-- 家族BOSS 召唤令牌(勾魂玉)
-- zhengyuhua
----------------------------------------------------------------

local tbLingPai = Item:GetClass("gouhunyu");

tbLingPai.USE_RANDE	 	= 10;		-- 使用范围
tbLingPai.TEXIAO_TIME	= 6;		-- 特效持续时间
tbLingPai.CALLTIME		= 5;		-- 召唤延迟
tbLingPai.CALL_BOSS_POS	= MathRandom(2401,2406)
tbLingPai.EFFECT_NPC	= 2976		-- 特效NPC模板
tbLingPai.BOSS_LIST 	= 
{
	[1] =				-- 初级BOSS列表 
	{
		{2404,	55,	5},----Cao sĩ hiền hệ thổ
		{2403,	55,	4},----Vạn lão điên hỏa
		{2401,	55,	2},----Vân tuyết sơn mộc
		{2402,	55,	5},----Hình bổ đầu thổ
		{2406,	55,	3},----Dương Liễu Thủy
		{2405,	55,	3},----Thác bạc sơn xuyên kim
	},
	[2] = 				-- 中级BOSS列表
	{
		{2407,	75,	1},-----Thần Thương Phương Vấn Kim
		{2408,	75,	2},----Trieu ung tien moc
		{2409,	75,	3},-----Huong ngoc tien thuy
		{2410,	75,	4},----Man tang bat gioi hoa
		{2411,	75,	5},----Nam quách nho
	}
}

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

function tbLingPai:OnUse()
	local nBindKinId = it.GetGenInfo(1, 0);
	nBindKinId = nBindKinId * 2 + it.GetGenInfo(2, 0);
	local nKinId = me.GetKinMember(1);
	-- if nBindKinId ~= nKinId then
		-- local pBindKin = KKin.GetKin(nBindKinId);
		-- if pBindKin then
			-- me.Msg(string.format("Mục đã được liên kết với gia tộc“%s”Ràng buộc, gia tộc bạn không thể sử dụng！", pBindKin.GetName()));
		-- else
			-- me.Msg("Mục này đã được liên kết với một gia tộc khác，Gia tộc bạn không có mặt！")
		-- end
		-- return 0;
	-- end
	local nMapId, nX, nY 	= me.GetWorldPos()
	local nMapIndex 		= SubWorldID2Idx(nMapId);
	local nMapTemplateId	= SubWorldIdx2MapCopy(nMapIndex);
	-- if KinGame.MAP_TEMPLATE_ID ~= nMapTemplateId then
		-- me.Msg("Chỉ có thể được sử dụng ở lãnh địa gia tộc");
		-- return 0;
	-- end
	-- if math.abs(nX - self.CALL_BOSS_POS[1]) + math.abs(nY - self.CALL_BOSS_POS[2]) > self.USE_RANDE then
		-- me.Msg("quá xa vị trí triệu tập，không thể triệu tập！");
		-- return 0;
	-- end
	
	GeneralProcess:StartProcess("Triệu Hồi...", 5 * Env.GAME_FPS, {self.EndProcess, self, it.dwId, nMapId}, nil, tbEvent);
	return 0;
end

-- 进度条读完
function tbLingPai:EndProcess(nItemId, nMapId)
	local nRoom, nX, nY = me.FindItemId(nItemId);
	if (not nRoom) or (not nX) or (not nY) then
		return 0;
	end
	local pItem = me.GetItem(nRoom, nX, nY);
	if not pItem then
		return 0;
	end
	local nItemLevel = pItem.nLevel;
	if me.DelItem(pItem, Player.emKLOSEITEM_USE) ~= 1 then
		return 0;
	end
		local nRandom5575 = MathRandom(1,2)
		local tbItemId	= {18,1,146,nRandom5575,0,0};  -- Gio hoa
	    local nMapId, nPosX, nPosY = me.GetWorldPos();
	-- 特效NPC
	-- local pNpc = KNpc.Add2(self.EFFECT_NPC, 10, -1, nMapId, unpack(self.CALL_BOSS_POS));
if nItemLevel == 1 then
	local nRandom = MathRandom(2401,2406)
	local nHe = 0
	if nRandom == 2401 then 
	  local  pNpc = KNpc.Add2(nRandom, 55,2, nMapId, nPosX, nPosY);
	elseif nRandom == 2402 then 
	  local  pNpc = KNpc.Add2(nRandom, 55,5, nMapId, nPosX, nPosY);
	elseif nRandom == 2403 then
	  local  pNpc = KNpc.Add2(nRandom, 55,4, nMapId, nPosX, nPosY);
	elseif nRandom == 2404 then
	  local  pNpc = KNpc.Add2(nRandom, 55,5, nMapId, nPosX, nPosY);
	elseif nRandom == 2405 then
	  local  pNpc = KNpc.Add2(nRandom, 55,1, nMapId, nPosX, nPosY);
	elseif nRandom == 2406 then
	  local  pNpc = KNpc.Add2(nRandom, 55,3, nMapId, nPosX, nPosY);
	  pNpc.SetLoseItemCallBack(1);
		end
else
	local nRandom1 = MathRandom(2407,2411)
	local nHe = 0
	if nRandom1 == 2407 then 
	  local  pNpc = KNpc.Add2(2407, 75,1, nMapId, nPosX, nPosY);
	elseif nRandom1 == 2408 then 
	  local  pNpc = KNpc.Add2(2408, 75,2, nMapId, nPosX, nPosY);
	elseif nRandom1 == 2409 then
	  local  pNpc = KNpc.Add2(2409, 75,3, nMapId, nPosX, nPosY);
	elseif nRandom1 == 2410 then
	  local  pNpc = KNpc.Add2(2410, 75,4, nMapId, nPosX, nPosY);
	elseif nRandom1 == 2411 then
	  local  pNpc = KNpc.Add2(2411, 75,5, nMapId, nPosX, nPosY);
	  pNpc.SetLoseItemCallBack(1);
		end
end
end

function tbLingPai:CallKinBoss(nKinId, nItemLevel, nMapId, nCallTime)
	local nCount = #self.BOSS_LIST[nItemLevel];
	local nRandom = Random(nCount) + 1;
	local tbBoss = self.BOSS_LIST[nItemLevel][nRandom];
	local cKin = KKin.GetKin(nKinId);
	if not tbBoss then
		-- 随机BOSS出问题了？
		print("Kin Boss is nil? Call again!", "nRandom ="..nRandom);
		if not nCallTime then
			nCallTime = 0;
		end
		nCallTime = nCallTime + 1;
		if nCallTime >= 5 then	-- 连Call 5次失败就不再重新CallBoss了
			print("Call Kin Boss Failed 5 times", cKin and cKin.GetName() or "无家族")
			return 0;
		end
		return self:CallKinBoss(nKinId, nItemLevel, nMapId, nCallTime);
	end
	
	-- 召唤BOSS
	local pNpc = KNpc.Add2(tbBoss[1], tbBoss[2], tbBoss[3], nMapId, self.CALL_BOSS_POS[1], self.CALL_BOSS_POS[2], 0, 1);
	if cKin and pNpc then
		KDialog.MsgToGlobal(string.format("<color=green>%s<color>Gia đình được triệu tập trong trường hợp gia đình<color=white>%s<color>",cKin.GetName(), pNpc.szName));
		-- KStatLog.ModifyAdd("mixstat", "家族Boss\t召唤\t"..pNpc.szName, "总量", 1);
	end
	return 0;
end

function tbLingPai:DelEffect(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if pNpc then		-- 删除召唤特效NPC
		pNpc.Delete();
	end
	return 0;
end


	