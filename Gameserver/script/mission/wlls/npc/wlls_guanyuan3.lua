--联赛会场官员
--孙多良
--2008.09.12

local tbNpc = Npc:GetClass("wlls_guanyuan3");

function tbNpc:OnDialog()
	Player.tbOnlineExp:CloseOnlineExp();
	local nReturn, szMsgInFor = self:CreateMsg();
	local szMsg = string.format(szMsgInFor);
	local tbOpt = 
	{
		{"Tra cứu Thông Tin", Wlls.DialogNpc.QueryMatch, Wlls.DialogNpc},
		{"Kết thúc đối thoại"},
	};
	if (not GLOBAL_AGENT) then
		if Wlls:OnCheckAwardSingle(me) == 1 then
			szMsg = szMsg .. "\n\nMỗi lần đạt được thắng lợi đều có thể nhận một lễ túi ，Rương của bạn có hạn ，chỉ có thể bảo lưu một lần cuối cùng đích <color=yellow>liên kết lễ túi <color>，vi tránh cho tổn thất ，thỉnh các vị hiệp khách đúng lúc lai lĩnh 。";
			table.insert(tbOpt, 1, {"<color=yellow>Nhận Thưởng<color>", Wlls.OnGetAwardSingle, Wlls});
		end	
	end

	if nReturn == 1 then
		table.insert(tbOpt, 1, {"Tham gia", self.AttendGame, self});
	end

	if (not GLOBAL_AGENT) then
		if Wlls:GetMacthState() == Wlls.DEF_STATE_ADVMATCH then
			table.insert(tbOpt, 2, {"<color=yellow>Xem tình hình chiến sự<color>", Wlls.OnLookDialog, Wlls});	
		end
	end
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:AttendGame(nFlag)

	local tbMTCfg = Wlls:GetMacthTypeCfg(Wlls:GetMacthType());
	if (tbMTCfg) then
		local nSType = tbMTCfg.tbMacthCfg.nSeries;
		if (nSType and Wlls.LEAGUE_TYPE_SERIES_RESTRAINT == nSType) then
			local szLName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
			local tbLList	= Wlls:GetLeagueMemberList(szLName);
			local nSer=-1;
			if (tbLList) then
				for nId, szMName in ipairs(tbLList) do
					local nSeries	= League:GetMemberTask(Wlls.LGTYPE, szLName, szMName, Wlls.LGMTASK_SERIES);
					if (nSer == -1) then
						nSer = nSeries;
					else
						if (0 == Wlls:IsSeriesRestraint(nSer, nSeries)) then
							Dialog:Say("Thành viên trong đội có người không đúng ngũ hành báo danh trước");
							return;
						end;
					end;
				end;
			end;
		end;	
	end	
	
	local nReturn, szMsgInFor = self:CreateMsg();
	if nReturn == 0 then
		Dialog:Say(szMsgInFor);
		return 0;
	end
	if not nFlag then
		for _, tbItem in pairs(Wlls.ForbidItem) do
			if #me.FindItemInBags(unpack(tbItem)) > 0 then
				local szMsg = "Quan hội trường: <color=red>Cấm sử dụng rương thuốc<color> trong suốt quá trình thi đấu，Ngươi đã hiểu chưa？";
				local tbOpt = 
				{
					{"Ta hiểu rồi! Đưa ta đi", self.AttendGame, self, 1},
					{"Kết thúc đối thoại"},
				};
				Dialog:Say(szMsg, tbOpt);
				return 0;	
			end
		end
	end
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	local nPlayerCount = Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).tbMacthCfg.nPlayerCount;	
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ENTER) >= nPlayerCount and (not nFlag or nFlag == 1) then
		local szMsg = string.format("Quan Hội Trường ： Liên đoàn này chỉ cho phép <color=yellow>%s  người<color> tham gia cuộc thi. Nhóm của bạn đã có <color=yellow>%s <color> thành viên trong lĩnh vực chuẩn bị. Bạn sử dụng <color=yellow> làm người dự bị vào sân chuẩn bị <color>. Nếu người chơi khác rời khỏi sân chuẩn bị, bạn sẽ tự động biến <color=yellow> thành thành viên chính thức của trận đấu <color>.", nPlayerCount, nPlayerCount)
		local tbOpt = 
		{
			{"Ta hiểu rồi! Đưa ta đi", self.AttendGame, self, 2},
			{"Kết thúc đối thoại"},
		};
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end

	if Wlls:GetMacthLevelCfgType() == Wlls.MAP_LINK_TYPE_SERIES then
		--未开发
		--判断自己现在的五行和报名时战队记录中的五行是否相符，不符不允许进场；
		local nOrgSereis	= League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_SERIES);
		if (me.nSeries <= 0) then
			Dialog:Say("Quan Hội Trường: Ngươi mau đi nhập phái rồi đến đây");
			return 0;
		end
		if (nOrgSereis > 0 and nOrgSereis ~= me.nSeries) then
			local szOrgSereis = string.format(Wlls.SERIES_COLOR[nOrgSereis], Env.SERIES_NAME[nOrgSereis]);
			local szSereis = string.format(Wlls.SERIES_COLOR[me.nSeries], Env.SERIES_NAME[me.nSeries]);
			Dialog:Say(string.format("Quan Hội Trường ： Ngươi báo danh chính là <color=yellow>%s <color> Ngũ Hành, Vui lòng đổi sang <color=yellow>%s <color> Ngũ Hành mới có thể tham gia！\n", szOrgSereis, szOrgSereis));
			return 0;			
		end
	end	
	
	if Wlls:GetMacthLevelCfgType() == Wlls.MAP_LINK_TYPE_FACTION then
		--未开发
		--判断自己现在的门派和报名时战队记录中的五行是否相符，不符不允许进场；
		local nFaction	= League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_FACTION);
		if (nFaction ~= me.nFaction) then
			local szOrgFac	= Player:GetFactionRouteName(nFaction);
			local szNowFac	= Player:GetFactionRouteName(me.nFaction);
			local szMsg = string.format("Quan Hội Trường ： Ngươi báo danh chính là <color=yellow>%s <color> Phái,  Vui lòng đổi sang <color=yellow>%s <color> Phái mới có thể tham gia！\n", szOrgFac, szOrgFac)
			Dialog:Say(szMsg);
			return 0;
		end
	end
	
	local nSeriesType = Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).tbMacthCfg.nSeries;
	if (Wlls.LEAGUE_TYPE_SERIES_RESTRAINT == nSeriesType) then -- 五行相克赛
		local nSeries	= League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_SERIES);
		if (nSeries ~= me.nSeries) then
			local szOrg = Env.SERIES_NAME[nSeries];
			local szMsg = string.format("Quan Hội Trường ： Ngươi báo danh chính là Ngũ Hành Tương Khắc <color=yellow>%s <color> Vui lòng đổi sang<color=yellow>%s <color> mới có thể tham gia！\n", szOrg, szOrg);
			Dialog:Say(szMsg);
			return 0;
		end
	end
	
	local nGameLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	local nCaptain = League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_JOB);
	GCExcute{"Wlls:EnterReadyMap", me.nId, szLeagueName, nGameLevel, me.nMapId, {nFaction = me.nFaction, nSeries= me.nSeries, nCamp=me.GetCamp()}, nCaptain};
end

function tbNpc:CreateMsg()
	local nMacthType = Wlls:GetMacthType();
	local tbMacthCfg = Wlls:GetMacthTypeCfg(nMacthType);	
	if not tbMacthCfg then
		return 0, "Quan Hội Trường ： Võ Lâm Liên Đấu chưa mở";
	end
	if Wlls:GetMacthState() == Wlls.DEF_STATE_REST then
		return 0, "Quan Hội Trường ： Đang trong giai đoạn giải lao";
	end
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		return 0, "Quan Hội Trường ： Ngươi chưa thiết lập chiến đội";
	end
	
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION) ~= Wlls:GetMacthSession() then
		return 0, "Quan Hội Trường ： Cần tham đúng với những gì đã đăng ký. Vui lòng nhớ lại thông tin đăng ký và quay lại sau";
	end
	
	local nGameLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	local nTime = GetTime();
	--八强赛
	if Wlls:GetMacthState() == Wlls.DEF_STATE_ADVMATCH then
		if nGameLevel ~= Wlls.MACTH_ADV then
			return 0,"Quan Hội Trường ：bây giờ là cao cấp liên kết trận chung kết kỳ ，của ngươi chiến đội điều không phải cao cấp liên kết chiến đội ！";
		end
		
		if Wlls.AdvMatchState == 0 then
			return 0,"Quan Hội Trường ：bây giờ là cao cấp liên kết trận chung kết kỳ ，trận đầu bát cường thi đấu tương ở <color=yellow>19:00<color>mở ra ，thỉnh kiên trì đợi ！\n\n<color=yellow>ngươi khả dĩ ở bên trong hội trường án ～kiện kiểm tra thi đấu huống <color>";			
		end
		
		if Wlls:IsAdvMacthLeague(szLeagueName) ~= 1 then
			return 0,"Quan Hội Trường ：ngài điều không phải bổn tràng cao cấp liên kết trận chung kết kỳ đích chiến đội ，vô pháp tham gia bổn tràng trận chung kết kỳ đích bỉ tái 。\n\n<color=yellow>ngươi khả dĩ ở bên trong hội trường án ～kiện kiểm tra thi đấu huống <color>";
		end
		
		if Wlls.ReadyTimerId > 0 then
			local nRestTime = math.floor(Timer:GetRestTime(Wlls.ReadyTimerId)/Env.GAME_FPS);
			if nRestTime >= Wlls.MACTH_TIME_READY_LASTENTER/Env.GAME_FPS then
				return 1, string.format("Quan Hội Trường ：bỉ tái đang ở báo danh giai đoạn ，đợi ngài đích báo danh 。\n\nly bỉ tái bắt đầu còn thừa lại <color=yellow>%s <color>，xin mau sớm báo danh dự thi 。\n\n<color=yellow>ngươi khả dĩ ở bên trong hội trường án ～kiện kiểm tra thi đấu huống <color>", Lib:TimeFullDesc(nRestTime));
			end
		end
		
		local nHourMin = tonumber(os.date("%H%M", nTime));
		if nHourMin > Wlls.CALEMDAR.tbAdvMatch[#Wlls.CALEMDAR.tbAdvMatch] then
			return 0,"Quan Hội Trường ：đang tiến hành võ lâm liên kết đã trọn vẹn kết thúc ！";
		end
		for nId, nMatchTime in pairs(Wlls.CALEMDAR.tbAdvMatch) do
			if nHourMin < nMatchTime then
				return 0, string.format("Quan Hội Trường ：hạ tràng thị cao cấp liên kết bỉ tái 。\n\nbỉ tái loại hình thị <color=yellow>%s cường thi đấu <color>\n\nbỉ tái tương ở <color=yellow>%s <color>bắt đầu ！\n\n<color=yellow>ngươi khả dĩ ở bên trong hội trường án ～kiện kiểm tra thi đấu huống <color>", Wlls.MACTH_STATE_ADV_TASK[nId], Wlls.Fun:Number2Time(nMatchTime));				
			end
		end
		return 0,"Quan Hội Trường ：xin chờ một chút ，bỉ tái lập tức sẽ bắt đầu ！\n\n<color=yellow>ngươi khả dĩ ở bên trong hội trường án ～kiện kiểm tra thi đấu huống <color>";
	end
	
	
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TOTAL) >= Wlls.MACTH_ATTEND_MAX then
		return 0, string.format("Quan Hội Trường ：ngài đích chiến đội dĩ tham gia mãn <color=yellow>%s tràng <color>，hoàn thành sở hữu bỉ tái ，xin đợi đãi bỉ tái kết quả ！", Wlls.MACTH_ATTEND_MAX);
	end
	
	if Wlls.ReadyTimerId > 0 then
		local nRestTime = math.floor(Timer:GetRestTime(Wlls.ReadyTimerId)/Env.GAME_FPS);
		if nRestTime >= Wlls.MACTH_TIME_READY_LASTENTER/Env.GAME_FPS then
			return 1, string.format("Quan Hội Trường ：Trận sau bắt đầu vào lúc <color=yellow>%s <color>，xin mau sớm báo danh dự thi 。", Lib:TimeFullDesc(nRestTime));
		end
	end
	
	local nWeek = tonumber(os.date("%w", nTime));
	local nHourMin = tonumber(os.date("%H%M", nTime));
	local nDay = tonumber(os.date("%d", nTime));
	local tbCalemdar = Wlls.CALEMDAR.tbCommon;
	
	if Wlls.CALEMDAR.tbWeekDay[nWeek] then
		tbCalemdar = Wlls.CALEMDAR.tbWeekend;
	end
	
	local szGameStart ="Quan Hội Trường ：";
	for nReadyId, tbMission in pairs(Wlls.MissionList[Wlls.MACTH_PRIM]) do
		if tbMission:IsOpen() ~= 0 then
			szGameStart = szGameStart.."bỉ tái đã bắt đầu rồi ！\n\n";
			break;
		end
	end
	
	if Wlls:GetMatchEndForDate(nDay) == 1 and nHourMin > tbCalemdar[#tbCalemdar] then
		return 0, string.format("%s đang tiến hành liên kết thi đấu vòng tròn buổi diễn dĩ toàn bộ cử hành hoàn ，cao cấp liên kết sẽ tiến nhập bát cường thi đấu kỳ ！", szGameStart);
	end
	
	if nHourMin > tbCalemdar[#tbCalemdar] then
		return 0, string.format("%s hôm nay liên kết buổi diễn dĩ toàn bộ kết thúc ，thỉnh ngày mai trở lại dự thi ！", szGameStart);
	end	
	if nHourMin < tbCalemdar[1] then
		return 0, string.format("%s hạ cuộc tranh tài đích thời gian là <color=yellow>%s <color>！", szGameStart, Wlls.Fun:Number2Time(tbCalemdar[1]));
	end
	for nId, nMatchTime in ipairs(tbCalemdar) do
		if nHourMin > nMatchTime and tbCalemdar[nId+1] and nHourMin <= tbCalemdar[nId+1] then
			return 0, string.format("%s hạ cuộc tranh tài đích thời gian là <color=yellow>%s <color>！", szGameStart, Wlls.Fun:Number2Time(tbCalemdar[nId+1]));
		end
	end
	return 0,"Quan Hội Trường ：xin chờ một chút ，bỉ tái lập tức sẽ bắt đầu ！";
end

