-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbChanLoThach = Item:GetClass("chanlothach");

function tbChanLoThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\chanlothach.lua");
	local nLevelKhangVat = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenKhangVat = ""
		if (nLevelKhangVat == 1) then
		nSkillCount = 1
				nTenKhangVat = "Chấn Lộ Thạch (vỡ) (cấp 1)"
		elseif (nLevelKhangVat == 2) then
		nSkillCount = 2
				nTenKhangVat = "Chấn Lộ Thạch (mòn) (cấp 2)"
		elseif (nLevelKhangVat == 3) then
		nSkillCount = 3
				nTenKhangVat = "Chấn Lộ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelKhangVat == 4) then
		nSkillCount = 4
				nTenKhangVat = "Chấn Lộ Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelKhangVat == 5) then
		nSkillCount = 5
				nTenKhangVat = "Chấn Lộ Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelKhangVat == 6) then
		nSkillCount = 6
				nTenKhangVat = "Chấn Lộ Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelKhangVat == 7) then
		nSkillCount = 7
				nTenKhangVat = "Chấn Lộ Thạch (lung linh) (Cấp 7)"
		elseif (nLevelKhangVat == 8) then
		nSkillCount = 8
				nTenKhangVat = "Chấn Lộ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelKhangVat == 9) then
		nSkillCount = 9
				nTenKhangVat = "Chấn Lộ Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelKhangVat == 10) then
		nSkillCount = 10
				nTenKhangVat = "Chấn Lộ Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenKhangVat.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
    local tbOpt =     {} 
	if nNgua_Khang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenKhangVat.."<color> Chịu st vật lý",self.khamnam,self,nTenKhangVat,nSkillCount,nLevelKhangVat});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Chấn Lộ Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1312,nLevelKhangVat)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenKhangVat,nLevelKhangVat});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenKhangVat,nSoLuongDaKham,nLevelKhangVat});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbChanLoThach:nangcapall(nTenKhangVat,nSoLuongDaKham,nLevelKhangVat)
if nLevelKhangVat == 10 then 
me.Msg("<color=yellow>"..nTenKhangVat.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1312,nLevelKhangVat) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangVat.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenKhangVatPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangVatPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1312,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1312,nLevelKhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenKhangVat.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenKhangVatPC_BacTiep.."<color> ")
end 

function tbChanLoThach:nangcap(nTenKhangVat,nLevelKhangVat)
if nLevelKhangVat == 10 then 
me.Msg("<color=yellow>"..nTenKhangVat.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1312,nLevelKhangVat) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangVat.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenKhangVatPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangVat + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangVatPC_BacTiep = "Chấn Lộ Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangVatPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1312,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1312,nLevelKhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenKhangVat.."<color> thành công lên <color=yellow>"..nTenKhangVatPC_BacTiep.."<color> ")
end 
function tbChanLoThach:khamnam(nTenKhangVat,nSkillCount,nLevelKhangVat)
	local nNgua_ViTri_A = me.GetTask(9184,31)
	if nNgua_ViTri_A == 0 then 
	Dialog:Say("Ngựa dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,4,1)
	me.SetTask(9183,7,1)-----Kháng Vật
	me.AddFightSkill(1901,nSkillCount);
	 local tbItemId	= {18,1,1312,nLevelKhangVat,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenKhangVat.." vào Ngựa")
end 
