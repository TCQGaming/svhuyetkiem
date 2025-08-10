-------------------------------------------------------------------
--File: 	factionbattle_sub.lua
--Author: 	zhengyuhua
--Date: 	2008-2-25 9:51
--Describe:	Môn phái thi đấu thể thao Tử công năng 
-------------------------------------------------------------------
-- cấp một cái ngoạn gia cái rương 
function FactionBattle:GiveABoxPlayer(pPlayer)
	if not pPlayer then
		return 0;
	end
	if pPlayer.CountFreeBagCell() <1 then	-- ba lô không gian bất túc 
		pPlayer.Msg("Túi Không đủ chỗ trống")
		return 0;
	end
	pPlayer.AddScriptItem(unpack(self.AWARD_ITEM_ID));
end

-- ở một cái điểm tổ trung cà ra thưởng cho đạo cụ 
function FactionBattle:FlushAwardItem(nMapId, tbPoint, nIndex, nPlayerCount)
	local nItemNum = 0;
	for i = 1, 5 do
		if self.PLAYER_COUNT_LIMIT[i] <= nPlayerCount then
			nItemNum = self.BOX_NUM[nIndex][i + 1];
		end
	end
	local nPointCount = #tbPoint;
	if nItemNum> nPointCount then
		nItemNum = nPointCount;
	end
	local tbParam = {};
	tbParam.tbTable = self;
	tbParam.fnAwardFunction = self.GiveABoxPlayer
	for i = 1, nItemNum do
		local nRand = MathRandom(nPointCount - i + 1);
		local tbTemp = tbPoint[nRand + i - 1];
		tbPoint[nRand + i - 1] = tbPoint[i];
		tbPoint[i] = tbTemp; 
		Npc.tbXiangZiNpc:AddBox(
			nMapId, 
			tbPoint[i].nX, 
			tbPoint[i].nY, 
			FactionBattle.TAKE_BOX_TIME * Env.GAME_FPS, 
			tbParam,
			1,
			60 * 18
		);
	end
	return 0;
end

function FactionBattle:AwardChampionStart(nFaction, nWinnerId)
local nWeek = tonumber(GetLocalDate("%w"))
        local szMsg = ""
	local pFlagNpc
if nWeek == 2 then  -- Thứ 3
	 pFlagNpc = KNpc.Add2(
		self.FLAG_NPC_TAMPLATE_ID, 
		10, 
		-1, 
		self.ThiDauMonPhai_TO_MAP[nFaction], 
		self.FLAG_X, 
		self.FLAG_Y
	);
elseif nWeek == 5 then  -- Thứ 6
	 pFlagNpc = KNpc.Add2(
		self.FLAG_NPC_TAMPLATE_ID, 
		10, 
		-1, 
		self.FACTION_TO_MAP[nFaction], 
		self.FLAG_X, 
		self.FLAG_Y
	);
end 

	local tbTemp = pFlagNpc.GetTempTable("FactionBattle");
	tbTemp.tbFactionData = {};
	tbTemp.tbFactionData.nWinnerId = nWinnerId;
	tbTemp.tbFactionData.nFlagTimerId = Timer:Register(
		self.FLAG_EXIST_TIME * Env.GAME_FPS,
		self.CancelAwardChampion,
		self,
		pFlagNpc.dwId
	);
end

-- Thi triển quán quân trao tặng 
function FactionBattle:ExcuteAwardChampion(pPlayer, pNpc)
	local tbTemp = pNpc.GetTempTable("FactionBattle");
	if (not tbTemp.tbFactionData) or 
		(not tbTemp.tbFactionData.nWinnerId) or
		(tbTemp.tbFactionData.nWinnerId ~= pPlayer.nId) then
		return 0;
	end
	-- trao tặng xưng hào 
	pPlayer.AddTitle(self.TITLE_GROUP, self.TITLE_ID, pPlayer.nFaction, 0);
	-- đặc hiệu 
	pPlayer.CastSkill(self.YANHUA_SKILL_ID, 1, -1, pPlayer.GetNpc().nIndex);
	-- thưởng cho 
	local tbPlayer = KPlayer.GetMapPlayer(pNpc.nMapId);
	local nPlayerCount = #tbPlayer;
	self:FlushAwardItem(
		pNpc.nMapId, 
		self.tbBoxPoint[9],
		5,
		nPlayerCount
	);	-- đến lúc 
	local nNpcMapId, nNpcPosX, nNpcPosY = pNpc.GetWorldPos();
	--cà ra Lửa trại 
	local tbNpc	= Npc:GetClass("gouhuonpc");
	local pGouHuoNpc	= KNpc.Add2(self.GOUHUO_NPC_ID, 1, -1, nNpcMapId, nNpcPosX, nNpcPosY);		-- thu được Lửa trại Npc
	--Lửa trại tham số ： Id， loại hình ， duy trì liên tục thời gian ，toát ra thời gian ，phạm vi (ô vuông đường kính)，bội tỷ số ，rượu có hữu hiệu hay không ，sửa chữa châu có hữu hiệu hay không 
	tbNpc:InitGouHuo(pGouHuoNpc.dwId, 0, self.GOUHUO_EXISTENTIME, 5, 90, self.GOUHUO_BASEMULTIP, 0, 0);
	tbNpc:StartNpcTimer(pGouHuoNpc.dwId)
	local tbData = self:GetFactionData(pPlayer.nFaction);
	tbData:MsgToMapPlayer("con người mới vương sinh ra ，ở lĩnh tưởng chung quanh đài năng duy trì liên tục thu được dày kinh nghiệm thưởng cho 。")	
	
	Timer:Close(tbTemp.tbFactionData.nFlagTimerId);
	pNpc.Delete();
	tbData:ShutDown(1);		-- kết thúc mỹ mãn 
end

-- quán quân trao tặng cực kỳ thì 
function FactionBattle:CancelAwardChampion(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local tbTemp = pNpc.GetTempTable("FactionBattle");
	if (tbTemp.tbFactionData) and (tbTemp.tbFactionData.nWinnerId) then
		local pPlayer = KPlayer.GetPlayerObjById(tbTemp.tbFactionData.nWinnerId);
		if pPlayer then
			Dbg:WriteLog("FactionBattle","nhân cực kỳ khi thì một lĩnh đáo quán quân thưởng cho", pPlayer.szName, pPlayer.szAccount);
		end
	end
	pNpc.Delete();
end

-- tấn cấp tặng lễ 
function FactionBattle:PromotionAward(nMapId, nArenaId, nIndex, nPlayer1Id, nPlayer2Id, nPlayerCount)
	if not self.tbBoxPoint then
		return 0;
	end
	
	Timer:Register(self.ADD_BOX_DELAY * Env.GAME_FPS, 
		self.FlushAwardItem,
		self,
		nMapId, 
		self.tbBoxPoint[nArenaId],
		nIndex,
		nPlayerCount
	);
end

-- vi tích phân đổi kinh nghiệm công năng 
function FactionBattle:ExchangeExp(nPlayerId, bConfirm)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local nGroupId = self.TASK_GROUP_ID;
	local nDegreeId = self.DEGREE_TASK_ID;
	local nScoreId = self.SCORE_TASK_ID;
	local nElimatId = self.ELIMINATION_TASK_ID;
	local nScore = pPlayer.GetTask(nGroupId, nScoreId);
	local nElimat = pPlayer.GetTask(nGroupId, nElimatId);
	if self:CheckDegree(pPlayer) == 0 then	-- kiểm tra giới sổ 
		nScore = 0;
		nElimat = 0;
	end
	local nFlag = self:GetBattleFlag(pPlayer.nFaction);
	if nFlag == 1 then
		Dialog:Say("Thi đấu môn phái đang tiến hành, bạn k thể nhận phần thưởng");
		return 0;
	end
	if nScore == 0 and nElimat <= 2 then
	Dialog:Say("Ngươi đã nhận quà rồi hoặc không vào top 16 cường nên không thể nhận quà này");
		return 0;
	end
	local nExp = math.floor((nScore / 4800) * pPlayer.GetBaseAwardExp() * 90);
	local nXiangZi = math.floor(nScore / 2400);
	local nWeiWang = 0;
	if nScore>= 4800 then
		nWeiWang = 8;
	elseif nScore>= 4000 then
		nWeiWang = 6;
	elseif nScore>= 3200 then
		nWeiWang = 5;
	elseif nScore>= 2400 then
		nWeiWang = 4;
	end
	local nExpEx = 0;
	local nXiangZiEx = 0;
	local szTitle ="";
	local nRank = 100;
	
	local nWeek = tonumber(GetLocalDate("%w"))

	if nElimat> 2 then
		if self.BOX_NUM[nElimat - 2][1] == 1 then
	if nWeek == 2 then  -- Thứ 3
				szTitle ="Thu được <color=red>Quán Quân Loạn Môn Phái<color>";
	elseif nWeek == 5 then  -- Thứ 6
					szTitle ="Thu được <color=red>Quán Quân Thi Đấu Môn Phái<color>";
	end 
		else
			szTitle ="Tiến nhập <color=red>"..self.BOX_NUM[nElimat - 2][1].."cường <color>";
		end
		if self.BOX_NUM[nElimat - 2][1] then
			nRank = self.BOX_NUM[nElimat - 2][1]
		end
		nExpEx = self.AWARD_TABLE[nElimat][4] * pPlayer.GetBaseAwardExp();
		nXiangZiEx = self.AWARD_TABLE[nElimat][5];
	end
	local nFreeCount, tbExecute, szExtendInfo = SpecialEvent.ExtendAward:DoCheck("FactionBattle", pPlayer, nScore, nRank, (nXiangZi + nXiangZiEx));
	if bConfirm == 1 then
		if pPlayer.CountFreeBagCell() <nXiangZi + nXiangZiEx + nFreeCount then
			local szError = string.format("Hành Trang không đủ chỗ trống,ngươi cần <color=green>%s<color>một không gian lĩnh thưởng cho", nXiangZi + nXiangZiEx + nFreeCount)
			pPlayer.Msg(szError);
			return 0;
		end
		for i = 1, nXiangZi + nXiangZiEx do
			pPlayer.AddScriptItem(unpack(self.AWARD_ITEM_ID));
		end

		pPlayer.AddExp(nExp + nExpEx);
		pPlayer.AddKinReputeEntry(nWeiWang,"factionbattle");
		pPlayer.SetTask(nGroupId, nScoreId, 0);	-- vi tích phân thanh linh 
		pPlayer.SetTask(nGroupId, nElimatId, 0); -- thanh đấu loại thành tích 
		SpecialEvent.ExtendAward:DoExecute(tbExecute);
		
		-- vi ngoạn gia tham gia Môn phái thi đấu thể thao đích đếm hết gia 1
		Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_FACTION, 1);
				local nMoKhamNam = ConfigAll.OpenKham
	----------------Phan Thuong top 1
	if self.BOX_NUM[nElimat - 2][1] == 1 then
	ConfigAll.LoanPhaiTOP1()
	local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP1	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end			
	---------------Đây là top 2
	if self.BOX_NUM[nElimat - 2][1] == 2 then
	ConfigAll.LoanPhaiTOP2()
		local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP2
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
		---------------Đây là top 3
	if self.BOX_NUM[nElimat - 2][1] == 3 then
	ConfigAll.LoanPhaiTOP3()
		local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP3va4	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
		---------------Đây là top 4
	if self.BOX_NUM[nElimat - 2][1] == 4 then
	ConfigAll.LoanPhaiTOP4()
			local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP3va4	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
		---------------Đây là top 5
	if self.BOX_NUM[nElimat - 2][1] == 5 then
	ConfigAll.LoanPhaiTOP_5_16()
			local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP5va8	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
			---------------Đây là top 6
	if self.BOX_NUM[nElimat - 2][1] == 6 then
	ConfigAll.LoanPhaiTOP_5_16()
				local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP5va8	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	---------------Đây là top 7
	if self.BOX_NUM[nElimat - 2][1] == 7 then
	ConfigAll.LoanPhaiTOP_5_16()
				local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP5va8	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	---------------Đây là top 8
	if self.BOX_NUM[nElimat - 2][1] == 8 then
	ConfigAll.LoanPhaiTOP_5_16()
				local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP5va8	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 9 then
	ConfigAll.LoanPhaiTOP_5_16()
				local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 10 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 11 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 12 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 13 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 14 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 15 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	if self.BOX_NUM[nElimat - 2][1] == 16 then
	ConfigAll.LoanPhaiTOP_5_16()
					local nSoLuongRuongDa = ConfigAll.nSoRuong_LoanPhai_TOP9va16	
		if nMoKhamNam == 1 then 
		pPlayer.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	end	
	-------------------------------------------------------------------		
		return 0;
	end
	local szMsg = string.format("Ngươi đã đạt <color=green>%s điểm Loạn Phái<color>\nNên phần thưởng ngươi nhận được là\n*<color=green>%s Kinh nghiệm\n<color>*<color=green>%s Bảo rương \n", 
		nScore, nExp, nXiangZi);
	if nElimat> 2 then
		szMsg = szMsg..string.format("Xét thấy ngươi ở đây thi đấu đã hết sức mình ，"..szTitle.."，Do dó tặng ngươi thêm phần thường:\n <color=green>%s<color> Kinh nghiệm\n<color=green>%s<color> Bảo rương \n",
			nExpEx, nXiangZiEx);
	end
	Dialog:Say(szMsg..szExtendInfo,
		{
			{"Ta muốn nhận thưởng", self.ExchangeExp, self, me.nId, 1},
			{"Ta muốn suy nghĩ một chút"},
		})
end

-- vi người tham gia tăng tâm đắc 、uy vọng 、danh vọng 
function FactionBattle:AwardAttender(pPlayer, nIndex)
	self:CheckDegree(pPlayer);
	if pPlayer then
		local nOldIndex = pPlayer.GetTask(self.TASK_GROUP_ID, self.ELIMINATION_TASK_ID);
		Setting:SetGlobalObj(pPlayer);
		for i = nOldIndex + 1, nIndex do
			Task:AddInsight(self.AWARD_TABLE[i][1]);
			pPlayer.AddKinReputeEntry(self.AWARD_TABLE[i][2],"factionbattle");		-- uy vọng 
			pPlayer.AddRepute(Player.CAMP_FACTION, me.nFaction, self.AWARD_TABLE[i][3]);
			
			-- vinh dự 
			self:AddFactionHonor(pPlayer, self.AWARD_TABLE[i][7]);
					
			-- ghi lại bỉ tái thành tích nhiệm vụ lượng biến đổi 
			pPlayer.SetTask(self.TASK_GROUP_ID, self.ELIMINATION_TASK_ID, nIndex); 
			
			-- tăng kiến thiết tài chính và cá nhân 、bang chủ 、tộc trưởng đích công ty cổ phần 
			print(pPlayer.szName, self.AWARD_TABLE[i][6], 0.7, 0.2, 0.05, 0, 0.05)
			Tong:AddStockBaseCount_GS1(pPlayer.nId, self.AWARD_TABLE[i][6], 0.7, 0.2, 0.05, 0, 0.05);
		end
		Setting:RestoreGlobalObj();
	end
end

-- gia Môn phái vinh dự 
function FactionBattle:AddFactionHonor(pPlayer, nHornor)
	local nFaction = pPlayer.nFaction;
	PlayerHonor:AddPlayerHonor(pPlayer, self.HONOR_CLASS, self.HONOR_WULIN_TYPE, nHornor);
end

function FactionBattle:CheckDegree(pPlayer)
	if not pPlayer then
		return 0;
	end
	local nGroupId = self.TASK_GROUP_ID;
	local nDegreeId = self.DEGREE_TASK_ID;
	local nScoreId = self.SCORE_TASK_ID;
	local nElimatId = self.ELIMINATION_TASK_ID;
	local nDegree =	pPlayer.GetTask(nGroupId, nDegreeId)
	local nCurDegree = GetFactionBattleCurId();
	if nCurDegree ~= nDegree then	-- giới sổ bất đồng ，vi tích phân vô hiệu ~thanh vi tích phân 
		pPlayer.SetTask(nGroupId, nDegreeId, nCurDegree);
		pPlayer.SetTask(nGroupId, nScoreId, 0);
		pPlayer.SetTask(nGroupId, nElimatId, 0);
		return 0;
	end
	return 1;
end
