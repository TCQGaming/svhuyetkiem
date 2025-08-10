local tbZhongMingChiMu = Npc:GetClass("zhongmingchimu");

tbZhongMingChiMu.szText =" lần này phụng Đại Lý Hoàng Đế chi mệnh tiền lai hướng nghĩa quân cầu viện ，chiêu mộ một nhóm tinh bén chi sư đi trước ta Đại Lý cảnh nội đích bách man sơn dẹp loạn cổ vương chi loạn 。phàm lai ứng chinh đích nghĩa quân bộ hạ nhưng tiên do ta ở đây lĩnh thủ nhiệm vụ ，tái tòng các phó bản truyện tống quan xử đi trước bách man sơn 。";
function tbZhongMingChiMu:OnDialog()
	local tbOpt = {{"kết thúc đối thoại"}, };
	Dialog:Say(self.szText, tbOpt);
end;
