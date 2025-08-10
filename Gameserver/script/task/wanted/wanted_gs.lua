--quan phủ phát lệnh truy nã nhiệm vụ 
--tôn đa lương 
--2008.08.05
Require("\\script\\task\\wanted\\wanted_def.lua");

--trắc thí sử dụng,Hoàn thành nhiệm vụ 
function Wanted:_Test_FinishTask()
	if Task:GetPlayerTask(me).tbTasks[Wanted.TASK_MAIN_ID] then
		for _, tbCurTag in ipairs(Task:GetPlayerTask(me).tbTasks[Wanted.TASK_MAIN_ID].tbCurTags) do
			if (tbCurTag.OnKillNpc) then
				if (tbCurTag:IsDone()) then
					--giết chết Bossngoạn gia đích Đồng đội trên người có nhiệm vụ hoàn thành điệu hát thịnh hành dùng 	
					if me.GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
						me.SetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH, 0);
					end
					break;
				end;
				tbCurTag.nCount	= tbCurTag.nCount + 1;		
				local tbSaveTask	= tbCurTag.tbSaveTask;
				if (MODULE_GAMESERVER and tbSaveTask) then	-- tự hành đồng bộ đáo hộ khách đoan ，yêu cầu hộ khách đoan nảy sinh cái mới 
					tbCurTag.me.SetTask(tbSaveTask.nGroupId, tbSaveTask.nStartTaskId, tbCurTag.nCount, 1);
					KTask.SendRefresh(tbCurTag.me, tbCurTag.tbTask.nTaskId, tbCurTag.tbTask.nReferId, tbSaveTask.nGroupId);
				end;
								
				if (tbCurTag:IsDone()) then	-- bản mục tiêu Cómột ngày đạt thành hậu sẽ không mất đi hiệu lực đích 
					tbCurTag.me.Msg("Mục tiêu:"..tbCurTag:GetStaticDesc());
					tbCurTag.tbTask:OnFinishOneTag();
				end;
				
				--giết chết Bossngoạn gia đích Đồng đội trên người có nhiệm vụ hoàn thành điệu hát thịnh hành dùng 				
				if me.GetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH) == 1 then
					me.SetTask(Wanted.TASK_GROUP, Wanted.TASK_FINISH, 0);
				end
			end
		end;
	end
end

function Wanted:GetLevelGroup(nLevel)
	if nLevel <self.LIMIT_LEVEL then
		return 0;
	end
	local nMax = 0;
	for ni, nLevelSeg in ipairs(self.LevelGroup) do
		if nLevel <= nLevelSeg then
			return ni;
		end
		nMax = ni;
	end
	return nMax;
end

function Wanted:GetTask(nTaskId)
	return me.GetTask(self.TASK_GROUP, nTaskId);
end

function Wanted:SetTask(nTaskId, nValue)
	return me.DirectSetTask(self.TASK_GROUP, nTaskId, nValue);
end

function Wanted:Check_Task()
	if me.nLevel <self.LIMIT_LEVEL then
		return 3;
	end
	if self:GetTask(self.TASK_FIRST) == 0 then
		if self:GetTask(self.TASK_COUNT) == 0 then
			self:SetTask(self.TASK_COUNT, self.Day_COUNT);
		end
		self:SetTask(self.TASK_FIRST, 1);
	end
	--if self:GetTask(self.TASK_ACCEPT_ID) <= 0 then
	--	return 0;
	--end
	local tbTask = Task:GetPlayerTask(me).tbTasks[self.TASK_MAIN_ID];
	if not tbTask then
		--self:SetTask(self.TASK_ACCEPT_ID, 0);
		return 0;	--vị tiếp nhận chức vụ vụ 
	end
	
	if self:CheckTaskFinish() == 1 then
		return 1;	--dĩ hoàn thành 
	else
		return 2;	--vẫn chưa xong 
	end
	return 0;
end

function Wanted:CheckLimitTask()
	
	
	--giang hồ uy vọng phán đoán 
	if (me.nPrestige <self.LIMIT_REPUTE) then
		local szFailDesc ="Uy danh giang hồ chưa đạt 50, không thể nhận nhiệm vụ.";
		Dialog:Say(szFailDesc);
		return 0;
	end
	
	local nType = self:GetLevelGroup(me.nLevel);
	if nType <= 0 then
		Dialog:Say("Bổ Đầu Hình Bộ: Đại hiệp, đáo ngài loại cảnh giới này ，trên giang hồ những Tiểu Mao Tặc na phải dùng tới ngươi xuất thủ 。");
		return 0;
	end
	if self:GetTask(self.TASK_COUNT) <= 0 then
		Dialog:Say("Bổ Đầu Hình Bộ: Đại hiệp, không còn nhiệm vụ có thể nhận.")
		return 0;
	end
	return 1;	
end

-- kiểm tra đo lường nhiệm vụ ngoại trừ giao vật phẩm nhiệm vụ ở ngoài có còn hay không vẫn chưa xong đích mục tiêu 
function Wanted:CheckTaskFinish()
	local tbTask		= Task:GetPlayerTask(me).tbTasks[self.TASK_MAIN_ID];
	
	-- còn có vẫn chưa xong đích mục tiêu 
	for _, tbCurTag in pairs(tbTask.tbCurTags) do
		if (not tbCurTag:IsDone()) then
			return 0;
		end;
	end;
	
	-- toàn bộ mục tiêu hoàn thành 
	return 1;
end;

function Wanted:SingleAcceptTask()
	if self:Check_Task() ~= 0 then
		return 0;
	end
	if self:CheckLimitTask() ~= 1 then
		return 0;
	end
	local nType = self:GetLevelGroup(90);
	local tbOpt = {};
	for i=1, nType do 
		table.insert(tbOpt, {string.format("Nhiệm vụ cấp %s",40+i*10), self.GetRandomTask, self, i});
	end
	table.insert(tbOpt, {"Để ta suy nghĩ đã"});
	Dialog:Say("Bạn có thể nhận các nhiệm vụ sau đây, nhiệm vụ cấp càng cao càng khó.", tbOpt);
end

function Wanted:GetRandomTask(nLevelSeg)
	if self:CheckLimitTask() ~= 1 then
		return 0;
	end	
	if self.TaskLevelSeg[nLevelSeg] then
		local nP = Random(#self.TaskLevelSeg[nLevelSeg]) + 1;
		local nTaskId = self.TaskLevelSeg[nLevelSeg][nP];
		self:AcceptTask(nTaskId, nLevelSeg);
		return nTaskId;
	end
end

function Wanted:AcceptTask(nTaskId, nLevelSeg)
	if self:Check_Task() ~= 0 then
		return 0;
	end
	if self:CheckLimitTask() ~= 1 then
		return 0;
	end
	Task:DoAccept(self.TASK_MAIN_ID, nTaskId);
	self:SetTask(self.TASK_ACCEPT_ID, nTaskId);
	self:SetTask(self.TASK_LEVELSEG, nLevelSeg);
	self:SetTask(self.TASK_FINISH, 1);
	self:SetTask(self.TASK_COUNT, self:GetTask(self.TASK_COUNT) -1);
	
	-- ghi lại tham gia số lần 
	local nNum = me.GetTask(StatLog.StatTaskGroupId, 4) + 1;
	me.SetTask(StatLog.StatTaskGroupId, 4, nNum);
	
	-- ghi lại ngoạn gia tham gia quan phủ phát lệnh truy nã đích số lần 
	Stats.Activity:AddCount(me, Stats.TASK_COUNT_WANTED, 1);
end

function Wanted:CaptainAcceptTask()
	local tbTeamMembers, nMemberCount	= me.GetTeamMemberList();
	local tbPlayerName	 = {};
	if (not tbTeamMembers) then
		Dialog:Say("Bổ đầu hình bộ: Bạn không ở trong nhóm bất kỳ nào.");
		return;
	end
	if self:Check_Task() ~= 0 then
		return 0;
	end
	if self:CheckLimitTask() ~= 1 then
		return 0;
	end
	local nType = self:GetLevelGroup(me.nLevel);
	local tbOpt = {};
	for i=1, nType do 
		table.insert(tbOpt, {string.format("%s nhiệm vụ thứ ",40+i*10), self.TeamAcceptTask, self, i});
	end
	table.insert(tbOpt, {"Để ta suy nghĩ lại"});
	Dialog:Say("Bạn có thể lựa chọn nhiệm vụ cấp cao và khó khăn hơn.", tbOpt);
		
end

function Wanted:TeamAcceptTask(nLevelSeg, nFlag)
	local tbTeamMembers, nMemberCount	= me.GetTeamMemberList();
	local tbPlayerName	 = {};
	if (not tbTeamMembers) then
		Dialog:Say("Bổ đầu hình bộ: Bạn chưa có tổ đội!");
		return;
	end
	local nTeamTaskId = 0;
	if nFlag == 1 then
		nTeamTaskId = self:GetRandomTask(nLevelSeg);
	end
	local pOldMe = me;
	local nOldIndex	= me.nPlayerIndex
	local nCaptainLevel	= me.nLevel;	-- 隊長的等級
	local szCaptainName =  me.szName;	-- 隊長的名字
	
	for i=1, nMemberCount do
		if (nOldIndex ~= tbTeamMembers[i].nPlayerIndex) then
			
			me = tbTeamMembers[i];
			if self:Check_Task() == 0 and self:CheckLimitTask() == 1 and self:GetLevelGroup(me.nLevel) >= nLevelSeg then
					if nFlag == 1 and nTeamTaskId > 0 then
						local szMsg = string.format("Bổ đầu hình bộ: Bạn đã trở thành đội trưởng<color=yellow>%s<color>Bạn muốn chia sẻ nhiệm vụ cùng người khác: %s Nhiệm vụ thứ - <color=green>theo dõi các tên Hải tặc%s<color>,bạn có chấp nhận làm nhiệm vụ? ", szCaptainName, (40 + nLevelSeg*10),self.TaskFile[nTeamTaskId].szTaskName);
						local tbOpt = 
						{
							{"Đồng ý", self.AcceptTask, self, nTeamTaskId, nLevelSeg},
							{"Không"},
						}
						Dialog:Say(szMsg, tbOpt);
					else
						table.insert(tbPlayerName, {tbTeamMembers[i].nPlayerIndex, tbTeamMembers[i].szName});
					end
			end;
		end;
	end;
	me = pOldMe;
	
	if nFlag == 1 then
		return
	end
	
	if #tbPlayerName <= 0 then
		Dialog:Say("Bổ đầu hình bộ: không có nhóm chia sẽ nhiệm vụ với bạn, đội hình chia sẻ phải đảm bảo những điều kiện sau: <color=yellow>\n\n   nhóm phù hợp với mức độ khó và phụ thuộc nhóm trưởng\n    Nhiệm vụ đã bỏ lỡ, muốn hủy nhiệm vụ\n    Giới hạn nhiệm vụ đã đạt mức tối đa\n    Phạm vi gần đội trưởng\n    Nhóm đủ 50 uy danh giang hồ<color>\n");
		return;
	end;
	
	local szMembersName	= "\n";
	
	for i=1, #tbPlayerName do
		szMembersName = szMembersName.."<color=yellow>"..tbPlayerName[i][2].."<color>\n";
	end;
	local szMsg = string.format("Bổ đầu hình bộ: nhiệm vụ phù hợp có thể chia sẻ với đồng đội của bạn: \n%s\n bạn có đồng ý chia sẻ?", szMembersName);
	local tbOpt = 
	{
		{"Vâng,tôi đồng ý", self.TeamAcceptTask, self, nLevelSeg, 1},
		{"Không,cám ơn"},
	}
	Dialog:Say(szMsg, tbOpt);	
end

function Wanted:CancelTask(nFlag)
	if self:Check_Task() ~= 2 then
		return 0;
	end
	if nFlag == 1 then
		self:SetTask(self.TASK_ACCEPT_ID, 0);
		self:SetTask(self.TASK_FINISH, 0);
		Task:CloseTask(self.TASK_MAIN_ID,"giveup");
		return;
	end
	local szMsg ="Bổ Đầu Hình Bộ: Ngươi có chắc chắn muốn hủy nhiệm vụ?";
	local tbOpt = {
		{"Ta muốn hủy nhiệm vụ", self.CancelTask, self, 1},
		{"Để ta suy nghĩ đã"}
	}
	Dialog:Say(szMsg, tbOpt);
	return;
end

function Wanted:FinishTask()
	if self:Check_Task() ~= 1 then
		return 0;
	end	
	self:ShowAwardDialog()	
end

-- thầy trò thành tựu ：quan phủ phát lệnh truy nã 
function Wanted:GetAchievement(pPlayer)
	if (not pPlayer) then
		return;
	end
	
	-- nLevleđích cụ thể trị số đối ứng đẳng cấp và phối trí văn kiện"\\setting\\task\\wanted\\level_group.txt"tương đồng 
	local nLevel = self:GetTask(self.TASK_LEVELSEG);
	local nAchievementId = 0;
	if (1 == nLevel) then
		nAchievementId = Achievement.TONGJI_55;
	elseif (2 == nLevel) then
		nAchievementId = Achievement.TONGJI_65;
	elseif (3 == nLevel) then
		nAchievementId = Achievement.TONGJI_75;
	elseif (4 == nLevel) then
		nAchievementId = Achievement.TONGJI_85;
	elseif (5 == nLevel) then
		nAchievementId = Achievement.TONGJI_95;
	end
	
	Achievement:FinishAchievement(pPlayer.nId, nAchievementId);
end

function Wanted:AwardFinish()
	if self:Check_Task() ~= 1 then
		return 0;
	end
	
		 	local nEvent = ConfigAll.KhoiDong_NL_Event_TongKim
			local NguyenLieu_Event = ConfigAll.NguyenLieu_Event
			
				if nEvent == 1 then 
					me.AddStackItem(NguyenLieu_Event[1], NguyenLieu_Event[2], NguyenLieu_Event[3], NguyenLieu_Event[4],nil,5);----5 Giỏ Event
				end 
	self:SetTask(self.TASK_LEVELSEG, 0);
	self:SetTask(self.TASK_ACCEPT_ID, 0);
	self:SetTask(self.TASK_FINISH, 0);
	me.AddOfferEntry(10, WeeklyTask.GETOFFER_TYPE_WANTED);
	
	-- tăng bang hội kiến thiết tài chính và tương ứng tộc trưởng 、cá nhân đích công ty cổ phần 	
	local nStockBaseCount = 6; -- công ty cổ phần số đếm 			
	Tong:AddStockBaseCount_GS1(me.nId, nStockBaseCount, 0.8, 0.15, 0.05, 0, 0, WeeklyTask.GETOFFER_TYPE_WANTED);
	
	if (me.GetTrainingTeacher()) then	-- nếu như ngoạn gia đích thân phận Cóđồ đệ ，như vậy thầy trò nhiệm vụ ở giữa đích phát lệnh truy nã nhiệm vụ số lần gia 1
		-- local tbItem = Item:GetClass("teacher2student");
		local nNeed_Wanted = me.GetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_WANTED) + 1;
		me.SetTask(Relation.TASK_GROUP, Relation.TASK_ID_SHITU_WANTED, nNeed_Wanted);
	end
	Task:CloseTask(self.TASK_MAIN_ID,"finish");
		-- me.AddRepute(13,1,10)

	--thêm vào thưởng cho 
	local nFreeCount, tbFunExecute = SpecialEvent.ExtendAward:DoCheck("FinishWanted", me);
	SpecialEvent.ExtendAward:DoExecute(tbFunExecute);
	
	-- thầy trò thành tựu ：quan phủ phát lệnh truy nã 
	self:GetAchievement(me);
end

-- căn cứ chọn lấy ra đích thưởng cho biểu cấu thành thưởng cho mặt hãy 
function Wanted:ShowAwardDialog()
	local tbGeneralAward = {}; -- tối hậu truyền tới thưởng cho mặt hãy kịch bản gốc đích số liệu kết cấu 
	local szAwardTalk	="Kể từ hòa nghị Long Hưng, các nơi có chút bình yên. Nhưng gần đây xuất hiện không ít Hải Tặc quấy nhiễu dân lành. Để khôi phục trị an, Hình Bộ nha môn ra lệnh truy nã Hải Tặc, kêu gọi người trong Võ Lâm tương trợ, vì dân trừ hại. Đại hiệp, Danh Bổ Lệnh này cho ngài, hy vọng ngài có thể giúp dân truy bắt Hải Tặc.";	-- thưởng cho thì nói 

	tbGeneralAward.tbFix	= {};
	tbGeneralAward.tbOpt = {};
	tbGeneralAward.tbRandom = {};
	local nNum = self.AWARD_LIST[self:GetTask(self.TASK_LEVELSEG)]
	local nFreeCount = SpecialEvent.ExtendAward:DoCheck("FinishWanted");
	if me.CountFreeBagCell() < 6 then
	Dialog:Say("Phải Có 6 Ô, May túi ba gang ra đây mà đựng");
	return 0;
end
	table.insert(tbGeneralAward.tbFix,
				{
					szType="item", 
					varValue={self.ITEM_MINGBULING[1],self.ITEM_MINGBULING[2],self.ITEM_MINGBULING[3],self.ITEM_MINGBULING[4]}, 
					nSprIdx="",
					szDesc="Danh Bổ Lệnh", 
					szAddParam1=nNum
				}
			);

	GeneralAward:SendAskAward(szAwardTalk, 
							tbGeneralAward, {"Wanted:AwardFinish", Wanted.AwardFinish});
end;

function Wanted:Day_SetTask(nDay)
	if me.nLevel <self.LIMIT_LEVEL then
		return 0;
	end
	local nCount = self.Day_COUNT * nDay;
	if self:GetTask(self.TASK_COUNT) + nCount> self.LIMIT_COUNT_MAX then
		nCount = self.LIMIT_COUNT_MAX - self:GetTask(self.TASK_COUNT);
	end
	self:SetTask(self.TASK_COUNT, self:GetTask(self.TASK_COUNT) + nCount);
	if self:GetTask(self.TASK_FIRST) == 0 then
		self:SetTask(self.TASK_FIRST, 1);
	end
end

PlayerSchemeEvent:RegisterGlobalDailyEvent({Wanted.Day_SetTask, Wanted});
