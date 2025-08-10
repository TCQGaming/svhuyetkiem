-- Khai báo bảng tbChuyenThuocTinhAn và gán cho SpecialEvent
SpecialEvent.tbChuyenThuocTinhAn = {}
local tbChuyenThuocTinhAn = SpecialEvent.tbChuyenThuocTinhAn
tbChuyenThuocTinhAn.TASK_RutCuongHoa = 3130;
function tbChuyenThuocTinhAn:OnDialog()
    if me.CountFreeBagCell() < 3 then
        Dialog:Say("Hãy chú ý sắp xếp hành trang có đủ 3 ô trống")
        return 0
    end

		local nCount1 = me.GetTask(3130,1)
		if nCount1 < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		
    local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_SIGNET, 0)

    if not pItem then
        Dialog:Say("Ngươi chưa trang bị <color=yellow>Lôi Đình Ấn<color> lên người, không thể tăng cấp")
        return 0
    end

    -- Lưu thông tin vào bảng UI
    tbChuyenThuocTinhAn.nLevelCuongHoa = nLevelCuongHoa
    tbChuyenThuocTinhAn.nLevelNhuocHoa = nLevelNhuocHoa
    local szMsg = "Hãy quyết định trước khi đồng ý"
    Dialog:OpenGift(szMsg, nil, {self.ChuyenCuongHoa, self})
end

function tbChuyenThuocTinhAn:ChuyenCuongHoa(tbItemObj)
    local pItem = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_SIGNET, 0)
    local nMagicIndex1 = 1  -- Dòng thuộc tính 1
    local nMagicIndex2 = 2  -- Dòng thuộc tính 2
    local nLevel = 1000 -- Đặt cấp độ phù hợp
	local  nGioiHan = me.GetTask(3130,1)
    local nCount = 0
    for i = 1, #tbItemObj do
        nCount = nCount + tbItemObj[i][1].nCount
        local nLevelCuongHoaOld = tbItemObj[i][1].GetGenInfo(nMagicIndex1 * 2 - 1, 0)
        local nLevelNhuocHoaOld = tbItemObj[i][1].GetGenInfo(nMagicIndex2 * 2 - 1, 0)
        
        -- Kiểm tra nếu cường hóa của trang bị trong tbItemObj dưới 1000, thì không cho phép chuyển
        if nLevelCuongHoaOld < 1000 or nLevelNhuocHoaOld < 1000 then
            me.Msg("<color=yellow>Ngũ Hành Ấn của ngươi hiện nay chưa đạt 1000 Cường Hóa và Nhược Hóa, không thể chuyển<color>")
            return 0
        end 
        
        -- Kiểm tra tên của vật phẩm
        if tbItemObj[i][1].szName ~= "Ngũ Hành Ấn" then
            Dialog:Say("Hình như ngươi đặt vào vật phẩm không phải Ngũ Hành Ấn")
            return 0
        end
    end

    if nCount ~= 1 then
        me.Msg("<color=yellow>Mỗi lần chuyển chỉ được đặt vào 1 trang bị thôi<color>")
        return 0
    end

    for i = 1, #tbItemObj do
        local nLevelCuongHoaOld = pItem.GetGenInfo(nMagicIndex1 * 2 - 1, 0)
        local nLevelNhuocHoaOld = pItem.GetGenInfo(nMagicIndex2 * 2 - 1, 0)
        
        -- Trừ cấp độ của Ấn cũ
        nLevelCuongHoaOld = nLevelCuongHoaOld - nLevel
        nLevelNhuocHoaOld = nLevelNhuocHoaOld - nLevel

        -- Đặt cấp độ cho Ấn cũ về 0
        Item:SetSignetMagic(pItem, nMagicIndex1, 0, 0)
        Item:SetSignetMagic(pItem, nMagicIndex2, 0, 0)

        -- Đặt cấp độ cho Ấn mới trong tbItemObj về 0
        Item:SetSignetMagic(tbItemObj[i][1], nMagicIndex1, 0, 0)
        Item:SetSignetMagic(tbItemObj[i][1], nMagicIndex2, 0, 0)
    end

    -- Đặt cấp độ cho Ấn trên người lên giá trị cố định
    Item:SetSignetMagic(pItem, nMagicIndex1, nLevel, 0)
    Item:SetSignetMagic(pItem, nMagicIndex2, nLevel, 0)
	me.SetTask(self.TASK_RutCuongHoa,1,nGioiHan - 1)
end



