--Dev : TCQGaming

Require("\\script\\event\\huihuangguo\\huihuangzhiguo_head.lua")
HuiHuangZhiGuo.START_TIME	=	2200;
HuiHuangZhiGuo.END_TIME		=	2230;
local tbConfig				=	{
									{szMapName ="Mạn Bắc Thảo Nguyên",nCount = 30,nMapId = 122,nSeedLevel = 1},
								};
function HuiHuangZhiGuo:TaskShedule()
	local nNowTime = tonumber(GetLocalDate("%H%M"));

	if (nNowTime >= self.START_TIME and nNowTime <= self.END_TIME) then--辉煌之种活动产生种子
		self:MakeAllSeed(nNowTime);
		return 0
	end
	
end


function HuiHuangZhiGuo:MakeCitySeed(nCityIndex,nNowTime)

	local nGrowPhase				= 0; -- 0 đang sinh trưởng 1 ra trái để hái mặc định 0
	local nWetherMakeGoldFruitTime	= 0; 
	

	if (math.mod(nNowTime, 10) >= 5) then 
		nGrowPhase = 1
	end
	if (nGrowPhase == 0) then
		_G.GlobalExcute({"KDialog.NewsMsg", 0, Env.NEWSMSG_NORMAL, "<Quả Huy Hoàng> Đã xuất hiện."});
	end
	_G.GlobalExcute({"HuiHuangZhiGuo:GreatSeedExecute", tbConfig[nCityIndex]["nMapId"], tbConfig[nCityIndex]["nSeedLevel"], tbConfig[nCityIndex]["nCount"], nGrowPhase, nWetherMakeGoldFruitTime});
end

function HuiHuangZhiGuo:SetGoldenSeedCity_GC()
	local nGoldCityIndex = MathRandom(1,#tbConfig);
	KGblTask.SCSetDbTaskInt(DBTASK_HuangJinZhiZhong_MapId, tbConfig[nGoldCityIndex]["nMapId"]);
end

function HuiHuangZhiGuo:MakeAllSeed(nNowTime)
	local i			= 0;	
	local nMapCount	= #tbConfig;
	for i = 1,nMapCount do
		self:MakeCitySeed(i,nNowTime);
	end;
end

