-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbLyTamThach = Item:GetClass("lytamthach");

function tbLyTamThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\lytamthach_chimang.lua");
	local nLevelTrangSuc_CM = it.nLevel
local nDayChuyen_CM = me.GetTask(9183,35)
local nNhan_CM = me.GetTask(9183,36)
local nBoi_CM = me.GetTask(9183,37)
local nPhu_CM = me.GetTask(9183,38)

	local nSkillCount = 0
	local nTen_CM = ""
				if (nLevelTrangSuc_CM == 1) then
		nSkillCount = 1
				nTen_CM = "Ly Tâm Thạch (vỡ) (cấp 1)"
		elseif (nLevelTrangSuc_CM == 2) then
		nSkillCount = 2
				nTen_CM = "Ly Tâm Thạch (mòn) (cấp 2)"
		elseif (nLevelTrangSuc_CM == 3) then
		nSkillCount = 3
				nTen_CM = "Ly Tâm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelTrangSuc_CM == 4) then
		nSkillCount = 4
				nTen_CM = "Ly Tâm Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelTrangSuc_CM == 5) then
		nSkillCount = 5
				nTen_CM = "Ly Tâm Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelTrangSuc_CM == 6) then
		nSkillCount = 6
				nTen_CM = "Ly Tâm Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelTrangSuc_CM == 7) then
		nSkillCount = 7
				nTen_CM = "Ly Tâm Thạch (lung linh) (Cấp 7)"
		elseif (nLevelTrangSuc_CM == 8) then
		nSkillCount = 8
				nTen_CM = "Ly Tâm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelTrangSuc_CM == 9) then
		nSkillCount = 9
				nTen_CM = "Ly Tâm Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelTrangSuc_CM == 10) then
		nSkillCount = 10
				nTen_CM = "Ly Tâm Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_CM.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho trang sức\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
			if nDayChuyen_CM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Dây Chuyền :\n<color=yellow>"..nTen_CM.."<color> Tăng CM",self.khamdaychuyen,self,nTen_CM,nSkillCount,nLevelTrangSuc_CM});
	else
				table.insert(tbOpt, {"Vị trí Dây Chuyền đã khảm"});
	end 
			if nNhan_CM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nhẫn :\n<color=yellow>"..nTen_CM.."<color> Tăng CM",self.khamnhan,self,nTen_CM,nSkillCount,nLevelTrangSuc_CM});
	else
				table.insert(tbOpt, {"Vị trí Nhẫn đã khảm"});
	end 
			if nBoi_CM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngọc Bội :\n<color=yellow>"..nTen_CM.."<color> Tăng CM",self.khamboi,self,nTen_CM,nSkillCount,nLevelTrangSuc_CM});
	else
				table.insert(tbOpt, {"Vị trí Ngọc Bội đã khảm"});
	end 
			if nPhu_CM < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Phù :\n<color=yellow>"..nTen_CM.."<color> Tăng CM",self.khamphu,self,nTen_CM,nSkillCount,nLevelTrangSuc_CM});
	else
				table.insert(tbOpt, {"Vị trí Phù đã khảm"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_CM + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Ly Tâm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Ly Tâm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Ly Tâm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Ly Tâm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Ly Tâm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Ly Tâm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Ly Tâm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Ly Tâm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Ly Tâm Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1310,nLevelTrangSuc_CM)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_CM,nLevelTrangSuc_CM});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_CM,nSoLuongDaKham,nLevelTrangSuc_CM});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbLyTamThach:nangcapall(nTen_CM,nSoLuongDaKham,nLevelTrangSuc_CM)
if nLevelTrangSuc_CM == 10 then 
me.Msg("<color=yellow>"..nTen_CM.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1310,nLevelTrangSuc_CM) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_CM.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_CMPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_CM + 1
		if (nCapBacKeTiep == 2) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_CMPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1310,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_CM.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_CMPC_BacTiep.."<color> ")
end 

function tbLyTamThach:nangcap(nTen_CM,nLevelTrangSuc_CM)
if nLevelTrangSuc_CM == 10 then 
me.Msg("<color=yellow>"..nTen_CM.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1310,nLevelTrangSuc_CM) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_CM.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_CMPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTrangSuc_CM + 1
		if (nCapBacKeTiep == 2) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_CMPC_BacTiep = "Ly Tâm Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_CMPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1310,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_CM.."<color> thành công lên <color=yellow>"..nTen_CMPC_BacTiep.."<color> ")
end 
function tbLyTamThach:khamdaychuyen(nTen_CM,nSkillCount,nLevelTrangSuc_CM)
	local nDayChuyen_ViTri_A = me.GetTask(9184,4)
	if nDayChuyen_ViTri_A == 0 then 
	Dialog:Say("Hạng Liên dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,35,1)
	me.AddFightSkill(1885,nSkillCount);
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_CM.." vào Hạng Liên")
end 
function tbLyTamThach:khamnhan(nTen_CM,nSkillCount,nLevelTrangSuc_CM)
	local nNhan_ViTri_A = me.GetTask(9184,7)
	if nNhan_ViTri_A == 0 then 
	Dialog:Say("Nhẫn  dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,36,1)
	me.AddFightSkill(1888,nSkillCount);
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_CM.." vào Nhẫn")
end 
function tbLyTamThach:khamboi(nTen_CM,nSkillCount,nLevelTrangSuc_CM)
	local nBoi_ViTri_A = me.GetTask(9184,10)
	if nBoi_ViTri_A == 0 then 
	Dialog:Say("Ngọc Bội dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,37,1)
	me.AddFightSkill(1891,nSkillCount);
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_CM.." vào Ngọc Bội")
end 
function tbLyTamThach:khamphu(nTen_CM,nSkillCount,nLevelTrangSuc_CM)
	local nPhu_ViTri_A = me.GetTask(9184,13)
	if nPhu_ViTri_A == 0 then 
	Dialog:Say("Hộ Thân Phù dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,38,1)
	me.AddFightSkill(1894,nSkillCount);
	 local tbItemId	= {18,1,1310,nLevelTrangSuc_CM,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_CM.." vào Hộ Thân Phù")
end 