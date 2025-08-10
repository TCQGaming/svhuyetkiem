-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbCuongLoiNgoc = Item:GetClass("cuongloingoc");

function tbCuongLoiNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\cuongloingoc.lua");
	local nLevelKhangLoi = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenKhangLoi = ""
				if (nLevelKhangLoi == 1) then
		nSkillCount = 1
				nTenKhangLoi = "Cuồng Lôi Ngọc (vỡ) (cấp 1)"
		elseif (nLevelKhangLoi == 2) then
		nSkillCount = 2
				nTenKhangLoi = "Cuồng Lôi Ngọc (mòn) (cấp 2)"
		elseif (nLevelKhangLoi == 3) then
		nSkillCount = 3
				nTenKhangLoi = "Cuồng Lôi Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelKhangLoi == 4) then
		nSkillCount = 4
				nTenKhangLoi = "Cuồng Lôi Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelKhangLoi == 5) then
		nSkillCount = 5
				nTenKhangLoi = "Cuồng Lôi Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelKhangLoi == 6) then
		nSkillCount = 6
				nTenKhangLoi = "Cuồng Lôi Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelKhangLoi == 7) then
		nSkillCount = 7
				nTenKhangLoi = "Cuồng Lôi Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelKhangLoi == 8) then
		nSkillCount = 8
				nTenKhangLoi = "Cuồng Lôi Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelKhangLoi == 9) then
		nSkillCount = 9
				nTenKhangLoi = "Cuồng Lôi Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelKhangLoi == 10) then
		nSkillCount = 10
				nTenKhangLoi = "Cuồng Lôi Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenKhangLoi.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
  
    local tbOpt =     {} 
	if nNgua_Khang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenKhangLoi.."<color> Chịu st lôi công",self.khamnam,self,nTenKhangLoi,nSkillCount,nLevelKhangLoi});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Cuồng Lôi Ngọc (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1316,nLevelKhangLoi)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenKhangLoi,nLevelKhangLoi});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenKhangLoi,nSoLuongDaKham,nLevelKhangLoi});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbCuongLoiNgoc:nangcapall(nTenKhangLoi,nSoLuongDaKham,nLevelKhangLoi)
if nLevelKhangLoi == 10 then 
me.Msg("<color=yellow>"..nTenKhangLoi.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1316,nLevelKhangLoi) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangLoi.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenKhangLoiPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangLoiPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1316,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1316,nLevelKhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenKhangLoi.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenKhangLoiPC_BacTiep.."<color> ")
end 

function tbCuongLoiNgoc:nangcap(nTenKhangLoi,nLevelKhangLoi)
if nLevelKhangLoi == 10 then 
me.Msg("<color=yellow>"..nTenKhangLoi.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1316,nLevelKhangLoi) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangLoi.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenKhangLoiPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangLoiPC_BacTiep = "Cuồng Lôi Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangLoiPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1316,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1316,nLevelKhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenKhangLoi.."<color> thành công lên <color=yellow>"..nTenKhangLoiPC_BacTiep.."<color> ")
end 
function tbCuongLoiNgoc:khamnam(nTenKhangLoi,nSkillCount,nLevelKhangLoi)
	local nNgua_ViTri_A = me.GetTask(9184,31)
	if nNgua_ViTri_A == 0 then 
	Dialog:Say("Ngựa dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,4,1)
		me.SetTask(9183,11,1)-----Kháng Hỏa
	me.AddFightSkill(1905,nSkillCount);
	 local tbItemId	= {18,1,1316,nLevelKhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenKhangLoi.." vào Ngựa")
end 
