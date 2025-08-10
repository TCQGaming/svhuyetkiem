
function CTC:Register_GS()
	if CTC:CheckTime() == false then
		return;
	end
	KDialog.MsgToGlobal( "<color=cyan>Công Thành Chiến<color> đã bắt đầu báo danh, Bang hội nào muốn tham gia Bang Chủ hãy đến <pos=8,1710,3370><color=yellow>Tướng Viễn Chinh Thiết Phù<color> ở <color=gold>Giang Tân Thôn<color> báo danh");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,"<color=cyan>Công Thành Chiến<color> đã bắt đầu báo danh, Bang hội nào muốn tham gia Bang Chủ hãy đến <pos=8,1710,3370><color=yellow>Tướng Viễn Chinh Thiết Phù<color> ở <color=gold>Giang Tân Thôn<color> báo danh");

	local nMapIndex = SubWorldID2Idx(CTC.MapID);
	if nMapIndex < 0 then
		return;
	end
	CTC.Winner = 0;
	CTC.Result = {};
	KDialog.MsgToGlobal( "<color=cyan>Công Thành Chiến<color> đã bắt đầu báo danh, Bang hội nào muốn tham gia Bang Chủ hãy đến <pos=8,1710,3370><color=yellow>Tướng Viễn Chinh Thiết Phù<color> ở <color=gold>Giang Tân Thôn<color> báo danh");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,"<color=cyan>Công Thành Chiến<color> đã bắt đầu báo danh, Bang hội nào muốn tham gia Bang Chủ hãy đến <pos=8,1710,3370><color=yellow>Tướng Viễn Chinh Thiết Phù<color> ở <color=gold>Giang Tân Thôn<color> báo danh");
	CTC.TongList = {};
	CTC:ResetFile();--add xoa file txt khi bat dau su kien moi'
	CTC:xoalognhanthuongbc()----Xóa log nhận thưởng các bang chủ
	self.nTimerId_BD_1 = Timer:Register(1 * Env.GAME_FPS, self.StartGame_CB, self);--add gan time dem nguoc end su kien
	self.nTimerId_BD = Timer:Register(CTC.CTC_TIME_BD * Env.GAME_FPS, self.StartGame_GS, self);--add gan time dem nguoc end su kien
	CTC.Show_Line_BD = 1;
	CTC.Show_Line_NT = 0;
	CTC.ThanhLong  = "";
	CTC.HuyenVu  = "";
	CTC.ChuTuoc  = "";
	CTC.BachHo  = "";
	CTC.NgaiVang = "";
end
function CTC:StartGame_GS()
	if CTC:CheckTime() == false then
		return;
	end
	self.CreatNPC();
	Map:RegisterMapForbidReviveType(CTC.MapID, 0, 1, "Trong Công thành chiến, tất cả các bản đồ chinh chiến sẽ không thể sử dụng Cửu Chuyển Tục Mệnh Hoàn để hồi sinh!")
	self.ReadyTimerId =	Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self);
	self.nTimerId = Timer:Register(CTC.CTC_TIME * Env.GAME_FPS, self.EndGame_GS, self);--jie add gan time dem nguoc end su kien
		local szMsgBatDauCTC = string.format("<color=cyan>Công Thành Chiến<color> đã bắt đầu mau mau di chuyển ra bản đồ chiến đấu");
	-- KDialog.MsgToGlobal( "<color=green>Công Thành Chiến<color> đã bắt đầu mau mau di chuyển ra bản đồ chiến đấu");
	-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,"<color=green>Công Thành Chiến<color> đã bắt đầu đã bắt đầu mau mau di chuyển ra bản đồ chiến đấu");
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsgBatDauCTC);
	KDialog.MsgToGlobal(szMsgBatDauCTC);
	CTC.Show_Line_BD = 0;
	Timer:Close(self.nTimerId_BD);
	Timer:Close(self.nTimerId_BD_1);
end
-------------------------------
----------Time chuan bi--------
function CTC:StartGame_CB()	
	--print("StartGame_CB");
	if not CTC.PlayerList then
		return 0
	end
	self:AddAroundPlayersExp_CB();							-- 给Npc周围队伍玩家加经验
	return 3 * Env.GAME_FPS;
end 
function CTC:AddAroundPlayersExp_CB()
	local tbPlayer = CTC.PlayerList;
	for _, nPlayerId in pairs(tbPlayer) do
		self:AddExp2Player_CB(nPlayerId);
	end	
end
--script\CTC\ctc_gs.lua
function CTC:AddExp2Player_CB(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local nMapId, nX, nY = pPlayer.GetWorldPos();
	local szMsg = "";
	local nResTime_CB = CTC:GetRestTime1();
		if nResTime_CB > 0 and nMapId == CTC.MapID then
			Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian chuẩn bị còn: <color=white>%s<color><color>\n", nResTime_CB);
			Dialog:ShowBattleMsg(pPlayer, 1,  0); --开启界面
	--[[	else
			if CTC.Check_ThongBao_SK == 0 then
				Dialog:SendBlackBoardMsg(pPlayer, "Công Thành Chiến đã bắt đầu - Mau Mau Di Chuyển");
				pPlayer.Msg("Công Thành Chiến đã bắt đầu - Mau Mau Di Chuyển");
			--	CTC:StartGame_GS();
				CTC.Check_ThongBao_SK = 1;
			end]]
		else
			return 0;	
		end	
--	Dialog:SendBattleMsg(pPlayer,szMsg, 1);
--	Dialog:ShowBattleMsg(pPlayer, 1, 0);		
		
end
function CTC:GetRestTime1()
	if self.nTimerId_BD > 0 then
		return Timer:GetRestTime(self.nTimerId_BD);
	end
	return 0;
end
-----------------------------
function CTC:GetRestTime()
	if self.nTimerId > 0 then
		return Timer:GetRestTime(self.nTimerId);
	end
	return 0;
end
--------------------------
function CTC:OnNpcTimer()	
	if not CTC.PlayerList then
		return 0
	end
	self:AddAroundPlayersExp();							-- 给Npc周围队伍玩家加经验
	return 3 * Env.GAME_FPS;
end 

function CTC:AddAroundPlayersExp()
	local tbPlayer = CTC.PlayerList;
	for _, nPlayerId in pairs(tbPlayer) do
		self:AddExp2Player(nPlayerId);
	end	
end
--script\CTC\ctc_gs.lua
function CTC:AddExp2Player(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local szMsg = "<color=cyan>Xếp hạng CTC<color>: \n";
	local tbSort = CTC.Result;
	table.sort(tbSort, self._SortDamage);
	local nDamage = 0;
		for i=1,#tbSort  do
			nDamage = nDamage + tbSort[i][2];
		end
	for i = 1, #tbSort do
	
		if tbSort[i] then
			local szCaptainName = nil;
			local szTKName		= "Không";
					local nTongId		= tbSort[i][1];
					local pTong			= KTong.GetTong(nTongId);
					szTKName	=  pTong.GetName();
				szMsg = szMsg .. string.format("Hạng %d: ", i) .. "Bang <color=yellow>" .. szTKName .. "<color> đạt <color=yellow>".. tbSort[i][2] .." điểm<color>\n";
		end
	end
	szMsg =	szMsg .."\n\nQuy tắc tính điểm CTC\n"..
					"<color=yellow>Chiếm Long Trụ + "..CTC.Point[1].." điểm<color>\n"..
					"<color=yellow>Chiếm Ngai Vàng + "..CTC.Point[2].." điểm<color>\n"..
					"<color=yellow>Bảo Vệ Trụ & Ngai Vàng + "..CTC.Point[3].." điểm<color>\n"..
					"<color=yellow>Giết Địch Được 0 điểm<color>\n\n"..
					"<color=cyan>Chiến Báo<color>\n"..
					"Long Trụ Huyền Vũ: <color=yellow>"..CTC.HuyenVu.."<color>\n"..
					"Long Trụ Bạch Hổ: <color=yellow>"..CTC.BachHo.."<color>\n"..
					"Long Trụ Chu Tước: <color=yellow>"..CTC.ChuTuoc.."<color>\n"..
					"Long Trụ ThanhLong: <color=yellow>"..CTC.ThanhLong.."<color>\n"..
					"Ngai Vàng: <color=yellow>"..CTC.NgaiVang.."<color>\n"..
					"";
	local nMapId, nX, nY = pPlayer.GetWorldPos();
	if nMapId == CTC.MapID then
		Dialog:SendBattleMsg(pPlayer,szMsg, 1);
		Dialog:ShowBattleMsg(pPlayer, 1, 0);
	end
		local nResTime = CTC:GetRestTime();

		if nResTime > 0 and nMapId == CTC.MapID then
			if pPlayer.nPkModel == Player.emKPK_STATE_PRACTISE then
				pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER;-- chuyen pk emKPK_STATE_BUTCHER
			end
			Dialog:SetBattleTimer(pPlayer, "<color=green>Thời gian còn lại: <color=white>%s<color><color>\n", nResTime);
			Dialog:ShowBattleMsg(pPlayer, 1,  0); --开启界面
		else
			return 0;
		end
end

CTC._SortDamage = function(tbDamage1, tbDamage2)
	return tbDamage1[2] > tbDamage2[2];
end
-----------------------------------------
function CTC:FindPlayer(pPlayer)
	if not pPlayer then
		return false;
	end
	for _,nPlayerId in pairs(CTC.PlayerList) do
		if pPlayer.nId == nPlayerId then
			return true;
		end
	end
	return false;
end
function CTC:FindMax(tbArr)
	local nMax = 0;
	local pos = 0;
	if not tbArr then
		return;
	end
	for	i = 1,#tbArr do
		if tbArr[i] > nMax then
		nMax = tbArr[i];
		pos = i;
		end
	end
	return pos;
end
function CTC:FindPosTong(tbArr,nValue)
	local pos = 0;
	if not tbArr then
		return;
	end
	for	i = 1,#tbArr do
		if tbArr[i][1] == nValue then
		
		pos = i;
		break;
		end
	end
	return pos;
end
function CTC:FindPosTongList(tbArr,nValue)
	local pos = 0;
	if not tbArr then
		return;
	end
	for	i = 1,#tbArr do
		if tbArr[i] == nValue then
		
		pos = i;
		break;
		end
	end
	return pos;
end
function CTC:CheckRegister()
	for i = 1,#CTC.TongList do
		if CTC.TongList[i] == me.dwTongId then
		return true;
		end
	end
	return false;
end
function CTC:Check()
	
	if (me.dwTongId == 0) then 
		Dialog:Say("Bạn không gia nhập bang hội.");
		return false;
	end
	if CTC.CheckRegister() == false then
		Dialog:Say("Bang hội của bạn chưa báo danh.");
		return false;
	end
	return true;
end
function CTC:CreatNPC()
	local tbNpc	= Npc:GetClass("ctc_longtru");
	local tbData = {};
	local nMapIndex = SubWorldID2Idx(CTC.MapID);
	if nMapIndex < 0 then
		return;
	end
	
	for i =1,4 do
		local pNpc = KNpc.Add2(CTC.NPCIDLongTru[i][1],CTC.NPCLevel,-1,unpack(CTC.NPCIDLongTru[i][2]));
		Npc:RegPNpcOnDeath(pNpc, tbNpc.OnDeath_Boss, self,0);
		--pNpc.SetMaxLife(CTC.NPC_MAX_LIFE);
	end

		local pNpc2 = KNpc.Add2(CTC.NPCNgaiVang[1],CTC.NPCLevel,-1,unpack(CTC.NPCNgaiVang[2]));
		--pNpc2.SetMaxLife(CTC.NPC_MAX_LIFE);
		Npc:RegPNpcOnDeath(pNpc2, tbNpc.OnDeath_Boss, self,0);
end
function CTC:CheckTime()
	if  CTC.ISOPEN ~= 1 then
		return false;
	end
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))
	if nWeekDay == CTC.WEEKDAY then
		return true;
	end
	return false;
end
function CTC:GMOption()
		local tbNpc = Npc:GetClass("ctcchefu");
		local tbOpt = {
			{"1-Bắt đầu báo danh CTC",self.Register_GS,self},
			{"Xa phu",tbNpc.OnDialog,tbNpc},
			{"2-Bắt đầu hoạt động CTC",self.StartGame_GS,self},
			{"3-Kết thúc hoạt động CTC",self.EndGame_GS,self},
			
			
		};
	Dialog:Say("Hỗ trợ GM hoạt động Công thành",tbOpt);
end

function CTC:EndGame_GS()
	if CTC:CheckTime() == false then
		return;
	end
	CTC.TongList = {};
	self:CheckWinner(CTC.Result);
	self:MoveAllPlayer(CTC.PlayerList);
	if self.ReadyTimerId ~= 0 then
		Timer:Close(self.ReadyTimerId);
	end
	if self.nTimerId ~= 0 then
		Timer:Close(self.nTimerId);
	end
	self.nTimerId = 0;
	-------
	CTC.PlayerList = {};
	self.ReadyTimerId = 0;
	self.DelAllNPC();
	-------------
	CTC.Winner = 0;
	CTC.Result = {};
	CTC.Check_ThongBao_SK = 0;
	CTC.nTimerId_BD = 0;
	CTC.nTimerId_BD_1 = 0;
	CTC.Show_Line_NT = 1; -- active dong nhan thuong
	------------------------
end

function CTC:MoveAllPlayer(tbPlayer)
	for _,nPlayerId in pairs(CTC.PlayerList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if  pPlayer then
			if self.ReadyTimerId ~= 0 and CTC.Winner ~= 0 then
				self:AddAward(pPlayer);
			end
		--pPlayer.NewWorld(29,1623,3953);
		local nMapId, nX, nY = pPlayer.GetWorldPos();
		if nMapId == CTC.MapID then
			pPlayer.NewWorld(24,1765,3491);
		end
			Dialog:SendBattleMsg(pPlayer,"", 1);
			Dialog:ShowBattleMsg(pPlayer, 0, 0); 
		end

	end
end

function CTC:CheckWinner(tbResult)
	if not tbResult then
	return 0;
	end
	local nmax=0;
	local win = 0;
	for i = 1,#tbResult do
		if tbResult[i][2] > nmax then
		nmax = tbResult[i][2];
		win = tbResult[i][1];
		end
	end
	CTC.Winner = win;
	if CTC.Winner ~= 0 then
		local pTong = KTong.GetTong(CTC.Winner);
		local szTongName = pTong.GetName();
		KTong.Msg2Tong(CTC.Winner, "Chúc mừng bang ".. szTongName.. " giành chiến thắng chung cuộc");
		KDialog.MsgToGlobal( "<color=green>Công Thành Chiến<color> đã kết thúc, chúc mừng <color=yellow>"..szTongName.."<color> đã giành chiến thắng chung cuộc");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,"<color=green>Công Thành Chiến<color> đã kết thúc, chúc mừng <color=yellow>"..szTongName.."<color> đã giành chiến thắng chung cuộc");
	else
		KDialog.MsgToGlobal( "<color=green>Công Thành Chiến<color> đã kết thúc");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,"<color=green>Công Thành Chiến<color> đã kết thúc");

	end
end
function CTC:DelAllNPC()
	ClearMapNpcWithName(CTC.MapID,"Ngai Vàng Huyền Vũ");
	ClearMapNpcWithName(CTC.MapID,"Ngai Vàng Bạch Hổ");
	ClearMapNpcWithName(CTC.MapID,"Ngai Vàng Chu Tước");
	ClearMapNpcWithName(CTC.MapID,"Ngai Vàng Thanh Long");
	ClearMapNpcWithName(CTC.MapID,"Ngai Vàng Hoàng Đế");
	ClearMapNpc(CTC.MapID);
end

