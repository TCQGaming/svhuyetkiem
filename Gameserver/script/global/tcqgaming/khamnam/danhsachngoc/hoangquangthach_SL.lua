-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbChanLoThach = Item:GetClass("hoangquangthach");

function tbChanLoThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\hoangquangthach_SL.lua");
	local nLevelPhongCu_SL = it.nLevel
local nNon_SL = me.GetTask(9183,12)
local nAo_SL = me.GetTask(9183,13)
local nDai_SL = me.GetTask(9183,14)
local nTay_SL = me.GetTask(9183,15)
local nGiay_SL = me.GetTask(9183,16)

	local nSkillCount = 0
	local nTenPC_SL = ""
				if (nLevelPhongCu_SL == 1) then
		nSkillCount = 1
				nTenPC_SL = "Hoàng Quang Thạch (vỡ) (cấp 1)"
		elseif (nLevelPhongCu_SL == 2) then
		nSkillCount = 2
				nTenPC_SL = "Hoàng Quang Thạch (mòn) (cấp 2)"
		elseif (nLevelPhongCu_SL == 3) then
		nSkillCount = 3
				nTenPC_SL = "Hoàng Quang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelPhongCu_SL == 4) then
		nSkillCount = 4
				nTenPC_SL = "Hoàng Quang Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelPhongCu_SL == 5) then
		nSkillCount = 5
				nTenPC_SL = "Hoàng Quang Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelPhongCu_SL == 6) then
		nSkillCount = 6
				nTenPC_SL = "Hoàng Quang Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelPhongCu_SL == 7) then
		nSkillCount = 7
				nTenPC_SL = "Hoàng Quang Thạch (lung linh) (Cấp 7)"
		elseif (nLevelPhongCu_SL == 8) then
		nSkillCount = 8
				nTenPC_SL = "Hoàng Quang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelPhongCu_SL == 9) then
		nSkillCount = 9
				nTenPC_SL = "Hoàng Quang Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelPhongCu_SL == 10) then
		nSkillCount = 10
				nTenPC_SL = "Hoàng Quang Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenPC_SL.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho phòng cụ\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nNon_SL < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Nón :\n<color=yellow>"..nTenPC_SL.."<color> SL",self.khamnon,self,nTenPC_SL,nSkillCount,nLevelPhongCu_SL});
	else
				table.insert(tbOpt, {"Vị trí nón đã khảm"});
	end 
		if nAo_SL < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Áo :\n<color=yellow>"..nTenPC_SL.."<color> SL",self.khamao,self,nTenPC_SL,nSkillCount,nLevelPhongCu_SL});
	else
				table.insert(tbOpt, {"Vị trí Áo đã khảm"});
	end 
		if nDai_SL < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Đai :\n<color=yellow>"..nTenPC_SL.."<color> SL",self.khamdai,self,nTenPC_SL,nSkillCount,nLevelPhongCu_SL});
	else
				table.insert(tbOpt, {"Vị trí Đai Lưng đã khảm"});
	end 
		if nTay_SL < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Tay :\n<color=yellow>"..nTenPC_SL.."<color> SL",self.khamtay,self,nTenPC_SL,nSkillCount,nLevelPhongCu_SL});
	else
				table.insert(tbOpt, {"Vị trí Hộ Uyển đã khảm"});
	end 
		if nGiay_SL < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Giày :\n<color=yellow>"..nTenPC_SL.."<color> SL",self.khamgiay,self,nTenPC_SL,nSkillCount,nLevelPhongCu_SL});
	else
				table.insert(tbOpt, {"Vị trí Giày đã khảm"});
	end 
	
	
		local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelPhongCu_SL + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (vô song) (Cấp 10)"
		end 
					local nSoLuongDaKham = me.GetItemCountInBags(18,1,1301,nLevelPhongCu_SL)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenPC_SL,nLevelPhongCu_SL});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenPC_SL,nSoLuongDaKham,nLevelPhongCu_SL});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbChanLoThach:nangcapall(nTenPC_SL,nSoLuongDaKham,nLevelPhongCu_SL)
if nLevelPhongCu_SL == 10 then 
me.Msg("<color=yellow>"..nTenPC_SL.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1301,nLevelPhongCu_SL) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenPC_SL.."<color> không đủ 3 viên rồi?")
return 
end 
    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelPhongCu_SL + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (vô song) (Cấp 10)"
		end 
		local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1301,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenPC_SL.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenPC_BacTiep.."<color> ")
end 

function tbChanLoThach:nangcap(nTenPC_SL,nLevelPhongCu_SL)
if nLevelPhongCu_SL == 10 then 
me.Msg("<color=yellow>"..nTenPC_SL.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1301,nLevelPhongCu_SL) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenPC_SL.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelPhongCu_SL + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Hoàng Quang Thạch (vô song) (Cấp 10)"
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
	me.AddStackItem(18,1,1301,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenPC_SL.."<color> thành công lên <color=yellow>"..nTenPC_BacTiep.."<color> ")
end 
function tbChanLoThach:khamnon(nTenPC_SL,nSkillCount,nLevelPhongCu_SL)
	local nNon_ViTri_A = me.GetTask(9184,16)
	if nNon_ViTri_A == 0 then 
	Dialog:Say("nón dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,12,1)
	me.AddFightSkill(1867,nSkillCount);
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenPC_SL.." vào nón")
end 
function tbChanLoThach:khamao(nTenPC_SL,nSkillCount,nLevelPhongCu_SL)
	local nAo_ViTri_A = me.GetTask(9184,19)
	if nAo_ViTri_A == 0 then 
	Dialog:Say("áo dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,13,1)
	me.AddFightSkill(1870,nSkillCount);
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenPC_SL.." vào áo")
end 
function tbChanLoThach:khamdai(nTenPC_SL,nSkillCount,nLevelPhongCu_SL)
	local nDaiLung_ViTri_A = me.GetTask(9184,22)
	if nDaiLung_ViTri_A == 0 then 
	Dialog:Say("Đai Lưng dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,14,1)
	me.AddFightSkill(1873,nSkillCount);
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenPC_SL.." vào Đai Lưng")
end 
function tbChanLoThach:khamtay(nTenPC_SL,nSkillCount,nLevelPhongCu_SL)
	local nTay_ViTri_A = me.GetTask(9184,25)
	if nTay_ViTri_A == 0 then 
	Dialog:Say("hộ uyển dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,15,1)
	me.AddFightSkill(1876,nSkillCount);
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenPC_SL.." vào hộ uyển")
end 
function tbChanLoThach:khamgiay(nTenPC_SL,nSkillCount,nLevelPhongCu_SL)
	local nGiay_ViTri_A = me.GetTask(9184,28)
	if nGiay_ViTri_A == 0 then 
	Dialog:Say("giày dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,16,1)
	me.AddFightSkill(1879,nSkillCount);
	 local tbItemId	= {18,1,1301,nLevelPhongCu_SL,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenPC_SL.." vào giày")
end 
