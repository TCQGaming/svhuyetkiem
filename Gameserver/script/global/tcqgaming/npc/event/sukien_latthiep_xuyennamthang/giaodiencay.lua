---------------------TCQGaming Dev----------------------------------

SpecialEvent.tbCayLoc = SpecialEvent.tbCayLoc or {};
local tbCayLoc = SpecialEvent.tbCayLoc;

function tbCayLoc:doitranh()
    local szMsg = "Hãy đặt vào giao diện 3 Liễn Phúc Lộc Thọ:\n<pic=167>Phúc: 0\n<pic=167>Lộc: 0\n<pic=167>Thọ: 0\n";
	szMsg = szMsg .. "<color=green>Để Thành Phẩm\n<color=yellow>Tranh Phúc Lộc Thọ";
	Dialog:OpenGift(szMsg, {"SpecialEvent.tbCayLoc:CheckPhucLoc"}, {tbCayLoc.OnOpenGiftOk, tbCayLoc});
end 

function tbCayLoc:OnOpenGiftOk(tbItemObj)
    local nCountPhuc, nCountLoc, nCountTho = 0, 0, 0;
    local tbPhuc = {18, 1, 2034, 24};
    local tbLoc = {18, 1, 2034, 25};
    local tbTho = {18, 1, 2034, 26};

    local nTotalItemCount = 0  -- Biến đếm tổng số lượng vật phẩm

    for i, pItem in pairs(tbItemObj) do
        if pItem[1].nGenre == tbPhuc[1] and
            pItem[1].nDetail == tbPhuc[2] and
            pItem[1].nParticular == tbPhuc[3] and
            pItem[1].nLevel == tbPhuc[4] then
            nCountPhuc = nCountPhuc + pItem[1].nCount;
        elseif pItem[1].nGenre == tbLoc[1] and
            pItem[1].nDetail == tbLoc[2] and
            pItem[1].nParticular == tbLoc[3] and
            pItem[1].nLevel == tbLoc[4] then
            nCountLoc = nCountLoc + pItem[1].nCount;
        elseif pItem[1].nGenre == tbTho[1] and
            pItem[1].nDetail == tbTho[2] and
            pItem[1].nParticular == tbTho[3] and
            pItem[1].nLevel == tbTho[4] then
            nCountTho = nCountTho + pItem[1].nCount;
        else
            Dialog:Say("Vật phẩm không hợp lệ");
            return 0;
        end

        nTotalItemCount = nTotalItemCount + 1;
    end

    if (nCountPhuc ~= 1) or (nCountLoc ~= 1) or (nCountTho ~= 1) or (nTotalItemCount ~= 3) then
        Dialog:Say("Yêu cầu 1 bộ Phúc Lộc Thọ");
        return 0;
    end

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end

    me.AddStackItem(18, 1, 2034, 27, nil, 1);
    return 1;
end

function tbCayLoc:doiqua()
	local szMsg = "Hãy đặt vào 1 Hòm Tranh Phúc Lộc Thọ\n<color>";
	szMsg = szMsg .. "<color=green>Để Thành Phẩm :\n<color=yellow>10 Thành phẩm Tiêu Dao Cốc";
	Dialog:OpenGift(szMsg, {"SpecialEvent.tbCayLoc:CheckQuaPhucLoc"}, {tbCayLoc.OnHT7, tbCayLoc});
end 
function tbCayLoc:OnHT7(tbItemObj)
    local tbPhuc = {18, 1, 2034, 27};

    local nCountHT = 0
    local nTotalItemCount = 0  -- Biến đếm tổng số lượng vật phẩm

    for i, pItem in pairs(tbItemObj) do
        if pItem[1].nGenre == tbPhuc[1] and
            pItem[1].nDetail == tbPhuc[2] and
            pItem[1].nParticular == tbPhuc[3] and
            pItem[1].nLevel == tbPhuc[4] then
            nCountHT = nCountHT + pItem[1].nCount;
        else
            Dialog:Say("Vật phẩm không hợp lệ");
            return 0;
        end

        nTotalItemCount = nTotalItemCount + 1;
    end

    if (nCountHT < 1) then
        Dialog:Say("Yêu cầu ít nhất 1 Bức Tranh Phúc Lộc Thọ");
        return 0;
    end
    -- Xóa các vật phẩm đã sử dụng
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end

    -- me.AddStackItem(18, 1, 114, 7, nil, nCountHT);
    me.AddStackItem(18, 1, 200, 1, nil, nCountHT*10);
    return 1;
end









