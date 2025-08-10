-- 白虎堂报名NPC
local tbNpc = Npc:GetClass("baihutangbaoming");
tbNpc.tbRVPos	= {};
tbNpc.MAX_NUMBER = 100;
tbNpc.HIGHLEVEL  = 90;
tbNpc.tbTimeKey = {};


tbNpc.HONOR_CLASS_MONEY		= 8;	
tbNpc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbNpc.HONOR_CLASS_MONEY,
	},
};

function tbNpc:Init()
	self.tbTimeKey[7]  = 8;		self.tbTimeKey[18] = 21;
	self.tbTimeKey[19] = 21;	self.tbTimeKey[20] = 21;
end

function tbNpc:OnDialog(szParam)

	local tbOpt = {};	
	local szMsg = "";
	local nTime = self:GetTime();
	
	if (self:CheckClose() == 1) then
		return;
	end
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	if (nCurTime >= 1030 and nCurTime < 1131) or (nCurTime >= 1630 and nCurTime < 1731) or (nCurTime >= 2030 and nCurTime < 2131) then
		Dialog:Say("Tống Kim Đang Diễn Ra!")
		return 0;
	end
		----------Gioi Han Tai Phu-------------
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu_BHD then
    	Dialog:Say("Bạn không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu_BHD.." <color>điểm Tài Phú để tham gia Bạch Hổ Đường \nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color> <color>");
		return 0;
	end
	end
---------------------------------------
	if (BaiHuTang.nActionState == BaiHuTang.FIGHTSTATE) then
		local nMinute = 30 - tonumber(GetLocalDate("%M"));
		if (nMinute < 0) then
			--local nTime = self:GetTime();
			szMsg = string.format("Hoạt động Bạch Hổ Đường chưa mở, thời gian bắt đầu báo danh trận sau là %d: 30, hãy quay lại sau.", nTime);
		else
			szMsg = string.format("Bây giờ một đoàn dũng sĩ đã tiến vào Bạch Hổ Đường, cổng đường đã đóng, %d phút sau hãy quay lại", nMinute);
		end
		tbOpt[1] = {"Kết thúc đối thoại"};
	elseif (BaiHuTang.nActionState == BaiHuTang.RESTSTATE) then
		szMsg = string.format("Hoạt động Bạch Hổ Đường chưa mở, thời gian bắt đầu báo danh trận sau là %d: 30, hãy quay lại sau.", nTime);
		tbOpt[1] = {"Kết thúc đối thoại"};
	else
		
		local tbMap = self:GetMapList();
		if (not tbMap)then
			return;
		end
		
		local tbMapInfo = {};
		if (szParam == "dong") then
			tbMapInfo.nMapId = tbMap[1][1];
			tbMapInfo.szName =  "Đông Bạch Hổ Đường";
		elseif (szParam == "nan") then
			tbMapInfo.nMapId = tbMap[1][2];
			tbMapInfo.szName =  "Nam Bạch Hổ Đường";
		elseif (szParam == "xi") then
			tbMapInfo.nMapId = tbMap[1][3];
			tbMapInfo.szName =  "Tây Bạch Hổ Đường";
		elseif (szParam == "bei") then	
			tbMapInfo.nMapId = tbMap[1][4];
			tbMapInfo.szName =  "Bắc Bạch Hổ Đường";
		end
		local nRet = MathRandom(#BaiHuTang.tbPKPos);
		tbMapInfo.tbSect = BaiHuTang.tbPKPos[nRet];
		tbOpt[1]	= {"Đúng vậy, ta muốn tham gia!", self.JoinAction, self, tbMapInfo};
		tbOpt[2]	= {"[Quy tắc hoạt động]", self.Rule, self, szParam};
		tbOpt[3]	= {"Nguy hiểm lắm, ta không tham gia đâu."};
		szMsg = "Mỗi ngày có thể tham gia Bạch Hổ Đường <color=yellow>1<color> lần, ngươi có muốn tham gia không ?";
	end
	Dialog:Say(szMsg, tbOpt);
end


-- 99级开放的时候，初级01:30之后就关闭
function tbNpc:CheckClose()
	
	if (TimeFrame:GetStateGS("OpenLevel99") == 0) then
		return 0;
	end
	
	local nNowHour = tonumber(GetLocalDate("%H"));
	if (nNowHour >= 1 and nNowHour <= 7) then
		if (me.nLevel < self.HIGHLEVEL) then
			Dialog:Say("Bây giờ trễ rồi, ngươi đi nghỉ sớm đi!", 
				{
					{"Kết thúc đối thoại"}
				});
			return 1;
		end
	end
	return 0;
end

--规则显示
function tbNpc:Rule(szParam)
	local tbOpt = {};
	tbOpt[1] = {"Trở về đối thoại trước đó", self.OnDialog, self, szParam};
	tbOpt[2] =  {"Kết thúc đối thoại"};
	local szMsg = "Thời gian báo danh <color=green>30<color> phút, thời gian hoạt động <color=green>30<color> phút. Sau khi hoạt động bắt đầu, trong Bạch Hổ Đường sẽ xuất hiện rất nhiều <color=red>Sấm Đường Tặc<color>, đánh bại chúng sẽ nhặt được vật phẩm và kinh nghiệm, sau một thời gian nhất định sẽ xuất hiện <color=red>Thủ Lĩnh Sấm Đường Tặc<color>" .. 
"Đánh bại <color=red>Thủ Lĩnh Sấm Đường Tặc<color> sẽ xuất hiện lối vào tầng 2, Bạch Hổ Đường có 3 tầng, nếu bạn đánh bại thủ lĩnh ở cả 3 tầng thì sẽ mở được lối ra. Lưu ý: Khi vào Bạch Hổ Đường sẽ tự động bật chế độ chiến đấu, nên tốt nhất hãy tham gia hoạt động này cùng với hảo hữu, gia tộc hoặc bang hội. (Mỗi ngày chỉ được tham gia tối đa <color=red>3 lần<color>).";
	Dialog:Say(szMsg, tbOpt);
end

--获取当前的小时数
function tbNpc:GetTime()
	local nNowHour = tonumber(GetLocalDate("%H"));
	local nNowMinute = tonumber(GetLocalDate("%M"));
	
	local nHour = nNowHour;
	
	if (nNowHour == 7) then
		nHour = 8;
	elseif (nNowHour == 18 or nNowHour == 19 or nNowHour == 20) then
		nHour = 21;
	elseif (nNowHour == 6) then
		if (nNowMinute >= 30) then
			nHour = 8;
		end
	elseif (nNowHour == 17) then
		if (nNowMinute >= 30) then
			nHour = 21;
		end
	else
		if (nNowMinute >= 30) then
			nHour = nHour + 1;
		end
	end
	if (nHour == 24) then
		nHour = 0;
	end
	return nHour;
end
--参加PK
function tbNpc:JoinAction(tbMapInfo)
	if (BaiHuTang.nActionState == BaiHuTang.FIGHTSTATE) then
		me.Msg("Hoạt động Bạch Hổ Đường đã bắt đầu, không thể báo danh được nữa.");
		return;
	end
	
	--死亡就不给进 zounan
	local nDead = me.IsDead() or 1;
	if nDead == 1 then
		return;
	end
	local tbMember = KTeam.GetTeamMemberList(me.nTeamId)


		if not tbMember then
	local nTimes = me.GetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES) or 0;
	local szNowDate =  GetLocalDate("%y%m%d");
	local nDate = math.floor(nTimes / 10);
	local nPKTimes = nTimes % 10;
	local nNowDate = tonumber(szNowDate);
	if (nDate == nNowDate) then
		if (nPKTimes >= 1) then
			local nTime = tonumber(GetLocalDate("%H%M"));
			-- 当天23：30分钟前已经参加过了三次
			if (nTime < 2330) then
				me.Msg(string.format("Hoạt động này một ngày chỉ được tham gia %s lần, mai hãy đến.", 1));
				return;
			else
				me.SetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES, 0);
			end
		end
	else
		me.SetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES, 0);
	end
	local nTotal  = BaiHuTang.tbNumber[tbMapInfo.nMapId];
	if (nTotal and nTotal >= tbNpc.MAX_NUMBER) then
		me.Msg("Đã có quá nhiều người tham gia,bạn phải chờ đợt kế tiếp");
		return;
	end
	self:OnTransKhongToDoi(tbMapInfo);	
else
 
	for i = 1, #tbMember do
    local nPlayerId = tbMember[i]
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID

	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		if not pPlayer then
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không có mặt tại Đại Điện Bạch Hổ Đường"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
		for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
		
		local nTichLuyTong = pPlayer.GetTask(3028,1)
		if nTichLuyTong < 1 then 
            local szMsg = "Ta thấy tổ đội của ngươi<color=yellow> "..playerName.."<color> không đủ mốc tích nạp<color=yellow> 1 vạn<color> không thể dịch chuyển toàn PT xin hãy kích họ khỏi tổ đội hoặc 1 mình ngươi xông pha vào trong rồi tổ đội lại"
            Dialog:Say(szMsg)
			return
			end 
		end
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(pPlayer.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu_BHD then
    local szMsg = "Ta thấy thành viên <color=yellow>"..playerName.."<color> không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu_BHD.." <color>điểm Tài Phú để tham gia Bạch Hổ Đường"
		KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
		return 0;
	end
	end
	end
	local nTimes = pPlayer.GetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES) or 0;
	local szNowDate =  GetLocalDate("%y%m%d");
	local nDate = math.floor(nTimes / 10);
	local nPKTimes = nTimes % 10;
	local nNowDate = tonumber(szNowDate);
	if (nDate == nNowDate) then
		if (nPKTimes >= 1) then
			local nTime = tonumber(GetLocalDate("%H%M"));
			-- 当天23：30分钟前已经参加过了三次
			if (nTime < 2330) then
				local szMsg = string.format("Trong nhóm <color=yellow> "..playerName.."<color> đã tham gia %s lần ", 1);
				KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
				return;
			else
				pPlayer.SetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES, 0);
			end
		end
	else
		pPlayer.SetTask(BaiHuTang.TSKG_PVP_ACT, BaiHuTang.TSK_BaiHuTang_PKTIMES, 0);
	end
	local nTotal  = BaiHuTang.tbNumber[tbMapInfo.nMapId];
	if (nTotal and nTotal >= tbNpc.MAX_NUMBER) then
		pPlayer.Msg("Đã có quá nhiều người tham gia,đội bạn phải chờ đợt kế tiếp");
		return;
	end
	self:OnTrans(tbMapInfo,pPlayer);	
end 
end 
end 
--传送玩家到指定地图
function tbNpc:OnTrans(tbMapInfo,pPlayer)
	local tbSect	= tbMapInfo.tbSect;
	pPlayer.Msg("Ngồi yên tới "..tbMapInfo.szName);
	local nMapId = tbMapInfo.nMapId
	local nTotal = BaiHuTang.tbNumber[nMapId] or 0;
	BaiHuTang.tbNumber[nMapId] = nTotal + 1;
	if(1 == BaiHuTang:JoinGame(pPlayer.nMapId, pPlayer)) then
		pPlayer.NewWorld(nMapId, tbSect.nX / 32, tbSect.nY / 32);
				BaiHuTang:ShowTimeInfo(pPlayer);
				------Task mua lại bạch hổ đường 
			local nSoLanDaMua = pPlayer.GetTask(3148,1)
			pPlayer.SetTask(3148,1,nSoLanDaMua + 1)	
	else
		pPlayer.Msg("Bạch Hổ Đường đang bảo trì");
	end
end
function tbNpc:OnTransKhongToDoi(tbMapInfo)
	local tbSect	= tbMapInfo.tbSect;
	me.Msg("Ngồi yên tới "..tbMapInfo.szName);
	local nMapId = tbMapInfo.nMapId
	local nTotal = BaiHuTang.tbNumber[nMapId] or 0;
	BaiHuTang.tbNumber[nMapId] = nTotal + 1;
	if(1 == BaiHuTang:JoinGame(me.nMapId, me)) then
		me.NewWorld(nMapId, tbSect.nX / 32, tbSect.nY / 32);
				BaiHuTang:ShowTimeInfo(me);
							local nSoLanDaMua = me.GetTask(3148,1)
			me.SetTask(3148,1,nSoLanDaMua + 1)	
	else
		me.Msg("Bạch Hổ Đường đang bảo trì");
	end
end

function tbNpc:GetMapList()
	local tbMap = {};
	if (me.nMapId == 821) then
		tbMap = BaiHuTang.tbBatte[BaiHuTang.Goldlen].MapId;
	elseif (me.nLevel >= 90) then
		tbMap = BaiHuTang.tbBatte[BaiHuTang.GaoJi].MapId;
	elseif (me.nMapId == 225) then
		tbMap = BaiHuTang.tbBatte[BaiHuTang.ChuJi].MapId;
	elseif (me.nMapId == BaiHuTang.ChuJi2) then
		-- 第二场初级的
		if (TimeFrame:GetStateGS("CloseBaiHuTangChu2") == 0 ) then
			tbMap = {{275, 276, 277, 278}};
		else
			tbMap = nil;
		end
	end	
	return tbMap;
end
tbNpc:Init();
