-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbThienCoThach = Item:GetClass("thiencothach");

function tbThienCoThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\thiencothach_giamchimang.lua");
	local nLevelTrangSuc_GiamCM = it.nLevel
local nDayChuyen_giamCM = me.GetTask(9183,31)
local nNhan_giamCM = me.GetTask(9183,32)
local nBoi_giamCM = me.GetTask(9183,33)
local nPhu_giamCM = me.GetTask(9183,34)

	local nSkillCount = 0
	local nTen_GiamCM = ""
				if (nLevelTrangSuc_GiamCM == 1) then
		nSkillCount = 1
				nTen_GiamCM = "Thiên Cơ Thạch (vỡ) (cấp 1)"
		elseif (nLevelTrangSuc_GiamCM == 2) then
		nSkillCount = 2
				nTen_GiamCM = "Thiên Cơ Thạch (mòn) (cấp 2)"
		elseif (nLevelTrangSuc_GiamCM == 3) then
		nSkillCount = 3
				nTen_GiamCM = "Thiên Cơ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelTrangSuc_GiamCM == 4) then
		nSkillCount = 4
				nTen_GiamCM = "Thiên Cơ Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelTrangSuc_GiamCM == 5) then
		nSkillCount = 5
				nTen_GiamCM = "Thiên Cơ Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelTrangSuc_GiamCM == 6) then
		nSkillCount = 6
				nTen_GiamCM = "Thiên Cơ Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelTrangSuc_GiamCM == 7) then
		nSkillCount = 7
				nTen_GiamCM = "Thiên Cơ Thạch (lung linh) (Cấp 7)"
		elseif (nLevelTrangSuc_GiamCM == 8) then
		nSkillCount = 8
				nTen_GiamCM = "Thiên Cơ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelTrangSuc_GiamCM == 9) then
		nSkillCount = 9
				nTen_GiamCM = "Thiên Cơ Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelTrangSuc_GiamCM == 10) then
		nSkillCount = 10
				nTen_GiamCM = "Thiên Cơ Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_GiamCM.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Trang Sức\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
			if nDayChuyen_giamCM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Dây Chuyền :\n<color=yellow>"..nTen_GiamCM.."<color> Giảm CM",self.khamdaychuyen,self,nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM});
	else
				table.insert(tbOpt, {"Vị trí Dây Chuyền đã khảm"});
	end 
			if nNhan_giamCM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nhẫn :\n<color=yellow>"..nTen_GiamCM.."<color> Giảm CM",self.khamnhan,self,nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM});
	else
				table.insert(tbOpt, {"Vị trí Nhẫn đã khảm"});
	end 
			if nBoi_giamCM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngọc Bội :\n<color=yellow>"..nTen_GiamCM.."<color> Giảm CM",self.khamboi,self,nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM});
	else
				table.insert(tbOpt, {"Vị trí Ngọc Bội đã khảm"});
	end 
			if nPhu_giamCM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Phù :\n<color=yellow>"..nTen_GiamCM.."<color> Giảm CM",self.khamphu,self,nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM});
	else
				table.insert(tbOpt, {"Vị trí Phù đã khảm"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_GiamCM + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Thiên Cơ Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1319,nLevelTrangSuc_GiamCM)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_GiamCM,nLevelTrangSuc_GiamCM});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_GiamCM,nSoLuongDaKham,nLevelTrangSuc_GiamCM});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbThienCoThach:nangcapall(nTen_GiamCM,nSoLuongDaKham,nLevelTrangSuc_GiamCM)
if nLevelTrangSuc_GiamCM == 10 then 
me.Msg("<color=yellow>"..nTen_GiamCM.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1319,nLevelTrangSuc_GiamCM) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_GiamCM.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_GiamCMPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_GiamCM + 1
		if (nCapBacKeTiep == 2) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_GiamCMPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1319,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_GiamCM.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_GiamCMPC_BacTiep.."<color> ")
end 

function tbThienCoThach:nangcap(nTen_GiamCM,nLevelTrangSuc_GiamCM)
if nLevelTrangSuc_GiamCM == 10 then 
me.Msg("<color=yellow>"..nTen_GiamCM.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1319,nLevelTrangSuc_GiamCM) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_GiamCM.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_GiamCMPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_GiamCM + 1
		if (nCapBacKeTiep == 2) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_GiamCMPC_BacTiep = "Thiên Cơ Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_GiamCMPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1319,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_GiamCM.."<color> thành công lên <color=yellow>"..nTen_GiamCMPC_BacTiep.."<color> ")
end 
function tbThienCoThach:khamdaychuyen(nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM)
	local nDayChuyen_ViTri_B = me.GetTask(9184,5)
	if nDayChuyen_ViTri_B == 0 then 
	Dialog:Say("Hạng Liên dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,31,1)
	me.AddFightSkill(1886,nSkillCount);
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_GiamCM.." vào Hạng Liên")
end 
function tbThienCoThach:khamnhan(nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM)
	local nNhan_ViTri_B = me.GetTask(9184,8)
	if nNhan_ViTri_B == 0 then 
	Dialog:Say("Nhẫn dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,32,1)
	me.AddFightSkill(1889,nSkillCount);
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_GiamCM.." vào Nhẫn")
end 
function tbThienCoThach:khamboi(nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM)
	local nBoi_ViTri_B = me.GetTask(9184,11)
	if nBoi_ViTri_B == 0 then 
	Dialog:Say("Ngọc Bội dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,33,1)
	me.AddFightSkill(1892,nSkillCount);
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_GiamCM.." vào Ngọc Bội")
end 
function tbThienCoThach:khamphu(nTen_GiamCM,nSkillCount,nLevelTrangSuc_GiamCM)
	local nPhu_ViTri_B = me.GetTask(9184,14)
	if nPhu_ViTri_B == 0 then 
	Dialog:Say("Hộ Thân Phù dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,34,1)
	me.AddFightSkill(1895,nSkillCount);
	 local tbItemId	= {18,1,1319,nLevelTrangSuc_GiamCM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_GiamCM.." vào Hộ Thân Phù")
end 