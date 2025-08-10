-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbChanLoThach = Item:GetClass("tuyetlinhthach");

function tbChanLoThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\tuyetlinhthach.lua");
	local nLevelKhangBang = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenKhangBang = ""
				if (nLevelKhangBang == 1) then
		nSkillCount = 1
				nTenKhangBang = "Tuyết Linh Thạch (vỡ) (cấp 1)"
		elseif (nLevelKhangBang == 2) then
		nSkillCount = 2
				nTenKhangBang = "Tuyết Linh Thạch (mòn) (cấp 2)"
		elseif (nLevelKhangBang == 3) then
		nSkillCount = 3
				nTenKhangBang = "Tuyết Linh Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelKhangBang == 4) then
		nSkillCount = 4
				nTenKhangBang = "Tuyết Linh Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelKhangBang == 5) then
		nSkillCount = 5
				nTenKhangBang = "Tuyết Linh Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelKhangBang == 6) then
		nSkillCount = 6
				nTenKhangBang = "Tuyết Linh Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelKhangBang == 7) then
		nSkillCount = 7
				nTenKhangBang = "Tuyết Linh Thạch (lung linh) (Cấp 7)"
		elseif (nLevelKhangBang == 8) then
		nSkillCount = 8
				nTenKhangBang = "Tuyết Linh Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelKhangBang == 9) then
		nSkillCount = 9
				nTenKhangBang = "Tuyết Linh Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelKhangBang == 10) then
		nSkillCount = 10
				nTenKhangBang = "Tuyết Linh Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenKhangBang.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nNgua_Khang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenKhangBang.."<color> Chịu st băng công",self.khamnam,self,nTenKhangBang,nSkillCount,nLevelKhangBang});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Tuyết Linh Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1313,nLevelKhangBang)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenKhangBang,nLevelKhangBang});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenKhangBang,nSoLuongDaKham,nLevelKhangBang});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbChanLoThach:nangcapall(nTenKhangBang,nSoLuongDaKham,nLevelKhangBang)
if nLevelKhangBang == 10 then 
me.Msg("<color=yellow>"..nTenKhangBang.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1313,nLevelKhangBang) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangBang.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenKhangBangPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangBangPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1313,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1313,nLevelKhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenKhangBang.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenKhangBangPC_BacTiep.."<color> ")
end 

function tbChanLoThach:nangcap(nTenKhangBang,nLevelKhangBang)
if nLevelKhangBang == 10 then 
me.Msg("<color=yellow>"..nTenKhangBang.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1313,nLevelKhangBang) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangBang.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenKhangBangPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangBang + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangBangPC_BacTiep = "Tuyết Linh Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangBangPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1313,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1313,nLevelKhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenKhangBang.."<color> thành công lên <color=yellow>"..nTenKhangBangPC_BacTiep.."<color> ")
end 
function tbChanLoThach:khamnam(nTenKhangBang,nSkillCount,nLevelKhangBang)
	local nNgua_ViTri_A = me.GetTask(9184,31)
	if nNgua_ViTri_A == 0 then 
	Dialog:Say("Ngựa dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,4,1)
		me.SetTask(9183,9,1)-----Kháng Băng
	me.AddFightSkill(1903,nSkillCount);
	 local tbItemId	= {18,1,1313,nLevelKhangBang,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenKhangBang.." vào Ngựa")
end 
