
local tbTieuCuc	= Npc:GetClass("npcvantieu");


tbTieuCuc.HONOR_CLASS_MONEY		= 8;	
tbTieuCuc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbTieuCuc.HONOR_CLASS_MONEY,
	},
};

function tbTieuCuc:OnDialog()
	DoScript("\\script\\global\\tcqgaming\\npc\\VanTieu\\NpcTieuCuc.lua");
	local nGioiHanNgay = me.GetTask(9171,1)
	local nGioiHanNgayCuop = me.GetTask(9171,2)
	local nMoVanTieu = ConfigAll.VanTieu
	if nMoVanTieu == 0 then 
	Dialog:Say("Tính năng chưa mở");
	return 0;
	end 
 local nNgay    = tonumber(GetLocalDate("%d%m%y"));
local nTieuXa = "<color=gold>Ngẫu nhiên<color>"

if me.GetTask(9171,3) ~= nNgay then
    me.SetTask(9171,3, nNgay);
    me.SetTask(9171,1, 0);
    me.SetTask(9171,2, 0);
    me.SetTask(9171,4, 0);
    me.SetTask(9171,5, 0);
    me.SetTask(9171,6, 0);
    me.SetTask(9171,7, 0);
    me.SetTask(9171,8, 0);
    me.SetTask(9171,9, 0);
    me.SetTask(9171,10, 0);
    me.SetTask(9171,11, 0);
			me.SetTask(9171, 30, 0); -- Reset số lượt miễn phí trong ngày
end 
for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu_VanTieu then
			Dialog:Say("Bạn không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu_VanTieu.." <color>điểm Tài Phú để tham gia Vận Lương \nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color> <color>");
			return 0;
	end
end
		if nGioiHanNgay >= 3 then 
			me.Msg("<color=yellow> Hôm nay bạn đã vận tối đa 3 lần Lương ngày mai hãy quay lại đây")
			return 
		end
	local szMsg = "<color=gold>Nhiệm vụ vận Lương ngày:\n<color>\n<color=green>Quy Tắc : \n<color>*Mỗi ngày số lượt vận Lương là 3 lần\n*1 Lượt đầu free\n*2 Lần sau 15 vạn 1 lượt\n*Làm mới Lương tốn 5 vạn đồng / lượt\n<color=green>Nhân Vật<color> :\n*Số lượt vận Lương hôm nay : <color=yellow>"..nGioiHanNgay.."/3<color> lần\nNếu không làm mới thì Lương sẽ xuất hiện : "..nTieuXa..""
    local tbOpt =     {} 
	-- if (me.szName == "TCQGaming") then
			table.insert(tbOpt,{"<color=yellow>Xem phần thưởng các loại Lương Xa<color>",self.xemphanthuong, self});	
			table.insert(tbOpt, {"Nhận <color=gold>Nhiệm Vụ Vận Lương", SpecialEvent.VanTieu.OnDialog, SpecialEvent.VanTieu});
	-- end 					
			table.insert(tbOpt, {"Quay lại"});
		    Dialog:Say(szMsg, tbOpt)
end
function tbTieuCuc:xemphanthuong()
local nTenBang = "Danh sách thưởng các loại Lương"
local szTitle = "Lương Trắng:\n<color=red>1 Huyền Tinh 6(khóa)\n1 Điểm Danh Vọng Đoàn Viên (cộng thẳng vào nhân vật)\n"..
						"<color=blue>Lương Lam:\n<color><color=red>2 Huyền Tinh cấp 6(Khóa)\n3 Điểm Danh Vọng Đoàn Viên(cộng thẳng vào nhân vật)\n"..
						"<color=gold>Lương Cam:\n<color><color=red>3 Huyền Tinh cấp 6(Khóa)\n5 Điểm Danh Vọng Đoàn Viên(cộng thẳng vào nhân vật)\n"..
						"Tỉ lệ ngẫu nhiên nhận được lệnh bài Vận Lương(không khóa) \nLệnh Bài Vận Lương : Khi sử dụng nhận 1 điểm đoàn viên dân tộc"..
										"";
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end 