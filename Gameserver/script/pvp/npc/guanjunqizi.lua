----------------------------------------------------------------------
--File: 	guanjunqizhi.lua
--Author: 	zhengyuhua
--Date: 	2008-9-25 11:36
--Describe:
-------------------------------------------------------------------
local tbGuanJunQiZhi = Npc:GetClass("guanjunqizhi");

function tbGuanJunQiZhi:OnDialog()
	Dialog:Say("thi đấu môn phái kết thúc");
end
