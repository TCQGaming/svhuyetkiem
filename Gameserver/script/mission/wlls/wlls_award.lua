--联赛奖励
--孙多良
--2008.09.23

--单场比赛奖励，1为获胜，2为平，3为输, 4为轮空获胜
function Wlls:MacthAward(szLeagueName, szMatchLeagueName, tbMisPlayerList, nResult, nMacthTime)
	if (GLOBAL_AGENT) then
		Wlls:GbWllsMacthAward(szLeagueName, szMatchLeagueName, tbMisPlayerList, nResult, nMacthTime)
		return 0;
	end
	
	local tbMsg = 
	{
		[1] = {string.format("<color=yellow>Đội bạn đã đánh bại đội %s xin chúc mừng<color>", szMatchLeagueName or "")},
		[2] = {string.format("<color=green>Đội bạn hòa với %s hãy cố gắng vào lần sau.<color>", szMatchLeagueName or "")},
		[3] = {string.format("<color=blue>Đội bạn đã thua đội %s  hãy cố gắng vào lần sau.<color>", szMatchLeagueName or "")},
		[4] = {string.format("<color=yellow>Đội bạn đã rời trò chơi trực tiếp giành chiến thắng<color>")},
	}
	
	local nLeagueTotal 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TOTAL);
	local nLeagueWin 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_WIN);
	local nLeagueTie 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIE);
	local nLeagueTime 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIME);
	local nGameLevel 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MLEVEL);
	local nSession 		= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MSESSION);	
	local nReadyId		= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_ATTEND);
	if nResult == 3 then
		--负方不累计比赛时间
		nMacthTime = 0;
	end
	local tbPlayerList = {};
	local tbPlayerObjList = {};
	--加荣誉点
	for _, szMemberName in ipairs(Wlls:GetLeagueMemberList(szLeagueName)) do
		local nHonor = 0;
		if nResult == 1 or nResult == 4 then
			if Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Win.honor then
				nHonor = tonumber(Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Win.honor[1]);
			end
		end
		if nResult == 2 then
			if Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Tie.honor then
				nHonor = tonumber(Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Tie.honor[1]);
			end
		end
		if nResult == 3 then
			if Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Lost.honor then
				nHonor = tonumber(Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Lost.honor[1]);
			end
		end
		Wlls:AddHonor(szMemberName, nHonor);
		local nId = KGCPlayer.GetPlayerIdByName(szMemberName);
		tbPlayerList[nId] = szMemberName;
	end
	for nId, szName in pairs(tbPlayerList) do
		local pPlayer = KPlayer.GetPlayerObjById(nId);
		if pPlayer then
			pPlayer.Msg(tbMsg[nResult][1]);
			Dialog:SendBlackBoardMsg(pPlayer, tbMsg[nResult][1])
			--奖励
			pPlayer.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_TOTLE, pPlayer.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_TOTLE) + 1);
			pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE, nLeagueTotal + 1);
			if nResult == 1 or nResult == 4 then
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_WIN, pPlayer.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_WIN) + 1);
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_WIN, nLeagueWin + 1);
				Wlls.Fun:DoExcute(pPlayer, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Win);
				pPlayer.SendMsgToFriend("Hão hưu của bạn [" ..pPlayer.szName.. "] giành chiến thằng trong Võ Lâm Liên Đấu.");
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_WIN_AWARD, 10);
			end
			
			if nResult == 2 then
				pPlayer.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_TIE, pPlayer.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_TIE) + 1);
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TIE, nLeagueTie + 1);
				Wlls.Fun:DoExcute(pPlayer, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Tie);
			end
			if nResult == 3 then
				Wlls.Fun:DoExcute(pPlayer, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Lost);
			end
			table.insert(tbPlayerObjList, pPlayer);
			
			-- 统计玩家参加武林联赛的场次
			Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_WLLS, 1);
		else
			--不在线,下次上线自动给予.
			League:SetMemberTask(self.LGTYPE, szLeagueName, szName, self.LGMTASK_AWARD, nResult)
		end
		Wlls:WriteLog(string.format("奖励队员:%s，%s Vs %s，结果:%s", szName, szLeagueName, (szMatchLeagueName or ""), nResult))
	end
	
	if Wlls:GetMacthState() == Wlls.DEF_STATE_ADVMATCH then
		local nRank   = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK);
		local nVsRank = 0;
		if szMatchLeagueName then
			nVsRank = League:GetLeagueTask(Wlls.LGTYPE, szMatchLeagueName, Wlls.LGTASK_RANK);
		end
		if Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 8 then
			if nResult == 1 or nResult == 4 or (nResult == 2 and nRank < nVsRank) then
				local nSeries = Wlls:GetAdvMatchSeries(nRank, 8);
				Wlls.AdvMatchLists[nReadyId][4][nSeries] = Wlls.AdvMatchLists[nReadyId][8][nRank];
				League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV, 4);
			end
		elseif Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 4 then
			if nResult == 1 or nResult == 4  or (nResult == 2 and nRank < nVsRank) then
				local nSeries = Wlls:GetAdvMatchSeries(nRank, 4);
				Wlls.AdvMatchLists[nReadyId][2][nSeries] = Wlls.AdvMatchLists[nReadyId][8][nRank];
				League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV, 2);
			end			
		elseif Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 2 then
			local nSeries = Wlls:GetAdvMatchSeries(nRank, 2);
			Wlls.AdvMatchLists[nReadyId][2][nSeries].tbResult[Wlls.AdvMatchState - 2] = nResult;
			--if Wlls.AdvMatchState == 5 then
			--	Wlls:SetAdvMacthResult();
			--end
		end
	else
		if nResult == 1 or nResult == 4 then
			League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_WIN, nLeagueWin + 1 );
			Wlls:WriteLog(string.format("胜利增加胜利场次:%s", szLeagueName));
		elseif nResult == 2 then
			League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIE, nLeagueTie + 1);
		end
		League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TOTAL, nLeagueTotal + 1);
		League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIME, nLeagueTime + nMacthTime);
	end
	League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ENTER, 0);
	--增加亲密度：
	for i =1, #tbPlayerObjList do 
		for j = i + 1, #tbPlayerObjList do
			if (tbPlayerObjList[i].IsFriendRelation(tbPlayerObjList[j].szName) == 1) then
				Relation:AddFriendFavor(tbPlayerObjList[i].szName, tbPlayerObjList[j].szName, 50);
				tbPlayerObjList[i].Msg(string.format("Bạn và <color=yellow>%s<color> vừa được tăng %d điểm thân mật.", tbPlayerObjList[j].szName, 50));
				tbPlayerObjList[j].Msg(string.format("Bạn và <color=yellow>%s<color> vừa được tăng  %d điểm thân mật.", tbPlayerObjList[i].szName, 50));
			end
		end
	end
end

function Wlls:GbWllsMacthAward(szLeagueName, szMatchLeagueName, tbMisPlayerList, nResult, nMacthTime)
	if (not GLOBAL_AGENT) then
		return 0;
	end
	local tbMsg = 
	{
		[1] = {string.format("<color=yellow>Đội bạn đã đánh bại đội %s xin chúc mừng<color>", szMatchLeagueName or "")},
		[2] = {string.format("<color=green>Đội bạn hòa với %s hãy cố gắng vào lần sau.<color>", szMatchLeagueName or "")},
		[3] = {string.format("<color=blue>Đội bạn đã thua đội %s  hãy cố gắng vào lần sau.<color>", szMatchLeagueName or "")},
		[4] = {string.format("<color=yellow>Đội bạn đã rời trò chơi trực tiếp giành chiến thắng<color>")},

	}
	
	local nLeagueTotal 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TOTAL);
	local nLeagueWin 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_WIN);
	local nLeagueTie 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIE);
	local nLeagueTime 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIME);
	local nGameLevel 	= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MLEVEL);
	local nSession 		= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MSESSION);	
	local nReadyId		= League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_ATTEND);
	local tbMemberList	= Wlls:GetLeagueMemberList(szLeagueName);
	for _, szMemberName in ipairs(tbMemberList) do
		Dbg:WriteLogEx(Dbg.LOG_INFO, "GbWllsMacthAward", szMemberName, szLeagueName, nResult, nMacthTime);
	end
	if nResult == 3 then
		--负方不累计比赛时间
		nMacthTime = 0;
	end
	local tbPlayerList = {};
	local tbPlayerObjList = {};
	--加荣誉点
	for _, szMemberName in ipairs(tbMemberList) do
		local nId = KGCPlayer.GetPlayerIdByName(szMemberName);
		tbPlayerList[nId] = szMemberName;
	end
	for nId, szName in pairs(tbPlayerList) do
		local pPlayer = KPlayer.GetPlayerObjById(nId);
		if pPlayer then
			pPlayer.Msg(tbMsg[nResult][1]);
			Dialog:SendBlackBoardMsg(pPlayer, tbMsg[nResult][1])
		end
		if nResult == 1 or nResult == 4 then
			GbWlls:SetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_WIN_AWARD, GbWlls:GetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_WIN_AWARD) + 1);
			GbWlls:SetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_DAILY_RESULT, GetTime());
		end
		if nResult == 2 then
			GbWlls:SetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_TIE_AWARD, GbWlls:GetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_TIE_AWARD) + 1);
		end
		if nResult == 3 then
			GbWlls:SetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_LOSE_AWARD, GbWlls:GetPlayerSportTask(szName, GbWlls.GBTASKID_MATCH_LOSE_AWARD) + 1);
		end		
		Wlls:WriteLog(string.format("[跨服联赛]奖励队员:%s，%s Vs %s，结果:%s", szName, szLeagueName, (szMatchLeagueName or ""), nResult))
	end
	
	if Wlls:GetMacthState() == Wlls.DEF_STATE_ADVMATCH then
		local nRank   = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK);
		local nVsRank = 0;
		if szMatchLeagueName then
			nVsRank = League:GetLeagueTask(Wlls.LGTYPE, szMatchLeagueName, Wlls.LGTASK_RANK);
		end
		if Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 8 then
			if nResult == 1 or nResult == 4 or (nResult == 2 and nRank < nVsRank) then
				local nSeries = Wlls:GetAdvMatchSeries(nRank, 8);
				Wlls.AdvMatchLists[nReadyId][4][nSeries] = Wlls.AdvMatchLists[nReadyId][8][nRank];
				League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV, 4);
				self:SetTeamPlayerAdvRank(szLeagueName, 4);
			end
		elseif Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 4 then
			if nResult == 1 or nResult == 4  or (nResult == 2 and nRank < nVsRank) then
				local nSeries = Wlls:GetAdvMatchSeries(nRank, 4);
				Wlls.AdvMatchLists[nReadyId][2][nSeries] = Wlls.AdvMatchLists[nReadyId][8][nRank];
				League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV, 2);
				self:SetTeamPlayerAdvRank(szLeagueName, 2);
			end			
		elseif Wlls.MACTH_STATE_ADV_TASK[Wlls.AdvMatchState] == 2 then
			local nSeries = Wlls:GetAdvMatchSeries(nRank, 2);
			Wlls.AdvMatchLists[nReadyId][2][nSeries].tbResult[Wlls.AdvMatchState - 2] = nResult;
			--if Wlls.AdvMatchState == 5 then
			--	Wlls:SetAdvMacthResult();
			--end
		end
	else
		if nResult == 1 or nResult == 4 then
			League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_WIN, nLeagueWin + 1 );
			Wlls:WriteLog(string.format("[跨服联赛]胜利增加胜利场次:%s", szLeagueName));
		elseif nResult == 2 then
			League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIE, nLeagueTie + 1);
		end
		League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TOTAL, nLeagueTotal + 1);
		League:SetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIME, nLeagueTime + nMacthTime);
	end
	League:SetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ENTER, 0);
end

--检查领取单场胜利奖项
function Wlls:OnCheckAwardSingle(pPlayer)
	if pPlayer.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_WIN_AWARD) == 10 then
		return 1;
	end
	return 0;
end

--领取单场胜利奖励
function Wlls:OnGetAwardSingle()
	if Wlls:OnCheckAwardSingle(me) == 0 then
		return 0;
	end
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("Wlls", me); 
	
	if me.CountFreeBagCell() < (1 + nFreeCount) then
		Dialog:Say(string.format("Hành trang cần %s ô trống", (1 + nFreeCount)));
		return 0;
	end
	-- local pItem = me.AddItem(18,1,259,1);
	-- if pItem then
		-- me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_WIN_AWARD, 0);
	-- end
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	ConfigAll.ThuongThangTranLienDau();
	Dialog:Say("Bạn đã nhận được <color=yellow>Quà giải đấu<color>。");
end

--最终奖励，有奖励时优先弹出奖励选项
function Wlls:OnCheckAward(pPlayer, nGameLevel)
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, pPlayer.szName);
	if not szLeagueName then
		return 0, 0, "Bạn không có đội。";
	end
	
	local szGameLevelName = Wlls.MACTH_LEVEL_NAME[nGameLevel];
	if nGameLevel ~= League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL) then
		return 0, 0 ,string.format("Bạn không phải người tham gia %s.", szGameLevelName);
	end
	
	if Wlls:GetMacthState() ~= Wlls.DEF_STATE_REST or KGblTask.SCGetDbTaskInt(Wlls.GTASK_MACTH_RANK) < Wlls:GetMacthSession() then
		return 0, 0, string.format("Thời gian thi đấu vẫn chưa kết thúc hoặc bảng xếp hạng cuối cùng của cuộc thi vẫn chưa được công bố, hãy kiên nhẫn");		
	end
	
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TOTAL) <= 0 then
		return 0, 0, string.format("Đội của bạn chưa tham gia cuộc thi. Đây là đội mới và không thể nhận phần thưởng.");	
	end
	local nRank = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK);
	local nTotle = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TOTAL);
	local nSession = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION);
	local nAdvRank = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV);
	
	if pPlayer.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_FINISH) >= nSession then
		return 0, 0 , string.format("Bạn đã nhận được phần thưởng。");
	end	
	
	
	if nRank == 1 and nAdvRank == 2 then
		nRank = 2;
	end	
	local nGameType = Wlls:GetMacthType(nSession)
	local nLevelSep, nMaxRank = Wlls:GetAwardLevelSep(nGameLevel, nSession, nRank);
	if nLevelSep <= 0 then
		return 0, 0, string.format("Nhóm bạn không có trong BXH.");
	end
	if nMaxRank >= 10000 and nTotle < math.floor(nMaxRank/10000) then
		return 0, 0 , string.format("Đội của bạn không nhận được phần thưởng nào trong cuộc thi này, hãy tiếp tục cố gắng trong cuộc thi tiếp theo.");
	end
	return 1, nRank , string.format("Nhận giải thưởng");
end


--领取最终奖励
function Wlls:OnGetAward(nGameLevel, nFlag)
	local nCheck,nRank,szError = Wlls:OnCheckAward(me, nGameLevel);
	if nCheck == 0 then
		Dialog:Say(szError);
		return 0;
	end
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	local nSession = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MSESSION);
	local nGameType = Wlls:GetMacthType(nSession);
	local nLevelSep, nMaxRank = Wlls:GetAwardLevelSep(nGameLevel, nSession, nRank);
	
	if not nFlag then
		local szMsg = string.format("Võ Lâm Liên Đấu: Đội của bạn đã giành được hạng <color=yellow>%s <color> gần đây nhất. Sau khi nhận được phần thưởng, bạn sẽ rút khỏi đội. Nếu đội không còn thành viên nào, đội sẽ bị giải tán .", nRank);
		local tbOpt = 
		{
			{"Nhận Thưởng",self.OnGetAward, self, nGameLevel, 1},
			{"Để sau"},
		}
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	local nFree = Wlls.Fun:GetNeedFree(Wlls.AWARD_FINISH_LIST[nGameLevel][nSession][nLevelSep]);
	if me.CountFreeBagCell() < nFree then
		Dialog:Say(string.format("Hành trang cần %s ô trống.", nFree));
		return 0;
	end
	
	--变量设置
	if nRank == 1 then
		me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_FIRST, me.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_FIRST) + 1);
		local pTong = KTong.GetTong(me.dwTongId);
		if pTong and nSession then
			pTong.AddHistoryLadder(me.szName, tostring(nSession), "Quán Quân"); 
			pTong.AddAffairLadder(me.szName, tostring(nSession), "Quán Quân");
			GCExcute{"Wlls:AddAffairLadder", me.dwTongId, me.szName, nSession, "Quán Quân"};
		end
		
	ConfigAll.ThuongTop1LienDau();
	end
	if nRank == 2 then
		me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_SECOND, me.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_SECOND) + 1);
		local pTong = KTong.GetTong(me.dwTongId);
		if pTong and nSession then 
			pTong.AddHistoryLadder(me.szName, tostring(nSession), "Á Quân");
			pTong.AddAffairLadder(me.szName, tostring(nSession), "Á Quân");
			GCExcute{"Wlls:AddAffairLadder", me.dwTongId, me.szName, nSession, "Á Quân"};
		end
			ConfigAll.ThuongTop2LienDau();
	end
	if nRank == 3 then
		me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_THIRD, me.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_THIRD) + 1);
		local pTong = KTong.GetTong(me.dwTongId);
		if pTong then 
			pTong.AddHistoryLadder(me.szName, tostring(nSession), "Hạng 3");
			pTong.AddAffairLadder(me.szName, tostring(nSession), "Hạng 3");
			GCExcute{"Wlls:AddAffairLadder", me.dwTongId, me.szName, nSession, "Hạng 3"};
		end
					ConfigAll.ThuongTop3LienDau();
	end	
	
if nRank >= 4 and nRank <= 10 then
    ConfigAll.ThuongTop4Den10LienDau();
end

	if me.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_BEST) > nRank then
		me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_BEST, nRank);
	end
	if me.GetTask(self.TASKID_GROUP, self.TASKID_MATCH_BEST) == 0 then
		me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_BEST, nRank);
	end
	
	me.SetTask(self.TASKID_GROUP, self.TASKID_MATCH_FINISH, nSession);
	local nLogTaskFlag = nSession + nLevelSep * 1000 + nGameLevel * 1000000;
	me.SetTask(self.TASKID_GROUP, self.TASKID_AWARD_LOG, nLogTaskFlag);	
	

	Wlls.Fun:DoExcute(me, Wlls.AWARD_FINISH_LIST[nGameLevel][nSession][nLevelSep]);
	

	local nTotle = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TOTAL);

local szLogMsg = string.format("Người chơi: %s - Số trận tham gia: %s - Hạng: %s, đã nhận phần thưởng Liên Đấu.", me.szName, nTotle, nRank)
local szLogFileName = "\\script\\global\\tcqgaming\\GM\\admin_logs\\liendau.txt" 
local szLogContent = szLogMsg .. "\n"
KFile.WriteFile(szLogFileName, szLogContent, true) -- Nếu bạn muốn ghi tiếp vào cuối file

	GCExcute{"Wlls:LeaveLeague", me.szName, nGameLevel, 1};
	Dialog:Say("Bạn đã nhận phần thưởng thành công và thoát khỏi đội. Hoan nghênh bạn tiếp tục tham gia giải đấu tiếp theo.");

end

--玩家登陆补领奖励.
function Wlls:OnLogin()
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if szLeagueName then
		local nLeagueTotal = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TOTAL);
		local nLeagueWin = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_WIN);
		local nLeagueTie = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIE);
		local nLeagueTime = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_TIME);
		local nGameLevel = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MLEVEL);
		local nSession = League:GetLeagueTask(self.LGTYPE, szLeagueName, self.LGTASK_MSESSION);
		
		if nSession > me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_SESSION) then
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_SESSION, nSession);
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE, nLeagueTotal);
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_WIN, nLeagueWin);
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TIE, nLeagueTie);	
		end
		if me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE) ~= nLeagueTotal then
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE, nLeagueTotal);
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_WIN, nLeagueWin);
			me.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TIE, nLeagueTie);		
		end
		local nResult = League:GetMemberTask(self.LGTYPE, szLeagueName, me.szName, self.LGMTASK_AWARD);
		if nResult == 0 then
			return 0
		end
		if nResult == 1 or nResult == 4 then
			--获胜奖励
			Wlls.Fun:DoExcute(me, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Win);
			
		end
		if nResult == 2 then
			--平奖励
			Wlls.Fun:DoExcute(me, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Tie);
		end
		
		if nResult == 3 then
			--负奖励
			Wlls.Fun:DoExcute(me, Wlls.AWARD_SINGLE_LIST[nGameLevel][nSession].Lost);
		end
		League:SetMemberTask(self.LGTYPE, szLeagueName, me.szName, self.LGMTASK_AWARD, 0);
		-- Wlls:WriteLog("成功补领单场奖励", me.nId);
	end
end
