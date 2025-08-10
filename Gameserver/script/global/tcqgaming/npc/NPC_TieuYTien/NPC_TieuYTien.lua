--刑部捕头
--孙多良
--2008.08.08

local npcghep = Npc:GetClass("ghep_trangbi")

function npcghep:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\NPC_TieuYTien\\NPC_TieuYTien.lua");
	local nHardWareId_p = me.dwHardWareId;
	local szMsg = "<color=yellow>Chào Người Anh Em<color> "..me.szName.."";
  local tbOpt =   {}
			table.insert(tbOpt, {"<color=green>Đổi Hòa Thị Ngọc thô<color>",self.doihoathibichtho,self});
						table.insert(tbOpt, {"<color=green>Đổi Chân Nguyên Tu Luyện Đơn<color>",self.doichannguyenne,self});
			table.insert(tbOpt, {"<color=green>Sử dụng nhanh Chân Nguyên Tu Luyện Đơn<color>",self.dungnhanhchannguyendon,self});
			table.insert(tbOpt, {"<color=green>Chế tạo và Nâng cấp trang bị đồng hành<color>",SpecialEvent.TB_DongHanh_Skill.OnDialog,SpecialEvent.TB_DongHanh_Skill});
			--table.insert(tbOpt, {"<color=green>Liên Quan Trang Bị Đồng Hành<color>" , SpecialEvent.DucTrangBi.OnDialog, SpecialEvent.DucTrangBi,});
			table.insert(tbOpt, {"<color=green>Liên Quan Nâng cấp sách vở <color>" , SpecialEvent.NangSachVo.OnDialog, SpecialEvent.NangSachVo,});
		--	table.insert(tbOpt, {"<color=green>Hoán Đổi Thú Cưỡi <color>" , SpecialEvent.HoanNgua.OnDialog, SpecialEvent.HoanNgua,});
			table.insert(tbOpt, {"<color=green>Tính Năng Tẩy và Khai Thiên Đồng Hành <color>" , SpecialEvent.allpet.OnDialog, SpecialEvent.allpet,});
			-- table.insert(tbOpt, {"<color=green>Kích Hoạt Kỹ Năng Đồng Hành<color>" , SpecialEvent.HieuUng_DongHanh.OnDialog, SpecialEvent.HieuUng_DongHanh,});
			table.insert(tbOpt, {"Kết Thúc Đối Thoại", self});
			
  Dialog:Say(szMsg, tbOpt)
end

function npcghep:doichannguyenne()
    local tbHuyenTinh = {18, 1, 114, 8};  -- Huyền Tinh 7
    local tbHuyenTinh1 = {18, 1, 1, 8};    -- Huyền Tinh 7 (Biến thể khác)
    local nSoLuongHT = me.GetItemCountInBags(18, 1, 114, 8);
    local nSoLuongHT1 = me.GetItemCountInBags(18, 1, 1, 8);
    local tbItemInfo = {bForceBind=1};

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

    if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
        Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 8 rồi xin hãy kiểm tra lại"); 
        return 0;
    end

    local nTotalChuyenNguyen = 0;

    -- Xử lý cho loại Huyền Tinh đầu tiên
    if nSoLuongHT > 0 then
        for i = 1, nSoLuongHT do
            local nSoHT = MathRandom(3, 7);
            nTotalChuyenNguyen = nTotalChuyenNguyen + nSoHT;
        end
        Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
        me.AddStackItem(18, 1, 402, 1, tbItemInfo, nTotalChuyenNguyen);
        KDialog.MsgToGlobal("Người chơi <color=green>"..me.szName.."<color> Đổi thành công <color=purple>"..nTotalChuyenNguyen.." Chân Nguyên Tu Luyện Đơn<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 8 khóa<color> thật bá đạo!<color>");
    end

    -- Xử lý cho loại Huyền Tinh thứ hai
    nTotalChuyenNguyen = 0;  -- Reset tổng số lượng cho loại thứ hai
    if nSoLuongHT1 > 0 then
        for i = 1, nSoLuongHT1 do
            local nSoHT = MathRandom(3, 7);
            nTotalChuyenNguyen = nTotalChuyenNguyen + nSoHT;
        end
        Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
        me.AddStackItem(18, 1, 402, 1, tbItemInfo, nTotalChuyenNguyen);
        KDialog.MsgToGlobal("Người chơi <color=green>"..me.szName.."<color> Đổi thành công <color=purple>"..nTotalChuyenNguyen.." Chân Nguyên Tu Luyện Đơn<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 8 không khóa<color> thật bá đạo!<color>");
    end
end

function npcghep:dungnhanhchannguyendon()
    local SoLuong = me.GetItemCountInBags(18, 1, 402, 1)
    if SoLuong < 1 then 
        Dialog:Say("Bạn không có chân nguyên tu luyện đơn loại ID 402.")
        return 
    end 

    local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN)
    if pItem == nil then
        me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện")
        return 0
    end

    local exp_required = {
    5, 10, 15, 20, 25, 30, 35, 40, 45, 50,
    55, 60, 65, 70, 75, 80, 85, 90, 95, 100,
    105, 110, 115, 120, 125, 130, 135, 140, 145, 150,
    155, 160, 165, 170, 175, 180, 185, 190, 195, 200,
    205, 210, 215, 220, 225, 230, 235, 240, 245, 250,
    255, 260, 265, 270, 275, 280, 285, 290, 295, 300,
    305, 310, 315, 320, 325, 330, 335, 340, 345, 350,
    355, 360, 365, 370, 375, 380, 385, 390, 395, 400,
    405, 410, 415, 420, 425, 430, 435, 440, 445, 450,
    455, 460, 465, 470, 475, 480, 485, 490, 495, 500,
    505, 510, 515, 520, 525, 530, 535, 540, 545, 550,
    555, 560, 565, 570, 575, 580, 585, 590, 595, 600,
    605, 610, 615, 620, 625, 630, 635, 640, 645, 650,
    655, 660, 665, 670, 675, 680, 685, 690, 695, 700,
    705, 710, 715, 720, 725, 730, 735, 740, 745, 750,
    755, 760, 765, 770, 775, 780, 785, 790, 795, 800,
    805, 810, 815, 820, 825, 830, 835, 840, 845, 850,
    855, 860, 865, 870, 875, 880, 885, 890, 895, 900,
    905, 910, 915, 920, 925, 930, 935, 940, 945, 950,
    955, 960, 965, 970, 975, 980, 985, 990, 995, 1000
    }

    local maxExp200 = 0
    for i = 1, 200 do
        maxExp200 = maxExp200 + exp_required[i]
    end

    local tbOpt = {}
    local allAttributesMaxed = true

    for index = 1, 4 do
        local nLevel = pItem.GetGenInfo(index * 2 - 1, 0)
        local currentExp = 0

        -- Tính toán kinh nghiệm hiện tại cho dòng hiện tại
        for i = 1, nLevel do
            currentExp = currentExp + exp_required[i]
        end

        -- Tính toán số điểm kinh nghiệm còn lại để đạt cấp 200
        local remainingExp = maxExp200 - currentExp
        local maxCanUse = math.floor(remainingExp / 10)

        -- Kiểm tra nếu dòng này có thể tu luyện thêm
        if remainingExp > 0 and maxCanUse > 0 then
            allAttributesMaxed = false -- Chỉ cần một dòng có thể tu luyện thì biến này sẽ là false

            local stt = ""
            if index == 1 then stt = "Thứ Nhất"
            elseif index == 2 then stt = "Thứ Hai"
            elseif index == 3 then stt = "Thứ Ba"
            elseif index == 4 then stt = "Thứ Bốn"
            end

            -- Tạo tùy chọn cho dòng này
            table.insert(tbOpt, {
                string.format("Tu Luyện thuộc tính <color=gold>%s<color>", stt),
                self.tuluyen,
                self,
                index,
                math.min(SoLuong, maxCanUse)
            })
        end
    end

    -- Kiểm tra lại nếu tất cả các thuộc tính đều đạt max
    if #tbOpt == 0 and allAttributesMaxed then
        Dialog:Say("Tất cả thuộc tính Chân Nguyên đều đã đạt cấp 200, không thể tu luyện thêm.")
        return
    end

    -- Nếu có tùy chọn tu luyện, hiển thị chúng
    if #tbOpt > 0 then
        table.insert(tbOpt, {"Hiện tại ta chưa muốn"})
        Dialog:Say(string.format("Chân nguyên tu luyện, hộ thể cường thân. Phát quang thiên hạ. Hiện nay trong hành trang ta thấy ngươi có\n<color=yellow>%d<color> Chân Nguyên Tu Luyện Đơn\nNgươi muốn sử dụng toàn bộ cho dòng nào?", SoLuong), tbOpt)
    else
        -- Nếu không có tùy chọn nào, thông báo rằng không thể tu luyện thêm
        Dialog:Say("Không có tùy chọn tu luyện nào.")
    end
end



function npcghep:tuluyen(index, SoLuong)
    local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
    if pItem == nil then
        me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị sau đó mới có thể Tu Luyện");
        return 0;
    end

    local stt = ""
    if index == 1 then 
        stt = "Nhất"
    elseif index == 2 then 
        stt = "Hai"
    elseif index == 3 then 
        stt = "Ba"
    elseif index == 4 then 
        stt = "Bốn"
    end 

    -- Thực hiện nâng cấp Chân Nguyên
    local tongdiem = SoLuong * 10
    Item:UpgradeZhenYuanNoItem(pItem, tongdiem, index)
    Task:DelItem(me, {18, 1, 402, 1, 0, 0}, SoLuong)
    me.Msg(string.format("Chúc mừng <color=gold>%s<color> tu luyện Chân Nguyên thành công thuộc tính thứ %s tăng <color=gold>%d điểm<color>.", me.szName, stt, tongdiem))
end



function npcghep:doihoathibichtho()
if me.CountFreeBagCell() < 5 then
		Dialog:Say("Phải Có 5 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
	local tbItemId1 = {18,1,1327,13,0,0}; -- dtv
	local nCount1 = me.GetItemCountInBags(18,1,1327,13);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 50*10000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
if nCount1 < 100 then
Dialog:Say("Để đổi 1 Hòa Thị Ngọc thô cần 100 MG Hòa Thị Ngọc ( thô ) Bạn chỉ có "..nCount1.." Mảnh.")
return
end
		Task:DelItem(me, tbItemId1, 100);
		me.AddJbCoin(-50*10000);
		-------------------------------------22,1,81,1
		me.AddStackItem(22,1,81,1,nil,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>Hòa Thị Ngọc Thô<color> ");
	KDialog.MsgToGlobal("Người chơi <color=green>"..me.szName.."<color> ghép thành công 1 viên<color=yellow> [Hòa Thị Ngọc thô]<color> thật bá đạo !");
end

--------------------------Chân Nguyên---------------------------
function npcghep:GhepChanNguyen()
	local szMsg = "Đây là Tính Năng Ghép <color=yellow>Chân Nguyên<color>Vui lòng lựa chọn loại Chân Nguyên muốn nâng cấp";
	local tbOpt = {
		{"<color=blue>Công Thức Ghép Chân Nguyên<color>", self.congthucghepCN, self},
		{"<color=blue>Ghép [Chân nguyên] Diệp Tịnh<color>", self.ChanNguyenDT, self},
		{"<color=blue>Ghép [Chân nguyên] Bảo Ngọc<color>", self.ChanNguyenBN, self},
		{"<color=blue>Ghép [Chân nguyên] Hạ Tiểu Sảnh<color>", self.ChanNguyenHTS, self},
		{"<color=blue>Ghép [Chân nguyên] Oanh Oanh<color>", self.ChanNguyenOO, self},
		{"<color=blue>Ghép [Chân nguyên] Mộc Siêu<color>", self.ChanNguyenMS, self},
		{"<color=blue>Ghép [Chân nguyên] Tử Uyển<color>", self.ChanNguyenTU, self},
		{"<color=blue>Ghép [Chân nguyên] Tần Trọng<color>", self.ChanNguyenTT, self},
		{"<color=red>Đổi Mảnh [Chân nguyên] Thành Chân Nguyên TLĐ <color>", self.ChangeCNTLD, self},
		{"Kết Thúc Đối Thoại."},
		};
		Dialog:Say(szMsg, tbOpt);
end

function npcghep:congthucghepCN()

local szMsg = "<color=yellow>Công Thức Nâng Cấp Thành Chân Nguyên : <color>\n\n"..
"<color=green>Mỗi Loại Chân Nguyên<color> = 200 MG Chân Nguyên Cùng Loại + 200 Vạn Đồng + 30k THL + 1 HT 10(Khóa)\n\n"..
"<color=blue>Sau Khi Nâng Cấp Thành Công Người Chơi Dùng Chân Nguyên Tu Luyện Đơn Để Tăng Thuộc Tính Của Chân Nguyên<color>\n\n"..
"<color=red>Mỗi Kích Chuột Tăng Thuộc Tính Sẽ Mất 1 Vạn Đồng<color>\n\n"
local tbOpt = {
{"Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:ChangeCNTLD()
local szMsg = "<color=yellow>Công Thức Đổi Mảnh Chân Nguyên : <color>\n\n"..
"<color=green>100 Mảnh Chân Nguyên Cùng Loại<color> + 50 Vạn Đồng = 30 Chân Nguyên TLĐ\n\n"
	local tbOpt = {
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Diệp Tịnh<color>", self.ChangeChanNguyenDT, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Bảo Ngọc<color>", self.ChangeChanNguyenBN, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Hạ Tiểu Sảnh<color>", self.ChangeChanNguyenHTS, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Oanh Oanh<color>", self.ChangeChanNguyenOO, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Mộc Siêu<color>", self.ChangeChanNguyenMS, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Tử Uyển<color>", self.ChangeChanNguyenTU, self},
		{"<color=blue>Đổi 100 Mảnh [Chân nguyên] Tần Trọng<color>", self.ChangeChanNguyenTT, self},
		{"Kết Thúc Đối Thoại."},
		};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:ChangeChanNguyenDT()
	local tbItemId1 = {18,1,20365,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20365,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenBN()
	local tbItemId1 = {18,1,20366,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20366,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenHTS()
	local tbItemId1 = {18,1,20367,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20367,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenOO()
	local tbItemId1 = {18,1,20368,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20368,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenMS()
	local tbItemId1 = {18,1,20369,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20369,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenTT()
	local tbItemId1 = {18,1,20371,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20371,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChangeChanNguyenTU()
	local tbItemId1 = {18,1,20370,1,0,0}; -- dtv
	--local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20370,1);
	--local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>50 Vạn Đồng<color>");
  return 0; 
	end
	-- local diemtl = me.dwCurGTP;
	-- local diemhl = me.dwCurMKP;
	-- if diemhl < 30000 or diemtl < 30000 then
	-- Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  -- return 0; 
	-- end
	if nCount1 >= 100 then
		Task:DelItem(me, tbItemId1, 100);
		--Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-500000);
		-- me.ChangeCurMakePoint(-30000);
		-- me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		me.AddStackItem(18,1,20342,1,nil,30);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 30 <color=yellow>Chân nguyên TLĐ<color> ");
		-- local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		-- KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenDT()
	local tbItemId1 = {18,1,20365,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20365,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,1,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Diệp Tịnh<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Diệp Tịnh<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenBN()
	local tbItemId1 = {18,1,20366,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20366,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,2,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Bảo Ngọc<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Bảo Ngọc<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenHTS()
	local tbItemId1 = {18,1,20367,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20367,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,3,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Hạ Tiểu Sảnh<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Hạ Tiểu Sảnh<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenOO()
	local tbItemId1 = {18,1,20368,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20368,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,4,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Oanh Oanh<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Oanh Oanh<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenMS()
	local tbItemId1 = {18,1,20369,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20369,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,5,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Mộc Siêu<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Mộc Siêu<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenTU()
	local tbItemId1 = {18,1,20370,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20370,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,6,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Tử Uyển<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Tử Uyển<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:ChanNguyenTT()
	local tbItemId1 = {18,1,20371,1,0,0}; -- dtv
	local tbItemId2 = {18,1,114,10,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(18,1,20371,1);
	local nCount2 = me.GetItemCountInBags(18,1,114,10);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 200 and nCount2 >= 1 then
		Task:DelItem(me, tbItemId1, 200);
		Task:DelItem(me, tbItemId2, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,24,7,1);
		-------------------------------------
		Dialog:Say("Chúc mừng bạn nhận được 1 <color=yellow>[Chân nguyên] Tần Trọng<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>[Chân nguyên] Tần Trọng<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say("Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

--------------------------Tinh Thạch---------------------------
function npcghep:changeStone()
	local szMsg = "Đây là chức năng Ghép <color=yellow>Tinh Thạch Ngoại Trang<color>Vui lòng lựa chọn loại Tinh Thạch muốn nâng cấp\n\n"..
	"<color=blue>Sau Khi Nâng Cấp Thành Công Người Chơi Dùng Tinh Thạch Để Nâng Cấp Ngoại Trang Mình Đang Mang!!!<color>\n\n"..
	"<color=red>Khi Ghép Sẽ Mất 1 Vạn Đồng/Vật Phẩm<color>\n\n"..
	"Ghép Thành 1 Tinh Thạch =1 Vạn Đồng\n\n"..
	"Ghép Thành 2 Tinh Thạch =2 Vạn Đồng\n\n"..
	"=> Cứ Thế Tính Lên nhé !!!\n\n"
	local tbOpt = {
		{"<color=green>Tinh Thạch Ảnh Nguyệt (cấp 2)<color>", self.changestone2, self},
		{"<color=blue>Tinh Thạch Đoạn Hải (cấp 3)<color>", self.changestone3, self},
		{"<color=red>Tinh Thạch Thánh Hỏa (cấp 4)<color>", self.changestone4, self},
		{"Kết Thúc Đối Thoại."},
		};
		Dialog:Say(szMsg, tbOpt);
end

function npcghep:changestone2()
	 local tbNpc = Npc:GetClass("changestone2");
	 tbNpc:OnDialog_1();
end;

function npcghep:changestone3()
	 local tbNpc = Npc:GetClass("changestone3");
	 tbNpc:OnDialog_1();
end;

function npcghep:changestone4()
	 local tbNpc = Npc:GetClass("changestone4");
	 tbNpc:OnDialog_1();
end;

--------------------------Thanh Long Ấn---------------------------
function npcghep:HLA()
	local szMsg = "Đây là chức năng Nâng Cấp <color=yellow>Thanh Long Ấn<color>Vui lòng lựa chọn loại Ấn muốn nâng cấp";
	local tbOpt = {
		{"<color=yellow>Công Thức Ghép Ấn<color>", self.congthucghepan, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn <color>", self.antl, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +1<color>", self.an1, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +2<color>", self.an2, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +3<color>", self.an3, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +4<color>", self.an4, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +5<color>", self.an5, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +6<color>", self.an6, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +7<color>", self.an7, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +8<color>", self.an8, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +9<color>", self.an9, self},
		{"<color=yellow>Nâng Cấp Thành<color> <color=green>Thanh Long Ấn +10<color>", self.an10, self},
		{"Kết Thúc Đối Thoại."},
	};
	Dialog:Say(szMsg, tbOpt);
	
end

function npcghep:congthucghepan()

local szMsg = "<color=yellow>Công Thức Nâng Cấp Thành : <color>\n\n"..
"<color=green>Thanh Long Ấn <color> = <color=red>Ngũ Hành Ấn Max<color> + 100 Mảnh Ấn + 500 Vạn Đồng + 5 Vạn NHHT + 1 HT 10(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 1 <color> = <color=red>Thanh Long Ấn<color> + 100 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 2 <color> = <color=red>Thanh Long Ấn + 1<color> + 100 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 3 <color> = <color=red>Thanh Long Ấn + 2<color> + 100 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 4 <color> = <color=red>Thanh Long Ấn + 3<color> + 100 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 5 <color> = <color=red>Thanh Long Ấn + 4<color> + 300 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"
local tbOpt = {
{"Xem Tiếp", self.xemtiepghepan, self},
{"Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:xemtiepghepan()

local szMsg = 
"<color=green>Thanh Long Ấn + 6 <color> = <color=red>Thanh Long Ấn +5<color> + 300 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 7 <color> = <color=red>Thanh Long Ấn +6<color> + 300 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 8 <color> = <color=red>Thanh Long Ấn +7<color> + 500 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 9 <color> = <color=red>Thanh Long Ấn +8<color> + 500 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"..
"<color=green>Thanh Long Ấn + 10 <color> = <color=red>Thanh Long Ấn +9<color> + 500 MG Ấn + 200 Vạn Đồng + 30k THL + 1 Vạn NHHT + 1 HT 9(Khóa)\n\n"
local tbOpt = {
--{"Xem Tiếp <color=Green1>Ghép Mặt Nạ", self.xemtiepghepan, self},
{"Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:antl()
local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
local szMsg ="Trang bị Ngũ Hành Ấn lên F1 trước khi tiến hành tăng cấp";	
	Dialog:Say(szMsg)
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Ngũ Hành Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
  if pSignet then
    if pSignet.szName ~= "Ngũ Hành Ấn" then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Ngũ Hành Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	end
	
	local nLevel1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);	
	local nLevel2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
	if nLevel1 < 1000 and nLevel2 < 1000 then
	Dialog:Say(" Trang bị <color=yellow>Ngũ Hành Ấn<color> chưa đủ điều kiện nên không thể tăng cấp!!!");
	return 0;
	end
	
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>500 Vạn Đồng<color>");
  return 0; 
	end
	if nLevel1 >= 1000 and nLevel2 >= 1000 then
		local tbItemId1 = {18,1,20364,1,0,0}; -- an 1
		local tbItemId2 = {18,1,205,1,0,0};
		local tbItemId3 = {18,1,114,10,0,0};		-- ht10
		local nCount1 = me.GetItemCountInBags(18,1,20364,1);
		local nCount2 = me.GetItemCountInBags(18,1,205,1);
		local nCount3 = me.GetItemCountInBags(18,1,114,10);
		if nCount2 >= 50000 and nCount1 >= 100 and nCount3 >= 1 then
		-- me.DelItem(me, pSignet, 1);
		Task:DelItem(me, tbItemId2, 50000);
		Task:DelItem(me, tbItemId1, 100);
		Task:DelItem(me, tbItemId3, 1);
		me.DelItem(pSignet);
		me.AddJbCoin(-5000000);
		-------------------------------------
		local pSignet1 = me.AddItem(1,16,14,10);
		Dialog:Say("Thăng cấp thành công.");
		-------------------------------------
		-- if not pSignet1 then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		Item:SetSignetMagic(pSignet1, 1, nLevel1, 0);
		Item:SetSignetMagic(pSignet1, 2, nLevel2, 0);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
		---------------------------------------------------	
		else
			Dialog:Say("Không Đủ Nguyên Liệu.");
			return 0;
		end
	else
		Dialog.Say("Ngũ Hành Ấn Chưa Đủ Điều Kiện");
	end

end
function npcghep:an1()
	local tbItemId1 = {1,16,14,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,9,0,0};		-- ht9
	local nCount1 = me.GetItemCountInBags(1,16,14,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 100 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,15,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1050;
		if nLevelDong1 > 1050 then
			nLevelDong1 = 1050;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1050;
		if nLevelDong2 > 1050 then
			nLevelDong2 = 1050;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +1<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +1<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow> Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an2()
	local tbItemId1 = {1,16,15,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,1,0,0};
	local nCount1 = me.GetItemCountInBags(1,16,15,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 100 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,16,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1100;
		if nLevelDong1 > 1100 then
			nLevelDong1 = 1100;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1100;
		if nLevelDong2 > 1100 then
			nLevelDong2 = 1100;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +2<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +2<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an3()
	local tbItemId1 = {1,16,16,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0};
	local tbItemId4 = {18,1,114,9,0,0};	-- dtv
	local nCount1 = me.GetItemCountInBags(1,16,16,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 100 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,17,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1150;
		if nLevelDong1 > 1150 then
			nLevelDong1 = 1150;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1150;
		if nLevelDong2 > 1150 then
			nLevelDong2 = 1150;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +3<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +3<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end
function npcghep:an4()
	local tbItemId1 = {1,16,17,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,16,17,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
	Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 100 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,18,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1200;
		if nLevelDong1 > 1200 then
			nLevelDong1 = 1200;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1200;
		if nLevelDong2 > 1200 then
			nLevelDong2 = 1200;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +4<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +4<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an5()
	local tbItemId1 = {1,16,18,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0};
	local tbItemId4 = {18,1,114,9,0,0};	-- dtv
	local nCount1 = me.GetItemCountInBags(1,16,18,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 300 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,19,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1250;
		if nLevelDong1 > 1250 then
			nLevelDong1 = 1250;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1250;
		if nLevelDong2 > 1250 then
			nLevelDong2 = 1250;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +5<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +5<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an6()
	local tbItemId1 = {1,16,19,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0};
	local tbItemId4 = {18,1,114,9,0,0};	-- dtv
	local nCount1 = me.GetItemCountInBags(1,16,19,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 300 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,20,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1300;
		if nLevelDong1 > 1300 then
			nLevelDong1 = 1300;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1300;
		if nLevelDong2 > 1300 then
			nLevelDong2 = 1300;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +6<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +6<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an7()
	local tbItemId1 = {1,16,20,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; 
	local tbItemId4 = {18,1,114,9,0,0};-- dtv
	local nCount1 = me.GetItemCountInBags(1,16,20,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 300 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,21,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1350;
		if nLevelDong1 > 1350 then
			nLevelDong1 = 1350;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1350;
		if nLevelDong2 > 1350 then
			nLevelDong2 = 1350;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +7<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +7<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an8()
	local tbItemId1 = {1,16,21,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,16,21,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 500 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,22,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1400;
		if nLevelDong1 > 1400 then
			nLevelDong1 = 1400;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1400;
		if nLevelDong2 > 1400 then
			nLevelDong2 = 1400;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +8<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +8<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);


	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an9()
	local tbItemId1 = {1,16,22,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,16,22,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 500 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,23,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1450;
		if nLevelDong1 > 1450 then
			nLevelDong1 = 1450;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1450;
		if nLevelDong2 > 1450 then
			nLevelDong2 = 1450;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +9<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +9<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);

	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

function npcghep:an10()
	local tbItemId1 = {1,16,23,10,0,0}; -- an 1
	local tbItemId2 = {18,1,20364,1,0,0}; -- dtv
	local tbItemId3 = {18,1,205,1,0,0}; -- dtv
	local tbItemId4 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,16,23,10);
	local nCount2 = me.GetItemCountInBags(18,1,20364,1);
	local nCount3 = me.GetItemCountInBags(18,1,205,1);
	local nCount4 = me.GetItemCountInBags(18,1,114,9);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 2000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>200 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	if nCount1 >= 1 and nCount2 >= 500 and nCount3 >= 10000 and nCount4 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 10000);
		Task:DelItem(me, tbItemId4, 1);
		me.AddJbCoin(-2000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		-------------------------------------
		local pSignet = me.AddItem(1,16,24,10);
		-------------------------------------
		-- if not pSignet then
			-- Dialog:Say("Thăng cấp thành công.");
			-- return 0;
		-- end
		local nLevelDong1 	= pSignet.GetGenInfo(1 * 2 - 1, 0);
		local nLevelDong2 	= pSignet.GetGenInfo(2 * 2 - 1, 0);
		-- if nLevelDong1 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 1.");
			-- return 0;
		-- end
		nLevelDong1 = nLevelDong1 + 1500;
		if nLevelDong1 > 1500 then
			nLevelDong1 = 1500;
		end
		Item:SetSignetMagic(pSignet, 1, nLevelDong1, 0);
	-------
		-- if nLevelDong2 >= 1000 then
			-- Dialog:Say("Ấn đã thăng cấp tối đa dòng 2.");
			-- return 0;
		-- end
		nLevelDong2 = nLevelDong2 + 1500;
		if nLevelDong2 > 1500 then
			nLevelDong2 = 1500;
		end
		Item:SetSignetMagic(pSignet, 2, nLevelDong2, 0);
		---------------------------------------------------
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Thanh Long Ấn +10<color> ");
		local szMsg = string.format("Người chơi <color=green>"..me.szName.."<color> nâng cấp thành công <color=red>Thanh Long Ấn +10<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);

	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu <color> hãy đến tìm ta .");
	end
end

--------------------------Huy Chương---------------------------

function npcghep:HuyChuong()
	local szMsg = "Đây là chức năng Nâng Cấp <color=yellow>Huy Chương<color> Vui lòng lựa chọn loại Huy Chương muốn nâng cấp";
	local tbOpt = {
		{"<color=yellow>Công Thức Ghép Huy Chương<color>", self.congthucghephuychuong, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương <color>", self.hclh, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +1<color>", self.hclh1, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +2<color>", self.hclh2, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +3<color>", self.hclh3, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +4<color>", self.hclh4, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +5<color>", self.hclh5, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +6<color>", self.hclh6, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +7<color>", self.hclh7, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +8<color>", self.hclh8, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +9<color>", self.hclh9, self},
		{"<color=yellow>Nâng Cấp Lên<color> <color=green>Huy Chương +10<color>", self.hclh10, self},
		{"Kết Thúc Đối Thoại."},
	};
	Dialog:Say(szMsg, tbOpt);
	
end

function npcghep:congthucghephuychuong()

local szMsg = "<color=yellow>Công Thức Nâng Cấp Thành : <color>\n\n"..
"<color=green>Huy Chương <color> = 100 MG Huy Chương + 100 Vạn Đồng + 20k THL + 1 HT 9(Khóa)\n\n"..
"<color=green>Huy Chương + 1 <color> = <color=red>Huy Chương <color> + 100 MG Huy Chương + 100 Vạn Đồng + 20k THL + 1 HT 9(Khóa)\n\n"..
"<color=green>Huy Chương + 2 <color> = <color=red>Huy Chương +1<color> + 100 MG Huy Chương + 100 Vạn Đồng + 20k THL + 1 HT 9(Khóa)\n\n"..
"<color=green>Huy Chương + 3 <color> = <color=red>Huy Chương +2<color> + 100 MG Huy Chương + 100 Vạn Đồng + 20k THL + 1 HT 9(Khóa)\n\n"..
"<color=green>Huy Chương + 4 <color> = <color=red>Huy Chương +3<color> + 300 MG Huy Chương + 300 Vạn Đồng + 20k THL + 1 HT 10(Khóa)\n\n"..
"<color=green>Huy Chương + 5 <color> = <color=red>Huy Chương +4<color> + 300 MG Huy Chương + 300 Vạn Đồng + 20k THL + 1 HT 10(Khóa)\n\n"
local tbOpt = {
{"Xem Tiếp", self.xemtiepghephc, self},
{"Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:xemtiepghephc()

local szMsg = 
"<color=green>Huy Chương + 6 <color> = <color=red>Huy Chương +5<color> + 300 MG Huy Chương + 300 Vạn Đồng + 20k THL + 1 HT 10(Khóa)\n\n"..
"<color=green>Huy Chương + 7 <color> = <color=red>Huy Chương +6<color> + 500 MG Huy Chương + 500 Vạn Đồng + 20k THL + 1 HT 11(Khóa)\n\n"..
"<color=green>Huy Chương + 8 <color> = <color=red>Huy Chương +7<color> + 500 MG Huy Chương + 500 Vạn Đồng + 20k THL + 1 HT 11(Khóa)\n\n"..
"<color=green>Huy Chương + 9 <color> = <color=red>Huy Chương +8<color> + 500 MG Huy Chương + 500 Vạn Đồng + 20k THL + 1 HT 11(Khóa)\n\n"..
"<color=green>Huy Chương + 10 <color> = <color=red>Huy Chương +9<color> + 1000 MG Huy Chương + 1000 Vạn Đồng + 30k THL + 1 HT 12(Khóa)\n\n"
local tbOpt = {
--{"Xem Tiếp <color=Green1>Ghép Mặt Nạ", self.xemtiepghepan, self},
{"Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end

function npcghep:hclh()
local nMyCoin = me.nCoin;
	if (nMyCoin < 1000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>100 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	--local tbItemId1 = {1,15,12,10,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,9,0,0};
	--local nCount1 = me.GetItemCountInBags(1,15,12,10);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,9);
	if nCount2 >= 100 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-1000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,6,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương <color> ");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương <color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh1()
local nMyCoin = me.nCoin;
	if (nMyCoin < 1000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>100 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,6,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,6,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,9);
	if nCount1 >=1 and nCount2 >= 100 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-1000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,7,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 1<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +1<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh2()
local nMyCoin = me.nCoin;
	if (nMyCoin < 1000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>100 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,7,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,7,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,9);
	if nCount1 >=1 and nCount2 >= 100 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-1000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,8,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 2<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +2<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh3()
local nMyCoin = me.nCoin;
	if (nMyCoin < 1000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>100 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,8,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,9,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,8,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,9);
	if nCount1 >=1 and nCount2 >= 100 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 100);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-1000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,9,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 3<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +3<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh4()
local nMyCoin = me.nCoin;
	if (nMyCoin < 3000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>300 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,9,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,10,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,9,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,10);
	if nCount1 >=1 and nCount2 >= 300 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-3000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,10,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 4<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +4<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh5()
local nMyCoin = me.nCoin;
	if (nMyCoin < 3000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>300 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,10,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,10,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,10,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,10);
	if nCount1 >=1 and nCount2 >= 300 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-3000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,11,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 5<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +5<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh6()
local nMyCoin = me.nCoin;
	if (nMyCoin < 3000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>300 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,11,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,10,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,11,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,10);
	if nCount1 >=1 and nCount2 >= 300 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 300);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-3000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,12,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 6<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +6<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh7()
local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>500 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,12,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,11,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,12,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,11);
	if nCount1 >=1 and nCount2 >= 500 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-5000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,13,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 7<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +7<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh8()
local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>500 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,13,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,11,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,13,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,11);
	if nCount1 >=1 and nCount2 >= 500 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-5000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,14,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 8<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +8<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh9()
local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>500 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 20000 or diemtl < 20000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>20000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,14,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,11,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,14,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,11);
	if nCount1 >=1 and nCount2 >= 500 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 500);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-5000000);
		me.ChangeCurMakePoint(-20000);
		me.ChangeCurGatherPoint(-20000);
		me.AddItem(1,27,15,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 9<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +9<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:hclh10()
local nMyCoin = me.nCoin;
	if (nMyCoin < 10000000) then
		me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>1000 Vạn Đồng<color>");
  return 0; 
	end
	local diemtl = me.dwCurGTP;
	local diemhl = me.dwCurMKP;
	if diemhl < 30000 or diemtl < 30000 then
		Dialog:Say("<color=yellow>Bạn Không Đủ <color><color=red>30000 THL<color>");
  return 0; 
	end
	local tbItemId1 = {1,27,15,1,0,0}; -- mat na 1
	local tbItemId2 = {18,1,20373,1,0,0}; -- dtv
	local tbItemId3 = {18,1,114,12,0,0};
	local nCount1 = me.GetItemCountInBags(1,27,15,1);
	local nCount2 = me.GetItemCountInBags(18,1,20373,1);
	local nCount3 = me.GetItemCountInBags(18,1,114,12);
	if nCount1 >=1 and nCount2 >= 1000 and nCount3 >= 1 then
		Task:DelItem(me, tbItemId1, 1);
		Task:DelItem(me, tbItemId2, 1000);
		Task:DelItem(me, tbItemId3, 1);
		me.AddJbCoin(-10000000);
		me.ChangeCurMakePoint(-30000);
		me.ChangeCurGatherPoint(-30000);
		me.AddItem(1,27,16,1);
		Dialog:Say(" Chúc mừng bạn nhận được 1 <color=yellow>Huy Chương + 10<color>");
		local szMsg = string.format("Người chơi <color=blue>"..me.szName.."<color> nâng cấp thành công <color=red>Huy Chương +10<color> thật bá đạo !");
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
	else
		Dialog:Say(" Khi nào đủ <color=yellow>Nguyên Liệu<color> hãy đến tìm ta .");
	end
end

function npcghep:CheckPermission(tbOption)
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
		return;
	end
	Lib:CallBack(tbOption);
end