-- 募兵校尉报名脚本程序
-- zhouchenfei  create  2007-09-17

local tbNpc	= Npc:GetClass("mubingxiaowei");
function tbNpc:Init()
	if (self.tbMapNpc) then	-- 支持重载
		return;
	end

	local tbMapNpc	= {};	-- 通过地图Id寻找募兵校尉
	for nLevel, tbMId in pairs(Battle.MAPID_LEVEL_CAMP) do
		for nBattleSeq, tbMapId in pairs(tbMId) do
			for nCampId, nMapId in pairs(tbMapId) do
				tbMapNpc[nMapId]	= Lib:NewClass(Battle.tbNpcBase, nMapId, nLevel, nCampId, nBattleSeq);
			end
		end
	end
	
	self.tbMapNpc			= tbMapNpc;
end

-- 和募兵校尉对话
function tbNpc:OnDialog()
	local tbNpc	= self.tbMapNpc[him.nMapId];
	
	tbNpc:OnDialog();
end

-- 针对一个募兵校尉的基类
local tbNpcBase	= Battle.tbNpcBase or {};	-- 支持重载

tbNpcBase.tbBattleSeq = {"1", "2", "3"};

function tbNpcBase:init(nMapId, nLevel, nCampId, nBattleSeq)
	self.nMapId		= nMapId;
	self.nLevel		= nLevel;
	self.nCampId	= nCampId;
	self.nBattleSeq = nBattleSeq;
	self.tbDialog	= Battle.tbCampDialog[self.nCampId];
end

-- 刷新，使得链接到相应阵营
function tbNpcBase:Refresh()
	
	local tbMission	= Battle:GetMission(self.nLevel, self.nBattleSeq);
	if (tbMission) then
		self.tbMission	= tbMission;
		self.tbCamp		= tbMission.tbCamps[self.nCampId];
	else
		self.tbMission	= nil;
		self.tbCamp		= nil;
	end
end

function tbNpcBase:OnDialog2()
    local nBatNhanThuong = me.GetTask(9152, 6)
    local nTime = GetTime()
    local nCurTime = tonumber(os.date("%H%M", nTime))
    local bReceivedReward = false -- Biến cờ kiểm tra xem người chơi đã nhận thưởng từ trận đấu hiện tại hay chưa
    local szMsg = "Ngươi muốn vào chiến trường bây giờ sao? Lúc chiến đấu, ngươi và người khác hợp thành tổ đội giết địch, một công đôi việc.<enter>- Máy chủ không cho phép post điểm, nếu post điểm bạn sẽ bị cấm tham gia Tống Kim"
    local tbOpt = {}

    if nBatNhanThuong == 1 and not bReceivedReward then
        if nCurTime > 2049 and nCurTime < 2249 then
            table.insert(tbOpt, {"<color=yellow>Lãnh thưởng<color>", self.lanhthuong, self})
            bReceivedReward = true -- Đánh dấu là người chơi đã nhận thưởng từ trận đấu hiện tại
        else
            table.insert(tbOpt, {"<color=yellow>Tham Gia<color>", self.OnDialog1, self})
        end
    else
        table.insert(tbOpt, {"<color=yellow>Tham Gia<color>", self.OnDialog1, self})
    end

    table.insert(tbOpt, {"Hiện tại ta chưa muốn"})
    Dialog:Say(szMsg, tbOpt)
end


function tbNpcBase:lanhthuong()
me.SetTask(9152,6,0)
		self:AwardGood()
end
function tbNpcBase:OnDialog()
	self:Refresh();
	
	if Config.Mission_Battle_CheckNumAccount == 1 then
		-- print(Battle:CheckValidHardware(me));
		 --Battle:CheckValidHardware(me);
			if Battle:CheckValidHardware(me) == 0 then
			Battle:WriteZeroHardWare(me);
			end
	end
	 local nCheckCamp = me.GetWorldPos(); 
    local nHardWareId_p = me.dwHardWareId;
	local szIPPath = "\\script\\iDoctor\\CampBattle\\Tong.txt";  
    local tbNameBangHoi = Lib:LoadTabFile(szIPPath);
    for nRow, tbRowData in pairs(tbNameBangHoi) do
        if ((tonumber(tbRowData.Name) == nHardWareId_p) and (nCheckCamp == 184 or nCheckCamp == 185)) then
        Dialog:Say("Mỗi địa chỉ IP mạng chỉ được vào 1 phe Tống Kim\nMáy tính của bạn đã gia nhập phe <color=blue>Tống<color>.");
        return 0;		
        end
    end
	
	local szIpKim = "\\script\\iDoctor\\CampBattle\\Kim.txt";  
    local tbKim = Lib:LoadTabFile(szIpKim);
    for nRoww, tbRowDataa in pairs(tbKim) do
        if ((tonumber(tbRowDataa.Name) == nHardWareId_p) and (nCheckCamp == 181 or nCheckCamp == 182)) then
        Dialog:Say("Mỗi địa chỉ IP mạng chỉ được vào 1 phe Tống Kim\nMáy tính của bạn đã gia nhập phe <color=purple>Kim<color>.");
        return 0;		
        end
    end
	if (me.IsFreshPlayer() == 1) then
		Dialog:Say("Bạn chưa gia nhập môn phái, gia nhập rồi hãy quay lại!");
		return;
	end
	    if (me.nRouteId == 0 or me.nFaction == 0 or me.nSeries == 0) then
        Dialog:Say("Bạn chưa chọn hệ phái võ công");
        return 0;
    end


--------Giới hạn hệ nhân vật / PC--------
local nHardWareId = me.dwHardWareId;

local tbHwidPaths = {
    ["TLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt",
    ["TLB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt",
    ["TVT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt",
    ["TVC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt",
    ["DMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt",
    ["DMT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt",
    ["NDD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt",
    ["NDC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt",
    ["NMC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt",
    ["NMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt",
    ["TYC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt",
    ["TYK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt",
    ["CBB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt",
    ["CBR"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt",
    ["TNK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt",
    ["TND"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt",
    ["VDK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt",
    ["VDQ"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDQ.txt",
    ["CLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt",
    ["CLK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt",
    ["MGC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt",
    ["MGK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt",
    ["DTC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt",
    ["DTK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt"
}

local tbFactionLimits = {
    {nMonPhai = 1,  nHeMonPhai = 1,  key = "TLD", name = "Thiếu Lâm Đao"},
    {nMonPhai = 2,  nHeMonPhai = 1,  key = "TLB", name = "Thiếu Lâm Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 2,  key = "TVT", name = "Thiên Vương Thương"},
    {nMonPhai = 2,  nHeMonPhai = 2,  key = "TVC", name = "Thiên Vương Chùy"},
    {nMonPhai = 1,  nHeMonPhai = 3,  key = "DMB", name = "Đường Môn Bẫy"},
    {nMonPhai = 2,  nHeMonPhai = 3,  key = "DMT", name = "Đường Môn Tiễn"},
    {nMonPhai = 1,  nHeMonPhai = 4,  key = "NDD", name = "Ngũ Độc Đao"},
    {nMonPhai = 2,  nHeMonPhai = 4,  key = "NDC", name = "Ngũ Độc Chưởng"},
    {nMonPhai = 1,  nHeMonPhai = 5,  key = "NMC", name = "Nga My Chưởng"},
    {nMonPhai = 2,  nHeMonPhai = 5,  key = "NMB", name = "Nga My Buff"},
    {nMonPhai = 1,  nHeMonPhai = 6,  key = "TYK", name = "Thúy Yên Kiếm"},
    {nMonPhai = 2,  nHeMonPhai = 6,  key = "TYC", name = "Thúy Yên Đao"},
    {nMonPhai = 1,  nHeMonPhai = 7,  key = "CBR", name = "Cái Bang Rồng"},
    {nMonPhai = 2,  nHeMonPhai = 7,  key = "CBB", name = "Cái Bang Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 8,  key = "TNK", name = "Thiên Nhẫn Kích"},
    {nMonPhai = 2,  nHeMonPhai = 8,  key = "TND", name = "Thiên Nhẫn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 9,  key = "VDK", name = "Võ Đang Khí"},
    {nMonPhai = 1,  nHeMonPhai = 9,  key = "VDQ", name = "Võ Đang Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 10, key = "CLD", name = "Côn Lôn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 10, key = "CLK", name = "Côn Lôn Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 11, key = "MGC", name = "Minh Giáo Chùy"},
    {nMonPhai = 2,  nHeMonPhai = 11, key = "MGK", name = "Minh Giáo Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 12, key = "DTC", name = "Đoàn Thị Chỉ"},
    {nMonPhai = 2,  nHeMonPhai = 12, key = "DTK", name = "Đoàn Thị Kiếm"}
}

local nSoAccLimit = ConfigAll.GioiHanMonPhai -- Giới hạn số lượng acc/phái

local function CheckFactionLimit(faction)
    local tbHwidOld = Lib:LoadTabFile(tbHwidPaths[faction.key])
    local nNum = 0

    for _, tbRowData in ipairs(tbHwidOld) do
        if tonumber(tbRowData.MaMay) == nHardWareId then
            nNum = nNum + 1
        end
    end

    if nNum >= nSoAccLimit then
        local bFound = false
        for _, tbRowData in ipairs(tbHwidOld) do
            if tbRowData.PlayerName == me.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                bFound = true
                break
            end
        end

        if not bFound then
            Dialog:Say(string.format("<color=cyan>Mỗi Máy tính chỉ được vào %d Nhân vật phái %s\nMáy tính của bạn đã gia nhập %d nhân vật <color=green>%s<color><color>",
                nSoAccLimit, faction.name, nNum, faction.name))
            return true
        end
    end
    return false
end

for _, faction in ipairs(tbFactionLimits) do
    if me.nRouteId == faction.nMonPhai and me.nFaction == faction.nHeMonPhai then
        if CheckFactionLimit(faction) then
            return
        end
    end
end
--------End giới hạn--------


		--------Giới hạn 1 nhân vật / pc 
	-- CampBattle:XoaNguoiChoiKhoiDanhSach(me.szName); -- Xóa người chơi khỏi danh sách nếu nó rớt mạng , dis acc này nọ
-- local nHardWareId = me.GetTask(2406, 1)
-- local szHwidOld = "\\script\\iDoctor\\CampBattle\\GioiHan1Acc.txt";
-- local tbHwidOld = Lib:LoadTabFile(szHwidOld);
-- local nSoAccPerPC = 1 
-- local nNum = 0

-- for _, tbRowData in ipairs(tbHwidOld) do
    -- if tonumber(tbRowData.MaMay) == nHardWareId then
        -- nNum = nNum + 1
    -- end
-- end


-- if nNum >= nSoAccPerPC then
    -- local bFound = false
    -- for _, tbRowData in ipairs(tbHwidOld) do
        -- if tbRowData.PlayerName == me.szName and tonumber(tbRowData.MaMay) == nHardWareId then
            -- bFound = true
            -- break
        -- end
    -- end
    
    -- if not bFound then
        -- Dialog:Say("<color=cyan>Mỗi máy tính chỉ được phép vào tối đa "..nSoAccPerPC.." nhân vật.\nHiện tại, máy tính của bạn đã tham gia Tống Kim "..nNum.." nhân vật rồi.<color>");
        -- return;
    -- end
-- end
	-------------------End giới hạn 1 acc-------
	if not GLOBAL_AGENT then		
		if Battle.JieAddKey == 1 then
			if (0 == self:AwardGood()) then
				return;
			end
		end
	end
	
		Battle:DbgOut("tbNpcBase:OnDialog", self, self.nMapId, self.tbMission);
									
	if (not self.tbMission) then
		local szMsg = "Đại quân tuần tra chiến trường vẫn chưa xuất phát, hãy tiếp tục thao luyện và đợi thông báo.";
		local tbOpt = 
		{
			--{"<color=cyan>Ta muốn mua lại Tống Kim<color>",SpecialEvent.ReBuyBatleDialog.OnDialog,SpecialEvent.ReBuyBatleDialog};
		};
		Dialog:Say(szMsg,tbOpt)
		return;
	end

	if (0 == self:CheckMaxNum()) then
		Dialog:Say(self.tbDialog[1]);
		return;
	end
	local pPlayer = me;
	local szIp	= pPlayer.dwHardWareId;
	local nCheckResult = self:CheckPlayer();

	if (1 == nCheckResult) then
		local nPLLevel	= Battle.LEVEL_LIMIT[self.nLevel];
		Dialog:Say(string.format(self.tbDialog[2], nPLLevel),
			{
				{string.format("Ta muốn gia nhập quân <color=red>%s<color>", Battle.NAME_CAMP[self.nCampId]), self.OnSingleJoin, self, pPlayer},
				---{"<color=cyan>Ta muốn mua lại Tống Kim<color>",SpecialEvent.ReBuyBatleDialog.OnDialog,SpecialEvent.ReBuyBatleDialog};
				{"Để ta suy nghĩ đã"},
			}
		);
	elseif (2 == nCheckResult) then
		Dialog:Say("Ngươi muốn vào chiến trường bây giờ sao? Lúc chiến đấu, ngươi và người khác hợp thành tổ đội giết địch, một công đôi việc.<enter>- Máy chủ không cho phép post điểm, nếu post điểm bạn sẽ bị cấm tham gia Tống Kim<enter><color=green>HWID:<color> "..szIp.."",
			{
				{"Ta muốn vào chiến trường", self.OnSingleJoin, self, pPlayer},
				{"Chờ chút hãy nói"},
			}
		);
	end
end

-- 奖励上一场宋金战场的积分对应的奖励，返回1表示继续，返回0表示不用继续了
function tbNpcBase:AwardGood()
	-- 判断是否能给予奖励
	local pPlayer = me;
	if (self.tbMission) then
		local nCampId		= pPlayer.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);
		local nMyBTKey		= pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_KEY);
		local nBTKey		= self.tbMission.nBattleKey;
		local nDiaFlag		= 0;

		local nBattleSeqA	= math.fmod(nMyBTKey, 10);
		local nBattleSeqB	= math.fmod(nBTKey, 10);
		local nBattleTimeA	= nMyBTKey - nBattleSeqA;
		local nBattleTimeB	= nBTKey - nBattleSeqB;

		-- id不一样表示可能是同一时间段不同场次，可能是不同一时间段
		if (nMyBTKey ~= nBTKey) then
			-- 如果是同一时间段的表示这个玩家可能从另一个场次出来到其他场次
			if (nBattleTimeA == nBattleTimeB) then
				nDiaFlag = 1;
			end
		else -- 相同id
			-- 如果战局开始了就不能领了，直接继续下面对话
			if (self.tbMission.nState == 2) then
				return 1;
			end
			-- 同一场次却不是同一阵营
			if (0 ~= nCampId and self.nCampId ~= nCampId) then
				nDiaFlag = 2;
			end		
		end

		if (nDiaFlag == 1) then
			Dialog:Say(string.format(self.tbDialog[8], Battle.NAME_GAMELEVEL[self.nLevel], self.tbBattleSeq[nBattleSeqA], Battle.NAME_CAMP[nCampId]));
			return 0;
		elseif (nDiaFlag == 2) then
			Dialog:Say(self.tbDialog[5]);
			return 0;
		end
	end

	local nAwardPai = pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_ZHANCHANGLINGPAI);
	local nAwardFu	= pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_FUDAI);
	local nBouns	= pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_TOTALBOUNS);
	
	if (nAwardPai + nAwardFu + nBouns > 0) then
		local nPaiCount		= 0;
		local nFuCount		= 0;
		local szMsg = string.format("Điểm tích lũy chiến trường lần trước của ngươi là %d", nBouns);
		local nFinalBouns	= 0;
		
		if (nBouns > 0) then
			nFinalBouns = nBouns;
			local nMyUse = pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_USEBOUNS);
			if (nMyUse + nBouns > Battle.BATTLES_POINT2EXP_MAXEXP) then
				nFinalBouns = Battle.BATTLES_POINT2EXP_MAXEXP - nMyUse;
			end
		end
		if (nFinalBouns > 0) then
			szMsg = szMsg .. string.format(", có thể nhận %d điểm phần thưởng kinh nghiệm", nFinalBouns);
		elseif (nFinalBouns == 0 and nBouns > 0) then
			szMsg = szMsg .. string.format(", điểm tích lũy đổi kinh nghiệm tuần này của ngươi đã đạt giới hạn <color=yellow>500.000<color>, trong tuần không thể đổi kinh nghiệm nhưng vẫn nhận được phần thưởng điểm cống hiến gia tộc", nFinalBouns);
		end
		
		if (nAwardPai > 0 and nAwardFu > 0) then
			szMsg = szMsg .. string.format(", có thể nhận 1 Lệnh bài chiến trường %s và 2 Túi Phúc Hoàng Kim", Battle.NAME_GAMELEVEL[nAwardPai]);
			nPaiCount	= 1;
			nFuCount	= nAwardFu;
		elseif (nAwardFu > 0) then
			szMsg = szMsg .. ", có thể nhận 1 Túi Phúc";
			nFuCount = nAwardFu;
		end
		---------------------------sửa lỗi nhận thưởng mỗi lần thoát ra vào lại tống kim, sửa lại thời gian nhận thưởng thành thời gian kết thúc tông kim-------------------------------------------------
	local nThoiGian = tonumber(os.date("%H%M", GetTime()));
	if (nThoiGian >= 0000 and nThoiGian <= 1059) or (nThoiGian >= 1150 and nThoiGian <= 1659) or (nThoiGian >= 1750 and nThoiGian <= 2059) or (nThoiGian >= 2100 and nThoiGian <= 2259) or (nThoiGian >= 2350 and nThoiGian <= 2359) then
		local tbOpt = { 
			{"Đồng ý", self.OnAwardGood, self, pPlayer, nAwardPai, nPaiCount, nFuCount, nBouns, nFinalBouns}, 
			{"Nói tiếp đi"},
		};
		local _, _, szExtendInfo = SpecialEvent.ExtendAward:DoCheck("Battle", pPlayer, nBouns, self.nLevel);
		Dialog:Say(szMsg..szExtendInfo..", muốn nhận bây giờ?", tbOpt);
		return 0;
	end
		        Dialog:Say("<color=gold>Thời gian 11h00 - 17h00 - 21h00 - 23h00 chiến trường tống kim diễn ra<color>.");
	return 0;
	end
	return 1;
end

function tbNpcBase:OnAwardGood(pPlayer, nItemId, nPaiCount, nFuCount, nBouns, nFinalBouns)
	if (0 == Battle:AwardGood(pPlayer, nItemId, nPaiCount, nFuCount, nBouns, self.nLevel)) then
		-- 保存玩家义军令牌的等级
		pPlayer.Msg("Hành trang của bạn không đủ chỗ, không thể nhận phần thưởng");
	else
		local szMsg = string.format("Điểm tích lũy chiến trường lần trước của ngươi là %d", nBouns);
		if (nFinalBouns > 0) then
			szMsg = szMsg .. string.format(", đã nhận %d điểm phần thưởng kinh nghiệm", nFinalBouns);
		elseif (nFinalBouns == 0 and nBouns > 0) then
			szMsg = szMsg .. string.format(", điểm tích lũy đổi kinh nghiệm tuần này của ngươi đã đạt giới hạn <color=yellow>500.000<color>, trong tuần không thể đổi kinh nghiệm nhưng vẫn nhận được phần thưởng điểm cống hiến gia tộc", nFinalBouns);
		end
		if (nPaiCount > 0) then
			szMsg = szMsg .. string.format(", Nhận được %s <color=green>Lệnh bài chiến trường<color> và <color=yellow>Túi Phúc Hoàng Kim<color>.", Battle.NAME_GAMELEVEL[nItemId]);
		elseif (nFuCount > 0) then
			szMsg = szMsg .. ", Nhận được <color=yellow>Túi Phúc Hoàng Kim<color>."
		end
		pPlayer.Msg(szMsg);
		-- pPlayer.SetTask(9052,5,0);

------------ghi tich luy tong kim tuan--------------------------
	local nTime = GetTime();
	local nCurTime = tonumber(os.date("%H%M", nTime))
	local nTran21h = pPlayer.GetTask(9152,5)
if nTran21h == 1 then 
	if nCurTime > 2154 and nCurTime < 2249 then 
		local diemtk = pPlayer.GetTask(9152,1);
	     pPlayer.SetTask(9152,1,diemtk + nBouns);
		 pPlayer.SetTask(9152,5,0)
        Battle:Save_top_15tongkim(pPlayer)	
		pPlayer.Msg("Đã lưu điểm Tống Kim Tuần thành công"); 
	end
else 
end	
--------------------------------------------------------------------
	end
	return;
end

function tbNpcBase:CheckMaxNum()
	local nMyCampCount		= self.tbCamp:GetPlayerCount();
	if (Battle.BTPLNUM_HIGHBOUND <= nMyCampCount) then
		return 0;
	end
	return 1;
end

-- 检查玩家的等级和阵营
-- 返回值：0、此玩家不能进入；1、此玩家本场尚未报名，可以参加；2、此玩家报过名了，可以进入
function tbNpcBase:CheckPlayer()
	if (not self.tbMission) then
		Dialog:Say("Đại quân tuần tra chiến trường vẫn chưa xuất phát, hãy tiếp tục thao luyện và đợi thông báo.");
		return;
	end	

if Config.Mission_Battle_CheckNumAccount == 1 then
		local nCheck,nNum,Msg = Battle:CheckHardWare(me);
			if nCheck ~= 1 then
			Dialog:Say(""..Msg.."");
			return 0;
			end
end
	local pPlayer = me;
	
	local nJoinLevel	= Battle:GetJoinLevel(pPlayer);
	local nCampId = pPlayer.GetTask(Battle.TSKGID, Battle.TASKID_BTCAMP);
	local nFlag = 1;

	local nMyBTKey		= pPlayer.GetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_KEY);
	local nBTKey		= self.tbMission.nBattleKey;
	local nDiaFlag		= 0;


	local nBattleSeqA = math.fmod(nMyBTKey, 10);
	local nBattleSeqB = math.fmod(nBTKey, 10);
	local nBattleTimeA = nMyBTKey - nBattleSeqA;
	local nBattleTimeB = nBTKey - nBattleSeqB;

	if (nMyBTKey ~= nBTKey) then
		if (nBattleTimeA == nBattleTimeB) then
			nDiaFlag = 1;
		end
	else
		if (0 ~= nCampId and self.nCampId ~= nCampId) then
			nDiaFlag = 2;
		elseif (0 ~= nCampId and self.nCampId == nCampId) then
			nFlag = 2;
		end
	end

	if (nFlag == 1) then
		if (self.nLevel > nJoinLevel) then
			local tbOpt =	{
--								{"我想了解战役的信息", self.OnBattleInfo, self},
								{"Được rồi"},
							};
			Dialog:Say("Trình độ của ngươi chưa đạt, hãy về cố gắng luyện tập sau này quay lại góp sức cho nước nhà!", tbOpt);
			return 0;
		end

		if (pPlayer.IsFreshPlayer() == 1) then
			Dialog:Say("Bạn chưa gia nhập môn phái, gia nhập rồi hãy quay lại!");
			return 0;
		end
	
		if (self.nLevel < nJoinLevel) then	-- 有问题
			Dialog:Say(string.format("Ngươi đã tinh thông võ nghệ, hãy đi tham gia chiến trường <color=yellow>%s<color>!", Battle.NAME_GAMELEVEL[nJoinLevel]));
			return 0;
		end
	end
	
	if (nDiaFlag == 1) then
		Dialog:Say(string.format(self.tbDialog[8], Battle.NAME_GAMELEVEL[self.nLevel], self.tbBattleSeq[nBattleSeqA], Battle.NAME_CAMP[nCampId]));
		return 0;
	elseif (nDiaFlag == 2) then
		Dialog:Say(self.tbDialog[5]);
		return 0;
	end

	if (0 == self:CheckNumDif(self.nLevel)) then
		local nSongNum	= self.tbMission.tbCamps[Battle.CAMPID_SONG].nPlayerCount;
		local nJinNum	= self.tbMission.tbCamps[Battle.CAMPID_JIN].nPlayerCount;
		local szMsg		= string.format("Hiện tại quân số hai bên là: <color=orange>Tống: %d<color>, <color=purple>Kim: %d<color>, so với quân địch, ta tạm thời thiếu hụt quân số, ngươi hãy kiên nhẫn chờ đợi tí nữa quay lại.", nSongNum, nJinNum);
		Dialog:Say(szMsg);
		return 0;
	end

	return nFlag;
end

function tbNpcBase:CheckNumDif(nJoinLevel)
	local nMyCampNum	= self.tbCamp:GetPlayerCount();
	local nEnemyCampNum	= self.tbCamp.tbOppCamp:GetPlayerCount();
	if (nMyCampNum < Battle.tbBTPLNUM_LOWBOUND[nJoinLevel]) then
		return 1;
	end
	local nTemp			= nMyCampNum - nEnemyCampNum;
	if me.nLevel < 110 then
	-- local nDifNumLimit	= math.max(3, (nMyCampNum + nEnemyCampNum) * 0.1);
	local nDifNumLimit	= 6
	if (nTemp >= nDifNumLimit) then
		return 0;
	end
	return 1;
	else
	-- local nDifNumLimit	= math.max(Battle.BTPLNUM_NUMDIF, (nMyCampNum + nEnemyCampNum) * 0.1);
	local nDifNumLimit	= 6
	if (nTemp >= nDifNumLimit) then
		return 0;
	end
	return 1;
	end
end

-- 选择个人进入战场
function tbNpcBase:OnSingleJoin(pPlayer)

	self:Refresh();
	
	if (0 == self:CheckPlayer()) then
		return;
	end

if Config.Mission_Battle_CheckNumAccount == 1 then
	local _,nNumOld,_ = Battle:CheckHardWare(pPlayer);
	Battle:WriteNewHardWare(pPlayer,nNumOld);
end
												   
												   
local nTime = GetTime()
local nCurTime = tonumber(os.date("%H%M", nTime))
local nCheckCamp = pPlayer.GetWorldPos()

if nCurTime > 2049 and nCurTime < 2149 then
	if (nCheckCamp == 181 or nCheckCamp == 182) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
			pPlayer.SetTask(9152, 10, 1)
		CampBattle:WriteSongCamp(pPlayer)
	elseif (nCheckCamp == 184 or nCheckCamp == 185) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
			pPlayer.SetTask(9152, 10, 1)
		CampBattle:WriteKimCamp(pPlayer)
	end
elseif nCurTime > 1049 and nCurTime < 1149 then
	if (nCheckCamp == 181 or nCheckCamp == 182) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 6, 1)
		CampBattle:WriteSongCamp(pPlayer)
	elseif (nCheckCamp == 184 or nCheckCamp == 185) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 6, 1)
		CampBattle:WriteKimCamp(pPlayer)
	end
elseif nCurTime > 1649 and nCurTime < 1749 then
	if (nCheckCamp == 181 or nCheckCamp == 182) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 7, 1)
		CampBattle:WriteSongCamp(pPlayer)
	elseif (nCheckCamp == 184 or nCheckCamp == 185) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 7, 1)
		CampBattle:WriteKimCamp(pPlayer)
	end
elseif (nCurTime > 2249 and nCurTime <= 2349) or (nCurTime >= 0 and nCurTime < 1050) then
	if (nCheckCamp == 181 or nCheckCamp == 182) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 8, 1)
		CampBattle:WriteSongCamp(pPlayer)
	elseif (nCheckCamp == 184 or nCheckCamp == 185) and (CampBattle.Mission_CampBattle_CheckNumAccount == 1) then
		pPlayer.SetTask(9152, 8, 1)
		CampBattle:WriteKimCamp(pPlayer)
	end
end


	if ConfigAll.GioiHanKhongTrungPhai_TongKim  == 1 then 
CampBattle:GioiHanMonPhai(pPlayer)
	end 
-- CampBattle:GioiHan1Acc(pPlayer)
---------------------------------------------------------------------------
	Dialog:SendBlackBoardMsg(pPlayer, "Treo Acc Trong Tống Kim Không Nhận Được Điểm");
	local nTongKim11h = pPlayer.GetTask(9152, 6)
	local nTongKim17h = pPlayer.GetTask(9152, 7)
	local nTongKim21h = pPlayer.GetTask(9152, 10)
	local nTongKim23h = pPlayer.GetTask(9152, 8)

if   (nTongKim17h == 1 or nTongKim23h == 1 or nTongKim21h == 1) and  (nCurTime > 1049 and nCurTime < 1149) then
	pPlayer.SetTask(9152, 7, 0)
	pPlayer.SetTask(9152, 8, 0)
	pPlayer.SetTask(9152, 10, 0)
    self:OnNewEnter(pPlayer, nTime)
	elseif  (nTongKim11h == 1  or nTongKim23h == 1 or nTongKim21h == 1) and  (nCurTime > 1649 and nCurTime < 1749) then
	pPlayer.SetTask(9152, 6, 0)
	pPlayer.SetTask(9152, 8, 0)
	pPlayer.SetTask(9152, 10, 0)
	self:OnNewEnter(pPlayer, nTime)
	elseif  (nTongKim11h == 1 or nTongKim17h == 1 or nTongKim23h == 1)  and  (nCurTime > 2049 and nCurTime < 2149) then
	pPlayer.SetTask(9152, 6, 0)
	pPlayer.SetTask(9152, 7, 0)
	pPlayer.SetTask(9152, 8, 0)
	self:OnNewEnter(pPlayer, nTime)
	elseif  (nTongKim11h == 1 or nTongKim17h == 1 or nTongKim21h == 1)  and  (nCurTime > 2249 and nCurTime < 2349) then
	pPlayer.SetTask(9152, 6, 0)
	pPlayer.SetTask(9152, 7, 0)
	pPlayer.SetTask(9152, 10, 0)
	self:OnNewEnter(pPlayer, nTime)
else
    self:DoSingleJoin(pPlayer)
end
end 


function tbNpcBase:OnNewEnter(pPlayer, nNowTime)
	if (0 == self:CheckPlayer()) then
		return;
	end
	self:DoSingleJoin(pPlayer);
	Battle:ResetBonus(pPlayer, nNowTime); 
end

-- 执行真正进入战场操作
function tbNpcBase:DoSingleJoin(pPlayer)
	local pPlayerOld 	= me;
	if (not self.tbMission) then -- 异常
		me = pPlayer;
		pPlayer.Msg(" Bạn đã quá mệt, hãy nghỉ ngơi!");
		me = pPlayerOld;
		return;
	elseif (self.tbMission.nState == 2) then -- 战局开始
		pPlayer.Msg(self.tbDialog[4]);
	else			-- 战局还没开始
		me = pPlayer;	
		pPlayer.Msg(self.tbDialog[3]);
		me = pPlayerOld;
	end
	if (self.tbMission.nState == 2) then -- 战局开始后才记录玩家阵营和战场id
		--记录玩家参加宋金战场的次数
		local nBTKey = self.tbMission.nBattleKey;
		local bIsDiffBattle = Battle:IsDiffBattle(pPlayer, nBTKey)
		if (bIsDiffBattle and 1 == bIsDiffBattle) then
			Stats.Activity:AddCount(pPlayer, Stats.TASK_COUNT_BATTLE, 1);
		end
		
		pPlayer.SetTask(Battle.TSKGID, Battle.TSK_BTPLAYER_KEY, self.tbMission.nBattleKey);
		pPlayer.SetTask(Battle.TSKGID, Battle.TASKID_BTCAMP, self.nCampId);

	end
	self.tbMission:JoinPlayer(pPlayer, self.nCampId);
end

function tbNpcBase:OnBattleInfo() -- todo
	self:Refresh();
end

Battle.tbNpcBase	= tbNpcBase;

tbNpc:Init();
