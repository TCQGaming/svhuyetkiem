-- 文件名　:crosstimeroom_trap.lua
-- 创建者　:zhangjunjie
-- 创建时间:2011-08-12 17:14:32
-- 描述:时光屋trap

Require("\\script\\boss\\crosstimeroom\\crosstimeroom_def.lua")

local tbMap = {};

--初始化地图trap， không có 特殊的trap点，通用处理
function CrossTimeRoom:InitTrap(nMapId)
	local tbMapTrap = Map:GetClass(nMapId);
	for szTrapName, tbBackPos in pairs(CrossTimeRoom.tbMapTrapBackPos) do
		local tbTrap	= tbMapTrap:GetTrapClass(szTrapName);
		tbTrap.szName = szTrapName;
		tbTrap.nPosX = tbBackPos[1];
		tbTrap.nPosY = tbBackPos[2];
		for szFnc in pairs(tbMap) do		-- 复制函数
			tbTrap[szFnc] = tbMap[szFnc];
		end
	end
end

-- 定义玩家Trap事件
function tbMap:OnPlayer()
	local pGame =  CrossTimeRoom:GetGameObjByMapId(me.nMapId) --获得对象
	if pGame == nil then
		return 0;
	end
	if self.szName == "trap_up" then
		Dialog:SendBlackBoardMsg(me, "Nếu đã đến đây , không dễ gì ra khỏi");
		me.NewWorld(me.nMapId, self.nPosX, self.nPosY);
		return 0;
	elseif self.szName == "trap_down" then
		Dialog:SendBlackBoardMsg(me, "Trước mặc có nhiều trông gai đang chờ đợi");
		me.NewWorld(me.nMapId, self.nPosX, self.nPosY);
		return 0;
	end
	return 0;
end

CrossTimeRoom:InitTrap(CrossTimeRoom.nTemplateMapId);