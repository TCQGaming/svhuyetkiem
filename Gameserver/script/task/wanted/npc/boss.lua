--quan phủ phát lệnh truy nã ，bossrơi xuống 
--tôn đa lương 
--2008.08.13

local tbBoss = Npc:GetClass("wanted")

function tbBoss:OnDeath(pNpc)
	if not Wanted.DROPRATE[him.nLevel] then
		return
	end
	local pPlayer = pNpc.GetPlayer();
	if not pPlayer then
		return
	end
	local tbStudentList 	= {};
	local tbTeammateList 	= {};
	local tbPlayerList = {};

	-- Đồng đội đếm hết 
	local tbTeamMembers, nMemberCount	= pPlayer.GetTeamMemberList();
	self:AddFriendFavor(tbTeamMembers, nMemberCount);
	
	if (tbTeamMembers) then
		for i = 1, nMemberCount do
			if (pPlayer.nPlayerIndex ~= tbTeamMembers[i].nPlayerIndex) then
				if (Task:AtNearDistance(pPlayer, tbTeamMembers[i]) == 1) then
					if Task:GetPlayerTask(tbTeamMembers[i]).tbTasks[Wanted.TASK_MAIN_ID] then
						for _, tbCurTag in ipairs(Task:GetPlayerTask(tbTeamMembers[i]).tbTasks[Wanted.TASK_MAIN_ID].tbCurTags) do
							if (tbCurTag.OnKillNpc) then
								if (tbCurTag:IsDone()) then
									--giết chết Bossngoạn gia đích Đồng đội trên người có nhiệm vụ hoàn thành điệu hát thịnh hành dùng 	
									if tbTeamMembers[i].GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
										tbTeamMembers[i].SetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH, 0);
										if math.floor(him.nLevel / 10) == math.floor(tbTeamMembers[i].nLevel / 10) or him.nLevel>= 95 then
											tbTeamMembers[i].AddKinReputeEntry(1,"tongji"); 		-- phù hợp đẳng cấp đoạn gia uy vọng 
										end	
										
										-- dùng cho lão ngoạn gia triệu hồi nhiệm vụ Hoàn thành nhiệm vụ ghi lại 
										Task.OldPlayerTask:AddPlayerTaskValue(tbTeamMembers[i].nId, 2082, 2);
									end
									break;
								end;
	
								if (tbCurTag.nNpcTempId ~= him.nTemplateId) then
									break;
								end;
								if (tbCurTag.nMapId ~= 0 and tbCurTag.nMapId ~= him.nMapId) then
									
									break;
								end;
								
								tbCurTag.nCount	= tbCurTag.nCount + 1;		
								local tbSaveTask	= tbCurTag.tbSaveTask;
								if (MODULE_GAMESERVER and tbSaveTask) then	-- tự hành đồng bộ đáo hộ khách đoan ，yêu cầu hộ khách đoan nảy sinh cái mới 
									tbCurTag.me.SetTask(tbSaveTask.nGroupId, tbSaveTask.nStartTaskId, tbCurTag.nCount, 1);
									KTask.SendRefresh(tbCurTag.me, tbCurTag.tbTask.nTaskId, tbCurTag.tbTask.nReferId, tbSaveTask.nGroupId);
								end;
												
								if (tbCurTag:IsDone()) then	-- bản mục tiêu là một ngày đạt thành hậu sẽ không mất đi hiệu lực đích 
									tbCurTag.me.Msg("Mục tiêu đạt được:"..tbCurTag:GetStaticDesc());
									tbCurTag.tbTask:OnFinishOneTag();
								end;
								
								--giết chết Bossngoạn gia đích Đồng đội trên người có nhiệm vụ hoàn thành điệu hát thịnh hành dùng 				
								if tbTeamMembers[i].GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
									tbTeamMembers[i].SetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH, 0);
									if math.floor(him.nLevel / 10) == math.floor(tbTeamMembers[i].nLevel / 10) or him.nLevel>= 95 then
										tbTeamMembers[i].AddKinReputeEntry(1,"tongji"); 		-- phù hợp đẳng cấp đoạn gia uy vọng 
									end	
									-- dùng cho lão ngoạn gia triệu hồi nhiệm vụ Hoàn thành nhiệm vụ ghi lại 
									Task.OldPlayerTask:AddPlayerTaskValue(tbTeamMembers[i].nId, 2082, 2);
								end
							end
						end;
					end
				end
			end
		end
	end
	
	--giết chết Bossngoạn gia trên người có nhiệm vụ hơn nữa lần đầu tiên hoàn thành sử thuyên chuyển 
	if (pPlayer) then
		
		if Task:GetPlayerTask(pPlayer).tbTasks[Wanted.TASK_MAIN_ID] then
			for _, tbCurTag in ipairs(Task:GetPlayerTask(pPlayer).tbTasks[Wanted.TASK_MAIN_ID].tbCurTags) do
				if (tbCurTag.OnKillNpc) then
					if (tbCurTag.nNpcTempId ~= him.nTemplateId) then
						break;
					end;
					if (tbCurTag.nMapId ~= 0 and tbCurTag.nMapId ~= him.nMapId) then
						break;
					end;
					if pPlayer.GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
						local nLuck = Wanted.DROPLUCK + pPlayer.nCurLucky;
						pPlayer.DropRateItem(Wanted.DROPRATE[him.nLevel], 16, nLuck, -1, him);
						pPlayer.SetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH, 0);
						if math.floor(him.nLevel / 10) == math.floor(pPlayer.nLevel / 10) or him.nLevel>= 95 then
							pPlayer.AddKinReputeEntry(1,"tongji");		-- phù hợp đẳng cấp đoạn gia uy vọng 
						end	
						
						-- dùng cho lão ngoạn gia triệu hồi nhiệm vụ Hoàn thành nhiệm vụ ghi lại 
						Task.OldPlayerTask:AddPlayerTaskValue(pPlayer.nId, 2082, 2);
						
						--thêm vào rơi xuống 
						local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("WantedBoss", pPlayer);
						SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
					end
				end
			end;
		end
	end
	
end

function tbBoss:HaveTag(pPlayer)
	local bRet = 0;
	if Task:GetPlayerTask(pPlayer).tbTasks[Wanted.TASK_MAIN_ID] and pPlayer.GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
		for _, tbCurTag in ipairs(Task:GetPlayerTask(pPlayer).tbTasks[Wanted.TASK_MAIN_ID].tbCurTags) do
			if (tbCurTag.OnKillNpc) then
				if (tbCurTag.nNpcTempId ~= him.nTemplateId) then
					break;
				end;
				if (tbCurTag.nMapId ~= 0 and tbCurTag.nMapId ~= him.nMapId) then
					break;
				end;
				bRet = 1;
			end		
		end
	end
	return bRet;	
end

function tbBoss:AddFriendFavor(tbTeamMembers, nMemberCount)
	if (not tbTeamMembers) then
		return; 
	end
	
	local tbTaskTeam = {};
	for i =1, nMemberCount do 
		if (self:HaveTag(tbTeamMembers[i]) == 1) then
			table.insert(tbTaskTeam, tbTeamMembers[i]);
		end
	end
	
	for i =1, #tbTaskTeam do 
		for j = i + 1, #tbTaskTeam do
			if (tbTaskTeam[i].IsFriendRelation(tbTaskTeam[j].szName) == 1) then
				Relation:AddFriendFavor(tbTaskTeam[i].szName, tbTaskTeam[j].szName, 20);
				tbTaskTeam[i].Msg(string.format("Độ thân mật giữa bạn và <color=yellow>%s<color> tăng %d điểm.", tbTaskTeam[j].szName, 20));
				tbTaskTeam[j].Msg(string.format("Độ thân mật giữa bạn và <color=yellow>%s<color> tăng %d điểm.", tbTaskTeam[i].szName, 20));
			end
		end
	end
end
