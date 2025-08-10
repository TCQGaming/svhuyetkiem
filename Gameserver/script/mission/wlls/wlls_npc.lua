--武林联赛
--孙多良
--2008.09.12

local tbNpc = {};
Wlls.DialogNpc = tbNpc;

tbNpc.HONOR_CLASS_MONEY		= 8;	
tbNpc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbNpc.HONOR_CLASS_MONEY,
	},
};

function tbNpc:OnDialog(nGameLevel, nFlag)
	if Wlls:GetMacthSession() <= 0 then
		Dialog:Say("Quan Liên Đấu：Xin chào");
		return 0;
	end
	
	if nGameLevel == Wlls.MACTH_ADV and Wlls:GetMacthSession() < Wlls.MACTH_ADV_START_MISSION then
		Dialog:Say("Quan Liên Đấu：Võ lâm Liên Đấu chưa mở, hãy ghi danh vào lúc khác.");
		return 0;
	end
	
for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu_LienDau then
			Dialog:Say("Bạn không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu_LienDau.." <color>điểm Tài Phú để tham gia Võ Lâm Liên Đấu\nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color>");
			return 0;
	end
end
	
	local nCheck, nRank = Wlls:OnCheckAward(me, nGameLevel);
	if nCheck == 1 and not nFlag then
		local tbSel = {
			{"Nhận phần thưởng liên đấu", Wlls.OnGetAward, Wlls, nGameLevel},
			{"Trở về",self.OnDialog, self, nGameLevel, 1},
			{"Kết thúc đối thoại"},
		}
		Dialog:Say(string.format("Quan Liên Đấu：Chiến đội của bạn xếp hạng <color=yellow>%s<color>, Sau khi nhận thưởng chiến đội sẽ giải tán, Bạn có muốn nhận không ?", nRank), tbSel);
		return 0;		
	end
	local nMacthType = Wlls:GetMacthType();
	local tbMacthCfg = Wlls:GetMacthTypeCfg(nMacthType);
	local szGameLevelName = Wlls.MACTH_LEVEL_NAME[nGameLevel];
	local szDesc = (tbMacthCfg and tbMacthCfg.szDesc) or "";
	local szMsg = string.format("Quan liên đấu %s：Từ xưa đến nay, đạo võ thuật chỉ nhân thêm và tiếp tục lưu truyền. Loại hình võ lâm liên đấu đợit này là %s\n\n<color=yellow>Võ lâm liên đấu %s<color>\n", szGameLevelName, szDesc, Wlls.DEF_STATE_MSG[Wlls:GetMacthState()]);
	local tbOpt = 
	{
		{string.format("Đến nơi liên đấu %s", szGameLevelName), self.EnterGame, self, nGameLevel},
		{string.format("Chiến đội liên đấu của tôi"), self.MyLeague, self, nGameLevel},
		{"Xem Thông Tin các trận đấu", self.QueryMatch, self},
		{"Mua trang bị danh vọng liên đấu", self.BuyEquire, self},
		{string.format("Giới thiệu Võ Lâm Liên Đấu %s", szGameLevelName), self.About, self, nGameLevel},
		{"Ta chỉ đến xem"},
	};
	if Wlls:GetMacthState() == Wlls.DEF_STATE_REST then
		table.insert(tbOpt, 5, {string.format("<color=yellow>Nhận phần thưởng Võ Lâm Liên Đấu %s<color>", szGameLevelName), Wlls.OnGetAward, Wlls, nGameLevel});
	end
	
	if Wlls:GetMacthState() == Wlls.DEF_STATE_ADVMATCH then
		table.insert(tbOpt, 2, {"<color=yellow>Xem trận chung kết<color>", Wlls.OnLookDialog, Wlls});	
	end
	
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:EnterGame(nGameLevel)
	local szGameLevelName = Wlls.MACTH_LEVEL_NAME[nGameLevel];
	if Wlls:GetMacthState() == Wlls.DEF_STATE_CLOSE then
		Dialog:Say("Quan Liên Đấu：Giải đấu này chưa mở, xin vui lòng tham khảo các thông tin có liên quan trên trang chủ và diễn đàn.");
		return 0;		
	end
	if Wlls:GetMacthState() == Wlls.DEF_STATE_REST then
		Dialog:Say(string.format("Quan Liên Đấu: Giờ là thời gian giải lao Võ Lâm Liên Đấu %s, hội trường tạm thời không mở cửa, đến thời gian thi đấu hãy quay lại!", szGameLevelName));
		return 0;		
	end
	
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		Dialog:Say(string.format("Quan Liên Đấu：Hiện tại %s không có hồ sơ đăng ký nào về đội của bạn trong danh sách giải đấu. Bạn có thể đối thoại với NPC <color=yellow>Võ Lâm Liên Đấu<color>, chọn tùy chọn <color=yellow>Đăng ký chiến đội<color> để tạo hoặc tham gia một đội!", szGameLevelName));
		return 0;
	end
	
	local nLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	if nLevel ~= nGameLevel then
		Dialog:Say(string.format("Quan Liên Đấu：Hiện tại %s không có hồ sơ đăng ký nào về đội của bạn trong danh sách giải đấu. Bạn có thể đối thoại với NPC <color=yellow>Võ Lâm Liên Đấu<color>, chọn tùy chọn <color=yellow>Đăng ký chiến đội<color> để tạo hoặc tham gia một đội!", szGameLevelName));
		return 0;		
	end
	
	local nMacthType = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MTYPE);
	if nMacthType ~= Wlls:GetMacthType() then
		Dialog:Say(string.format("Quan Liên Đấu：Hiện tại %s không có hồ sơ đăng ký nào về đội của bạn trong danh sách giải đấu. Bạn có thể đối thoại với NPC <color=yellow>Võ Lâm Liên Đấu<color>, chọn tùy chọn <color=yellow>Đăng ký chiến đội<color> để tạo hoặc tham gia một đội!", szGameLevelName));
		return 0;		
	end

	if Wlls:GetMacthLevelCfgType() == Wlls.MAP_LINK_TYPE_SERIES then
		--未开发
		--判断自己现在的五行和报名时战队记录中的五行是否相符，不符不允许进场；
		local nOrgSereis	= League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_SERIES);
		if (me.nSeries <= 0) then
			Dialog:Say("Quan Liên Đấu：Bạn chưa gia nhập môn phái, hãy tìm cho mình 1 môn phái thích hợp.");
			return 0;
		end
		if (nOrgSereis > 0 and nOrgSereis ~= me.nSeries) then
			local szOrgSereis = string.format(Wlls.SERIES_COLOR[nOrgSereis], Env.SERIES_NAME[nOrgSereis]);
			local szSereis = string.format(Wlls.SERIES_COLOR[me.nSeries], Env.SERIES_NAME[me.nSeries]);
			Dialog:Say(string.format("Quan Liên Đấu： Ngũ hành hiện tại của bạn là %s, Ngũ hành đã đăng ký %s, vui lòng thay đổi và quay lại sau! ", szSereis, szOrgSereis));
			return 0;			
		end
	end	
	
	if Wlls:GetMacthLevelCfgType() == Wlls.MAP_LINK_TYPE_FACTION then
		--未开发
		--判断自己现在的门派和报名时战队记录中的五行是否相符，不符不允许进场；		
	end
	
	me.SetLogoutRV(1);
	Wlls:KickPlayer(me, "Bạn đã vào địa điểm tổ chức giải đấu. Sau khi đăng ký bắt đầu, bạn và đồng đội của bạn có thể đăng ký trận đấu tại địa điểm chính thức của giải đấu", nGameLevel);
	Dialog:SendBlackBoardMsg(me, "Chào mừng bạn đến với địa điểm tổ chức giải đấu, vui lòng đến gặp các quan chức của địa điểm để đăng ký thi đấu.");
end

function tbNpc:BuyEquire()
	me.OpenShop(134, 1) --使用声望购买
end

function tbNpc:MyLeague(nGameLevel)
	if Wlls:GetMacthState() == Wlls.DEF_STATE_CLOSE then
		Dialog:Say("Quan Liên Đấu： Giải đấu này vẫn chưa mở, hãy chú ý đến thông báo chính thức.");
		return 0;		
	end
	if not Wlls:GetMacthTypeCfg(Wlls:GetMacthType()) then
		Dialog:Say("Quan Liên Đấu： Ngày bắt đầu của giải đấu tiếp theo vẫn chưa được quyết định, hãy chú ý đến thông báo chính thức.");
		return 0;
	end
	
	if (GLOBAL_AGENT and GbWlls:GetGblWllsOpenState() == 0) then
		Dialog:Say("Quan Liên Đấu：Giải đấu này vẫn chưa mở, hãy chú ý đến thông báo chính thức.");
		return 0;
	end
	
	local nQuFlag = GbWlls:CheckWllsQualition(me);
	if (nQuFlag == 0) then
		local szMsg = "Quan Liên Đấu：Bạn đã đăng ký tham gia giải đấu liên server thì không thể tham gia giải đấu võ lâm tại đây!";
		if (GLOBAL_AGENT) then
			szMsg = "Quan Liên Đấu：Bạn đã đăng ký tham gia võ lâm trên máy chủ của mình thì không thể tham gia võ lâm tại đây!"; 
		end
		Dialog:Say(szMsg);
		return 0;
	end
	
	local szGameLevelName = Wlls.MACTH_LEVEL_NAME[nGameLevel];
	local szGameTypeName = Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).szName;
	local nGamePlayerMax = Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).tbMacthCfg.nMemberCount;
	local nPlayerMax	 = Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).tbMacthCfg.nPlayerCount;
	local szMsg = "";
	local tbOpt = {};
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		szMsg = string.format("Quan Liên Đấu：Liên đấu <color=yellow>%s<color> lần này là <color=yellow>%s .<color> Ngươi có thể chọn chiến đội mà mình muốn thiết lập, nếu trận đấu nhiều người ngươi có thể gia nhập vào chiến đội của người khác. Đội trưởng và người chơi khác sau khi tạo nhóm, sẽ đến chỗ<color=yellow> Quan Liên Đấu %s,<color> chọn <color=yellow>Chiến đội liên đấu của ta,<color> nhập nhóm của mình vào chiến đội của nhóm là được. Thành viên tối đa của chiến đội liên đấu lần này là <color=yellow>%s người<color>。", szGameLevelName, szGameTypeName, szGameLevelName, nGamePlayerMax);
		if nGamePlayerMax > nPlayerMax then
			szMsg = szMsg .. string.format("\n\n<color=yellow>%s thành viên chính thức, %s là thành viên dự bị<color>\nKhi vào sân thi đấu, người đầu tiên vào sân sẽ là thành viên chính thức.Khi thành viên chính thức rời khỏi sân,<color=yellow>Thành viên dự bị<color> sẽ được chuyển thành thành viên chính thức<color>", nPlayerMax, nGamePlayerMax - nPlayerMax);
		end
		tbOpt = {
			{string.format("Thiết lập chiến đội %s", szGameLevelName), self.CreateLeague, self, nGameLevel},
			{"Ta chỉ đến xem"},
		};
	else
		local szMemberMsg = self:GetLeagueInfoMsg(szLeagueName);
		local nCaptain = League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_JOB);
		if nCaptain == 1 then
			szMsg = szMemberMsg.."<color=gold> Tuyệt Đỉnh KT2009.Com<color>";
			tbOpt = {
				{"Rời khỏi chiến đội", self.LeaveLeague, self, nGameLevel},
				{"Kiểm tra chiến tích chiến đội", self.QueryLeague, self},
				{"Ta chỉ đến xem"},
			};
			
			if #League:GetMemberList(Wlls.LGTYPE, szLeagueName)< nGamePlayerMax and League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION) == Wlls:GetMacthSession() then
				table.insert(tbOpt, 1 , {"Gia nhập nhóm vào chiến đội", self.JoinLeague, self, nGameLevel});
			end
			
		else
			szMsg = szMemberMsg.."\nBạn có thể chọn rút khỏi nhóm. \n\nThoát khỏi nhóm: Trong thời gian gián đoạn, bạn có thể thoát khỏi nhóm, tham gia lại các nhóm khác hoặc tạo một nhóm mới. Trong thời gian thi đấu, chỉ cần đội đã tham gia thi đấu thì không được rút khỏi đội.";
			tbOpt = {			
				{"Rời khỏi chiến đội", self.LeaveLeague, self, nGameLevel},
				{"Kiểm tra chiến tích chiến đội", self.QueryLeague, self},
				{"Ta chỉ đến xem"},
			};
		end
		
		-- 五行相克双人赛
		if (Wlls:GetMacthTypeCfg(Wlls:GetMacthType()).tbMacthCfg.nSeries == Wlls.LEAGUE_TYPE_SERIES_RESTRAINT) then
			table.insert(tbOpt, 3, {"Thay đổi ngũ hành", self.OnChangeSeries, self, szLeagueName});
		end
	end
	Dialog:Say(szMsg,tbOpt);
end

function tbNpc:CheckChangeSeries(szLeagueName, pMe)
	local nCaptain = League:GetMemberTask(Wlls.LGTYPE, szLeagueName, pMe.szName, Wlls.LGMTASK_JOB);
	if (1 ~= nCaptain) then
		return 0, "Bạn không phải là đội trưởng của một đội liên minh. Bạn không thể thay đổi ngũ hành！";
	end
	
	local tbLeagueList		= Wlls:GetLeagueMemberList(szLeagueName);
	local tbTeamMemberList	= KTeam.GetTeamMemberList(pMe.nTeamId);
	
	if (not tbTeamMemberList) then
		return 0, "Vui lòng triệu tập tức cả thành viên về đây";
	end
	
	if (#tbTeamMemberList ~= #tbLeagueList) then
		return 0, "Số thành viên của bạn không khớp với số đội tại thời điểm đăng ký.";
	end

	local nMapId, nPosX, nPosY	= pMe.GetWorldPos();
	
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
		if not pPlayer or pPlayer.nMapId ~= nMapId then
			return 0, "Tất cả đồng đội của bạn phải ở gần đây。";
		end

		local nMapId2, nPosX2, nPosY2	= pPlayer.GetWorldPos();
		local nDisSquare = (nPosX - nPosX2)^2 + (nPosY - nPosY2)^2;
		if nMapId2 ~= nMapId or nDisSquare > 400 then
			return 0, "Tất cả đồng đội của bạn phải ở gần đây。";
		end
	
		local nFindFlag = 0;
		for nId, szMemberName in ipairs(tbLeagueList) do
			if (pPlayer.szName == szMemberName) then
				nFindFlag = 1;
				break;
			end
		end

		if (0 == nFindFlag) then
			return 0, string.format("%s Không phải là người của đội, không thay thế được ngũ hành.", pPlayer.szName);
		end
		
		if (pPlayer.szName ~= pMe.szName) then
			if (0 == Wlls:IsSeriesRestraint(pPlayer.nSeries, pMe.nSeries)) then
				return 0, "Ngũ hành của các thành viên trong nhóm không sai với ngũ hành đã đăng ký  không thay thế được.";
			end
		end
				
	end
	return 1;	
end

function tbNpc:OnChangeSeries(szLeagueName)
	local szMemberMsg	= "Ngũ hành nhóm hiện tại： ";
	local szOrgMsg		= "Ngũ hành nhóm đã đăng ký： ";
	local nFlag, szResult = self:CheckChangeSeries(szLeagueName, me);
	if (0 == nFlag) then
		Dialog:Say(szResult);
		return 0;
	end

	local tbLeagueList	= Wlls:GetLeagueMemberList(szLeagueName);
	local tbTeamList	= KTeam.GetTeamMemberList(me.nTeamId);
	for nId, szMemberName in ipairs(tbLeagueList) do
		local pPlayer	= KPlayer.GetPlayerByName(szMemberName);
		local nSeries	= League:GetMemberTask(Wlls.LGTYPE, szLeagueName, pPlayer.szName, Wlls.LGMTASK_SERIES);
		if (not pPlayer) then
			Dialog:Say(string.format("%s Thành viên không ở gần đây.", szMemberName));
			return 0;
		end
		if nId == 1 then
			szMemberMsg = string.format("%s Đội trưởng:<color=yellow>%s<color>，Hệ %s，", szMemberMsg, szMemberName, string.format(Wlls.SERIES_COLOR[pPlayer.nSeries], Env.SERIES_NAME[pPlayer.nSeries]));
			szOrgMsg = string.format("%s Đội trưởng:<color=yellow>%s<color>，Hệ %s，", szOrgMsg, szMemberName, string.format(Wlls.SERIES_COLOR[nSeries], Env.SERIES_NAME[nSeries]));
			if #tbLeagueList > 1 then
				szMemberMsg = string.format("%s Thành viên của nhóm: ", szMemberMsg);
				szOrgMsg = string.format("%s Thành viên của nhóm: ", szOrgMsg);
			else
				szMemberMsg = string.format("%s<color=gray> Không có người chơi trong đội<color>\n", szMemberMsg);
				szOrgMsg = string.format("%s<color=gray> Không có người chơi trong đội<color>\n", szOrgMsg);
			end
		else
			szMemberMsg = string.format("%s<color=yellow>%s<color>，Hệ %s", szMemberMsg, szMemberName, string.format(Wlls.SERIES_COLOR[pPlayer.nSeries], Env.SERIES_NAME[pPlayer.nSeries]));
			szOrgMsg = string.format("%s<color=yellow>%s<color>，Hệ %s", szOrgMsg, szMemberName, string.format(Wlls.SERIES_COLOR[nSeries], Env.SERIES_NAME[nSeries]));
			if nId < #tbLeagueList then
				szMemberMsg = string.format("%s，", szMemberMsg);
				szOrgMsg = string.format("%s，", szOrgMsg);
			end
		end
	end
	local szMsg = string.format("%s；\n%s；\nQuyết định thay đổi？", szOrgMsg, szMemberMsg);
	Dialog:Say(szMsg,
		{
			{"Đồng ý", self.OnSureChangeSeries, self, szLeagueName},
			{"Không"},	
		});
end

function tbNpc:OnSureChangeSeries(szLeagueName)
	local nFlag, szResult = self:CheckChangeSeries(szLeagueName, me);
	if (0 == nFlag) then
		Dialog:Say(szResult);
		return 0;
	end
	
	local szMemberMsg = "";
	local tbTeamList	= KTeam.GetTeamMemberList(me.nTeamId);
	local tbLeagueList	= Wlls:GetLeagueMemberList(szLeagueName);
	for nId, szMemberName in ipairs(tbLeagueList) do
		local pPlayer	= KPlayer.GetPlayerByName(szMemberName);
		if (not pPlayer) then
			Dialog:Say(string.format("%s Thành viên không ở gần đây.", szMemberName));
			return 0;
		end
		League:SetMemberTask(Wlls.LGTYPE, szLeagueName, szMemberName, Wlls.LGMTASK_SERIES, pPlayer.nSeries);
		
		if nId == 1 then
			szMemberMsg = string.format("%s Đội trưởng: <color=yellow>%s<color>，Phái %s", szMemberMsg, szMemberName, string.format(Wlls.SERIES_COLOR[pPlayer.nSeries], Env.SERIES_NAME[pPlayer.nSeries]));
			if #tbLeagueList > 1 then
				szMemberMsg = string.format("%s Thành viên của đội：", szMemberMsg);
			else
				szMemberMsg = string.format("%s<color=gray> Không có người chơi trong đội<color>\n", szMemberMsg);
			end
		else
			szMemberMsg = string.format("%s<color=yellow>%s<color>，Phái %s", szMemberMsg, szMemberName, string.format(Wlls.SERIES_COLOR[pPlayer.nSeries], Env.SERIES_NAME[pPlayer.nSeries]));
			if nId < #tbLeagueList then
				szMemberMsg = string.format("%s，", szMemberMsg);
			end
		end		
	end
	
	Dialog:Say(string.format("Việc thay thế ngũ hành của các cầu thủ thành công, và ngũ hành của các cầu thủ được thay đổi thành： %s。", szMemberMsg));
end

function tbNpc:GetLeagueInfoMsg(szLeagueName)
	local tbLeagueList = Wlls:GetLeagueMemberList(szLeagueName);
	local szMemberMsg = string.format("Đội trưởng chiến đội Quan Liên Đấu：\nChiến đội：<color=yellow>%s<color>\n", szLeagueName);
	for nId, szMemberName in ipairs(tbLeagueList) do
		if nId == 1 then
			szMemberMsg = string.format("%s Nhân vật： <color=yellow>%s<color>\n", szMemberMsg, szMemberName);
			
			if #tbLeagueList > 1 then
				szMemberMsg = string.format("%s Thành viên của đội：", szMemberMsg);
			else
				szMemberMsg = string.format("%s<color=gray>không có chiến đội<color>\n", szMemberMsg);
			end 
		else
			szMemberMsg = string.format("%s<color=yellow>%s<color>", szMemberMsg, szMemberName);
			if nId < #tbLeagueList then
				szMemberMsg = string.format("%s，", szMemberMsg);
			end
		end
	end
	return 	szMemberMsg;
end

function tbNpc:QueryLeague(szFindName)
	local szLeagueName = szFindName;
	if not szLeagueName then
		szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
		if not szLeagueName then
			Dialog:Say("Quan Liên Đấu：Bạn chưa có đội nào！");
			return 0;
		end
	end
	local tbLeagueList = Wlls:GetLeagueMemberList(szLeagueName);
	local szMemberMsg = self:GetLeagueInfoMsg(szLeagueName);
	local nMSession = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION);
	local nMType = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MTYPE);
	local nMLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	local nRank = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK);
	local nWin = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_WIN);
	local nTie = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TIE);
	local nTotal = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TOTAL);
	local nTime = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_TIME);
	local nRankAdv	= League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_RANK_ADV);
	local nLoss = nTotal-nWin-nTie;
	if not Wlls.MACTH_TYPE[nMType] then
		Dialog:Say("Quan Liên Đấu：Đội ngũ không bình thường！");
		return 
	end
	local szMacthName = Wlls:GetMacthTypeCfg(nMType).szName;
	local szMacthLevel = Wlls.MACTH_LEVEL_NAME[nMLevel];
	local nPoint = nWin * Wlls.MACTH_POINT_WIN + nTie * Wlls.MACTH_POINT_TIE + nLoss * Wlls.MACTH_POINT_LOSS;
	local szRate = 100.00;
	if nTotal > 0 then
		szRate = string.format("%.2f", (nWin/nTotal)*100) .. "％";
	else
		szRate = "Vô";
	end
	local szRank = "";
	if nRank > 0 then
		szRank = string.format("\nXếp hạng đội： <color=white>%s<color>", nRank);
	end
	local tbAdvMsg = {
		[0] = "Không phải 8 đội mạnh nhất",
		[1]	= "4 đội mạnh nhất",
		[2]	= "5 đội mạnh nhất",
		[4] = "Vào Bán Kết",
		[8] = "Vào Tứ Kết",
	};
	szRank = szRank .. string.format("\n\nTình hình trận 8 đội mạnh nhất：<color=white>%s<color>", tbAdvMsg[nRankAdv]);
	
	szMemberMsg = string.format([[%s<color=green>
--Thành tích--
Số đợt liên đấu：<color=white>Đợt thứ %s<color> 
Tham gia thi đấu：<color=white>%s<color> 
Đẳng cấp：<color=white>%s<color> 
Tổng số trận：<color=white>%s<color> 
Tỷ lệ thắng：<color=white>%s<color>
Tổng tích lũy：<color=white>%s<color>
Thắng：<color=white>%s<color>  Hòa：<color=white>%s<color>  Thua：<color=white>%s <color>
Thời gian thi đấu tích lũy：<color=white>%s<color>
%s

<color=red>Danh sách thi đấu 8 đội mạnh sẽ được cập nhật lúc 0 giờ ngày 28<color>
]],szMemberMsg, Lib:Transfer4LenDigit2CnNum(nMSession), szMacthName, szMacthLevel, nTotal, szRate, nPoint, nWin, nTie, nLoss, Lib:TimeFullDesc(nTime), szRank);
		Dialog:Say(szMemberMsg, {{"Quay về", self.QueryMatch, self}, {"Kết thúc đối thoại2"}});
end

function tbNpc:QueryMatch()
	local szMsg = "<color=gold> Võ Lâm Liên Đấu Là Nơi Khốc Liệt Của Nhân Sĩ Toàn Cõi<color>";
	local tbOpt = {
		{"Xem thông tin của người khác", self.QueryOtherMatch, self, 1},
		{"Xem thông tin của chiến đội khác", self.QueryOtherMatch, self, 2},
		{"Xem chiến tích của bản thần", self.QueryMyMatch, self},
		{"Kết thúc đối thoại"},
	};
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if szLeagueName then
		table.insert(tbOpt, 1 , {"Xem chiến tích của chiến đội", self.QueryLeague, self})
	end	
	Dialog:Say(szMsg, tbOpt)
end

function tbNpc:QueryMyMatch()
	local nTotal = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_TOTLE);
	local nWin = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_WIN);
	local nTie = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_TIE);
	local nFirst = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_FIRST);
	local nSecond = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_SECOND);
	local nThird = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_THIRD);
	local nBest = me.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_BEST);
	local nLost = nTotal - nWin - nTie;
	local szMsg = string.format([[<color=green>
		--Thành tích--
		
		Tổng số trận：   <color=white>%s<color>
		Số trận thắng：   <color=white>%s<color>
		Số trận hòa：   <color=white>%s<color>
		Số trận thua：   <color=white>%s<color>
		
		Quán quân：   <color=white>%s<color>
		Á quân：   <color=white>%s<color>
		Quý quân：   <color=white>%s<color>
		
		Thứ tự tốt nhất：   <color=white>%s<color>
		
	<color=red>Thư tụ sẽ được cập nhật lại sau khi nhận phần thưởng liên đấu mỗi đợt<color>]], 
	nTotal, nWin, nTie, nLost, 
	nFirst, nSecond, nThird, nBest);
	Dialog:Say(szMsg, {{"Quay về", self.QueryMatch, self}, {"Kết thúc đối thoại4"}});
end

function tbNpc:QueryOtherMatch(nType, nFlag, szText)
	local szType = "Tên nhóm";
	if nType == 1 then
		szType = "Tên nhân vật";
	end
	
	if not nFlag then
		Dialog:AskString(string.format("vui lòng nhập %s：",szType), 16, self.QueryOtherMatch, self, nType, 1);
		return
	end
	--名字合法性检查
	local nLen = GetNameShowLen(szText);
	if nLen < 4 or nLen > 16 then
		Dialog:Say(string.format("Số lượng từ trong %s của bạn không đáp ứng yêu cầu.", szType));
		return 0;
	end
	
	--是否允许的单词范围
	if KUnify.IsNameWordPass(szText) ~= 1 then
		Dialog:Say(string.format("%s của bạn chứa các ký tự không hợp lệ.", szType));
		return 0;
	end
	
	--是否包含敏感字串
	if IsNamePass(szText) ~= 1 then
		Dialog:Say(string.format("%s của bạn chứa các ký tự nhạy cảm bất hợp pháp.", szType));
		return 0;
	end
	
	if nType == 2 then
		if not League:FindLeague(Wlls.LGTYPE, szText) then
			Dialog:Say("Đội liên minh bạn truy vấn không tồn tại.");
			return 0;
		end
		--显示战队情况
		self:QueryLeague(szText);
	end
	if nType == 1 then
		if not League:GetMemberLeague(Wlls.LGTYPE, szText) then
			Dialog:Say("Tên bạn đang tìm không có trong giải đấu.");
			return 0;
		end
		self:QueryLeague(League:GetMemberLeague(Wlls.LGTYPE, szText));
	end
end

function tbNpc:CreateLeague(nGameLevel, szCreateLeagueName, nCreateFlag)
	local nMacthType = Wlls:GetMacthType();
	local tbMacthCfg = Wlls:GetMacthTypeCfg(nMacthType);
	local szGameLevelName = Wlls.MACTH_LEVEL_NAME[nGameLevel];
	local szGameLevel1Name = Wlls.MACTH_LEVEL_NAME[Wlls.MACTH_PRIM];
	local szGameLevel2Name = Wlls.MACTH_LEVEL_NAME[Wlls.MACTH_ADV];
	if not tbMacthCfg then
		Dialog:Say("Quan Liên Đấu：Giải đấu vẫn chưa bắt đầu, hãy chú ý đến thông báo chính thức!");
		return 0;
	end
	local nMaxLevel = Wlls.PLAYER_ATTEND_LEVEL;
	if (GLOBAL_AGENT) then
		nMaxLevel = GbWlls.DEF_MIN_PLAYERLEVEL;
	end
	if me.nLevel < nMaxLevel then
		Dialog:Say(string.format("Quan Liên Đấu：%s Đẳng cấp hiện tại <color=yellow>%s<color> không đáp ứng yêu cầu giải đấu", szGameLevelName, Wlls.PLAYER_ATTEND_LEVEL));
		return 0;		
	end
	if me.nTeamId <= 0 then
		Dialog:Say("Quan Liên Đấu： Thiết lập tổ đội trước đã");
		return 0;
	end
	if me.IsCaptain() == 0 then
		Dialog:Say("Quan Liên Đấu： Bạn không phải là đội trưởng");
		return 0;
	end
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if szLeagueName then
		Dialog:Say("Quan Liên Đấu： Bạn đã có một nhóm, bạn không thể tạo nhóm nữa!");
		return 0;
	end
	
	if Wlls:GetGameLevelForRank(me.szName) > nGameLevel then
		Dialog:Say(string.format("Quan Liên Đấu：Các hạ võ công đã khá cao, không thể tiếp tục tham gia giải đấu %s. Dựa vào điểm danh dự các hạ có thể tiến hành tham gia <color=yellow>%s<color> tại các thành thị lớn", szGameLevel1Name, Wlls.SEASON_TB[Wlls:GetMacthSession()][3], szGameLevel2Name));
		return 0;
	elseif  Wlls:GetGameLevelForRank(me.szName) < nGameLevel then
		if (GLOBAL_AGENT) then
			Dialog:Say(string.format("Quan Liên Đấu：%s Danh dự hiện tại của ngươi chưa đạt <color=yellow>%s<color> và xếp hạng chưa đạt <color=yellow>%s<color>, luyện tập thêm và quay lại sau", szGameLevel2Name, GbWlls.DEF_ADV_MAXGBWLLS_MONEY_RANK, GbWlls.DEF_ADV_MAXGBWLLS_WLLS_RANK));
		else
			Dialog:Say(string.format("Quan Liên Đấu：%s xếp hạng chưa đạt <color=yellow>%s<color>, luyện tập thêm và quay lại sau", szGameLevel2Name, Wlls.SEASON_TB[Wlls:GetMacthSession()][3]));
		end
		return 0;		
	end

	if (GLOBAL_AGENT) then
		local nEnterFlag = GbWlls:GetGbWllsEnterFlag(me);
		if (nEnterFlag ~= 1) then
			Dialog:Say("Quan Liên Đấu：Bạn đã không vượt qua <color=yellow>Nhân viên đăng ký giải đấu trên nhiều máy chủ <color>Đăng ký để tham gia, bạn không thể tạo một đội.");
			return 0;
		end
		
		if (GbWlls:CheckSiguUpTime(GetTime()) == 0) then
			Dialog:Say("Quan Liên Đấu： không phải là thời gian đăng ký và không thể thành lập đội.")
			return 0;
		end
	end
	
	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	if not tbTeamMemberList then
		Dialog:Say("Quan Liên Đấu： Thiết lập tổ đội trước đã");
		return 0;
	end
	local nFlag, szMsg = Wlls:CheckCreateLeague(me, tbTeamMemberList, tbMacthCfg, nGameLevel);
	if nFlag == 1 then
		Dialog:Say(szMsg);
		return 0;
	end
	
	if not szCreateLeagueName then
		Dialog:AskString("Tên nhóm： ", 12, self.CreateLeague, self, nGameLevel);
		return 0;
	end
	
	--名字合法性检查
	local nLen = GetNameShowLen(szCreateLeagueName);
	if nLen < 6 or nLen > 12 then
		Dialog:Say("Độ dài chiến đổi phải từ 6 đến 12 ký tự.");
		return 0;
	end
	
	--是否允许的单词范围
	if KUnify.IsNameWordPass(szCreateLeagueName) ~= 1 then
		Dialog:Say("Chiến đội của bạn chứa các ký tự không hợp lệ.");
		return 0;
	end
	
	--是否包含敏感字串
	if IsNamePass(szCreateLeagueName) ~= 1 then
		Dialog:Say("Chiến đội của bạn vi phạm quy tắc đặt tên");
		return 0;
	end

	if League:FindLeague(Wlls.LGTYPE, szCreateLeagueName) then
		Dialog:Say("Tên chiến đội này đã tồn tại, hãy chọn tên khác");
		return 0;
	end
	
	if tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_SERIES then
		if (not nCreateFlag or nCreateFlag <= 0) then
			local nSeries = -1;
			local szMsg = "";
			local tbOpt	= {};
			for _, nPlayerId in ipairs(tbTeamMemberList) do
				local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
				if (pPlayer.nSeries <= 0) then
					szMsg = "Có đồng đội trong đội của bạn chưa tham gia.";
					break;
				end
				
				if (nSeries <= 0) then
					nSeries = pPlayer.nSeries;
					local szSereis = string.format(Wlls.SERIES_COLOR[nSeries], Env.SERIES_NAME[nSeries]);
					szMsg	= string.format("Bạn có chắc chắn muốn tham gia Giải đấu Ngũ hành %s với tư cách %s không?", szSereis, szSereis);
					tbOpt	= {
							{"Có", self.CreateLeague, self, nGameLevel, szCreateLeagueName, 1},
							{"Không"},
						}; 
				else
					if (nSeries ~= pPlayer.nSeries) then
						szMsg = "Có những đồng đội trong nhóm của bạn không cùng hệ";
						break;				
					end
				end
			end
			Dialog:Say(szMsg, tbOpt);
			return 0;
		end
	end
		
	if (tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_FACTION) then
		if (not nCreateFlag or nCreateFlag <= 0) then
			local nFaction = 0;
			local szMsg = "";
			local tbOpt	= {};
			for _, nPlayerId in ipairs(tbTeamMemberList) do
				local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
				if (pPlayer.nFaction <= 0) then
					szMsg = "Có đồng đội trong đội của bạn chưa tham gia。";
					break;
				end
				
				if (nFaction <= 0) then
					nFaction = pPlayer.nFaction;
					local szFaction = Player:GetFactionRouteName(nFaction);
					szMsg	= string.format("Bạn có chắc chắn muốn tham gia vào các cuộc đấu đơn của %s với tư cách %s không?", szFaction, szFaction);
					tbOpt	= {
							{"Có", self.CreateLeague, self, nGameLevel, szCreateLeagueName, 1},
							{"Không"},
						}; 
				else
					if (nFaction ~= pPlayer.nFaction) then
						szMsg = "Có những đồng đội trong nhóm của bạn không cùng hệ phái";
						break;				
					end
				end
			end
			Dialog:Say(szMsg, tbOpt);
			return 0;
		end
	end
		
	-- 五行相克赛
	if (tbMacthCfg.tbMacthCfg.nSeries == Wlls.LEAGUE_TYPE_SERIES_RESTRAINT) then
		if (not nCreateFlag or nCreateFlag <= 0) then
			local nSeries	= -1;
			local nNoFlag	= 0;
			local szSeriesMsg = "";		
			for _, nPlayerId in ipairs(tbTeamMemberList) do
				local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
				if (nSeries == -1) then
					nSeries = pPlayer.nSeries;
				else
					if (0 == Wlls:IsSeriesRestraint(nSeries, pPlayer.nSeries)) then
						nNoFlag = 1;
						break;
					end
				end
				szSeriesMsg = string.format("%s%s %s，", szSeriesMsg, pPlayer.szName, string.format(Wlls.SERIES_COLOR[pPlayer.nSeries], Env.SERIES_NAME[pPlayer.nSeries]));
			end
			if (1 == nNoFlag) then
				Dialog:Say("Giải đấu này là trận đấu giữa hai người với nhau, không có quan hệ gì giữa các bạn, nên chọn ngũ hành trước khi chơi.");
				return 0;
			else
				szSeriesMsg = string.format("%s có chắc chắn sử dụng nhập hiện tại không?", szSeriesMsg);
				local tbOpt	= {
						{"Có", self.CreateLeague, self, nGameLevel, szCreateLeagueName, 1},
						{"Không"},
					}; 
				Dialog:Say(szSeriesMsg, tbOpt);
				return 0;
			end
		end
	end
	
	--记录扩展参数
	local nExParam = 0;
	--if tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_SERIES then
	--	nExParam = me.nFaction;
	--end
	
	local tbMemberList = {};
	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if pPlayer then
			--pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_FINISH, 0);--清除奖励领取选项.
			pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_SESSION, Wlls:GetMacthSession());--设置帮助锦囊显示信息
			pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE, 0);
			pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_WIN, 0);
			pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TIE, 0);
			local nMyGameLevel	= Wlls:GetGameLevelForRank(pPlayer.szName);
			local nGateway		= 0;
			local nExParam = 0;			
			if (GLOBAL_AGENT) then
				local szGateway = Transfer:GetMyGateway(pPlayer);
				nGateway = tonumber(string.sub(szGateway, 5, 8)) or 0;
				if (tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_FACTION) then
					nExParam = pPlayer.nFaction;
				end
			end
			
			table.insert(tbMemberList, {
				nId=nPlayerId,
				szName=pPlayer.szName,
				nFaction=pPlayer.nFaction, 
				nRouteId=pPlayer.nRouteId, 
				nSex=pPlayer.nSex, 
				nCamp=pPlayer.GetCamp(), 
				nSeries=pPlayer.nSeries,
				nMyGameLevel = nMyGameLevel,
				nGateway = nGateway,
				nExParam = nExParam,
				nLevel	= pPlayer.nLevel,
				});
		end
		pPlayer.Msg(string.format("Bạn đã trở là thành viên của <color=yellow>%s<color>.Vui lòng đến địa điểm thi đấu trong thơi gian trận đấu và đăng ký trận đấu.", szCreateLeagueName));
		Dialog:SendBlackBoardMsg(pPlayer, string.format("Bạn đã trở thành thành viên của đội %s", szCreateLeagueName));
		if (GLOBAL_AGENT) then
			local szGbMsg = string.format(GbWlls.MSG_JOIN_SUCCESS_FOR_MY, Wlls:GetMacthSession(), tbMacthCfg.szName);
			pPlayer.Msg(szGbMsg);
		end
	end
	me.Msg(szMsg);
	Dialog:Say(szMsg);
	GCExcute{"Wlls:CreateLeague", tbMemberList, szCreateLeagueName, nGameLevel, nExParam};
		
end

function tbNpc:JoinLeague()
	local nMacthType = Wlls:GetMacthType();
	local tbMacthCfg = Wlls:GetMacthTypeCfg(nMacthType);
	if not tbMacthCfg then
		Dialog:Say("Quan Liên Đấu： Giải đấu vẫn chưa bắt đầu, hãy chú ý đến thông báo chính thức!");
		return 0;
	end 
	if me.nTeamId <= 0 then
		Dialog:Say("Quan Liên Đấu： Thiết lập tổ đội trước đã");
		return 0;
	end
	if me.IsCaptain() == 0 then
		Dialog:Say("Quan Liên Đấu： Ngươi không phải đội trưởng");
		return 0;
	end
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		Dialog:Say("Quan Liên Đấu： Bạn chưa tạo chiến đội！");
		return 0;
	end
	local nGameLevel = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MLEVEL);
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION) ~= Wlls:GetMacthSession() then
		Dialog:Say("Quan Liên Đấu： Giải đấu của đội bạn đã kết thúc！");
		return 0;
	end
	local nCaptain = League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_JOB);
	if not nCaptain or nCaptain == 0 then
		Dialog:Say("Quan Liên Đấu： Chỉ có đội trưởng mới đủ điều kiện để mời các thành viên khác tham gia đội!");
		return 0;
	end
	
	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	if not tbTeamMemberList then
		Dialog:Say("Quan Liên Đấu：Ngươi không phải đội trưởng");
		return 0;
	end

	if (GLOBAL_AGENT) then
		if (GbWlls:CheckSiguUpTime(GetTime()) == 0) then
			Dialog:Say("Quan Liên Đấu： Đó không phải là thời gian đăng ký, và người chơi không thể tham gia đội.")
			return 0;
		end
	end

	local tbPlayerList = League:GetMemberList(Wlls.LGTYPE, szLeagueName);
	local tbJoinPlayerIdList = {};
	for _, nPlayerId in pairs(tbTeamMemberList) do
		if me.nId ~= nPlayerId then
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if not pPlayer then
				Dialog:Say("Tất cả đồng đội của bạn phải ở gần đây。");
				return 0;
			end
			local nMyGameLevel = Wlls:GetGameLevelForRank(pPlayer.szName)

			local nExParam = 0;
			if (tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_FACTION) then
				nExParam = pPlayer.nFaction;
			end
		
			local nGateway		= 0;
			if (GLOBAL_AGENT) then
				local szGateway = Transfer:GetMyGateway(pPlayer);
				nGateway = tonumber(string.sub(szGateway, 5, 8)) or 0;
			end
			
			table.insert(tbJoinPlayerIdList, {
				nId=nPlayerId,
				szName=pPlayer.szName,
				nFaction=pPlayer.nFaction, 
				nRouteId=pPlayer.nRouteId, 
				nSex=pPlayer.nSex, 
				nCamp=pPlayer.GetCamp(), 
				nSeries=pPlayer.nSeries,
				nMyGameLevel = nMyGameLevel,
				nExParam = nExParam,
				nGateway = nGateway,
				nLevel	= pPlayer.nLevel,
				});
		end
	end
	if #tbJoinPlayerIdList <= 0 then
		Dialog:Say("Quan Liên Đấu：Không có thành viên nào trong nhòm của người");
		return 0;
	end
	local nMyGameLevel = Wlls:GetGameLevelForRank(me.szName);
	local nExParam = 0;
	if (tbMacthCfg.nMapLinkType == Wlls.MAP_LINK_TYPE_FACTION) then
		nExParam = me.nFaction;
	end

	local nGateway		= 0;
	if (GLOBAL_AGENT) then
		local szGateway = Transfer:GetMyGateway(me);
		nGateway = tonumber(string.sub(szGateway, 5, 8)) or 0;
	end

	table.insert(tbJoinPlayerIdList, 1, {
		nId=me.nId,
		szName=me.szName,
		nFaction=me.nFaction, 
		nRouteId=me.nRouteId, 
		nSex=me.nSex,
		nCamp=me.GetCamp(), 
		nSeries=me.nSeries,
		nGateway = nGateway,
		nGameLevel = nGameLevel,
		nExParam = nExParam,
		nLevel	= me.nLevel,
		});
	local nFlag, szMsg = Wlls:CheckJoinLeague(me, szLeagueName, tbPlayerList, tbJoinPlayerIdList, tbMacthCfg, nGameLevel);
	if nFlag == 1 then
		Dialog:Say(szMsg);
		return 0;
	end
	Dialog:Say("Nhóm của bạn đã gia nhập thành công một thành viên mới trong nhóm!");
	for _, tbPlayer in pairs(tbJoinPlayerIdList) do
		local pPlayer = KPlayer.GetPlayerObjById(tbPlayer.nId);
		if pPlayer then
			if pPlayer.GetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_SESSION) ~= Wlls:GetMacthSession() then
				--pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_MATCH_FINISH, 0);--清除奖励领取选项.
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_SESSION, Wlls:GetMacthSession());--设置帮助锦囊显示信息
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TOTLE, 0);
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_WIN, 0);
				pPlayer.SetTask(Wlls.TASKID_GROUP, Wlls.TASKID_HELP_TIE, 0);
			end
			local szBlackMsg = string.format("Bạn đã trở thành thành viên của đội %s", szLeagueName);
			local szMsg = string.format("Bạn đã trở là thành viên của <color=yellow>%s<color>.Vui lòng đến địa điểm thi đấu trong thơi gian trận đấu và đăng ký trận đấu", szLeagueName);
			if tbPlayer.nId == me.nId then
				szBlackMsg = "Nhóm của bạn đã tham gia thành công một thành viên mới trong nhóm";
				szMsg = "Đội của bạn <color=yellow> đã gia nhập thành công thành viên mới <color>. Vui lòng vào địa điểm tổ chức giải đấu trong thời gian thi đấu và đăng ký tham gia cuộc thi tại các cơ quan tổ chức. Bạn có thể kiểm tra và vận hành các thông tin liên quan của đội tại các quan chức của giải đấu.";
			end
			pPlayer.Msg(szMsg);
			Dialog:SendBlackBoardMsg(pPlayer, szBlackMsg);	
		end
	end
	GCExcute{"Wlls:JoinLeague", szLeagueName, tbJoinPlayerIdList};
end

function tbNpc:LeaveLeague(nGameLevel, nFlag)
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		Dialog:Say("Quan liên đấu: Bạn không có đội！");
		return 0;
	end
	local nSession = League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_MSESSION);
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ATTEND) > 0 and nSession == Wlls:GetMacthSession() then
		Dialog:Say("Quan liên đấu: Đội của bạn đã tham gia cuộc thi này, bạn không thể rút khỏi đội.");
		return 0;
	end
	if nFlag == 1 then
		Dialog:Say("Quan liên đấu: Thoát nhóm thành công.");
		-- 只有非全局服务器才能设置
		if (not GLOBAL_AGENT) then
			Wlls:SetPlayerSession(me.szName, 0);
		end
		GCExcute{"Wlls:LeaveLeague", me.szName, nGameLevel};
		return 0;
	end
	local szMsg = "";
	local tbOpt = {
		{"Đồng ý rời khỏi", self.LeaveLeague, self, nGameLevel, 1},
		{"Để ta suy nghĩ đã"},
	}
	--如果高级联赛，退出特殊判断
	if nGameLevel == Wlls.MACTH_ADV and Wlls:GetGameLevelForRank(me.szName) == Wlls.MACTH_ADV then
		local tbLeagueMemberList = Wlls:GetLeagueMemberList(szLeagueName);
		local tbAdv = {};
		for _, szName in pairs(tbLeagueMemberList) do
			if Wlls:GetGameLevelForRank(szName) == Wlls.MACTH_ADV then
				table.insert(tbAdv, szName);
			end
		end
		if #tbAdv <= 1 then
			if (GLOBAL_AGENT) then
				szMsg = string.format("Quan liên đấu: Sau khi bạn rút khỏi đội, nếu những người chơi còn lại không đáp ứng yêu cầu của giải đấu liên server nâng cao, đội sẽ bị giải tán. <color=red> Sau khi rời khỏi đội, bạn sẽ không thể nhận phần thưởng xếp hạng của đội. <color> Bạn có chắc chắn muốn rời khỏi đội không?");
			else
				szMsg = string.format("Quan liên đấu: Sau khi bạn rút khỏi đội, nếu những người chơi còn lại không nằm trong <color=yellow>%s <color> hàng đầu của bảng xếp hạng danh dự của giải đấu, đội sẽ bị giải tán. <color=red> Sau khi rời khỏi đội, bạn sẽ không thể nhận phần thưởng xếp hạng của đội. <color> Bạn có chắc chắn muốn rời khỏi đội không?", Wlls.SEASON_TB[Wlls:GetMacthSession()][3]);
			end
			Dialog:Say(szMsg, tbOpt);
			return 0;
		end
	end
	
	local nCaptain = League:GetMemberTask(Wlls.LGTYPE, szLeagueName, me.szName, Wlls.LGMTASK_JOB);
	if nCaptain == 1 then
		szMsg = "Quan Liên Đấu：Sau khi ngươi rời khỏi chiến đội, tư cách đội trưởng sẽ chuyển cho thành viên khác; nếu không còn thành viên nào khác, thi chiến đội sẽ giải tán. <color=red>Ngươi sẽ không nhận được phần thưởng xếp hạng chiến đội lần này,<color> ngươi thực sự muốn rời khỏi chứ?"
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	szMsg = "Quan liên đấu: <color=red>Sau khi rời khỏi đội, bạn sẽ không thể nhận phần thưởng xếp hạng của đội. <color> Bạn có chắc chắn muốn rời khỏi đội không?？";
	Dialog:Say(szMsg, tbOpt);	
end

function tbNpc:BreakLeague()
	local szLeagueName = League:GetMemberLeague(Wlls.LGTYPE, me.szName);
	if not szLeagueName then
		Dialog:Say("Quan liên đấu: Bạn không có đội！");
		return 0;
	end
	if League:GetLeagueTask(Wlls.LGTYPE, szLeagueName, Wlls.LGTASK_ATTEND) > 0 then
		Dialog:Say("Quan liên đấu: Đội của bạn đã tham gia giải đấu này, bạn không thể giải tán đội.");
		return 0;
	end	
	GCExcute{"Wlls:BreakLeague", me.szName};
end

tbNpc.tbAbout = 
{

	[1] = [[
	1. Bạn có thể đăng ký thành lập chiến đội liên đấu ở chỗ Quan Liên Đấu (sơ, cao) các thành thị.
	
	2. Nếu loại hình liên đấu là nhiều người, sau khi lập chiến đội, đội trưởng có thể chọn người phù hợp điều kiện ở chỗ Quan Liên Đấu (sơ, cao) gia nhập chiến đội của mình.
	
	3. Ngày thi đấu, thành viên chiến đội đối thoại với Quan Liên Đấu (sơ, cao) để vào Hội trường liên đấu, đối thoại với Quan Hội Trường, ghi danh tham gia thi đấu ngày hôm đó.
	
	4. Sau khi ghi danh, thành viên chiến đội vào Khu chuản bị liên đấu, hết thời gian chuẩn bị thi vào Đấu trường chính thức thi đấu.]],
	[2] = [[
    1. Trong Võ lâm liên đấu, <color=yellow>mỗi mùa đấu là 1 tháng, ngày 7 - 28<color> là thời gian đấu, trong đó ngày <color=yellow>7 - 28<color> là thời gian thi đấu tuần hoàn, <color=yellow>ngày 28<color> là thời gian thi chung kết liên đấu (cao), liên đấu (sơ) không có đấu chung kết. <color=yellow>8 đợi đứng đầu<color> vòng đấu tuần hoàn có quyền được vào chung kết, xếp hạng của 8 đội ngày căn cứ theo thành tích của vòng chung kết, các đội còn lại căn cứ thành tích vòng đấu tuần hoàn. Trong cả mùa đấu (3 tuần) có tất cả <color=yellow>150 trần đấu<color>, mỗi chiến đội được tham gia nhiều nhất <color=yellow>48 trận<color> thi đấu, các trận đấu ở vòng chung kết không được tính trong số 48 trận này.	
   
    2. Thời gian thi đấu cụ thể
    Thứ hai đến thứ sáu: 22h00, 22h15, 22h30, 22h45
    Thứ bảy và Chủ Nhật: 12h00, 12h15, 12h30, 12h45, 18h00, 18h15, 18h30, 18h45, 22h00, 22h15, 22h30, 22h45
    Ngày 28 trong tháng Lịch thi đấu (8 trận vòng chung kết): 19h00, 19h15, 19h30, 19h45, 20h00.

    3）Thời gian chuẩn bị cho mỗi trận đấu là <color=yellow>5 phút<color>，Thời gian thi đấu <color=yellow>10 phút<color>。

    4）Chung kết có 5 suất vào chung kết, tốp 8 sẽ vào tốp 4 lúc 19h, tốp 4 vào chung kết lúc 19h15, tranh chức vô địch và á quân vào lúc 19h30, 19h45, và 20:00. Cả hai bên cần chơi 3 ván, mỗi đội Những người không tham gia trận chung kết sẽ tự động bị tuyên bố là đội thua cuộc.
	]],
	[3] = [[
	1）Liên đoàn võ thuật được chia thành Liên đoàn võ thuật cơ sở và Liên đoàn võ thuật cấp cao. Bạn cần tham gia vào đội để tham gia giải đấu.
	
	2）Yêu cầu đầu vào đối với các đội liên minh võ thuật cơ sở: các thành viên trong đội là cấp 100 trở lên, đã tham gia võ học và không được nằm trong %s cao nhất của bảng xếp hạng điểm danh dự của liên minh (tùy thuộc vào loại liên minh mà điều kiện yêu cầu là khác nhau ). <color=yellow> (Giải đấu cấp cao sẽ được mở ở giải đấu thứ ba) <color>
	
	3）Yêu cầu đầu vào đội cấp cao của liên minh võ học: thành viên trong đội trên 100, đã tham gia võ học và đội trưởng nằm trong %s cao nhất của bảng xếp hạng điểm danh dự của liên minh. <color=yellow> (Giải đấu cấp cao sẽ được mở ở giải đấu thứ ba) <color>
	]],
	[4] = [[
	1）Khi loại liên minh là một trận đấu nhiều người chơi, đội trưởng có thể thành lập một đội với những người chơi khác, và lựa chọn các thành viên của đội tham gia vào đội tại các quan chức liên đoàn võ thuật cấp cơ sở (cao cấp) ở các thành phố lớn.
	
	2）Trong suốt mùa giải, tất cả các thành viên trong đội chưa tham gia thi đấu có thể chọn không tham gia đội tại các quan chức liên đoàn võ thuật cấp cơ sở (cấp cao) tại các thành phố lớn.
	
	3）Nếu một đội tham gia Giải đấu võ thuật nâng cao rút khỏi đội vì đội trưởng của đội không nằm trong% s cao nhất của bảng xếp hạng điểm danh dự của liên đoàn, đội đó sẽ bị loại. <color=yellow> (Giải đấu cấp cao sẽ được mở ở giải đấu thứ ba) <color>
	]],
	[5] = [[
	1）Trong quá trình chơi, đội sẽ được trao phần thắng khi tất cả các đối thủ bị thương nặng.
	
	2）Trong quá trình chơi, nếu đấu thủ đối phương không đồng thời ra sân thi đấu thì đội trực tiếp thắng.
	
	3）Sau khi hết thời gian thi đấu, nếu hai bên vẫn chưa có sự phân chia thì đội nào có số đấu thủ còn lại lớn hơn sẽ được phân định thắng thua; nếu số thương còn lại của hai bên bằng nhau thì tổng số thương hiệu của tất cả các cầu thủ của cả hai bên sẽ được sử dụng để xác định đội chiến thắng. Đội nào có tổng số chấn thương hiệu quả nhỏ hơn sẽ thắng. Nếu tổng thương tích hiệu quả là như nhau, nó sẽ bị trói.
	
	4）Tham gia trò chơi, đội nào tạm biệt được phân xử trực tiếp sẽ giành chiến thắng. Thời gian tạm biệt để giành chiến thắng trong trò chơi được tính là 5 phút.
	]],
	[6] = [[
	1）	Phần thưởng game thường xuyên: Sau mỗi trận đấu, bất kể thắng thua, người chơi tham gia đều sẽ được thưởng kinh nghiệm, uy tín liên minh và điểm danh dự liên minh.
	
	2）	Phần thưởng xếp hạng cuối cùng: Theo xếp hạng cuối cùng của giải đấu, người chơi tham gia có thể nhận được phần thưởng cho kinh nghiệm, danh tiếng liên minh và điểm danh dự liên minh. Đồng thời, những người chơi đứng đầu có thể nhận được phần thưởng danh hiệu liên minh đặc biệt.
	]],
}

function tbNpc:About()
	local tbOpt = 
	{
		{"Các bước thì đấu", self.AboutInfo, self, 1},
		{"Thời gian thi đấu", self.AboutInfo, self, 2},
		{"Điều kiện thi đấu", self.AboutInfo, self, 3},
		{"Thao tác liên quan chiến đội", self.AboutInfo, self, 4},
		{"Phương thức quyết định thằng thua", self.AboutInfo, self, 5},
		{"Phần thưởng liên đấu", self.AboutInfo, self, 6},
		{"Kết thúc đối thoại"},
	}
	
	Dialog:Say("<color=gold> Võ Lâm Liên Đấu Là Nơi Thi Đấu Khốc Liệt Nhất Kiếm Thế của nhân sĩ toàn sever Tuyệt Đỉnh KT2009.Com<color>", tbOpt);
end

function tbNpc:AboutInfo(nType)
	if not Wlls.SEASON_TB[Wlls:GetMacthSession()] then
		Dialog:Say("Quan liên đấu: Các võ hiệp tiếp theo vẫn chưa xác định được loại hình, các bạn chú ý đón xem thông báo chính thức nhé.");
		return 0;
	end
	local nRank = Wlls.SEASON_TB[Wlls:GetMacthSession()][3];
	Dialog:Say(string.format(self.tbAbout[nType], nRank, nRank), {{"Quay về", self.About, self},{"Kết thúc đối thoại"}});
end
