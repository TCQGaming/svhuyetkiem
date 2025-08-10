-------------------------------------------------------
-- τݾĻaúyemingzhu.lua
-- Դݨ֟aúzhangjinpin@kingsoft
-- Դݨʱݤú2009-06-10 10:34:06
-- τݾĨ˶ú
-------------------------------------------------------

-- ֨ӥҪʾĻؖú"\\setting\\item\\001\\other\scriptitem.txt"
local tbYemingzhuItem = Item:GetClass("qinling_yemingzhu");

function tbYemingzhuItem:OnUse()
	
	local tbOpt = {
		{"Sử dụng", Boss.Qinshihuang.OnUseYemingzhu, Boss.Qinshihuang, me.nId},
		{"Không dùng nữa"},
	}
	
	local nNum = Boss.Qinshihuang:GetCostNum(me);
	local szMsg = string.format("Sử dụng <color=yellow>Tần Lăng-Dạ Minh Châu <color> giúp cơ thể chống lại khí độc trong tần lăng trong vòng 1 giờ, số lượng Dạ Minh Châu tăng theo cấp <color=yellow>Phi phong <color>. Bạn cần dùng <color=yellow>%d<color> Viên. Quyết định sử dụng?", nNum);
	Dialog:Say(szMsg, tbOpt);
	
	-- һлʧ
	return 0;
end
