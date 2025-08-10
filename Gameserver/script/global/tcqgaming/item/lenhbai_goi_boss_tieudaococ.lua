-----Dev : TCQGaming
-----Time : 07/04/2023 4:51 PM
local KnbBiz = Item:GetClass("lenhbai_goiboss_tdc");


function KnbBiz:OnUse()
    -- DoScript("\\script\\global\\tcqgaming\\item\\lenhbai_goi_boss_tieudaococ.lua"); 
    local nIdBoss = {
        10403,---Mộc Siêu
        10404,----Từ Uyển
        10405,---- Tần trọng
        10406,---Hạ Tiểu Sảnh
        10407,---Diệp Tịnh
        10408,---Bảo ngọc
        10409,---Oanh Oanh
    }

    -- Chọn ngẫu nhiên một ID boss từ mảng
    local randomIndex = MathRandom(1, #nIdBoss)
    local randomBossId = nIdBoss[randomIndex]

    local nMapId, nPosX, nPosY = me.GetWorldPos();
    KNpc.Add2(randomBossId, 100, -1, nMapId, nPosX, nPosY);
    
    me.Msg("Bạn vừa triệu hồi <color=gold>Boss Tiêu Dao Cốc<color> thành công");
    return 1;-----Xóa vật phẩm sau khi sử dụng
end
