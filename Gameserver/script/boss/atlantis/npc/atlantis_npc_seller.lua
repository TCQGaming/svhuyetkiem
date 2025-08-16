-------------------------------------------------------
-- 文件名　:atlantis_npc_seller.lua
-- 创建者　:zhangjinpin@kingsoft
-- 创建时间:2011-03-17 22:35:34
-- 文件描述:
-------------------------------------------------------

if not MODULE_GAMESERVER then
	return;
end

Require("\\script\\boss\\atlantis\\atlantis_def.lua");

local tbNpc = Npc:GetClass("atlantis_npc_seller");

function tbNpc:OnDialog()
	local szMsg = "    Đại phu đội thương nhân: Khi đến những vùng hoang mạc như thế nên mang theo một số thuốc men phòng khi cần đến!";
	local tbOpt = 
	{
		{"<color=yellow>[Bạc Khóa]Ta muốn mua thuốc<color>", self.OnBuyYaoBind, self},
		{"<color=yellow>[Bạc Khóa]Ta muốn mua thức ăn<color>", self.OnBuyCaiBind, self},
		{"Ta muốn mua thuốc", self.OnBuyYao, self},
		{"Ta biết rồi"},
	};
	Dialog:Say(szMsg, tbOpt);		
end

-- 买药
function tbNpc:OnBuyYaoBind()
	--me.OpenShop(14,7);
	CTC_7_Thanh:MuaMauNhanh()
end

function tbNpc:OnBuyYao()
	me.OpenShop(14,1);
end

-- 买菜
function tbNpc:OnBuyCaiBind()
	me.OpenShop(21,7);
end
