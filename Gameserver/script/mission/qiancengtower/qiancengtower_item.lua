-- 文件名　：qiancengtower_item.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-06-12 16:06:31

if not MODULE_GAMESERVER then
	return 0;
end

Require("\\script\\mission\\qiancengtower\\qiancengtower_def.lua");

local tbXingyi = Item:GetClass("qiancengtower_item_xingyiquan");

tbXingyi.tbItem = {18,1,2112,1};
tbXingyi.nMaxCount = 6;

function tbXingyi:OnUse()	
	local nCount = QianCengTower:GetPlayerFanPaiCount(me);
	
	if (nCount >= self.nMaxCount) then
		me.Msg(string.format("Bạn đã tích lũy được hai cơ hội xổ số, vui lòng sử dụng hết cơ hội xổ số trước khi sử dụng vật phẩm này!"));
		return 0;
	end
	
	QianCengTower:SetPlayerFanPaiCount(me, nCount + 1);
	
me.Msg(string.format("Bạn đã sử dụng %s/3 [Trang rời Boxing Xingyi], và bạn có thể đổi cơ hội rút thăm may mắn với tổng số 3. (Hiệu lực trong vòng rút thăm may mắn thứ hai) ", nCount + 1));
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "cost", me.nId, string.format("18_1_2112_1,1,1"));
	return 1;
end

function tbXingyi:InitGenInfo()
	it.SetTimeOut(1, 24 * 3600 * 7);	--时长20分钟
	return {};
end

local tbYueWu = Item:GetClass("qiancengtower_item_yuewu");

tbYueWu.tbItem = {18,1,2113,1};
tbYueWu.nMaxCount = 6;

function tbYueWu:OnUse()
	local nCount = QianCengTower:GetPlayerReviveNum(me);
	
	if (nCount >= self.nMaxCount) then
		me.Msg(string.format("Giới hạn số lần cộng dồn hồi sinh là 2, ngươi đã đạt giới hạn!"));
		return 0;
	end
	
	QianCengTower:SetPlayerReviveNum(me, nCount + 1);
	me.Msg(string.format("Ngươi sử dụng %s/3 Nhạc Vũ Mục Tàn Trang, có thể có cơ hội lấy được lần hồi sinh miễn phí!", nCount + 1));

	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (tbMission) then
		tbMission:UpdatePlayerReviveInfo(me);
	end
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "cost", me.nId, string.format("18_1_2113_1,1,2"));
	
	return 1;
end

function tbYueWu:InitGenInfo()
	it.SetTimeOut(1, 24 * 3600 * 7);	--时长20分钟
	return {};
end


local tbYueJia = Item:GetClass("qiancengtower_item_yuejia");

tbYueJia.tbItem = {18,1,2114,1};
tbYueJia.nConsumeNum = 3;
tbYueJia.nSkillId = 1080;
tbYueJia.nLevel	= 3;
tbYueJia.nTime_SkillState = 18 * 60 * 60;

function tbYueJia:OnUse()
	local tbMission = me.GetTempTable("QianCengTower").tbMission;
	if (not tbMission) then
		me.Msg("Chỉ có thể sử dụng trong Thiên Tầng Tháp!");
		return 0;
	end
	
	local nCount = QianCengTower:GetPlayerYueJiaBuffCount(me);
	
	if (nCount + 1 < 3) then
		QianCengTower:SetPlayerYueJiaBuffCount(me, nCount + 1);
		--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "cost", me.nId, string.format("18_1_2114_1,1,3"));
		return 1;
	end

	local tbTeamMemberList = KTeam.GetTeamMemberList(me.nTeamId);
	if (not tbTeamMemberList) then
		return 0;
	end

	for _, nPlayerId in ipairs(tbTeamMemberList) do
		local pTeamPlayer = KPlayer.GetPlayerObjById(nPlayerId);
		if (pTeamPlayer) then
			local szMapType = GetMapType(pTeamPlayer.nTemplateMapId);
			if (szMapType == "qiancengta") then
				pTeamPlayer.AddSkillState(self.nSkillId, self.nLevel, 1, self.nTime_SkillState);
				pTeamPlayer.Msg("Ngươi đã được tăng sức mạnh đáng kể, chỉ có hiệu lực trong Thiên Tầng Tháp!)");				
			end
		end
	end
	QianCengTower:SetPlayerYueJiaBuffCount(me, 0);
	me.Msg("Ngươi đã sử dụng 3 Nhạc Gia Thương Đoạn Thiên thành viên đội ngươi được tăng sức mạnh đáng kể!)");
	--StatLog:WriteStatLog("stat_info", "melaleuca_tower", "cost", me.nId, string.format("18_1_2114_1,1,3"));	
	
	return 1;
end

function tbYueJia:InitGenInfo()
	it.SetTimeOut(1, 24 * 3600 * 7);	--时长20分钟
	return {};
end

-----------------------
-- 趣味层开启关卡道具
-----------------------
local tbKeyItem = Item:GetClass("qiancengtower_item_key");

function tbKeyItem:InitGenInfo()
	it.SetTimeOut(1,3 * 60);	--时长20分钟
	return {};
end

-----------------------
-- 评价奖励
-----------------------
local tbPingJiaItem = Item:GetClass("qiancengtower_item_pingjia");

tbPingJiaItem.tbLevel2Rate = {1.3, 1.1, 0.9, 0.7};

tbPingJiaItem.tbValue = {
	[1] = 42409,
	[11] = 45858,
	[21] = 49105,
	[31] = 51946,
	[41] = 54178,
	[51] = 56207,
	[61] = 58033,
	[71] = 59453,
	[81] = 60468,
};

function tbPingJiaItem:OnUse()
	local nStartRoom = it.GetGenInfo(1);
	if (nStartRoom > 81) then
		nStartRoom = 81;
	end
	local nLevel = self.tbLevel2Rate[it.nLevel];
	local nValue = self.tbValue[nStartRoom];

	return Item:GetClass("randomitem2"):SureOnUse(3, 4, 2, math.floor(nValue * nLevel), 8, 2, 0, it.szName);	
end

-- 付费复活道具
local tbCoinRevive = Item:GetClass("qiancengtower_item_coin_revive");

function tbCoinRevive:OnUse()
	return 1;
end
