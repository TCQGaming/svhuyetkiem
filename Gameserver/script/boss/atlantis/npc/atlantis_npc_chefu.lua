-------------------------------------------------------
-- 文件名　:atlantis_npc_chefu.lua
-- 创建者　:zhangjinpin@kingsoft
-- 创建时间:2011-03-15 16:07:55
-- 文件描述:
-------------------------------------------------------

if not MODULE_GAMESERVER then
	return;
end

Require("\\script\\boss\\atlantis\\atlantis_def.lua");

local tbNpc = Npc:GetClass("atlantis_npc_chefu");

function tbNpc:OnDialog()
	local szMsg = "    Xa Phu đội thương nhân: Thế nào, muốn đi về rồi sao? Lúc mới đến lão phu nói không sai đúng không? Nơi nguy hiểm thế này đừng nên ở lâu";
	local tbOpt = 
	{
		{"<color=yellow>Quay về Phượng Tường<color>", self.ReturnCity, self},
		{"Ta biết rồi"},
	};
	Dialog:Say(szMsg, tbOpt);		
end

function tbNpc:ReturnCity()
	Atlantis:SafeLeave(me);
end
