
-- đệ nhị tằng bên trái đích BOSS
local tbNpc_1	= Npc:GetClass("caishiquboss");

tbNpc_1.ENTRYWAY_RATE = 50; --đánh chết BOSShậu xuất hiện bí kính đích xác suất 

function tbNpc_1:OnDeath(pNpc)
	local nSubWorld, nNpcPosX, nNpcPosY	= him.GetWorldPos();

	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	tbInstancing.nCaiShiQuPass = 1;
	local pPlayer 	= pNpc.GetPlayer();
	
	local nEntryWayRate = MathRandom(100);
	if (self.ENTRYWAY_RATE> nEntryWayRate) then	
		-- khai ra bí kính 
		
		local pEntryway = KNpc.Add2(4114, 1, -1, nSubWorld, nNpcPosX, nNpcPosY);
		local tbNpcData = pEntryway.GetTempTable("Task");
		tbNpcData.nEntrancePlayerId = pPlayer.nId;
		tbNpcData.nEntryMapId	= nSubWorld;
		KTeam.Msg2Team(pPlayer.nTeamId, pPlayer.szName.."phát hiện liễu đi thông Phục Ngưu Sơn Trang đích bí kính ！");
	end;
	
	KNpc.Add2(2793, 1, -1, nSubWorld, 1694, 3862);
	local tbPlayList, nCount = KPlayer.GetMapPlayer(tbInstancing.nMapId)
	
	-- dùng sinh lão ngoạn gia triệu hồi nhiệm vụ hoàn thành nhiệm vụ ký lục 
--	local tbMemberList = pPlayer.GetTeamMemberList();	
	for _, player in ipairs(tbPlayList) do 
		Task.OldPlayerTask:AddPlayerTaskValue(player.nId, 2082, 4);
	end;
	
	-- tăng đội trường đích lãnh tụ vinh dự 
	local tbHonor = {[3] = 24, [4] = 36, [5] = 48, [6] = 60}; -- 3、4、5、6nhân đội trường đích lãnh tụ vinh dự biểu 
	local tbTeamPlayer,_ = KTeam.GetTeamMemberList(pPlayer.nTeamId);	
	if tbHonor[nCount] and tbTeamPlayer then
		PlayerHonor:AddPlayerHonorById_GS(tbTeamPlayer[1], PlayerHonor.HONOR_CLASS_LINGXIU, 0, tbHonor[nCount]);
	end
	
	-- bốn lần nhiệm vụ 
	for _, player in ipairs(tbPlayList) do 
		local tbPlayerTasks	= Task:GetPlayerTask(player).tbTasks;
		local tbTask1 = tbPlayerTasks[381];
		local tbTask2 = tbPlayerTasks[429]
		if ((tbTask1 and tbTask1.nReferId == 565) or (tbTask2 and tbTask2.nReferId == 622)) then
			player.SetTask(1022, 200, player.GetTask(1022, 200) + 1);
		end;
		--------Thưởng 
		ConfigAll.PhucNguuSonQD()
			player.SetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID,player.GetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID)+1);
		-- ngạch ngoại tưởng lệ quay về điều 
		local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("ArmyCampBoss", player);
		SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	end;

end

