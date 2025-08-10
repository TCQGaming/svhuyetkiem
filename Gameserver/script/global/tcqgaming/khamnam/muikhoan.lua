-----Dev : TCQGaming
-----Time : 13/03/2024 9:19 PM
local tbMuiKhoan = Item:GetClass("muikhoankimcuongtcq");

function tbMuiKhoan:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\muikhoan.lua");
	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho trang bị nào ?";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Vũ Khí",self.ducvk,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Hạng Liên",self.duclien,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Nhẫn",self.ducnhan,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Ngọc Bội",self.ducboi,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Hộ Thân Phù",self.ducphu,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Nón",self.ducnon,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Áo",self.ducao,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Đai Lưng",self.ducdai,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Hộ Uyển",self.ductay,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Giày",self.ducgiay,self});
			table.insert(tbOpt, {"<color=yellow>Đục Lỗ Ngựa",self.ducngua,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbMuiKhoan:ducvk()
	local nVK_ViTri_A = me.GetTask(9184,1)
	local nVK_ViTri_B = me.GetTask(9184,2)
	local nVK_ViTri_C = me.GetTask(9184,3)
	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho trang bị nào ?";
    local tbOpt =     {} 
	if nVK_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Vũ Khí<color=yellow> Dòng 1",self.ducvk1,self});
	else
				table.insert(tbOpt, {"Vũ Khí Dòng 1 Đã Đục Lỗ"});
	end
	if nVK_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Vũ Khí<color=yellow> Dòng 2",self.ducvk2,self});
	else
				table.insert(tbOpt, {"Vũ Khí Dòng 1 Đã Đục Lỗ"});
	end 
	if nVK_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Vũ Khí<color=yellow> Dòng 3",self.ducvk3,self});
	else
				table.insert(tbOpt, {"Vũ Khí Dòng 1 Đã Đục Lỗ"});
	end 	
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 
function tbMuiKhoan:ducngua()
	local nNgua_ViTri_A = me.GetTask(9184,31)
	local nNgua_ViTri_B = me.GetTask(9184,32)
	local nNgua_ViTri_C = me.GetTask(9184,33)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nNgua_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngựa<color=yellow> Dòng 1",self.ducngua1,self});
	else
				table.insert(tbOpt, {"Ngựa Dòng 1 đã đục lỗ"});
	end
	if nNgua_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngựa<color=yellow> Dòng 2",self.ducngua2,self});
	else
				table.insert(tbOpt, {"Ngựa Dòng 2 đã đục lỗ"});
	end 
	if nNgua_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngựa<color=yellow> Dòng 3",self.ducngua3,self});
	else
				table.insert(tbOpt, {"Ngựa Dòng 3 đã đục lỗ"});
	end 	
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducngua1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,31,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Ngựa bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducngua2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,32,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Ngựa bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducngua3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,33,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Ngựa bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducgiay()
	local nGiay_ViTri_A = me.GetTask(9184,28)
	local nGiay_ViTri_B = me.GetTask(9184,29)
	local nGiay_ViTri_C = me.GetTask(9184,30)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nGiay_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Giày<color=yellow> Dòng 1",self.ducgiay1,self});
	else
				table.insert(tbOpt, {"Giày Dòng 1 đã đục lỗ"});
	end
	if nGiay_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Giày<color=yellow> Dòng 2",self.ducgiay2,self});
	else
				table.insert(tbOpt, {"Giày Dòng 2 đã đục lỗ"});
	end 
	if nGiay_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Giày<color=yellow> Dòng 3",self.ducgiay3,self});
	else
				table.insert(tbOpt, {"Giày Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducgiay1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,28,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Giày bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducgiay2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,29,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Giày bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducgiay3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,30,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Giày bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ductay()
	local nTay_ViTri_A = me.GetTask(9184,25)
	local nTay_ViTri_B = me.GetTask(9184,26)
	local nTay_ViTri_C = me.GetTask(9184,27)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nTay_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Uyển<color=yellow> Dòng 1",self.ductay1,self});
	else
				table.insert(tbOpt, {"Hộ Uyển Dòng 1 đã đục lỗ"});
	end
	if nTay_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Uyển<color=yellow> Dòng 2",self.ductay2,self});
	else
				table.insert(tbOpt, {"Hộ Uyển Dòng 2 đã đục lỗ"});
	end 
	if nTay_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Uyển<color=yellow> Dòng 3",self.ductay3,self});
	else
				table.insert(tbOpt, {"Hộ Uyển Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ductay1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,25,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Hộ Uyển bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ductay2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,26,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Hộ Uyển bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ductay3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,27,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Hộ Uyển bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducdai()
	local nDaiLung_ViTri_A = me.GetTask(9184,22)
	local nDaiLung_ViTri_B = me.GetTask(9184,23)
	local nDaiLung_ViTri_C = me.GetTask(9184,24)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nDaiLung_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Đai Lưng<color=yellow> Dòng 1",self.ducdai1,self});
	else
				table.insert(tbOpt, {"Đai Lưng Dòng 1 đã đục lỗ"});
	end
	if nDaiLung_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Đai Lưng<color=yellow> Dòng 2",self.ducdai2,self});
	else
				table.insert(tbOpt, {"Đai Lưng Dòng 2 đã đục lỗ"});
	end 
	if nDaiLung_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Đai Lưng<color=yellow> Dòng 3",self.ducdai3,self});
	else
				table.insert(tbOpt, {"Đai Lưng Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducdai1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,22,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Đai Lưng bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducdai2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,23,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Đai Lưng bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducdai3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,24,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Đai Lưng bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducao()
	local nAo_ViTri_A = me.GetTask(9184,19)
	local nAo_ViTri_B = me.GetTask(9184,20)
	local nAo_ViTri_C = me.GetTask(9184,21)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nAo_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Áo<color=yellow> Dòng 1",self.ducao1,self});
	else
				table.insert(tbOpt, {"Áo Dòng 1 đã đục lỗ"});
	end
	if nAo_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Áo<color=yellow> Dòng 2",self.ducao2,self});
	else
				table.insert(tbOpt, {"Áo Dòng 2 đã đục lỗ"});
	end 
	if nAo_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Áo<color=yellow> Dòng 3",self.ducao3,self});
	else
				table.insert(tbOpt, {"Áo Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducao1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,19,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Áo bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducao2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,20,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Áo bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducao3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,21,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Áo bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducnon()
	local nNon_ViTri_A = me.GetTask(9184,16)
	local nNon_ViTri_B = me.GetTask(9184,17)
	local nNon_ViTri_C = me.GetTask(9184,18)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nNon_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nón<color=yellow> Dòng 1",self.ducnon1,self});
	else
				table.insert(tbOpt, {"Nón Dòng 1 đã đục lỗ"});
	end
	if nNon_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nón<color=yellow> Dòng 2",self.ducnon2,self});
	else
				table.insert(tbOpt, {"Nón Dòng 2 đã đục lỗ"});
	end 
	if nNon_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nón<color=yellow> Dòng 3",self.ducnon3,self});
	else
				table.insert(tbOpt, {"Nón Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducnon1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,16,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Nón bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducnon2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,17,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Nón bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducnon3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,18,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Nón bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducphu()
	local nPhu_ViTri_A = me.GetTask(9184,13)
	local nPhu_ViTri_B = me.GetTask(9184,14)
	local nPhu_ViTri_C = me.GetTask(9184,15)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nPhu_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Thân Phù<color=yellow> Dòng 1",self.ducphu1,self});
	else
				table.insert(tbOpt, {"Hộ Thân Phù Dòng 1 đã đục lỗ"});
	end
	if nPhu_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Thân Phù<color=yellow> Dòng 2",self.ducphu2,self});
	else
				table.insert(tbOpt, {"Hộ Thân Phù Dòng 2 đã đục lỗ"});
	end 
	if nPhu_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hộ Thân Phù<color=yellow> Dòng 3",self.ducphu3,self});
	else
				table.insert(tbOpt, {"Hộ Thân Phù Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducphu1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,13,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Hộ Thân Phù bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducphu2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,14,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Hộ Thân Phù bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducphu3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,15,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Hộ Thân Phù bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducboi()
	local nBoi_ViTri_A = me.GetTask(9184,10)
	local nBoi_ViTri_B = me.GetTask(9184,11)
	local nBoi_ViTri_C = me.GetTask(9184,12)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nBoi_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngọc Bội<color=yellow> Dòng 1",self.ducboi1,self});
	else
				table.insert(tbOpt, {"Ngọc Bội Dòng 1 đã đục lỗ"});
	end
	if nBoi_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngọc Bội<color=yellow> Dòng 2",self.ducboi2,self});
	else
				table.insert(tbOpt, {"Ngọc Bội Dòng 2 đã đục lỗ"});
	end 
	if nBoi_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Ngọc Bội<color=yellow> Dòng 3",self.ducboi3,self});
	else
				table.insert(tbOpt, {"Ngọc Bội Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducboi1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,10,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Ngọc Bội bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducboi2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,11,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Ngọc Bội bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducboi3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,12,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Ngọc Bội bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:duclien()
	local nDayChuyen_ViTri_A = me.GetTask(9184,4)
	local nDayChuyen_ViTri_B = me.GetTask(9184,5)
	local nDayChuyen_ViTri_C = me.GetTask(9184,6)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nDayChuyen_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hạng Liên<color=yellow> Dòng 1",self.duclien1,self});
	else
				table.insert(tbOpt, {"Hạng Liên Dòng 1 đã đục lỗ"});
	end
	if nDayChuyen_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hạng Liên<color=yellow> Dòng 2",self.duclien2,self});
	else
				table.insert(tbOpt, {"Hạng Liên Dòng 2 đã đục lỗ"});
	end 
	if nDayChuyen_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Hạng Liên<color=yellow> Dòng 3",self.duclien3,self});
	else
				table.insert(tbOpt, {"Hạng Liên Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 
function tbMuiKhoan:ducnhan()
	local nNhan_ViTri_A = me.GetTask(9184,7)
	local nNhan_ViTri_B = me.GetTask(9184,8)
	local nNhan_ViTri_C = me.GetTask(9184,9)

	local szMsg = "<color=yellow>Bạn muốn Đục Lỗ cho dòng nào ?\n<color><color=red>Quy Tắc :\nDòng 1 : Cần 1 Khoan\nDòng 2 : Cần 3 Khoan\nDòng 3 : Cần 6 Khoan\n";
    local tbOpt =     {} 
	if nNhan_ViTri_A < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nhẫn<color=yellow> Dòng 1",self.ducnhan1,self});
	else
				table.insert(tbOpt, {"Nhẫn Dòng 1 đã đục lỗ"});
	end
	if nNhan_ViTri_B < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nhẫn<color=yellow> Dòng 2",self.ducnhan2,self});
	else
				table.insert(tbOpt, {"Nhẫn Dòng 2 đã đục lỗ"});
	end 
	if nNhan_ViTri_C < 1 then 
			table.insert(tbOpt, {"Đục Lỗ Nhẫn<color=yellow> Dòng 3",self.ducnhan3,self});
	else
				table.insert(tbOpt, {"Nhẫn Dòng 3 đã đục lỗ"});
	end 	

    Dialog:Say(szMsg, tbOpt)
end 

function tbMuiKhoan:ducnhan1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,7,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 Nhẫn bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducnhan2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,8,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 Nhẫn bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducnhan3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,9,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 Nhẫn bạn có thể khảm nạm rồi")
end 

function tbMuiKhoan:duclien1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,4,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 hạng liên bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:duclien2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,5,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 hạng liên bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:duclien3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,6,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 hạng liên bạn có thể khảm nạm rồi")
end 

function tbMuiKhoan:ducvk1()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ mũi khoan rồi")
return 
end 
	me.SetTask(9184,1,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 1); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 1 vũ khí bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducvk2()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 3 then 
Dialog:Say("Rất tiếc bạn không đủ 3 mũi khoan rồi")
return 
end 
	me.SetTask(9184,2,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 3); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 2 vũ khí bạn có thể khảm nạm rồi")
end 
function tbMuiKhoan:ducvk3()
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,1) -- Khoan kim cương
if nNguyenLieu < 6 then 
Dialog:Say("Rất tiếc bạn không đủ 6 mũi khoan rồi")
return 
end 
	me.SetTask(9184,3,1)
	 local tbItemId	= {18,1,1320,1,0,0};  -- Khoan kim cương
	 Task:DelItem(me, tbItemId, 6); 
	me.Msg("<color=cyan>Đục lỗ thành công dòng 3 vũ khí bạn có thể khảm nạm rồi")
end 
