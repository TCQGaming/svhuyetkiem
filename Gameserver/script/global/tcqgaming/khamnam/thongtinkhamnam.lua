Require("\\script\\misc\\c2scall.lua")
function c2s:ThongTinNV(Name)
	local nPlayerId = KGCPlayer.GetPlayerIdByName(Name);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0
	end	

local tbOptVuKhiA = {3, 6, 9, 12, 15, 20, 25, 30, 40, 50}; -- Tang sat thuong co ban, ky nang
local tbOptVuKhiB = {5, 16, 28, 43, 60, 81, 107, 140, 173, 206}; -- Tấn Công Nội Ngoại
local tbOptVuKhiC = {1, 2, 3, 4, 5, 6, 10, 15, 20, 25}; -- Bỏ qua kháng

local tbOptNonA = {50, 151, 252, 378, 530, 707, 934, 1212, 1490, 1768}; -- Sinh Lực Nội Lực
local tbOptNonB = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC
local tbOptNonC = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Khang Băng

local tbOptAoA = {50, 151, 252, 378, 530, 707, 934, 1212, 1490, 1768}; ---- Sinh Lực Nội Lực
local tbOptAoB = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC
local tbOptAoC = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Khang Hỏa

local tbOptDaiLung_A = {50, 151, 252, 378, 530, 707, 934, 1212, 1490, 1768}; ---- Sinh Lực Nội Lực
local tbOptDaiLung_B = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC
local tbOptDaiLung_C = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Khang Lôi

local tbOptTay_A = {50, 151, 252, 378, 530, 707, 934, 1212, 1490, 1768}; ---- Sinh Lực Nội Lực
local tbOptTay_B = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC
local tbOptTay_C = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Khang Vật

local tbOptGiay_A = {50, 151, 252, 378, 530, 707, 934, 1212, 1490, 1768}; ---- Sinh Lực Nội Lực
local tbOptGiay_B = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC
local tbOptGiay_C = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Khang Độc

local tbOptTrangSuc_A = {5, 10, 15, 20, 25, 30, 35, 50, 60, 80}; ---- Chí Mạng
local tbOptTrangSuc_B = {1,3, 5, 7, 9, 11, 13, 15, 20, 25}; -- Chịu Sát Thương Chí Mạng
local tbOptTrangSuc_C = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- KTC

local tbOptNgua_A = {1, 3, 5, 7, 9, 11, 13, 15, 17, 20}; ---- Kháng
local tbOptNgua_B = {50,100, 150, 200, 250, 300, 350, 400, 500, 600}; -- Vật công nội ngoại
local tbOptNgua_C = {3, 9, 27, 49, 76, 107, 145, 200, 255, 310}; -- Cường nhược hóa

	local tbListStoneEquip = {
    [0] = { -- Nón
        [1] = {1867, "Sinh lực nội lực"}, -- Thuộc tính A
        [2] = {1868, "Kháng tất cả"}, -- Thuộc tính B
        [3] = {1869, "Kháng Băng"} -- Thuộc tính C
    },
    [1] = { -- Áo
        [1] = {1870, "Sinh lực nội lực"}, -- Thuộc tính A
        [2] = {1871, "Kháng tất cả"}, -- Thuộc tính B
        [3] = {1872, "Kháng Hỏa"} -- Thuộc tính C
    },
    [2] = { -- Lưng
        [1] = {1873, "Sinh lực nội lực"}, -- Thuộc tính A
        [2] = {1874, "Kháng tất cả"}, -- Thuộc tính B
        [3] = {1875, "Kháng Lôi"} -- Thuộc tính C
    },
    [5] = { -- Tay
        [1] = {1876, "Sinh lực nội lực"}, -- Thuộc tính A
        [2] = {1877, "Kháng tất cả"}, -- Thuộc tính B
        [3] = {1878, "Kháng Vật"} -- Thuộc tính C
    },
    [4] = { -- Giày
        [1] = {1879, "Sinh lực nội lực"}, -- Thuộc tính A
        [2] = {1880, "Kháng tất cả"}, -- Thuộc tính B
        [3] = {1881, "Kháng Độc"} -- Thuộc tính C
    },
    [3] = { -- Vũ khí
        [1] = {1882, "Phát huy lực tấn công cơ bản"}, -- Thuộc tính A
        [2] = {1883, "Vật công nội, ngoại"}, -- Thuộc tính B
        [3] = {1884, "Bỏ qua kháng"} -- Thuộc tính C
    },
    [8] = { -- Liên
        [1] = {1885, "Chí mạng"}, -- Thuộc tính A
        [2] = {1886, "Chịu sát thương chí mạng"}, -- Thuộc tính B
        [3] = {1887, "Kháng tất cả"} -- Thuộc tính C
    },
    [7] = { -- Nhẫn
        [1] = {1888, "Chí mạng"}, -- Thuộc tính A
        [2] = {1889, "Chịu sát thương chí mạng"}, -- Thuộc tính B
        [3] = {1890, "Kháng tất cả"} -- Thuộc tính C
    },
    [9] = { -- Bội
        [1] = {1891, "Chí mạng"}, -- Thuộc tính A
        [2] = {1892, "Chịu sát thương chí mạng"}, -- Thuộc tính B
        [3] = {1893, "Kháng tất cả"} -- Thuộc tính C
    },
    [6] = { -- Phù
        [1] = {1894, "Chí mạng"}, -- Thuộc tính A
        [2] = {1895, "Chịu sát thương chí mạng"}, -- Thuộc tính B
        [3] = {1896, "Kháng tất cả"} -- Thuộc tính C
    },
	    [10] = { -- Ngựa
        [1] = {1901, "Chịu Sát Thương vật lý"}, -- Thuộc tính A
        [2] = {1902, "Chịu Sát Thương Độc Công"}, -- Thuộc tính A
        [3] = {1903, "Chịu Sát Thương Băng Công"}, -- Thuộc tính A
        [4] = {1904, "Chịu Sát Thương Hỏa Công"}, -- Thuộc tính A
        [5] = {1905, "Chịu Sát Thương Lôi Công"}, -- Thuộc tính A
        [6] = {1906, "Vật Công Nội Ngoại"}, -- Thuộc tính B
        [7] = {1907, "Cường Nhược Hóa"}, -- Thuộc tính C
        [8] = {1900, "Kháng"} -- Thuộc tính C
    }
	
};

local NonD1 = pPlayer.GetSkillLevel(1867)
local NonD2 = pPlayer.GetSkillLevel(1868)
local NonD3 = pPlayer.GetSkillLevel(1869)
local AoD1 = pPlayer.GetSkillLevel(1870)
local AoD2 = pPlayer.GetSkillLevel(1871)
local AoD3 = pPlayer.GetSkillLevel(1872)
local LungD1 = pPlayer.GetSkillLevel(1873)
local LungD2 = pPlayer.GetSkillLevel(1874)
local LungD3 = pPlayer.GetSkillLevel(1875)
local TayD1 = pPlayer.GetSkillLevel(1876)
local TayD2 = pPlayer.GetSkillLevel(1877)
local TayD3 = pPlayer.GetSkillLevel(1878)
local GiayD1 = pPlayer.GetSkillLevel(1879)
local GiayD2 = pPlayer.GetSkillLevel(1880)
local GiayD3 = pPlayer.GetSkillLevel(1881)
local VuKhi_D1 = pPlayer.GetSkillLevel(1882)
local VuKhi_D2 = pPlayer.GetSkillLevel(1883)
local VuKhi_D3 = pPlayer.GetSkillLevel(1884)
local Lien_D1 = pPlayer.GetSkillLevel(1885)
local Lien_D2 = pPlayer.GetSkillLevel(1886)
local Lien_D3 = pPlayer.GetSkillLevel(1887)
local Nhan_D1 = pPlayer.GetSkillLevel(1888)
local Nhan_D2 = pPlayer.GetSkillLevel(1889)
local Nhan_D3 = pPlayer.GetSkillLevel(1890)
local Boi_D1 = pPlayer.GetSkillLevel(1891)
local Boi_D2 = pPlayer.GetSkillLevel(1892)
local Boi_D3 = pPlayer.GetSkillLevel(1893)
local Phu_D1 = pPlayer.GetSkillLevel(1894)
local Phu_D2 = pPlayer.GetSkillLevel(1895)
local Phu_D3 = pPlayer.GetSkillLevel(1896)
local Ngua_VatLy_D1 = pPlayer.GetSkillLevel(1901)
local Ngua_KhangDoc_D1 = pPlayer.GetSkillLevel(1902)
local Ngua_KhangBang_D1 = pPlayer.GetSkillLevel(1903)
local Ngua_KhangHoa_D1 = pPlayer.GetSkillLevel(1904)
local Ngua_KhangLoi_D1 = pPlayer.GetSkillLevel(1905)
local Ngua_ChiuST_D2 = pPlayer.GetSkillLevel(1906)
local Ngua_CuongNhuoc_D3 = pPlayer.GetSkillLevel(1907)
local Ngua_Khang_ChuaThuocTinh = pPlayer.GetSkillLevel(1900)
local nThuocTinhDaBo = pPlayer.GetSkillLevel(1908)
local Vu_Khi = pPlayer.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_WEAPON, 0)
local Ao = pPlayer.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_BODY, 0)
local Non = pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_HEAD, 0);
local Dai = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_BELT, 0);
local HoUyen = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_CUFF, 0);
local Giay = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_FOOT, 0);
local Lien = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_NECKLACE, 0);
local Nhan = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_RING, 0);
local Boi = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_PENDANT, 0);
local Phu = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_AMULET, 0);
local Ngua = 	pPlayer.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_HORSE, 0);


if nThuocTinhDaBo < 1 then 
nThuocTinhDaBo = 0
end 
if not Vu_Khi or not Ao or not Non or not Dai or not HoUyen or not Giay or not Lien or not Nhan or not Boi or not Phu or not Ngua  then 
me.Msg("Người chơi "..pPlayer.szName.." chưa trang bị đủ đồ không thể xem")
return 
end 



local nVuKhi_Check = KItem.EquipType2EquipPos(Vu_Khi.nDetail)
local nAo_Check = KItem.EquipType2EquipPos(Ao.nDetail)
local nNon_Check = KItem.EquipType2EquipPos(Non.nDetail)
local nDai_Check = KItem.EquipType2EquipPos(Dai.nDetail)
local nHoUyen_Check = KItem.EquipType2EquipPos(HoUyen.nDetail)
local nGiay_Check = KItem.EquipType2EquipPos(Giay.nDetail)
local nLien_Check = KItem.EquipType2EquipPos(Lien.nDetail)
local nNhan_Check = KItem.EquipType2EquipPos(Nhan.nDetail)
local nBoi_Check = KItem.EquipType2EquipPos(Boi.nDetail)
local nPhu_Check = KItem.EquipType2EquipPos(Phu.nDetail)
local nNgua_Check = KItem.EquipType2EquipPos(Ngua.nDetail)
	local nVK_ViTri_A = pPlayer.GetTask(9184,1)
	local nVK_ViTri_B = pPlayer.GetTask(9184,2)
	local nVK_ViTri_C = pPlayer.GetTask(9184,3)
	local nDayChuyen_ViTri_A = pPlayer.GetTask(9184,4)
	local nDayChuyen_ViTri_B = pPlayer.GetTask(9184,5)
	local nDayChuyen_ViTri_C = pPlayer.GetTask(9184,6)
	local nNhan_ViTri_A = pPlayer.GetTask(9184,7)
	local nNhan_ViTri_B = pPlayer.GetTask(9184,8)
	local nNhan_ViTri_C = pPlayer.GetTask(9184,9)
	local nBoi_ViTri_A = pPlayer.GetTask(9184,10)
	local nBoi_ViTri_B = pPlayer.GetTask(9184,11)
	local nBoi_ViTri_C = pPlayer.GetTask(9184,12)
	local nPhu_ViTri_A = pPlayer.GetTask(9184,13)
	local nPhu_ViTri_B = pPlayer.GetTask(9184,14)
	local nPhu_ViTri_C = pPlayer.GetTask(9184,15)
	local nNon_ViTri_A = pPlayer.GetTask(9184,16)
	local nNon_ViTri_B = pPlayer.GetTask(9184,17)
	local nNon_ViTri_C = pPlayer.GetTask(9184,18)
	local nAo_ViTri_A = pPlayer.GetTask(9184,19)
	local nAo_ViTri_B = pPlayer.GetTask(9184,20)
	local nAo_ViTri_C = pPlayer.GetTask(9184,21)
	local nDaiLung_ViTri_A = pPlayer.GetTask(9184,22)
	local nDaiLung_ViTri_B = pPlayer.GetTask(9184,23)
	local nDaiLung_ViTri_C = pPlayer.GetTask(9184,24)
	local nTay_ViTri_A = pPlayer.GetTask(9184,25)
	local nTay_ViTri_B = pPlayer.GetTask(9184,26)
	local nTay_ViTri_C = pPlayer.GetTask(9184,27)
	local nGiay_ViTri_A = pPlayer.GetTask(9184,28)
	local nGiay_ViTri_B = pPlayer.GetTask(9184,29)
	local nGiay_ViTri_C = pPlayer.GetTask(9184,30)
	local nNgua_ViTri_A = pPlayer.GetTask(9184,31)
	local nNgua_ViTri_B = pPlayer.GetTask(9184,32)
	local nNgua_ViTri_C = pPlayer.GetTask(9184,33)
			local nNgocVuKhiA = pPlayer.GetSkillLevel(tbListStoneEquip[nVuKhi_Check][1][1]);
			local vka = ""
	if nVK_ViTri_A == 1 then 
			if nNgocVuKhiA > 0 then 
			vka = "<pic=172> " .. tbListStoneEquip[nVuKhi_Check][1][2] .. ": <color=gold>+" .. tbOptVuKhiA[VuKhi_D1] .. "%<color> (" .. VuKhi_D1 .. "/10)\n"
			else 
			vka = "<pic=167> <color=gray>".. tbListStoneEquip[nVuKhi_Check][1][2] .."\n<color>"
			end 
	else 
			vka = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocVuKhiB = pPlayer.GetSkillLevel(tbListStoneEquip[nVuKhi_Check][2][1]);
			local vkb = ""
	if nVK_ViTri_B == 1 then 
			if nNgocVuKhiB > 0 then 
			vkb = "<pic=175> " .. tbListStoneEquip[nVuKhi_Check][2][2] .. ": <color=gold>+" .. tbOptVuKhiB[VuKhi_D2] .. "%<color> (" .. VuKhi_D2 .. "/10)\n"
			else 
			vkb = "<pic=167> <color=gray>".. tbListStoneEquip[nVuKhi_Check][2][2] .."\n<color>"
			end 
	else 
	vkb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocVuKhiC = pPlayer.GetSkillLevel(tbListStoneEquip[nVuKhi_Check][3][1]);
			local vkc = ""
	if nVK_ViTri_C == 1 then 
			if nNgocVuKhiC > 0 then 
			vkc = "<pic=181> " .. tbListStoneEquip[nVuKhi_Check][3][2] .. ": <color=gold>+" .. tbOptVuKhiC[VuKhi_D3] .. "%<color> (" .. VuKhi_D3 .. "/10)\n"
			else 
			vkc = "<pic=167> <color=gray>".. tbListStoneEquip[nVuKhi_Check][3][2] .."\n<color>"
			end 
	else 
	vkc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocNonA = pPlayer.GetSkillLevel(tbListStoneEquip[nNon_Check][1][1]);
			local nona = ""
if nNon_ViTri_A == 1 then 
			if nNgocNonA > 0 then 
			nona = "<pic=180> " .. tbListStoneEquip[nNon_Check][1][2] .. ": <color=gold>+" .. tbOptNonA[NonD1] .. "Điểm<color> (" .. NonD1 .. "/10)\n"
			else 
			nona = "<pic=167> <color=gray>".. tbListStoneEquip[nNon_Check][1][2] .."\n<color>"
			end 
	else 
	nona = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocNonB = pPlayer.GetSkillLevel(tbListStoneEquip[nNon_Check][2][1]);
			local nonb = ""
if nNon_ViTri_B == 1 then 
			if nNgocNonB > 0 then 
			nonb = "<pic=175> " .. tbListStoneEquip[nNon_Check][2][2] .. ": <color=gold>+" .. tbOptNonB[NonD2] .. "Điểm<color> (" .. NonD2 .. "/10)\n"
			else 
			nonb = "<pic=167> <color=gray>".. tbListStoneEquip[nNon_Check][2][2] .."\n<color>"
			end 
	else 
	nonb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocNonC = pPlayer.GetSkillLevel(tbListStoneEquip[nNon_Check][3][1]);
			local nonc = ""
if nNon_ViTri_C == 1 then 
			if nNgocNonC > 0 then 
			nonc = "<pic=175> " .. tbListStoneEquip[nNon_Check][3][2] .. ": <color=gold>+" .. tbOptNonC[NonD3] .. "Điểm<color> (" .. NonD3 .. "/10)\n"
			else 
			nonc = "<pic=167> <color=gray>".. tbListStoneEquip[nNon_Check][3][2] .."\n<color>"
			end 
	else 
	nonc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocDaiA = pPlayer.GetSkillLevel(tbListStoneEquip[nDai_Check][1][1]);
			local daia = ""
if nDaiLung_ViTri_A == 1 then 
			if nNgocDaiA > 0 then 
			daia = "<pic=180> " .. tbListStoneEquip[nDai_Check][1][2] .. ": <color=gold>+" .. tbOptDaiLung_A[LungD1] .. "Điểm<color> (" .. LungD1 .. "/10)\n"
			else 
			daia = "<pic=167> <color=gray>".. tbListStoneEquip[nDai_Check][1][2] .."\n<color>"
			end 
	else 
	daia = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocDaiB = pPlayer.GetSkillLevel(tbListStoneEquip[nDai_Check][2][1]);
			local daib = ""
if nDaiLung_ViTri_B == 1 then 
			if nNgocDaiB > 0 then 
			daib = "<pic=175> " .. tbListStoneEquip[nDai_Check][2][2] .. ": <color=gold>+" .. tbOptDaiLung_B[LungD2] .. "Điểm<color> (" .. LungD2 .. "/10)\n"
			else 
			daib = "<pic=167> <color=gray>".. tbListStoneEquip[nDai_Check][2][2] .."\n<color>"
			end 
	else 
	daib = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocDaiC = pPlayer.GetSkillLevel(tbListStoneEquip[nDai_Check][3][1]);
			local daic = ""
if nDaiLung_ViTri_C == 1 then 
			if nNgocDaiC > 0 then 
			daic = "<pic=181> " .. tbListStoneEquip[nDai_Check][3][2] .. ": <color=gold>+" .. tbOptDaiLung_C[LungD3] .. " Điểm<color> (" .. LungD3 .. "/10)\n"
			else 
			daic = "<pic=167> <color=gray>".. tbListStoneEquip[nDai_Check][3][2] .."\n<color>"
			end 
	else 
	daic = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocAoA = pPlayer.GetSkillLevel(tbListStoneEquip[nAo_Check][1][1]);
			local aoa = ""
if nAo_ViTri_A == 1 then 
			if nNgocAoA > 0 then 
			aoa = "<pic=180> " .. tbListStoneEquip[nAo_Check][1][2] .. ": <color=gold>+" .. tbOptAoA[AoD1] .. "Điểm<color> (" .. AoD1 .. "/10)\n"
			else 
			aoa = "<pic=167> <color=gray>".. tbListStoneEquip[nAo_Check][1][2] .."\n<color>"
			end 
	else 
	aoa = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocAoB = pPlayer.GetSkillLevel(tbListStoneEquip[nAo_Check][2][1]);
			local aob = ""
if nAo_ViTri_B == 1 then 
			if nNgocAoB > 0 then 
			aob = "<pic=180> " .. tbListStoneEquip[nAo_Check][2][2] .. ": <color=gold>+" .. tbOptAoB[AoD2] .. "Điểm<color> (" .. AoD2 .. "/10)\n"
			else 
			aob = "<pic=167> <color=gray>".. tbListStoneEquip[nAo_Check][2][2] .."\n<color>"
			end 
	else 
	aob = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocAoC = pPlayer.GetSkillLevel(tbListStoneEquip[nAo_Check][3][1]);
			local aoc = ""
if nAo_ViTri_C == 1 then 
			if nNgocAoC > 0 then 
			aoc = "<pic=180> " .. tbListStoneEquip[nAo_Check][3][2] .. ": <color=gold>+" .. tbOptAoC[AoD3] .. "Điểm<color> (" .. AoD3 .. "/10)\n"
			else 
			aoc = "<pic=167> <color=gray>".. tbListStoneEquip[nAo_Check][3][2] .."\n<color>"
			end 
	else 
	aoc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocGiayA = pPlayer.GetSkillLevel(tbListStoneEquip[nGiay_Check][1][1]);
			local giaya = ""
if nGiay_ViTri_A == 1 then 
			if nNgocGiayA > 0 then 
			giaya = "<pic=180> " .. tbListStoneEquip[nGiay_Check][1][2] .. ": <color=gold>+" .. tbOptGiay_A[GiayD1] .. "Điểm<color> (" .. GiayD1 .. "/10)\n"
			else 
			giaya = "<pic=167> <color=gray>".. tbListStoneEquip[nGiay_Check][1][2] .."\n<color>"
			end 
	else 
	giaya = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocGiayB = pPlayer.GetSkillLevel(tbListStoneEquip[nGiay_Check][2][1]);
			local giayb = ""
if nGiay_ViTri_B == 1 then 
			if nNgocGiayB > 0 then 
			giayb = "<pic=175> " .. tbListStoneEquip[nGiay_Check][2][2] .. ": <color=gold>+" .. tbOptGiay_B[GiayD2] .. "Điểm<color> (" .. GiayD2 .. "/10)\n"
			else 
			giayb = "<pic=167> <color=gray>".. tbListStoneEquip[nGiay_Check][2][2] .."\n<color>"
			end 
	else 
	giayb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocGiayC = pPlayer.GetSkillLevel(tbListStoneEquip[nGiay_Check][3][1]);
			local giayc = ""
if nGiay_ViTri_C == 1 then 
			if nNgocGiayC > 0 then 
			giayc = "<pic=181> " .. tbListStoneEquip[nGiay_Check][3][2] .. ": <color=gold>+" .. tbOptGiay_C[GiayD3] .. "Điểm<color> (" .. GiayD3 .. "/10)\n"
			else 
			giayc = "<pic=167> <color=gray>".. tbListStoneEquip[nGiay_Check][3][2] .."\n<color>"
			end 
	else 
	giayc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nNgoc_HoUyenA = pPlayer.GetSkillLevel(tbListStoneEquip[nHoUyen_Check][1][1]);
			local baotaya = ""
if nTay_ViTri_A == 1 then 
			if nNgoc_HoUyenA > 0 then 
			baotaya = "<pic=180> " .. tbListStoneEquip[nHoUyen_Check][1][2] .. ": <color=gold>+" .. tbOptTay_A[TayD1] .. "Điểm<color> (" .. TayD1 .. "/10)\n"
			else 
			baotaya = "<pic=167> <color=gray>".. tbListStoneEquip[nHoUyen_Check][1][2] .."\n<color>"
			end 
	else 
	baotaya = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
												local nNgoc_HoUyenB = pPlayer.GetSkillLevel(tbListStoneEquip[nHoUyen_Check][2][1]);
			local baotayb = ""
if nTay_ViTri_B == 1 then 
			if nNgoc_HoUyenB > 0 then 
			baotayb = "<pic=175> " .. tbListStoneEquip[nHoUyen_Check][2][2] .. ": <color=gold>+" .. tbOptTay_B[TayD2] .. "Điểm<color> (" .. TayD2 .. "/10)\n"
			else 
			baotayb = "<pic=167> <color=gray>".. tbListStoneEquip[nHoUyen_Check][2][2] .."\n<color>"
			end 
	else 
	baotayb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
															local nNgoc_HoUyenC = pPlayer.GetSkillLevel(tbListStoneEquip[nHoUyen_Check][3][1]);
			local baotayc = ""
if nTay_ViTri_C == 1 then 
			if nNgoc_HoUyenC > 0 then 
			baotayc = "<pic=181> " .. tbListStoneEquip[nHoUyen_Check][3][2] .. ": <color=gold>+" .. tbOptTay_B[TayD3] .. "Điểm<color> (" .. TayD3 .. "/10)\n"
			else 
			baotayc = "<pic=167> <color=gray>".. tbListStoneEquip[nHoUyen_Check][3][2] .."\n<color>"
			end 
	else 
	baotayc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgocLienA = pPlayer.GetSkillLevel(tbListStoneEquip[nLien_Check][1][1]);
			local liena = ""
	if nDayChuyen_ViTri_A == 1 then 
			if nNgocLienA > 0 then 
			liena = "<pic=180> " .. tbListStoneEquip[nLien_Check][1][2] .. ": <color=gold>+" .. tbOptTrangSuc_A[Lien_D1] .. "Điểm<color> (" .. Lien_D1 .. "/10)\n"
			else 
			liena = "<pic=167> <color=gray>".. tbListStoneEquip[nLien_Check][1][2] .."\n<color>"
			end 
	else 
	liena = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocLienB = pPlayer.GetSkillLevel(tbListStoneEquip[nLien_Check][2][1]);
			local lienb = ""
	if nDayChuyen_ViTri_B == 1 then 
			if nNgocLienB > 0 then 
			lienb = "<pic=175> " .. tbListStoneEquip[nLien_Check][2][2] .. ": <color=gold>+" .. tbOptTrangSuc_B[Lien_D2] .. "%<color> (" .. Lien_D2 .. "/10)\n"
			else 
			lienb = "<pic=167> <color=gray>".. tbListStoneEquip[nLien_Check][2][2] .."\n<color>"
			end
	else 
	lienb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nNgocLienC = pPlayer.GetSkillLevel(tbListStoneEquip[nLien_Check][3][1]);
			local lienc = ""
	if nDayChuyen_ViTri_C == 1 then 
			if nNgocLienC > 0 then 
			lienc = "<pic=181> " .. tbListStoneEquip[nLien_Check][3][2] .. ": <color=gold>+" .. tbOptTrangSuc_C[Lien_D3] .. "Điểm<color> (" .. Lien_D3 .. "/10)\n"
			else 
			lienc = "<pic=167> <color=gray>".. tbListStoneEquip[nLien_Check][3][2] .."\n<color>"
			end
	else 
	lienc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocNhanA = pPlayer.GetSkillLevel(tbListStoneEquip[nNhan_Check][1][1]);
			local nhana = ""
	if nNhan_ViTri_A == 1 then 
			if nNgocNhanA > 0 then 
			nhana = "<pic=180> " .. tbListStoneEquip[nNhan_Check][1][2] .. ": <color=gold>+" .. tbOptTrangSuc_A[Nhan_D1] .. "Điểm<color> (" .. Nhan_D1 .. "/10)\n"
			else 
			nhana = "<pic=167> <color=gray>".. tbListStoneEquip[nNhan_Check][1][2] .."\n<color>"
			end 
	else 
	nhana = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocNhanB = pPlayer.GetSkillLevel(tbListStoneEquip[nNhan_Check][2][1]);
			local nhanb = ""
	if nNhan_ViTri_B == 1 then 
			if nNgocNhanB > 0 then 
			nhanb = "<pic=175> " .. tbListStoneEquip[nNhan_Check][2][2] .. ": <color=gold>+" .. tbOptTrangSuc_B[Nhan_D2] .. "%<color> (" .. Nhan_D2 .. "/10)\n"
			else 
			nhanb = "<pic=167> <color=gray>".. tbListStoneEquip[nNhan_Check][2][2] .."\n<color>"
			end
	else 
	nhanb = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nNgocNhanC = pPlayer.GetSkillLevel(tbListStoneEquip[nNhan_Check][3][1]);
			local nhanc = ""
	if nNhan_ViTri_C == 1 then 
			if nNgocNhanC > 0 then 
			nhanc = "<pic=181> " .. tbListStoneEquip[nNhan_Check][3][2] .. ": <color=gold>+" .. tbOptTrangSuc_C[Nhan_D3] .. "Điểm<color> (" .. Nhan_D3 .. "/10)\n"
			else 
			nhanc = "<pic=167> <color=gray>".. tbListStoneEquip[nNhan_Check][3][2] .."\n<color>"
			end
	else 
	nhanc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nNgocBoiA = pPlayer.GetSkillLevel(tbListStoneEquip[nBoi_Check][1][1]);
			local boia = ""
	if nBoi_ViTri_A == 1 then 
			if nNgocBoiA > 0 then 
			boia = "<pic=180> " .. tbListStoneEquip[nBoi_Check][1][2] .. ": <color=gold>+" .. tbOptTrangSuc_A[Boi_D1] .. "Điểm<color> (" .. Boi_D1 .. "/10)\n"
			else 
			boia = "<pic=167> <color=gray>".. tbListStoneEquip[nBoi_Check][1][2] .."\n<color>"
			end 
	else 
	boia = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nNgocBoiB = pPlayer.GetSkillLevel(tbListStoneEquip[nBoi_Check][2][1]);
			local boib = ""
	if nBoi_ViTri_B == 1 then 
			if nNgocBoiB > 0 then 
			boib = "<pic=175> " .. tbListStoneEquip[nBoi_Check][2][2] .. ": <color=gold>+" .. tbOptTrangSuc_B[Boi_D2] .. "%<color> (" .. Boi_D2 .. "/10)\n"
			else 
			boib = "<pic=167> <color=gray>".. tbListStoneEquip[nBoi_Check][2][2] .."\n<color>"
			end
	else 
	boib = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nNgocBoiC = pPlayer.GetSkillLevel(tbListStoneEquip[nBoi_Check][3][1]);
			local boic = ""
				if nBoi_ViTri_C == 1 then 
			if nNgocBoiC > 0 then 
			boic = "<pic=181> " .. tbListStoneEquip[nBoi_Check][3][2] .. ": <color=gold>+" .. tbOptTrangSuc_C[Boi_D3] .. "Điểm<color> (" .. Boi_D3 .. "/10)\n"
			else 
			boic = "<pic=167> <color=gray>".. tbListStoneEquip[nBoi_Check][3][2] .."\n<color>"
			end
	else 
	boic = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			
			local nPhuA = pPlayer.GetSkillLevel(tbListStoneEquip[nPhu_Check][1][1]);
			local phua = ""
	if nPhu_ViTri_A == 1 then 
			if nPhuA > 0 then 
			phua = "<pic=180> " .. tbListStoneEquip[nPhu_Check][1][2] .. ": <color=gold>+" .. tbOptTrangSuc_A[Phu_D1] .. "Điểm<color> (" .. Phu_D1 .. "/10)\n"
			else 
			phua = "<pic=167> <color=gray>".. tbListStoneEquip[nPhu_Check][1][2] .."\n<color>"
			end 
	else 
	phua = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
						local nPhuB = pPlayer.GetSkillLevel(tbListStoneEquip[nPhu_Check][2][1]);
			local phub = ""
	if nPhu_ViTri_B == 1 then 
			if nPhuB > 0 then 
			phub = "<pic=175> " .. tbListStoneEquip[nPhu_Check][2][2] .. ": <color=gold>+" .. tbOptTrangSuc_B[Phu_D2] .. "%<color> (" .. Phu_D2 .. "/10)\n"
			else 
			phub = "<pic=167> <color=gray>".. tbListStoneEquip[nPhu_Check][2][2] .."\n<color>"
			end
	else 
	phub = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
									local nPhuC = pPlayer.GetSkillLevel(tbListStoneEquip[nPhu_Check][3][1]);
			local phuc = ""
	if nPhu_ViTri_C == 1 then 
			if nPhuC > 0 then 
			phuc = "<pic=181> " .. tbListStoneEquip[nPhu_Check][3][2] .. ": <color=gold>+" .. tbOptTrangSuc_C[Phu_D3] .. "Điểm<color> (" .. Phu_D3 .. "/10)\n"
			else 
			phuc = "<pic=167> <color=gray>".. tbListStoneEquip[nPhu_Check][3][2] .."\n<color>"
			end
	else 
	phuc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			
			local nNgoc_NguaVat_A = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][1][1]);
			local nNgoc_NguaDoc_A = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][2][1]);
			local nNgoc_NguaBang_A = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][3][1]);
			local nNgoc_NguaHoa_A = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][4][1]);
			local nNgoc_NguaLoi_A = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][5][1]);
			local ngua_khang = ""
	if nNgua_ViTri_A == 1 then 
			if nNgoc_NguaVat_A > 0 then 
			ngua_khang = "<pic=180> " .. tbListStoneEquip[nNgua_Check][1][2] .. ": <color=gold>+" .. tbOptNgua_A[Ngua_VatLy_D1] .. "%<color> (" .. Ngua_VatLy_D1 .. "/10)\n"
			elseif nNgoc_NguaDoc_A > 0 then 
			ngua_khang = "<pic=180> " .. tbListStoneEquip[nNgua_Check][2][2] .. ": <color=gold>+" .. tbOptNgua_A[Ngua_KhangDoc_D1] .. "%<color> (" .. Ngua_KhangDoc_D1 .. "/10)\n"
			elseif nNgoc_NguaBang_A > 0 then 
			ngua_khang = "<pic=180> " .. tbListStoneEquip[nNgua_Check][3][2] .. ": <color=gold>+" .. tbOptNgua_A[Ngua_KhangBang_D1] .. "%<color> (" .. Ngua_KhangBang_D1 .. "/10)\n"
			elseif nNgoc_NguaHoa_A > 0 then 
			ngua_khang = "<pic=180> " .. tbListStoneEquip[nNgua_Check][4][2] .. ": <color=gold>+" .. tbOptNgua_A[Ngua_KhangHoa_D1] .. "%<color> (" .. Ngua_KhangHoa_D1 .. "/10)\n"
			elseif nNgoc_NguaLoi_A > 0 then 
			ngua_khang = "<pic=180> " .. tbListStoneEquip[nNgua_Check][5][2] .. ": <color=gold>+" .. tbOptNgua_A[Ngua_KhangLoi_D1] .. "%<color> (" .. Ngua_KhangLoi_D1 .. "/10)\n"
			else 
			ngua_khang = "<pic=167> <color=gray>".. tbListStoneEquip[nNgua_Check][8][2] .."\n<color>"
			end 
	else 
	ngua_khang = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgua_VatCong = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][6][1]);
			local ngua_vatcong = ""
	if nNgua_ViTri_B == 1 then 
			if nNgua_VatCong > 0 then 
			ngua_vatcong = "<pic=175> " .. tbListStoneEquip[nNgua_Check][6][2] .. ": <color=gold>+" .. tbOptNgua_B[Ngua_ChiuST_D2] .. " Điểm<color> (" .. Ngua_ChiuST_D2 .. "/10)\n"
			else 
			ngua_vatcong = "<pic=167> <color=gray>".. tbListStoneEquip[nNgua_Check][6][2] .."\n<color>"
			end 
	else 
	ngua_vatcong = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
			local nNgua_CuongNhuoc = pPlayer.GetSkillLevel(tbListStoneEquip[nNgua_Check][7][1]);
			local ngua_cuongnhuoc = ""
	if nNgua_ViTri_C == 1 then 
			if nNgua_CuongNhuoc > 0 then 
			ngua_cuongnhuoc = "<pic=181> " .. tbListStoneEquip[nNgua_Check][7][2] .. ": <color=gold>+" .. tbOptNgua_C[Ngua_CuongNhuoc_D3] .. " Điểm<color> (" .. Ngua_CuongNhuoc_D3 .. "/10)\n"
			else 
			ngua_cuongnhuoc = "<pic=167> <color=gray>".. tbListStoneEquip[nNgua_Check][7][2] .."\n<color>"
			end 
	else 
	ngua_cuongnhuoc = "<pic=167> <color=gray>Chưa đục lỗ<color>\n"
	end 
local function createSection(title, items)
    return "<color=Green>" .. title .. ":\n<color>" .. table.concat(items, "")
end

local function nFunctionGioiHanKyTu(str, limit)
    -- Cắt chuỗi dựa trên giới hạn ký tự và trả về kết quả
    return string.sub(str, 1, limit)
end
local nThuocTinh_DaBo_Skil = "<color=cyan>Thuộc Tính Đá Bộ Cấp : " .. nThuocTinhDaBo .. "<color>"
local szTitle = "" -- Khởi tạo biến szTitle rỗng

-- Tạo các phần của thông tin ngọc khảm
szTitle = 
    createSection("Vũ Khí", {vka, vkb, vkc}) ..
    createSection("Liên", {liena, lienb, lienc}) ..
    createSection("Nhẫn", {nhana, nhanb, nhanc}) ..
    createSection("Bội", {boia, boib, boic}) ..
    createSection("Phù", {phua, phub, phuc}) ..
    createSection("Nón", {nona, nonb, nonc}) ..
    createSection("Đai Lưng", {daia, daib, daic}) ..
    createSection("Áo", {aoa, aob, aoc}) ..
    createSection("Hộ Uyển", {baotaya, baotayb, baotayc}) ..
    createSection("Giày", {giaya, giayb, giayc}) ..
    createSection("Ngựa", {ngua_khang, ngua_vatcong, ngua_cuongnhuoc}) ..
    "<color=cyan>Đá Bộ:\n</color>" .. nThuocTinh_DaBo_Skil

-- Giới hạn ký tự của szTitle
szTitle = nFunctionGioiHanKyTu(szTitle, 10000)

local nTenBang = "Đang xem thông tin của " .. pPlayer.szName
me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
	Dialog:SendBlackBoardMsg(pPlayer, "Có người đang xem thông tin ngọc khảm của bạn")
end 

