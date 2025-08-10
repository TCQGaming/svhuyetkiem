
SpecialEvent.HieuUng_DongHanh = SpecialEvent.HieuUng_DongHanh or {};
local tbHieuUng = SpecialEvent.HieuUng_DongHanh;

local nSkillId_1 = 1979;--Cố Nguyên Quyết
local nSkillId_2 = 1980;--Ngự Kình Quyết
local nSkillId_3 = 1981;--Hỗn Nguyên Quyết

local nSkillId_PetVK = 1982;
local nSkillId_PetAo = 1983;
local nSkillId_PetNhan = 1984;
local nSkillId_PetTay = 1985;
local nSkillId_PetPhu = 1986;
local nSkillId_PetLien = 1987;
local nSkillId_PetLung = 1988;
local nSkillId_PetGiay = 1989;
local nSkillId_PetBoi = 1990;
local nSkillId_PetNon = 1991;

local nGioiHanSkill = 4; -- gioi han nang cap dong hanh toi da
function tbHieuUng:OnDialog()
    local nLevelVKhi = me.GetSkillLevel(nSkillId_PetVK)
    local nLevelAo = me.GetSkillLevel(nSkillId_PetAo)
    local nLevelNhan = me.GetSkillLevel(nSkillId_PetNhan)
    local nLevelTay = me.GetSkillLevel(nSkillId_PetTay)
    local nLevelPhu = me.GetSkillLevel(nSkillId_PetPhu)
    local nLevelLien = me.GetSkillLevel(nSkillId_PetLien)
    local nLevelLung = me.GetSkillLevel(nSkillId_PetLung)
    local nLevelGiay = me.GetSkillLevel(nSkillId_PetGiay)
    local nLevelBoi = me.GetSkillLevel(nSkillId_PetBoi)
    local nLevelNon = me.GetSkillLevel(nSkillId_PetNon)

    local szSkillName_VuKhi = KFightSkill.GetSkillName(nSkillId_PetVK)
    local szSkillName_Ao = KFightSkill.GetSkillName(nSkillId_PetAo)
    local szSkillName_Nhan = KFightSkill.GetSkillName(nSkillId_PetNhan)
    local szSkillName_Tay = KFightSkill.GetSkillName(nSkillId_PetTay)
    local szSkillName_Phu = KFightSkill.GetSkillName(nSkillId_PetPhu)
    local szSkillName_Lien = KFightSkill.GetSkillName(nSkillId_PetLien)
    local szSkillName_Lung = KFightSkill.GetSkillName(nSkillId_PetLung)
    local szSkillName_Giay = KFightSkill.GetSkillName(nSkillId_PetGiay)
    local szSkillName_Boi = KFightSkill.GetSkillName(nSkillId_PetBoi)
    local szSkillName_Non = KFightSkill.GetSkillName(nSkillId_PetNon)
	local nLevelCNQ = me.GetSkillLevel(nSkillId_1);
	local nLevelNKQ = me.GetSkillLevel(nSkillId_2);
	local nLevelHNQ = me.GetSkillLevel(nSkillId_3);
	if nLevelCNQ < 1 then
		nLevelCNQ = 0;
	end
	if nLevelNKQ < 1 then
		nLevelNKQ = 0;
	end	
	if nLevelHNQ < 1 then
		nLevelHNQ = 0;
	end		
	local szSkillName = KFightSkill.GetSkillName(nSkillId_1);
	local szSkillName1 = KFightSkill.GetSkillName(nSkillId_2);
	local szSkillName2 = KFightSkill.GetSkillName(nSkillId_3);
	 local szSkillName_VuKhi = KFightSkill.GetSkillName(nSkillId_PetVK);
	 local szSkillName_Ao = KFightSkill.GetSkillName(nSkillId_PetAo);
	 local szSkillName_Nhan = KFightSkill.GetSkillName(nSkillId_PetNhan);
	 local szSkillName_Tay = KFightSkill.GetSkillName(nSkillId_PetTay);
	 local szSkillName_Phu = KFightSkill.GetSkillName(nSkillId_PetPhu);
	 local szSkillName_Lien = KFightSkill.GetSkillName(nSkillId_PetLien);
	 local szSkillName_Lung = KFightSkill.GetSkillName(nSkillId_PetLung);
	 local szSkillName_Giay = KFightSkill.GetSkillName(nSkillId_PetGiay);
	 local szSkillName_Boi = KFightSkill.GetSkillName(nSkillId_PetBoi);
	 local szSkillName_Non = KFightSkill.GetSkillName(nSkillId_PetNon);
local szMsg = "Chức năng kích hoạt hiệu ứng trang bị đồng hành:\n" ..
                "<color=yellow>Cố Nguyên Quyết:<color>:" .. szSkillName_VuKhi .. "+ " .. szSkillName_Ao .. " + " .. szSkillName_Phu .. " từ cấp 1 trở lên\n" ..
                "<color=yellow>Ngự Kinh Quyết:<color>:" .. szSkillName_Nhan .. "+ " .. szSkillName_Tay .. " + " .. szSkillName_Lung .. " từ cấp 1 trở lên\n" ..
                "<color=yellow>Hỗn Nguyên Quyết:<color>:" .. szSkillName_Non .. "+ " .. szSkillName_Giay .. " + " .. szSkillName_Boi .. " từ cấp 1 trở lên\n"

if nLevelVKhi > 0 and nLevelAo > 0 and nLevelPhu > 0 then 
    szMsg = szMsg .. "<color=yellow>Bạn đang có:<color>:" .. szSkillName_VuKhi .. " cấp " .. nLevelVKhi .. "+ " .. szSkillName_Ao .. " cấp " .. nLevelAo .. " + " .. szSkillName_Phu .. " cấp " .. nLevelPhu .. "\n"
end 

if nLevelNhan > 0 and nLevelTay > 0 and nLevelLung > 0 then 
    szMsg = szMsg .. "<color=yellow>Bạn đang có:<color>:" .. szSkillName_Nhan .. " cấp " .. nLevelNhan .. "+ " .. szSkillName_Tay .. " cấp " .. nLevelTay .. " + " .. szSkillName_Lung .. " cấp " .. nLevelLung .. "\n"
end 

if nLevelNon > 0 and nLevelGiay > 0 and nLevelBoi > 0 then 
    szMsg = szMsg .. "<color=yellow>Bạn đang có:<color>:" .. szSkillName_Non .. " cấp " .. nLevelNon .. "+ " .. szSkillName_Giay .. " cấp " .. nLevelGiay .. " + " .. szSkillName_Boi .. " cấp " .. nLevelBoi .. "\n"
end 

    local tbOpt =     {} 
	local szColor = "<color=Gray>"
	    if nLevelVKhi > 0 and nLevelAo > 0 and nLevelPhu > 0 then 
					table.insert(tbOpt, {"Kích Hoạt <color=yellow>" .. szSkillName .. "<color> Cấp " .. (nLevelCNQ + 1) .. "",self.KichHoatCNQ,self,nSkillId_1});
		else 
					table.insert(tbOpt, {""..szColor.." Chưa đủ để kích hoạt Cố Nguyên Quyết"});
		end 
		 if nLevelNhan > 0 and nLevelTay > 0 and nLevelLung > 0 then 
					table.insert(tbOpt, {"Kích Hoạt <color=yellow>" .. szSkillName1 .. "<color> Cấp " .. (nLevelNKQ + 1) .. "",self.KichHoatNKQ,self,nSkillId_2});
		else 
					table.insert(tbOpt, {""..szColor.." Chưa đủ để kích hoạt Ngự Kình Quyết"});
		end
		   if nLevelNon > 0 and nLevelGiay > 0 and nLevelBoi > 0 then 
					table.insert(tbOpt, {"Kích Hoạt <color=yellow>" .. szSkillName2 .. "<color> Cấp " .. (nLevelHNQ + 1) .. "",self.KichHoatHNQ,self,nSkillId_3});
		else 
					table.insert(tbOpt, {""..szColor.." Chưa đủ để kích hoạt Hỗn Nguyên Quyết"});
		end
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
		--	vka = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
function tbHieuUng:KichHoatHNQ(nSkillId)
	local nLevel = me.GetSkillLevel(nSkillId);
	local szSkillName = KFightSkill.GetSkillName(nSkillId);
	--khai bao yeu cau
	local nLevelYeuCau1 = me.GetSkillLevel(nSkillId_PetNon);
	local szSkillNameYeuCau1 = KFightSkill.GetSkillName(nSkillId_PetNon);
	local nLevelYeuCau2 = me.GetSkillLevel(nSkillId_PetGiay);
	local szSkillNameYeuCau2 = KFightSkill.GetSkillName(nSkillId_PetGiay);
	local nLevelYeuCau3 = me.GetSkillLevel(nSkillId_PetBoi);
	local szSkillNameYeuCau3 = KFightSkill.GetSkillName(nSkillId_PetBoi);
	--------------
	if nLevel < 1 then
		nLevel = 0;
	end
	local nLevelSkill = nLevel + 1;
	if nLevelSkill > nGioiHanSkill then
		Dialog:Say("Máy chủ đang mở giới hạn đến cấp "..nGioiHanSkill.."");
		return 0;
	end	
	-- check dieu kien yeu cau -----------
	if nLevelYeuCau1 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau1.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end
	if nLevelYeuCau2 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau2.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end	
	if nLevelYeuCau3 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau3.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end

	------------------------------
	me.AddFightSkill(nSkillId,nLevelSkill);
	local szThongBao = "<color=blue>"..me.szName.."<color> đã kích hoạt thành công <color=blue>"..szSkillName.." Cấp "..nLevelSkill.."<color>"
	KDialog.MsgToGlobal(szThongBao);
end
function tbHieuUng:KichHoatNKQ(nSkillId)
	local nLevel = me.GetSkillLevel(nSkillId);
	local szSkillName = KFightSkill.GetSkillName(nSkillId);
	--khai bao yeu cau
	local nLevelYeuCau1 = me.GetSkillLevel(nSkillId_PetNhan);
	local szSkillNameYeuCau1 = KFightSkill.GetSkillName(nSkillId_PetNhan);
	local nLevelYeuCau2 = me.GetSkillLevel(nSkillId_PetTay);
	local szSkillNameYeuCau2 = KFightSkill.GetSkillName(nSkillId_PetTay);
	local nLevelYeuCau3 = me.GetSkillLevel(nSkillId_PetLung);
	local szSkillNameYeuCau3 = KFightSkill.GetSkillName(nSkillId_PetLung);
	--------------
	if nLevel < 1 then
		nLevel = 0;
	end
	local nLevelSkill = nLevel + 1;
	if nLevelSkill > nGioiHanSkill then
		Dialog:Say("Máy chủ đang mở giới hạn đến cấp "..nGioiHanSkill.."");
		return 0;
	end		
	-- check dieu kien yeu cau -----------
	if nLevelYeuCau1 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau1.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end
	if nLevelYeuCau2 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau2.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end	
	if nLevelYeuCau3 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau3.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end
	------------------------------
	me.AddFightSkill(nSkillId,nLevelSkill);
	local szThongBao = "<color=blue>"..me.szName.."<color> đã kích hoạt thành công <color=blue>"..szSkillName.." Cấp "..nLevelSkill.."<color>"
	KDialog.MsgToGlobal(szThongBao);
end
function tbHieuUng:KichHoatCNQ(nSkillId)
	local nLevel = me.GetSkillLevel(nSkillId);
	local szSkillName = KFightSkill.GetSkillName(nSkillId);
	--khai bao yeu cau
	local nLevelYeuCau1 = me.GetSkillLevel(nSkillId_PetVK);-- vu khi
	local szSkillNameYeuCau1 = KFightSkill.GetSkillName(nSkillId_PetVK);
	local nLevelYeuCau2 = me.GetSkillLevel(nSkillId_PetAo);-- ao
	local szSkillNameYeuCau2 = KFightSkill.GetSkillName(nSkillId_PetAo);
	local nLevelYeuCau3 = me.GetSkillLevel(nSkillId_PetLien);-- Lien
	local szSkillNameYeuCau3 = KFightSkill.GetSkillName(nSkillId_PetLien);
	--------------
	if nLevel < 1 then
		nLevel = 0;
	end
	local nLevelSkill = nLevel + 1;
	if nLevelSkill > nGioiHanSkill then
		Dialog:Say("Máy chủ đang mở giới hạn đến cấp "..nGioiHanSkill.."");
		return 0;
	end		
	-- check dieu kien yeu cau -----------
	if nLevelYeuCau1 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau1.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end
	if nLevelYeuCau2 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau2.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end	
	if nLevelYeuCau3 < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau3.." chưa đạt cấp "..nLevelSkill.."");
		return 0;
	end
	------------------------------
	me.AddFightSkill(nSkillId,nLevelSkill);
	local szThongBao = "<color=blue>"..me.szName.."<color> đã kích hoạt thành công <color=blue>"..szSkillName.." Cấp "..nLevelSkill.."<color>"
	KDialog.MsgToGlobal(szThongBao);
end
