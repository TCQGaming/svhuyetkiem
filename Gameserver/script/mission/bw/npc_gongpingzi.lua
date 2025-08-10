
local GongPingZi = Npc:GetClass("gongpingzi");

function GongPingZi:OnDialog()
	-- ta là một chức năng NPC,so ta chỉ có chức năng đối thoại,không có cá tính đối thoại 
	-- vậy chuyển tới chức năng đích bộ phận ba 
	BiWu:OnDialog();
end;

function BiWu:OnDialog()

--	không tiến hành mới bắt đầu hóa ，ở OpenMissionthì xử lý tương quan trị số 	
--	Class TB_MAPDEC_INFO không sử dụng nữa ，BW.tbMission[nMapId] đại thế 
	
	local nOpen, nRun, nFree = 0,0,0;	--đã báo danh chuẩn bị vào bàn --báo danh tịnh bắt đầu bỉ tái --không rãnh nơi sân 
	
	local nCityid = SubWorldIdx2ID(SubWorld);			--trước mặt Thành thị ID
	--local tbBwMap = self.TB_CITY_BIWU_INFO[nCityid];	--trước mặt Thành thị đối ứng luận võ nơi sân 
	local tbBwMapInfo = self:GetBiWuMapInfo(nCityid);
	
	--for i = 1, #tbBwMap do
		--local tbInfo = self.tbMission[tbBwMap[i]];
	for nMapId, tbInfo in pairs(tbBwMapInfo) do
		
		if (tbInfo.nState == 1) then
			nOpen = nOpen + 1;
		elseif (tbInfo.nState == 2) then
			nOpen = nOpen + 1;
			nRun = nRun + 1;
		else
			nFree = nFree + 1;
		end;
	end;
	
	--Choáng,không có đã báo danh đích,không có đã đánh,không có trống không, vậy nếu không có luận võ địa đồ lâu 
	if (nOpen == 0 and nRun == 0 and nFree == 0) then
		BiWu:ErrorMsg(3);
		return 0;
	end;
	
	local szMsg = string.format("%s：Lôi đài Tỉ Võ Công Bình Tử , nơi phân cao thấp của các nhân tài tứ phương trong Võ Lâm", him.szName);
	local tbOpp = {};
	table.insert(tbOpp, {"Chúng ta muốn thi đấu","BiWu:OnSelectMap", nFree});	--tuy rằng hẳn là hiện phán đoán nói không có không rãnh nơi sân sẽ không ra đối thoại,
																			--thế nhưng có đối thoại khả dĩ tăng Nhắc nhở,không cần ở chúa trong đối thoại bỏ thêm 
	if (nOpen == 0 and nRun == 0) then
		szMsg = string.format("%s Trước mặt chưa có Đại hiệp ước định đánh một trận 。",szMsg);
	else
		if (nOpen ~= 0) then
			szMsg = string.format("%s Trước mặt dĩ ước định %dtràng luận võ chi kỳ 。",szMsg, nOpen);
		end;
		if (nRun ~= 0) then
			szMsg = string.format("%s Đang tiến hành %d tràng đặc sắc quyết đấu 。",szMsg, nRun);
		end;
		
		if (BiWu:CheckShowKey() ~= 0) then
			table.insert(tbOpp, {"Hãy cho ta xem lại Key",self.OnShowKey, self});	--đây là một loại phương pháp sáng tác, cần truyền vào self tài khả kế thừa (ở đây dùng cái từ này đúng hay không) 
		end;
		table.insert(tbOpp, {"Tiến vào tham chiến","BiWu:OnEnterMatch"});	--đây là một loại khác phương pháp sáng tác không cần truyền vào selfchính hoàn thành kế thừa 
		table.insert(tbOpp, {"Ta muốn quan chiến", self.OnLook, self});	--có ước định luận võ tài khả dĩ quan khán lâu 
	end;
	
	table.insert(tbOpp, {"Xem chiến tích", self.ShowMyGrade, self});		--cái này là bang trợ 
	-- table.insert(tbOpp, {"tỷ võ quy tắc là cái gì ？", self.OnHelp, self});		--cái này là bang trợ 
	table.insert(tbOpp, {"Ta nhầm", self.OnCancel});	--dạ dạ,tổng yếu có một rời khỏi tuyển trạch a 
	Dialog:Say(szMsg, tbOpp);
end;


function BiWu:OnSelectMap()
	if (self:IsSigningUp() == 0) then
		return 0;
	end;
	local szMsg = string.format("%s：Xin chào", him.szName);
	local tbOpp = {};
	--local nCityid = SubWorldIdx2ID(SubWorld);			--trước mặt Thành thị ID
	--local tbBwMap = self.TB_CITY_BIWU_INFO[nCityid];	--bổn thành thị đối ứng lôi đài địa đồ 
	local tbBwMapInfo = self:GetBiWuMapInfo();
	--for i = 1, #tbBwMap do
	for nMapId, tbInfo in pairs(tbBwMapInfo) do
		--if (self.tbMission[tbBwMap[i]]~= nil) then
		local szOpp = GetMapNameFormId(nMapId);
		if (tbInfo.nState and tbInfo.nState ~= 0) then
			szOpp = string.format("%s<%s>", szOpp,"dĩ ước định");
		end;
		table.insert(tbOpp, {szOpp, self.OnSelectType, self, nMapId});
	end;
	--end;
	table.insert(tbOpp, {"Hãy để chúng tôi suy nghĩ thêm", self.OnCancel});
	Dialog:Say(szMsg, tbOpp);
end;

function BiWu:OnSelectType(nMapId)
	local szMsg = string.format("%s：trên lôi đài ，luận võ luận bàn tự có luật các ngươi muốn thi đấu loại hình nào ?", him.szName);
	Dialog:Say(szMsg, {
	{"Chúng ta muốn tiến hành 1V1 đối chiến",self.SignUpFinal, self, nMapId, 1},
	{"Chúng ta muốn tiến hành 2V2 đối chiến",self.SignUpFinal, self, nMapId, 2},
	{"Chúng ta muốn tiến hành 3V3 đối chiến",self.SignUpFinal, self, nMapId, 3},
	{"Chúng ta muốn tiến hành 4V4 đối chiến",self.SignUpFinal, self, nMapId, 4},
	{"Chúng ta muốn tiến hành 5V5 đối chiến",self.SignUpFinal, self, nMapId, 5},
	{"Chúng ta muốn tiến hành 6V6 đối chiến",self.SignUpFinal, self, nMapId, 6},
	{"Chúng ta suy nghĩ thêm một chút",self.OnCancel},	});
end;

function BiWu:SignUpFinal(nMapId, nMemberCount)
	
	if (self:IsSigningUp(nMapId) == 0) then
		return 0;
	end;
	
	if (nMemberCount <= 0 or nMemberCount> 6) then
		return 0;
	end
	
	local szSignMapName = SubWorldName(SubWorld);
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nMapId);
	
	-- Mission:Open(self.MISSIONID);
	local tbKey = {};
	tbKey = self:GetRandomKey();	--ngẫu nhiên một key làm lôi đài ra vào đích chữ mấu chốt cung vai sử dụng 
		
	local OldPlayerIndex = PlayerIndex;
	local pOldMe = me;
	local tbCaptainName = {};
	local tbCaptainId = {};
	local tbPlayer, nTeamCount = me.GetTeamMemberList()
	
	for i = 1, #tbPlayer do 
		
		me = tbPlayer[i];	--me.GetTeamMemberList();--GetTeamMember(i);
		PlayerIndex = me.nPlayerIndex;
		--SetMissionS(self.MSS_CAPTAIN[i], me.GetName());
		
		tbCaptainName[#tbCaptainName + 1] = me.szName;
		tbCaptainId[#tbCaptainId + 1] = me.nId;
		local szKeyMsg ="";
		if (nMemberCount> 1) then
			szKeyMsg = string.format("ngươi chỗ đội ngũ đích vào bàn khẩu lệnh vi ：<color=red>%d<color>。thỉnh tương cai khẩu lệnh thông tri của ngươi Đồng đội 。nếu có thể đáp ra cai khẩu lệnh tài năng vào bàn luận võ 。", tbKey[i]);
			me.Msg(szKeyMsg);
		end
		Dialog:Say(string.format("%s：các ngươi ước định vu 1 phút sau ở [%s] tiến hành [%dV%d] rất đúng chiến hãy chuẩn bị đúng thời gian quy định %s", 
								him.szName, GetMapNameFormId(nMapId), 
								nMemberCount, nMemberCount, szKeyMsg),
							{{"dạ ，ta đã biết",self.OnCancel},});
	end;
	
	PlayerIndex = OldPlayerIndex;
	me = pOldMe;
	
	BiWu:StartGame(nMapId, nMemberCount, tbKey, tbCaptainName, tbCaptainId);	-- mở ra mission
	SubWorld = OldSubWorld;
	
	
	local szMsg = string.format("%s dữ %s ước định vu 1phút sau ở [%s]đích [%s]tiến hành [%dV%d]rất đúng chiến 。", 
					tbCaptainName[1], tbCaptainName[2], szSignMapName, 
					self.tbMission[nMapId].szMapName, nMemberCount, nMemberCount);
	KTeam.Msg2Team(me.nTeamId, string.format("%sxin mau sớm để chuẩn bị nhập vào tràng 。", szMsg));

	local szNews = string.format("%skính xin các vị võ lâm đồng đạo trình diện quan võ luận chiến 。", szMsg);
--	KDialog.NewsMsg(1, Env.NEWSMSG_NORMAL, szNews);
end;

function BiWu:GetRandomKey()
	local tbKey = {};
	tbKey[1] = MathRandom(1, 9999)
	tbKey[2] = MathRandom(1, 9999)
	
	--bảo chứng key1 key2>0, key1 ~= key2
	if (tbKey[2] == tbKey[1]) then
		if (tbKey[1] <9996) then
			tbKey[2] = tbKey[1] + 3
		else
			tbKey[2] = tbKey[1] - 3;
		end
	end
	return tbKey;
end;


--lôi đài tỷ võ bang trợ 
function BiWu:OnHelp()
	Dialog:Say("Công Bình Tử ：lôi đài tỷ võ thị võ lâm hiệp sĩ tỷ thí với nhau võ nghệ 、nhất quyết cao thấp đích nơi 。lôi đài cấp bỉ tái song phương cung cấp một công bình nơi sân 。"
		.."muốn tiến hành lôi đài tỷ võ thi đấu ，đầu tiên tại ta bên này tiến hành lôi đài tranh tài xin 。"
		.."bởi chúng ta nơi sân hữu hạn ，đương sở hữu nơi sân đang tiến hành thời điểm tranh tài ，không tiếp thụ mới bỉ tái xin 。",
				{
					{"trang kế tiếp", self.OnHelp1, self},
					{"cứ như vậy đi", self.OnCancel},
				});
end;
function BiWu:OnHelp1()
	Dialog:Say("Công Bình Tử ：xin sau khi thành công ，song phương có <color=yellow>1phút <color>vào bàn thời gian 。đãi vào bàn thời gian sau khi kết thúc ，bỉ tái chính thức bắt đầu ！"
				.."bỉ tái thời gian chia làm <color=yellow>1phút <color>thời gian chuẩn bị và <color=yellow>10phút <color>thời gian chiến đấu 。thời gian kết thúc thì song phương chưa phân thắng bại ，tắc y theo song phương thương tổn lượng lai phán quyết thắng bại 。",
				{
					{"phản hồi", self.OnDialog, self},
					{"cứ như vậy đi", self.OnCancel},
				});
end;


function BiWu:OnEnterMatch()
	
	if (me.nLevel <self.LimitLevel) then
		self:ErrorMsg(16);
		return 0;
	end;
	
	if (me.nFaction == Player.FACTION_NONE) then
		self:ErrorMsg(18);
		return 0;
	end;
	
	local nMapId = BiWu:CheckShowKey();
	
	if (nMapId ~= 0) then 
		BiWu:OnJoin(nMapId, 0);	--nếu như là đội trưởng ，tắc campý điền một ，không làm vào bàn đích phán đoán 
	else
		local tbBwMapInfo = self:GetBiWuMapInfo();
		local tbOpp = {};
		for i, tbInfo in pairs(tbBwMapInfo) do
			if (tbInfo.nState ~= 0 and tbInfo.nState ~= nil) then
				table.insert(tbOpp, {tbInfo.szMapName,"BiWu:OnEnterMatchMap", i});
			end;
		end;
		table.insert(tbOpp, {"a ，ta đã quên", BiWu.OnCancel});
		Dialog:Say(string.format("%s：xin hỏi vị đại hiệp này /Nữ hiệp ，ngươi là tới tham gia na tràng tỷ võ ？", him.szName), tbOpp);
	end;
end

function BiWu:OnEnterMatchMap(nMapId)
	local tbTempTable = me.GetTempTable("Mission");
	local tbBiWuTask = tbTempTable.tbBiwu;
	if (not tbBiWuTask) then
		tbBiWuTask = {};
		tbTempTable.tbBiwu = tbBiWuTask;
	end;
	tbBiWuTask.nEnterMap = nMapId;

	if not self.tbMission[nMapId] then --tiên yếu phán đoán missioncó hay không tồn tại zounan
		return 0;
	end
	
	tbBiWuTask.szEnterMap = self.tbMission[nMapId].szMapName;
	if (self.tbMission[nMapId].nType == 1) then
		Dialog:Say(string.format("%s：đây là 1v1bỉ tái, chỉ có thể hai người tham gia bổn tràng luận võ 。",him.szName, tbBiWuTask.szEnterMap),
						{
							{"nga ，đã biết", self.OnCancel, self},
							});
	else
		Dialog:Say(string.format("%s：vào bàn luận võ cần khẩu lệnh nghiệm chứng ，thỉnh nói cho ta biết [%s]đích vào bàn khẩu lệnh ！",him.szName, tbBiWuTask.szEnterMap),
						{
							{"nghiệm chứng khẩu lệnh",self.OnEnterKey, self},
							{"ta nữa tra nhìn một chút khẩu lệnh", self.OnCancel, self},
							});
	end;
end;

function BiWu:OnEnterKey()
	Dialog:AskNumber("xin điền vào vào bàn dãy số:", 10000, self.DoEnterKey, self);
end

function BiWu:DoEnterKey(nKey)
	nKey = tonumber(nKey);
	local tbTempTable = me.GetTempTable("Mission");
	local tbBiWuTask = tbTempTable.tbBiwu;
	if (not tbBiWuTask) then
		return 0;
	end;
	local nMapId = tbBiWuTask.nEnterMap;
	
	local OldSubWorld = SubWorld;
	local nMapIdx = SubWorldID2Idx(nMapId);
	if (nMapIdx <0) then
		return 0;
	end;
	--SubWorld = nMapIdx;
	if not self.tbMission[nMapId] then --tiên yếu phán đoán missioncó hay không tồn tại zounan
		return 0;
	end
	
	local tbTeamKey = self.tbMission[nMapId].tbTeamKey;--{GetMissionV(MS_TEAMKEY[1]), GetMissionV(MS_TEAMKEY[2])};
	--SubWorld = OldSubWorld;
	if (nKey == tbTeamKey[1]) then
		self:OnJoin(nMapId,1);
	elseif (nKey == tbTeamKey[2]) then
		self:OnJoin(nMapId,2);
	else
		Dialog:Say(string.format("%s：vị đại hiệp này ，của ngươi vào bàn khẩu lệnh sai a ，ta cũng không dám đơn giản cho ngươi hạ tràng luận võ ，nếu như ra sai lầm nhưng sẽ không tốt ！", him.szName),{{"a ，không đúng sao ，ta tái xác nhận một chút",self.OnCancel}});
	end
	
end

function BiWu:OnLook()
	local tbBwMapInfo = self:GetBiWuMapInfo();
	local tbOpp = {};
	for i, tbInfo in pairs(tbBwMapInfo) do
		if (tbInfo.nState == 1) then
			table.insert(tbOpp, {tbInfo.szMapName,"BiWu:OnLookMap", i});
			
		end;
	end;
	if (#tbOpp == 0) then
		Dialog:Say(string.format("%s；Xin lỗi ，hiện đang không có ai thi đấu",him.szName), {{"Kết thúc đối thoại",self.OnCancel}});
		return 0;
	end;
	table.insert(tbOpp, {"Kết thúc đối thoại", BiWu.OnCancel, self});
	
	Dialog:Say(string.format("%s：nguyên lai là lai quan võ luận chiến đích võ lâm đồng đạo", him.szName), tbOpp);

end;

function BiWu:OnLookMap(nMapId)
	if (self.tbMission[nMapId].nState ~= 1) then
		BiWu:ErrorMsg(9);
		return 0;
	end;
	if (me.szName == self.tbMission[nMapId].tbCaptainName[1] or me.szName == self.tbMission[nMapId].tbCaptainName[2]) then
		me.Msg("ngươi dĩ ước định bổn tràng luận võ ，thỉnh trực tiếp nhập cuộc tranh tài 。");
		BiWu:OnJoin(nMapId, 0);	--đội trưởng không thể tiến hành quan chiến 
	else
		local szMsg = string.format("%s：%s dữ %s tương ở [%s]tiến hành %s rất đúng chiến ! ngươi nhất định phải quan chiến sao ?",
		him.szName, self.tbMission[nMapId].tbCaptainName[1], 
		self.tbMission[nMapId].tbCaptainName[2], self.tbMission[nMapId].szMapName,
		self.tbMission[nMapId].szType);
		Dialog:Say(szMsg, {
		{"Ta muốn vào quan chiến","BiWu:DoLook", nMapId},
		{"Ta không muốn xem", self.OnCancel, self},
		});
	end;
	
end;

function BiWu:DoLook(nMapId)
	if (self.tbMission[nMapId].nState ~= 1) then
		BiWu:ErrorMsg(9);
		return 0;
	end;
	self:OnJoin(nMapId, 3);	--gia nhập vào người xem 
end

--to join in a fight group	group --tổ 
function BiWu:OnJoin(nMapId, nGroup)
	local idx = SubWorldID2Idx(nMapId);
	if (idx <0) then
		return
	end;
	--nếu như chỉ là thu được lôi đài tỷ võ giản đơn trạng thái cũng không cần ở WorldIndextrung cắt tới cắt tới liễu,toàn bộ tồn tại tabaltrung liễu 
	-- trước mặt nếu như là và Missiontrung vai sổ có lẽ đối Missiontrung vai tố tương quan Missionthao tác vẫn là nên 
	local OldSubWorld = SubWorld;
	SubWorld = idx;
	if (self.tbMission[nMapId].nState ~= 1) then
		self:ErrorMsg(9);
		SubWorld = OldSubWorld;
		return 0;
	end;
	local szMyName = me.szName;
	if (szMyName == self.tbMission[nMapId].tbCaptainName[1]) then
		self:JoinCamp(nMapId, 1);
	elseif (szMyName == self.tbMission[nMapId].tbCaptainName[2]) then
		self:JoinCamp(nMapId, 2);
	elseif (nGroup == 1 or nGroup == 2) then
		local nMstGroup = self.tbMission[nMapId]:GetPlayerGroupId(KPlayer.GetPlayerObjById(self.tbMission[nMapId].tbCaptainId[nGroup]));
		local nMasterNum = 0;
		if (nMstGroup> 0) then
				nMasterNum = 1;
		end
		if (self.tbMission[nMapId]:GetPlayerCount(nGroup) - nMasterNum <self.tbMission[nMapId].nType - 1) then
			self:JoinCamp(nMapId, nGroup);
		else
			self:ErrorMsg(10);
		end;
	elseif (nGroup == 3) then
		self:JoinCamp(nMapId, 3);
	else
		self:ErrorMsg(4);
	end;
	
	SubWorld=OldSubWorld;
end;

--Nhắc nhở ：
function BiWu:ErrorMsg(nErrorId)
	local tb_szErrorMsg	= 
			{
				[1]		="xin tranh tài hai phe cần tổ tiên đội sau đó sẽ xin ！",
				[2]		="xin tranh tài song phương trên người mang ngân lượng thiếu 。",
				[3]		="báo danh xảy ra vấn đề ，thỉnh dữ phía chính phủ liên hệ ！",
				[4]		="ngươi điều không phải tham gia tranh tài nhân viên ，vô pháp nhập cuộc tranh tài ，chỉ có thể vào tràng quan khán ！",
				[5]		="Báo danh phải là Đội Trưởng！",
				[6]		="trên người ngươi mang ngân lượng thiếu ！",
				[7]		="Xin lỗi ，ngươi còn không có báo danh quan khán ！",
				[8]		="Xin lỗi ，nơi so tài đã bị người khác giành trước rồi",
				[9]		="Xin lỗi , Trận đấu tranh tài đã bắt đầu",
				[10]	="ngươi yếu tham gia bỉ tái phương đã toàn bộ đến đông đủ ，ngươi còn là lần sau trở lại ba ！",
				[11]	="Hãy tổ đội <color=yellow> song phương <color>Hình như ngươi chưa có <color=yellow>hai người <color>tổ đội đến đây",
				[12]	="ngươi điều không phải đã ước định tỷ võ sao ？luận võ chi kỳ tiến gần ，ngươi hay là đi chăm chỉ luyện tập mới là ！",
				[13]	="của ngươi Đồng đội đã ước định tỷ võ ！thỉnh tổ người chơi khác lai ước định luận võ ba 。",
				[14]	="của ngươi Đồng đội ly ngươi quá xa 。mời các ngươi cùng nhau đáo ta chỗ này lai ，mới có thể ước định luận võ 。",
				[15]	= string.format("đẳng cấp đạt được %d cấp hậu phương có thể vào lôi đài luận võ 。của ngươi trong đội ngũ còn có người không được %d cấp ba ！",BiWu.LimitLevel, BiWu.LimitLevel),
				[16]	= string.format("đẳng cấp đạt được %d cấp hậu phương có thể vào lôi đài luận võ 。ngươi hiện nay vẫn chưa tới %d cấp ba ！", BiWu.LimitLevel, BiWu.LimitLevel),
				[17]	="Hãy gia nhập môn phái",
				[18]	="Hãy gia nhập môn phái",
				};

	local szMsg	="";
	if (tb_szErrorMsg[nErrorId]) then
		szMsg = string.format("%s：%s", him.szName, tb_szErrorMsg[nErrorId]);
	else
		szMsg = string.format("%s：%s", him.szName,"nhĩ hảo ！");
	end;
	Dialog:Say(szMsg, {{"Kết thúc đối thoại",self.OnCancel}});
	return
end;


--có thể không báo danh xin lôi đài đánh một trận 
function BiWu:IsSigningUp(nMapId)
	local tbTeamMembers, nMemberCount = me.GetTeamMemberList()
	local _, nCurMemCount = KTeam.GetTeamMemberList(me.nTeamId);
	local nSignMap = me.GetMapId()
	
	if (nCurMemCount == 2 and nMemberCount ~= 2) then	--yếu họp thành đội hai người tịnh đứng cùng nhau 
		self:ErrorMsg(14);
		return 0;
	end;
	
	if (nMemberCount ~= 2) then	--yếu họp thành đội hai người 
		self:ErrorMsg(11);
		return 0;
	end;

	if (me.IsCaptain() ~= 1) then 		--báo lại danh đích phải là đội trưởng 
		self:ErrorMsg(5);
		return 0;
	end;
	
	local tbBwMapInfo = self:GetBiWuMapInfo(nSignMap);
	if (nMapId) then					--nếu như lựa chọn địa đồ ，khán tấm bản đồ này có hay không bị đặt trước 
		if (tbBwMapInfo[nMapId].nState == 0 or not tbBwMapInfo[nMapId].nState) then
			return 1;
		else
			self:ErrorMsg(8);
			return 0;
		end;
	end;
	
	if (self:CheckShowKey() ~= 0) then		--kiểm tra khán có hay không ước định quá lôi đài tỷ võ liễu ，nếu như khả dĩ ShowKey
		self:ErrorMsg(12);
		return 0;
	end;
	
	local pOldMe = me;
	local OldPlayerIndex = PlayerIndex;
	for i = 1, nMemberCount do 
		if (tbTeamMembers[i] ~= pOldMe) then
			me = tbTeamMembers[i];
			PlayerIndex = me.nPlayerIndex;
			
			if (me.GetMapId() ~= nSignMap) then		-- kiểm tra khán Đồng đội có đúng hay không ở cùng một chỗ đồ thượng 
				me = pOldMe;
				PlayerIndex = OldPlayerIndex;
				self:ErrorMsg(14);
				return 0;
			end;
			
			if (self:CheckShowKey() ~= 0) then		--kiểm tra khán có hay không ước định quá lôi đài tỷ võ liễu ，nếu như khả dĩ ShowKey
				self:ErrorMsg(12);
				me = pOldMe;
				PlayerIndex = OldPlayerIndex;
				self:ErrorMsg(13);
				return 0;
			end;
			
			if (me.nLevel <self.LimitLevel) then
				me = pOldMe;
				PlayerIndex = OldPlayerIndex;
				self:ErrorMsg(15);
				return 0;
			end;
			
			if (me.nFaction == Player.FACTION_NONE) then
				me = pOldMe;
				PlayerIndex = OldPlayerIndex;
				self:ErrorMsg(17);
				return 0;
			end;
		end;
	end;
	
	me = pOldMe;
	PlayerIndex = OldPlayerIndex;
	
	local nFree = 0;					--còn không có tuyển trạch địa đồ ，cũng chỉ phán đoán có rảnh rỗi hay không đích 
	
	for nMapId, tbInfo in pairs(tbBwMapInfo) do
		if (tbInfo.nState == 0 or not tbInfo.nState) then
			return nMapId;
		end;
	end;
	
	self:ErrorMsg(8);
	return 0;
end;

--- //
function BiWu:ShowMyGrade()
	Dialog:Say("Xin chào ngươi muốn xem tổng trận loại hình nào", {
		{"1V1 đối chiến",self.DoShowMyGrade, self, 1},
		{"2V2 đối chiến",self.DoShowMyGrade, self, 2},
		{"3V3 đối chiến",self.DoShowMyGrade, self, 3},
		{"4V4 đối chiến",self.DoShowMyGrade, self, 4},
		{"5V5 đối chiến",self.DoShowMyGrade, self, 5},
		{"6V6 đối chiến",self.DoShowMyGrade, self, 6},
		{"Ta suy nghĩ thêm một chút",self.OnCancel},	});
end;

function BiWu:DoShowMyGrade(nType)
	local nCount = me.GetTask(self.TSKG_BIWU, self.TSK_TB_COUNT[nType]);
	local nTAWinCnt = me.GetTask(self.TSKG_BIWU, self.TSK_TB_TOTALWIN[nType]);
	local nTALosCnt = nCount-nTAWinCnt;
	local nCLWinCnt = me.GetTask(self.TSKG_BIWU, self.TSK_TB_CURLINKWIN[nType]);
	local nMLWinCnt = me.GetTask(self.TSKG_BIWU, self.TSK_TB_MAXLINKWIN[nType]);
	Dialog:Say(string.format("Ngươi %d vs %d đã tham gia tổng ：%d trận",
								nType, nType,nCount
								), 
			{
			{"Ta muốn xem chiến tích thể thức khác",self.ShowMyGrade,self},
			{"Ta suy nghĩ thêm một chút",self.OnCancel},
			});
end;
