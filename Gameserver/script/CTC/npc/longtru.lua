--Require("\\script\\npc\\uniqueboss.lua");
local tbNpc	= Npc:GetClass("ctc_longtru");
--tbNpc._tbBase = tbWorldBossBase;
tbNpc.nGouhuoSkillId		= 377;		-- 篝火的技能Id
--script\CTC\npc\longtru.lua
function tbNpc:OnDeath_Boss(nTongId,pNpc)
	local pPlayer = pNpc.GetPlayer();
	--local nLifeBoss = him.nMaxLife;-- get mau hien tai
	local nMapId, nX, nY = him.GetWorldPos();
	local nPosX = nX;
	local nPosY = nY;
	local key = him.nTemplateId;
	local nPicId = 7;
	local flag = 1;
	if him.nTemplateId == CTC.NPCNgaiVang[1] then
		flag = 2;
	end
	local szTongNameOld = "";
	if nTongId ~= 0 then
		local pos = CTC:FindPosTong(CTC.Result,nTongId);
		--CTC.Result[pos][2] =  CTC.Result[pos][2] - CTC.Point[flag];
		local pTongOld = KTong.GetTong(nTongId);
		szTongNameOld = "của <color=yellow>"..pTongOld.GetName().."<color>";
	end
	
	local newcamp = CTC:FindPosTongList(CTC.TongList,pPlayer.dwTongId);

	local pTong = KTong.GetTong(pPlayer.dwTongId);
	local szTongName = pTong.GetName();
	local szTongName = pTong.GetName();
	if him.nTemplateId == 10356 then -- Long Trụ Huyền Vũ
		CTC.HuyenVu = szTongName;
	elseif him.nTemplateId == 10357 then -- Long Trụ Bạch Hổ
		CTC.BachHo = szTongName;
	elseif him.nTemplateId == 10358 then -- Long Trụ Chu Tước
		CTC.ChuTuoc = szTongName;
	elseif him.nTemplateId == 10359 then -- Long Trụ Thanh Long
		CTC.ThanhLong = szTongName;		
	elseif him.nTemplateId == CTC.NPCNgaiVang[1] then -- 
		CTC.NgaiVang = szTongName;		
	end		


	local pNpc2 = KNpc.Add2(him.nTemplateId,him.nLevel,-1,nMapId, nX, nY, 0, 0, 1);
	pNpc2.SetVirtualRelation(Npc.emNPCVRELATIONTYPE_TONE, pPlayer.dwTongId);
	Npc:RegPNpcOnDeath(pNpc2, tbNpc.OnDeath_Boss, self,pPlayer.dwTongId);
	pNpc2.SetTitle ( "<color=gold>"..szTongName.."<color>");
	tbNpc:StartNpcTimer(pNpc2.dwId,pPlayer.dwTongId);

	local newpos = CTC:FindPosTong(CTC.Result,pPlayer.dwTongId);
	CTC.Result[newpos][2] =  CTC.Result[newpos][2] + CTC.Point[flag];
	
	
	if nTongId ~= pPlayer.dwTongId then
		KTong.Msg2Tong(pPlayer.dwTongId, "Đã chiếm thành công ".. him.szName.. " đạt được <color=cyan>".. CTC.Result[newpos][2].. " điểm<color>");
		local szMsg = "Bang hội <color=yellow>"..szTongName.."<color> đã chiếm thành công <color=cyan>".. him.szName.. "<color> "..szTongNameOld.."<color>";
		for _,nPlayerId in pairs(CTC.PlayerList) do
			local pPlayer3 = KPlayer.GetPlayerObjById(nPlayerId);
			if  pPlayer3 then
			Dialog:SendBlackBoardMsg(pPlayer3, szMsg);
			pPlayer3.Msg(szMsg);
			end
		end
	end
end

function tbNpc:OnLifePercentReduceHere(nLifePercent)

end
function tbNpc:StartNpcTimer(nNpcId,nTongId)
		local pNpc = KNpc.GetById(nNpcId);
		if not pNpc then
			return 0
		end
		local tbTmp = pNpc.GetTempTable("Npc");
		Timer:Register(15 * Env.GAME_FPS, self.OnNpcTimer, self, nNpcId,nTongId);
		
end
function tbNpc:Restore_Life(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	pNpc.RestoreLife();
	Timer:Close(self.Npc_TimerId);
end
function tbNpc:OnNpcTimer(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	local tbTmp		= pNpc.GetTempTable("Npc");
	self:AddAroundPlayersExp(nNpcId,nTongId);							-- 给Npc周围队伍玩家加经验
	return 15 * Env.GAME_FPS;
end 
function tbNpc:AddAroundPlayersExp(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	local tbTmp			 = pNpc.GetTempTable("Npc");
	local tbPlayer = KNpc.GetAroundPlayerList(nNpcId, 40);
	local tbPlayerId = {};
	if tbPlayer then
		for _, pPlayer in pairs(tbPlayer) do
			
			if pPlayer.dwTongId == nTongId then
			table.insert(tbPlayerId, pPlayer.nId);
			end
		end
	end

	for _, nPlayerId in pairs(tbPlayerId) do
		self:AddExp2Player(nPlayerId, nNpcId);
	end
end
function tbNpc:AddExp2Player(nPlayerId, nNpcId)
	local szMsg		= "Ngươi có công bảo vệ long trụ, nhận được phần thưởng.";
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	
	local tbTmp		= pNpc.GetTempTable("Npc");
	pPlayer.CastSkill(self.nGouhuoSkillId, 10, -1, pPlayer.GetNpc().nIndex);
	pPlayer.AddExp(CTC.ExpProtect);
	--pPlayer.Earn(CTC.CoinProtect,0);
	
	--local nPoint = 10 ;
	local newpos = CTC:FindPosTong(CTC.Result,pPlayer.dwTongId);
	CTC.Result[newpos][2] =  CTC.Result[newpos][2] + CTC.Point[3];
	pPlayer.Msg("Bảo vệ trụ thành công <color=yellow>+ "..CTC.Point[3].." điểm<color>");
	----------------
--	pPlayer.Msg(szMsg);

end
--script\CTC\npc\longtru.lua
