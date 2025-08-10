-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbChanLoThach = Item:GetClass("uminhngoc");

function tbChanLoThach:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\danhsachngoc\\uminhngoc.lua");
	local nLevelKhangDoc = it.nLevel
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
	local nSkillCount = 0
	local nTenKhangDoc = ""
				if (nLevelKhangDoc == 1) then
		nSkillCount = 1
				nTenKhangDoc = "U Minh Ngọc (vỡ) (cấp 1)"
		elseif (nLevelKhangDoc == 2) then
		nSkillCount = 2
				nTenKhangDoc = "U Minh Ngọc (mòn) (cấp 2)"
		elseif (nLevelKhangDoc == 3) then
		nSkillCount = 3
				nTenKhangDoc = "U Minh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelKhangDoc == 4) then
		nSkillCount = 4
				nTenKhangDoc = "U Minh Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelKhangDoc == 5) then
		nSkillCount = 5
				nTenKhangDoc = "U Minh Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelKhangDoc == 6) then
		nSkillCount = 6
				nTenKhangDoc = "U Minh Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelKhangDoc == 7) then
		nSkillCount = 7
				nTenKhangDoc = "U Minh Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelKhangDoc == 8) then
		nSkillCount = 8
				nTenKhangDoc = "U Minh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelKhangDoc == 9) then
		nSkillCount = 9
				nTenKhangDoc = "U Minh Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelKhangDoc == 10) then
		nSkillCount = 10
				nTenKhangDoc = "U Minh Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "<color=yellow>"..nTenKhangDoc.." <color>sau khi khảm nạm sẽ tăng thuộc tính cho ngựa\n<color><color=red>Quy Tắc :\nNâng cấp 1 viên tốn 2 vạn đồng khóa";
 
    local tbOpt =     {} 
	if nNgua_Khang < 1 then 
			table.insert(tbOpt, {"Ta muốn Khảm Ngựa :\n<color=yellow>"..nTenKhangDoc.."<color> Chịu st độc công",self.khamnam,self,nTenKhangDoc,nSkillCount,nLevelKhangDoc});
	else 
				table.insert(tbOpt, {"Bạn đã khảm đá này rồi xin hãy tới Tiệm Rèn Bảo Thạch gỡ viên cấp thấp"});
	end 
			local nTenPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTenPC_BacTiep = "U Minh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenPC_BacTiep = "U Minh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenPC_BacTiep = "U Minh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenPC_BacTiep = "U Minh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenPC_BacTiep = "U Minh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenPC_BacTiep = "U Minh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenPC_BacTiep = "U Minh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenPC_BacTiep = "U Minh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenPC_BacTiep = "U Minh Ngọc (vô song) (Cấp 10)"
		end 
						local nSoLuongDaKham = me.GetItemCountInBags(18,1,1314,nLevelKhangDoc)
			if nSoLuongDaKham >= 3 then 
				table.insert(tbOpt, {"<color=cyan>Nâng cấp<color> thành 1 viên :\n"..nTenPC_BacTiep.."",self.nangcap,self,nTenKhangDoc,nLevelKhangDoc});
				table.insert(tbOpt, {"<color=cyan>Nâng cấp tất cả thành\n<color>"..nTenPC_BacTiep.."",self.nangcapall,self,nTenKhangDoc,nSoLuongDaKham,nLevelKhangDoc});
			end 
    Dialog:Say(szMsg, tbOpt)
end

function tbChanLoThach:nangcapall(nTenKhangDoc,nSoLuongDaKham,nLevelKhangDoc)
if nLevelKhangDoc == 10 then 
me.Msg("<color=yellow>"..nTenKhangDoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1314,nLevelKhangDoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangDoc.."<color> không đủ 3 viên rồi?")
return 
end 

    local nSoLuongDaThanhPham = math.floor(nSoLuongDaKham / 3)
	local nSoLuongDaMatDi = nSoLuongDaThanhPham *3
	
	local nTenKhangDocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (vô song) (Cấp 10)"
		end 
local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangDocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1314,nCapBacKeTiep,{bForceBind=1},nSoLuongDaThanhPham)
	 local tbItemId	= {18,1,1314,nLevelKhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, nSoLuongDaMatDi); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp "..nSoLuongDaMatDi.." viên <color=yellow>"..nTenKhangDoc.."<color> thành công lên <color=yellow>"..nSoLuongDaThanhPham.." viên "..nTenKhangDocPC_BacTiep.."<color> ")
end 

function tbChanLoThach:nangcap(nTenKhangDoc,nLevelKhangDoc)
if nLevelKhangDoc == 10 then 
me.Msg("<color=yellow>"..nTenKhangDoc.."<color> đã đạt cấp tối đa không thể nâng cấp")
return 
end 
local nNguyenLieuDaKham = me.GetItemCountInBags(18,1,1314,nLevelKhangDoc) -- Hoa hồng đỏ
if nNguyenLieuDaKham < 3 then 
Dialog:Say("<color=yellow>"..nTenKhangDoc.."<color> không đủ 3 viên rồi?")
return 
end 
	local nTenKhangDocPC_BacTiep = ""
	local nCapBacKeTiep = nLevelKhangDoc + 1
		if (nCapBacKeTiep == 2) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (mòn) (cấp 2)"
		elseif (nCapBacKeTiep == 3) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nCapBacKeTiep == 4) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (tinh xảo) (cấp 4)"
		elseif (nCapBacKeTiep == 5) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (lấp lánh) (cấp 5)"
		elseif (nCapBacKeTiep == 6) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (óng ánh) (Cấp 6)"
		elseif (nCapBacKeTiep == 7) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (lung linh) (Cấp 7)"
		elseif (nCapBacKeTiep == 8) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nCapBacKeTiep == 9) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (chí tôn) (Cấp 9)"
		elseif (nCapBacKeTiep == 10) then
				nTenKhangDocPC_BacTiep = "U Minh Ngọc (vô song) (Cấp 10)"
		end 
				local nSoLuongDaThanhPham = 1
				local nDongKhoa = me.nBindCoin
local nDongTon = nSoLuongDaThanhPham * (2 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành nâng "..nSoLuongDaThanhPham.." viên <color=yellow>"..nTenKhangDocPC_BacTiep.."<color> bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
	me.AddBindCoin(-nDongTon)
	me.AddStackItem(18,1,1314,nCapBacKeTiep,{bForceBind=1},1)
	 local tbItemId	= {18,1,1314,nLevelKhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 3); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã nâng cấp <color=yellow>"..nTenKhangDoc.."<color> thành công lên <color=yellow>"..nTenKhangDocPC_BacTiep.."<color> ")
end 
function tbChanLoThach:khamnam(nTenKhangDoc,nSkillCount,nLevelKhangDoc)
	local nNgua_ViTri_A = me.GetTask(9184,31)
	if nNgua_ViTri_A == 0 then 
	Dialog:Say("Ngựa dòng 1 chưa đục lỗ không thể khảm đá này")
	return 
	end 
	me.SetTask(9183,4,1)
		me.SetTask(9183,8,1)-----Kháng Độc
	me.AddFightSkill(1902,nSkillCount);
	 local tbItemId	= {18,1,1314,nLevelKhangDoc,0,0};  -- Gio hoa
	  Task:DelItem(me, tbItemId, 1); 
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã khảm thành công "..nTenKhangDoc.." vào Ngựa")
end 
