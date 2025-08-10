-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbHuyenDuongNgoc = Item:GetClass("huyenduongngoc");

function tbHuyenDuongNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\huyenduongngoc.lua");
	local nLevelNguaCuongNhuoc = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenNguaCuongNhuoc = ""
				if (nLevelNguaCuongNhuoc == 1) then
		nSkillCount = 1
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (vỡ) (cấp 1)"
		elseif (nLevelNguaCuongNhuoc == 2) then
		nSkillCount = 2
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (mòn) (cấp 2)"
		elseif (nLevelNguaCuongNhuoc == 3) then
		nSkillCount = 3
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelNguaCuongNhuoc == 4) then
		nSkillCount = 4
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelNguaCuongNhuoc == 5) then
		nSkillCount = 5
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelNguaCuongNhuoc == 6) then
		nSkillCount = 6
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelNguaCuongNhuoc == 7) then
		nSkillCount = 7
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelNguaCuongNhuoc == 8) then
		nSkillCount = 8
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelNguaCuongNhuoc == 9) then
		nSkillCount = 9
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelNguaCuongNhuoc == 10) then
		nSkillCount = 10
				nTenNguaCuongNhuoc = "Huyền Dương Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenNguaCuongNhuoc.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nNgua_CuongNhuoc_Hoa < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenNguaCuongNhuoc.."<color> Tăng Vật Công",self.khamnam,self,nTenNguaCuongNhuoc,nSkillCount,nLevelNguaCuongNhuoc});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaCuongNhuoc + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Huyền Dương Ngọc (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1318,nLevelNguaCuongNhuoc)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenNguaCuongNhuoc,nLevelNguaCuongNhuoc});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenNguaCuongNhuoc,nSoLuongDaKham,nLevelNguaCuongNhuoc});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbHuyenDuongNgoc:nangcapall(nTenNguaCuongNhuoc,nSoLuongDaKham,nLevelNguaCuongNhuoc)
if nLevelNguaCuongNhuoc == 10 then 
me.Msg("<color=yellow>"..nTenNguaCuongNhuoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1318,nLevelNguaCuongNhuoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenNguaCuongNhuoc.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenNguaCuongNhuocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaCuongNhuoc + 1
		if (nCapBacKeTiep == 2) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenNguaCuongNhuocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1318,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1318,nLevelNguaCuongNhuoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenNguaCuongNhuoc.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenNguaCuongNhuocPC_BacTiep.."<color> ")
end 

function tbHuyenDuongNgoc:nangcap(nTenNguaCuongNhuoc,nLevelNguaCuongNhuoc)
if nLevelNguaCuongNhuoc == 10 then 
me.Msg("<color=yellow>"..nTenNguaCuongNhuoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1318,nLevelNguaCuongNhuoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenNguaCuongNhuoc.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenNguaCuongNhuocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaCuongNhuoc + 1
		if (nCapBacKeTiep == 2) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenNguaCuongNhuocPC_BacTiep = "Huyền Dương Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenNguaCuongNhuocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1318,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1318,nLevelNguaCuongNhuoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenNguaCuongNhuoc.."<color> thành công lên <color=yellow>"..nTenNguaCuongNhuocPC_BacTiep.."<color> ")
end 
function tbHuyenDuongNgoc:khamnam(nTenNguaCuongNhuoc,nSkillCount,nLevelNguaCuongNhuoc)
	local nNgua_ViTri_C = me.GetTask(9184,33)
	if nNgua_ViTri_C == 0 then 
	Dialog:Say("Ngựa dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,6,1)
	me.AddFightSkill(1907,nSkillCount);
	 local tbItemId	= {18,1,1318,nLevelNguaCuongNhuoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenNguaCuongNhuoc.." vào Ngựa")
end 
