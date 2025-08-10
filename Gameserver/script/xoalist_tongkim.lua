if not MODULE_GAMESERVER then
return;
end
function XoaList:RemoveList_GS()
if Config.Mission_Battle_CheckNumAccount == 1 then
	Battle:resetHWfile();
end

local szTong = "\\script\\iDoctor\\CampBattle\\Tong.txt";  
KFile.WriteFile(szTong, "Name\n");
local szKim = "\\script\\iDoctor\\CampBattle\\Kim.txt";  
KFile.WriteFile(szKim, "Name\n");
    local tbFactionFiles = {
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt",  -- Thiếu Lâm Đao
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt",  -- Thiếu Lâm Bổng
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt",  -- Thiên Vương Thương
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt",  -- Thiên Vương Chùy
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt",  -- Đường Môn Bẫy
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt",  -- Đường Môn Tiễn
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt",  -- Ngũ Độc Đao
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt",  -- Ngũ Độc Chưởng
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt",  -- Nga My Chưởng
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt",  -- Nga My Buff
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt",  -- Thúy Yên Kiếm
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt",  -- Thúy Yên Đao
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt",  -- Cái Bang Rồng
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt",  -- Cái Bang Bổng
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt",  -- Thiên Nhẫn Kích
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt",  -- Thiên Nhẫn Đao
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt",  -- Võ Đang Khí
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDI.txt",  -- Võ Đang Kiếm
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt",  -- Côn Lôn Đao
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt",  -- Côn Lôn Kiếm
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt",  -- Minh Giáo Chùy
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt",  -- Minh Giáo Kiếm
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt",  -- Đoàn Thị Chỉ
        "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt"   -- Đoàn Thị Kiếm
    };

    -- Reset nội dung tất cả file về header mặc định
    for _, szFile in ipairs(tbFactionFiles) do
        KFile.WriteFile(szFile, "PlayerName\tMaMay\tnNum\n");
    end
end
