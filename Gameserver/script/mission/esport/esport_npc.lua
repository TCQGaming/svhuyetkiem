--竞技赛npc
--孙多良
--2008.12.25

--报名
function Esport:OnDialog_SignUp(nSure)
	
	if self:CheckState() == 0 then
		Dialog:Say("Hoạt động năm mới ném tuyết đã kết thúc. ")
		return 0;
	end
	
	
	if self.nReadyTimerId <= 0 or Timer:GetRestTime(self.nReadyTimerId) <= Esport.DEF_READY_TIME_ENTER  then
		Dialog:Say("Thời gian báo danh từ <color=yellow> 10:00 - 01:00 <color>đêm, mỗi nửa giờ báo danh một lần tại các điểm đăng kí Án Nhược Tuyết ở Tân Thủ Thôn . Thời gian đăng ký 4 phút 30s.  <color=red><color>");
		return 0;
	end
	
	if me.nTeamId <= 0 then
		if nSure == 1 then
			self:OnDialogApplySignUp();
			return 0;
		end
		if me.nLevel < self.DEF_PLAYER_LEVEL or me.nFaction <= 0 then
			Dialog:Say("Cấp 50 mới có thể tham gia");
			return 0;
		end
		if self:IsSignUpByAward(me) == 1 then
			Dialog:Say("Chưa nhận thưởng, không được phép đi, hãy nhận và tôi sẽ đưa bạn");
			return 0;
		end		
		if self:IsSignUpByTask(me) == 0 then
			Dialog:Say("Bạn đã mệt mỏi rồi, nghỉ ngơi  và trở lại vào ngày mai.");
			return 0;
		end
		local tbOpt = {
			{"Tôi muốn đi", self.OnDialog_SignUp, self, 1},
			{"Ta chỉ xem qua"},
			};
		Dialog:Say("Bạn có muốn tham gia hoạt động ném tuyết không?", tbOpt);
		return 0;
	end
	

	if me.IsCaptain() == 0 then
		Dialog:Say("Bạn không phải là đội trưởng, gọi đội trưởng của bạn đến để đăng kí");
		return 0;
	end
	local tbPlayerList = KTeam.GetTeamMemberList(me.nTeamId);
	
	if nSure == 1 then
		self:OnDialogApplySignUp(tbPlayerList);
		return 0;
	end
	
	local tbOpt = {
		{"Chúng tôi muốn đi", self.OnDialog_SignUp, self, 1},
		{"Ta chỉ xem qua"},
		};
	Dialog:Say(string.format("Bạn muốn vào khu báo danh tham gia trận chiến ném tuyết? Chiến đội của bạn có:<color=yellow> % sngười <color>, hãy chắc chắn rằng đồng đội đang ở gần đây.", #tbPlayerList), tbOpt);
	return 0;
end

function Esport:OnDialogApplySignUp(tbPlayerList)
	if not tbPlayerList then
		GCExcute{"Esport:ApplySignUp",{me.nId}};
		return 0;
	end
	local nMapId, nPosX, nPosY	= me.GetWorldPos();	
	for _, nPlayerId in pairs(tbPlayerList) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if not pPlayer then
			Dialog:Say("Một số người không đứng gần đây, chúng ta không thể đi.");
			return 0;
		end
		if pPlayer.nLevel < self.DEF_PLAYER_LEVEL or pPlayer.nFaction <= 0 then
			
		end
		if pPlayer.nLevel < self.DEF_PLAYER_LEVEL or pPlayer.nFaction <= 0 then
			Dialog:Say(string.format("<color=yellow>%s <color> chưa đủ điều kiện để đi, nếu gặp những con quái vật nguy hiểm thì nó giết đẹp", pPlayer.szName));
			return 0;
		end
		if self:IsSignUpByAward(pPlayer) == 1 then
			Dialog:Say(string.format("<color=yellow>%s<color> chưa nhận thưởng, không được phép đi", pPlayer.szName));
			return 0;
		end				
		
		if self:IsSignUpByTask(pPlayer) == 0 then
			Dialog:Say(string.format("Ngày hôm nay đã tham gia: <color=yellow>%s <color>lần , hãy trở lại vào ngày mai.", pPlayer.szName));
			return 0;
		end
		local nMapId2, nPosX2, nPosY2	= pPlayer.GetWorldPos();
		local nDisSquare = (nPosX - nPosX2)^2 + (nPosY - nPosY2)^2;
		if nMapId2 ~= nMapId or nDisSquare > 400 then
			Dialog:Say("Chắc chắn tất cả các đồng đội của bạn phải đang ở đây.");
			return 0;
		end
		if not pPlayer or pPlayer.nMapId ~= nMapId then
			Dialog:Say("Chắc chắn tất cả các đồng đội của bạn phải đang ở đây.");
			return 0;
		end
	end
	GCExcute{"Esport:ApplySignUp", tbPlayerList};
	return 0;
end

function Esport:IsSignUpByTask(pPlayer)
	Esport:TaskDayEvent();
	local nCount = pPlayer.GetTask(self.TSK_GROUP, self.TSK_ATTEND_COUNT);
	local nExCount = pPlayer.GetTask(self.TSK_GROUP, self.TSK_ATTEND_EXCOUNT)
	if nCount <= 0 and nExCount <= 0 then
		return 0, 0 ,0;
	end
	return nCount + nExCount, nCount, nExCount;
end

function Esport:IsSignUpByAward(pPlayer)
	return pPlayer.GetTask(self.TSK_GROUP, self.TSK_ATTEND_AWARD);
end

function Esport:GetItemJinZhouBaoZu()
	local szMsg = "Chúc mừng năm mới. Bạn tìm tôi để làm gì?";
	local tbNpc =  Npc:GetClass("esport_yanruoxue");
	local tbOpt = {
		{"Nhận pháo hoa Cẩm Châu ", self.GetItemJinZhouBaoZuItem, self},
		{"Làm sao để tiêu diệt con thú", tbNpc.OnAboutNianShou, tbNpc},
		{"Tìm hiểu sự kiện năm mới", tbNpc.OnAboutNewYears, tbNpc},
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function Esport:GetItemJinZhouBaoZuItem()
	if me.CountFreeBagCell() < 1 then
		Dialog:Say("Hành trang không đủ 1 ô trống");
		return 0;
	end
	if me.nLevel < 50 then
		Dialog:Say("Cấp 50 mới có thể tham gia");
		return 0;
	end
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	local nTaskDate = me.GetTask(self.TSK_GROUP, self.TSK_NEWYEAR_JINZHOUBAOZHU);
	
	if nCurDate <= nTaskDate then
		Dialog:Say("Tôi đã đặt pháo, không  biết làm thế nào. Bạn hãy nhớ rằng, với những nỗ lực của mình để chiến đấu.");
		return 0;
	end
	
	local pItem = me.AddItem(unpack(self.SNOWFIGHT_ITEM_JINZHOUBAOZHU));
	if pItem then
		pItem.Bind(1);
		me.SetTask(self.TSK_GROUP, self.TSK_NEWYEAR_JINZHOUBAOZHU, nCurDate);
		self:WriteLog("得到物品"..pItem.szName, me.nId);
	end
	Dialog:Say("Hãy nhận Pháo, nó thật tuyệt vời, nếu bạn gặp con thú hãy thắp sáng nó có thể phá vỡ sự thù địch để dễ dàng đánh bại .");
end
