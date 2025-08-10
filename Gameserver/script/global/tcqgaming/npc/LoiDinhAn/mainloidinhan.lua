-----Dev : TCQGaming
-----Time : 17/10/2023 11:00 PM
local tbMainLoiDinhAn = {}
SpecialEvent.tbMainLoiDinhAn = tbMainLoiDinhAn

function tbMainLoiDinhAn:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\mainloidinhan.lua");
    local szMsg = "Ta muốn nâng cấp Lôi Đình Ấn"
    local tbOpt = {
        {"<color=gold>Nâng cấp Lôi Đình Ấn", self.OKNangCapthuong, self},
        {"Hiện tại ta chưa muốn"},
    }
    Dialog:Say(szMsg, tbOpt)
end

function tbMainLoiDinhAn:OKNangCapthuong()
    local tbLoiDinhAn = {
        [1] = {Name = "Lôi Đình Ấn-Thường", ID = 29, Cost = 10},
        [2] = {Name = "Lôi Đình Ấn-Bồi Nhung", ID = 30, Cost = 30},
        [3] = {Name = "Lôi Đình Ấn-Triều Nghĩa", ID = 31, Cost = 50},
        [4] = {Name = "Lôi Đình Ấn-Nhân Dũng", ID = 32, Cost = 70},
        [5] = {Name = "Lôi Đình Ấn-Tư Trí", ID = 33, Cost = 90},
        [6] = {Name = "Lôi Đình Ấn-Ngự Võ", ID = 34, Cost = 110},
        [7] = {Name = "Lôi Đình Ấn-Tuyên Tiế", ID = 35, Cost = 130},
        [8] = {Name = "Lôi Đình Ấn-Dực Huy", ID = 36, Cost = 150},
        [9] = {Name = "Lôi Đình Ấn-Trí Quả", ID = 37, Cost = 170},
        [10] = {Name = "Lôi Đình Ấn-Chấn Uy", ID = 38, Cost = 190},
        [11] = {Name = "Lôi Đình Ấn-Chiêu Võ", ID = 39, Cost = 210},
        [12] = {Name = "Lôi Đình Ấn-Du Kích", ID = 40, Cost = 230},
        [13] = {Name = "Lôi Đình Ấn-Du Kỵ", ID = 41, Cost = 250},
        [14] = {Name = "Lôi Đình Ấn-Ninh Viễn", ID = 42, Cost = 270},
        [15] = {Name = "Lôi Đình Ấn-Định Viễn", ID = 43, Cost = 290},
        [16] = {Name = "Lôi Đình Ấn-Minh Uy", ID = 44, Cost = 310},
        [17] = {Name = "Lôi Đình Ấn-Tuyên Uy", ID = 45, Cost = 330},
        [18] = {Name = "Lôi Đình Ấn-Tráng Võ", ID = 46, Cost = 350},
        [19] = {Name = "Lôi Đình Ấn-Trung Võ", ID = 47, Cost = 370},
        [20] = {Name = "Lôi Đình Ấn-Quy Đức", ID = 48, Cost = 390},
        [21] = {Name = "Lôi Đình Ấn-Vân Huy", ID = 49, Cost = 410},
        [22] = {Name = "Lôi Đình Ấn-Hoài Hóa", ID = 50, Cost = 430},
        [23] = {Name = "Lôi Đình Ấn-Quán Quân", ID = 51, Cost = 450},
        [24] = {Name = "Lôi Đình Ấn-Trấn Quốc", ID = 52, Cost = 470},
        [25] = {Name = "Lôi Đình Ấn-Phụ Quốc", ID = 53, Cost = 490},
        [26] = {Name = "Lôi Đình Ấn-Phiêu Kỵ", ID = 54, Cost = 510}
    }

local bHasAnyAn = false

for i = 1, 26 do
    local nAnCount = me.GetItemCountInBags(1, 16, 28 + i, 10) -- Kiểm tra từ Ấn 28 đến Ấn 53
    if nAnCount > 0 then
        bHasAnyAn = true
        break
    end
end

if not bHasAnyAn then
    Dialog:Say("Ngươi không hề có bất kỳ Lôi Đình Ấn nào trong hành trang\nHãy Đặt : <color=yellow>Lôi Đình Ấn<color> tại Hành Trang Sau khi Giao Diện Mở ra cho vào Tiến Hành Nâng Cấp", {"Xin lỗi ! Ta Nhầm !"})
    return 0
end



    local nAn26 = me.GetItemCountInBags(1, 16, 54, 10) -- Ấn Phiêu Kỵ

    local nAn = {}
    for i = 1, 26 do
        nAn[i] = me.GetItemCountInBags(1, 16, 28 + i, 10)
    end

    local nCountCo = 0
    local nextAn = ""
    local maxAn = 26

    for i = 1, maxAn do
        if nAn[i] == 1 then
            nCountCo = tbLoiDinhAn[i].Cost
            if i < maxAn then
                nextAn = tbLoiDinhAn[i + 1].Name
            end
            break
        end
    end

    if nAn26 == 1 then
        Dialog:Say("Chú Ý: Cấp Bậc Lôi Đình Ấn Hiện Nay Đã Tối Đa", {"Xin lỗi ! Ta Nhầm !"})
        return 0
    end

    local maxOwnedAn = 0

    for i = 1, maxAn do
        if nAn[i] == 1 then
            maxOwnedAn = i
        end
    end

    local nextAn = ""
    if maxOwnedAn < maxAn then
        nextAn = tbLoiDinhAn[maxOwnedAn + 1].Name
    end

    local szContent = string.format("*<color=yellow>Hãy đặt :\n%s vào giao diện nâng cấp thành công đạt được\n<color=yellow>Ấn kế tiếp: %s\n<color=gold>*Cần %d Cờ Chiến Công Ngoài Hành Trang", tbLoiDinhAn[maxOwnedAn].Name, nextAn, nCountCo)
    Dialog:OpenGift(szContent, nil, {self.OkGiaoDienAnThuong, self})
end

function tbMainLoiDinhAn:OkGiaoDienAnThuong(tbItemObj)
    local nMagicIndex1 = 1
    local nMagicIndex2 = 2
    local nCoChienCong = me.GetItemCountInBags(18, 1, 2032, 11) -- Cờ Chiến Công
    local tbCoChienCong = { 18, 1, 2032, 11, 0, 0 }
	local nMaxSignetIndex = 26
	-- local nCurrentSignetIndex = 1
    local tbLoiDinhAn = {
        [1] = "1,16,29,10",  -- Lôi Đình Ấn-Thường
        [2] = "1,16,30,10",  -- Lôi Đình Ấn-Bồi Nhung
        [3] = "1,16,31,10",  -- Lôi Đình Ấn-Triều Nghĩa
        [4] = "1,16,32,10",  -- Lôi Đình Ấn-Nhân Dũng
        [5] = "1,16,33,10",  -- Lôi Đình Ấn-Tư Trí
        [6] = "1,16,34,10",  -- Lôi Đình Ấn-Ngự Võ
        [7] = "1,16,35,10",  -- Lôi Đình Ấn-Tuyên Tiế
        [8] = "1,16,36,10",  -- Lôi Đình Ấn-Dực Huy
        [9] = "1,16,37,10",  -- Lôi Đình Ấn-Trí Quả
        [10] = "1,16,38,10",  -- Lôi Đình Ấn-Chấn Uy
        [11] = "1,16,39,10",  -- Lôi Đình Ấn-Chiêu Võ
        [12] = "1,16,40,10",  -- Lôi Đình Ấn-Du Kích
        [13] = "1,16,41,10",  -- Lôi Đình Ấn-Du Kỵ
        [14] = "1,16,42,10",  -- Lôi Đình Ấn-Ninh Viễn
        [15] = "1,16,43,10",  -- Lôi Đình Ấn-Định Viễn
        [16] = "1,16,44,10",  -- Lôi Đình Ấn-Minh Uy
        [17] = "1,16,45,10",  -- Lôi Đình Ấn-Tuyên Uy
        [18] = "1,16,46,10",  -- Lôi Đình Ấn-Tráng Võ
        [19] = "1,16,47,10",  -- Lôi Đình Ấn-Trung Võ
        [20] = "1,16,48,10",  -- Lôi Đình Ấn-Quy Đức
        [21] = "1,16,49,10",  -- Lôi Đình Ấn-Vân Huy
        [22] = "1,16,50,10",  -- Lôi Đình Ấn-Hoài Hóa
        [23] = "1,16,51,10",  -- Lôi Đình Ấn-Quán Quân
        [24] = "1,16,52,10",  -- Lôi Đình Ấn-Trấn Quốc
        [25] = "1,16,53,10",  -- Lôi Đình Ấn-Phụ Quốc
        [26] = "1,16,54,10",  -- Lôi Đình Ấn-Phiêu Kỵ
    }

local tbCoChienCongRequired = {
    [1] = 10,   -- Số Cờ Chiến Công cần cho ấn 1
    [2] = 30,   -- Số Cờ Chiến Công cần cho ấn 2
    [3] = 50,   -- Số Cờ Chiến Công cần cho ấn 3
    [4] = 70,   -- Số Cờ Chiến Công cần cho ấn 4
    [5] = 90,   -- Số Cờ Chiến Công cần cho ấn 5
    [6] = 110,   -- Số Cờ Chiến Công cần cho ấn 6
    [7] = 130,   -- Số Cờ Chiến Công cần cho ấn 7
    [8] = 150,   -- Số Cờ Chiến Công cần cho ấn 8
    [9] = 170,   -- Số Cờ Chiến Công cần cho ấn 9
    [10] = 190,  -- Số Cờ Chiến Công cần cho ấn 10
    [11] = 210,  -- Số Cờ Chiến Công cần cho ấn 11
    [12] = 230,  -- Số Cờ Chiến Công cần cho ấn 12
    [13] = 250,  -- Số Cờ Chiến Công cần cho ấn 13
    [14] = 270,  -- Số Cờ Chiến Công cần cho ấn 14
    [15] = 290,  -- Số Cờ Chiến Công cần cho ấn 15
    [16] = 310,  -- Số Cờ Chiến Công cần cho ấn 16
    [17] = 330,  -- Số Cờ Chiến Công cần cho ấn 17
    [18] = 350,  -- Số Cờ Chiến Công cần cho ấn 18
    [19] = 370,  -- Số Cờ Chiến Công cần cho ấn 19
    [20] = 390,  -- Số Cờ Chiến Công cần cho ấn 20
    [21] = 410,  -- Số Cờ Chiến Công cần cho ấn 21
    [22] = 430,  -- Số Cờ Chiến Công cần cho ấn 22
    [23] = 450,  -- Số Cờ Chiến Công cần cho ấn 23
    [24] = 470,  -- Số Cờ Chiến Công cần cho ấn 24
    [25] = 490,  -- Số Cờ Chiến Công cần cho ấn 25
    [26] = 510,  -- Số Cờ Chiến Công cần cho ấn 26
}

local tbLoiDinhAnNames = {
    "Lôi Đình Ấn-Thường",
    "Lôi Đình Ấn-Bồi Nhung",
    "Lôi Đình Ấn-Triều Nghĩa",
    "Lôi Đình Ấn-Nhân Dũng",
    "Lôi Đình Ấn-Tư Trí",
    "Lôi Đình Ấn-Ngự Võ",
    "Lôi Đình Ấn-Tuyên Tiế",
    "Lôi Đình Ấn-Dực Huy",
    "Lôi Đình Ấn-Trí Quả",
    "Lôi Đình Ấn-Chấn Uy",
    "Lôi Đình Ấn-Chiêu Võ",
    "Lôi Đình Ấn-Du Kích",
    "Lôi Đình Ấn-Du Kỵ",
    "Lôi Đình Ấn-Ninh Viễn",
    "Lôi Đình Ấn-Định Viễn",
    "Lôi Đình Ấn-Minh Uy",
    "Lôi Đình Ấn-Tuyên Uy",
    "Lôi Đình Ấn-Tráng Võ",
    "Lôi Đình Ấn-Trung Võ",
    "Lôi Đình Ấn-Quy Đức",
    "Lôi Đình Ấn-Vân Huy",
    "Lôi Đình Ấn-Hoài Hóa",
    "Lôi Đình Ấn-Quán Quân",
    "Lôi Đình Ấn-Trấn Quốc",
    "Lôi Đình Ấn-Phụ Quốc",
    "Lôi Đình Ấn-Phiêu Kỵ",
}

    local nRequiredCountLoiDinhAnThuong = 1

    local nCountLoiDinhAnThuong = 0
    local nItemIndex = nil

    local nLevelCuongHoaOld = 0
    local nLevelNhuocHoaOld = 0

    for i = 1, #tbItemObj do
        local pItem = tbItemObj[i][1]
        local szKey = string.format("%d,%d,%d,%d", pItem.nGenre, pItem.nDetail, pItem.nParticular, pItem.nLevel)
        local bIsLoiDinhAn = false
        for nIndex, szLoiDinhAnValue in pairs(tbLoiDinhAn) do
            if szKey == szLoiDinhAnValue then
                bIsLoiDinhAn = true
                nItemIndex = nIndex
                nCountLoiDinhAnThuong = nCountLoiDinhAnThuong + pItem.nCount
                break
            end
        end

        if not bIsLoiDinhAn then
            Dialog:Say("Chú Ý: Đây không phải Mảnh Ghép Lôi Đình Ấn hoặc Lôi Đình Ấn thường", {"Xin lỗi ! Ta Nhầm !"})
            return 0
        end

        nLevelCuongHoaOld = pItem.GetGenInfo(nMagicIndex1 * 2 - 1, 0)
        nLevelNhuocHoaOld = pItem.GetGenInfo(nMagicIndex2 * 2 - 1, 0)
    end

    if nItemIndex >= 26 then
        Dialog:Say("Bạn đã nâng cấp tới vị trí tối đa. Không thể nâng cấp nữa.", {"Cảm ơn!"})
        return 0
    end

if nCoChienCong < tbCoChienCongRequired[nItemIndex] then
    Dialog:Say(string.format("Để nâng cấp Lôi Đình Ấn - Hiện Tại cần %d Cờ Chiến Công, hiện tại bạn có %d Cờ Chiến Công.", tbCoChienCongRequired[nItemIndex], nCoChienCong))
    return 0
end


    if me.CountFreeBagCell() < 10 then
        Dialog:Say("Cần sắp xếp lại túi!", {"Ta Biết rồi !"})
        return 0
    end

    if not nItemIndex then
        Dialog:Say("Không tìm thấy ấn tiếp theo trong danh sách", {"Xin lỗi!"})
        return 0
    end

    local nNextSignetIndex = nItemIndex + 1
    if nNextSignetIndex > #tbLoiDinhAn then
        nNextSignetIndex = 1
    end

    local pItem = me.AddItem(1, 16, 28 + nNextSignetIndex, 10)
    Item:SetSignetMagic(pItem, nMagicIndex1, nLevelCuongHoaOld, 0)
    Item:SetSignetMagic(pItem, nMagicIndex2, nLevelNhuocHoaOld, 0)
    for i = 1, #tbItemObj do
        local pItem = tbItemObj[i][1]
        pItem.Delete(me)
    end
    Task:DelItem(me, tbCoChienCong, tbCoChienCongRequired[nItemIndex])

local szCurrentSignetName = tbLoiDinhAnNames[nItemIndex]
local szNextSignetName = tbLoiDinhAnNames[nItemIndex + 1] or tbLoiDinhAnNames[1] -- Sử dụng ấn đầu tiên nếu không còn ấn tiếp theo

-- Sử dụng tên để thông báo cho người chơi
Dialog:Say(string.format("Chúc mừng bạn đã nâng cấp <color=yellow>[%s]<color> thành công lên <color=yellow>[%s]<color>", szCurrentSignetName, szNextSignetName), {"Cảm ơn!"})
KDialog.MsgToGlobal(string.format("Chúc mừng "..me.szName.." đã nâng cấp <color=yellow>[%s]<color> thành công lên <color=yellow>[%s]<color>", szCurrentSignetName, szNextSignetName))
end
