-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbDaMaThach = Item:GetClass("damathach");

function tbDaMaThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\damathach_khangdoc.lua");
	local nLevelGiay_KhangDoc = it.nLevel
local nGiay_KhangDoc = me.GetTask(9183,30)

	local nSkillCount = 0
	local nTen_KhangDoc = ""
				if (nLevelGiay_KhangDoc == 1) then
		nSkillCount = 1
				nTen_KhangDoc = "Dạ Ma Thạch (vỡ) (cấp 1)"
		elseif (nLevelGiay_KhangDoc == 2) then
		nSkillCount = 2
				nTen_KhangDoc = "Dạ Ma Thạch (mòn) (cấp 2)"
		elseif (nLevelGiay_KhangDoc == 3) then
		nSkillCount = 3
				nTen_KhangDoc = "Dạ Ma Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelGiay_KhangDoc == 4) then
		nSkillCount = 4
				nTen_KhangDoc = "Dạ Ma Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelGiay_KhangDoc == 5) then
		nSkillCount = 5
				nTen_KhangDoc = "Dạ Ma Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelGiay_KhangDoc == 6) then
		nSkillCount = 6
				nTen_KhangDoc = "Dạ Ma Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelGiay_KhangDoc == 7) then
		nSkillCount = 7
				nTen_KhangDoc = "Dạ Ma Thạch (lung linh) (Cấp 7)"
		elseif (nLevelGiay_KhangDoc == 8) then
		nSkillCount = 8
				nTen_KhangDoc = "Dạ Ma Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelGiay_KhangDoc == 9) then
		nSkillCount = 9
				nTen_KhangDoc = "Dạ Ma Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelGiay_KhangDoc == 10) then
		nSkillCount = 10
				nTen_KhangDoc = "Dạ Ma Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTen_KhangDoc.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho Giày\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
  
    local tbOpt =     {} 
	if nGiay_KhangDoc < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Giày :\n<color=yellow>"..nTen_KhangDoc.."<color> Kháng Độc",self.khamgiay,self,nTen_KhangDoc,nSkillCount,nLevelGiay_KhangDoc});
	else
				table.insert(tbOpt, {"Vị trí Giày đã khảm hãy tới Thợ Rèn Tô Mộng Trần để gỡ đá cấp thấp"});
	end 
	
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelGiay_KhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "Dạ Ma Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "Dạ Ma Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "Dạ Ma Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "Dạ Ma Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "Dạ Ma Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "Dạ Ma Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "Dạ Ma Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "Dạ Ma Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "Dạ Ma Thạch (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1308,nLevelGiay_KhangDoc)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTen_KhangDoc,nLevelGiay_KhangDoc});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTen_KhangDoc,nSoLuongDaKham,nLevelGiay_KhangDoc});
			end 

    Dialog:Say(szMsg, tbOpt)
end

function tbDaMaThach:nangcapall(nTen_KhangDoc,nSoLuongDaKham,nLevelGiay_KhangDoc)
if nLevelGiay_KhangDoc == 10 then 
me.Msg("<color=yellow>"..nTen_KhangDoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1308,nLevelGiay_KhangDoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangDoc.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTen_KhangDocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelGiay_KhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangDocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1308,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1308,nLevelGiay_KhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTen_KhangDoc.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTen_KhangDocPC_BacTiep.."<color> ")
end 

function tbDaMaThach:nangcap(nTen_KhangDoc,nLevelGiay_KhangDoc)
if nLevelGiay_KhangDoc == 10 then 
me.Msg("<color=yellow>"..nTen_KhangDoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1308,nLevelGiay_KhangDoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTen_KhangDoc.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTen_KhangDocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelGiay_KhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTen_KhangDocPC_BacTiep = "Dạ Ma Thạch (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTen_KhangDocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1308,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1308,nLevelGiay_KhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTen_KhangDoc.."<color> thành công lên <color=yellow>"..nTen_KhangDocPC_BacTiep.."<color> ")
end 
function tbDaMaThach:khamgiay(nTen_KhangDoc,nSkillCount,nLevelGiay_KhangDoc)
	local nGiay_ViTri_C = me.GetTask(9184,30)
	if nGiay_ViTri_C == 0 then 
	Dialog:Say("Giày dòng 3 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,30,1)
	me.AddFightSkill(1881,nSkillCount);
	 local tbItemId	= {18,1,1308,nLevelGiay_KhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTen_KhangDoc.." vào Giày")
end 
