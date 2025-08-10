-------------------------------------------------------------------
--File: tonglogic_gs.lua
--Author: lbh
--Date: 2007-9-6 11:24
--Describe: Gameserverbang hội ăn khớp 
-------------------------------------------------------------------
if not Tong then --điều chỉnh thử cần 
	Tong = {}
	print(GetLocalDate("%Y\\%m\\%d %H:%M:%S").."build ok..")
else
	if not MODULE_GAMESERVER then
		return
	end
end

Tong.c2sFun = {}
--đăng kí có thể bị hộ khách ngay thẳng nhận thuyên chuyển đích hàm số 
local function RegC2SFun(szName, fun)
	Tong.c2sFun[szName] = fun
end

function Tong:CreateTongApply_GS1(szTongName, nCamp)
	return self:DlgCreateTong(1, szTongName, nCamp)
end
RegC2SFun("CreateTong", Tong.CreateTongApply_GS1)

--GS1hậu tố biểu thị xin ăn khớp ，GS2hậu tố biểu thị kết quả ăn khớp 
--dĩ liệt biểu đích KinIdsáng tạo bang hội 
if not Tong.aTongCreateApply then
	Tong.aTongCreateApply={}
end

function Tong:CreateTong_GS1(anKinId, szTongName, nCamp, nPlayerId)
	if self.aTongCreateApply[nPlayerId] then
		return 0;
	end
	--bang hội tên tính hợp pháp kiểm tra 
	local nLen = GetNameShowLen(szTongName);
	if nLen <6 or nLen> 12 then
		return -1
	end
	--có hay không cho phép từ đơn phạm vi 
	if KUnify.IsNameWordPass(szTongName) ~= 1 then
		return -2
	end
	--có hay không bao hàm mẫn cảm tự xuyến 
	if IsNamePass(szTongName) ~= 1 then
		return -3
	end
	--kiểm tra bang hội danh có hay không dĩ chiếm dụng 
	if KTong.FindTong(szTongName) ~= nil then
		return -4
	end
	--kiểm tra sáng tạo bang hội đích gia tộc có hay không phù hợp yêu cầu 
	if self:CanCreateTong(anKinId) ~= 1 then
		return -5
	end
	_DbgOut("Tong:CreateTong_GS1")
	self.aTongCreateApply[nPlayerId] = {anKinId, szTongName, nCamp};
	return GCExcute{"Tong:CreateTongApply_GC", nPlayerId, szTongName}
end

function Tong:OnTongNameResult_GS2(nPlayerId, nResult)
	local tbParam = self.aTongCreateApply[nPlayerId]
	if not tbParam then
		return;
	end
	Tong.aTongCreateApply[nPlayerId] = nil;
	
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not cPlayer) then
		return;
	end
	
	if nResult ~= 1 then
		cPlayer.Msg("Tên bang đã tồn tại, hãy thử tên khác");
		return;
	end
	
	if cPlayer.CostMoney(self.CREATE_TONG_MONEY, Player.emKPAY_CREATETONG) ~= 1 then
		return 0
	end
	--giải tán đội ngũ 
	KTeam.DisbandTeam(cPlayer.nTeamId)
	
	GCExcute{"Tong:CreateTong_GC", unpack(tbParam)}
end

function Tong:CreateTong_GS2(anKinId, szTongName, nCamp, nCreateTime)
	local cTong, nTongId = self:CreateTong(anKinId, szTongName, nCamp, nCreateTime)
	if not cTong then
		return 0
	end
	for _, nKinId in ipairs(anKinId) do
		Kin:JoinTong_GS2(nKinId, szTongName, nTongId, nCamp)
	end
	return KTongGs.TongClientExcute(nTongId, {"Tong:CreateTong_C2", szTongName, nCamp, anKinId[1]})
end

function Tong:DisbandTong_GS2(nTongId)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0
	end
	--chọn thông tri ，tái cắt bỏ bang hội 
	KTongGs.TongClientExcute(nTongId, {"Tong:DisbandTong_C2"})
	--local cKinItor = cTong.GetKinItor()
	--local nKinId = cKinItor.GetCurKinId()
	--while nKinId ~= 0 do
	--	Kin:LeaveTong_GS2(nTongId, nKinId,)
	--	nKinId = cKinItor.NextKinId()
	--end
	KTong.DelTong(nTongId);
	return 1;
end

function Tong:ChangeMaster_GS2(nTongId, nKinId, nDataVer)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0
	end
	local nOrgMaster = cTong.GetMaster()
	local cKinOrg = KKin.GetKin(nOrgMaster)
	-- hồi phục thì ra là gia tộc chức vị 
	if cKinOrg then
		cKinOrg.SetTongFigure(self.CAPTAIN_NORMAL)
	end
	cTong.SetMaster(nKinId)
	local cKin = KKin.GetKin(nKinId)
	if not cKin then
		return 0
	end
	cKin.SetTongFigure(self.CAPTAIN_MASTER)
	-- canh tân xưng hào 
	local cMemberOrg = cKinOrg.GetMember(cKinOrg.GetCaptain())
	if cMemberOrg then
		KKinGs.UpdateKinInfo(cMemberOrg.GetPlayerId())
	end
	local cMember = cKin.GetMember(cKin.GetCaptain())
	if cMember then
		KKinGs.UpdateKinInfo(cMember.GetPlayerId())
	end
	local szNewMaster = KGCPlayer.GetPlayerName(cMember.GetPlayerId());
	local szOldMaster = KGCPlayer.GetPlayerName(cMemberOrg.GetPlayerId());
	cTong.AddAffairChangeMaster(szNewMaster, szOldMaster);
	cTong.SetTongDataVer(nDataVer);
	return KTongGs.TongClientExcute(nTongId, {"Tong:ChangeMaster_C2", szNewMaster})
end

-- bãi miễn bang chủ 
function Tong:FireMaster_GS1(nTongId, nKinId, nMemberId)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0;
	end
	
	if Tong:CheckPresidentRight(nTongId, nKinId, nMemberId) ~= 1 then
		me.Msg("Bạn không có quyền hạn bãi miễn Bang chủ");
		return 0;
	end
	
	local nNowDay = tonumber(os.date("%y%m%d", GetTime()));
	local nFireMasterDate = tonumber(os.date("%y%m%d", cTong.GetFireMasterDate()));

	if nFireMasterDate == nNowDay then
		me.Msg("Hôm nay bạn đã bãi miễn Bang chủ 1 lần rồi, hãy đợi ngày mai mới có thể tiếp tục");
		return 0;
	end
	
	return GCExcute{"Tong:FireMaster_GC", nTongId, nKinId, nMemberId}
end
RegC2SFun("FireMaster", Tong.FireMaster_GS1);

function Tong:FireMaster_GS2(nTongId, nTime)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0;
	end
	
	cTong.SetMasterLockState(1);
	cTong.SetFireMasterDate(nTime);
	Tong:StartMasterVote_GS1(nTongId);
	
	local nMasterId = self:GetMasterId(nTongId);
	local szName = KGCPlayer.GetPlayerName(nMasterId);
	KTong.Msg2Tong(nTongId, string.format("<color=red>%s<color>Bang chủ đã bị bãi miễn", szName));
end


--bang chủ tranh cử （khởi động đan một bang hội đích tranh cử ）
function Tong:StartMasterVote_GS1(nTongId)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 1
	end
	--tranh cử dĩ khởi động ，tắc bất năng tái khởi động 
	if cTong.GetVoteStartTime() ~= 0 then
		--me.Msg("bản bang lần này tranh cử một kết thúc ，bất năng lần thứ hai mở ra tranh cử!");
		return 0
	end
	return GCExcute{"Tong:StartMasterVote_GC", nTongId}
end

function Tong:StartMasterVote_GS2(nTongId, nStartTime)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	cTong.SetVoteStartTime(nStartTime);
	KTong.Msg2Tong(nTongId, "Bình chọn Bang chủ đã bắt đầu, các trưởng lão có thể bỏ phiếu trong giao diện Bang hội")
	return 1;
end

--đình chỉ đan một bang hội đích tranh cử 
function Tong:StopMasterVote_GS1(nTongId)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0;
	end
	if cTong.GetVoteStartTime() == 0 then
		return 0;
	end
	return GCExcute{"Tong:StopMasterVote_GC", nTongId}
end

function Tong:StopMasterVote_GS2(nTongId, nKinId, nMaxBallot)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	if cTong.GetVoteStartTime() == 0 then
		return 0;
	end
	cTong.SetVoteCounter(0);
	cTong.SetVoteStartTime(0);
	local itor = cTong.GetKinItor();
	local nCurKinId = itor.GetCurKinId();
	while nCurKinId ~= 0 do
		local cKin = KKin.GetKin(nCurKinId);
		if cKin then
			--清空投票数据
			cKin.SetTongVoteBallot(0);
			cKin.SetTongVoteJourNum(0);
			-- 清空各家族成员的投票状态
			local itor = cKin.GetMemberItor();
			local cMember = itor.GetCurMember();
			while cMember do
				cMember.SetTongVoteState(0);
				cMember = itor.NextMember();
			end	
		end
		nCurKinId = itor.NextKinId();
	end
	if nKinId == 0 or nMaxBallot == 0 then
		KTong.Msg2Tong(nTongId, "Bình chọn Bang chủ kết thúc, các trưởng lão không bỏ phiếu, Bang chủ hiện tại tiếp tục giữ chức vụ")
		--解除帮主锁定状态
		cTong.SetMasterLockState(0);
		return 1;
	end
	local cKinNewMaster = KKin.GetKin(nKinId)
	if cKinNewMaster then
		local nMasterId = Tong:GetMasterId(nTongId);
		local szName = KGCPlayer.GetPlayerName(nMasterId);
		KTong.Msg2Tong(nTongId, "Bình chọn Bang chủ kết thúc,<color=white>"..cKinNewMaster.GetName()..
			"<color> Tộc trưởng tộc <color=green>"..szName.."<color> đạt <color=red>"..(nMaxBallot / 100).."%<color> phiếu, được bầu làm Bang chủ mới")
	end
	--解除帮主锁定状态
	cTong.SetMasterLockState(0);
	return 1;
end

-- đầu phiếu 
function Tong:ElectMaster_GS1(nTagetKinId, nTagetMemberId)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local cSelfKin = KKin.GetKin(nSelfKinId);
	local cMember = cSelfKin.GetMember(nSelfMemberId);

	local cTong = KTong.GetTong(nTongId);
	if not cTong or not cMember then 
		return 0;
	end
	
	if cTong.GetVoteStartTime() == 0 then 
		me.Msg("Hiện không phải thời gian bình chọn Bang chủ, không thể bỏ phiếu");
		return 0;
	end

	if cMember.GetTongVoteState() == 1 then
		me.Msg("Bạn đã bỏ phiếu rồi");
		return 0;
	end

	local cTagetKin = KKin.GetKin(nTagetKinId);
	if not cTagetKin then
		return 0;
	end
	if nTagetMemberId ~= cTagetKin.GetCaptain() then
		me.Msg("Đối tượng không phải trưởng lão");
		return 0;
	end
	if nTongId ~= cTagetKin.GetBelongTong() then
		me.Msg("Gia tộc này không thuộc Bang hội")
		return 0;
	end
	
	if cMember.GetPersonalStock() <= 0 then
		me.Msg("Bạn không phải cổ đông, không thể bỏ phiếu")
		return 0;
	end

	return GCExcute{"Tong:ElectMaster_GC", nTongId, nTagetKinId, nTagetMemberId, nSelfKinId, nSelfMemberId}
end
RegC2SFun("ElectMaster", Tong.ElectMaster_GS1);


function Tong:ElectMaster_GS2(nTongId, nTagetKinId, nSelfKinId, nSelfMemberId, nVoteCount, nVote)
	local cSelfKin = KKin.GetKin(nSelfKinId);
	local cTagetKin = KKin.GetKin(nTagetKinId);
	if (not cSelfKin) or (not cTagetKin) then
		return 0;
	end

	cTagetKin.SetVoteCounter(nVoteCount);
	cTagetKin.SetTongVoteBallot(nVote);
	
	local nTagetCaptainId = cTagetKin.GetCaptain();
	local cSelfMember = cSelfKin.GetMember(nSelfMemberId);
	local cTagetMember = cTagetKin.GetMember(nTagetCaptainId);
	if (not cTagetMember) or (not cSelfMember) then
		return 0;
	end

	cSelfMember.SetTongVoteState(1); --	tiêu chí đã đầu phiếu 
	
	local szSelfName = KGCPlayer.GetPlayerName(cSelfMember.GetPlayerId());
	local szTagetName = KGCPlayer.GetPlayerName(cTagetMember.GetPlayerId());
	local pPlayer = KPlayer.GetPlayerObjById(cSelfMember.GetPlayerId());
	if pPlayer then
		pPlayer.Msg("Bạn bỏ phiếu cho<color=yellow>"..szTagetName.."<color>");
	end
	
--	if nVote>= 5000 then
--		GCExcute{"Tong:StopMasterVote_GC", nTongId};
--		return;
--	end
	
	return KTongGs.TongClientExcute(nTongId, {"Tong:ElectMaster_C2", szSelfName, szTagetName, nVote})
end

-- thân xin gia nhập bang hội 
function Tong:ApplyJoin_GS1(nPlayerId)
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not cPlayer) then
		return 0;
	end
	local nTongId = cPlayer.dwTongId;
	local nPlayerKinId, nPlayerMemberId = cPlayer.GetKinMember();
	if not nTongId or nTongId == 0 then
		me.Msg("Đối tượng không có Bang hội");
		return 0;
	end
	if self:HaveFigure(nTongId, nPlayerKinId, nPlayerMemberId, self.POW_RECRUIT) ~= 1 then
		me.Msg("Đối tượng không có quyền tuyển mộ gia tộc")
		return 0;
	end
	local nKinId, nMemberId = me.GetKinMember();
	if Kin:CheckSelfRight(nKinId, nMemberId, 2) ~= 1 then
		me.Msg("Bạn không phải tộc trưởng hoặc phó tộc trưởng của một gia tộc");
		return 0;
	end
	local cKin = KKin.GetKin(nKinId);
	if cKin.GetBelongTong() ~= 0 then
		me.Msg("Gia tộc của bạn đã gia nhập Bang hội");
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	-- if cTong.GetKinCount() >= self.MAX_KIN_NUM then
		if cTong.GetKinCount()>= ConfigAll.SoLuongTocTrongBangHoi then
		me.Msg("Số lượng gia tộc trong Bang hội đã đạt giới hạn "..ConfigAll.SoLuongTocTrongBangHoi.." gia tộc rồi");
		return 0;
	end
	me.Msg("Bạn đã gia nhập Bang hội ["..cTong.GetName().."]！");
	return cPlayer.CallClientScript({"Tong:ApplyJoin_C2", nKinId, nMemberId, cKin.GetName(), me.szName});
end
RegC2SFun("JoinTong", Tong.ApplyJoin_GS1);

function Tong:JoinReply_GS1(nKinId, nMemberId, nAccept)
	local cKin = KKin.GetKin(nKinId);
	if not cKin then
		return 0;
	end
	local nCaptainId = cKin.GetCaptain()
	local cCaptain = cKin.GetMember(nCaptainId);
	if not cCaptain then
		return 0
	end
	local cPlayer = KPlayer.GetPlayerObjById(cCaptain.GetPlayerId());
	if nAccept ~= 1 then
		if not cPlayer then
			return 0;
		end	
		cPlayer.Msg("<color=white>"..me.szName.."<color> từ chối đơn xin gia nhập bang hội của bạn");
		return 0;
	end
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local nRetCode, cMember = self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_RECRUIT);
	if nRetCode ~= 1 then
		me.Msg("Bạn không có có quyền chiêu mộ gia tộc")
		return 0;
	end
	if Kin:HaveFigure(nKinId, nMemberId, 2) ~= 1 then
		me.Msg("Đối tượng không phải Tộc trưởng hoặc Phó tộc trưởng");
		return 0;
	end
	if not cMember then 
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	-- if cTong.GetKinCount()>= self.MAX_KIN_NUM then
	if cTong.GetKinCount()>= ConfigAll.SoLuongTocTrongBangHoi then
		me.Msg("Số lượng gia tộc trong Bang hội đã đạt giới hạn "..ConfigAll.SoLuongTocTrongBangHoi.." gia tộc rồi");
		return 0;
	end
	GCExcute{"Tong:KinAdd_GC", nTongId, nKinId};
end
RegC2SFun("JoinReply", Tong.JoinReply_GS1);

--mời gia tộc thêm vào 
function Tong:InviteAdd_GS1(nPlayerId)
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if (not cPlayer) then
		return 0
	end
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_RECRUIT) ~= 1 then
		me.Msg("Bạn không có quyền chiêu mộ gia tộc");
		return 0;
	end
	local nKinId, nMemberId = cPlayer.GetKinMember();
	if Kin:HaveFigure(nKinId, nMemberId, 2) ~= 1 then
		me.Msg("Đối tượng không phải Tộc trưởng hoặc Phó tộc trưởng");
		return 0;
	end
	local cKin = KKin.GetKin(nKinId);
	if (not cKin) then
		return 0;
	end
	if cKin.GetBelongTong() ~= 0 then
		me.Msg("Đối phương đã có Bang hội");
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	-- if cTong.GetKinCount()>= self.MAX_KIN_NUM then
	if cTong.GetKinCount()>= ConfigAll.SoLuongTocTrongBangHoi then
		me.Msg("Số lượng gia tộc trong Bang hội của bạn đã đạt giới hạn "..ConfigAll.SoLuongTocTrongBangHoi.." gia tộc rồi")
		return 0;
	end
	me.Msg("Bạn đã mời gia tộc <color=white>"..cKin.GetName().."<color> gia nhập Bang hội")
	return cPlayer.CallClientScript({"Tong:InviteAdd_C2", me.nId, cTong.GetName(), me.szName})
end
RegC2SFun("InviteAdd", Tong.InviteAdd_GS1);

-- trả lời thuyết phục bang hội mời 
function Tong:InviteAddReply_GS1(nPlayerId, bAccept)
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	local nKinId, nMemberId = me.GetKinMember();
	if Kin:CheckSelfRight(nKinId, nMemberId, 2) ~= 1 then
		me.Msg("Bạn không phải Tộc trưởng hoặc Phó tộc trưởng, không có quyền xin gia nhập Bang hội");
		return 0;
	end
	if not cPlayer then
		me.Msg("Đối phương không trên mạng")
		return 0;
	end
	local nTongId = cPlayer.dwTongId;
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0
	end
	if (bAccept ~= 1) then
		cPlayer.Msg("<color=white>"..me.szName.."<color> đã từ chối lời mời gia nhập Bang hội của bạn");
		return 0
	end
	local cTagetKin = KKin.GetKin(nKinId);
	if not cTagetKin then 
		return 0;
	end
	-- if cTong.GetKinCount()>= self.MAX_KIN_NUM then
	if cTong.GetKinCount()>= ConfigAll.SoLuongTocTrongBangHoi then
		me.Msg("Số lượng gia tộc trong Bang hội của bạn đã đạt giới hạn\nTổng hiện nay : "..ConfigAll.SoLuongTocTrongBangHoi.." gia tộc")
		return 0;
	end
	return GCExcute{"Tong:KinAdd_GC", nTongId, nKinId};
end
RegC2SFun("InviteAddReply", Tong.InviteAddReply_GS1);

function Tong:KinAdd_GS2(nDataVer, nTongId, nKinId, nCreateTime)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	local cKin = KKin.GetKin(nKinId)
	if not cKin then
		return 0;
	end
	local nRepute, nAddFund = self:_AddKin2Tong(nTongId, cTong, nKinId, nCreateTime, 0) -- 0 biểu thị phi sáng tạo bang hội thì thêm vào bang hội 
	if not nRepute then
		return 0;
 	end
	-- phi sáng tạo bang hội thì thêm vào bang hội đích muốn tiến hành uy vọng tính toán 
	local nCurRepute = cTong.GetTotalRepute()
	if (nRepute> 0) then
		nCurRepute = nCurRepute + nRepute;
		cTong.SetTotalRepute(nCurRepute);
	end
	cTong.SetTongDataVer(nDataVer);
	local szKinName = cKin.GetName();
	cTong.AddHistoryKinJoin(szKinName);
	return KTongGs.TongClientExcute(nTongId, {"Tong:KinAdd_C2", szKinName, nRepute, nAddFund});
end

-- khai trừ gia tộc 
function Tong:FireKin_GS1(nTagetKinId)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_MASTER) ~= 1 then
		me.Msg("Bạn không phải Bang chủ, không có quyền này");
		return 0;
	end
	local cTong = KTong.GetTong(me.dwTongId);
	if (not cTong) then
		me.Msg("Bạn không có Bang hội, không thể khai trừ gia tộc");
		return 0;
	end
	
	if (nTagetKinId == cTong.GetPresidentKin()) then
		me.Msg("Không thể khai trừ Tộc trưởng")
		return 0;
	end 
	
	if (nTagetKinId == cTong.GetMaster()) then
		me.Msg("Không thể khai trừ gia tộc của Bang chủ, hãy bãi miễn Bang chủ trước")
		return 0;
	end 
	
	local cKin = KKin.GetKin(nTagetKinId);
	if (not cKin) then
		me.Msg("Gia tộc không tồn tại");
		return 0;
	end
	if (cKin.GetBelongTong() ~= nTongId) then
		me.Msg("Gia tộc này không thuộc về Bang hội");
	end
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
	if tbData.nApplyEvent and tbData.nApplyEvent == 1 then
		me.Msg("Không thể đồng thời khai trừ gia tộc 2 lần, lần trước vẫn chưa kết thúc")
		return 0
	end
	return GCExcute{"Tong:FireKin_GC", nTongId, nSelfKinId, nSelfMemberId, nTagetKinId};
end
RegC2SFun("FireKin", Tong.FireKin_GS1);

function Tong:FireKin_GS2(nTongId, nSelfKinId, nPlayerId, nTagetKinId)
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
	tbData.nApplyEvent 	= 1;
	tbData.tbAccept 	= {};		-- gia tộc tỏ thái độ biểu 
	tbData.nCount		= 0;
	if not tbData.ApplyRecord then
		tbData.ApplyRecord = {};
	end
	tbData.ApplyRecord.nTagetKinId = nTagetKinId;
	tbData.ApplyRecord.nSelfKinId = nSelfKinId;		-- ghi lại thân thỉnh gia tộc ，cai gia tộc hưởng ứng vô hiệu 
	tbData.ApplyRecord.nPlayerId = nPlayerId;
	tbData.ApplyRecord.nPow = 0;
	tbData.nTimerId = Timer:Register(
		self.FIREKIN_APPLY_LAST,
		self.CancelExclusiveEvent_GS,
		self,
		nTongId,
		nPlayerId,
		self.REQUEST_KICK_KIN
	)
	local cKin = KKin.GetKin(nTagetKinId);
	if not cKin then
		return 0;
	end
	local szKinName = cKin.GetName();
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	local pKinIt = cTong.GetKinItor();
	local nCurKinId = pKinIt.GetCurKinId()
	while(nCurKinId ~= 0) do
		local cKin = KKin.GetKin(nCurKinId);
		if cKin then
			local nCaptainId = cKin.GetCaptain();
			local nRetCode,cMember = self:HaveFigure(nTongId, nCurKinId, nCaptainId, 0);
			if nRetCode == 1 then
				local nId = cMember.GetPlayerId();
				local pPlayer = KPlayer.GetPlayerObjById(nId);
				if nPlayerId ~= nId and pPlayer then	-- phi xin nhân bản thân 
					pPlayer.CallClientScript({"Tong:GetApply_C2", szKinName, self.REQUEST_KICK_KIN, 0, 0});
				end
			end
		end		
		nCurKinId = pKinIt.NextKinId();
	end
	local szPlayerName = KGCPlayer.GetPlayerName(nPlayerId);
	KTongGs.TongClientExcute(nTongId, {"Tong:SendApply_C2", self.REQUEST_KICK_KIN, szPlayerName, 0, 0})
end

-- từ Tonglý cắt bỏ rơi gia tộc ，có ly khai và khai trừ lưỡng chủng hình thức 
function Tong:KinDel_GS2(nDataVer, nTongId, nKinId, nMethod, nReduceFund) -- nMethodtham chiếu Tong:KinDel_GC
	if (nMethod == 1) then
		--khai trừ sự kiện yếu cắt bỏ xin ghi lại 
		local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
		if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
			Timer:Close(tbData.ApplyRecord.nTimerId);
		end
		self:DelExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
	end
	local cTong = KTong.GetTong(nTongId)
	if (not cTong) then
		return 0;
	end
	local nRet = cTong.DelKin(nKinId)
	if (nRet == nil or nRet ==0) then
		return 0
	end
	local cKin = KKin.GetKin(nKinId);
	if (not cKin) then
		return 0;
	end
	-- uy vọng xử lý 
	local nKinRepute = cKin.GetTotalRepute();
	local nCurRepute = cTong.GetTotalRepute();
	if nKinRepute> 0 then
		nCurRepute = nCurRepute - nKinRepute;
		cTong.SetTotalRepute(nCurRepute);
	else
		nKinRepute = 0;
	end
	
	local szKinName = cKin.GetName();
	cTong.SetTongDataVer(nDataVer);
	cTong.AddHistoryKinLeave(cKin.GetName());
	cKin.AddHistoryLeaveTong(cTong.GetName());
	--Kin:LeaveTong_GS2(nKinId, nMethod, 1);
	return KTongGs.TongClientExcute(nTongId, {"Tong:KinDel_C2", szKinName, nKinRepute, nMethod, nReduceFund});
end

-- cắt bỏ gia tộc thất bại quay về điều ，thất bại lý do tạm thời chỉ có gia tộc vi bang chủ gia tộc ，sau đó khả năng có cần mở rộng 
function Tong:KinDelFailed_GS2(nTongId)
	--khai trừ sự kiện yếu cắt bỏ xin ghi lại (nếu như tồn tại nói)
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
	if tbData.nApplyEvent and tbData.nApplyEvent == 1 then
		if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
			Timer:Close(tbData.ApplyRecord.nTimerId);
		end
		self:DelExclusiveEvent(nTongId, self.REQUEST_KICK_KIN);
	end
	return KTongGs.TongClientExcute(nTongId, {"Tong:KinDelFailed_C2"});
end

-- nhâm mệnh người già 
function Tong:ApointAssistant_GS1(nAssistantId, nKinId, nMemberId)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_MASTER) ~= 1 then
		me.Msg("Bạn không phải Bang chủ, không thể bổ nhiệm Trưởng lão");
		return 0;
	end
	if nSelfKinId == nKinId and nSelfMemberId == nMemberId then
		me.Msg("Bang chủ không thể trở thành Trưởng lão");
		return 0;
	end
	if self:HaveFigure(nTongId, nKinId, nMemberId, 0) ~= 1 then
		me.Msg("Đối phương không phải Trưởng lão, không thể được bổ nhiệm");
		return 0;
	end
	return GCExcute{"Tong:ApointAssistant_GC", nTongId, nSelfKinId, nSelfMemberId, nAssistantId, nKinId, nMemberId};
end
RegC2SFun("ApointAssistant", Tong.ApointAssistant_GS1);

function Tong:ApointAssistant_GS2(nTongId, nAssistantId, nKinId, nMemberId, nOrgKinId)
	local cTong	= KTong.GetTong(nTongId);
	if (not cTong) then 
		return 0;
	end
	local cKin = KKin.GetKin(nKinId);
	
	if (not cKin) then
		return 0;
	end
	local cOrgKin = KKin.GetKin(nOrgKinId);
	local szOrgPlayerName;
	if cOrgKin then		-- nguyên lai chức vị đã có gia tộc giữ lấy 
		cOrgKin.SetTongFigure(self.CAPTAIN_NORMAL)	-- bãi miễn ，thả ra chức vị 
		local nCaptainId = cOrgKin.GetCaptain()
		local cMember = cOrgKin.GetMember(nCaptainId);
		KKinGs.UpdateKinInfo(cMember.GetPlayerId());
		szOrgPlayerName = KGCPlayer.GetPlayerName(cMember.GetPlayerId());
	end
	cKin.SetTongFigure(nAssistantId);		--nhâm mệnh 
	
	local szAssistant = cTong.GetCaptainTitle(nAssistantId);
	local cMember = cKin.GetMember(nMemberId);
	if not cMember then
		return 0;
	end
	local szPlayerName = KGCPlayer.GetPlayerName(cMember.GetPlayerId());
	KKinGs.UpdateKinInfo(cMember.GetPlayerId());
	KTongGs.TongClientExcute(nTongId, {"Tong:ApointAssistant_C2", nAssistantId, nOrgKinId, nKinId, szAssistant, szPlayerName, szOrgPlayerName});
end

-- nhâm mệnh chưởng lệnh sử 
function Tong:ApointEmissary_GS1(nTagetKinId, nTagetMemberId, nEmissaryId)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_ENVOY) ~= 1 then
		me.Msg("Bạn không có quyền bổ nhiệm Chưởng lệnh");
		return 0;
	end
	local cKin = KKin.GetKin(nTagetKinId);
	if (not cKin) then 
		return 0;
	end
	if (self:HaveFigure(nTongId, nTagetKinId, nTagetMemberId, 0) == 1) then
		me.Msg("Trưởng lão không thể được bổ nhiệm làm Chưởng lệnh");
		return 0;
	end
	if (Kin:HaveFigure(nTagetKinId, nTagetMemberId, 4) ~= 1) then 
		me.Msg("Thành viên Vinh dự không thể được bổ nhiệm làm Chưởng lệnh");
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	if not cTong.GetEnvoyTitle(nEmissaryId) then
		me.Msg("Chưởng lệnh này không xác định, không thể được bổ nhiệm");
		return 0;
	end
	if (nEmissaryId <1 or nEmissaryId>14) then
		return 0;
	end
	return GCExcute{"Tong:ApointEmissary_GC", nTongId, nSelfKinId, nSelfMemberId, nTagetKinId, nTagetMemberId, nEmissaryId};
end
RegC2SFun("ApointEmissary", Tong.ApointEmissary_GS1);

function Tong:ApointEmissary_GS2(nTongId, nTagetKinId, nTagetMemberId, nEmissaryId)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	local cKin = KKin.GetKin(nTagetKinId);
	if (not cKin) then 
		return 0;
	end
	local cMember = cKin.GetMember(nTagetMemberId);
	if not cMember then
		return 0;
	end
	cMember.SetEnvoyFigure(nEmissaryId);
	KKinGs.UpdateKinInfo(cMember.GetPlayerId());
	local szPlayerName = KGCPlayer.GetPlayerName(cMember.GetPlayerId());
	local szEmissaryName = cTong.GetEnvoyTitle(nEmissaryId);
	if not szEmissaryName then
		szEmissaryName = "Không xác định";
	end
	KTongGs.TongClientExcute(nTongId, {"Tong:ApointEmissary_C2", nTagetKinId, nTagetMemberId, nEmissaryId, szPlayerName, szEmissaryName});
end

-- thay đổi người già thiết trí ：tên gọi 、quyền hạn 
function Tong:ChangeAssistant_GS1(nAssistantId, nPow, szTitle)
	if not szTitle then 
		return 0;
	end
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_MASTER) ~= 1 then
		me.Msg("Bạn không có quyền thay đổi chức vị");
		return 0;
	end
	local nLen = #szTitle;
	if nLen> 12 then
		me.Msg("Danh hiệu không thể dài hơn 12 chữ");
		return 0
	end
	--xưng hào tên tính hợp pháp kiểm tra 
	if KUnify.IsNameWordPass(szTitle) ~= 1 then
		me.Msg("Danh hiệu có thể chứa kí tự []");	
		return 0;
	end
	--tên gọi loại bỏ 
	if IsNamePass(szTitle) ~= 1 then
		me.Msg("Danh hiệu chứa các từ không được phép");		
		return 0;
	end
	return GCExcute{"Tong:ChangeAssistant_GC", nTongId, nSelfKinId, nSelfMemberId, nAssistantId, nPow, szTitle}
end
RegC2SFun("ChangeAssistant", Tong.ChangeAssistant_GS1);

function Tong:ChangeAssistant_GS2(nTongId, nDataVer, nAssistantId, nPow, szTitle)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0
	end
	cTong.SetCaptainTitle(nAssistantId, szTitle);
	cTong.AssignCaptainPower(nAssistantId, nPow);
	cTong.SetTongFigureDataVer(nDataVer);
	KTongGs.UpdateTongTitle(nTongId, nAssistantId, 0); --canh tân xưng hào ，người cuối cùng tham số đích hàm nghĩa ：0vi người già ， 1vi chưởng lệnh sử ， 2làm một vậy bang chúng 
	KTongGs.TongClientExcute(nTongId, {"Tong:ChangeAssistant_C2", nAssistantId, szTitle, nPow});
end

-- thay đổi chưởng lệnh sử tên gọi 
function Tong:ChangeEmissary_GS1(nEmissaryId, szEmissary)
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(me.dwTongId, nSelfKinId, nSelfMemberId, self.POW_ENVOY) ~= 1 then
		me.Msg("Bạn không có quyền đổi tên Chức danh Chưởng lệnh");
		return 0;
	end
	local nLen = #szEmissary;
	if nLen> 12 then
		me.Msg("Danh hiệu không thể dài hơn 12 chữ");
		return 0
	end
	--xưng hào tên tính hợp pháp kiểm tra 
	if KUnify.IsNameWordPass(szEmissary) ~= 1 then
		me.Msg("Danh hiệu có thể chứa kí tự []");	
		return 0;
	end
	--tên gọi loại bỏ 
	if IsNamePass(szEmissary) ~= 1 then
		me.Msg("Danh hiệu chứa các từ không được phép");		
		return 0
	end
	GCExcute{"Tong:ChangeEmissary_GC",me.dwTongId, nSelfKinId, nSelfMemberId, nEmissaryId, szEmissary};
end
RegC2SFun("ChangeEmissary", Tong.ChangeEmissary_GS1);

function Tong:ChangeEmissary_GS2(nTongId, nDataVer, nEmissaryId, szTitle)
	local cTong = KTong.GetTong(nTongId);
	local cTong = KTong.GetTong(nTongId);
	cTong.SetEnvoyTitle(nEmissaryId, szTitle);
	cTong.SetTongFigureDataVer(nDataVer);
	KTongGs.UpdateTongTitle(nTongId, nEmissaryId, 1);
	KTongGs.TongClientExcute(nTongId, {"Tong:ChangeEmissary_C2", nEmissaryId, szTitle});
end

-- tá chức đan một chưởng lệnh sử 
function Tong:FireEmissary_GS1(nKinId, nMemberId)
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(me.dwTongId, nSelfKinId, nSelfMemberId, self.POW_ENVOY) ~= 1 then
		me.Msg("Bạn không có quyền bãi miễn Chưởng lệnh");
		return 0;
	end
	GCExcute{"Tong:FireEmissary_GC", me.dwTongId, nSelfKinId, nSelfMemberId, nKinId, nMemberId, 1};
end
RegC2SFun("FireEmissary", Tong.FireEmissary_GS1);

function Tong:FireEmissary_GS2(nTongId, nKinId, nMemberId, nSync)
	local cKin = KKin.GetKin(nKinId);
	if (not cKin) then 
		return 0;
	end
	local cMember = cKin.GetMember(nMemberId);
	if (not nMemberId) then
		return 0;
	end
	cMember.SetEnvoyFigure(0);
	KKinGs.UpdateKinInfo(cMember.GetPlayerId()); -- canh tân xưng hào 
	if nSync then
		local szPlayerName = KGCPlayer.GetPlayerName(cMember.GetPlayerId());
		KTongGs.TongClientExcute(nTongId, {"Tong:FireEmissary_C2",nKinId, nMemberId, szPlayerName});
	end
end

-- tá chức toàn bộ chưởng lệnh sử 
function Tong:FireAllEmissary_GS1(nEmissaryId)
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(me.dwTongId, nSelfKinId, nSelfMemberId, self.POW_ENVOY) ~= 1 then
		me.Msg("Bạn không có quyền bãi miễn Chưởng lệnh"..self:CheckSelfRight(me.dwTongId, nSelfKinId, nSelfMemberId, self.POW_ENVOY));
		return 0;
	end
	GCExcute{"Tong:FireAllEmissary_GC", me.dwTongId, nSelfKinId, nSelfMemberId, nEmissaryId};
end
RegC2SFun("FireAllEmissary", Tong.FireAllEmissary_GS1)

function Tong:FireAllEmissary_GS2(nTongId, nEmissaryId)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	local cKinItor = cTong.GetKinItor();
	local nKinId = cKinItor.GetCurKinId();
	while (nKinId ~= 0) do
		local cKin = KKin.GetKin(nKinId);
		if cKin then
			local cMemberItor = cKin.GetMemberItor();
			local cMember = cMemberItor.GetCurMember();
			while (cMember) do
				if (cMember.GetEnvoyFigure() == nEmissaryId) then
					cMember.SetEnvoyFigure(0);
					KKinGs.UpdateKinInfo(cMember.GetPlayerId()); -- canh tân xưng hào 
				end
				cMember = cMemberItor.NextMember();
			end
		end 
		nKinId = cKinItor.NextKinId();
	end
	local szEmissary = cTong.GetEnvoyTitle(nEmissaryId);
	if (not szEmissary) then
		return 0;
	end
	KTongGs.TongClientExcute(nTongId, {"Tong:FireAllEmissary_C2", nEmissaryId,szEmissary})
end

-- bảo tồn thay đổi thông cáo 
function Tong:SaveAnnounce_GS1(szAnnounce)
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(me.dwTongId, nSelfKinId, nSelfMemberId, self.POW_ANNOUNCE) ~= 1 then
		me.Msg("Bạn không có quyền thay đổi Thông báo");
		return 0;
	end
	if #szAnnounce > self.ANNOUNCE_MAX_LEN then
		me.Msg("Số lượng từ trong thông báo lớn hơn độ dài tối đa cho phép")
		return 0;
	end
	return GCExcute{"Tong:SaveAnnounce_GC", me.dwTongId, nSelfKinId, nSelfMemberId, szAnnounce};
end
RegC2SFun("SaveAnnouce", Tong.SaveAnnounce_GS1);

function Tong:SaveAnnounce_GS2(nTongId, nDataVer, szAnnounce)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	cTong.SetAnnounce(szAnnounce);
	cTong.SetTongAnnounceDataVer(nDataVer);
	KTongGs.TongClientExcute(nTongId, {"Tong:SaveAnnounce_C2"});
end

-- điều chỉnh chia hoa hồng tỉ lệ 
function Tong:ChangeTakeStock_GS1(nPercent)
	if (not nPercent or 0 == Lib:IsInteger(nPercent)) then
		return 0;
	end
	if (nPercent < 0 or nPercent > 100) then
		me.Msg("Bạn đặt sai tỷ lệ cổ tức");
		return 0;
	end
	local nTongId = me.dwTongId
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_WAGE) ~= 1 then
		me.Msg("Bạn không có quyền thay đổi tỷ lệ cổ tức ");
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	if cTong.GetEnergy() < 100 then
		me.Msg("Bang hội không đủ điểm hành động để điều chỉnh cổ tức ")
		return 0;
	end
	return GCExcute{"Tong:ChangeTakeStock_GC", nTongId, nSelfKinId, nSelfMemberId, nPercent};
end
RegC2SFun("ChangeTakeStock", Tong.ChangeTakeStock_GS1);

function Tong:ChangeTakeStock_GS2(nTongId, nDataVer, nPercent, nCurEnergy)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	cTong.SetTakeStock(nPercent);
	cTong.SetEnergy(nCurEnergy);
	cTong.SetTongDataVer(nDataVer);
	KTongGs.TongClientExcute(nTongId, {"Tong:ChangeTakeStock_C2", nPercent, self.CHANGE_TAKESTOCK_ENERGY});
end

-- xin cho vay tài chính 
function Tong:ApplyDispenseFund_GS1(nType, nMoney)
	if (not nType or not nMoney or 0 == Lib:IsInteger(nType) or 0 == Lib:IsInteger(nMoney) or nMoney < 0 or nMoney > self.MAX_BUILD_FUND) then
		return 0;
	end
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_FUN) ~= 1 then
		me.Msg("Bạn không có quyền phát hành quỹ Bang ");
		return 0;
	end
	if (me.IsInPrison() == 1) then
		me.Msg("Bạn không thể điều chỉnh khi ở trong tù ");
		return 0;
	end
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_FUND);
	if tbData.nApplyEvent and tbData.nApplyEvent == 1 then	-- 上次申请响应没结束
		me.Msg("Đã đăng ký phát hành quỹ Bang, không thể đăng ký lại")
		return 0;
	end
	if (tbData.nLastTime and tbData.nLastTime[nType] and GetTime() - tbData.nLastTime[nType] < self.DISPENSE_TIME) then
		me.Msg("Giữa 2 lần phát hành quỹ Bang phải cách nhau 6 giờ")
		return 0;
	end
	GCExcute{"Tong:ApplyDispenseFund_GC", nTongId, nSelfKinId, nSelfMemberId, nType, nMoney};
end
--RegC2SFun("DispenseFund", Tong.ApplyDispenseFund_GS1);

-- cần xin phát ra quay về điều （không cần xin tắc không trực tiếp cho vay ，không trở về điều thử hàm số ）
function Tong:ApplyDispense_GS2(nTongId, nKinId, nPlayerId, nType, nAmount, nRequset)
	local nPow;
	if nRequset == self.REQUEST_DISPENSE_FUND then
		nPow = self.POW_FUN;
	elseif nRequset == self.REQUEST_DISPENSE_OFFER then
		nPow = self.POW_STOREDOFFER;
	end
	local tbData = self:GetExclusiveEvent(nTongId, nRequset);
	if not tbData then
		return 0;
	end
	tbData.nApplyEvent = 1;
	if not tbData.ApplyRecord then
		tbData.ApplyRecord = {};
	end
	tbData.ApplyRecord.nPlayerId = nPlayerId;
	tbData.ApplyRecord.nKinId = nKinId
	tbData.ApplyRecord.nAmount = nAmount;
	tbData.ApplyRecord.nPow = nPow;
	-- trạng thái trì 10phút 
	tbData.ApplyRecord.nTimerId = Timer:Register(
		self.DISPENSE_APPLY_LAST, 
		self.CancelExclusiveEvent_GS, 
		self, 
		nTongId, 
		nPlayerId, 
		nRequset
	);
	local szPlayerName = KGCPlayer.GetPlayerName(nPlayerId);
	-- tìm kiếm chính mình tài chính quyền hạn nhân viên thông tri có xin 
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	local pKinIt = cTong.GetKinItor();
	local nCurKinId = pKinIt.GetCurKinId()
	while(nCurKinId ~= 0) do
		local cKin = KKin.GetKin(nCurKinId);
		if cKin then
			local nCaptainId = cKin.GetCaptain();
			local nRetCode,cMember = self:HaveFigure(nTongId, nCurKinId, nCaptainId, nPow);
			if nRetCode == 1 then
				local nId = cMember.GetPlayerId();
				local pPlayer = KPlayer.GetPlayerObjById(nId);
				if nPlayerId ~= nId and pPlayer then	-- phi xin nhân bản thân 
					pPlayer.CallClientScript({"Tong:GetApply_C2", szPlayerName, nRequset, nType, nAmount})
				end
			end
		end		
		nCurKinId = pKinIt.NextKinId();
	end
	KTongGs.TongClientExcute(nTongId, {"Tong:SendApply_C2", nRequset, szPlayerName, nAmount, nType});
end

-- cực kỳ thì cắt bỏ duy nhất sự kiện 
function Tong:CancelExclusiveEvent_GS(nTongId, nPlayerId, nEventId)
	self:DelExclusiveEvent(nTongId, nEventId);
	-- sự kiện cực kỳ thì ，tạm thời chỉ thông tri xin nhân ，nếu như nhu cầu bất mãn đổi nữa ……
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	pPlayer.CallClientScript({"Tong:ApplyFailed_C2", nEventId})
	return 0
end

-- trình tự thuyên chuyển ，thiết trí thu được phát tài nguyên cùng với gữi đi thu hoạch tin tức 
function Tong:GetDispense_GS2(nPlayerId, nType, nAmount)
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not cPlayer then
		return 0
	end
	if nType == self.DISPENSE_FUND then
		local nMoney = TradeTax:TradeMoney(cPlayer, nAmount)
		cPlayer.Earn(nMoney, Player.emKEARN_TONG_DISPAND);
		Dbg:WriteLog("GetDispense_GS2", cPlayer.dwTongId, cPlayer.szName, cPlayer.szAccount, nMoney);
	elseif nType == self.DISPENSE_OFFER then
--		cPlayer.AddTongOffer(nAmount);
	else	-- một định nghĩa đích tài nguyên loại hình 
		return 0;
	end	
	return cPlayer.CallClientScript({"Tong:GetDispense_C2", nType, nAmount})
end

-- xin cho vay độ cống hiến 
--function Tong:ApplyDispenseOffer_GS1(nType, nAmount)
--	if (not nType or not nAmount or 0 == Lib:IsInteger(nType) or 0 == Lib:IsInteger(nAmount) or nAmount <0 or nAmount> self.MAX_STORED_OFFER) then
--		return 0;
--	end
--	local nTongId = me.dwTongId;
--	local nSelfKinId, nSelfMemberId = me.GetKinMember()
--	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_STOREDOFFER) ~= 1 then
--		me.Msg("ngươi không có thao tác dự trữ độ cống hiến đích quyền lực");
--		return 0;
--	end
--	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_OFFER);
--	if tbData.nApplyEvent and tbData.nApplyEvent == 1 then
--		me.Msg("đã có cho vay độ cống hiến đích xin ！bất năng tái xin ！");
--		return 0
--	end
--	if tbData.nLastTime and tbData.nLastTime[nType] and GetTime() - tbData.nLastTime[nType] <self.DISPENSE_APPLY_LAST then
--		me.Msg("đối đồng nhất quần thể hai lần cho vay độ cống hiến cần khoảng cách 6tiếng đồng hồ ！");
--		return 0;
--	end
--	return GCExcute{"Tong:ApplyDispenseOffer_GC",nTongId, nSelfKinId, nSelfMemberId, nType, nAmount};
--end
-- thủ tiêu cho vay dự trữ cống hiến tiếp lời 
--RegC2SFun("DispenseOffer", Tong.ApplyDispenseOffer_GS1);

-- đồng bộ cho vay bang hội tài nguyên hậu đích số liệu 
function Tong:SyncDispense_GS2(nTongId, nCurData, nDataVer, nType, nCrowdType, nAmount, nPlayerId)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	local tbData;
	if nType == self.DISPENSE_OFFER then
		--[[
		cTong.SetStoredOffer(nCurData);
		tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_OFFER);
		if tbData.nApplyEvent and tbData.nApplyEvent == 1 then 	--có mở ra xin 
			if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
				Timer:Close(tbData.ApplyRecord.nTimerId);		-- đóng tính theo thời gian khí ，phòng ngừa lầm san lần sau xin 
			end
			self:DelExclusiveEvent(nTongId, self.REQUEST_DISPENSE_OFFER)
		end
		--]]
	elseif nType == self.DISPENSE_FUND then
		cTong.SetMoneyFund(nCurData);
		tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_FUND);
		if tbData.nApplyEvent and tbData.nApplyEvent == 1 then 	--có mở ra xin 
			if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
				Timer:Close(tbData.ApplyRecord.nTimerId);		-- đóng tính theo thời gian khí ，phòng ngừa lầm san lần sau xin 
			end	
			self:DelExclusiveEvent(nTongId, self.REQUEST_DISPENSE_FUND)
		end
		
		-- ghi lại sự kiện 
		if nPlayerId and nAmount>= self.DISPENSE_FUND_RECORD then
			local szSelfName = KGCPlayer.GetPlayerName(nPlayerId);
			cTong.AddAffairDispenseFund(szSelfName, tostring(nAmount), Tong.tbCrowdTitle[nCrowdType]);
		end
	end
	if not tbData.nLastTime then
		tbData.nLastTime = {};
	end
	tbData.nLastTime[nCrowdType] = GetTime();
	cTong.SetTongDataVer(nDataVer);

	KTongGs.TongClientExcute(nTongId, {"Tong:SyncDispense_C2", nType, nCrowdType, nAmount});
end

-- bởi tài nguyên bất túc tạo thành cho vay tài nguyên thất bại ！quay về điều thông tri 
function Tong:FailedDispense_GS2(nTongId, nType, nPlayerId)
	local tbData;
	if nType == self.DISPENSE_OFFER then
		tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_OFFER);
		if tbData.nApplyEvent and tbData.nApplyEvent == 1 then 	--có mở ra xin 
			if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
				Timer:Close(tbData.ApplyRecord.nTimerId);		-- đóng tính theo thời gian khí ，phòng ngừa lầm san lần sau xin 
			end
			self:DelExclusiveEvent(nTongId, self.REQUEST_DISPENSE_OFFER)
			-- mở ra xin thông tri toàn bộ thành viên 
			KTongGs.TongClientExcute(nTongId, {"Tong:FailedDispense_C2", nType})
		else	-- một mở ra xin chích thông tri cho vay nhân thất bại 
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.CallClientScript({"Tong:FailedDispense_C2", nType});
			end
		end
	elseif nType == self.DISPENSE_FUND then
		tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_DISPENSE_FUND);
		if tbData.nApplyEvent and tbData.nApplyEvent == 1 then 	--có mở ra xin 
			if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
				Timer:Close(tbData.ApplyRecord.nTimerId);		-- đóng tính theo thời gian khí ，phòng ngừa lầm san lần sau xin 
			end	
			self:DelExclusiveEvent(nTongId, self.REQUEST_DISPENSE_FUND)
			-- mở ra xin thông tri toàn bộ thành viên 
			KTongGs.TongClientExcute(nTongId, {"Tong:FailedDispense_C2", nType})
		else	-- một mở ra xin chích thông tri cho vay nhân thất bại 
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
			if pPlayer then
				pPlayer.CallClientScript({"Tong:FailedDispense_C2", nType});
			end
		end
	end
	
end

function Tong:SyncMoney(nTongId, nMoney, nDataVer)
	local cTong = KTong.GetTong(nTongId);
	if (cTong and nMoney>= 0) then
		cTong.SetMoneyFund(nMoney);
		cTong.SetTongDataVer(nDataVer);
	end
end

-- hưởng ứng chích tồn tại một cái xin ，nếu như ：tài chính cho vay ，độ cống hiến cho vay ，thủ tài chính ，bãi miễn bang chủ chờ 
-- tồn tại một BUG：mới có thể lầm tiếp thu lần thứ hai xin ，điều kiện tiên quyết là lần đầu tiên xin ngưng hẳn hưởng ứng tịch thu đáo 
-- thả lần thứ hai thân xin bắt đầu hưởng ứng tịch thu đáo ，cơ bản không có khả năng ，hơn nữa ảnh hưởng cũng không lớn ，tạm thời quên 
function Tong:AcceptExclusiveEvent_GS1(nKey, nAccept)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local tbData = self:GetExclusiveEvent(nTongId, nKey);
	if not tbData.nApplyEvent or tbData.nApplyEvent == 0 then	-- sự kiện dĩ không tồn tại 
		me.Msg("Đăng ký này đã kết thúc"); -- TODO:
		return 0
	end
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, tbData.ApplyRecord.nPow) ~= 1 then
		me.Msg("Bạn không đc phép hưởng ứng đăng ký này");
		return 0
	end
	if not tbData.tbAccept then
		tbData.tbAccept = {}		-- dĩ tỏ thái độ gia tộc ghi lại 
	end
	if tbData.tbAccept[nSelfKinId] then
		me.Msg("Gia tộc của bạn đã biểu quyết");
		return 0;
	end
	GCExcute{"Tong:AcceptExclusiveEvent_GC", nTongId, nSelfKinId, nSelfMemberId, nKey, nAccept};
end
RegC2SFun("AcceptExclusiveEvent", Tong.AcceptExclusiveEvent_GS1)

function Tong:AcceptExclusiveEvent_GS2(nTongId, nSelfKinId, nPlayerId, nKey, nAccept)
	local tbData = self:GetExclusiveEvent(nTongId, nKey);
	if not tbData.tbAccept then
		tbData.tbAccept = {}		-- dĩ tỏ thái độ gia tộc ghi lại 
	end
	tbData.tbAccept[nSelfKinId] = nAccept;
	local szPlayerName = KGCPlayer.GetPlayerName(nPlayerId);
	return KTongGs.TongClientExcute(nTongId, {"Tong:AcceptExclusiveEvent_C2", szPlayerName, nKey, nAccept})
end

function Tong:HandUp_GS1()
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	GCExcute{"Tong:HandUp_GC", me.dwTongId, nSelfKinId, nSelfMemberId};
end
RegC2SFun("HandUp", Tong.HandUp_GS1);
	
function Tong:HandUp_GS2(nTongId, nSelfKinId, nSelfMemberId)
	return KTongGs.TongClientExcute(nTongId, {"Tong:HandUp_C2", nSelfKinId, nSelfMemberId});
end

function Tong:AddFund_GS1(nMoney)
	if (not nMoney or 0 == Lib:IsInteger(nMoney) or nMoney < 0 or nMoney > 2000000000) then
		return 0;
	end
	if (me.dwTongId == 0) then
		me.Msg("Bạn không có Bang hội, không thể lưu giữ bạc Bang hội");
		return 0;
	end
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản của bạn bị khóa và không thể thực hiện thao tác này");
		return;
	end
	--- Add by zouying
	if (me.IsInPrison()  == 1)then
		me.Msg("Bạn không thể gửi bạc Bang hội khi ở trong tù");
		return 0;
	end
	
	if nMoney <= 0 then
		return 0;
	end
	local nCurMoney = me.nCashMoney
	
	if (nMoney > nCurMoney) then
		me.Msg("Bạc trên người bạn không đủ");
		return 0;
	end
	local nRet = me.CostMoney(nMoney, Player.emKPAY_TONGFUND)
	if nRet ~= 1 then
		me.Msg("Gửi bạc vào quỹ thất bại")
		return 0
	end
	return GCExcute{"Tong:AddFund_GC", me.dwTongId, me.nId, nMoney};
end
RegC2SFun("AddFund", Tong.AddFund_GS1);

function Tong:AddFund_GS2(nTongId, nDataVer, nPlayerId, nCurFund, nFund)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	cTong.SetMoneyFund(nCurFund);
	cTong.SetTongDataVer(nDataVer);
	local szName = KGCPlayer.GetPlayerName(nPlayerId)
	if nFund>= self.TAKEFUND_APPLY then
		cTong.AddAffairSaveFund(szName, tostring(nFund));
	end
	KTongGs.TongClientExcute(nTongId, {"Tong:AddFund_C2", szName, nFund});
end

function Tong:AddBuildFund_GS1(nMoney, nTranceRate)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		me.Msg("Bạn không có Bang hội, không thể thiết lập quỹ Bang");
		return 0;
	end
	local cKin = KKin.GetKin(nSelfKinId);
	if not cKin then
		return 0;
	end
	local cMember = cKin.GetMember(nSelfMemberId);
	if not cMember then
		return 0;
	end
	local nBuildFund = cTong.GetBuildFund();
	if nBuildFund + nMoney> self.MAX_BUILD_FUND then
		me.Msg("Thiết kế quỹ sẽ vượt quá giới hạn lưu trữ tối đa, không được phép gửi bạc nữa ")
		return 0;
	end
	
	return GCExcute{"Tong:AddBuildFund_GC", nTongId, nKinId, nMemberId, nMoney, nTranceRate};
end
-- cắt bỏ hộ khách ngay thẳng nhận tồn kiến thiết tài chính tiếp lời 
--RegC2SFun("AddBuildFund", Tong.AddBuildFund_GS1);

-- lấy ra bang hội tài chính 
function Tong:ApplyTakeFund_GS1(nMoney)
	if (not nMoney or 0 == Lib:IsInteger(nMoney) or nMoney < 0 or nMoney > 2000000000) then
		return 0;
	end
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_FUN) ~= 1 then
		me.Msg("Bạn không có quyền sử dụng quỹ Bang");
		return 0;
	end
	
	if (me.IsInPrison() == 1) then
		me.Msg("Bạn không thể gửi quỹ Bang hội khi ở trong tù");
		return 0;
	end
	
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_TAKE_FUND);
	if tbData.nApplyEvent and tbData.nApplyEvent == 1 then		-- 已经有申请取钱 
		me.Msg("Đã áp dụng lệnh đăng ký rút quỹ Bang hội, không thể hủy bỏ");
		return 0;
	end
	if tbData.nLastTime and GetTime() - tbData.nLastTime < self.TAKEFUND_TIME then
		me.Msg("Thời gian rút quỹ Bang hội giữa 2 lần phải cách nhau 6 giờ");
		return 0;
	end
	local nCurFund = cTong.GetMoneyFund();
	if (nMoney > nCurFund) then
		me.Msg("Quỹ Bang hội không đủ, không thể rút");
		return 0;
	end
	if me.GetMaxCarryMoney() < me.nCashMoney + nMoney then
		me.Msg("Số bạc bạn rút vượt quá giới hạn cho phép ")
		return 0;
	end
	local nRet	= GCExcute{"Tong:ApplyTakeFund_GC", nTongId, nSelfKinId, nSelfMemberId, me.nId, nMoney};
	return nRet;
end
RegC2SFun("TakeFund", Tong.ApplyTakeFund_GS1);

-- lấy tiền đích xin (cần thân thỉnh quay về điều)
function Tong:ApplyTakeFund_GS2(nTongId, nKinId, nPlayerId, nMoney)
	
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_TAKE_FUND)
	tbData.nApplyEvent = 1;
	if not tbData.ApplyRecord then
		tbData.ApplyRecord = {};
	end
	tbData.ApplyRecord.nKinId = nKinId;
	tbData.ApplyRecord.nPow = self.POW_FUN;
	tbData.ApplyRecord.nAmount = nMoney;
	tbData.ApplyRecord.nTimerId = Timer:Register(
		self.TAKEFUND_APPLY_LAST,
		self.CancelExclusiveEvent_GS,
		self,
		nTongId,
		nPlayerId,
		self.REQUEST_TAKE_FUND
	);
	local szPlayerName = KGCPlayer.GetPlayerName(nPlayerId);
	-- tìm kiếm chính mình tài chính quyền hạn nhân viên thông tri có xin 
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	local pKinIt = cTong.GetKinItor();
	local nCurKinId = pKinIt.GetCurKinId()
	while(nCurKinId ~= 0) do
		local cKin = KKin.GetKin(nCurKinId);
		if cKin then
			local nCaptainId = cKin.GetCaptain();
			local nRetCode,cMember = self:HaveFigure(nTongId, nCurKinId, nCaptainId, self.POW_FUN);
			if nRetCode == 1 then
				local nId = cMember.GetPlayerId();
				local pPlayer = KPlayer.GetPlayerObjById(nId);
				if nPlayerId ~= nId and pPlayer then
					pPlayer.CallClientScript({"Tong:GetApply_C2", szPlayerName, self.REQUEST_TAKE_FUND, 0, nMoney})
				end
			end
		end		
		nCurKinId = pKinIt.NextKinId();
	end

	KTongGs.TongClientExcute(nTongId, {"Tong:SendApply_C2", self.REQUEST_TAKE_FUND, szPlayerName, nMoney, 0});
end

function Tong:TakeFund_GS2(nTongId, nPlayerId, nDataVer, nMoney, nCurFund)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	
	cTong.SetMoneyFund(nCurFund);
	cTong.SetTongDataVer(nDataVer);
	local szName = KGCPlayer.GetPlayerName(nPlayerId);
	if nMoney>= self.TAKEFUND_APPLY then
		cTong.AddAffairTakeFund(szName, tostring(nMoney));
	end
	
	local tbData = self:GetExclusiveEvent(nTongId, self.REQUEST_TAKE_FUND);
	tbData.nLastTime = GetTime();
	if (tbData.nApplyEvent == 1) then
		if tbData.ApplyRecord and tbData.ApplyRecord.nTimerId then
			Timer:Close(tbData.ApplyRecord.nTimerId);
		end
		self:DelExclusiveEvent(nTongId, self.REQUEST_TAKE_FUND);
	end
	KTongGs.TongClientExcute(nTongId, {"Tong:TakeFund_C2", szName, nMoney});
	
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not cPlayer then
		return;
	end
	cPlayer.Earn(nMoney, Player.emKEARN_TONG_FUN);
	-- hoàn nguyên tập trung trạng thái 
	cPlayer.AddWaitGetItemNum(-1);
	Dbg:WriteLog("TakeFund_GS2", cTong.GetName(), nCurFund, cPlayer.szName, cPlayer.szAccount, nMoney);
	cPlayer.PlayerLog(Log.emKPLAYERLOG_TYPE_TONGPAYOFF, 
			string.format("Người chơi: %s, số hiệu: %s, từ Bang hội: %s đã rút %d quỹ, Bang hội còn %d quỹ Bang hội", 
			cPlayer.szName, cPlayer.szAccount, cTong.GetName(), nMoney, nCurFund));
end

function Tong:ChangeTitle_GS1(nTitleType, szTitle)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_TITLE) ~= 1 then
		me.Msg("Bạn không có quyền thay đổi chức danh");
		return 0;
	end
	local nLen = #szTitle;
	if nLen > 8 then
		me.Msg("Chức danh không thể dài hơn 4 chữ");
		return 0
	end
	--称号名字合法性检查
	if KUnify.IsNameWordPass(szTitle) ~= 1 then
		me.Msg("Chức danh có thể bao gồm ký tự []");	
		return 0;
	end
	--名称过滤
	if IsNamePass(szTitle) ~= 1 then
		me.Msg("Chức danh có chứa các từ không được phép");		
		return 0
	end
	GCExcute{"Tong:ChangeTitle_GC", nTongId, nSelfKinId, nSelfMemberId, szTitle, nTitleType};
end
RegC2SFun("ChangeTitle", Tong.ChangeTitle_GS1);

function Tong:ChangeTitle_GS2(nTongId, szTitle, nTitleType)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	cTong.SetBufTask(nTitleType, szTitle);
	KTongGs.UpdateTongTitle(nTongId, nTitleType, 2);
	return KTongGs.TongClientExcute(nTongId, {"Tong:ChangeTitle_C2", nTitleType, szTitle});
end

function Tong:ChangeCamp_GS1(nCamp)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_CAMP) ~= 1 then 
		me.Msg("Bạn không có quyền thay đổi phe phái");
		return 0
	end
	local tbData = Tong:GetTongData(nTongId);
	if tbData.nLastCampTime and GetTime() - tbData.nLastCampTime < Tong.CHANGE_CAMP_TIME then
		me.Msg("Giữa 2 lần thay đổi phe cần 2 giờ")
		return 0;
	end
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	if cTong.GetCamp() == nCamp then
		me.Msg("Bang hội của bạn đã thuộc phe này, không cần sửa đổi");
		return 0;
	end
	if self:CanCostedBuildFund(nTongId, nSelfKinId, nSelfMemberId, Tong.CHANGE_CAMP) ~= 1 then
		me.Msg("Quỹ Bang hội có thể sự dụng vượt quá mức, hãy yêu cầu Bang chủ thiết lập mức quỹ có thể sử dụng cao hơn");
		return 0;
	end
	return GCExcute{"Tong:ChangeCamp_GC", nTongId, nSelfKinId, nSelfMemberId, nCamp};
end
RegC2SFun("ChangeCamp", Tong.ChangeCamp_GS1);

function Tong:ChangeCamp_GS2(nTongId, nCamp, nDataVer)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	cTong.SetCamp(nCamp);
	local cKinItor = cTong.GetKinItor();
	local nCurKinId = cKinItor.GetCurKinId();
	while (nCurKinId ~= 0) do
		local cKin = KKin.GetKin(nCurKinId);
		if cKin then
			cKin.SetCamp(nCamp);
			KKinGs.UpdateKinMemberCamp(nCurKinId, nCamp);
		end
		nCurKinId = cKinItor.NextKinId();
	end
	cTong.SetTongDataVer(nDataVer);
	local tbData = Tong:GetTongData(nTongId);
	tbData.nLastCampTime = GetTime();
	return KTongGs.TongClientExcute(nTongId, {"Tong:ChangeCamp_C2", nCamp})
end

function Tong:InheritMaster_GS1(nKinId, nMemberId)
	local nTongId = me.dwTongId;
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local nRetCode, cMember = self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_MASTER);
	if nRetCode ~= 1 then
		me.Msg("Bạn không phải Bang chủ, không thể chuyển giao chức Bang chủ")
		return 0;
	end
	if self:HaveFigure(nTongId, nKinId, nMemberId, 0) ~= 1 then
		me.Msg("Đối phương không phải Trưởng lão, không thể chuyển giao chức Bang chủ")
		return 0;
	end	
	if not cMember then
		return 0;
	end
	local nPlayerId = cMember.GetPlayerId();
	local nCurRepute = KGCPlayer.GetPlayerPrestige(nPlayerId);
	if nCurRepute <self.INHERIT_MASTER then
		me.Msg("Uy danh không đủ, chuyển giao chức Bang chủ cần "..self.INHERIT_MASTER.." uy danh giang hồ ")
		return 0;
	end
	return GCExcute{"Tong:InheritMaster_GC", nTongId, nSelfKinId, nSelfMemberId, nKinId, nMemberId};
end
RegC2SFun("InheritMaster", Tong.InheritMaster_GS1);

function Tong:InheritMaster_GS2(nTongId, nSelfKinId, nTagetKinId, nDateVer, nRepute)
	local cSelfKin = KKin.GetKin(nSelfKinId);
	if not cSelfKin then
		return 0;
	end
	local nMasterId = cSelfKin.GetCaptain();
	local cMember = cSelfKin.GetMember(nMasterId);
	if not cMember then 
		return 0;
	end
	self:ChangeMaster_GS2(nTongId, nTagetKinId, nDateVer);
	return 1
end

function Tong:AddEnergy(nEnergy)
	local nTongId = me.dwTongId;
	if nTongId == 0 then
		return 0;
	end
	return GCExcute{"Tong:AddEnergy_GC", nTongId, nEnergy};
end

function Tong:AddEnergy_GS2(nTongId, nCurEnergy, nDataVer)
	local cTong = KTong.GetTong(nTongId);
	if not cTong then 
		return 0;
	end
	cTong.SetEnergy(nCurEnergy);
	cTong.SetTongDataVer(nDataVer);
	return 1
end

function Tong:SyncTongTotalRepute_GS2(nTongId, nRepute, nDataVer)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetTotalRepute(nRepute);
	pTong.SetTongDataVer(nDataVer);
end

--function Tong:AddTongOffer_GS2(nTongId, nOffer, nFund, nKinId)
--	local pTong = KTong.GetTong(nTongId)
--	if not pTong then
--		return 0;
--	end
--	local cKin = KKin.GetKin(nKinId);
--	if (not cKin) then
--		return 0;
--	end
--	cKin.AddTongOffer(nOffer);
--	--pTong.AddStoredOffer(nOffer);
--	pTong.AddBuildFund(nFund);
--end

-- vi bang hội và thuộc hạ gia tộc thiết trí chu mục tiêu （bang hội ID，bang hội đích cấp thấp mục tiêu ，bang hội đích trung cấp mục tiêu ，bang hội đích cao cấp mục tiêu ）
function Tong:PerTongWeeklyAction_GS(nTongId, nLowTask, nMidTask, nHighTask)
	local cTong = KTong.GetTong(nTongId);
	if (not cTong) then
		return 0;
	end
	cTong.SetLowWeeklyTask(nLowTask);
	cTong.SetMidWeeklyTask(nMidTask);
	cTong.SetHighWeeklyTask(nHighTask);
	Tong:SetMemberKinTask(cTong, nLowTask, nMidTask, nHighTask);
end

-- chia hoa hồng 
function Tong:OpenGetWageLock_GS(nPlayerId)
	self.WAGE_LOCKSTATE[nPlayerId] = nil;
	return 0;
end

function Tong:TakeStock_GS2(nTongId, nKinId, nMemberId, nTotalFund, nTakeMoney, nTotalStock, nPersonalStock)
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		return 0;
	end
	local pKin = KKin.GetKin(nKinId);
	if not pKin then
		return 0;
	end
	local pMember = pKin.GetMember(nMemberId);
	if not pMember then
		return 0;
	end
	pTong.SetBuildFund(nTotalFund);
	pTong.SetTotalStock(nTotalStock);
	pMember.SetPersonalStock(nPersonalStock);
	
	local pPlayer = KPlayer.GetPlayerObjById(pMember.GetPlayerId());
	if pPlayer then
		pPlayer.AddBindMoney(nTakeMoney, Player.emKBINDMONEY_ADD_TONG_FUN);
		pPlayer.Msg(string.format("Bạn lãnh thành công <color=yellow>%s<color> lượng cổ tức", nTakeMoney));
		Dbg:WriteLog("Tong","TakeStock_GS2", pPlayer.szName, pPlayer.szAccount, nTakeMoney)
	end
end

function Tong: AddHistory(bIsHistory, nType,...)
	local nTongId = me.dwTongId;
	local cTong = KTong.GetTong(nTongId);
	if not cTong then
		return 0;
	end
	cTong.AddTongHistory(bIsHistory, nType, GetTime(), unpack(arg));
end

-- tìm được ngoạn gia ，sau đó sẽ hướng gclấy tiền 
function Tong:FindPlayer_GS(nTongId, nMoney, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if pPlayer == nil then
		return 0;
	end
	if pPlayer.GetMaxCarryMoney() <pPlayer.nCashMoney + nMoney then
		pPlayer.Msg("Tổng số bạc trên người sau khi nhận sẽ vượt quá mức cho phép mang theo, không thể nhận")
		return 0;
	end
	local nRet = GCExcute{"Tong:TakeFund_GC", nTongId, nMoney, nPlayerId};
	if (nRet == 1)then
		-- xin thu hoạch tài chính thì ，tập trung trạng thái 
		pPlayer.AddWaitGetItemNum(1);
		print("xin thu hoạch tài chính thì ，tập trung trạng thái");
	end
end

-- thiết trí chủ thành 
function Tong:SetCapital_GS1(nTongId, nDomainId, bConfirm)
	if Domain:GetBattleState() ~= Domain.NO_BATTLE then
		Dialog:Say("Tranh đoạt lãnh thổ chiến bắt đầu, không thể thay đổi thiết lập Thành chính");
		return 0;
	end
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0;
	end
	if cTong.GetCapital() == nDomainId then
		Dialog:Say("Bản đồ này đã là Thành chính");
		return 0;
	end
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local nRetCode, cMember = self:CheckSelfRight(nTongId, nSelfKinId, nSelfMemberId, self.POW_MASTER);
	if nRetCode ~= 1 then
		Dialog:Say("Bạn không phải Bang chủ, không thể thiết lập Thành chính");
		return 0;
	end

	-- 检查是否新手村
	if Domain:GetDomainType(nDomainId) == "village" then
		Dialog:Say("Tân Thủ Thôn không thể được thiết lập là Thành chính");
		return 0;
	end
	-- 是否已占领该领土
	if Domain:GetDomainOwner(nDomainId) ~= nTongId then
		Dialog:Say("Bang hội không chiếm lĩnh lãnh thổ này, không thể thiết lập khu vực này là Thành chính");
		return 0;
	end
	local szCapital = Domain:GetDomainName(nDomainId);
	local nCost, nChangeCount = self:CalcChangeCapital(nTongId);
	if self:CanCostedBuildFund(nTongId, nSelfKinId, nSelfMemberId, nCost) ~= 1 then
		Dialog:Say("Hạn mức quỹ Bang có thể sử dụng trong tuần không đủ, hãy yêu cầu Bang chủ thiết lập mức cao hơn");
		return 0;			
	end
	if bConfirm == 1 then
		return GCExcute{"Tong:SetCapital_GC", nTongId, nSelfKinId, nSelfMemberId, nDomainId};
	else
		local szMsg = string.format("Bạn muốn thay đổi Thành chính của Bang là <color=green>%s<color>. Đây là lần thứ <color=green>%d Bang hội của bạn thay đổi Thành chính. Cần tiêu tốn <color=green>%d<color> quỹ xây dựng Bang hội",
			szCapital, nChangeCount, nCost);
		Dialog:Say(szMsg, 
			{
				{"Đồng ý", self.SetCapital_GS1, self, nTongId, nDomainId, 1},
				{"Ta suy nghĩ đã"},
			});
	end
end

-- thiết trí chủ thành 
function Tong:SetCapital_GS2(nTongId, nDomainId, nCost, nChangeCount, nDataVer)
	local cTong = KTong.GetTong(nTongId)
	if not cTong then
		return 0;
	end
	cTong.SetCapital(nDomainId);
	cTong.SetCapitalChangeCount(nChangeCount); -- ghi lại chủ thành thay đổi số lần 
	Domain.nDataVer = nDataVer;
	local szCapital = Domain:GetDomainName(nDomainId)
	if szCapital then
		cTong.AddAffairCapital(szCapital);
		KTong.Msg2Tong(nTongId, 
			string.format("Bang hội tiêu tốn <color=green>%d<color> quỹ xây dựng Bang hội，Thành chính đổi thành <color=green>%s<color> ",
			nCost, szCapital));
	end
end

-- thiết trí chủ thành khu vực chiến đánh số 
function Tong:SetDomainBattleNo_GS1(nTongId, nDomainBattleNo)
	return GCExcute{"Tong:SetDomainBattleNo_GC", nTongId, nDomainBattleNo};
end

-- đồng bộ xác nhập cổ kết quả 
function Tong:SyncAllMemberStock_GS2(nTongId, nTotalStock, tbRet)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetTotalStock(nTotalStock);
	for nKinId, tbKinRet in pairs(tbRet) do
		local pKin = KKin.GetKin(nKinId);
		if pKin then
			for nMemberId, nStock in pairs(tbKinRet) do
				local pMember = pKin.GetMember(nMemberId);
				if pMember then
					pMember.SetPersonalStock(nStock);
				end
			end
		end
	end
end

function Tong:PresidentConfirm_GS2(nTongId, tbResult, nDataVer, nKinDataVer)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	local nPresidentKin_Old = pTong.GetPresidentKin();
	local nPresidentMember_Old = pTong.GetPresidentMember();
	self:PresidentConfirm(nTongId, tbResult);
	pTong.SetTongDataVer(nDataVer);
	local nPresidentKin = pTong.GetPresidentKin();
	local nPresidentMember = pTong.GetPresidentMember();
	local pItor = pTong.GetKinItor()
	local nCurKinId = pItor.GetCurKinId()
	local pCurKin = KKin.GetKin(nCurKinId);
	while pCurKin do
		pCurKin.SetKinDataVer(nKinDataVer);		-- thay đổi gia tộc số liệu phiên bản hào 
		nCurKinId = pItor.NextKinId()
		pCurKin = KKin.GetKin(nCurKinId);
	end
	local pKin = KKin.GetKin(nPresidentKin);
	if not pKin then
		return 0;
	end
	local pMember = pKin.GetMember(nPresidentMember);
	if not pMember then
		return 0;
	end
	local szName = KGCPlayer.GetPlayerName(pMember.GetPlayerId());
	local szType ="trở thành"
	if nPresidentKin_Old == nPresidentKin and nPresidentMember_Old == nPresidentMember then
		szType ="liên nhiệm"
	end
	if szName then
		KTong.Msg2Tong(nTongId, string.format("<color=green>%s<color> %s sẽ là Thủ lĩnh mới", szName, szType))
	end
end

function Tong:PresidentCandidateConfirm_GS2(nTongId, nKinId, nMemberId, nDataVer, nKinDataVer)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	local pKin = KKin.GetKin(nKinId);
	if not pKin then
		return 0;
	end
	local pMember = pKin.GetMember(nMemberId);
	if not pMember then
		return 0;
	end
	pMember.SetStockFigure(self.PRESIDENT_CANDIDATE);
	pTong.SetTongDataVer(nDataVer);
	pKin.SetKinDataVer(nKinDataVer);
	local szName = KGCPlayer.GetPlayerName(pMember.GetPlayerId());
	if szName then
		KTong.Msg2Tong(nTongId, string.format("<color=green>%s<color> nhận được tư cách được bầu chọn làm Thủ lĩnh. Thứ hài tuần tới nếu Cổ phần vẫn xếp hạng 1 trong Bang thì sẽ trở thành Thủ lĩnh mới", szName))
	end
end

-- tiêu phí bang hội kiến thiết tài chính 
function Tong:ConsumeBuildFund_GS2(nTongId, nCurMoney)
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		return 0;
	end
	pTong.SetBuildFund(nCurMoney);			-- tiêu hao tài chính 
	local nCurTotalStock = pTong.GetTotalStock()	-- công ty cổ phần tổng số 
	if nCurMoney == 0 or nCurTotalStock == 0 then
		self:ClearAllStock(nTongId);
	end
end

function Tong:_AddTongBuildFund_GS2(nTongId, nKinId, nMemberId, nBuildFund, nTotalStock, nPersonalStock, bClear)
	if bClear == 1 then
		self:ClearAllStock(nTongId);
	end
	local pKin = KKin.GetKin(nKinId);
	if not pKin then
		return 0;
	end
	local pMember = pKin.GetMember(nMemberId);
	if not pMember then
		return 0;
	end
	
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		pMember.SetPersonalStock(nPersonalStock);
		return 1;
	end
	pTong.SetBuildFund(nBuildFund);
	pTong.SetTotalStock(nTotalStock);
	pMember.SetPersonalStock(nPersonalStock);
end

function Tong:AddBuildFund_GS2(nKinId, nMemberId, nMoney, bTongShow, bSelfShow)
	bSelfShow = bSelfShow or 1;
	local pKin = KKin.GetKin(nKinId);
	if not pKin then
		return 0;
	end
	local nTongId = pKin.GetBelongTong()
	local pMember = pKin.GetMember(nMemberId);
	if not pMember then
		return 0;
	end
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		local szPlayerName = KGCPlayer.GetPlayerName(pMember.GetPlayerId());
		if nMoney>= self.TAKEFUND_APPLY then
			pTong.AddAffairBuildFund(szPlayerName, tostring(nMoney));
		end
	end
	local nPlayerId = pMember.GetPlayerId()
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer and bSelfShow == 1 then
		pPlayer.Msg(string.format("Tài sản cá nhân của bạn tăng : <color=yellow>%d<color>", nMoney))
	end
	if nTongId ~= 0 and bTongShow == 1 then
		KTong.Msg2Tong(nTongId, string.format("<color=white>%s<color> đóng góp vào tài sản bang : <color=red>%d<color> lượng", KGCPlayer.GetPlayerName(nPlayerId), nMoney))	
	end
end

function Tong:AddBuildFund2_GS2(nTongId, nMoney)
	local pTong = KTong.GetTong(nTongId);	
	if 0 == nMoney then
		return 0;
	end 
	if pTong then
		pTong.AddBuildFund(nMoney);
		KTong.Msg2Tong(nTongId, string.format("Quỹ xây dựng tăng : <color=green>%d<color>", nMoney));
	end
end

function Tong:DealTakeStock_GS2(nTongId, nTake)
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		return 0
	end
	pTong.SetLastTakeStock(nTake);
end

function Tong:SyncStock_GS2(nTongId, nBuildFund, nTotalStock)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetBuildFund(nBuildFund);
	pTong.SetTotalStock(nTotalStock);
end

function Tong:TongStockChaging_GS2(nTongId, nCurBuildFund, nTotalStock, nMasterStock, nCaptainStock, nMemberStock)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetBuildFund(nCurBuildFund);
	pTong.SetTotalStock(nTotalStock)
	pTong.SetStoredOffer(0);
	local pKinItor = pTong.GetKinItor();
	local nKinId = pKinItor.GetCurKinId();
	local pKin = KKin.GetKin(nKinId);
	while pKin do
		local pMemberItor = pKin.GetMemberItor()
		local pMember = pMemberItor.GetCurMember();
		while pMember do
			local nStock = 0;
			if pMember.GetFigure() == Kin.FIGURE_CAPTAIN then
				if pKin.GetTongFigure() == self.CAPTAIN_MASTER then
					nStock = nMasterStock;
				else
					nStock = nCaptainStock;
				end
			else
				nStock = nMemberStock;
			end
			pMember.SetPersonalStock(nStock)
			pMember = pMemberItor.NextMember()
		end
		nKinId = pKinItor.NextKinId();
		pKin = KKin.GetKin(nKinId);
	end
end

-- sử dụng bang hội kiến thiết tài chính GS2
function Tong:CostBuildFund_GS2(nTongId, nCostedBuildFund, nMoney, bNeedMsg)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetCostedBuildFund(nCostedBuildFund); -- bản ghi chép Chu tổng cộng tiêu hao kiến thiết tài chính 
	local nLimit = pTong.GetBuildFundLimit();
	local nRest = nLimit - nCostedBuildFund;
	if nRest <0 then
		nRest = 0;
	end
	
	if bNeedMsg>= 1 then
		KTong.Msg2Tong(nTongId, string.format("Sử dụng <color=green>%d<color> quỹ xây dựng bang, Giới hạn sử dụng quỹ trong tuần còn : <color=green>%d.", 
			nMoney, nRest));
	end
end


-- thiết trí bang hội kiến thiết tài chính sử dụng hạn mức cao nhất 
function Tong:SetBuildFundLimit_GS1(nTongId, nKinId, nMemberId, nMoneyLimit)
	if (not nTongId or not nKinId or not nMemberId or not nMoneyLimit or
		0 == Lib:IsInteger(nTongId) or 0 == Lib:IsInteger(nKinId) or
		0 == Lib:IsInteger(nMemberId) or 0 == Lib:IsInteger(nMoneyLimit)
		or nMoneyLimit <0 or nMoneyLimit> self.MAX_BUILD_FUND) then
			return 0;
	end
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end

	if Tong:CheckPresidentRight(nTongId, nKinId, nMemberId) ~= 1 then
		me.Msg("Bạn không phải Bang Chủ, không thể thực hiện thiết lập.");
		return 0;
	end
	
	return GCExcute{"Tong:SetBuildFundLimit_GC", nTongId, nKinId, nMemberId, nMoneyLimit};
end
RegC2SFun("SetBuildFundLimit", Tong.SetBuildFundLimit_GS1)


-- thiết trí bang hội kiến thiết tài chính hạn mức cao nhất GS2
function Tong:SetBuildFundLimit_GS2(nTongId, nMoneyLimit)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	
	pTong.SetBuildFundLimit(nMoneyLimit);
		KTong.Msg2Tong(nTongId, string.format("Quỹ sử dụng tối đa được thiết lập là : <color=green>%d<color> lượng.", nMoneyLimit));
end

-- ngoạn gia lên đất liền tài chính tăng  TODO: đến lúc chuyển hoán số hiệu tương lai yếu cắt bỏ đích zhengyuhua
function Tong:ChangingStockOnLogin()
	local nOffer = me.nTongOffer
	if nOffer <= 0 then
		return 0;
	end
	me.AddTongOffer(-nOffer);
	local nKinId, nMemberId = me.GetKinMember();
	GCExcute{"Tong:AddBuildFund_GC", me.dwTongId, nKinId, nMemberId, nOffer*me.GetProductivity(), 1, 0};
end
PlayerEvent:RegisterOnLoginEvent(Tong.ChangingStockOnLogin, Tong)

function Tong:SyncTotalStock_GS2(nTongId, nTotalStock, tbRet)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetTotalStock(nTotalStock);
	for nKinId, tbMember in pairs(tbRet) do
		local pKin = KKin.GetKin(nKinId);
		if pKin then
			for nMemberId, nStock in pairs(tbMember) do
				local pMember = pKin.GetMember(nMemberId);
				if pMember then
					pMember.SetPersonalStock(nStock);
				end
			end
		end
	end
end

-- tăng bang hội kiến thiết tài chính và bang chủ 、tộc trưởng 、phó tộc trưởng 、cá nhân đích công ty cổ phần 
function Tong:AddStockBaseCount_GS1(nPlayerId, nStockBaseCount, nPersonalRate, nTongRate, nCaptainRate, nAssistantRate, nMasterRate, nType)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer or not nStockBaseCount or nStockBaseCount <= 0 then 
		return;
	end
	
	if nType and pPlayer.CanAddOffer(nType) == 0 then
		return 0;
	end
	
	if not nPersonalRate or nPersonalRate <0 then nPersonalRate = 0 end
	if not nTongRate or nTongRate <0 then nTongRate = 0 end
	if not nCaptainRate or nCaptainRate <0 then nCaptainRate = 0 end
	if not nAssistantRate or nAssistantRate <0 then nAssistantRate = 0 end
	if not nMasterRate or nMasterRate <0 then nMasterRate = 0 end

	local nKinId, nMemberId = pPlayer.GetKinMember();
	local pKin = KKin.GetKin(nKinId);
	if Kin:HaveFigure(nKinId, nMemberId, Kin.FIGURE_REGULAR) ~= 1 then
		return 0;
	end
	if pKin then 	
		local nCaptainId = pKin.GetCaptain();	-- tộc trưởng ID
		local nAssistantId = pKin.GetAssistant(); -- phó tộc trưởng ID
		local nCaptainMoney = math.floor(nStockBaseCount * pPlayer.GetProductivity() * nCaptainRate);	
		local nAssistantMoney = math.floor(nStockBaseCount * pPlayer.GetProductivity() * nAssistantRate);
		local nPersonalMoney = math.floor(nStockBaseCount * pPlayer.GetProductivity() * nPersonalRate);
		local nTongMoney = math.floor(nStockBaseCount * pPlayer.GetProductivity() * nTongRate);	
		if nCaptainMoney> 0 then
			GCExcute{"Tong:AddBuildFund_GC", pPlayer.dwTongId, nKinId, nCaptainId, nCaptainMoney, 1, 0, 0};
		end
		if nAssistantMoney> 0 then
			GCExcute{"Tong:AddBuildFund_GC", pPlayer.dwTongId, nKinId, nAssistantId, nAssistantMoney, 1, 0, 0};
		end
		if nPersonalMoney> 0 then
			GCExcute{"Tong:AddBuildFund_GC", pPlayer.dwTongId, nKinId, nMemberId, nPersonalMoney, 1, 0, 1};
		end
		if nTongMoney> 0 then
			GCExcute{"Tong:AddGreatBonus_GC", pPlayer.dwTongId, nTongMoney, nPlayerId};
--			GCExcute{"Tong:AddBuildFund_GC", pPlayer.dwTongId, nKinId, nMemberId, nTongMoney, 0, 0, 0};
		end
		
		local nMasterId = Tong:GetMasterId(pPlayer.dwTongId); -- bang chủ ID
		if nMasterId ~= 0 then
			local nMasterMoney = math.floor(nStockBaseCount * pPlayer.GetProductivity() * nMasterRate);
			local pMaster = KPlayer.GetPlayerObjById(nMasterId);
			if not pMaster then 
				return;
			end
			local nMasterKinId, nMasterMemberId = pMaster.GetKinMember();
			if nMasterMoney> 0 then
				GCExcute{"Tong:AddBuildFund_GC", pPlayer.dwTongId, nMasterKinId, nMasterMemberId, nMasterMoney, 1, 0, 0};
			end
		end
	end
end

function Tong:UpDateOfficialMaintain_GS2(nTongId, nTongOfficialLevel, tbResult, nDataVer)	
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		pTong.SetTongFigureDataVer(nDataVer);
		pTong.SetPreOfficialLevel(nTongOfficialLevel);
		for i = 1, Tong.MAX_TONG_OFFICIAL_NUM do
			if tbResult[i] then
				local nOfficialKinId = tbResult[i].nKinId;
				local nOfficialMemberId = tbResult[i].nMemberId;
				pTong.SetOfficialKin(i, nOfficialKinId);
				pTong.SetOfficialMember(i, nOfficialMemberId);	
			end
		end
	end
end
	
-- xin bang hội quan hàm tấn cấp 
function Tong:IncreaseOfficialLevel_GS2(nTongId, nLevel, nIncreaseNo, nDataVer)
	local pTong = KTong.GetTong(nTongId);
	if pTong and nLevel then
		-- thiết trí bang hội quan hàm xoay ngang 
		pTong.SetIncreaseOfficialNo(nIncreaseNo);
		pTong.SetOfficialMaxLevel(nLevel);
		pTong.SetOfficialLevel(nLevel);
		pTong.SetTongFigureDataVer(nDataVer);
		KTong.Msg2Tong(nTongId, "Cấp quan hàm của bang hội tăng lên cấp :<color=green>"..nLevel.."<color>. Ấn F7 chọn giao diện quan hàm để kiểm tra phí duy trì.");
	end
end
	
-- tuyển trạch bang hội quan hàm xoay ngang 
function Tong:ChoseOfficialLevel_GS2(nTongId, nLevel, nDataVer)
	local pTong = KTong.GetTong(nTongId);
	if pTong and nLevel then
		-- thiết trí bang hội quan hàm xoay ngang 
		pTong.SetOfficialLevel(nLevel);
		pTong.SetTongFigureDataVer(nDataVer);
		KTong.Msg2Tong(nTongId, "Cấp quan hàm của bang hội tăng lên cấp :<color=green>"..nLevel.."<color>. Ấn F7 chọn giao diện quan hàm để kiểm tra phí duy trì.");
	end
end

-- cá nhân quan hàm giữ gìn thành công 
function Tong:OfficialMaintain_GS2(nTongId, nKinId, nMemberId, nPlayerId, 
								 nPersonalStock, nTotalStock, nMaintainNo, nOfficialLevel, nDataVer)	
								 
	KGCPlayer.OptSetTask(nPlayerId, KGCPlayer.TSK_TONGSTOCK, nPersonalStock);
	KGCPlayer.OptSetTask(nPlayerId, KGCPlayer.TSK_MAINTAIN_OFFICIAL_NO, nMaintainNo); --ghi lại giữ gìn Lưu Thuỷ hào 
	KGCPlayer.OptSetTask(nPlayerId, KGCPlayer.TSK_OFFICIAL_LEVEL, nOfficialLevel);
	
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if pPlayer then
		Tong:AddOfficialTitle(nPlayerId, nOfficialLevel);
		pPlayer.Msg("Quan hàm được duy trì thành công.");
	end

	local pKin = KKin.GetKin(nKinId);
	if pKin then
		local pMember = pKin.GetMember(nMemberId);
		if pMember then
			pMember.SetPersonalStock(nPersonalStock);
		end
	end
	
	-- canh tân phiên bản hào 
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		pTong.SetTongFigureDataVer(nDataVer);
		pTong.SetTotalStock(nTotalStock);
	end
end	

-- cá nhân quan hàm giữ gìn thất bại 
function Tong:OfficialMaintainFail_GS2(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer then
		return 0;
	end
	local tbTitles = pPlayer.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			if pTitle.byTitleGenre == Tong.OFFICIAL_TITLE_GENRE then
				pPlayer.RemoveTitle(pTitle.byTitleGenre,
								 pTitle.byTitleDetailType, 
								 pTitle.byTitleLevel, 0)
			end
		end
	end
	return 1;
end 

-- căn cứ lãnh thổ số lượng điều chỉnh bang hội quan hàm xoay ngang 
function Tong:AdjustOfficialMaxLevel_GS2(nTongId, nLevel, nChoseLevel, nDataVer)
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		pTong.SetOfficialMaxLevel(nLevel);
		pTong.SetOfficialLevel(nChoseLevel);
		-- canh tân phiên bản hào 
		pTong.SetTongFigureDataVer(nDataVer);
	end
end

-- dành cho tương ứng quan hàm 
function Tong:AddOfficialTitle(nPlayerId, nPersonalLevel)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not pPlayer or not nPersonalLevel then
		return 0;
	end
	
	local tbTitles = pPlayer.GetAllTitle();
	if tbTitles then
		for _, pTitle in ipairs(tbTitles) do
			if pTitle.byTitleGenre == Tong.OFFICIAL_TITLE_GENRE then
				pPlayer.RemoveTitle(pTitle.byTitleGenre,
								 pTitle.byTitleDetailType, 
								 pTitle.byTitleLevel, 0)
			end
		end
	end
	                
	pPlayer.SyncOfficialLevel(nPersonalLevel);
	local nOfficialDetail = Tong:GetPlayerOfficialDetail(nPlayerId);
	pPlayer.AddTitle(Tong.OFFICIAL_TITLE_GENRE, nOfficialDetail, nPersonalLevel, 0, 0);
	
	local nSelfGenre, nSelfDetail, nSelfLevel = pPlayer.GetCurTitle();
	if nSelfGenre == 0 or nSelfGenre == Tong.OFFICIAL_TITLE_GENRE then
		pPlayer.SetCurTitle(Tong.OFFICIAL_TITLE_GENRE, nOfficialDetail, nPersonalLevel, 0);
	end
	return 1;
end

-- ngoạn gia login dành cho tương ứng quan hàm 
function Tong:AddOfficialTitleOnLogin()
	local nOfficialLevel = Tong:GetPlayerOfficialLevel(me.nId);
	if nOfficialLevel and nOfficialLevel> 0 then
		Tong:AddOfficialTitle(me.nId, nOfficialLevel);
	end
end
PlayerEvent:RegisterOnLoginEvent(Tong.AddOfficialTitleOnLogin, Tong)

-- bắt đầu bình chọn ưu tú thành viên GS2
function Tong:StartGreatMemberVote_GS2(nTongId, nSucess)
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		Tong:ClearGreatMemberVote(nTongId);
		if nSucess == 1 then
			pTong.SetGreatMemberVoteState(1);
			KTong.Msg2Tong(nTongId, "Bắt đầu bầu chọn thành viên ưu tú");
		else
			KTong.Msg2Tong(nTongId, "Tuần trước các thành viên ưu tú chưa nhận hết phần thưởng.");
		end
		
		return 1;
	end
	return 0;
end

-- kết thúc bình chọn ưu tú thành viên GS2
function Tong:EndGreatMemberVote_GS2(nTongId, nWeekGreatBonus, tbGreatMemberInfo)
	local tbGreatMemberName = {}
	local nGreatMemberCount = 0;
	local pTong = KTong.GetTong(nTongId);

	if pTong then 
		pTong.SetWeekGreatBonus(nWeekGreatBonus);
		pTong.SetGreatMemberVoteState(0);		
		KTong.Msg2Tong(nTongId,"bang hội ưu tú thành viên tranh cử kết thúc");
		if tbGreatMemberInfo then
			for i = 1, self.GREAT_MEMBER_COUNT do
				local szPlayerName ="";
				if tbGreatMemberInfo[i] then
					pTong.SetGreatMemberId(i, tbGreatMemberInfo[i][2]);
					pTong.SetGreatKinId(i, tbGreatMemberInfo[i][1]);
					local pKin = KKin.GetKin(tbGreatMemberInfo[i][1]);
					if pKin then
						local pMember = pKin.GetMember(tbGreatMemberInfo[i][2])
						if pMember then
							nGreatMemberCount = nGreatMemberCount + 1;
							szPlayerName = KGCPlayer.GetPlayerName(pMember.GetPlayerId());
						end
					end
				else
					pTong.SetGreatMemberId(i, 0);
					pTong.SetGreatKinId(i, 0);
				end
				table.insert(tbGreatMemberName, szPlayerName);
			end
			if nGreatMemberCount> 0 then
				pTong.AddAffairGreatMember(unpack(tbGreatMemberName));
			end
			return 1;
		end
	end
	return 0;
end

-- ưu tú thành viên đầu phiếu GS1
function Tong:ElectGreatMember_GS1(nTagetKinId, nTagetMemberId)
	local nTongId = me.dwTongId;
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		me.Msg("Bạn không có bang hội, không thể bỏ phiếu")
		return 0;
	end	
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local pSelfKin = KKin.GetKin(nSelfKinId);
	if not pSelfKin then
		return 0;
	end	
	local pSelfMember = pSelfKin.GetMember(nSelfMemberId);
	if not pSelfMember then 
		return 0;
	end

	local nSuccess, nErrCase = Tong:CanElectGreatMember(nTongId, nSelfKinId, nSelfMemberId, nTagetKinId, nTagetMemberId)
	if nSuccess  == 0 then
		if nErrCase == 1 then
			me.Msg("Đồng bộ dữ liệu");
		elseif nErrCase == 2 then
			me.Msg("Chưa bắt đầu bỏ phiếu");
		elseif nErrCase == 3 then
			me.Msg("Không thể bỏ phiếu cho người bạn chọn");
--		elseif nErrCase == 4 then
--			me.Msg("你还不是正式成员，还不能投票");
		elseif nErrCase == 5 then
			me.Msg("Bạn đã bỏ phiếu");
		elseif nErrCase == 6 then
			me.Msg("Đã đủ số lượng phiếu bầu.");
		end
		return 0;
	end
	local nMemberVoteNo = KGblTask.SCGetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO);
	pSelfMember.SetMemberVoteNo(nMemberVoteNo); --	标志已经投票
	
	local pTagetKin = KKin.GetKin(nTagetKinId);
	local pTagetMember = pTagetKin.GetMember(nTagetMemberId);
	local szTagetName = KGCPlayer.GetPlayerName(pTagetMember.GetPlayerId());
	Dbg:WriteLog("ElectGreatMember", "优秀成员投票申请", "投票者："..me.szName, "受票者："..szTagetName, "流水号："..nMemberVoteNo)
	
	return GCExcute{"Tong:ElectGreatMember_GC", nTongId, nSelfKinId, nSelfMemberId, nTagetKinId, nTagetMemberId, nMemberVoteNo};
end
RegC2SFun("ElectGreatMember", Tong.ElectGreatMember_GS1);

-- ưu tú thành viên đầu phiếu GS2
function Tong:ElectGreatMember_GS2(nSelfPlayerId, nTagetKinId, nTagetMemberId, nVote)	
	local pPlayer = KPlayer.GetPlayerObjById(nSelfPlayerId);
	local pTagetKin = KKin.GetKin(nTagetKinId);
	local pTagetMember = pTagetKin.GetMember(nTagetMemberId);
	local szTagetName = KGCPlayer.GetPlayerName(pTagetMember.GetPlayerId());
	if pPlayer and szTagetName then
		pPlayer.Msg("ngươi đầu phiếu cấp <color=yellow>"..szTagetName.."<color>");
	end
	if pTagetMember then
		pTagetMember.SetGreatMemberVote(nVote);
		local szSelfName = KGCPlayer.GetPlayerName(nSelfPlayerId);
		local nMemberVoteNo = KGblTask.SCGetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO);
		Dbg:WriteLog("ElectGreatMember","ưu tú thành viên đầu phiếu thành công","đầu phiếu người ："..szSelfName,
					"thụ phiếu người ："..szTagetName,"số phiếu ："..nVote,"Lưu Thuỷ hào"..nMemberVoteNo)
	end
--	return KTongGs.TongClientExcute(nTongId, {"Tong:ElectGreatMember_C2", szTagetName, nVote})
end

-- tiếp thu ưu tú thành viên thưởng cho GS1
function Tong:ReceiveGreatBonus(nChoose, bConfirm)
	local nTongId = me.dwTongId;
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		Dialog:Say("ngươi còn không có bang hội");
		return 0;
	end
	local nWeekBonus = pTong.GetWeekGreatBonus();
	-- tuyển trạch &lĩnh thưởng cho 
	local tbAwardMode = {0, 20, 40, 60, 80, 100} -- thưởng cho hình thức tỉ lệ phần trăm biểu （dĩ ngân lượng chiếm tỉ lệ phần trăm làm cơ chuẩn ）
	local tbOpt = {};
	local szMsg ="Tuần này bang hội ưu tú danh sách thành viên như sau ：\n";
		
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	local pSelfKin = KKin.GetKin(nSelfKinId);
	local pSelfMember = pSelfKin.GetMember(nSelfMemberId);
	local bIsGreatMember = 0;
	for i = 1, self.GREAT_MEMBER_COUNT do	
		local nGreatKinId = pTong.GetGreatKinId(i);
		local nGreatMemberId = pTong.GetGreatMemberId(i);
		local pGreatKin = KKin.GetKin(nGreatKinId);
		if pGreatKin and pGreatKin.GetBelongTong() == nTongId then	
			local pGreatMember = pGreatKin.GetMember(nGreatMemberId);
			if pGreatMember then	
				local nPlayerId = pGreatMember.GetPlayerId();
				local szTagetName = KGCPlayer.GetPlayerName(nPlayerId);
				if szTagetName then
					szMsg = szMsg.."  <color=green>"..szTagetName.."<color>\n";
				end
				if pTong.GetGreatMemberId(i) == nSelfMemberId and pTong.GetGreatKinId(i) == nSelfKinId then
					bIsGreatMember = 1;
				end
			end
		end		
	end
	
	local nCurNo = KGblTask.SCGetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO);

	if pSelfMember.GetReceiveGreatBonusNo() == nCurNo then
		szMsg = szMsg.."ngươi lĩnh quá tuần này đích thưởng cho quỹ liễu 。";
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end

	if bIsGreatMember ~= 1 then
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	
	if not nChoose and nWeekBonus> 0 then
		local szSay ="";
		-- tuyển trạch phương thức tưởng thưởng 
		for nIdex = 1, #tbAwardMode do
			local nItemLevel, nItemNum, nMoney = Domain:CalculateTongAward(nWeekBonus, tbAwardMode[nIdex]);		
			-- 取整
			if (nItemNum == nil or nItemLevel == nil) then 
				szSay = string.format("Nhận được %d: <color=green>%d vạn lượng bạc", nIdex, nMoney);	
			elseif (nMoney == nil) then 
				szSay = string.format("Nhận được %d: <color=green>%d viên huyền tinh cấp %d", nIdex, nItemNum, nItemLevel);
			else
				szSay = string.format("Nhận được %d: <color=green>%d viên huyền tinh cấp %d và %d vạn lượng bạc", nIdex, nItemNum, nItemLevel, nMoney);
			end
			table.insert(tbOpt, { szSay, self.ReceiveGreatBonus, self, nIdex, 1 })
		end
		table.insert(tbOpt, {"Kết thúc đối thoại"});
		szMsg = szMsg.."<color=yellow>Chúc mừng ngươi thành công được tuyển tuần này bang hội ưu tú thành viên<color>\nnNgài vui lòng chọn 1 loại phần thưởng ：";
		Dialog:Say(szMsg, tbOpt);		
		return 0;
		
	elseif nWeekBonus <= 0 then
		Dialog:Say("Tuần này thưởng cho quỹ vi <color=yellow>0<color>");
		return 0;
	end
	
	if bConfirm == 1 then
		local nBonus = pTong.GetGreatBonus() - nWeekBonus;
		if nBonus <0 then
			Dialog:Say("Bang hội thưởng cho quỹ bất túc");
			return 0;
		end
		local nLevel, nItemNum, nResMoney = Domain:CalculateTongAward(nWeekBonus, tbAwardMode[nChoose]);
		if me.GetBindMoney() + nResMoney> me.GetMaxCarryMoney() then
			Dialog:Say("xin lỗi ，ngài mang theo ngân lượng đã đạt hạn mức cao nhất ，thỉnh chỉnh lý hậu trở lại lĩnh");
			return 0;
		end
		if nItemNum and nLevel and nLevel> 0 then
			if (nItemNum> me.CountFreeBagCell()) then
				Dialog:Say("ngài đích ba lô không gian bất túc");
				return 0;
			end
		end		
				
		GCExcute{"Tong:ReceiveGreatBonus_GC", nTongId, nSelfKinId, nSelfMemberId, nWeekBonus, tbAwardMode[nChoose]}
		return 1;
	end
end

-- tiếp thu ưu tú thành viên thưởng cho GS2
function Tong:ReceiveGreatBonus_GS2(nTongId, nSelfKinId, nSelfMemberId, nBonus, nMoney, nAwardMode)
	local pTong = KTong.GetTong(nTongId);
	if not pTong or not nBonus or nBonus < 0 then
		return 0;
	end
	
	pTong.SetGreatBonus(nBonus);
	
	local pSelfKin = KKin.GetKin(nSelfKinId);
	local pSelfMember = pSelfKin.GetMember(nSelfMemberId);
	if not pSelfKin or not pSelfMember then
		return 0;
	end

	local nCurNo = KGblTask.SCGetDbTaskInt(DBTASK_GREAT_MEMBER_VOTE_NO);
	pSelfMember.SetReceiveGreatBonusNo(nCurNo); 
	
	local nPlayerId = pSelfMember.GetPlayerId();
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	
	if self:ReceiveAward(nMoney, nPlayerId, nAwardMode, "Tong") == 1 then
		if pPlayer then
  			pPlayer.Msg("Nhận thưởng thành công");
  			KTong.Msg2Tong(nTongId, "<color=green>"..pPlayer.szName.."<color> nhận được phần thưởng ưu tú Bang");
  		end
  		return 1;
  	end
  	if pPlayer then
		pPlayer.Msg("Nhận thưởng thất bại");
	end
	return 0;
end

-- dành cho ngoạn gia nPersonalAwardValuegiá trị lượng đích nMoneyPercenttiễn và （1 - nMoneyPercent）đích huyền tinh 
function Tong:ReceiveAward(nPersonalAwardValue, nPlayerId, nMoneyPercent, szLogName)
	local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	if not cPlayer then
		return 0;
	end
	local cTong = KTong.GetTong(cPlayer.dwTongId);
	if not cTong then
		return 0;
	end

	local nMoney = nPersonalAwardValue * nMoneyPercent / 100;
	local nValue = nPersonalAwardValue * (100 - nMoneyPercent) / 100;
	local tbItem = {}; 
	local nLevel = 0; 
	local nResValue = 0;
	
	if (nValue > 0) then
		tbItem, nLevel, nResValue = Item:ValueToItemAndMoney(nValue);
			if tbItem and nLevel and nLevel > 0 then
				if (tbItem[nLevel] > cPlayer.CountFreeBagCell()) then
				cPlayer.Msg("Hành trang của bạn không đủ chỗ trống");
					return 0;
				end
	
				for nNum = tbItem[nLevel], 1, -1 do			
					cPlayer.AddItem(18, 1, 114, nLevel);	
				end
			end
	end
	if not nResValue then
		nResValue = 0;
	end
	nMoney = nResValue + nMoney;
	-- 取整
	nMoney = math.floor(nMoney);
	cPlayer.AddBindMoney(nMoney, Player.emKBINDMONEY_ADD_TONG_FUN);
	local nItemSum = tbItem[nLevel] or 0;
	cPlayer.PlayerLog(Log.emKPLAYERLOG_TYPE_JOINSPORT, string.format("Người chơi nhận được phần thưởng Bang hội %s，số lượng vật phẩm: %s\tCấp vật phẩm: %s\tGiá trị đạt được: %s\tnhận được số bạc khóa: %s",nPersonalAwardValue,nItemSum,nLevel,nResValue,nMoney));	
	Dbg:WriteLog(szLogName or "DomainBattle", "玩家获得帮会奖励价值", cPlayer.szAccount, cPlayer.szName, nPersonalAwardValue);
	KStatLog.ModifyAdd("bindjxb", "[产出]领土战", "总量", nMoney);
	return 1;
end

-- thiết trí bang hội thưởng cho quỹ tỉ lệ 
function Tong:AdjustGreatBonusPercent(nPercent, bConfirm)
	local nTongId = me.dwTongId;
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		Dialog:Say("Bạn chưa có Bang hội");
		return 0;
	end
	local nSelfKinId, nSelfMemberId = me.GetKinMember();
	if Tong:CheckPresidentRight(nTongId, nSelfKinId, nSelfMemberId) ~= 1 then
		Dialog:Say("Bạn không phải Thủ lĩnh");
		return 0;
	end
	local tbOpt = {};
	local szMsg = "";
	local nBonus = pTong.GetGreatBonus();
	local nGreatBonusPercent =  pTong.GetGreatBonusPercent();
	local tbAwardMode = {50, 75, 100}; -- 奖励模式百分比表（以银两占的百分比为基准）
	if not nPercent then
		local szSay = "";
		-- 选择奖励方式
		for nIdex = 1, #tbAwardMode do		
			szSay = string.format("<color=green>%d phần trăm<color>", tbAwardMode[nIdex]);		
			table.insert(tbOpt, { szSay, self.AdjustGreatBonusPercent, self, tbAwardMode[nIdex]})
		end
		table.insert(tbOpt, {"Kết thúc đối thoại"});
		szMsg = "Tổng quỹ thưởng hiện tại là: <color=green>"..nBonus.."<color> \nTỷ lệ thưởng là: <color=green>"..nGreatBonusPercent.."<color> \nBạn có thể chọn một trong các tỷ lể nhận thưởng tuần này như sau: ";
		
		Dialog:Say(szMsg, tbOpt);		
		return 0;
	end
	
	if nPercent and not bConfirm then
		szMsg = "Bạn chắc chắn sửa tỷ lệ thưởng thành <color=green>"..nPercent.."<color>? Tỷ lệ thưởng mới sẽ được áp dụng vào thứ hai tuần tới";
		table.insert(tbOpt, { "Đồng ý", self.AdjustGreatBonusPercent, self, nPercent, 1 });
		table.insert(tbOpt, {"Kết thúc đối thoại"});
		Dialog:Say(szMsg, tbOpt);
		return 0;	
	end
	
	if bConfirm == 1 then
		local nWeekBonus = nBonus * nPercent / 100;
		szMsg = "Bạn thiết lập mức thưởng Bang hội tuần này là: <color=green>"..nWeekBonus.."<color> \n";
		return GCExcute{"Tong:AdjustGreatBonusPercent_GC", nTongId,  nSelfKinId, nSelfMemberId, nPercent}
	end
	
	Dialog:Say(szMsg, tbOpt);		
	return 0;
end

-- thiết trí bang hội thưởng cho quỹ tỉ lệ GS2
function Tong:AdjustGreatBonusPercent_GS2(nTongId, nPercent, nDataVer)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetGreatBonusPercent(nPercent);
	pTong.SetTongDataVer(nDataVer);
	KTong.Msg2Tong(nTongId, "Đặt tỷ lệ quỹ thưởng Bang hội là: <color=yellow>"..nPercent.."%<color>");	
end

-- tăng thưởng cho quỹ GS1
function Tong:AddGreatBonus_GS(nTongId, nMoney, nPlayerId)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	if nMoney + pTong.GetGreatBonus()> 2000000000 then
		return 0;
	end
	return GCExcute{"Tong:AddGreatBonus_GC", nTongId, nMoney, nPlayerId}
end

-- tăng thưởng cho quỹ GS2
function Tong:AddGreatBonus_GS2(nTongId, nBonus, nPlayerId, nMoney)
	local pTong = KTong.GetTong(nTongId);
	if not pTong or nBonus < 0 then
		return 0;
	end
	
	pTong.SetGreatBonus(nBonus);
	
	if nPlayerId then
		local cPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if cPlayer and nMoney and nMoney > 0 then
			cPlayer.Msg("Bạn thêm vào quỹ thưởng Bang hội <color=yellow>"..nMoney.."<color> lượng bạc");
			return 0;
		end
	end
end

-- thêm vào liên minh_GS2
function Tong:JoinUnion_GS2(nTongId, szUnionName, nUnionId)
	local pTong = KTong.GetTong(nTongId);
	if not pTong then
		return 0;
	end
	pTong.SetBelongUnion(nUnionId);
	local nDataVer = pTong.GetTongDataVer(nDataVer);
	pTong.SetTongDataVer(nDataVer + 1);
	KTongGs.TongAttachUnion(nTongId, nUnionId);
	KTong.Msg2Tong(nTongId, string.format("bản bang gia nhập liên minh [%s]", szUnionName));
end

-- ly khai liên minh_GS2
function Tong:LeaveUnion_GS2(nTongId, szUnionName, nLeaveTime, nMethod)
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		return 0;
	end

	--thanh không bang hội tương quan số liệu 
	pTong.SetBelongUnion(0);
	KTongGs.TongDetachUnion(nTongId);
	local szMsg ="";	
--	if nMethod ~= 1 then
--		szMsg = string.format("[%s]bang sẽ rời đi liên minh [%s]", pTong.GetName(), szUnionName);
--	else
--		szMsg = string.format("[%s]bang hội bị liên minh [%s]khai trừ rồi", pTong.GetName(), szUnionName);
--	end
--	KTong.Msg2Tong(nTongId, szMsg);	
	local nDataVer = pTong.GetTongDataVer(nDataVer);
	pTong.SetTongDataVer(nDataVer + 1);
	pTong.SetLeaveUnionTime(nLeaveTime);
	return 1;
end

-- bang hội thông cáo_GS1
function Tong:TongAnnounce_GS1(nTongId, nTimes, nDistance, szMsg)
	local pTong = KTong.GetTong(nTongId)
	if not pTong then
		me.Msg("Bạn không có Bang hội, không thể phát đi thông báo Bang hội");
		return 0;
	end
	--是否包含敏感字串
	if IsNamePass(szMsg) ~= 1 then
		me.Msg("Thông báo có chứa từ không cho phép, hãy nhập lại");
		return 0;
	end
	
	local nKinId, nMemberId = me.GetKinMember();

	if Tong:CheckSelfRight(nTongId, nKinId, nMemberId, 0) ~= 1 then
		me.Msg("Bạn không có quyền gửi thông báo");
		return 0;
	end
	if nTimes < self.TONGANNOUNCE_MIN_TIMES or nTimes > self.TONGANNOUNCE_MAX_TIMES then
	 	me.Msg("Số thông báo bạn gửi vượt quá số lần quy định");
		return 0;
	end
	if nDistance < self.TONGANNOUNCE_MIN_DISTANCE or nDistance > self.TONGANNOUNCE_MAX_DISTANCE then
	   	me.Msg("Bạn đã gửi thông báo Bang hội nhiều hơn khoảng thời gian được chỉ định");
		return 0;
	end
	if pTong.GetAnnounceTimes() > 0 then
		me.Msg("Bạn mới gửi thông báo Bang hội, cần đợi mới có thể gửi tiếp thông báo");
		return 0;
	end
	
	GCExcute{"Tong:RegisterTongAnnounce_GC", nTongId, nKinId, nMemberId, nTimes, nDistance, szMsg};
end


RegC2SFun("TongAnnounce", Tong.TongAnnounce_GS1);

-- bang hội thông cáo_GS2
function Tong:TongAnnounce_GS2(nTongId, szMsg, nTimes)
	print("TongAnnounce_GS2")
	local pTong = KTong.GetTong(nTongId);
	if pTong then
		pTong.SetAnnounceTimes(nTimes);
		if szMsg ~=""then
			return KTong.Msg2Tong(nTongId,"[bang hội thông cáo]"..szMsg);
		end	
	end
end

