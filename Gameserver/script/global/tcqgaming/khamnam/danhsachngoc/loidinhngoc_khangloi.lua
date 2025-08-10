-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbLoiDinhNgoc = Item:GetClass("loidinhngoc");

function tbLoiDinhNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\loidinhngoc_khangloi.lua");
	local nLevelDai_KhangLoi = it.nLevel
local nDai_KhangLoi = me.GetTask(9183,28)

	local nSkillCount = 0
	local nTen_KhangLoi = ""
				if (nLevelDai_KhangLoi == 1) then
		nSkillCount = 1
				nTen_KhangLoi = "Lôi Đình Ngọc (vỡ) (cấp 1)"
		elseif (nLevelDai_KhangLoi == 2) then
		nSkillCount = 2
				nTen_KhangLoi = "Lôi Đình Ngọc (mòn) (cấp 2)"
		elseif (nLevelDai_KhangLoi == 3) then
		nSkillCount = 3
				nTen_KhangLoi = "Lôi Đình Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelDai_KhangLoi == 4) then
		nSkillCount = 4
				nTen_KhangLoi = "Lôi Đình Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelDai_KhangLoi == 5) then
		nSkillCount = 5
				nTen_KhangLoi = "Lôi Đình Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelDai_KhangLoi == 6) then
		nSkillCount = 6
				nTen_KhangLoi = "Lôi Đình Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelDai_KhangLoi == 7) then
		nSkillCount = 7
				nTen_KhangLoi = "Lôi Đình Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelDai_KhangLoi == 8) then
		nSkillCount = 8
				nTen_KhangLoi = "Lôi Đình Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelDai_KhangLoi == 9) then
		nSkillCount = 9
				nTen_KhangLoi = "Lôi Đình Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelDai_KhangLoi == 10) then
		nSkillCount = 10
				nTen_KhangLoi = "Lôi Đình Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_KhangLoi.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Đai Lưng\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nDai_KhangLoi < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Đai Lưng :\n<color=yellow>"..nTen_KhangLoi.."<color> Kháng Lôi",self.khamnon,self,nTen_KhangLoi,nSkillCount,nLevelDai_KhangLoi});
	else
				table.insert(tbOpt, {"Vị trí Đai Lưng đã khảm hãy tới Thợ Rèn Tô Mộng Trần để gỡ đá cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelDai_KhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Lôi Đình Ngọc (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1306,nLevelDai_KhangLoi)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KhangLoi,nLevelDai_KhangLoi});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KhangLoi,nSoLuongDaKham,nLevelDai_KhangLoi});
			end 

    Dialog:Say(szMsg, tbOpt)
end

function tbLoiDinhNgoc:nangcapall(nTen_KhangLoi,nSoLuongDaKham,nLevelDai_KhangLoi)
if nLevelDai_KhangLoi == 10 then 
me.Msg("<color=yellow>"..nTen_KhangLoi.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1306,nLevelDai_KhangLoi) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangLoi.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_KhangLoiPC_BacTiep = ""
	local nCapBacKeTiep = nLevelDai_KhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangLoiPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1306,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1306,nLevelDai_KhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KhangLoi.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_KhangLoiPC_BacTiep.."<color> ")
end 

function tbLoiDinhNgoc:nangcap(nTen_KhangLoi,nLevelDai_KhangLoi)
if nLevelDai_KhangLoi == 10 then 
me.Msg("<color=yellow>"..nTen_KhangLoi.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1306,nLevelDai_KhangLoi) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangLoi.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_KhangLoiPC_BacTiep = ""
	local nCapBacKeTiep = nLevelDai_KhangLoi + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangLoiPC_BacTiep = "Lôi Đình Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangLoiPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1306,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1306,nLevelDai_KhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KhangLoi.."<color> thành công lên <color=yellow>"..nTen_KhangLoiPC_BacTiep.."<color> ")
end 
function tbLoiDinhNgoc:khamnon(nTen_KhangLoi,nSkillCount,nLevelDai_KhangLoi)
	local nDaiLung_ViTri_C = me.GetTask(9184,24)
	if nDaiLung_ViTri_C == 0 then 
	Dialog:Say("Đai Lưng dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,28,1)
	me.AddFightSkill(1875,nSkillCount);
	 local tbItemId	= {18,1,1306,nLevelDai_KhangLoi,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KhangLoi.." vào Đai Lưng")
end 
