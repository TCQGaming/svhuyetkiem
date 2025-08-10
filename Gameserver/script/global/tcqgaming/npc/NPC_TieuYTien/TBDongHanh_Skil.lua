local TB_DongHanh ={};
SpecialEvent.TB_DongHanh_Skill= TB_DongHanh;

TB_DongHanh.nSkillId_PetVK = 1982;
TB_DongHanh.nSkillId_PetAo = 1983;
TB_DongHanh.nSkillId_PetNhan = 1984;
TB_DongHanh.nSkillId_PetTay = 1985;
TB_DongHanh.nSkillId_PetPhu = 1986;
TB_DongHanh.nSkillId_PetLien = 1987;
TB_DongHanh.nSkillId_PetLung = 1988;
TB_DongHanh.nSkillId_PetGiay = 1989;
TB_DongHanh.nSkillId_PetBoi = 1990;
TB_DongHanh.nSkillId_PetNon = 1991;

local nGioiHanSkill = 2; -- gioi han nang cap dong hanh toi da
--------------------------------------------manh ghep trang bi dong hanh-------------------------------------------------
local tbArray_TB = {-- ID Mảnh trang bị đồng hành
[1982] = {18,1,1876,1},
[1983] = {18,1,1876,2},
[1984] = {18,1,1876,3},
[1985] = {18,1,1876,4},
[1986] = {18,1,1876,5},
[1987] = {18,1,1876,10},
[1988] = {18,1,1876,9},
[1989] = {18,1,1876,8},
[1990] = {18,1,1876,7},
[1991] = {18,1,1876,6},
};
local tbArray_nSumTB = {-- Số lượng mảnh trang bị đồng hành
[1] = 500,
[2] = 1000,
[3] = 3000,
[4] = 5000,
[5] = 2000,
[6] = 3000,
[7] = 4000,
[8] = 5000,
[9] = 6000,
[10] = 10000,
};
---------------------------------------------------------------------------------------------------------------------------
--------------------------------------------manh ghep trang bi dong hanh-------------------------------------------------
local tbArray_DanhBoLenh = {-- ID Danh bổ lệnh
[1982] = {18,1,190,1},
[1983] = {18,1,190,1},
[1984] = {18,1,190,1},
[1985] = {18,1,190,1},
[1986] = {18,1,190,1},
[1987] = {18,1,190,1},
[1988] = {18,1,190,1},
[1989] = {18,1,190,1},
[1990] = {18,1,190,1},
[1991] = {18,1,190,1},
};
local tbArray_nSumDanhBoLenh = {-- Khai báo số lượng Danh Bổ Lệnh
[1] = 300,
[2] = 500,
[3] = 1000,
[4] = 1000,
[5] = 2000,
[6] = 3000,
[7] = 4000,
[8] = 5000,
[9] = 6000,
[10] = 10000,
};
---------------------------------------------------------------------------------------------------------------------------
--------------------------------------------knb-------------------------------------------------

local tbArray_KNB = {--ID Kim Nguyên bảo
[1982] = {18,1,1338,1},
[1983] = {18,1,1338,1},
[1984] = {18,1,1338,1},
[1985] = {18,1,1338,1},
[1986] = {18,1,1338,1},
[1987] = {18,1,1338,1},
[1988] = {18,1,1338,1},
[1989] = {18,1,1338,1},
[1990] = {18,1,1338,1},
[1991] = {18,1,1338,1},
};
local tbArray_nSumKNB = {-- Số lượng Đại Kim Nguyên bảo
[1] = 5,
[2] = 5,
[3] = 5,
[4] = 10,
};
---------------------------------------------------------------------------------------------------------------------------
local tbArray_HT = {-- khai bao ID KNB theo ID ky nang skill, manh ghep
[1982] = {18,1,114,10},
[1983] = {18,1,114,10},
[1984] = {18,1,114,10},
[1985] = {18,1,114,10},
[1986] = {18,1,114,10},
[1987] = {18,1,114,10},
[1988] = {18,1,114,10},
[1989] = {18,1,114,10},
[1990] = {18,1,114,10},
[1991] = {18,1,114,10},
};
local tbArray_nSumHT = {-- khai bao so huyền tinh
[1] = 5,
[2] = 5,
[3] = 5,
[4] = 10,-------Hiện tại tới đây 10 viên ht10
[5] = 6,
[6] = 6,
[7] = 6,
[8] = 6,
[9] = 6,
[10] = 6,
};
---
local tbArray_nSumBac = {-- khai bao so luong bac  yeu cau theo cap trang bi
[1] = 10 * 100,
[2] = 10 * 100,
[3] = 10 * 100,
[4] = 40 * 100,
[5] = 50 * 100,
[6] = 60 * 100,
[7] = 70 * 100,
[8] = 80 * 100,
[9] = 90 * 100,
[10] = 100 * 100,

};

function TB_DongHanh:OnDialog()
 --DoScript("\\script\\global\\tcqgaming\\npc\\NPC_TieuYTien\\TBDongHanh_Skil.lua");
 if me.nLevel < 90 then
 Dialog:Say("Bạn chưa đủ cấp 90")
return;
end
	local nLevelVKhi = me.GetSkillLevel(self.nSkillId_PetVK);
	local nLevelAo = me.GetSkillLevel(self.nSkillId_PetAo);
	local nLevelNhan = me.GetSkillLevel(self.nSkillId_PetNhan);
	local nLevelTay = me.GetSkillLevel(self.nSkillId_PetTay);
	local nLevelPhu = me.GetSkillLevel(self.nSkillId_PetPhu);
	local nLevelLien = me.GetSkillLevel(self.nSkillId_PetLien);
	local nLevelLung = me.GetSkillLevel(self.nSkillId_PetLung);
	local nLevelGiay = me.GetSkillLevel(self.nSkillId_PetGiay);
	local nLevelBoi = me.GetSkillLevel(self.nSkillId_PetBoi);
	local nLevelNon = me.GetSkillLevel(self.nSkillId_PetNon);
	if nLevelVKhi < 1 then
		nLevelVKhi = 0;
	end
	if nLevelAo < 1 then
		nLevelAo = 0;
	end	
	if nLevelNhan < 1 then
		nLevelNhan = 0;
	end		
	if nLevelTay < 1 then
		nLevelTay = 0;
	end	
	if nLevelPhu < 1 then
		nLevelPhu = 0;
	end	
	if nLevelLien < 1 then
		nLevelLien = 0;
	end		
	if nLevelLung < 1 then
		nLevelLung = 0;
	end	
	if nLevelGiay < 1 then
		nLevelGiay = 0;
	end		
	if nLevelBoi < 1 then
		nLevelBoi = 0;
	end	
	if nLevelNon < 1 then
		nLevelNon = 0;
	end		
	local szMsg = "Đây là chức năng Nâng Cấp Trang Bị Đồng Hành. Vui lòng lựa chọn loại TB muốn nâng cấp";
	
	local tbOpt = 
	{
		{"<color=gold>Đổi Huyền Tinh Lấy Rương Đồng Hành", self.DoiRuongDongHanh, self,self.nSkillId_PetVK},			
		{"Đồng Hành Chi Nhẫn Cấp ["..(nLevelVKhi+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetVK},		
		{"Đồng Hành Chiến Y ["..(nLevelAo+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetAo},
		{"Đồng Hành Giới Chỉ ["..(nLevelNhan+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetNhan},
		{"Đồng Hành Hộ Uyển ["..(nLevelTay+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetTay},
		{"Đồng Hành Hộ Phù ["..(nLevelPhu+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetPhu},
		{"Đồng Hành Hạng Liên ["..(nLevelLien+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetLien},
		{"Đồng Hành Thúc Yêu ["..(nLevelLung+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetLung},
		{"Đồng Hành Chiến Ngoa ["..(nLevelGiay+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetGiay},
		{"Đồng Hành Ngọc Bội ["..(nLevelBoi+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetBoi},
		{"Đồng Hành Chi Quán ["..(nLevelNon+1).."]", self.NangCapTBDongHanh, self,self.nSkillId_PetNon},

		{"Kết thúc đối thoại"},
	}

	Dialog:Say(szMsg, tbOpt);	
end
--script\ChucNang\TBDongHanh.lua
function TB_DongHanh:DoiRuongDongHanh() 
if me.nLevel < 90 then
			Dialog:Say("Bạn chưa đạt cấp 90 , Cấp 90 mới có thể mở");
			return 
end
	local szMsg = "Ngươi gặp ta hỏi gì ?<color>\n<color=gold>*1 Huyền Tinh 8 đổi được 8 Rương\n*1 Huyền Tinh 9 đổi được 24 Rương\n*1 Huyền Tinh 10 đổi được 72 Rương";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"<color=yellow>Đổi 1 HT8",self.doi1vien8,self};
		{"<color=yellow>Đổi 1 HT9",self.doi1vien9,self};
		{"<color=yellow>Đổi 1 HT10",self.doi1vien10,self};
		{"<color=yellow>Đổi Tất Cả HT8 Lấy Rương Trang Bị Đồng Hành",self.doitatcaht8,self};
		{"<color=yellow>Đổi Tất Cả HT9 Lấy Rương Trang Bị Đồng Hành",self.doitatcaht9,self};
		{"<color=yellow>Đổi Tất Cả HT10 Lấy Rương Trang Bị Đồng Hành",self.doitatcaht10,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function TB_DongHanh:doi1vien8()
local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 8 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
Task:DelItem(me, tbHuyenTinh, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,8);
	me.Msg("Đổi thành công <color=purple>8 Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 8<color><color>");
elseif nSoLuongHT1 > 0 then
Task:DelItem(me, tbHuyenTinh1, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,8);
	me.Msg("Đổi thành công <color=purple>8 Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 8<color><color>");
end
end

function TB_DongHanh:doitatcaht8()
local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 8 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
local nSoHT = nSoLuongHT*8
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 8<color><color>");
elseif nSoLuongHT1 > 0 then
local nSoHT = nSoLuongHT1*8
Task:DelItem(me, tbHuyenTinh1, tbHuyenTinh1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 8<color><color>");
end
end


function TB_DongHanh:doi1vien9()
local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,9}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,9) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,9)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 9 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
Task:DelItem(me, tbHuyenTinh, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,24);
	me.Msg("Đổi thành công <color=purple>24 Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 9<color><color>");
elseif nSoLuongHT1 > 0 then
Task:DelItem(me, tbHuyenTinh1, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,24);
	me.Msg("Đổi thành công <color=purple>24 Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 9<color><color>");
end
end

function TB_DongHanh:doitatcaht9()
local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,9}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,9) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,9)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 9 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
local nSoHT = nSoLuongHT*24
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 9<color><color>");
elseif nSoLuongHT1 > 0 then
local nSoHT = nSoLuongHT1*24
Task:DelItem(me, tbHuyenTinh1, tbHuyenTinh1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 9<color><color>");
end
end

function TB_DongHanh:doi1vien10()
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,10}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,10) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,10)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 10 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
Task:DelItem(me, tbHuyenTinh, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,72);
	me.Msg("Đổi thành công <color=purple>72 Rương trang bị đồng hành 5 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 10<color><color>");
elseif nSoLuongHT1 > 0 then
Task:DelItem(me, tbHuyenTinh1, 1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,72);
	me.Msg("Đổi thành công <color=purple>72 Rương trang bị đồng hành 5 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 10<color><color>");
end
end

function TB_DongHanh:doitatcaht10()
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,10}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,10) 
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,10)
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 10 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT > 0 then
local nSoHT = nSoLuongHT*72
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 10<color><color>");
elseif nSoLuongHT1 > 0 then
local nSoHT = nSoLuongHT1*72
Task:DelItem(me, tbHuyenTinh1, tbHuyenTinh1);
    me.AddStackItem(18,1,1875,1,tbItemInfo,nSoHT);
	me.Msg("Đổi thành công <color=purple>"..nSoHT.." Rương trang bị đồng hành 10 món<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 10<color><color>");
end
end

function TB_DongHanh:NangCapTBDongHanh(nSkillId)
	local nLevel = me.GetSkillLevel(nSkillId);
	if nLevel < 1 then
		nLevel = 0;
	end
	local nLevelSkill = nLevel + 1;
	if nLevelSkill > nGioiHanSkill then
		Dialog:Say("Máy chủ đang mở giới hạn đến cấp "..nGioiHanSkill.."");
		return 0;
	end
	local szSkillName = KFightSkill.GetSkillName(nSkillId);
	local szTitle = "Nâng Cấp <color=yellow>"..szSkillName.." Cấp "..nLevelSkill.."<color>\n"..
					"<color=yellow>Hãy đặt vào<color> \n"..tbArray_nSumTB[nLevelSkill].." <color=yellow>"..KItem.GetNameById(unpack(tbArray_TB[nSkillId])).."<color>"..
					"+"..tbArray_nSumDanhBoLenh[nLevelSkill].." <color=yellow>"..KItem.GetNameById(unpack(tbArray_DanhBoLenh[nSkillId])).."<color>\n"..
					"+"..tbArray_nSumKNB[nLevelSkill].." <color=yellow>"..KItem.GetNameById(unpack(tbArray_KNB[nSkillId])).."<color>\n"..
					"Thu Phí <color=yellow>"..self:FormatMoney(tbArray_nSumBac[nLevelSkill]).." bạc<color>\n"..
					"+ \n"..tbArray_nSumHT[nLevelSkill].." <color=yellow>"..KItem.GetNameById(unpack(tbArray_HT[nSkillId])).."<color>\n"..
					"Nên nhớ là ht9 có ID 114!!!\n"..
					"Suy nghĩ thật kĩ trước khi đồng ý\n"..
	"";
	Dialog:OpenGift(szTitle, nil, {self.OnOpenUp, self,nSkillId});	
end

function TB_DongHanh:OnOpenUp(nSkillId,tbItemObj)
	local nLevel = me.GetSkillLevel(nSkillId);
	if nLevel < 1 then
		nLevel = 0;
	end
	local nLevelSkill = nLevel + 1;
	local szSkillName = KFightSkill.GetSkillName(nSkillId);
	local szItemName = KItem.GetNameById(unpack(tbArray_TB[nSkillId]));
	local szItemName1 = KItem.GetNameById(unpack(tbArray_KNB[nSkillId]))
	local szItemName2 = KItem.GetNameById(unpack(tbArray_DanhBoLenh[nSkillId]))
	local szItemName3 = KItem.GetNameById(unpack(tbArray_HT[nSkillId]))
	local tbItem = {unpack(tbArray_TB[nSkillId])};
	local tbItem2 = {unpack(tbArray_KNB[nSkillId])};
	local tbItem3 = {unpack(tbArray_DanhBoLenh[nSkillId])};
	local tbItem4 = {unpack(tbArray_HT[nSkillId])};
	
	local nCheck = 0;
	local nCount = 0;
	local nCount1 = 0;
	local nCount2 = 0;
	local nCount3 = 0;
	for i, pItem in pairs(tbItemObj) do
		if (pItem[1].nGenre == tbItem[1] and
			pItem[1].nDetail == tbItem[2] and
			pItem[1].nParticular == tbItem[3] and
			pItem[1].nLevel == tbItem[4]) then
			nCount = nCount + pItem[1].nCount;
		elseif (pItem[1].nGenre == tbItem2[1] and
			pItem[1].nDetail == tbItem2[2] and
			pItem[1].nParticular == tbItem2[3] and
			pItem[1].nLevel == tbItem2[4]) then
			nCount1 = nCount1 + pItem[1].nCount;			
		elseif (pItem[1].nGenre == tbItem3[1] and
			pItem[1].nDetail == tbItem3[2] and
			pItem[1].nParticular == tbItem3[3] and
			pItem[1].nLevel == tbItem3[4]) then
			nCount2 = nCount2 + pItem[1].nCount;			
		elseif (pItem[1].nGenre == tbItem4[1] and
			pItem[1].nDetail == tbItem4[2] and
			pItem[1].nParticular == tbItem4[3] and
			pItem[1].nLevel == tbItem4[4]) then
			nCount3 = nCount3 + pItem[1].nCount;			
		else
			nCheck = 1;
			break;
		end
	end
	
	if (nCheck > 0) then
		Dialog:Say("Nguyên Liệu đưa vào không hợp yêu cầu");
		return 0;
	end
	if nCount ~= tbArray_nSumTB[nLevelSkill] then
		Dialog:Say("Hãy đặt vào "..tbArray_nSumTB[nLevelSkill].." "..szItemName.."");
		return 0;
	end

	if nCount1 ~= tbArray_nSumKNB[nLevelSkill] then
		Dialog:Say("Hãy đặt vào "..tbArray_nSumKNB[nLevelSkill].." "..szItemName1.."");
		return 0;
	end	
	if nCount3 ~= tbArray_nSumHT[nLevelSkill] then
		Dialog:Say("Hãy đặt vào "..tbArray_nSumHT[nLevelSkill].." "..szItemName3.."");
		return 0;
	end	
	if nCount2 ~= tbArray_nSumDanhBoLenh[nLevelSkill] then
		Dialog:Say("Hãy đặt vào "..tbArray_nSumDanhBoLenh[nLevelSkill].." "..szItemName2.."");
		return 0;
	end
	
	if (me.nCashMoney < tbArray_nSumBac[nLevelSkill]) then
		Dialog:Say("Không có đủ <color=green>"..self:FormatMoney(tbArray_nSumBac[nLevelSkill]).." Bạc tronh hành trang<color>");
		return 0;
	end	
	
	for _, pItem in pairs(tbItemObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end	
	
	me.CostMoney(tbArray_nSumBac[nLevelSkill],0);-- tru bac trong hanh trang
	me.AddFightSkill(nSkillId,nLevelSkill);
	local szThongBao = "<color=blue>"..me.szName.."<color> đã nâng cấp thành công <color=blue>"..szSkillName.." Cấp "..nLevelSkill.."<color>"
	KDialog.MsgToGlobal(szThongBao);
end
function TB_DongHanh:FormatMoney(nMoney)
	local szMoney = "";
	if (not nMoney) or (nMoney < 0) then
		return	"Vô hiệu";								--
	end
	if (nMoney >= 100000000) then
		szMoney = szMoney..tostring(math.floor(nMoney / 100000000)).." ức";
		nMoney = nMoney % 100000000;
	end
	if (nMoney >= 10000) then
		szMoney = szMoney..tostring(math.floor(nMoney / 10000)).." vạn";
		nMoney = nMoney % 10000;
	end
	if (nMoney > 0) then
		szMoney = szMoney..tostring(nMoney);
	end
	if (szMoney == "") then
		szMoney = "0";
	end
	return	szMoney;
end