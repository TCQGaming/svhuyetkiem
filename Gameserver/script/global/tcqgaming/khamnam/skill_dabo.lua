
SpecialEvent.HieuUng_DaBo = SpecialEvent.HieuUng_DaBo or {};
local tbHieuUng = SpecialEvent.HieuUng_DaBo;

local nSkillId_DaBo = 1908;--Kỹ năng đá bộ

local nSkillId_Non_A = 1867;
local nSkillId_Non_B = 1868;
local nSkillId_Non_C = 1869;
local nSkillId_Ao_A = 1870;
local nSkillId_Ao_B = 1871;
local nSkillId_Ao_C = 1872;
local nSkillId_Lung_A = 1873;
local nSkillId_Lung_B = 1874;
local nSkillId_Lung_C = 1875;
local nSkillId_Tay_A = 1876;
local nSkillId_Tay_B = 1877;
local nSkillId_Tay_C = 1878;
local nSkillId_Giay_A = 1879;
local nSkillId_Giay_B = 1880;
local nSkillId_Giay_C = 1881;
local nSkillId_VuKhi_A = 1882;
local nSkillId_VuKhi_B = 1883;
local nSkillId_VuKhi_C = 1884;
local nSkillId_Lien_A = 1885;
local nSkillId_Lien_B = 1886;
local nSkillId_Lien_C = 1887;
local nSkillId_Nhan_A = 1888;
local nSkillId_Nhan_B = 1889;
local nSkillId_Nhan_C = 1890;
local nSkillId_Boi_A = 1891;
local nSkillId_Boi_B = 1892;
local nSkillId_Boi_C = 1893;
local nSkillId_Phu_A = 1894;
local nSkillId_Phu_B = 1895;
local nSkillId_Phu_C = 1896;
local nSkillId_Ngua_A_1 = 1901;
local nSkillId_Ngua_A_2 = 1902;
local nSkillId_Ngua_A_3 = 1903;
local nSkillId_Ngua_A_4 = 1904;
local nSkillId_Ngua_A_5 = 1905;
local nSkillId_Ngua_B = 1906;
local nSkillId_Ngua_C = 1907;


local nGioiHanSkill = 10; -- gioi han nang cap dong hanh toi da
function tbHieuUng:OnDialog()

	local nLever_Da_Bo = me.GetSkillLevel(nSkillId_DaBo);

	if nLever_Da_Bo < 1 then
		nLever_Da_Bo = 0;
	end

	local szSkillName = KFightSkill.GetSkillName(nSkillId_DaBo);

	local szMsg = "Chức năng kích hoạt hiệu ứng đá bộ:\n"..
				"<color=yellow>Kỹ năng đá bộ:<color>: Cần toàn bộ đá khảm vào toàn bộ vị trí từ cấp 1 trở lên\n"..
		"";
	local tbOpt = 
	{
		{"Kích Hoạt "..szSkillName.." Cấp "..(nLever_Da_Bo+1).."", self.KichHoat_DaBo, self,nSkillId_DaBo},	

		{"Kết thúc đối thoại"},
	}

	Dialog:Say(szMsg, tbOpt);	
end

function tbHieuUng:KichHoat_DaBo(nSkillId_DaBo)
	local nLevel = me.GetSkillLevel(nSkillId_DaBo);
	local szSkillName = KFightSkill.GetSkillName(nSkillId_DaBo);
-- Nón

local nLevelYeuCau1 = me.GetSkillLevel(nSkillId_Non_A)
local szSkillNameYeuCau1 = KFightSkill.GetSkillName(nSkillId_Non_A)

local nLevelYeuCau2 = me.GetSkillLevel(nSkillId_Non_B)
local szSkillNameYeuCau2 = KFightSkill.GetSkillName(nSkillId_Non_B)

local nLevelYeuCau3 = me.GetSkillLevel(nSkillId_Non_C)
local szSkillNameYeuCau3 = KFightSkill.GetSkillName(nSkillId_Non_C)

-- Áo
local nLevelYeuCau4 = me.GetSkillLevel(nSkillId_Ao_A)
local szSkillNameYeuCau4 = KFightSkill.GetSkillName(nSkillId_Ao_A)

local nLevelYeuCau5 = me.GetSkillLevel(nSkillId_Ao_B)
local szSkillNameYeuCau5 = KFightSkill.GetSkillName(nSkillId_Ao_B)

local nLevelYeuCau6 = me.GetSkillLevel(nSkillId_Ao_C)
local szSkillNameYeuCau6 = KFightSkill.GetSkillName(nSkillId_Ao_C)

-- Lung
local nLevelYeuCau7 = me.GetSkillLevel(nSkillId_Lung_A)
local szSkillNameYeuCau7 = KFightSkill.GetSkillName(nSkillId_Lung_A)

local nLevelYeuCau8 = me.GetSkillLevel(nSkillId_Lung_B)
local szSkillNameYeuCau8 = KFightSkill.GetSkillName(nSkillId_Lung_B)

local nLevelYeuCau9 = me.GetSkillLevel(nSkillId_Lung_C)
local szSkillNameYeuCau9 = KFightSkill.GetSkillName(nSkillId_Lung_C)

-- Tay
local nLevelYeuCau10 = me.GetSkillLevel(nSkillId_Tay_A)
local szSkillNameYeuCau10 = KFightSkill.GetSkillName(nSkillId_Tay_A)

local nLevelYeuCau11 = me.GetSkillLevel(nSkillId_Tay_B)
local szSkillNameYeuCau11 = KFightSkill.GetSkillName(nSkillId_Tay_B)

local nLevelYeuCau12 = me.GetSkillLevel(nSkillId_Tay_C)
local szSkillNameYeuCau12 = KFightSkill.GetSkillName(nSkillId_Tay_C)

-- Giày
local nLevelYeuCau13 = me.GetSkillLevel(nSkillId_Giay_A)
local szSkillNameYeuCau13 = KFightSkill.GetSkillName(nSkillId_Giay_A)

local nLevelYeuCau14 = me.GetSkillLevel(nSkillId_Giay_B)
local szSkillNameYeuCau14 = KFightSkill.GetSkillName(nSkillId_Giay_B)

local nLevelYeuCau15 = me.GetSkillLevel(nSkillId_Giay_C)
local szSkillNameYeuCau15 = KFightSkill.GetSkillName(nSkillId_Giay_C)

-- Vũ khí
local nLevelYeuCau16 = me.GetSkillLevel(nSkillId_VuKhi_A)
local szSkillNameYeuCau16 = KFightSkill.GetSkillName(nSkillId_VuKhi_A)

local nLevelYeuCau17 = me.GetSkillLevel(nSkillId_VuKhi_B)
local szSkillNameYeuCau17 = KFightSkill.GetSkillName(nSkillId_VuKhi_B)

local nLevelYeuCau18 = me.GetSkillLevel(nSkillId_VuKhi_C)
local szSkillNameYeuCau18 = KFightSkill.GetSkillName(nSkillId_VuKhi_C)

-- Liên
local nLevelYeuCau19 = me.GetSkillLevel(nSkillId_Lien_A)
local szSkillNameYeuCau19 = KFightSkill.GetSkillName(nSkillId_Lien_A)

local nLevelYeuCau20 = me.GetSkillLevel(nSkillId_Lien_B)
local szSkillNameYeuCau20 = KFightSkill.GetSkillName(nSkillId_Lien_B)

local nLevelYeuCau21 = me.GetSkillLevel(nSkillId_Lien_C)
local szSkillNameYeuCau21 = KFightSkill.GetSkillName(nSkillId_Lien_C)

-- Nhẫn
local nLevelYeuCau22 = me.GetSkillLevel(nSkillId_Nhan_A)
local szSkillNameYeuCau22 = KFightSkill.GetSkillName(nSkillId_Nhan_A)

local nLevelYeuCau23 = me.GetSkillLevel(nSkillId_Nhan_B)
local szSkillNameYeuCau23 = KFightSkill.GetSkillName(nSkillId_Nhan_B)

local nLevelYeuCau24 = me.GetSkillLevel(nSkillId_Nhan_C)
local szSkillNameYeuCau24 = KFightSkill.GetSkillName(nSkillId_Nhan_C)

-- Bối
local nLevelYeuCau25 = me.GetSkillLevel(nSkillId_Boi_A)
local szSkillNameYeuCau25 = KFightSkill.GetSkillName(nSkillId_Boi_A)

local nLevelYeuCau26 = me.GetSkillLevel(nSkillId_Boi_B)
local szSkillNameYeuCau26 = KFightSkill.GetSkillName(nSkillId_Boi_B)

local nLevelYeuCau27 = me.GetSkillLevel(nSkillId_Boi_C)
local szSkillNameYeuCau27 = KFightSkill.GetSkillName(nSkillId_Boi_C)
-- Phụ
local nLevelYeuCau28 = me.GetSkillLevel(nSkillId_Phu_A)
local szSkillNameYeuCau28 = KFightSkill.GetSkillName(nSkillId_Phu_A)

local nLevelYeuCau29 = me.GetSkillLevel(nSkillId_Phu_B)
local szSkillNameYeuCau29 = KFightSkill.GetSkillName(nSkillId_Phu_B)

local nLevelYeuCau30 = me.GetSkillLevel(nSkillId_Phu_C)
local szSkillNameYeuCau30 = KFightSkill.GetSkillName(nSkillId_Phu_C)
-- Ngựa
local nLevelYeuCau36 = me.GetSkillLevel(nSkillId_Ngua_B)
local szSkillNameYeuCau36 = KFightSkill.GetSkillName(nSkillId_Ngua_B)

local nLevelYeuCau37 = me.GetSkillLevel(nSkillId_Ngua_C)
local szSkillNameYeuCau37 = KFightSkill.GetSkillName(nSkillId_Ngua_C)

-- Đoạn mã này có thể được sao chép và dán cho các món trang bị khác để lấy thông tin tương tự.

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
	local arrNguaSkillIds = {nSkillId_Ngua_A_1, nSkillId_Ngua_A_2, nSkillId_Ngua_A_3, nSkillId_Ngua_A_4, nSkillId_Ngua_A_5}
local bNguaSkillRequirementMet = false

for i = 1, #arrNguaSkillIds do
	local nLevelNguaSkill = me.GetSkillLevel(arrNguaSkillIds[i])
	local szNguaSkillName = KFightSkill.GetSkillName(arrNguaSkillIds[i])
	if nLevelNguaSkill >= nLevelSkill then
		bNguaSkillRequirementMet = true
		break
	end
end

if not bNguaSkillRequirementMet then
	Dialog:Say("Ngựa kháng chưa đạt cấp "..nLevelSkill.."")
	return 0
end

local arrSkillIds = {
	nSkillId_Non_A, nSkillId_Non_B, nSkillId_Non_C,
	nSkillId_Ao_A, nSkillId_Ao_B, nSkillId_Ao_C,
	nSkillId_Lung_A, nSkillId_Lung_B, nSkillId_Lung_C,
	nSkillId_Tay_A, nSkillId_Tay_B, nSkillId_Tay_C,
	nSkillId_Giay_A, nSkillId_Giay_B, nSkillId_Giay_C,
	nSkillId_VuKhi_A, nSkillId_VuKhi_B, nSkillId_VuKhi_C,
	nSkillId_Lien_A, nSkillId_Lien_B, nSkillId_Lien_C,
	nSkillId_Nhan_A, nSkillId_Nhan_B, nSkillId_Nhan_C,
	nSkillId_Boi_A, nSkillId_Boi_B, nSkillId_Boi_C,
	nSkillId_Phu_A, nSkillId_Phu_B, nSkillId_Phu_C,
	nSkillId_Ngua_B, nSkillId_Ngua_C
}

for i = 1, #arrSkillIds do
	local nLevelYeuCau = me.GetSkillLevel(arrSkillIds[i])
	local szSkillNameYeuCau = KFightSkill.GetSkillName(arrSkillIds[i])
	if nLevelYeuCau < nLevelSkill then
		Dialog:Say(""..szSkillNameYeuCau.." chưa đạt cấp "..nLevelSkill.."")
		return 0
	end
end

	------------------------------
	me.AddFightSkill(nSkillId_DaBo,nLevelSkill);
	local szThongBao = "<color=blue>"..me.szName.."<color> đã kích hoạt thành công <color=blue>"..szSkillName.." Cấp "..nLevelSkill.."<color>"
	KDialog.MsgToGlobal(szThongBao);
end
