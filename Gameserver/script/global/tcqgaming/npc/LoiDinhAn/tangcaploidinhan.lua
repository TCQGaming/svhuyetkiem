-----Dev : TCQGaming
-----Time : 17/10/2023 11:00 PM
local tbMainLoiDinhAnTangCap = {}
SpecialEvent.tbMainLoiDinhAnTangCap = tbMainLoiDinhAnTangCap

function tbMainLoiDinhAnTangCap:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\tangcaploidinhan.lua");
	local szMsg = "Trang bị Lôi Đình Ấn lên F1 trước khi tiến hành tăng cấp\n\n<color=gold>Ký hiệu:<color>\n- NHHT = Ngũ Hành Hồn Thạch\n<color=gold>Tỷ lệ cường hóa:<color>\n- 1 Điểm Cường Hóa = 80 NHHT";
	local tbOpt = 
	{
		{"Cường Hóa Lôi Đình Ấn (Dòng 1)",self.CuongHoa,self};
		{"Nhược Hóa Lôi Đình Ấn (Dòng 2)",self.NhuocHoa,self};
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbMainLoiDinhAnTangCap:CuongHoa()
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
if pSignet then
    local szName = pSignet.szName
    if szName ~= "Lôi Đình Ấn" and szName ~= "Lôi Đình Ấn-Bồi Nhung" and szName ~= "Lôi Đình Ấn-Triều Nghĩa" and szName ~= "Lôi Đình Ấn-Nhân Dũng" and szName ~= "Lôi Đình Ấn-Tư Trí" and
        szName ~= "Lôi Đình Ấn-Ngự Võ" and szName ~= "Lôi Đình Ấn-Tuyên Tiết" and szName ~= "Lôi Đình Ấn-Dực Huy" and szName ~= "Lôi Đình Ấn-Trí Quả" and szName ~= "Lôi Đình Ấn-Chấn Uy" and 
        szName ~= "Lôi Đình Ấn-Chiêu Võ"  and szName ~= "Lôi Đình Ấn-Du Kích"   and szName ~= "Lôi Đình Ấn-Du Kỵ"   and szName ~= "Lôi Đình Ấn-Ninh Viễn"   and szName ~= "Lôi Đình Ấn-Định Viễn"  and
        szName ~= "Lôi Đình Ấn-Minh Uy"  and szName ~= "Lôi Đình Ấn-Tuyên Uy"   and szName ~= "Lôi Đình Ấn-Tráng Võ"   and szName ~= "Lôi Đình Ấn-Trung Võ"   and szName ~= "Lôi Đình Ấn-Quy Đức"  and
        szName ~= "Lôi Đình Ấn-Vân Huy"  and szName ~= "Lôi Đình Ấn-Hoài Hóa"   and szName ~= "Lôi Đình Ấn-Quán Quân"   and szName ~= "Lôi Đình Ấn-Trấn Quốc"   and szName ~= "Lôi Đình Ấn-Phụ Quốc"  and
        szName ~= "Lôi Đình Ấn-Phiêu Kỵ"  then
        Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
        return 0;
    end
end

if me.nLevel >= 120 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1100
	end
if me.nLevel >= 130 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1300
	end
if me.nLevel >= 140 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1500
end
	local szMsg = "";
	szMsg = szMsg .. string.format("Đằng cấp hiện tại của bạn là "..me.nLevel.." có thể Cường/Nhược Hóa đến <color=yellow>%s điểm<color><enter>Lựa chọn số điểm muốn Cường Hóa Lôi Đình Ấn:",tbMainLoiDinhAnTangCap.nDiemAn);
	local tbOpt = 
	{
		{"Cường Hóa +100 điểm = 8000 NHHT",self.CuongHoa100,self,1},
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbMainLoiDinhAnTangCap:CuongHoa100(nMagicIndex)
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
if pSignet then
    local szName = pSignet.szName
    if szName ~= "Lôi Đình Ấn" and szName ~= "Lôi Đình Ấn-Bồi Nhung" and szName ~= "Lôi Đình Ấn-Triều Nghĩa" and szName ~= "Lôi Đình Ấn-Nhân Dũng" and szName ~= "Lôi Đình Ấn-Tư Trí" and
        szName ~= "Lôi Đình Ấn-Ngự Võ" and szName ~= "Lôi Đình Ấn-Tuyên Tiết" and szName ~= "Lôi Đình Ấn-Dực Huy" and szName ~= "Lôi Đình Ấn-Trí Quả" and szName ~= "Lôi Đình Ấn-Chấn Uy" and 
        szName ~= "Lôi Đình Ấn-Chiêu Võ"  and szName ~= "Lôi Đình Ấn-Du Kích"   and szName ~= "Lôi Đình Ấn-Du Kỵ"   and szName ~= "Lôi Đình Ấn-Ninh Viễn"   and szName ~= "Lôi Đình Ấn-Định Viễn"  and
        szName ~= "Lôi Đình Ấn-Minh Uy"  and szName ~= "Lôi Đình Ấn-Tuyên Uy"   and szName ~= "Lôi Đình Ấn-Tráng Võ"   and szName ~= "Lôi Đình Ấn-Trung Võ"   and szName ~= "Lôi Đình Ấn-Quy Đức"  and
        szName ~= "Lôi Đình Ấn-Vân Huy"  and szName ~= "Lôi Đình Ấn-Hoài Hóa"   and szName ~= "Lôi Đình Ấn-Quán Quân"   and szName ~= "Lôi Đình Ấn-Trấn Quốc"   and szName ~= "Lôi Đình Ấn-Phụ Quốc"  and
        szName ~= "Lôi Đình Ấn-Phiêu Kỵ"  then
        Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
        return 0;
    end
end
	
	local nCount1 = me.GetItemCountInBags(18,1,205,1) -- Ngũ hành hồn thạch
	if nCount1 < 8000 then
		Dialog:Say("Trong hành trang không đủ <color=red>8000 Ngũ Hành Hồn Thạch<color> yêu cầu");
		return 0;
	end

if me.nLevel >= 120 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1100
	end
if me.nLevel >= 130 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1300
	end
if me.nLevel >= 140 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1500
end
	local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
	if nLevel >= tbMainLoiDinhAnTangCap.nDiemAn then
		Dialog:Say("Ấn đã thăng cấp tối đa.");
		return 0;
	end	
	local tbItemId1	= {18,1,205,1,0,0};
	Task:DelItem(me, tbItemId1, 8000);
	if nLevel == 1 then 
	nLevel = nLevel + 99;	
	elseif nLevel == 101 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 201 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 301 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 401 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 501 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 601 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 701 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 801 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 901 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1001 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1101 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1201 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1301 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1401 then 
			nLevel = nLevel + 99;	
	else 
	nLevel = nLevel + 100;
	end 
	Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
	Dialog:Say("<color=yellow>Cường Hóa - Lôi Đình Ấn<color> thành công <color=yellow>100 điểm<color>");
end

function tbMainLoiDinhAnTangCap:NhuocHoa()
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
if pSignet then
    local szName = pSignet.szName
    if szName ~= "Lôi Đình Ấn" and szName ~= "Lôi Đình Ấn-Bồi Nhung" and szName ~= "Lôi Đình Ấn-Triều Nghĩa" and szName ~= "Lôi Đình Ấn-Nhân Dũng" and szName ~= "Lôi Đình Ấn-Tư Trí" and
        szName ~= "Lôi Đình Ấn-Ngự Võ" and szName ~= "Lôi Đình Ấn-Tuyên Tiết" and szName ~= "Lôi Đình Ấn-Dực Huy" and szName ~= "Lôi Đình Ấn-Trí Quả" and szName ~= "Lôi Đình Ấn-Chấn Uy" and 
        szName ~= "Lôi Đình Ấn-Chiêu Võ"  and szName ~= "Lôi Đình Ấn-Du Kích"   and szName ~= "Lôi Đình Ấn-Du Kỵ"   and szName ~= "Lôi Đình Ấn-Ninh Viễn"   and szName ~= "Lôi Đình Ấn-Định Viễn"  and
        szName ~= "Lôi Đình Ấn-Minh Uy"  and szName ~= "Lôi Đình Ấn-Tuyên Uy"   and szName ~= "Lôi Đình Ấn-Tráng Võ"   and szName ~= "Lôi Đình Ấn-Trung Võ"   and szName ~= "Lôi Đình Ấn-Quy Đức"  and
        szName ~= "Lôi Đình Ấn-Vân Huy"  and szName ~= "Lôi Đình Ấn-Hoài Hóa"   and szName ~= "Lôi Đình Ấn-Quán Quân"   and szName ~= "Lôi Đình Ấn-Trấn Quốc"   and szName ~= "Lôi Đình Ấn-Phụ Quốc"  and
        szName ~= "Lôi Đình Ấn-Phiêu Kỵ"  then
        Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
        return 0;
    end
end

if me.nLevel >= 120 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1100
	end
if me.nLevel >= 130 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1300
	end
if me.nLevel >= 140 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1500
end
	local szMsg = "";
	szMsg = szMsg .. string.format("Đằng cấp hiện tại của bạn là "..me.nLevel.." có thể Cường/Nhược Hóa đến <color=yellow>%s điểm<color><enter>Lựa chọn số điểm muốn Nhược Hóa Lôi Đình Ấn:",tbMainLoiDinhAnTangCap.nDiemAn);
	local tbOpt = 
	{
		{"Nhược Hóa +100 điểm = 8000 NHHT",self.NhuocHoa100,self,2},
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbMainLoiDinhAnTangCap:NhuocHoa100(nMagicIndex)
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
if pSignet then
    local szName = pSignet.szName
    if szName ~= "Lôi Đình Ấn" and szName ~= "Lôi Đình Ấn-Bồi Nhung" and szName ~= "Lôi Đình Ấn-Triều Nghĩa" and szName ~= "Lôi Đình Ấn-Nhân Dũng" and szName ~= "Lôi Đình Ấn-Tư Trí" and
        szName ~= "Lôi Đình Ấn-Ngự Võ" and szName ~= "Lôi Đình Ấn-Tuyên Tiết" and szName ~= "Lôi Đình Ấn-Dực Huy" and szName ~= "Lôi Đình Ấn-Trí Quả" and szName ~= "Lôi Đình Ấn-Chấn Uy" and 
        szName ~= "Lôi Đình Ấn-Chiêu Võ"  and szName ~= "Lôi Đình Ấn-Du Kích"   and szName ~= "Lôi Đình Ấn-Du Kỵ"   and szName ~= "Lôi Đình Ấn-Ninh Viễn"   and szName ~= "Lôi Đình Ấn-Định Viễn"  and
        szName ~= "Lôi Đình Ấn-Minh Uy"  and szName ~= "Lôi Đình Ấn-Tuyên Uy"   and szName ~= "Lôi Đình Ấn-Tráng Võ"   and szName ~= "Lôi Đình Ấn-Trung Võ"   and szName ~= "Lôi Đình Ấn-Quy Đức"  and
        szName ~= "Lôi Đình Ấn-Vân Huy"  and szName ~= "Lôi Đình Ấn-Hoài Hóa"   and szName ~= "Lôi Đình Ấn-Quán Quân"   and szName ~= "Lôi Đình Ấn-Trấn Quốc"   and szName ~= "Lôi Đình Ấn-Phụ Quốc"  and
        szName ~= "Lôi Đình Ấn-Phiêu Kỵ"  then
        Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp");
        return 0;
    end
end
	
	local nCount1 = me.GetItemCountInBags(18,1,205,1) -- Ngũ hành hồn thạch
	if nCount1 < 8000 then
		Dialog:Say("Trong hành trang không đủ <color=red>8000 Ngũ Hành Hồn Thạch<color> yêu cầu");
		return 0;
	end

if me.nLevel >= 120 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1100
	end
if me.nLevel >= 130 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1300
	end
if me.nLevel >= 140 then
	tbMainLoiDinhAnTangCap.nDiemAn = 1500
end
	local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
	if nLevel >= tbMainLoiDinhAnTangCap.nDiemAn then
		Dialog:Say("Ấn đã thăng cấp tối đa.");
		return 0;
	end	
	local tbItemId1	= {18,1,205,1,0,0};
	Task:DelItem(me, tbItemId1, 8000);
	if nLevel == 1 then 
	nLevel = nLevel + 99;	
	elseif nLevel == 101 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 201 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 301 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 401 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 501 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 601 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 701 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 801 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 901 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1001 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1101 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1201 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1301 then 
			nLevel = nLevel + 99;	
	elseif nLevel == 1401 then 
			nLevel = nLevel + 99;	
	else 
	nLevel = nLevel + 100;
	end 
	Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
	Dialog:Say("<color=yellow>Cường Hóa - Lôi Đình Ấn<color> thành công <color=yellow>100 điểm<color>");
end
