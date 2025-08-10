-- date:22/04/2024
-- by:TCQGaming
-------------------------------------------------------
local tbKyNang150 = Item:GetClass("kynangmonphai150");
tbKyNang150.nMangKyNang = {
    [1] = 1993, -- Thiếu Lâm Đao
    [2] = 1997, -- Thiếu Lâm Bổng
    [3] = 1689, -- Thiên Vương Thương
    [4] = 1960, -- Thiên Vương Chùy
    [5] = 1445, -- Đường môn bẫy
    [6] = 1544, -- Đường môn tiễn
    [7] = 1439, -- Ngũ Độc Đao
    [8] = 1442, -- Ngũ Độc Chưởng
    [9] = 1722, -- NM Chưởng
    [10] = 1724, -- NM Buff
    [11] = 1728, -- Thúy Yên Đao
    [12] = 1731, -- Thúy Yên Chưởng
    [13] = 1970, -- Cái bang bổng
    [14] = 1973, -- Cái bang Rồng
    [15] = 1964, -- Thiên nhẫn đao
    [16] = 1966, -- Thiên nhẫn kích
    [17] = 1968, -- Minh giáo Chùy
    [18] = 1978, -- Minh giáo Kiếm
    [19] = 1550, -- Võ Đang Khí
    [20] = 1551, -- Võ Đang Kiếm
    [21] = 1553, -- Côn Lôn Đao
    [22] = 1708, -- Côn Lôn Kiếm
    [23] = 1711, -- Đoàn thị Kiếm
    [24] = 1717  -- Đoàn thị Chỉ
}
function tbKyNang150:OnUse()
    if (me.nRouteId == 0 or me.nFaction == 0 or me.nSeries == 0) then
        Dialog:Say("Bạn chưa chọn hệ phái võ công");
        return 0;
    end
	if me.nLevel < 120 then 
Dialog:Say("<color=yellow>Đẳng cấp của bạn chưa đủ cấp 120")
return 
end 
    local szMsg = "<color=green>Bí tịch môn phái kỹ năng 150<color>";
    local nDaHoc = me.GetTask(9185,1)------Đã học bí kíp 150
    local nIndexSkillNonZero = nil
    
    for i = 1, 24 do
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[i])
        if nSkillLevel > 0 then
            nIndexSkillNonZero = i
            break -- Nếu tìm thấy kỹ năng có giá trị lớn hơn 0, dừng vòng lặp
        end
    end
    
    local nSkillLevel
    if nIndexSkillNonZero then
        nSkillLevel = me.GetSkillLevel(self.nMangKyNang[nIndexSkillNonZero])
    end

    local tbOpt = {} 
    
    if nDaHoc == 1 then 
        table.insert(tbOpt, {"<color=yellow>Ta đã đổi phái hãy giúp ta đổi kỹ năng",self.XoaKyNang150_1,self});
    else 
        table.insert(tbOpt, {"<color=yellow>Ta muốn học kỹ năng môn phái 150",self.LayKyNang,self});
    end 
    
    if nIndexSkillNonZero and nSkillLevel < 20 then 
        table.insert(tbOpt, {"<color=yellow>Ta muốn thăng cấp kỹ năng 150",self.ThangCapKyNang,self});
    end 
    
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end


function tbKyNang150:ThangCapKyNang()
	if (me.nRouteId == 0 or me.nFaction == 0 or me.nSeries == 0) then
		Dialog:Say("Bạn chưa chọn hệ phái võ công");
		return 0;
	end
    local nIndexSkillNonZero = nil
    
    for i = 1, 24 do
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[i])
        if nSkillLevel > 0 then
            nIndexSkillNonZero = i
            break -- Nếu tìm thấy kỹ năng có giá trị lớn hơn 0, dừng vòng lặp
        end
    end
    
   if nIndexSkillNonZero then
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[nIndexSkillNonZero])
        self:ThangCapKyNang_1(nSkillLevel)
		else 
		me.Msg("Không tồn tại kỹ năng 150")
    end
end

function tbKyNang150:XoaKyNang150_1()
	if (me.nRouteId == 0 or me.nFaction == 0 or me.nSeries == 0) then
		Dialog:Say("Bạn chưa chọn hệ phái võ công");
		return 0;
	end
    local nIndexSkillNonZero = nil
    
    for i = 1, 24 do
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[i])
        if nSkillLevel > 0 then
            nIndexSkillNonZero = i
            -- me.Msg("Kỹ năng ID có value lớn hơn 0 là " .. self.nMangKyNang[i])
            break -- Nếu tìm thấy kỹ năng có giá trị lớn hơn 0, dừng vòng lặp
        end
    end
    
    if nIndexSkillNonZero then
        self:XoaKyNang150_2(nIndexSkillNonZero)
		else 
		me.Msg("Không tồn tại kỹ năng 150")
    end
end


function tbKyNang150:NhanKyNang150_1()
    local nIndexSkillNonZero = nil
    
    for i = 1, 24 do
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[i])
        if nSkillLevel > 0 then
            nIndexSkillNonZero = i
            break -- Nếu tìm thấy kỹ năng có giá trị lớn hơn 0, dừng vòng lặp
        end
    end
    
   if nIndexSkillNonZero then
        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[nIndexSkillNonZero])
        self:NhanKyNang150_2(nSkillLevel)
		else 
		me.Msg("Không tồn tại kỹ năng 150")
    end
end

function tbKyNang150:NhanKyNang150_2(nSkillLevel)
    local nDaHoc = me.GetTask(9185, 1) -- Đã học bí kíp 150
    if nDaHoc == 1 then 
        if me.nFaction > 0 then 
            local nNewSkillID = 0
            local szSkillName = ""
            
            if me.nRouteId == 1 then
                if me.nFaction == 1 then  --Thiếu Lâm Đao
                    nNewSkillID = 1993
                elseif me.nFaction == 2 then  --Thiên Vương Thương
                    nNewSkillID = 1689
                elseif me.nFaction == 3 then  --Đường môn bẫy
                    nNewSkillID = 1445
                elseif me.nFaction == 4 then  --Ngũ Độc Đao
                    nNewSkillID = 1439
                elseif me.nFaction == 5 then  --NM Chưởng
                    nNewSkillID = 1722
                elseif me.nFaction == 6 then  --Thúy Yên Chưởng
                    nNewSkillID = 1731
                elseif me.nFaction == 7 then  --Cái bang Rồng
                    nNewSkillID = 1973
                elseif me.nFaction == 8 then  --Thiên nhẫn kích
                    nNewSkillID = 1966
                elseif me.nFaction == 9 then  --Võ Đang Khí
                    nNewSkillID = 1550
                elseif me.nFaction == 10 then  --Côn Lôn Đao
                    nNewSkillID = 1553
                elseif me.nFaction == 11 then  --Minh giáo Chùy
                    nNewSkillID = 1968
                elseif me.nFaction == 12 then  --Đoàn thị Chỉ
                    nNewSkillID = 1717
                end
            elseif me.nRouteId == 2 then
                if me.nFaction == 1 then  --Thiếu Lâm Bổng
                    nNewSkillID = 1997
                elseif me.nFaction == 2 then  --Thiên Vương Chùy
                    nNewSkillID = 1960
                elseif me.nFaction == 3 then  --Đường môn tiễn
                    nNewSkillID = 1544
                elseif me.nFaction == 4 then  --Ngũ Độc Chưởng
                    nNewSkillID = 1442
                elseif me.nFaction == 5 then  --NM Buff
                    nNewSkillID = 1724
                elseif me.nFaction == 6 then  --Thúy Yên Đao
                    nNewSkillID = 1728
                elseif me.nFaction == 7 then  --Cái bang bổng
                    nNewSkillID = 1970
                elseif me.nFaction == 8 then  --Thiên nhẫn đao
                    nNewSkillID = 1964
                elseif me.nFaction == 9 then  --Thiên nhẫn đao
                    nNewSkillID = 1551
                elseif me.nFaction == 10 then  --Võ Đang Kiếm
                    nNewSkillID = 1708
                elseif me.nFaction == 11 then  --Minh giáo Kiếm
                    nNewSkillID = 1978
                elseif me.nFaction == 12 then  --Đoàn thị kiếm
                    nNewSkillID = 1711
                end
            end 
            	local szSkillName = KFightSkill.GetSkillName(nNewSkillID);
            if nNewSkillID ~= 0 then
                    local nOldSkillLevel = me.GetSkillLevel(nNewSkillID)
                if nOldSkillLevel < 1 then
                    me.AddFightSkill(nNewSkillID, nSkillLevel)
                    Dialog:Say("Bạn đã chuyển được kỹ năng môn phái 150 <color=green>'" .. szSkillName .. "' <color>thành công,ta tin sự lựa chọn này của nhà ngươi là sáng suốt !")
                else
                    Dialog:Say("<color=yellow>Bạn đã học <color=gold>"..szSkillName.." <color>rồi nếu đổi phái khác hãy quay lại đây!")
                    return 0
                end
            else
                Dialog:Say("<color=yellow>Bạn chưa học kỹ năng 150 hoặc chưa chọn hệ phái")
                return 0
            end
        end 
	else 
    Dialog:Say("<color=yellow>Bạn chưa gia nhập môn phái không thể sử dụng")
    return 0	
    end
end


function tbKyNang150:XoaKyNang150_2(nIndexSkillNonZero)
    local nDaHoc = me.GetTask(9185, 1) -- Đã học bí kíp 150
	        local nSkillLevel = me.GetSkillLevel(self.nMangKyNang[nIndexSkillNonZero])
    if nDaHoc == 1 then 
        if me.nFaction > 0 then 
            local nNewSkillID = 0
            local szSkillName = ""
            
            if me.nRouteId == 1 then
                if me.nFaction == 1 then  --Thiếu Lâm Đao
                    nNewSkillID = 1993
                elseif me.nFaction == 2 then  --Thiên Vương Thương
                    nNewSkillID = 1689
                elseif me.nFaction == 3 then  --Đường môn bẫy
                    nNewSkillID = 1445
                elseif me.nFaction == 4 then  --Ngũ Độc Đao
                    nNewSkillID = 1439
                elseif me.nFaction == 5 then  --NM Chưởng
                    nNewSkillID = 1722
                elseif me.nFaction == 6 then  --Thúy Yên Chưởng
                    nNewSkillID = 1731
                elseif me.nFaction == 7 then  --Cái bang Rồng
                    nNewSkillID = 1973
                elseif me.nFaction == 8 then  --Thiên nhẫn kích
                    nNewSkillID = 1966
                elseif me.nFaction == 9 then  --Võ Đang Khí
                    nNewSkillID = 1550
                elseif me.nFaction == 10 then  --Côn Lôn Đao
                    nNewSkillID = 1553
                elseif me.nFaction == 11 then  --Minh giáo Chùy
                    nNewSkillID = 1968
                elseif me.nFaction == 12 then  --Đoàn thị Chỉ
                    nNewSkillID = 1717
                end
            elseif me.nRouteId == 2 then
                if me.nFaction == 1 then  --Thiếu Lâm Bổng
                    nNewSkillID = 1997
                elseif me.nFaction == 2 then  --Thiên Vương Chùy
                    nNewSkillID = 1960
                elseif me.nFaction == 3 then  --Đường môn tiễn
                    nNewSkillID = 1544
                elseif me.nFaction == 4 then  --Ngũ Độc Chưởng
                    nNewSkillID = 1442
                elseif me.nFaction == 5 then  --NM Buff
                    nNewSkillID = 1724
                elseif me.nFaction == 6 then  --Thúy Yên Đao
                    nNewSkillID = 1728
                elseif me.nFaction == 7 then  --Cái bang bổng
                    nNewSkillID = 1970
                elseif me.nFaction == 8 then  --xxxxxxxxxxx
                    nNewSkillID = 1964
                elseif me.nFaction == 9 then  --Thiên nhẫn đao
                    nNewSkillID = 1551
                elseif me.nFaction == 10 then  --Võ Đang Kiếm
                    nNewSkillID = 1708
                elseif me.nFaction == 11 then  --Côn Lôn Kiếm
                    nNewSkillID = 1978
                elseif me.nFaction == 12 then  --Minh giáo Kiếm
                    nNewSkillID = 1711
                end
            end 
            	local szSkillName = KFightSkill.GetSkillName(nNewSkillID);
            if nNewSkillID ~= 0 then
                    local nOldSkillLevel = me.GetSkillLevel(nNewSkillID)
 if nOldSkillLevel < 1 then
						tbKyNang150:NhanKyNang150_1()
						if nIndexSkillNonZero == 1 then
							me.DelFightSkill(1993) -- Thiếu Lâm Đao
						elseif nIndexSkillNonZero == 2 then
							me.DelFightSkill(1997) -- Thiếu Lâm Bổng
						elseif nIndexSkillNonZero == 3 then
							me.DelFightSkill(1689) -- Thiên Vương Thương
						elseif nIndexSkillNonZero == 4 then
							me.DelFightSkill(1960) -- Thiên Vương Chùy
						elseif nIndexSkillNonZero == 5 then
							me.DelFightSkill(1445) -- Đường môn bẫy
						elseif nIndexSkillNonZero == 6 then
							me.DelFightSkill(1544) -- Đường môn tiễn
						elseif nIndexSkillNonZero == 7 then
							me.DelFightSkill(1439) -- Ngũ Độc Đao
						elseif nIndexSkillNonZero == 8 then
							me.DelFightSkill(1442) -- Ngũ Độc Chưởng
						elseif nIndexSkillNonZero == 9 then
							me.DelFightSkill(1722) -- NM Chưởng
						elseif nIndexSkillNonZero == 10 then
							me.DelFightSkill(1724) -- NM Buff
						elseif nIndexSkillNonZero == 11 then
							me.DelFightSkill(1728) -- Thúy Yên Đao
						elseif nIndexSkillNonZero == 12 then
							me.DelFightSkill(1731) -- Thúy Yên Chưởng
						elseif nIndexSkillNonZero == 13 then
							me.DelFightSkill(1970) -- Cái bang bổng
						elseif nIndexSkillNonZero == 14 then
							me.DelFightSkill(1973) -- Cái bang Rồng
						elseif nIndexSkillNonZero == 15 then
							me.DelFightSkill(1964) -- Thiên nhẫn đao
						elseif nIndexSkillNonZero == 16 then
							me.DelFightSkill(1966) -- Thiên nhẫn kích
						elseif nIndexSkillNonZero == 17 then
							me.DelFightSkill(1968) -- Minh giáo Chùy
						elseif nIndexSkillNonZero == 18 then
							me.DelFightSkill(1978) -- Minh giáo Kiếm
						elseif nIndexSkillNonZero == 19 then
							me.DelFightSkill(1550) -- Võ Đang Khí
						elseif nIndexSkillNonZero == 20 then
							me.DelFightSkill(1551) -- Võ Đang Kiếm
						elseif nIndexSkillNonZero == 21 then
							me.DelFightSkill(1553) -- Côn Lôn Đao
						elseif nIndexSkillNonZero == 22 then
							me.DelFightSkill(1708) -- Côn Lôn Kiếm
						elseif nIndexSkillNonZero == 23 then
							me.DelFightSkill(1711) -- Đoàn thị Kiếm
						elseif nIndexSkillNonZero == 24 then
							me.DelFightSkill(1717) -- Đoàn thị Chỉ
						end
 else
     Dialog:Say("<color=yellow>Bạn đang có tuyệt học 150<color=gold> "..szSkillName.."<color>rồi mà ? Hãy đổi môn phái khác rồi tới đây")
     return 0
end
 else
       Dialog:Say("<color=yellow>Bạn chưa học kỹ năng 150 hoặc chưa chọn hệ phái")
	return 0
    end
    end 
	else 
    Dialog:Say("<color=yellow>Bạn chưa gia nhập môn phái không thể sử dụng")
    return 0	
    end
end

function tbKyNang150:LayKyNang()
    if me.nFaction > 0 then 
        if me.nFaction == 1 and me.nRouteId == 1  then    -- Thiếu Lâm Đao
			me.AddFightSkill(1993,1);-----Thiếu Lâm Đao
		elseif me.nFaction == 1 and me.nRouteId == 2 then 
			me.AddFightSkill(1997,1);-----Thiếu Lâm Bổng
        elseif me.nFaction == 2 and me.nRouteId == 1 then    --Skill Thiên Vương 
			me.AddFightSkill(1689,1);-----Thiên Vương Thương
		elseif me.nFaction == 2 and me.nRouteId == 2 then 
			me.AddFightSkill(1960,1);-----Thiên Vương Chùy
        elseif me.nFaction == 3 and me.nRouteId == 1 then    --Đường Môn 
			me.AddFightSkill(1445,1);-----Đường môn bẫy
		elseif me.nFaction == 3 and me.nRouteId == 2 then		
			me.AddFightSkill(1544,1);-----Đường môn tiễn
        elseif me.nFaction == 4 and me.nRouteId == 1 then   --Ngũ Độc 
			me.AddFightSkill(1439,1);-----Ngũ Độc Đao
		elseif me.nFaction == 4 and me.nRouteId == 2 then
			me.AddFightSkill(1442,1);-----Ngũ Độc Chưởng
        elseif me.nFaction == 5 and me.nRouteId == 1 then    --Nga My 
			me.AddFightSkill(1722,1);-----NM Chưởng
		 elseif me.nFaction == 5 and me.nRouteId == 2 then
			me.AddFightSkill(1724,1);-----NM Buff
		elseif me.nFaction == 6 and me.nRouteId == 2 then
			me.AddFightSkill(1728,1); --- Thúy Yên Đao
        elseif me.nFaction == 6 and me.nRouteId == 1 then    --Thúy Yên 
			me.AddFightSkill(1731,1); --- Thúy Yên Chưởng
		elseif me.nFaction == 7 and me.nRouteId == 2 then
			me.AddFightSkill(1970,1);-----Cái bang bổng
        elseif me.nFaction == 7 and me.nRouteId == 1 then    --Cái Bang 
			me.AddFightSkill(1973,1);-----Cái bang Rồng
        elseif me.nFaction == 8 and me.nRouteId == 2 then    --Thiên Nhẫn 
			me.AddFightSkill(1964,1);-----Thiên nhẫn đao
		elseif me.nFaction == 8 and me.nRouteId == 1 then
			me.AddFightSkill(1966,1);-----Thiên nhẫn kích
       elseif me.nFaction == 11 and me.nRouteId == 1 then   --Minh Giáo 
			me.AddFightSkill(1968,1);-----Minh giáo Chùy
       elseif me.nFaction == 11 and me.nRouteId == 2 then   --Minh Giáo 
			me.AddFightSkill(1978,1);-----Minh giáo Kiếm
       elseif me.nFaction == 9 and me.nRouteId == 1 then    --Võ Đang 
			me.AddFightSkill(1550,1);-----Võ Đang Khí
		elseif me.nFaction == 9 and me.nRouteId == 2 then 
			me.AddFightSkill(1551,1);-----Võ Đang Kiếm
        elseif me.nFaction == 10 and me.nRouteId == 1 then    --Côn Lôn 
			me.AddFightSkill(1553,1);-----Côn Lôn Đao
		elseif me.nFaction == 10 and me.nRouteId == 2 then
			me.AddFightSkill(1708,1);-----Côn Lôn Kiếm
        elseif me.nFaction == 12 and me.nRouteId == 2 then    --Đoàn Thị 
			me.AddFightSkill(1711,1);-----Đoàn thị Kiếm
        elseif me.nFaction == 12 and me.nRouteId == 1 then    --Đoàn Thị 
			me.AddFightSkill(1717,1);-----Đoàn thị Chỉ 
	end 
else 
Dialog:Say("<color=yellow>Bạn chưa gia nhập môn phái không thể sử dụng")
return 0
end 
me.SetTask(9185,1,1)------Đã học bí kíp 150
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> Đã học được kỹ năng môn phái 150 thành công , giang hồ lại dậy sóng !!")
return 1;-----Xóa vật phẩm sau khi sử dụng
end



function tbKyNang150:ThangCapKyNang_1(nSkillLevel)
 local tbManhBiKipThatTruyen	= {18,1,1321,2,0,0};  
local nSoDong = 10000
local nSoDongTru
local nSoBiKipTru
if nSkillLevel == 1 then
    nSoDongTru = 10 * nSoDong
	nSoBiKipTru = 5
elseif nSkillLevel == 2 then
    nSoDongTru = 20 * nSoDong
		nSoBiKipTru = 10
elseif nSkillLevel == 3 then
    nSoDongTru = 30 * nSoDong
		nSoBiKipTru = 15
elseif nSkillLevel == 4 then
    nSoDongTru = 40 * nSoDong
		nSoBiKipTru = 20
elseif nSkillLevel == 5 then
    nSoDongTru = 50 * nSoDong
		nSoBiKipTru = 25
elseif nSkillLevel == 6 then
    nSoDongTru = 60 * nSoDong
		nSoBiKipTru = 30
elseif nSkillLevel == 7 then
    nSoDongTru = 70 * nSoDong
		nSoBiKipTru = 35
elseif nSkillLevel == 8 then
    nSoDongTru = 80 * nSoDong
		nSoBiKipTru = 40
elseif nSkillLevel == 9 then
    nSoDongTru = 90 * nSoDong
		nSoBiKipTru = 45
elseif nSkillLevel == 10 then
    nSoDongTru = 100 * nSoDong
		nSoBiKipTru = 50
elseif nSkillLevel == 11 then
    nSoDongTru = 110 * nSoDong
		nSoBiKipTru = 55
elseif nSkillLevel == 12 then
    nSoDongTru = 130 * nSoDong
		nSoBiKipTru = 60
elseif nSkillLevel == 13 then
    nSoDongTru = 150 * nSoDong
		nSoBiKipTru = 65
elseif nSkillLevel == 14 then
    nSoDongTru = 170 * nSoDong
		nSoBiKipTru = 70
elseif nSkillLevel == 15 then
    nSoDongTru = 200 * nSoDong
		nSoBiKipTru = 75
elseif nSkillLevel == 16 then
    nSoDongTru = 230 * nSoDong
		nSoBiKipTru = 80
elseif nSkillLevel == 17 then
    nSoDongTru = 250 * nSoDong
		nSoBiKipTru = 85
elseif nSkillLevel == 18 then
    nSoDongTru = 280 * nSoDong
		nSoBiKipTru = 90
elseif nSkillLevel == 19 then
    nSoDongTru = 300 * nSoDong
	nSoBiKipTru = 100
end
local nManhBiKip = me.GetItemCountInBags(18,1,1321,2) -- mảnh bí kíp 150
	    if nManhBiKip < nSoBiKipTru then
        Dialog:Say("Bạn thiếu mảnh bí kíp thất truyền rồi xin hãy kiểm tra lại\nHiện nay ngươi cần có "..nSoBiKipTru.." mảnh để thăng cấp")
        return
    end
local nMyCoin = me.nCoin;
	if (nMyCoin < nSoDongTru) then
	Dialog:Say("Bạn không đủ <color=red>"..nSoDongTru.." vạn đồng<color>");
    return 0; 
	end
   local nDaHoc = me.GetTask(9185, 1) -- Đã học bí kíp 150
    if nDaHoc == 1 then 
        if me.nFaction > 0 then 
            local nNewSkillID = 0
            local szSkillName = ""
            
            if me.nRouteId == 1 then
                if me.nFaction == 1 then  --Thiếu Lâm Đao
                    nNewSkillID = 1993
                elseif me.nFaction == 2 then  --Thiên Vương Thương
                    nNewSkillID = 1689
                elseif me.nFaction == 3 then  --Đường môn bẫy
                    nNewSkillID = 1445
                elseif me.nFaction == 4 then  --Ngũ Độc Đao
                    nNewSkillID = 1439
                elseif me.nFaction == 5 then  --NM Chưởng
                    nNewSkillID = 1722
                elseif me.nFaction == 6 then  --Thúy Yên Chưởng
                    nNewSkillID = 1731
                elseif me.nFaction == 7 then  --Cái bang Rồng
                    nNewSkillID = 1973
                elseif me.nFaction == 8 then  --Thiên nhẫn kích
                    nNewSkillID = 1966
                elseif me.nFaction == 9 then  --Võ Đang Khí
                    nNewSkillID = 1550
                elseif me.nFaction == 10 then  --Côn Lôn Đao
                    nNewSkillID = 1553
                elseif me.nFaction == 11 then  --Minh giáo Chùy
                    nNewSkillID = 1968
                elseif me.nFaction == 12 then  --Đoàn thị Chỉ
                    nNewSkillID = 1717
                end
            elseif me.nRouteId == 2 then
                if me.nFaction == 1 then  --Thiếu Lâm Bổng
                    nNewSkillID = 1997
                elseif me.nFaction == 2 then  --Thiên Vương Chùy
                    nNewSkillID = 1960
                elseif me.nFaction == 3 then  --Đường môn tiễn
                    nNewSkillID = 1544
                elseif me.nFaction == 4 then  --Ngũ Độc Chưởng
                    nNewSkillID = 1442
                elseif me.nFaction == 5 then  --NM Buff
                    nNewSkillID = 1724
                elseif me.nFaction == 6 then  --Thúy Yên Đao
                    nNewSkillID = 1728
                elseif me.nFaction == 7 then  --Cái bang bổng
                    nNewSkillID = 1970
                elseif me.nFaction == 8 then  --xxxxxxxxxxx
                    nNewSkillID = 1964
                elseif me.nFaction == 9 then  --Thiên nhẫn đao
                    nNewSkillID = 1551
                elseif me.nFaction == 10 then  --Võ Đang Kiếm
                    nNewSkillID = 1708
                elseif me.nFaction == 11 then  --Côn Lôn Kiếm
                    nNewSkillID = 1978
                elseif me.nFaction == 12 then  --Minh giáo Kiếm
                    nNewSkillID = 1711
                end
            end 
            	local szSkillName = KFightSkill.GetSkillName(nNewSkillID);
            if nNewSkillID ~= 0 then
local SoDongText = math.floor(nSoDongTru/10000);
local nCapDo = nSkillLevel+1
                    me.AddFightSkill(nNewSkillID, nSkillLevel+1)
							me.AddJbCoin(-nSoDongTru)
							 Task:DelItem(me, tbManhBiKipThatTruyen, nSoBiKipTru); 
                    KDialog.MsgToGlobal("<color=green>"..me.szName.."<color> đã nâng cấp <color=gold>'" .. szSkillName .. "' <color>thành công lên cấp "..nCapDo.." Tiêu Tốn "..SoDongText.." vạn đồng và "..nSoBiKipTru.." mảnh bí kíp thất truyền")
            else
                Dialog:Say("<color=yellow>Bạn chưa học kỹ năng 150 hoặc chưa chọn hệ phái")
                return 0
            end
        end 
	else 
    Dialog:Say("<color=yellow>Bạn chưa gia nhập môn phái không thể sử dụng")
    return 0	
    end
end