-----------------------------------------------------
--文件名		：	battle_trap.lua
--创建者		：	FanZai, zhouchenfei
--创建时间		：	2007-10-23
--功能描述		：	trap点脚本
------------------------------------------------------
-- 本结构在设计时有很多尝试性的写法，可能并不符合规范。
-- 如果会对您的优良代码风格产生误导，请当作没看见……

Require("\\script\\mission\\battle\\camp.lua");
-- 宋金战场用地图基类
local tbMapBase	= Battle.tbMapBase or Lib:NewClass(Map.tbMapBase);	-- 基于公用地图基类

tbMapBase.tbTrapNameMap	= {	-- Trap点 => 功能 映射
	["houying%d_daying%d"]		= "BaseToOuter1",
	["houying%d_qianying%d"]	= "BaseToOuter2",
	["houying%d_daying%d_1"]	= "BaseToOuter3",
	["houying%d_daying%d_2"]	= "BaseToOuter4",
	["daying%d_houying%d"]		= "OuterToBase",
	["qianying%d_houying%d"]	= "OuterToBase",
	["daying%d_yewai"]			= "OuterToField1",
	["qianying%d_yewai"]		= "OuterToField2",
};

-- 初始化
function tbMapBase:init(tbCamp)
	local tbOnTrapCall	= {};
	for nIndex, tbCamp in pairs(tbCamp) do
		for szFmtName, szFun in pairs(self.tbTrapNameMap) do
			local szTrapName	= string.format(szFmtName, nIndex, nIndex);
			local szFunName		= "OnTrap_"..szFun;
			tbOnTrapCall[szTrapName]	= function ()	-- 这里生成一个closures（闭包函数）
				tbCamp[szFunName](tbCamp, me);
			end
		end
	end
	self.tbOnTrapCall	= tbOnTrapCall;
end

-- 触发本地图任何Trap点
function tbMapBase:OnPlayerTrap(szClassName)
	self.tbOnTrapCall[szClassName]();
end
function tbMapBase:OnPlayerNpc(szClassName)
	--	-_-#
end


-- Trap点事件定义在Camp上
local tbCampBase	= Battle.tbCampBase;

-- 后营 到 大营/前营
function tbCampBase:OnTrap_BaseToOuter1(pPlayer)
	self:_BaseToOuter(pPlayer, "OuterCamp1");
end
function tbCampBase:OnTrap_BaseToOuter2(pPlayer)
	self:_BaseToOuter(pPlayer, "OuterCamp2");
end
function tbCampBase:OnTrap_BaseToOuter3(pPlayer)
	self:_BaseToOuter(pPlayer, "OuterCamp3");
end
function tbCampBase:OnTrap_BaseToOuter4(pPlayer)
	self:_BaseToOuter(pPlayer, "OuterCamp4");
end
function tbCampBase:_BaseToOuter(pPlayer, szPosName)
	local tbBattleInfo	= Battle:GetPlayerData(pPlayer);
	local nBackTime		= tbBattleInfo.nBackTime;
	local nRemainTime	= Battle.TIME_DEATHWAIT - (GetTime() - nBackTime + 5);
	if (nRemainTime > 0) then
		Dialog:Say(string.format("Hãy nghỉ ngơi %d giây, trước khi ra trận giết giặc.", nRemainTime));
		return;
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

	self:TransTo(tbBattleInfo.pPlayer, szPosName);
	tbBattleInfo.pPlayer.SetFightState(1);
	Player:AddProtectedState(me, 5);
end

-- 大营/前营 到 后营
function tbCampBase:OnTrap_OuterToBase(pPlayer)
	local tbBattleInfo	= Battle:GetPlayerData(pPlayer);
	if (tbBattleInfo.tbCamp.nCampId ~= self.nCampId) then
		tbBattleInfo.pPlayer.Msg("Phía trước quân địch trùng trùng, hãy cẩn thận.");
		return;
	end
	tbBattleInfo.nBackTime	= GetTime()
	self:TransTo(tbBattleInfo.pPlayer, "BaseCamp");
	tbBattleInfo.pPlayer.SetFightState(0);
	if (3 == self.tbMission.tbRule.nRuleType) then
		self.tbMission.tbRule:DeletePlayerFlag(pPlayer);
	end
end

-- 大营/前营 到 野外 （没有障碍）
function tbCampBase:OnTrap_OuterToField1(pPlayer)
	self:_OuterToField(pPlayer, "OuterCamp1");
end
function tbCampBase:OnTrap_OuterToField2(pPlayer)
	self:_OuterToField(pPlayer, "OuterCamp2");
end

function tbCampBase:_OuterToField(pPlayer, szPosName)
	local nState = self.tbMission.nState;
	if (2 ~= nState) then
		Dialog:Say("Nguyên Soái đã có lệnh cấm tất cả các binh sỹ rời khỏi doanh trại, mau trở về.");
		self:TransTo(pPlayer, szPosName);
		return;
	end
end

Battle.tbMapBase	= tbMapBase;
