-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbThamLangThach = Item:GetClass("thamlangthach");

function tbThamLangThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\thamlangthach.lua");
	local nLevelNguaVatCong = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenNguaVatCong = ""
				if (nLevelNguaVatCong == 1) then
		nSkillCount = 1
				nTenNguaVatCong = "Tham Lang Thạch (vỡ) (cấp 1)"
		elseif (nLevelNguaVatCong == 2) then
		nSkillCount = 2
				nTenNguaVatCong = "Tham Lang Thạch (mòn) (cấp 2)"
		elseif (nLevelNguaVatCong == 3) then
		nSkillCount = 3
				nTenNguaVatCong = "Tham Lang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelNguaVatCong == 4) then
		nSkillCount = 4
				nTenNguaVatCong = "Tham Lang Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelNguaVatCong == 5) then
		nSkillCount = 5
				nTenNguaVatCong = "Tham Lang Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelNguaVatCong == 6) then
		nSkillCount = 6
				nTenNguaVatCong = "Tham Lang Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelNguaVatCong == 7) then
		nSkillCount = 7
				nTenNguaVatCong = "Tham Lang Thạch (lung linh) (Cấp 7)"
		elseif (nLevelNguaVatCong == 8) then
		nSkillCount = 8
				nTenNguaVatCong = "Tham Lang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelNguaVatCong == 9) then
		nSkillCount = 9
				nTenNguaVatCong = "Tham Lang Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelNguaVatCong == 10) then
		nSkillCount = 10
				nTenNguaVatCong = "Tham Lang Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenNguaVatCong.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";

    local tbOpt =     {} 
	if nNgua_Vat_Cong < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenNguaVatCong.."<color> Tăng Vật Công",self.khamnam,self,nTenNguaVatCong,nSkillCount,nLevelNguaVatCong});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaVatCong + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Tham Lang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Tham Lang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Tham Lang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Tham Lang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Tham Lang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Tham Lang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Tham Lang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Tham Lang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Tham Lang Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1317,nLevelNguaVatCong)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenNguaVatCong,nLevelNguaVatCong});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenNguaVatCong,nSoLuongDaKham,nLevelNguaVatCong});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbThamLangThach:nangcapall(nTenNguaVatCong,nSoLuongDaKham,nLevelNguaVatCong)
if nLevelNguaVatCong == 10 then 
me.Msg("<color=yellow>"..nTenNguaVatCong.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1317,nLevelNguaVatCong) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenNguaVatCong.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenNguaVatCongPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaVatCong + 1
		if (nCapBacKeTiep == 2) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenNguaVatCongPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1317,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1317,nLevelNguaVatCong,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenNguaVatCong.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenNguaVatCongPC_BacTiep.."<color> ")
end 

function tbThamLangThach:nangcap(nTenNguaVatCong,nLevelNguaVatCong)
if nLevelNguaVatCong == 10 then 
me.Msg("<color=yellow>"..nTenNguaVatCong.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1317,nLevelNguaVatCong) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenNguaVatCong.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenNguaVatCongPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNguaVatCong + 1
		if (nCapBacKeTiep == 2) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenNguaVatCongPC_BacTiep = "Tham Lang Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenNguaVatCongPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1317,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1317,nLevelNguaVatCong,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenNguaVatCong.."<color> thành công lên <color=yellow>"..nTenNguaVatCongPC_BacTiep.."<color> ")
end 
function tbThamLangThach:khamnam(nTenNguaVatCong,nSkillCount,nLevelNguaVatCong)
	local nNgua_ViTri_B = me.GetTask(9184,32)
	if nNgua_ViTri_B == 0 then 
	Dialog:Say("Ngựa dòng 2 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,5,1)
	me.AddFightSkill(1906,nSkillCount);
	 local tbItemId	= {18,1,1317,nLevelNguaVatCong,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenNguaVatCong.." vào Ngựa")
end 
