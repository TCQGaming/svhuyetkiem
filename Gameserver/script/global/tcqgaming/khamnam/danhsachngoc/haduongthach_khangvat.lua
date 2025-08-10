-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbHaDuongThach = Item:GetClass("haduongthach");

function tbHaDuongThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\haduongthach_khangvat.lua");
	local nLevelTay_KhangVat = it.nLevel
local nGiay_KhangDoc = me.GetTask(9183,29)

	local nSkillCount = 0
	local nTen_KhangVat = ""
				if (nLevelTay_KhangVat == 1) then
		nSkillCount = 1
				nTen_KhangVat = "Hạ Dương Thạch (vỡ) (cấp 1)"
		elseif (nLevelTay_KhangVat == 2) then
		nSkillCount = 2
				nTen_KhangVat = "Hạ Dương Thạch (mòn) (cấp 2)"
		elseif (nLevelTay_KhangVat == 3) then
		nSkillCount = 3
				nTen_KhangVat = "Hạ Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelTay_KhangVat == 4) then
		nSkillCount = 4
				nTen_KhangVat = "Hạ Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelTay_KhangVat == 5) then
		nSkillCount = 5
				nTen_KhangVat = "Hạ Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelTay_KhangVat == 6) then
		nSkillCount = 6
				nTen_KhangVat = "Hạ Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelTay_KhangVat == 7) then
		nSkillCount = 7
				nTen_KhangVat = "Hạ Dương Thạch (lung linh) (Cấp 7)"
		elseif (nLevelTay_KhangVat == 8) then
		nSkillCount = 8
				nTen_KhangVat = "Hạ Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelTay_KhangVat == 9) then
		nSkillCount = 9
				nTen_KhangVat = "Hạ Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelTay_KhangVat == 10) then
		nSkillCount = 10
				nTen_KhangVat = "Hạ Dương Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_KhangVat.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Hộ Uyển\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nGiay_KhangDoc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Tay :\n<color=yellow>"..nTen_KhangVat.."<color> Kháng Vật",self.khamgiay,self,nTen_KhangVat,nSkillCount,nLevelTay_KhangVat});
	else
				table.insert(tbOpt, {"Vị trí Hộ Uyển đã khảm hãy tới Thợ Rèn Tô Mộng Trần để gỡ đá cấp thấp"});
	end 
		local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTay_KhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Hạ Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Hạ Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Hạ Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Hạ Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Hạ Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Hạ Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Hạ Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Hạ Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Hạ Dương Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1309,nLevelTay_KhangVat)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KhangVat,nLevelTay_KhangVat});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KhangVat,nSoLuongDaKham,nLevelTay_KhangVat});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbHaDuongThach:nangcapall(nTen_KhangVat,nSoLuongDaKham,nLevelTay_KhangVat)
if nLevelTay_KhangVat == 10 then 
me.Msg("<color=yellow>"..nTen_KhangVat.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1309,nLevelTay_KhangVat) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangVat.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_KhangVatPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTay_KhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangVatPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1309,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1309,nLevelTay_KhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KhangVat.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_KhangVatPC_BacTiep.."<color> ")
end 

function tbHaDuongThach:nangcap(nTen_KhangVat,nLevelTay_KhangVat)
if nLevelTay_KhangVat == 10 then 
me.Msg("<color=yellow>"..nTen_KhangVat.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1309,nLevelTay_KhangVat) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangVat.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_KhangVatPC_BacTiep = ""
	local nCapBacKeTiep = nLevelTay_KhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangVatPC_BacTiep = "Hạ Dương Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangVatPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1309,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1309,nLevelTay_KhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KhangVat.."<color> thành công lên <color=yellow>"..nTen_KhangVatPC_BacTiep.."<color> ")
end 
function tbHaDuongThach:khamgiay(nTen_KhangVat,nSkillCount,nLevelTay_KhangVat)
	local nTay_ViTri_C = me.GetTask(9184,27)
	if nTay_ViTri_C == 0 then 
	Dialog:Say("Hộ Uyển dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,29,1)
	me.AddFightSkill(1878,nSkillCount);
	 local tbItemId	= {18,1,1309,nLevelTay_KhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KhangVat.." vào Hộ Uyển")
end 
