
SpecialEvent.DanhHieuTP = SpecialEvent.DanhHieuTP or {};
local tbAdd_DanhHieuTP = SpecialEvent.DanhHieuTP;

tbAdd_DanhHieuTP.ListNpc = {};
tbAdd_DanhHieuTP.tbSpecNpcPos = {};
tbAdd_DanhHieuTP.nStart = 1; -- 0 la khoi dong = tay , 1 la tu dong khoi dong
tbAdd_DanhHieuTP.nCheck = 0; -- ko dc edit

tbAdd_DanhHieuTP.Top1_XH = "";
tbAdd_DanhHieuTP.Top_GT = 1;

tbAdd_DanhHieuTP.nType = 1; -- 1 là tai phu, 2 la vo lam, 3 la thu linh

tbAdd_DanhHieuTP.ToaDoNpc = {8, 1748, 3407};-- 13 là ID MAP, 1703,3280 là toa do

function tbAdd_DanhHieuTP:StartEvent()
	if tbAdd_DanhHieuTP.nStart == 1 then
		tbAdd_DanhHieuTP:AddSpecNpc_GS();
	end
end
function tbAdd_DanhHieuTP:AddSpecNpc_GS()
	local nMapIndex = SubWorldID2Idx(tbAdd_DanhHieuTP.ToaDoNpc[1]);
	if nMapIndex < 0 then
		return;
	end
	tbAdd_DanhHieuTP.Top1_XH = "";
	tbAdd_DanhHieuTP:LoadTopXepHang(self.nType);
	local NpcId = 3675; -- tuong Nu
	if tbAdd_DanhHieuTP.Top_GT == 0 then
		NpcId = 3676; -- tuong nam
	end
	if tbAdd_DanhHieuTP.nCheck == 0 then
		local pNpc = KNpc.Add2(NpcId, 100, -1, tbAdd_DanhHieuTP.ToaDoNpc[1], tbAdd_DanhHieuTP.ToaDoNpc[2], tbAdd_DanhHieuTP.ToaDoNpc[3]);-- 13 là ID MAP, 1703,3280 là toa do
		pNpc.szName = tbAdd_DanhHieuTP.Top1_XH
		pNpc.SetTitle("<bclr=yellow><color=red>TOP 1 Tài Phú Sever<bclr><color>");	
		tbAdd_DanhHieuTP.nCheck = 1;
	end
	print("===========================================\nAdd Tuong Top 1 : "..tbAdd_DanhHieuTP.Top1_XH.." - "..tbAdd_DanhHieuTP.Top_GT.."\n===========================================\n")
end
function tbAdd_DanhHieuTP:LoadTopXepHang(nType_A)
	local HONOR_CLASS = 0;
	local LADDER_CLASS = 0;
	local LADDER_TYPE = 0;
	local LADDER_ACTION = 0;
	if nType_A == 1 then
		HONOR_CLASS = PlayerHonor.HONOR_CLASS_MONEY;-- tai phu
		LADDER_CLASS = Ladder.LADDER_CLASS_MONEY;
		LADDER_TYPE = Ladder.LADDER_TYPE_MONEY_HONOR_MONEY;
	elseif nType_A == 2 then
		HONOR_CLASS = PlayerHonor.HONOR_CLASS_WULIN;-- vo lam
		LADDER_CLASS = Ladder.LADDER_CLASS_WULIN;
		LADDER_TYPE = Ladder.LADDER_TYPE_WULIN_HONOR_WULIN;
	elseif nType_A == 3 then
		HONOR_CLASS = PlayerHonor.HONOR_CLASS_LINGXIU;-- thu linh
		LADDER_CLASS = Ladder.LADDER_CLASS_LINGXIU;
		LADDER_TYPE = Ladder.LADDER_TYPE_LINGXIU_HONOR_LINGXIU;
	elseif nType_A == 4 then
		HONOR_CLASS = PlayerHonor.HONOR_CLASS_WEIWANG;-- uy danh
		LADDER_CLASS =  Ladder.LADDER_CLASS_LADDER;
		LADDER_TYPE = Ladder.LADDER_TYPE_LADDER_ACTION;		
		LADDER_ACTION = Ladder.LADDER_TYPE_LADDER_ACTION_WEIWANG;
	end
	local nType = Ladder:GetType(0, LADDER_CLASS, LADDER_TYPE, LADDER_ACTION);
	local tbLadder = GetTotalLadderPart(nType, 1, 100);
	if (tbLadder) then
		for _, tbInfo in pairs(tbLadder) do
			local tbPlayerInfo = GetPlayerInfoForLadderGC(tbInfo.szPlayerName);
			if (tbPlayerInfo) then
				local nLevel = PlayerHonor:GetPlayerHonorRankByName(tbInfo.szPlayerName, HONOR_CLASS, 0)
				if nLevel == 1 then
					tbAdd_DanhHieuTP.Top1_XH = tbInfo.szPlayerName;
					tbAdd_DanhHieuTP.Top_GT = tbPlayerInfo.nSex;

				end
			end
			end
	end
end
ServerEvent:RegisterServerStartFunc(SpecialEvent.DanhHieuTP.StartEvent, SpecialEvent.DanhHieuTP);
