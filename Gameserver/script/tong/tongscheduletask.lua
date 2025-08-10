-------------------------------------------------------------------
--File: tongscheduletask.lua
--Author: lbh
--Date: 2007-9-21 9:21
--Describe: bang h?i th?i gian nhi?m v? 
-------------------------------------------------------------------
if not Tong then --?i?u ch?nh th? c?n 
	Tong = {}
	print(GetLocalDate("%Y\\%m\\%d %H:%M:%S").."build ok..")
end

if MODULE_GC_SERVER then
---------------------------GC_SERVER_START----------------------

function Tong:PerTongDailyAction_Timer()
	local cTong = self.PerTongDaily_cNextTong
	if not cTong then
		return 0	--Timerk?t th¨²c 
	end
	local nTongId = self.PerTongDaily_nNextTong
	if cTong.GetTestState() ~= 0 then
		if cTong.GetBuildFund()>= self.TEST_PASS_BUILD_FUND then
			cTong.SetTestState(0)
			KTong.Msg2Tong(nTongId,"ch¨²c m?ng £¬bang h?i d? thu?n l?i ?i qua kh?o nghi?m k? £¡")
		else
			local nLeftTime;
			local nCreateTime = cTong.GetCreateTime();
			if nCreateTime <os.time({year=2008, month=6, day=17}) then		-- 6nguy?t 17nh?t ti?n th¨¤nh l?p bang h?i ?¨ªch c?p 14ng¨¤y kh?o nghi?m k? 
				nLeftTime= self.TONG_TEST_TIME * 2 - GetTime() + nCreateTime;
			else
				nLeftTime= self.TONG_TEST_TIME - GetTime() + nCreateTime;
			end
			if nLeftTime <0 then
				KTong.Msg2Tong(nTongId,"bang h?i ?ang kh?o nghi?m k? n?i ki?n thi?t qu? v? ??t ???c"..self.TEST_PASS_BUILD_FUND.."£¬bang h?i gi?i t¨¢n £¡")
				Tong:DisbandTong_GC(nTongId);
				cTong = nil;	-- ??i t??ng m?t ?i hi?u l?c £¬giao cho nilgi¨¢ tr? 
			else
				KTong.Msg2Tong(nTongId,"bang h?i ly kh?o nghi?m k? k?t th¨²c c¨°n c¨® <color=red>"..math.ceil(nLeftTime / 24 / 3600)..
				"<color>thi¨ºn £¬ph?i ?ang kh?o nghi?m k? n?i s? ki?n thi?t qu? ??t ???c"..self.TEST_PASS_BUILD_FUND.."£¬b?ng kh?ng bang h?i t??ng gi?i t¨¢n £¡")
			end
		end
	end
	if cTong then
		if Tong:MasterVoteDeadLine(nTongId) == 1 then
			Tong:StopMasterVote_GC(nTongId);
		end
		
		local pKinItor = cTong.GetKinItor();
		local nKinId = pKinItor.GetCurKinId();
		local nTotalRepute = 0;
		while nKinId ~= 0 do
			local pKin = KKin.GetKin(nKinId);
			if pKin then
				nTotalRepute = nTotalRepute + pKin.GetTotalRepute();
			end
			nKinId = pKinItor.NextKinId();
		end
		cTong.SetTotalRepute(nTotalRepute);
		GlobalExcute{"Tong:SyncTongTotalRepute_GS2", nTongId, nTotalRepute, self.nJourNum};
		
		if self:CheckAndSpiltStock(nTongId) ~= 1 then
			self:SyncTotalStock(nTongId);
		end
	end
	--if cTong then
		--local nKinCount, nMemberCount = cTong.GetMemberCount();
		--KStatLog.ModifyMax("Tong", cTong.GetName(),"gia t?c s?", nKinCount);		-- ghi l?i gia t?c s? 
		--KStatLog.ModifyMax("Tong", cTong.GetName(),"bang h?i nhan s?", nMemberCount);	-- ghi l?i th¨¤nh vi¨ºn s? 
	--end
	self.PerTongDaily_cNextTong, self.PerTongDaily_nNextTong = KTong.GetNextTong(self.PerTongDaily_nNextTong)
	if not self.PerTongDaily_cNextTong then
		self.PerTongDaily_nNextTong = nil
		return 0
	end
	return 1	--1tr¨¢nh h?u t¨¢i ch?p h¨¤nh 
end

function Tong:PerTongWeeklyAction_Timer()
	local cTong = self.PerTongWeekly_cNextTong
	if not cTong then
		return 0	--Timerk?t th¨²c 
	end
	local nTongId = self.PerTongWeekly_nNextTong
		
	--h¨¤nh ??ng l?c n?y sinh c¨¢i m?i 
	self:RefleshTongEnergy(nTongId)
	--tinh anh t?ng quy?t ??nh 
	self:ExcellentConfirm(nTongId)
	GlobalExcute{"Tong:ExcellentConfirm", nTongId}
	
	--tu?n tr??c chia hoa h?ng c¨® hi?u l?c 
	self:DealTakeStock(nTongId)

	-- vi bang h?i ng?u nhi¨ºn chu m?c ti¨ºu 
	self:PerTongWeeklyAction_GC(self.PerTongWeekly_cNextTong, self.PerTongWeekly_nNextTong);
	
	--k? ti?p bang h?i 
	self.PerTongWeekly_cNextTong, self.PerTongWeekly_nNextTong = KTong.GetNextTong(self.PerTongWeekly_nNextTong)
	if not self.PerTongWeekly_cNextTong then
		self.PerTongWeekly_nNextTong = nil
		self.bIsTongWeeklyActionOver = 1;
		if (Kin.bIsKinWeeklyActionOver and 1 == Kin.bIsKinWeeklyActionOver) then
			Kin:RecordWeeklyActionNo();	-- ghi l?i L?u Thu? h¨¤o 
			Kin:LogWeeklyTaskLevel();	-- ? gia t?c v¨¤ bang h?i ??u gi? g¨¬n sau khi ho¨¤n th¨¤nh b? chu m?c ti¨ºu ?¨ªch logvi?t ti?n s? c? kh? 
			self.bIsTongWeeklyActionOver = 0;
			Kin.bIsKinWeeklyActionOver = 0;
		end
		return 0
	end
	return 1	--1tr¨¢nh h?u t¨¢i ch?p h¨¤nh 
end


function Tong:DailyPresidentConfirm_Timer()
	local cTong = self.PerTongPresident_cNextTong;
	if not cTong then
		return 0;	--Timerk?t th¨²c 
	end
	local nTongId = self.PerTongPresident_nNextTong;
	local nKinId = cTong.GetPresidentKin();			-- th? l?nh gia t?c 
	local nMemberId = cTong.GetPresidentMember();	-- th? l?nh th¨¤nh vi¨ºn 
	local pKin = KKin.GetKin(nKinId);
	local bConfirm = 0;
	if not pKin or pKin.GetBelongTong() ~= nTongId then
		bConfirm = 1;
	elseif pKin then
		local pMember = pKin.GetMember(nMemberId);
		if not pMember then
			bConfirm = 1;
		end
	end
	if tonumber(os.date("%w", GetTime())) == self.PRESDIENT_CONFIRM_WDATA then		-- c?n ch?n m?t l?n th? l?nh,??ng th?i quy?t ??nh quan h¨¤m 
		self:PresidentConfirm_GC(nTongId, 1)			
	elseif bConfirm == 1 then							-- th? l?nh ly khai bang h?i li?u ~c?n ch?n m?t l?n th? l?nh ~b?t quy?t ??nh quan h¨¤m 
		self:PresidentConfirm_GC(nTongId)
	elseif tonumber(os.date("%w", GetTime())) == 5 then
		self:PresidentCandidateConfirm_GC(nTongId)
	end
	--k? ti?p bang h?i 
	self.PerTongPresident_cNextTong, self.PerTongPresident_nNextTong = KTong.GetNextTong(nTongId);
	if not self.PerTongPresident_cNextTong then
		self.PerTongPresident_cNextTong = nil
		self.PerTongPresident_nNextTong = 0
		return 0
	end
	return 1;
end

function Tong:PerTongVoteStat_Timer()
	_DbgOut("PerTongVoteStat_Timer")
	if not self.MasterVote_anVoteStatTongId then
		return 0
	end
	-- l?y ra m?t Tong
	local nTongId = table.remove(self.MasterVote_anVoteStatTongId)
	-- d? vi Tr?ng 
	if not nTongId then
		self.MasterVote_anVoteStatTongId = nil
		return 0
	end
	self:StopMasterVote_GC(nTongId);
	return 1
end


--bang h?i h?ng ng¨¤y x? ly 
function Tong:PerTongDailyStart()
	_DbgOut("PerTongDailyStart")
	self.PerTongDaily_cNextTong, self.PerTongDaily_nNextTong = KTong.GetFirstTong()
	if not self.PerTongDaily_cNextTong then
		_DbgOut("no tong");
		return 0
	end
	Timer:Register(1, self.PerTongDailyAction_Timer, self)
	return 0
end


function Tong:PerTongWeeklyStart()
	_DbgOut("PerWeeklyStart")
	local nWeek = tonumber(GetLocalDate("%W"))
	--n?u nh? ???ng chu d? kh?i ??ng qu¨¢ kh?ng kh?i ??ng 
	if KGblTask.SCGetDbTaskInt(DBTASK_TONG_WEEKLY) == nWeek then
		return 0
	end
	self.PerTongWeekly_cNextTong, self.PerTongWeekly_nNextTong = KTong.GetFirstTong()
	if not self.PerTongWeekly_cNextTong then
		self.bIsTongWeeklyActionOver = 1;
		if (Kin.bIsKinWeeklyActionOver and 1 == Kin.bIsKinWeeklyActionOver) then
			Kin:RecordWeeklyActionNo();	-- ghi l?i L?u Thu? h¨¤o 
			Kin:LogWeeklyTaskLevel();	-- ? gia t?c v¨¤ bang h?i ??u gi? g¨¬n sau khi ho¨¤n th¨¤nh b? chu m?c ti¨ºu ?¨ªch logvi?t ti?n s? c? kh? 
			self.bIsTongWeeklyActionOver = 0;
			Kin.bIsKinWeeklyActionOver = 0;
		end
		_DbgOut("no tong")
		return 0
	end
	Timer:Register(1, self.PerTongWeeklyAction_Timer, self)
	--b?n ghi ch¨¦p chu d? ch?p h¨¤nh 
	KGblTask.SCSetDbTaskInt(DBTASK_TONG_WEEKLY, nWeek)	
	return 0
end

-- bang h?i th? l?nh x? ly 
function Tong:DailyPresidentConfirm()
	_DbgOut("DailyPresidentConfirm");
	if tonumber(os.date("%w", GetTime())) == self.PRESDIENT_CONFIRM_WDATA then				-- th? hai c?n gi? g¨¬n quan h¨¤m 
		local nOfficialMainTainNo = KGblTask.SCGetDbTaskInt(DBTASK_OFFICIAL_MAINTAIN_NO);
		KGblTask.SCSetDbTaskInt(DBTASK_OFFICIAL_MAINTAIN_NO, nOfficialMainTainNo + 1);
	end
	self.PerTongPresident_cNextTong, self.PerTongPresident_nNextTong = KTong.GetFirstTong()
	if not self.PerTongPresident_cNextTong then
		_DbgOut("no tong");
		return 0
	end
	Timer:Register(1, self.DailyPresidentConfirm_Timer, self)
	return 0
end

-- b?t ??u b¨¬nh ?u 
function Tong:StartGreatMemberVote()
	self.StartGreatMemberVote_pNextTong, self.StartGreatMemberVote_nNextTongId = KTong.GetFirstTong()
	if not self.StartGreatMemberVote_pNextTong then
		_DbgOut("no tong");
		return 0;
	end
	if tonumber(os.date("%w", GetTime())) == self.GREAT_MEMBER_VOTE_START_DAY then				-- th? s¨¢u b?t ??u 
		local nCurNo = KGblTask.SCGetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO) + 1
		KGblTask.SCSetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO, nCurNo);
		Timer:Register(1, self.StartGreatMemberVote_Timer, self);
		return 0;
	end
end

-- t?ng bang s? b?t ??u b¨¬nh ?u 
function Tong:StartGreatMemberVote_Timer()
	local pTong = self.StartGreatMemberVote_pNextTong;
	if not pTong then
		return 0;	--Timerk?t th¨²c 
	end
	local nTongId = self.StartGreatMemberVote_nNextTongId;
	
	Tong:StartGreatMemberVote_GC(nTongId);
		
	self.StartGreatMemberVote_pNextTong, self.StartGreatMemberVote_nNextTongId = KTong.GetNextTong(self.StartGreatMemberVote_nNextTongId)
	if not self.StartGreatMemberVote_pNextTong then
		self.StartGreatMemberVote_nNextTongId = nil;
		return 0;
	end
	return 1;	--1tr¨¢nh h?u t¨¢i ch?p h¨¤nh 
end

-- k?t th¨²c b¨¬nh ?u 
function Tong:EndGreatMemberVote()
	self.EndGreatMemberVote_pNextTong, self.EndGreatMemberVote_nNextTongId = KTong.GetFirstTong()
	if not self.EndGreatMemberVote_pNextTong then
		_DbgOut("no tong");
		return 0;
	end
	if tonumber(os.date("%w", GetTime())) == self.GREAT_MEMBER_VOTE_END_DAY then				-- ch? nh?t b?t ??u 
		Timer:Register(1, self.EndGreatMemberVote_Timer, self);
		return 0;
	end
end

-- t?ng bang h?i k?t th¨²c b¨¬nh ?u 
function Tong:EndGreatMemberVote_Timer()
	local pTong = self.EndGreatMemberVote_pNextTong;
	if not pTong then
		return 0;	--Timerk?t th¨²c 
	end
	local nTongId = self.EndGreatMemberVote_nNextTongId;
	
	Tong:EndGreatMemberVote_GC(nTongId);
		
	self.EndGreatMemberVote_pNextTong, self.EndGreatMemberVote_nNextTongId = KTong.GetNextTong(self.EndGreatMemberVote_nNextTongId)
	if not self.EndGreatMemberVote_pNextTong then
		self.EndGreatMemberVote_nNextTongId = nil;
		return 0;
	end
	return 1;	--1tr¨¢nh h?u t¨¢i ch?p h¨¤nh 
end



----------------------GC_SERVER_END------------------------------
end

if MODULE_GAMESERVER then
----------------------GAME_SERVER_START---------------------------

---------------------GAME_SERVER_END------------------------------
end
