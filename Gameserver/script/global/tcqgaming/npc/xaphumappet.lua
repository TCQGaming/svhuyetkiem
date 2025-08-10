local tbchefupet = Npc:GetClass("chefupet");

function tbchefupet:OnDialog()
DoScript("\\script\\chefupet.lua");
		local szMsg ="<color=yellow>Muốn Di Chuyển Tới Khu Vực Bắt Pet Cần Ít Nhất 30 Thiệp Bạc<color>\n\n"..
		"<color=yellow>Map Sẽ Có 2 Pet Là Diệp Tinh Và Hạ Hầu Tiểu Tiểu<color>\n\n"..
		"<color=yellow>Pet RanDom Từ 1 - 6 Kỹ Năng<color>\n\n"..
		"<color=yellow>Quái Sẽ Không Đánh Người Nên AE Bắt Thoải Mái<color>\n\n"..
		"<color=yellow>Không Cần Đánh Quái Xuống 50% Máu<color>\n\n"..
		"<color=yellow>Map PK Nên Người Chơi Hãy Cẩn Thận<color>"
			local tbOpt = 
	{	
		{"<color=gold>Di Chuyển<color>",self.menudichuyen, self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg, tbOpt);

end

function tbchefupet:menudichuyen()
	local nCount1 = me.GetItemCountInBags(18,1,541,2);
	if nCount1 < 30 then
	Dialog:Say("Bạn không đủ 30 thiệp bạc");
	return 0;
	end
	me.nInBattleState = 1;
	me.NewWorld(2022,1647,3179);
	
end