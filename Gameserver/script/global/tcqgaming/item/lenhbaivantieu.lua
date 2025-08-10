
local tbItem = Item:GetClass("danhvongdaihoi_vantieu")
function tbItem:OnUse()
	-- local tbGiftId1	= {18,1,2030,9,0,0};
	me.AddRepute(10,1,1);
	-- Task:DelItem(me, tbGiftId1, 1);
	-- me.Msg("Bạn đã sử dụng 1 lệnh bài danh vọng đoàn viên nhận được +10 danh vọng");
	return 1;-----Xóa vật phẩm sau khi sử dụng
end
