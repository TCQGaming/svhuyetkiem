-------------------------------------------------------
-- 文件名　：wlls_shangren.lua
-- 创建者　：zhouchenfei
-- 创建时间：2009-12-24 14:58:48
-- 文件描述：
-------------------------------------------------------

local tbNpc	= Npc:GetClass("wlls_yaoshang");

-- 和NPC对话
function tbNpc:OnDialog(szCamp)
	local szMsg = "";
	local tbOpt	= {};
	if (GLOBAL_AGENT) then
		szMsg	= "Xin chào, tại đây bạn có thể sử dụng lượng bạc đặc biệt cho các hoạt động dịch vụ chéo để mua thuốc.";
		tbOpt	= 	
		{
			{"Mua", self.OnBuySpeYao, self},
			{"Không"},
		};
	else
		szMsg = "Các anh hùng võ lâm hiện nay thuộc mọi tầng lớp đều tụ họp về đây để tranh giải thưởng cao quý nhất của võ lâm, công việc làm ăn của tôi đã thăng tiến rất nhiều. Điều đó thật sự rất an ủi lòng tôi!";
		tbOpt = 
		{
			{"<color=gold>【Bạc Khóa】<color> Thuốc", self.OnBuyYaoByBind, self},
			{"Thuốc", self.OnBuyYao, self},
			{"Thức ăn", self.OnBuyCai, self},
		};
	end

	Dialog:Say(szMsg, tbOpt);
end

-- 买药
function tbNpc:OnBuySpeYao()
	me.OpenShop(164,7);
end

function tbNpc:OnBuyYao()
	me.OpenShop(14,1);
end

function tbNpc:OnBuyYaoByBind()
	me.OpenShop(14,7);
end

-- 买菜
function tbNpc:OnBuyCai()
	me.OpenShop(21,1);
end

function tbNpc:OnBuyCaiByBind()
	me.OpenShop(21,7);
end
