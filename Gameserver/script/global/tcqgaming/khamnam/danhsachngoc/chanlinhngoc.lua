-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbChanLinhNgoc = Item:GetClass("chanlinhngoc");

function tbChanLinhNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\chanlinhngoc.lua");
	local nLevel = it.nLevel
local nVuKhi_A = me.GetTask(9183,1)
local nVuKhi_B = me.GetTask(9183,2)
local nVuKhi_C = me.GetTask(9183,3)
	local nSkillCount = 0
	local nTen = ""
		if (nLevel == 1) then
		nSkillCount = 1
				nTen = "Chấn Linh Ngọc (vỡ) (cấp 1)"
		elseif (nLevel == 2) then
		nSkillCount = 2
				nTen = "Chấn Linh Ngọc (mòn) (cấp 2)"
		elseif (nLevel == 3) then
		nSkillCount = 3
				nTen = "Chấn Linh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevel == 4) then
		nSkillCount = 4
				nTen = "Chấn Linh Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevel == 5) then
		nSkillCount = 5
				nTen = "Chấn Linh Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevel == 6) then
		nSkillCount = 6
				nTen = "Chấn Linh Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevel == 7) then
		nSkillCount = 7
				nTen = "Chấn Linh Ngọc (lung linh) (Cấp 7)"
		elseif (nLevel == 8) then
		nSkillCount = 8
				nTen = "Chấn Linh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevel == 9) then
		nSkillCount = 9
				nTen = "Chấn Linh Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevel == 10) then
		nSkillCount = 10
				nTen = "Chấn Linh Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Vũ Khí\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
    local tbOpt =     {} 
	if nVuKhi_C < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Vũ Khí :\n<color=yellow>"..nTen.."<color>",self.khamnam,self,nTen,nSkillCount,nLevel});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
								local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevel + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (vô song) (Cấp 10)"
		end 
					local nSoLuongDaKham = me.GetItemCountInBags(18,1,1311,nLevel)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen,nLevel});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen,nSoLuongDaKham,nLevel});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbChanLinhNgoc:nangcapall(nTen,nSoLuongDaKham,nLevel)
if nLevel == 10 then 
me.Msg("<color=yellow>"..nTen.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1311,nLevel) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevel + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1311,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1311,nLevel,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenPC_BacTiep.."<color> ")
end 

function tbChanLinhNgoc:nangcap(nTen,nLevel)
if nLevel == 10 then 
me.Msg("<color=yellow>"..nTen.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1311,nLevel) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevel + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Chấn Linh Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1311,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1311,nLevel,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen.."<color> thành công lên <color=yellow>"..nTenPC_BacTiep.."<color> ")
end 
function tbChanLinhNgoc:khamnam(nTen,nSkillCount,nLevel)
	local nVK_ViTri_C = me.GetTask(9184,3)
	if nVK_ViTri_C == 0 then 
	Dialog:Say("Vũ Khí dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,3,1)
	me.AddFightSkill(1884,nSkillCount);
	 local tbItemId	= {18,1,1311,nLevel,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen.." vào Vũ Khí")
end 
