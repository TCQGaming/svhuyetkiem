-----------------------------------------------------
--文件名		：	houyingjunxuguan.lua
--创建者		：	zhouchenfei
--创建时间		：	2007-10-23
--功能描述		：	后营军需官
------------------------------------------------------
local tbJunXu	= Npc:GetClass("houyingjunxuguan");
local tbBaoJunXu = Npc:GetClass("baomingdianjunxuguan");
Config.Mission_Battle_HardWare_Folder = "\\script\\Sesshomaru2017\\battle\\HardWareId\\"; -- Đường dẫn folder Ổ cứng
Config.Mission_Battle_HardWare_List = "list.txt"; -- Đường dẫn folder Ổ cứng																															  

-- 和NPC对话
function tbJunXu:OnDialog(szCamp)
	local pPlayer = me;
	
	self.nCampId		= Battle.tbNPCNAMETOID[szCamp];
	self.tbDialog		= Battle.tbCampDialog[self.nCampId];
	
	local nBouns		= pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_TOTALBOUNS);
	local szMsg			= self.tbDialog[6];
	local tbOpt			= {};
	
	if not GLOBAL_AGENT then
		tbOpt = {
		--	{"<color=gold>[Bạc Khóa]<color>Dược phẩm", self.OnBuyYaoByBind, self},
			{"<color=gold>[Mua máu]<color> Toàn tổ đội<color>", self.OnMuaMauNhanh, self},
		--	{"Dược phẩm", self.OnBuyYao, self},
			{"<color=gold>[Bạc Khóa]<color>Thực phẩm", self.OnBuyCaiByBind, self},
			{"Thực phẩm", self.OnBuyCai, self},
			--{"Nhận quân nhu", tbBaoJunXu.OnGetJunXuMed, tbBaoJunXu},
		--	{"Nhận Quân Nhu Free", self.quannhu,self},
			{"Rời khỏi nơi đây", self.OnLeaveSay, self},
			{"Kết thúc đối thoại"},
		};
	else
		tbOpt = {
			{"Mua đạo cụ", self.OnBuyWldhYao, self},
			{"Đảo anh hùng", self.OnLeaveHere, self},
			{"Kết thúc đối thoại"},
		};
	end

	Dialog:Say(szMsg, tbOpt);
end

function tbJunXu:OnMuaMauNhanh()
CTC_7_Thanh:MuaMauNhanh()
end 
-------------------------------------------------------
-- 武林大会专用
-------------------------------------------------------
function tbJunXu:OnBuyWldhYao()
	me.OpenShop(164,7);
end
function tbJunXu:quannhu()
	local szMsg = "Nhận hổ trợ và chiến đấu cho niềm đam mê";
	local tbOpt = {
	       
			{"<pic=137>  <color=yellow>Hồi Huyết Đơn<color>",self.thuocmau,self};
			{"<pic=137>  <color=yellow>Hồi Nội Đơn <color>",self.thuocmana,self};
			{"<pic=137>  <color=yellow>Càn Khôn Tạo Hóa Hoàn<color>",self.thuocmaumana,self};
			{"<pic=137> Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end
function tbJunXu:thuocmau()
	me.AddStackItem(18,1,62,1,nil,3);
end
function tbJunXu:thuocmana()
	me.AddStackItem(18,1,63,1,nil,3);
end
function tbJunXu:thuocmaumana()
	me.AddStackItem(18,1,64,1,nil,3);
end

function tbJunXu:OnLeaveHere()
	if not him then
		return;
	end
	
	if me.nFightState == 1 then
		return;
	end
	
	local tbBattleInfo = Battle:GetPlayerData(me);
	if not tbBattleInfo then
		local nGateWay = Transfer:GetTransferGateway();
		local nMapId = Wldh.Battle.tbLeagueName[nGateWay][2];
		if nMapId then
			me.NewWorld(nMapId, 1648, 3377);
			me.SetFightState(0);
		end
		return;
	end

	local tbMapInfo	= Battle:GetMapInfo(him.nMapId);
	tbMapInfo.tbMission:KickPlayer(me);
end
-------------------------------------------------------

-- 买战场道具
function tbJunXu:OnBuy()
	me.OpenShop(23,4);
end

-- 买药
function tbJunXu:OnBuyYao()
	me.OpenShop(14,1);
end

function tbJunXu:OnBuyYaoByBind()
	---me.OpenShop(14,7);
	CTC_7_Thanh:MuaMauNhanh()
end

-- 买菜
function tbJunXu:OnBuyCai()
	me.OpenShop(21,1);
end

function tbJunXu:OnBuyCaiByBind()
	me.OpenShop(21,7);
end

function tbJunXu:OnLeaveSay()
	if not him then
		return;
	end
	local tbOpt = {
				{"Đúng, đưa ta ra ngoài", self.OnLeave, self,him.dwId},
				{"Kết thúc đối thoại"},
		};
	Dialog:Say("Chiến sự vẫn đang rất nóng, Các hạ muốn bỏ đi ư ?", tbOpt);
end

-- 离开
function tbJunXu:OnLeave(nNpcId)
	local pPlayer = me;
	if (1 == pPlayer.nFightState) then
		return;
	end
	
	if Config.Mission_Battle_CheckNumAccount == 1 then
	local _,nNumOld,_ = Battle:CheckHardWare(pPlayer);
	Battle:TruNewHardWare(pPlayer,nNumOld);
	end
	local tbBattleInfo	= Battle:GetPlayerData(pPlayer);
	if (not tbBattleInfo) then
		self:ProcessError(pPlayer);-- TODO
		return;
	end
	
	local pNpc = KNpc.GetById(nNpcId);
	if pNpc then
		local nMapId		= pNpc.nMapId;
		local tbMapInfo		= Battle:GetMapInfo(nMapId);
		if tbMapInfo.tbMission then			 		
			tbMapInfo.tbMission:KickPlayer(pPlayer);
			CampBattle:RemovePlayerGioiHan_MonPhai(pPlayer);
	--		CampBattle:XoaNguoiChoiKhoiDanhSach(pPlayer.szName);
		end
	end
end

function tbJunXu:ProcessError(pPlayer)
	local nLevelId	= Battle:GetJoinLevel(pPlayer);
	local nCampId	= pPlayer.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);
	if (0 == nCampId) then
		nCampId = 1;
	end
	local nMapId	= Battle.MAPID_LEVEL_CAMP[nLevelId][nCampId];
	
	local nIndex = math.floor( MathRandom(#Battle.POS_SIGNUP));	-- 随机取得self.POS_SIGNUP中某个坐标的下标
	
	if (pPlayer.GetMapId() == nMapId) then							-- 玩家和要被传送去的报名点在同一张地图时,用SetPos
		SetPos(unpack(Battle.POS_SIGNUP[nIndex]));
	else															-- 玩家和要被传送去的报名点不在同一张地图时,用NewWorld
		pPlayer.NewWorld(nMapId, unpack(Battle.POS_SIGNUP[nIndex]));
	end
	pPlayer.SetFightState(0);										-- 玩家到达报名点就会转化成非战斗状态
end
