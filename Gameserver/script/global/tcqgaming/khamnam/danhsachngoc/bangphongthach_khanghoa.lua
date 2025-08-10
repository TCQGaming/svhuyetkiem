-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbBangPhongThach = Item:GetClass("bangphongthach");

function tbBangPhongThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\bangphongthach_khanghoa.lua");
	local nLevelAo_KhangHoa = it.nLevel
local nAo_KhangHoa = me.GetTask(9183,27)

	local nSkillCount = 0
	local nTen_KhangHoa = ""
				if (nLevelAo_KhangHoa == 1) then
		nSkillCount = 1
				nTen_KhangHoa = "Băng Phong Thạch (vỡ) (cấp 1)"
		elseif (nLevelAo_KhangHoa == 2) then
		nSkillCount = 2
				nTen_KhangHoa = "Băng Phong Thạch (mòn) (cấp 2)"
		elseif (nLevelAo_KhangHoa == 3) then
		nSkillCount = 3
				nTen_KhangHoa = "Băng Phong Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelAo_KhangHoa == 4) then
		nSkillCount = 4
				nTen_KhangHoa = "Băng Phong Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelAo_KhangHoa == 5) then
		nSkillCount = 5
				nTen_KhangHoa = "Băng Phong Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelAo_KhangHoa == 6) then
		nSkillCount = 6
				nTen_KhangHoa = "Băng Phong Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelAo_KhangHoa == 7) then
		nSkillCount = 7
				nTen_KhangHoa = "Băng Phong Thạch (lung linh) (Cấp 7)"
		elseif (nLevelAo_KhangHoa == 8) then
		nSkillCount = 8
				nTen_KhangHoa = "Băng Phong Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelAo_KhangHoa == 9) then
		nSkillCount = 9
				nTen_KhangHoa = "Băng Phong Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelAo_KhangHoa == 10) then
		nSkillCount = 10
				nTen_KhangHoa = "Băng Phong Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_KhangHoa.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Áo\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
    local tbOpt =     {} 
	if nAo_KhangHoa < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Áo :\n<color=yellow>"..nTen_KhangHoa.."<color> Kháng Hỏa",self.khamnon,self,nTen_KhangHoa,nSkillCount,nLevelAo_KhangHoa});
	else
				table.insert(tbOpt, {"Vị trí Áo đã khảm hãy tới Thợ Rèn Tô Mộng Trần để gỡ đá cấp thấp"});
	end 
		local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelAo_KhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Băng Phong Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Băng Phong Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Băng Phong Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Băng Phong Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Băng Phong Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Băng Phong Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Băng Phong Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1305,nLevelAo_KhangHoa)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KhangHoa,nLevelAo_KhangHoa});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KhangHoa,nSoLuongDaKham,nLevelAo_KhangHoa});
			end 
    Dialog:Say(szMsg, tbOpt)
end
function tbBangPhongThach:nangcapall(nTen_KhangHoa,nSoLuongDaKham,nLevelAo_KhangHoa)
if nLevelAo_KhangHoa == 10 then 
me.Msg("<color=yellow>"..nTen_KhangHoa.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1305,nLevelAo_KhangHoa) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangHoa.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelAo_KhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Băng Phong Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Băng Phong Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Băng Phong Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Băng Phong Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Băng Phong Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Băng Phong Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Băng Phong Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1305,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1305,nLevelAo_KhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KhangHoa.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenPC_BacTiep.."<color> ")
end 

function tbBangPhongThach:nangcap(nTen_KhangHoa,nLevelAo_KhangHoa)
if nLevelAo_KhangHoa == 10 then 
me.Msg("<color=yellow>"..nTen_KhangHoa.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1305,nLevelAo_KhangHoa) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangHoa.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelAo_KhangHoa + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Băng Phong Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Băng Phong Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Băng Phong Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Băng Phong Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Băng Phong Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Băng Phong Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Băng Phong Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Băng Phong Thạch (vô song) (Cấp 10)"
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
	me.AddStackItem(18,1,1305,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1305,nLevelAo_KhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KhangHoa.."<color> thành công lên <color=yellow>"..nTenPC_BacTiep.."<color> ")
end 
function tbBangPhongThach:khamnon(nTen_KhangHoa,nSkillCount,nLevelAo_KhangHoa)
	local nAo_ViTri_C = me.GetTask(9184,21)
	if nAo_ViTri_C == 0 then 
	Dialog:Say("Áo dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,27,1)
	me.AddFightSkill(1872,nSkillCount);
	 local tbItemId	= {18,1,1305,nLevelAo_KhangHoa,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KhangHoa.." vào áo")
end 
