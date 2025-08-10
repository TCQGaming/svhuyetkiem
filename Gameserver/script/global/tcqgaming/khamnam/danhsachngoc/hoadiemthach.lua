-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbHoaDiemThach = Item:GetClass("hoadiemthach");

function tbHoaDiemThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\hoadiemthach.lua");
	local nLevelKhangHoa = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenKhangHoa = ""
				if (nLevelKhangHoa == 1) then
		nSkillCount = 1
				nTenKhangHoa = "Hỏa Diệm Thạch (vỡ) (cấp 1)"
		elseif (nLevelKhangHoa == 2) then
		nSkillCount = 2
				nTenKhangHoa = "Hỏa Diệm Thạch (mòn) (cấp 2)"
		elseif (nLevelKhangHoa == 3) then
		nSkillCount = 3
				nTenKhangHoa = "Hỏa Diệm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelKhangHoa == 4) then
		nSkillCount = 4
				nTenKhangHoa = "Hỏa Diệm Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelKhangHoa == 5) then
		nSkillCount = 5
				nTenKhangHoa = "Hỏa Diệm Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelKhangHoa == 6) then
		nSkillCount = 6
				nTenKhangHoa = "Hỏa Diệm Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelKhangHoa == 7) then
		nSkillCount = 7
				nTenKhangHoa = "Hỏa Diệm Thạch (lung linh) (Cấp 7)"
		elseif (nLevelKhangHoa == 8) then
		nSkillCount = 8
				nTenKhangHoa = "Hỏa Diệm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelKhangHoa == 9) then
		nSkillCount = 9
				nTenKhangHoa = "Hỏa Diệm Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelKhangHoa == 10) then
		nSkillCount = 10
				nTenKhangHoa = "Hỏa Diệm Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenKhangHoa.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
    local tbOpt =     {} 
	if nNgua_Khang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenKhangHoa.."<color>",self.khamnam,self,nTenKhangHoa,nSkillCount,nLevelKhangHoa});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Hỏa Diệm Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1315,nLevelKhangHoa)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenKhangHoa,nLevelKhangHoa});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenKhangHoa,nSoLuongDaKham,nLevelKhangHoa});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbHoaDiemThach:nangcapall(nTenKhangHoa,nSoLuongDaKham,nLevelKhangHoa)
if nLevelKhangHoa == 10 then 
me.Msg("<color=yellow>"..nTenKhangHoa.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1315,nLevelKhangHoa) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangHoa.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenKhangHoaPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangHoaPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1315,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1315,nLevelKhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenKhangHoa.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenKhangHoaPC_BacTiep.."<color> ")
end 

function tbHoaDiemThach:nangcap(nTenKhangHoa,nLevelKhangHoa)
if nLevelKhangHoa == 10 then 
me.Msg("<color=yellow>"..nTenKhangHoa.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1315,nLevelKhangHoa) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangHoa.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenKhangHoaPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangHoaPC_BacTiep = "Hỏa Diệm Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangHoaPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1315,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1315,nLevelKhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenKhangHoa.."<color> thành công lên <color=yellow>"..nTenKhangHoaPC_BacTiep.."<color> ")
end 
function tbHoaDiemThach:khamnam(nTenKhangHoa,nSkillCount,nLevelKhangHoa)
	local nNgua_ViTri_A = me.GetTask(9184,31)
	if nNgua_ViTri_A == 0 then 
	Dialog:Say("Ngựa dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,4,1)
		me.SetTask(9183,10,1)-----Kháng Hỏa
	me.AddFightSkill(1904,nSkillCount);
	 local tbItemId	= {18,1,1315,nLevelKhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenKhangHoa.." vào Ngựa")
end 
