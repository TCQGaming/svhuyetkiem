-------------------------------------------------------------------
--File: 	factionbattle.lua
--Author: 	zhengyuhua
--Date: 	2008-1-8 17:38
--Describe:	Môn phái chiến --gamecenterđoan kịch bản gốc 
-------------------------------------------------------------------

-- mở ra hoạt động 
function FactionBattle:StartFactionBattle()
	local nWeek = tonumber(GetLocalDate("%w"));
	-- if nWeek ~= self.OPEN_WEEK_DATE[1] then
		-- return;
	-- end
	local isValidDay = false
for _, day in ipairs(self.OPEN_WEEK_DATE) do
    if nWeek == day then
        isValidDay = true
        break
    end
end

if not isValidDay then
    return  -- Không phải thứ đã định thì thoát
end

	local nCurId = GetFactionBattleCurId();
	nCurId = nCurId + 1;
	SetFactionBattleCurId(nCurId)
	GlobalExcute{"FactionBattle:StartFactionBattle_GS"};
	self:InitFactionNewsTable();
end

function FactionBattle:EndBattle_GC(nFaction)
	GlobalExcute{"FactionBattle:EndBattle_GS2", nFaction};
end

-- ghi lại hoạt động kết quả 
function FactionBattle:FinalWinner_GC(nFaction, nPlayerId)
	--liên kết mở ra hậu ，đóng Môn phái thi đấu thể thao con người mới vương biểu hiện ，đóng Môn phái đại sư huynh người được đề cử tư cách 。
	if Wlls:GetMacthSession() <= 0 then
		-- by zhangjinpin@kingsoft
		local bFind = 0;
		local tbList = GetCurCandidate(nFaction);
		for _, tbRow in pairs(tbList or {}) do
			if tbRow.nPlayerId == nPlayerId then
				bFind = 1;
				break;
			end	
		end
		if bFind == 0 then
			KGCPlayer.SetPlayerPrestige(nPlayerId, KGCPlayer.GetPlayerPrestige(nPlayerId) + 100);
			Dbg:WriteLog("FactionBattle","Môn phái đại sư huynh người được đề cử", KGCPlayer.GetPlayerName(nPlayerId),"tăng giang hồ uy vọng 100điểm");
		end
		-- end
		SetCurCandidate(nFaction, nPlayerId);
	end
	local szName = KGCPlayer.GetPlayerName(nPlayerId);
	self:RecNewsForNewsMan(nFaction, szName);
end

function FactionBattle:InitFactionNewsTable()
	
	-- Môn phái danh TODO：phương thức như vậy bất hảo ，cần người công giữ gìn 
	self.MENPAINAME = {
			[1] ="Thiếu Lâm";
			[2] ="thiên vương";
			[3] ="Đường Môn";
			[4] ="ngũ độc";
			[5] ="Nga mi";
			[6] ="thúy yên";
			[7] ="Cái Bang";
			[8] ="thiên nhẫn";
			[9] ="Vũ Đương";
			[10] ="Côn Lôn";
			[11] ="Minh Giáo";
			[12] ="Đoàn thị";
	};
	self.tbMenPaiNew = {};
	local tbNewsInfo = {};
	tbNewsInfo.nKey		= Task.tbHelp.NEWSKEYID.NEWS_MENPAI_NEW;
	tbNewsInfo.szTitle	="tân một lần mười hai đại môn phái con người mới vương";
	tbNewsInfo.nAddTime = GetTime();
	tbNewsInfo.nEndTime = tbNewsInfo.nAddTime + 3600 * 48;
	tbNewsInfo.szMsg	="";
	self.tbNewsInfo = tbNewsInfo;

	for i=1, 12 do
		local tbInfo = {};
		tbInfo.szName	="ghế trống";
		tbInfo.nLevel	= 0;
		tbInfo.szKin	="vô gia tộc";
		tbInfo.szTong	="vô bang hội";
		tbInfo.nSex		= 0;
		self.tbMenPaiNew[i] = tbInfo;
	end
	self:WriteNewsLog("InitFactionNewsTable","Init Vote News Msg Successed");
end

-- thu hoạch Môn phái con người mới vương tin tức tin tức 
function FactionBattle:RecNewsForNewsMan(nFaction, szName)
	self:WriteNewsLog("RecNewsForNewsMan", nFaction, szName);
	if (nFaction <= 0) then
		return;
	end
	local szMsg = self:GetMenPaiNewsMsg(nFaction, szName);
	self:WriteNewsLog("con người mới vương tin tức", szMsg);
	local tbSendInfo = self.tbNewsInfo;
	Task.tbHelp:AddDNews(tbSendInfo.nKey, tbSendInfo.szTitle, szMsg, tbSendInfo.nEndTime, tbSendInfo.nAddTime);
end

-- thu hoạch Môn phái con người mới vương tin tức 
function FactionBattle:GetMenPaiNewsMsg(nFaction, szName)
	self:ProcessPlayerInfo(nFaction, szName, self.tbMenPaiNew);
	local szMsg ="";
	for i=1, 12 do
		local tbInfo = self.tbMenPaiNew[i];
		local szOneMsg = string.format("<color=yellow>%s<color>con người mới vương \n  tên ：<color=yellow>%s<color>\n  đẳng cấp ：<color=green>%d<color>\n  gia tộc ：<color=pink>%s<color>\n  bang hội ：<color=pink>%s<color>\n\n", self.MENPAINAME[i], tbInfo.szName, tbInfo.nLevel, tbInfo.szKin, tbInfo.szTong);
		szMsg = szMsg.. szOneMsg;
	end
	return szMsg;
end

function FactionBattle:ProcessPlayerInfo(nFaction, szName, tbMenPai)
	local tbPlayerInfo = GetPlayerInfoForLadderGC(szName);
	if (tbPlayerInfo) then -- ngoạn gia không tồn tại 
		self:WriteNewsLog(ProcessPlayerInfo, nFaction, szName);
		local tbMenInfo = {};
		tbMenInfo.szName = szName;
		tbMenInfo.nLevel = tbPlayerInfo.nLevel;
		if (string.len(tbPlayerInfo.szKinName)> 0) then
			tbMenInfo.szKin	= tbPlayerInfo.szKinName;
		else
			tbMenInfo.szKin	="vô gia tộc";
		end
		
		if (string.len(tbPlayerInfo.szTongName)> 0) then
			tbMenInfo.szTong	= tbPlayerInfo.szTongName;
		else
			tbMenInfo.szTong	="vô bang hội";
		end
		tbMenInfo.nSex = tbPlayerInfo.nSex;
		tbMenPai[nFaction] = tbMenInfo;
	end
end

function FactionBattle:WriteNewsLog(...)
	if (MODULE_GAMESERVER) then
		Dbg:WriteLogEx(Dbg.LOG_INFO,"PVP","FactionBattle", unpack(arg));
	end
	if (MODULE_GC_SERVER) then
		Dbg:Output("PVP","FactionBattle", unpack(arg));
	end
end

--
function FactionBattle:TestCandidate_GC(nFaction, nPlayerId)
	SetCurCandidate(nFaction, nPlayerId);
end

-- 
function FactionBattle:TestVote_GC(nFaction, nElectId, nVote)
	VoteToCandidate(nFaction, nElectId, nVote);
end
