-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbLangThienNgoc = Item:GetClass("langthienngoc");

function tbLangThienNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\langthienngoc_ktc.lua");
	local nLevelTrangBi_KTC = it.nLevel
local nNon_ktc = me.GetTask(9183,17)
local nAo_ktc = me.GetTask(9183,18)
local nDai_ktc = me.GetTask(9183,19)
local nTay_ktc = me.GetTask(9183,20)
local nGiay_ktc = me.GetTask(9183,21)
local nDayChuyen_ktc = me.GetTask(9183,22)
local nNhan_ktc = me.GetTask(9183,23)
local nBoi_ktc = me.GetTask(9183,24)
local nPhu_ktc = me.GetTask(9183,25)

	local nSkillCount = 0
	local nTen_KTC = ""
				if (nLevelTrangBi_KTC == 1) then
		nSkillCount = 1
				nTen_KTC = "Lăng Thiên Ngọc (vỡ) (cấp 1)"
		elseif (nLevelTrangBi_KTC == 2) then
		nSkillCount = 2
				nTen_KTC = "Lăng Thiên Ngọc (mòn) (cấp 2)"
		elseif (nLevelTrangBi_KTC == 3) then
		nSkillCount = 3
				nTen_KTC = "Lăng Thiên Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelTrangBi_KTC == 4) then
		nSkillCount = 4
				nTen_KTC = "Lăng Thiên Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelTrangBi_KTC == 5) then
		nSkillCount = 5
				nTen_KTC = "Lăng Thiên Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelTrangBi_KTC == 6) then
		nSkillCount = 6
				nTen_KTC = "Lăng Thiên Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelTrangBi_KTC == 7) then
		nSkillCount = 7
				nTen_KTC = "Lăng Thiên Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelTrangBi_KTC == 8) then
		nSkillCount = 8
				nTen_KTC = "Lăng Thiên Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelTrangBi_KTC == 9) then
		nSkillCount = 9
				nTen_KTC = "Lăng Thiên Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelTrangBi_KTC == 10) then
		nSkillCount = 10
				nTen_KTC = "Lăng Thiên Ngọc (vô song) (Cấp 10)"
		end 
		

	local szMsg = "<color=yellow>"..nTen_KTC.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho trang bị";
    local tbOpt =     {} 
	if nNon_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nón :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamnon,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí nón đã khảm"});
	end 
		if nAo_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Áo :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamao,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Áo đã khảm"});
	end 
		if nDai_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Đai Lưng :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamdai,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Đai Lưng đã khảm"});
	end 
		if nTay_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Hộ Uyển :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamtay,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Hộ Uyển đã khảm"});
	end 
		if nGiay_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Giày :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamgiay,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Giày đã khảm"});
	end 
			if nDayChuyen_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Dây Chuyền :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamdaychuyen,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Dây Chuyền đã khảm"});
	end 
			if nNhan_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nhẫn :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamnhan,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Nhẫn đã khảm"});
	end 
			if nBoi_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngọc Bội :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamboi,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Ngọc Bội đã khảm"});
	end 
			if nPhu_ktc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Phù :\n<color=yellow>"..nTen_KTC.."<color> KTC",self.khamphu,self,nTen_KTC,nSkillCount,nLevelTrangBi_KTC});
	else
				table.insert(tbOpt, {"Vị trí Phù đã khảm"});
	end 
		local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangBi_KTC + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1302,nLevelTrangBi_KTC)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KTC,nLevelTrangBi_KTC});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KTC,nSoLuongDaKham,nLevelTrangBi_KTC});
			end 
    Dialog:Say(szMsg, tbOpt)
end
function tbLangThienNgoc:nangcapall(nTen_KTC,nSoLuongDaKham,nLevelTrangBi_KTC)
if nLevelTrangBi_KTC == 10 then 
me.Msg("<color=yellow>"..nTen_KTC.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1302,nLevelTrangBi_KTC) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KTC.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangBi_KTC + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1302,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KTC.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenPC_BacTiep.."<color> ")
end 

function tbLangThienNgoc:nangcap(nTen_KTC,nLevelTrangBi_KTC)
if nLevelTrangBi_KTC == 10 then 
me.Msg("<color=yellow>"..nTen_KTC.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1302,nLevelTrangBi_KTC) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KTC.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangBi_KTC + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Lăng Thiên Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1302,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KTC.."<color> thành công lên <color=yellow>"..nTenPC_BacTiep.."<color> ")
end 
function tbLangThienNgoc:khamnon(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nNon_ViTri_B = me.GetTask(9184,17)
	if nNon_ViTri_B == 0 then 
	Dialog:Say("nón dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,17,1)
	me.AddFightSkill(1868,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào nón")
end 
function tbLangThienNgoc:khamao(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nAo_ViTri_B = me.GetTask(9184,20)
	if nAo_ViTri_B == 0 then 
	Dialog:Say("áo dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,18,1)
	me.AddFightSkill(1871,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào áo")
end 
function tbLangThienNgoc:khamdai(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nDaiLung_ViTri_B = me.GetTask(9184,23)
	if nDaiLung_ViTri_B == 0 then 
	Dialog:Say("Đai Lưng dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,19,1)
	me.AddFightSkill(1874,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào Đai Lưng")
end 
function tbLangThienNgoc:khamtay(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nTay_ViTri_B = me.GetTask(9184,26)
	if nTay_ViTri_B == 0 then 
	Dialog:Say("hộ uyển dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,20,1)
	me.AddFightSkill(1877,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào hộ uyển")
end 
function tbLangThienNgoc:khamgiay(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nGiay_ViTri_B = me.GetTask(9184,29)
	if nGiay_ViTri_B == 0 then 
	Dialog:Say("giày dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,21,1)
	me.AddFightSkill(1880,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào giày")
end 
function tbLangThienNgoc:khamdaychuyen(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nDayChuyen_ViTri_C = me.GetTask(9184,6)
	if nDayChuyen_ViTri_C == 0 then 
	Dialog:Say("Hạng Liên dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,22,1)
	me.AddFightSkill(1887,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào Hạng Liên")
end 
function tbLangThienNgoc:khamnhan(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nNhan_ViTri_C = me.GetTask(9184,9)
	if nNhan_ViTri_C == 0 then 
	Dialog:Say("Nhẫn dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,23,1)
	me.AddFightSkill(1890,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào Nhẫn")
end 
function tbLangThienNgoc:khamboi(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nBoi_ViTri_C = me.GetTask(9184,12)
	if nBoi_ViTri_C == 0 then 
	Dialog:Say("Ngọc Bội dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,24,1)
	me.AddFightSkill(1893,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào Ngọc Bội")
end 
function tbLangThienNgoc:khamphu(nTen_KTC,nSkillCount,nLevelTrangBi_KTC)
	local nPhu_ViTri_C = me.GetTask(9184,15)
	if nPhu_ViTri_C == 0 then 
	Dialog:Say("Hộ Thân Phù dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,25,1)
	me.AddFightSkill(1896,nSkillCount);
	 local tbItemId	= {18,1,1302,nLevelTrangBi_KTC,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KTC.." vào Hộ Thân Phù")
end 