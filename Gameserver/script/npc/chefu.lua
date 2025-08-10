-- 通用车夫脚本

local tbNpc = Npc:GetClass("chefu");
if (not MODULE_GAMESERVER) then
	return;
end

tbNpc.tbMapType	= {};	-- [nMapId] = szMapType
tbNpc.tbCity	= {};	-- [nIndex] = tbMapInfo
tbNpc.tbCountry	= {};	-- [nIndex] = tbMapInfo

function tbNpc:Init()
	local tbData	= Lib:LoadTabFile("\\setting\\map\\station.txt");
	for _, tbRow in ipairs(tbData) do
		local tbMapInfo	= {
			nId		= tonumber(tbRow.MapId),
			szName	= tbRow.MapName;
			szType	= tbRow.MapType;
			tbSect	= {};
		}
		if (tbMapInfo.nId) then
			local tbSect	= tbMapInfo.tbSect;
			for i = 1, 4  do
				local tbPos	= Lib:SplitStr(tbRow["Sect"..i], ":");
				if (tbPos[1] and tbPos[2]) then
					tbSect[#tbSect+1]	= {tonumber(tbPos[1]), tonumber(tbPos[2])};
				end
			end
			
			self.tbMapType[tbMapInfo.nId]	= tbMapInfo.szType;
			if (tbMapInfo.szType == "city") then
				self.tbCity[#self.tbCity+1]	= tbMapInfo;
			elseif (tbMapInfo.szType == "country") then
				self.tbCountry[#self.tbCountry+1]	= tbMapInfo;
			end
		end
	end
end

function tbNpc:OnDialog()
	Log:Ui_LogSetValue("Ngươi từng sử dụng Xa Phu chưa", 1)
	local nMapId	= me.GetMapId();
	self:SelectMap(self.tbMapType[nMapId]);
end

function tbNpc:SelectMap(szMapType)
			local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local tbTrans;
	local nMapId	= me.nMapId;
	local tbOpt		= {};
	local tbCityType = {
		["liansaihuichang"] = 1,
		["baihutang"]		= 1,
		["xoyogame"]		= 1,
	};
	
	if (GetMapType(nMapId) == "liansaihuichang" and GLOBAL_AGENT) then
		Dialog:Say("Ngươi muốn đến Đảo Anh Hùng chứ?",
			{
				{"Đồng ý", self.OnTransToYingXiongDao, self},
				{"Để suy nghĩ lại đã"},	
			}
		);
		return 0;
	end
	
	if (szMapType == "city" or tbCityType[GetMapType(nMapId)]) then
		-- 城市车夫：城市之间传送				地图编号 225和233是白虎堂大殿地图id，白虎堂的车夫要把玩家传送城市
		tbTrans	= self.tbCity;
	else
		-- 新手村车夫：新手村之间传送
		-- 门派车夫：只能传送到任意新手村
		tbTrans	= self.tbCountry;
	end
	
	-- 征战车夫功能
	local nState = Domain:GetBattleState();
	if nState == Domain.BATTLE_STATE or nState == Domain.PRE_BATTLE_STATE then
		if me.dwTongId ~= 0 then
			tbOpt[#tbOpt+1] = {"Xa Phu chinh chiến", Domain.BattleChefu, Domain};
		end
	end
	
	for _, tbMapInfo in ipairs(tbTrans) do
		if (tbMapInfo.nId ~= nMapId) then
			tbOpt[#tbOpt+1]	= {tbMapInfo.szName, self.OnTrans, self, tbMapInfo};
		end
	end
	tbOpt[#tbOpt+1]	= {"Không cần"};
	
	Dialog:Say("Ngươi muốn đi đâu?", tbOpt);
end

function tbNpc:OnTransToYingXiongDao()
	Transfer:NewWorld2GlobalMap(me);
end

function tbNpc:OnTrans(tbMapInfo)
	local tbSect	= tbMapInfo.tbSect;
	local nRect		= MathRandom(#tbSect);
	local tbPos		= tbSect[nRect];
	me.Msg("Đi "..tbMapInfo.szName);
	local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
	}
	GeneralProcess:StartProcess("Đang truyền tống...", 0.2 * Env.GAME_FPS, {self.dichchuyen, self, tbMapInfo.nId, tbPos[1], tbPos[2]}, nil, tbEvent);
	me.SetFightState(0);
end
function tbNpc:dichchuyen(tbMapInfo,tbPostX,tbPostY)
	me.NewWorld(tbMapInfo,tbPostX, tbPostY);

end 
tbNpc:Init();
