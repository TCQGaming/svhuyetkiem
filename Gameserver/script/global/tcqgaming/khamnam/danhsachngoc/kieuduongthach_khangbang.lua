-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbKieuDuongThach = Item:GetClass("kieuduongthach");

function tbKieuDuongThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\kieuduongthach_khangbang.lua");
	local nLevelNon_KhangBang = it.nLevel
local nNon_KhangBang = me.GetTask(9183,26)

	local nSkillCount = 0
	local nTen_KhangBang = ""
				if (nLevelNon_KhangBang == 1) then
		nSkillCount = 1
				nTen_KhangBang = "Kiêu Dương Thạch (vỡ) (cấp 1)"
		elseif (nLevelNon_KhangBang == 2) then
		nSkillCount = 2
				nTen_KhangBang = "Kiêu Dương Thạch (mòn) (cấp 2)"
		elseif (nLevelNon_KhangBang == 3) then
		nSkillCount = 3
				nTen_KhangBang = "Kiêu Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelNon_KhangBang == 4) then
		nSkillCount = 4
				nTen_KhangBang = "Kiêu Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelNon_KhangBang == 5) then
		nSkillCount = 5
				nTen_KhangBang = "Kiêu Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelNon_KhangBang == 6) then
		nSkillCount = 6
				nTen_KhangBang = "Kiêu Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelNon_KhangBang == 7) then
		nSkillCount = 7
				nTen_KhangBang = "Kiêu Dương Thạch (lung linh) (Cấp 7)"
		elseif (nLevelNon_KhangBang == 8) then
		nSkillCount = 8
				nTen_KhangBang = "Kiêu Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelNon_KhangBang == 9) then
		nSkillCount = 9
				nTen_KhangBang = "Kiêu Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelNon_KhangBang == 10) then
		nSkillCount = 10
				nTen_KhangBang = "Kiêu Dương Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_KhangBang.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Nón\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nNon_KhangBang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nón :\n<color=yellow>"..nTen_KhangBang.."<color> Kháng Băng",self.khamnon,self,nTen_KhangBang,nSkillCount,nLevelNon_KhangBang});
	else
				table.insert(tbOpt, {"Vị trí nón đã khảm hãy tới Thợ Rèn Tô Mộng Trần để gỡ đá cấp thấp"});
	end 
		local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNon_KhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Kiêu Dương Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1307,nLevelNon_KhangBang)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KhangBang,nLevelNon_KhangBang});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KhangBang,nSoLuongDaKham,nLevelNon_KhangBang});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbKieuDuongThach:nangcapall(nTen_KhangBang,nSoLuongDaKham,nLevelNon_KhangBang)
if nLevelNon_KhangBang == 10 then 
me.Msg("<color=yellow>"..nTen_KhangBang.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1307,nLevelNon_KhangBang) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangBang.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_KhangBangPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNon_KhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangBangPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1307,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1307,nLevelNon_KhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KhangBang.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_KhangBangPC_BacTiep.."<color> ")
end 

function tbKieuDuongThach:nangcap(nTen_KhangBang,nLevelNon_KhangBang)
if nLevelNon_KhangBang == 10 then 
me.Msg("<color=yellow>"..nTen_KhangBang.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1307,nLevelNon_KhangBang) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangBang.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_KhangBangPC_BacTiep = ""
	local nCapBacKeTiep = nLevelNon_KhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangBangPC_BacTiep = "Kiêu Dương Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangBangPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1307,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1307,nLevelNon_KhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KhangBang.."<color> thành công lên <color=yellow>"..nTen_KhangBangPC_BacTiep.."<color> ")
end 
function tbKieuDuongThach:khamnon(nTen_KhangBang,nSkillCount,nLevelNon_KhangBang)
	local nNon_ViTri_C = me.GetTask(9184,18)
	if nNon_ViTri_C == 0 then 
	Dialog:Say("nón dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,26,1)
	me.AddFightSkill(1869,nSkillCount);
	 local tbItemId	= {18,1,1307,nLevelNon_KhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KhangBang.." vào nón")
end 
