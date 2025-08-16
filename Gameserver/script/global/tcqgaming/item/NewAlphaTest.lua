-- date:24/07/2018
-- by:iDoctor
-------------------------------------------------------
local tbNewTest ={};
SpecialEvent.NewTest= tbNewTest;

function tbNewTest:OnDialog()
	local szMsg = "<color=yellow>Thử nghiệm Alphatest<color>";
	local tbOpt = 
	{
		 {"<color=pink>Trang Sau<color>", self.testtrangsau,self},
		{"<color=yellow>Nhận Test Full Nhanh 1 Click<color>",self.testfull_1click, self};
		{"<color=yellow>Nhận Mốc Nạp Test Thử Nghiệm<color>",self.nhantestmocnap, self};
		{"<color=yellow>Danh Vọng<color>",self.OnDialog_AddRepute, self};
		{"<color=yellow>Nhận Quan Hàm Và Quan Ấn<color>",self.lsQuanHamQuanAn, self};
		{"<color=yellow>Nhận Vũ khí +16<color>",self.vukhitest, self};
		{"<color=yellow>Bộ Cường Hóa +16" , self.DoCuoi16, self};
		-- {"<color=yellow>Lãnh Long Hồn Rồng Và Trứng Rồng" , self.longhon, self};
		-- {"<color=yellow>Liên Quan Đồng Hành" , self.Donghanh, self};
		{"<color=yellow>Liên Quan Chân Nguyên" , self.sachchannguyen, self};
		-- {"<color=yellow>Nhận Huy Chương" , self.nhanhuychuong, self};
		{"<color=yellow>Nhận Ngựa Mốc  Và Mặt Nạ Mốc Tối Đa" , self.nhanthutcq, self};
	    {"Túi 24 ô" , self.tui24o, self};
	    {"Danh Bộ Lệnh" , self.DBL9k, self};
	    {"Vỏ Sò Vàng" , self.RVSV, self};
		--{"Phi phong Sồ Phượng",self.PhiPhong7,self};
		{"<color=yellow>Nhận Phi phong Vô Song<color>",self.PhiPhong10,self};
		{"<color=yellow>Nhận Danh Hiệu Vô Song<color>",self.nhandanhhieuvosong,self};
		{"<color=yellow>Tăng max Ngũ Hành Ấn<color>",self.CuongHoaAn,self};
		{"<color=yellow>Lấy 10 lần chuyển cường hóa<color>",self.laychuyench,self};
		--{"Nhận Mã Bài",self.nhanxichtho,self};
		{"Bạc - Đồng",self.tiente,self};
		{"Tinh Hoạt Lực",self.THLTest,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbNewTest:testfull_1click()
if me.nFaction == 0 then
Dialog:Say("<color=yellow>Chưa gia nhập môn phái không thể nhận<color>")
return 
end
if me.nRouteId == 0 then
Dialog:Say("Chưa chọn hệ phái")
return
end

local SoCapHuyChuong = me.GetSkillLevel(1992)	
if SoCapHuyChuong == 40 then 
Dialog:Say("Huy Chương đã đạt cấp 40 rồi không thể nhận nữa");
return 0;
end 



	local pSignet = me.GetItem(Item.ROOM_EQUIP, Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Ngũ Hành Ấn<color> lên người, không thể tăng cấp");
		return 0;
	end
	
		-- Lấy cấp hiện tại
	local nLevelCuong = pSignet.GetGenInfo(1 * 2 - 1, 0); -- Cường
	local nLevelNhuoc = pSignet.GetGenInfo(2 * 2 - 1, 0); -- Nhược

	-- Nếu 1 trong 2 đã max 1000 thì không được nhận
	if nLevelCuong >= 1000 or nLevelNhuoc >= 1000 then
		Dialog:Say("Ngũ Hành Ấn đã có 1 chỉ số đạt tối đa 1000, không thể nhận thêm.");
		return
	end
	
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_MAIN);
	if not pItem then
		me.Msg("Ngươi không trang bị Chân Nguyên. Vui lòng trang bị trước khi Tu Luyện");
		return 0;
	end
-----========NÂNG CHÂN NGUYÊN================
	-- Lấy cấp từng dòng
	local nLevel1 = pItem.GetGenInfo(1 * 2 - 1, 0);
	local nLevel2 = pItem.GetGenInfo(2 * 2 - 1, 0);
	local nLevel3 = pItem.GetGenInfo(3 * 2 - 1, 0);
	local nLevel4 = pItem.GetGenInfo(4 * 2 - 1, 0);

	-- Nếu 1 trong 4 dòng đã max thì không được nhận
	if nLevel1 >= 100490 or nLevel2 >= 100490 or nLevel3 >= 100490 or nLevel4 >= 100490 then
		Dialog:Say("Chân nguyên đã có ít nhất 1 dòng đạt tối đa, không thể tu luyện full.");
		return 0;
	end

me.AddFightSkill(1992, 40);---Huy Chuong
me.Msg("Bạn đã nhận được huy chương cấp bậc 40")

	-- Nâng cấp cả 4 dòng
	Item:UpgradeZhenYuanNoItem(pItem, 100490, 1);
	Item:UpgradeZhenYuanNoItem(pItem, 100490, 2);
	Item:UpgradeZhenYuanNoItem(pItem, 100490, 3);
	Item:UpgradeZhenYuanNoItem(pItem, 100490, 4);
	------------ END NÂNG CHÂN NGUYÊN
	--======Nâng ấn ngũ hành===========
	-- Cường
	Item:SetSignetMagic(pSignet, 1, 1000, 0);
	-- Nhược
	Item:SetSignetMagic(pSignet, 2, 1000, 0);
		--======END Nâng ấn ngũ hành===========
		me.AddStackItem(1,12,20547,10,{bForceBind=1},1) -- ngựa
	 	me.AddStackItem(1,13,187,10,{bForceBind=1},1)---Mặt nạ cực phẩm
		me.AddStackItem(18,1,191,1,nil,5);
me.AddStackItem(18,1,191,2,nil,5);
me.AddStackItem(18,1,192,1,nil,5);
me.AddStackItem(18,1,192,2,nil,5);
	me.SetHonorLevel(10);
		me.AddTitle(10, 2, 8, 8)
		local nHe = me.nFaction
		if nHe == 1 or  nHe == 2 then
self:QuanAnKim8();
		elseif  nHe == 3 or nHe == 4 or nHe == 11 then 
self:QuanAnMoc8();

		elseif  nHe == 5 or nHe == 6 or nHe == 12 then 
self:QuanAnThuy8();
		elseif  nHe == 7 or nHe == 8 then 
self:QuanAnHoa8();
		elseif  nHe == 9 or nHe == 10 then 
self:QuanAnTho8();
		end 

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nam
		me.AddItem(1,17,1,10,1);-- vô song nam kim
self:KimNgoai16()
        local item10 = me.AddItem(2,1,1337,10,1,16);
        item10.Bind(1);
			end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
		me.AddItem(1,17,2,10,1);-- vô song nữ kim
self:KimNgoai161()
        local item10 = me.AddItem(2,1,1337,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
				me.AddItem(1,17,1,10,1);-- vô song nam kim
self:KimNgoai16()
        local item10 = me.AddItem(2,1,1338,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
				me.AddItem(1,17,2,10,1);-- vô song nữ kim
self:KimNgoai161()
        local item10 = me.AddItem(2,1,1338,10,1,16);
        item10.Bind(1);
		end
		-------------
			if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
				me.AddItem(1,17,1,10,1);-- vô song nam kim
self:KimNgoai16()
        local item10 = me.AddItem(2,1,1335,10,1,16);
        item10.Bind(1);
		end
		    if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
				me.AddItem(1,17,2,10,1);-- vô song nữ kim
self:KimNgoai161()
        local item10 = me.AddItem(2,1,1335,10,1,16);
        item10.Bind(1);
		end
		    if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
				me.AddItem(1,17,1,10,1);-- vô song nam kim
self:KimNgoai16()
        local item10 = me.AddItem(2,1,1336,10,1,16);
        item10.Bind(1);
		end
		    if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
				me.AddItem(1,17,2,10,1);-- vô song nữ kim
self:KimNgoai161()
        local item10 = me.AddItem(2,1,1336,10,1,16);
        item10.Bind(1);
		end
		---------------
			if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
				me.AddItem(1,17,3,10,1);	-- vô song nam mộc
self:KimNgoai16()
        local item10 = me.AddItem(2,2,140,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
				me.AddItem(1,17,4,10,1);	-- vo song nữ Mộc
self:KimNgoai161()
        local item10 = me.AddItem(2,2,140,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
				me.AddItem(1,17,3,10,1);	-- vô song nam mộc
			
self:MocNgoai16()
        local item10 = me.AddItem(2,2,147,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
				me.AddItem(1,17,4,10,1);	-- vo song nữ Mộc
self:MocNgoai16()
        local item10 = me.AddItem(2,2,147,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
				me.AddItem(1,17,3,10,1);	-- vô song nam mộc
self:MocNgoai16()
        local item10 = me.AddItem(2,1,1339,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
				me.AddItem(1,17,4,10,1);	-- vo song nữ Mộc

self:MocNgoai161()
        local item10 = me.AddItem(2,1,1339,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
	me.AddItem(1,17,3,10,1);	-- vô song nam mộc
self:MocNoi16()
        local item10 = me.AddItem(2,1,1340,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
				me.AddItem(1,17,4,10,1);	-- vo song nữ Mộc
self:MocNoi161()
        local item10 = me.AddItem(2,1,1340,10,1,16);
        item10.Bind(1);
        end
			if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
				me.AddItem(1,17,3,10,1);	-- vô song nam mộc
self:MocNoi16()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
				me.AddItem(1,17,4,10,1);	-- vo song nữ Mộc
self:MocNoi161()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- Minh Giáo Chùy Nam
				me.AddItem(1,17,1,10,1);-- vô song nam kim
self:KimNgoai16()
        local item10 = me.AddItem(2,1,1338,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
				me.AddItem(1,17,2,10,1);-- vô song nữ kim
self:KimNgoai161()
        local item10 = me.AddItem(2,1,1338,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
				me.AddItem(1,17,5,10,1);	-- vo song thủy nam
self:ThuyNoi16()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
				me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNoi161()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
				me.AddItem(1,17,5,10,1);	-- vo song thủy nam

self:ThuyNgoai16()
        local item10 = me.AddItem(2,1,1342,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
				me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNgoai161()
        local item10 = me.AddItem(2,1,1342,10,1,16);
        item10.Bind(1);
		end
		if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
			me.AddItem(1,17,5,10,1);	-- vo song thủy nam
self:ThuyNoi16()
        local item10 = me.AddItem(2,1,1343,10,1,16);
        item10.Bind(1);
		end
		if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
			me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNoi161()
        local item10 = me.AddItem(2,1,1343,10,1,16);
        item10.Bind(1);
		end
		if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
			me.AddItem(1,17,5,10,1);	-- vo song thủy nam
self:ThuyNoi16()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
		if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
			me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNoi161()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
				me.AddItem(1,17,5,10,1);	-- vo song thủy nam
self:ThuyNgoai16()
        local item10 = me.AddItem(2,1,1341,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
				me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNgoai161()
        local item10 = me.AddItem(2,1,1341,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
				me.AddItem(1,17,5,10,1);	-- vo song thủy nam
self:ThuyNoi161()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
				me.AddItem(1,17,6,10,1);	-- vo song thuy nu 
self:ThuyNoi161()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
									me.AddItem(1,17,7,10,1);-- vo song he hoa nam	
self:HoaNoi16()
        local item10 = me.AddItem(2,1,1347,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
				me.AddItem(1,17,8,10,1);-- vo song he hoa nu
self:HoaNoi161()
        local item10 = me.AddItem(2,1,1347,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
									me.AddItem(1,17,7,10,1);-- vo song he hoa nam	
self:HoaNgoai16()
        local item10 = me.AddItem(2,1,1345,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
				me.AddItem(1,17,8,10,1);-- vo song he hoa nu
self:HoaNgoai161()
        local item10 = me.AddItem(2,1,1345,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
									me.AddItem(1,17,7,10,1);-- vo song he hoa nam	
self:HoaNoi16()
        local item10 = me.AddItem(2,1,1348,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
				me.AddItem(1,17,8,10,1);-- vo song he hoa nu
self:HoaNoi161()
        local item10 = me.AddItem(2,1,1348,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
						me.AddItem(1,17,7,10,1);-- vo song he hoa nam	
self:HoaNgoai16()
        local item10 = me.AddItem(2,1,1346,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
				me.AddItem(1,17,8,10,1);-- vo song he hoa nu
self:HoaNgoai161()
        local item10 = me.AddItem(2,1,1346,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
				me.AddItem(1,17,9,10,1);	-- vo song he tho nam
self:ThoNoi16()
        local item10 = me.AddItem(2,1,1351,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
				me.AddItem(1,17,10,10,1);	--vo song
self:ThoNoi161()
        local item10 = me.AddItem(2,1,1351,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
				me.AddItem(1,17,9,10,1);	-- vo song he tho nam
self:ThoNgoai16()
        local item10 = me.AddItem(2,1,1351,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
							me.AddItem(1,17,10,10,1);	--vo song
self:ThoNgoai161()
        local item10 = me.AddItem(2,1,1351,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
				me.AddItem(1,17,9,10,1);	-- vo song he tho nam
self:ThoNoi16()
        local item10 = me.AddItem(2,1,1352,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
							me.AddItem(1,17,10,10,1);	--vo song
self:ThoNoi161()
        local item10 = me.AddItem(2,1,1352,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
				me.AddItem(1,17,9,10,1);	-- vo song he tho nam
self:ThoNgoai16()
      local item10 = me.AddItem(2,1,1349,10,1,16);
        item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
							me.AddItem(1,17,10,10,1);	--vo song
self:ThoNgoai161()
      local item10 = me.AddItem(2,1,1349,10,1,16);
        item10.Bind(1);
		end
		
		
end 

function tbNewTest:laychuyench()
	local luotchuyencuonghoa = me.GetTask(3130,1)
	me.SetTask(3130,1, luotchuyencuonghoa + 10);
Dialog:Say("Lấy thành công 10 lần chuyển cường hóa ");
end 
function tbNewTest:nhandanhhieuvosong()
	me.SetHonorLevel(10);
end 
function tbNewTest:nhanhuychuong()

local SoCapHuyChuong = me.GetSkillLevel(1992)	
if SoCapHuyChuong == 60 then 
Dialog:Say("Huy Chương đã đạt cấp 60 rồi");
return 0;
end 
me.AddFightSkill(1992, 60);---Huy Chuong
Dialog:Say("Lãnh thành công Huy Chương Bậc 60 Tối Đa F3 Để Xem Thuộc Tính");
end 

function tbNewTest:nhanthutcq()
me.AddStackItem(1,12,20547,10,{bForceBind=1},1)
	 	me.AddStackItem(1,13,187,10,{bForceBind=1},1)---Mặt nạ cực phẩm
			Dialog:Say("Lãnh thành công");
end

function tbNewTest:sachchannguyen()
	me.AddStackItem(18,1,1333,1,nil, 4); -- Đồng Hành Võ Lâm Đảnh Lễ (10 Kỹ Năng) 
	me.AddStackItem(1,24,1,1,nil, 1); -- Chân Nguyên Diệp Tịnh
	me.AddStackItem(1,24,2,1,nil, 1); -- Chân Nguyên Bảo Ngọc
	me.AddStackItem(1,24,3,1,nil, 1); -- Chân Nguyên Hạ Tiểu Sảnh
	me.AddStackItem(1,24,4,1,nil, 1); -- Chân Nguyên Oanh Oanh
	me.AddStackItem(1,24,5,1,nil, 1); -- Chân Nguyên Mộc Siêu
	me.AddStackItem(1,24,6,1,nil, 1); -- Chân Nguyên Từ Uyển
	me.AddStackItem(1,24,7,1,nil, 1); -- Chân Nguyên Tần Trọng

	end
function tbNewTest:testtrangsau()
	local szMsg = "<color=yellow>Thử nghiệm Alphatest<color>";
	local tbOpt = 
	{
			{"Nhận mật tịch cao",self.MatTichCao, self};	
			{"<color=yellow>Luyện nhanh mật tịch<color>",self.LevelUpBook,self};
			{"Huyền Tinh",self.HuyenTinh,self};
			{"Nhận max kỹ năng sống",self.nangchedomm,self};
			{"Nhận Ngọc trúc hoa mai (tháng)",self.tasong,self};
			{"Ngũ Hành Hồn Thạch",self.nguhanhhonthach1v, self};	
			{"Võ Lâm Mật Tịch-Tẩy Tủy Kinh",self.VLMTMenu,self};
			{"Vạn Vật Quy Nguyên Đơn Lag 10",self.VanVatQuyNguyenDon,self};
			-- {"<color=yellow>Lấy Bản Đồ Vạn Hoa Cốc , Thiên Quỳnh Cung<color>",self.bandovhc,self};
			{"<color=yellow>Tiêu Hủy Đạo Cụ<color>",self.tieuhuydaocu,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbNewTest:nhantestmocnap()
local nCount = me.GetTask(3028,1);
if nCount < 500000 then
me.Msg("<color=yellow>Nhận thành công tích lũy nạp 500.000 Vạn đồng<color>");
me.SetTask(3028,1,nCount + 500000)
else
me.Msg("<color=yellow>Bạn đã có rồi mà<color>");
end
end
---------------------------------------------------------------------------------------------------------------------------------------
function tbNewTest:tieuhuydaocu()
	local pItem1 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_WEAPON, 0);
	local pItem2 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_BODY, 0);
	local pItem3 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_RING, 0);
	local pItem4 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_CUFF, 0);
	local pItem5 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_AMULET, 0);
	local PItems = pItem1 or pItem2 or pItem3 or pItem4 or pItem5;
	if not PItems then
	Dialog:OpenGift("<color=white>Hãy đặt vào vật phẩm muốn tiêu hủy<color>", nil ,{self.OnOpenGiftOk, self});
	return;
	else 
	me.Msg("<color=yellow>Tháo trang bị Pet Ra Bạn Hiền Ơi<color>");
	end
		print(PItems.nGenre, PItems.nDetail, PItems.nParticular, PItems.nLevel);
end
  
function tbNewTest:OnOpenGiftOk(tbGMCardObj)
	for _, pItem in pairs(tbGMCardObj) do
		if me.DelItem(pItem[1]) ~= 1 then
			return 0;
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------
function tbNewTest:up10cap()
	me.AddLevel(50);
end
function tbNewTest:lsQuanHamQuanAn()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan Hàm",self.NhanQuanHam,self};
		{"Nhận Quan Ấn",self.NhanQuanAn,self};
		{"<color=pink>Trở Lại Trước<color>",self.NangCao,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbNewTest:NhanQuanHam()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Quan Hàm Cấp 1",self.quanham1,self};
		{"Quan Hàm Cấp 2",self.quanham2,self};
		{"Quan Hàm Cấp 3",self.quanham3,self};
		{"Quan Hàm Cấp 4",self.quanham4,self};
		{"Quan Hàm Cấp 5",self.quanham5,self};
		{"Quan Hàm Cấp 6",self.quanham6,self};
		{"Quan Hàm Cấp 7",self.quanham7,self};
		{"Quan Hàm Cấp 8",self.quanham8,self};
		{"<color=pink>Trở Lại Trước<color>",self.lsQuanHamQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbNewTest:quanham1()
	me.AddTitle(10, 2, 1, 8)
end

function tbNewTest:quanham2()
	me.AddTitle(10, 2, 2, 8)
end

function tbNewTest:quanham3()
	me.AddTitle(10, 2, 3, 8)
end

function tbNewTest:quanham4()
	me.AddTitle(10, 2, 4, 8)
end

function tbNewTest:quanham5()
	me.AddTitle(10, 2, 5, 8)
end

function tbNewTest:quanham6()
	me.AddTitle(10, 2, 6, 8)
end

function tbNewTest:quanham7()
	me.AddTitle(10, 2, 7, 8)
end

function tbNewTest:quanham8()
	me.AddTitle(10, 2, 8, 8)
end

function tbNewTest:NhanQuanAn()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
	
		{"Nhận Quan ấn Kim",self.QuanAnKim,self};
		{"Nhận Quan ấn Mộc",self.QuanAnMoc,self};
		{"Nhận Quan ấn Thủy",self.QuanAnThuy,self};
		{"Nhận Quan ấn Hỏa",self.QuanAnHoa,self};
		{"Nhận Quan ấn Thổ",self.QuanAnTho,self};
		{"<color=pink>Trở Lại Trước<color>",self.lsQuanHamQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnKim()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan ấn cấp 1",self.QuanAnKim1,self};
		{"Nhận Quan ấn cấp 2",self.QuanAnKim2,self};
		{"Nhận Quan ấn cấp 3",self.QuanAnKim3,self};
		{"Nhận Quan ấn cấp 4",self.QuanAnKim4,self};
		{"Nhận Quan ấn cấp 5",self.QuanAnKim5,self};
		{"Nhận Quan ấn cấp 6",self.QuanAnKim6,self};
		{"Nhận Quan ấn cấp 7",self.QuanAnKim7,self};
		{"Nhận Quan ấn cấp 8",self.QuanAnKim8,self};
		{"<color=pink>Trở Lại Trước<color>",self.NhanQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnKim1()
	me.AddItem(1,18,1,1,1);
end

function tbNewTest:QuanAnKim2()
	me.AddItem(1,18,1,2,1);
end

function tbNewTest:QuanAnKim3()
	me.AddItem(1,18,1,3,1);
end

function tbNewTest:QuanAnKim4()
	me.AddItem(1,18,1,4,1);
end

function tbNewTest:QuanAnKim5()
	me.AddItem(1,18,1,5,1);
end

function tbNewTest:QuanAnKim6()
	me.AddItem(1,18,1,6,1);
end

function tbNewTest:QuanAnKim7()
	me.AddItem(1,18,1,7,1);
end

function tbNewTest:QuanAnKim8()
	me.AddItem(1,18,1,8,1);
end

function tbNewTest:QuanAnMoc()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan ấn cấp 1",self.QuanAnMoc1,self};
		{"Nhận Quan ấn cấp 2",self.QuanAnMoc2,self};
		{"Nhận Quan ấn cấp 3",self.QuanAnMoc3,self};
		{"Nhận Quan ấn cấp 4",self.QuanAnMoc4,self};
		{"Nhận Quan ấn cấp 5",self.QuanAnMoc5,self};
		{"Nhận Quan ấn cấp 6",self.QuanAnMoc6,self};
		{"Nhận Quan ấn cấp 7",self.QuanAnMoc7,self};
		{"Nhận Quan ấn cấp 8",self.QuanAnMoc8,self};
		{"<color=pink>Trở Lại Trước<color>",self.NhanQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnMoc1()
	me.AddItem(1,18,2,1,1);
end

function tbNewTest:QuanAnMoc2()
	me.AddItem(1,18,2,2,1);
end

function tbNewTest:QuanAnMoc3()
	me.AddItem(1,18,2,3,1);
end

function tbNewTest:QuanAnMoc4()
	me.AddItem(1,18,2,4,1);
end

function tbNewTest:QuanAnMoc5()
	me.AddItem(1,18,2,5,1);
end

function tbNewTest:QuanAnMoc6()
	me.AddItem(1,18,2,6,1);
end

function tbNewTest:QuanAnMoc7()
	me.AddItem(1,18,2,7,1);
end

function tbNewTest:QuanAnMoc8()
	me.AddItem(1,18,2,8,1);
end

function tbNewTest:QuanAnThuy()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan ấn cấp 1",self.QuanAnThuy1,self};
		{"Nhận Quan ấn cấp 2",self.QuanAnThuy2,self};
		{"Nhận Quan ấn cấp 3",self.QuanAnThuy3,self};
		{"Nhận Quan ấn cấp 4",self.QuanAnThuy4,self};
		{"Nhận Quan ấn cấp 5",self.QuanAnThuy5,self};
		{"Nhận Quan ấn cấp 6",self.QuanAnThuy6,self};
		{"Nhận Quan ấn cấp 7",self.QuanAnThuy7,self};
		{"Nhận Quan ấn cấp 8",self.QuanAnThuy8,self};
		{"<color=pink>Trở Lại Trước<color>",self.NhanQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnThuy1()
	me.AddItem(1,18,3,1,1);
end

function tbNewTest:QuanAnThuy2()
	me.AddItem(1,18,3,2,1);
end

function tbNewTest:QuanAnThuy3()
	me.AddItem(1,18,3,3,1);
end

function tbNewTest:QuanAnThuy4()
	me.AddItem(1,18,3,4,1);
end

function tbNewTest:QuanAnThuy5()
	me.AddItem(1,18,3,5,1);
end

function tbNewTest:QuanAnThuy6()
	me.AddItem(1,18,3,6,1);
end

function tbNewTest:QuanAnThuy7()
	me.AddItem(1,18,3,7,1);
end

function tbNewTest:QuanAnThuy8()
	me.AddItem(1,18,3,8,1);
end

function tbNewTest:QuanAnHoa()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan ấn cấp 1",self.QuanAnHoa1,self};
		{"Nhận Quan ấn cấp 2",self.QuanAnHoa2,self};
		{"Nhận Quan ấn cấp 3",self.QuanAnHoa3,self};
		{"Nhận Quan ấn cấp 4",self.QuanAnHoa4,self};
		{"Nhận Quan ấn cấp 5",self.QuanAnHoa5,self};
		{"Nhận Quan ấn cấp 6",self.QuanAnHoa6,self};
		{"Nhận Quan ấn cấp 7",self.QuanAnHoa7,self};
		{"Nhận Quan ấn cấp 8",self.QuanAnHoa8,self};
		{"<color=pink>Trở Lại Trước<color>",self.NhanQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnHoa1()
	me.AddItem(1,18,4,1,1);
end

function tbNewTest:QuanAnHoa2()
	me.AddItem(1,18,4,2,1);
end

function tbNewTest:QuanAnHoa3()
	me.AddItem(1,18,4,3,1);
end

function tbNewTest:QuanAnHoa4()
	me.AddItem(1,18,4,4,1);
end

function tbNewTest:QuanAnHoa5()
	me.AddItem(1,18,4,5,1);
end

function tbNewTest:QuanAnHoa6()
	me.AddItem(1,18,4,6,1);
end

function tbNewTest:QuanAnHoa7()
	me.AddItem(1,18,4,7,1);
end

function tbNewTest:QuanAnHoa8()
	me.AddItem(1,18,4,8,1);
end

function tbNewTest:QuanAnTho()
	local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
	local tbOpt = {
		{"Nhận Quan ấn cấp 1",self.QuanAnTho1,self};
		{"Nhận Quan ấn cấp 2",self.QuanAnTho2,self};
		{"Nhận Quan ấn cấp 3",self.QuanAnTho3,self};
		{"Nhận Quan ấn cấp 4",self.QuanAnTho4,self};
		{"Nhận Quan ấn cấp 5",self.QuanAnTho5,self};
		{"Nhận Quan ấn cấp 6",self.QuanAnTho6,self};
		{"Nhận Quan ấn cấp 7",self.QuanAnTho7,self};
		{"Nhận Quan ấn cấp 8",self.QuanAnTho8,self};
		{"<color=pink>Trở Lại Trước<color>",self.NhanQuanAn,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:QuanAnTho1()
	me.AddItem(1,18,5,1,1);
end

function tbNewTest:QuanAnTho2()
	me.AddItem(1,18,5,2,1);
end

function tbNewTest:QuanAnTho3()
	me.AddItem(1,18,5,3,1);
end

function tbNewTest:QuanAnTho4()
	me.AddItem(1,18,5,4,1);
end

function tbNewTest:QuanAnTho5()
	me.AddItem(1,18,5,5,1);
end

function tbNewTest:QuanAnTho6()
	me.AddItem(1,18,5,6,1);
end

function tbNewTest:QuanAnTho7()
	me.AddItem(1,18,5,7,1);
end

function tbNewTest:QuanAnTho8()
	me.AddItem(1,18,5,8,1);
end
function tbNewTest:OnDialog_AddRepute()
local szMsg = "Ta có thể giúp gì cho ngươi";
	local tbOpt = {};
	table.insert(tbOpt, {"Danh Vọng Nhiệm Vụ" , self.OnDialog_Nhiemvu, self});
	table.insert(tbOpt, {"Danh Vọng Tống Kim" , self.OnDialog_Tongkim, self});
	table.insert(tbOpt, {"Danh Vọng Môn Phái" , self.OnDialog_Monphai, self});
	table.insert(tbOpt, {"Danh Vọng Gia Tộc",  self.Giatoc, self});
	table.insert(tbOpt, {"Danh Vọng Hoạt Động",  self.OnDialog_Hoatdong, self});
	table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ",  self.OnDialog_Volam, self});
	table.insert(tbOpt, {"Danh Vọng Võ Lâm Liên Đấu",  self.Liendau, self});
	table.insert(tbOpt, {"Danh Vọng Lãnh Thổ tranh đoạt chiến",  self.Lanhtho, self});
	table.insert(tbOpt, {"Danh Vọng Tần Lăng",  self.Tanlang, self});
	table.insert(tbOpt, {"Danh Vọng Đoàn viên gia tộc",  self.Doanvien, self});
	table.insert(tbOpt, {"Danh Vọng Đại Hội Võ Lâm",  self.Daihoivolam, self});
	table.insert(tbOpt, {"Danh Vọng Liên đấu liên server",  self.Liendauserver, self});
	table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
	Dialog:Say(szMsg, tbOpt);
	end
	function tbNewTest:OnDialog_Nhiemvu()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
		table.insert(tbOpt, {"Danh Vọng Nghĩa Quân" , self.Nghiaquan, self});
		table.insert(tbOpt, {"Danh Vọng Quân Doanh" , self.Quandoanh, self});
		table.insert(tbOpt, {"Danh Vọng Học Tạo đồ" , self.Hoctaodo, self});
		table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
		Dialog:Say(szMsg, tbOpt);
end
function tbNewTest:Nghiaquan()
		me.AddRepute(1,1,30000);
	end

	function tbNewTest:Quandoanh()
		me.AddRepute(1,2,30000);
	end

	function tbNewTest:Hoctaodo()
		me.AddRepute(1,3,30000);
	end

function tbNewTest:OnDialog_Tongkim()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
		table.insert(tbOpt, {"Danh Vọng Dương Châu" , self.Duongchau, self});
		table.insert(tbOpt, {"Danh Vọng Phượng Tường" , self.Phuongtuong, self});
		table.insert(tbOpt, {"Danh Vọng Tương Dương" , self.Tuongduong, self});
		table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
		Dialog:Say(szMsg, tbOpt);
end
function tbNewTest:Duongchau()
		me.AddRepute(2,1,30000);
	end
function tbNewTest:Phuongtuong()
		me.AddRepute(2,2,30000);
	end
function tbNewTest:Tuongduong()
		me.AddRepute(2,3,30000);
	end

function tbNewTest:OnDialog_Monphai()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
		table.insert(tbOpt, {"Danh Vọng Thiếu Lâm" , self.Thieulam, self});
		table.insert(tbOpt, {"Danh Vọng Thiên Vương" , self.Thienvuong, self});
		table.insert(tbOpt, {"Danh Vọng Đường Môn" , self.Duongmon, self});	
		table.insert(tbOpt, {"Danh Vọng Ngũ Độc" , self.Ngudoc, self});
		table.insert(tbOpt, {"Danh Vọng Nga Mi" , self.Ngami, self});
		table.insert(tbOpt, {"Danh Vọng Thúy Yên" , self.Thuyyen, self});
		table.insert(tbOpt, {"Danh Vọng Cái Bang" , self.Caibang, self});
		table.insert(tbOpt, {"Danh Vọng Thiên Nhẫn" , self.Thiennhan, self});
		table.insert(tbOpt, {"Danh Vọng Võ Đang" , self.Vodang, self});
		table.insert(tbOpt, {"Danh Vọng Côn Lôn" , self.Conlon, self});
		table.insert(tbOpt, {"Danh Vọng Minh Giáo" , self.Minhgiao, self});
		table.insert(tbOpt, {"Danh Vọng Đại Lý Đoàn thị" , self.Doanthi, self});
		table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
		Dialog:Say(szMsg, tbOpt);
end
function tbNewTest:Thieulam()
		me.AddRepute(3,1,30000);
	end

	function tbNewTest:ThienVuong()
		me.AddRepute(3,2,30000);
	end

	function tbNewTest:Duongmon()
		me.AddRepute(3,3,30000);
	end

	function tbNewTest:Ngudoc()
		me.AddRepute(3,4,30000);
	end

	function tbNewTest:Ngami()
		me.AddRepute(3,5,30000);
	end

	function tbNewTest:Thuyyen()
		me.AddRepute(3,6,30000);
	end

	function tbNewTest:Caibang()
		me.AddRepute(3,7,30000);
	end

	function tbNewTest:Thiennhan()
		me.AddRepute(3,8,30000);
	end

	function tbNewTest:Vodang()
		me.AddRepute(3,9,30000);
	end

	function tbNewTest:Conlon()
		me.AddRepute(3,10,30000);
	end

	function tbNewTest:Minhgiao()
		me.AddRepute(3,11,30000);
	end

	function tbNewTest:Doanthi()
		me.AddRepute(3,12,30000);
	end

function tbNewTest:Giatoc()
		me.AddRepute(4,1,30000);
	end

	function tbNewTest:OnDialog_Hoatdong()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
		table.insert(tbOpt, {"Danh Vọng Bạch Hổ Đường" , self.Bachho, self});
		table.insert(tbOpt, {"Danh Vọng Thịnh Hạ 2008" , self.Thinhha2008, self});
		table.insert(tbOpt, {"Danh Vọng Tiêu Dao Cốc" , self.Tieudaococ, self});
		table.insert(tbOpt, {"Danh Vọng Chúc Phúc" , self.Chucphuc, self});
		table.insert(tbOpt, {"Danh Vọng Thịnh Hạ 2010" , self.Thinhha2010, self});
		table.insert(tbOpt, {"Danh Vọng Di tích Hàn vũ" , self.Ditichhanvu, self});
		table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
		Dialog:Say(szMsg, tbOpt);
end
function tbNewTest:Bachho()
		me.AddRepute(5,1,30000);
	end
	function tbNewTest:Thinhha2008()
		me.AddRepute(5,2,30000);
	end
	function tbNewTest:Tieudaococ()
		me.AddRepute(5,3,30000);
	end
	function tbNewTest:Chucphuc()
		me.AddRepute(5,4,30000);
	end
	function tbNewTest:Thinhha2010()
		me.AddRepute(5,5,30000);
	end
	function tbNewTest:Ditichhanvu()
		me.AddRepute(5,6,30000);
	end
	function tbNewTest:OnDialog_Volam()
local szMsg= "Hãy Lựa chọn";
local tbOpt = {};
		table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Kim)" , self.CaothuKim, self});
		table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Mộc)" , self.CaothuMoc, self});
		table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Thủy)" , self.CaothuThuy, self});
		table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Hỏa)" , self.CaothuHoa, self});
		table.insert(tbOpt, {"Danh Vọng Khiêu Chiến Võ Lâm cao thủ(Thổ)" , self.CaothuTho, self});
		table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
		Dialog:Say(szMsg, tbOpt);
end
	function tbNewTest:CaothuKim()
		me.AddRepute(6,1,30000);
	end
		function tbNewTest:CaothuMoc()
		me.AddRepute(6,1,30000);
	end
		function tbNewTest:CaothuThuy()
		me.AddRepute(6,1,30000);
	end
		function tbNewTest:CaothuHoa()
		me.AddRepute(6,1,30000);
	end
		function tbNewTest:CaothuTho()
		me.AddRepute(6,1,30000);
	end
function tbNewTest:Liendau()
	me.AddRepute(7,1,30000);
	end
function tbNewTest:Lanhtho()
	me.AddRepute(8,1,30000);
	end
	function tbNewTest:Tanlang()
	me.AddRepute(9,1,30000);
	me.AddRepute(9,2,30000);
	end
function tbNewTest:Doanvien()
	me.AddRepute(10,1,30000);
	end
function tbNewTest:Daihoivolam()
	me.AddRepute(11,1,30000);
	end
function tbNewTest:Liendauserver()
	me.AddRepute(12,1,30000);
	end
function tbNewTest:bandovhc()
-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);		
me.AddItem(18,1,186,1)------Bản Thiên Quỳnh Cung
me.AddItem(18,1,245,1)------Bản Đồ Vạn Hoa Cốc
	-- me.AddStackItem(18,1,547,2,nil, 1); --Đồng Năm Mới 6 Skill
	-- me.AddStackItem(18,1,547,3,nil, 1); -- Đồng Hành Võ Lâm Đảnh Lễ (10 Kỹ Năng)
end

function tbNewTest:Donghanh()
	local szMsg = "Hãy chọn lấy thứ ngươi muốn đi :";
	local tbOpt=
	{
		{"<color=yellow>Nhận Trang Bị",self.trangbidh,self},
		{"<color=yellow>Nhận Đồng Hành",self.donghanhne,self},
		{"Nguyên Liệu Trang Bị Đồng Hành",self.nlgdonghanh,self},
		{"Nhận Thiệp lụa",self.Thieplua,self},
		{"Nhận Thiệp bạc",self.Thiepbac,self},
		-- {"Nhận Sách Kinh nghiệm đồng hành",self.Kinhnghiemdonghanh,self},
		{"Nhận Sách Kinh nghiệm đồng hành max",self.Kinhnghiemdonghanh2,self},
		{"Nhận Mật Tịch đồng hành",self.Mattichdonghanh,self},
		{"Nhận Tinh phách",self.Tinhphach,self},
		{"Đồng hành tẩy tủy kinh",self.Donghanhtaytuy,self},
		{"Tiền du long",self.Tiendulong,self},
		{"Bồ đề quả",self.Bodequa,self},
		{"không có gì"},
	};

	Dialog:Say(szMsg,tbOpt);
end
function tbNewTest:donghanhne()
	me.AddStackItem(18,1,666,8,nil, 5); -----6 kỹ năng
	-- me.AddStackItem(18,1,666,3,nil, 5); -----6 kỹ năng
	me.AddStackItem(18,1,547,2,nil, 15); --Đồng Năm Mới 6 Skill
	-- me.AddStackItem(18,1,547,3,nil, 5); -- Đồng Hành Võ Lâm Đảnh Lễ (10 Kỹ Năng)
end
function tbNewTest:nlgdonghanh()
if me.CountFreeBagCell() < 40 then
		Dialog:Say("Phải Có 40 Ô Trống Trong Túi Hành Trang!");
		return 0;
end
 me.AddStackItem(18,1,1876,1,nil,1000); -----Mảnh Vũ Khí
 me.AddStackItem(18,1,1876,2,nil,1000); --- Mảnh Áo
 me.AddStackItem(18,1,1876,3,nil,1000);---- Mảnh Nhẫn
 me.AddStackItem(18,1,1876,4,nil,1000);--Mảnh Uyển 
 me.AddStackItem(18,1,1876,5,nil,1000);
 me.AddStackItem(18,1,1876,6,nil,1000);
 me.AddStackItem(18,1,1876,7,nil,1000);
 me.AddStackItem(18,1,1876,8,nil,1000);
 me.AddStackItem(18,1,1876,9,nil,1000);
 me.AddStackItem(18,1,1876,10,nil,1000);
me.AddStackItem(18,1,190,1,nil,1000);
me.AddStackItem(18,1,1875,1,nil,2000);
me.AddStackItem(18,1,114,10,nil,3);--HT10 khoa
me.AddStackItem(18,1,114,9,nil,3);--HT9 khoa
end
function tbNewTest:trangbidh()
	if me.CountFreeBagCell() < 10 then
	Dialog:Say("Phải Có 10 Ô Trống Trong Túi Hành Trang!");
	return 0;
	end
		----Cấp 1
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
	------Cấp 2
		-- me.AddStackItem(5,19,1,2,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,2,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,2,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,2,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,2,{bForceBind=1},1);	
	-------Cấp 3
		-- me.AddStackItem(5,19,1,3,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,3,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,3,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,3,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,3,{bForceBind=1},1);	
			-------Cấp 4
		-- me.AddStackItem(5,19,1,4,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,4,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,4,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,4,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,4,{bForceBind=1},1);	
			me.AddFightSkill(1982,2);
			me.AddFightSkill(1983,2);
			me.AddFightSkill(1984,2);
			me.AddFightSkill(1985,2);
			me.AddFightSkill(1986,2);
			me.AddFightSkill(1987,2);
			me.AddFightSkill(1988,2);
			me.AddFightSkill(1989,2);
			me.AddFightSkill(1990,2);
			me.AddFightSkill(1991,2);
			Dialog:Say("Bạn đã nhận thành công Trang bị Đồng Hành Cấp 2\n<color=red>Bấm F9 để xem và Kích hoạt bộ trang bị")
end
function tbNewTest:Tiendulong()

for i=1,1000 do
		if me.CountFreeBagCell() > 0 then
			me.AddItem(18,1,553,1);
		else
			break
		end
	end
end
function tbNewTest:Mattichdonghanh()
me.AddItem(18,1,554,4);
me.AddItem(18,1,554,4);
me.AddItem(18,1,554,4);
me.AddItem(18,1,554,4);
me.AddItem(18,1,554,4);
me.AddItem(18,1,554,4);

end
function tbNewTest:Tinhphach()
me.AddItem(18,1,544,1);
me.AddItem(18,1,544,2);
me.AddItem(18,1,544,3);
me.AddItem(18,1,544,4);

end
function tbNewTest:Kinhnghiemdonghanh()
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
me.AddItem(18,1,543,1);
end
function tbNewTest:Kinhnghiemdonghanh2()
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
me.AddItem(18,1,543,2);
end
function tbNewTest:Thieplua()
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
me.AddItem(18,1,541,1);
end
function tbNewTest:Thiepbac()
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
me.AddItem(18,1,541,2);
end
function tbNewTest:Bodequa()
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
me.AddItem(18,1,564,1);
end
function tbNewTest:Donghanhtaytuy()
me.AddItem(18,1,616,1);
me.AddItem(18,1,617,2);
end
function tbNewTest:Nhandonghanh()
me.AddItem(18,1,666,1);
me.AddItem(18,1,666,2);
me.AddItem(18,1,666,3);
me.AddItem(18,1,666,4);
me.AddItem(18,1,666,5);
me.AddItem(18,1,666,6);
me.AddItem(18,1,666,7);
me.AddItem(18,1,666,8);
end
function tbNewTest:longhon()
	if me.CountFreeBagCell() < 10 then
	Dialog:Say("Phải Có 10 Ô Trống Trong Túi Hành Trang!");
	return 0;
	end
	me.AddItem(1,27,1,1).Bind(1);
	me.AddStackItem(18,1,20400,1,nil,1);
end
function tbNewTest:tasong()
	me.AddItem(19,3,1,7);
end

function tbNewTest:nangchedomm()
	local szMsg = "Khi nhận hỗ trợ max kỹ năng sống cần phải <color=cyan>thoát game đăng nhập lại<color> để có hiệu quả";
	local tbOpt = 
	{
	    {"<color=yellow>Ta đã hiểu<color>" , self.nangchedo, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbNewTest:nangchedo()
for i=1,10 do me.SaveLifeSkillLevel(i,120) end
me.Msg(string.format("Đã max toàn bộ kỹ năng sống"));
end

function tbNewTest:nhanxichtho()
	me.AddItem(1,12,100,4).Bind(1); -- xích thố không kháng
end

function tbNewTest:RVSV()
me.AddStackItem(18,1,325,1,nil,1000);
end

function tbNewTest:VLMTMenu()
	local szMsg = "<color=yellow>Xin hãy chọn<color>";

	local tbOpt = 
	{
	    {"Võ Lâm Mật Tịch" , self.VLMT, self};
	    {"Tẩy Tủy Kinh" , self.TTK, self};
		{"Tại hạ chưa cần đến..."},
	}
	
	Dialog:Say(szMsg,tbOpt)
end

function tbNewTest:TTK()
-- me.AddStackItem(18,1,2029,2,nil,15);
me.AddStackItem(18,1,192,1,nil,5);
me.AddStackItem(18,1,192,2,nil,5);
end

function tbNewTest:VLMT()
-- me.AddStackItem(18,1,2029,1,nil,15);
me.AddStackItem(18,1,191,1,nil,5);
me.AddStackItem(18,1,191,2,nil,5);

end


function tbNewTest:VanVatQuyNguyenDon()
    me.AddItem(18,1,384,1);
end

----------------------------------------------------------------------------------
function tbNewTest:HuyenTinh()
	local szMsg = "Hãy chọn lấy thứ mà ngươi muốn :";
	local tbOpt =
	{
		{"Huyền tinh 1",self.HuyenTinh1,self};
		{"Huyền tinh 2",self.HuyenTinh2,self};
		{"Huyền tinh 3",self.HuyenTinh3,self};
		{"Huyền tinh 4",self.HuyenTinh4,self};
		{"Huyền tinh 5",self.HuyenTinh5,self};
		{"Huyền tinh 6",self.HuyenTinh6,self};
		{"Huyền tinh 7",self.HuyenTinh7,self};
		{"Huyền tinh 8",self.HuyenTinh8,self};
		{"Huyền tinh 9",self.HuyenTinh9,self};
		{"Huyền tinh 10",self.HuyenTinh10,self};
		{"Huyền tinh 11",self.HuyenTinh11,self};
		{"Huyền tinh 12",self.HuyenTinh12,self};
	}
	Dialog:Say(szMsg,tbOpt);
end
----------------------------------------------------------------------------------
function tbNewTest:HuyenTinh1()
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
me.AddItem(18,1,1,1);
end

function tbNewTest:HuyenTinh2()
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
me.AddItem(18,1,1,2);
end

function tbNewTest:HuyenTinh3()
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
me.AddItem(18,1,1,3);
end

function tbNewTest:HuyenTinh4()
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
me.AddItem(18,1,1,4);
end

function tbNewTest:HuyenTinh5()
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
me.AddItem(18,1,1,5);
end

function tbNewTest:HuyenTinh6()
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
me.AddItem(18,1,1,6);
end

function tbNewTest:HuyenTinh7()
	me.AddStackItem(18,1,114,7,{bForceBind=1},20)
end

function tbNewTest:HuyenTinh8()
	me.AddStackItem(18,1,114,8,{bForceBind=1},20)
end

function tbNewTest:HuyenTinh9()
	me.AddStackItem(18,1,114,9,{bForceBind=1},20)
end

function tbNewTest:HuyenTinh10()
	me.AddStackItem(18,1,114,10,{bForceBind=1},20)
end

function tbNewTest:HuyenTinh11()
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
me.AddItem(18,1,1,11);
end

function tbNewTest:HuyenTinh12()
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
me.AddItem(18,1,1,12);
end
----------------------------------------------------------------------------------

function tbNewTest:nguhanhhonthach1v()
	local nNeedBag = 2;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu <color=yellow> "..nNeedBag.."<color> ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	me.AddStackItem(18,1,205,1,nil,10000);
end

----------------------------------------------------------------------------------
function tbNewTest:MatTichCao()
	local szMsg = "Chọn môn phái muốn nhận mật tịch cao:";
	local tbOpt = {};
	table.insert(tbOpt , {"Thiếu Lâm",  self.mttl, self});
	table.insert(tbOpt , {"Thiên Vương",  self.mttv, self});
	table.insert(tbOpt , {"Đường môn",  self.mtdm, self});
	table.insert(tbOpt , {"Ngũ Độc",  self.mtnd, self});
	table.insert(tbOpt , {"Minh giáo",  self.mtmg, self});
	table.insert(tbOpt , {"Nga My",  self.mtnm, self});
	table.insert(tbOpt , {"Thúy Yên",  self.mtty, self});
	table.insert(tbOpt , {"Đoàn Thị",  self.mtdt, self});
	table.insert(tbOpt , {"Cái Bang",  self.mtcb, self});
	table.insert(tbOpt , {"Thiên Nhẫn",  self.mttn, self});
	table.insert(tbOpt , {"Võ Đang",  self.mtvd, self});
	table.insert(tbOpt , {"Côn Lôn",  self.mtcl, self});
	table.insert(tbOpt , {"<color=pink>Trở Lại Trước<color>",  self.alphatest, self});
	table.insert(tbOpt, {"Ta chỉ ghé ngang qua"});
	Dialog:Say(szMsg, tbOpt);
end
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
function tbNewTest:mttl()
		me.AddItem(1,14,1,3);
		me.AddItem(1,14,1,3);
		me.AddItem(1,14,1,3);
		me.AddItem(1,14,2,3);
		me.AddItem(1,14,2,3);
		me.AddItem(1,14,2,3);
end

function tbNewTest:mttv()		
		me.AddItem(1,14,3,3);
		me.AddItem(1,14,3,3);
		me.AddItem(1,14,3,3);
		me.AddItem(1,14,4,3);
		me.AddItem(1,14,4,3);
		me.AddItem(1,14,4,3);
end

function tbNewTest:mtdm()
		me.AddItem(1,14,5,3);
		me.AddItem(1,14,5,3);
		me.AddItem(1,14,5,3);
		me.AddItem(1,14,6,3);
		me.AddItem(1,14,6,3);
		me.AddItem(1,14,6,3);
end

function tbNewTest:mtnd()		
		me.AddItem(1,14,7,3);
		me.AddItem(1,14,7,3);
		me.AddItem(1,14,7,3);
		me.AddItem(1,14,8,3);
		me.AddItem(1,14,8,3);
		me.AddItem(1,14,8,3);
end

function tbNewTest:mtmg()		
		me.AddItem(1,14,21,3);
		me.AddItem(1,14,21,3);
		me.AddItem(1,14,21,3);
		me.AddItem(1,14,22,3);
		me.AddItem(1,14,22,3);
		me.AddItem(1,14,22,3);
end

function tbNewTest:mtnm()
		me.AddItem(1,14,9,3);
		me.AddItem(1,14,9,3);
		me.AddItem(1,14,9,3);
		me.AddItem(1,14,10,3);
		me.AddItem(1,14,10,3);
		me.AddItem(1,14,10,3);
end

function tbNewTest:mtty()		
		me.AddItem(1,14,11,3);
		me.AddItem(1,14,11,3);
		me.AddItem(1,14,11,3);
		me.AddItem(1,14,12,3);
		me.AddItem(1,14,12,3);
		me.AddItem(1,14,12,3);
end

function tbNewTest:mtdt()		
		me.AddItem(1,14,23,3);
		me.AddItem(1,14,23,3);
		me.AddItem(1,14,23,3);
		me.AddItem(1,14,24,3);
		me.AddItem(1,14,24,3);
		me.AddItem(1,14,24,3);
end

function tbNewTest:mtcb()
		me.AddItem(1,14,13,3);
		me.AddItem(1,14,13,3);
		me.AddItem(1,14,13,3);
		me.AddItem(1,14,14,3);
		me.AddItem(1,14,14,3);
		me.AddItem(1,14,14,3);
end

function tbNewTest:mttn()		
		me.AddItem(1,14,15,3);
		me.AddItem(1,14,15,3);
		me.AddItem(1,14,15,3);
		me.AddItem(1,14,16,3);
		me.AddItem(1,14,16,3);
		me.AddItem(1,14,16,3);
end

function tbNewTest:mtvd()
		me.AddItem(1,14,17,3);
		me.AddItem(1,14,17,3);
		me.AddItem(1,14,17,3);
		me.AddItem(1,14,18,3);
		me.AddItem(1,14,18,3);
		me.AddItem(1,14,18,3);
end

function tbNewTest:mtcl()		
		me.AddItem(1,14,19,3);
		me.AddItem(1,14,19,3);
		me.AddItem(1,14,19,3);
		me.AddItem(1,14,20,3);
		me.AddItem(1,14,20,3);
		me.AddItem(1,14,20,3);
end
----------------------------------------------------------------------------------

function tbNewTest:THLTest()
	me.ChangeCurMakePoint(1000000); --Nhận 1000.000 Tinh Lực
	me.ChangeCurGatherPoint(1000000); --Nhận 1000.000 Hoạt Lực
end

function tbNewTest:tiente()
	local szMsg = "Chọn tính năng muốn sử dụng:";
	local tbOpt = {
		{"Nhận <color=yellow>1000 vạn Bạc Thường<color>",self.BacThuong,self};
		{"Nhận <color=yellow>1000 vạn Bạc Khóa<color>",self.BacKhoa,self};
		{"Nhận <color=yellow>1 Ức vạn Đồng Thường<color>",self.DongThuong,self};
		{"Nhận <color=yellow>1000 vạn Đồng Khóa<color>",self.DongKhoa,self};
	{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbNewTest:BacThuong()
	me.Earn(10000000,0);
end

function tbNewTest:BacKhoa()
	me.AddBindMoney(10000000);
end

function tbNewTest:DongThuong()
	local tienxu = me.GetJbCoin();
	if tienxu < 100000000 then 
	me.AddJbCoin(100000000);
	else 
		Dialog:Say("Sử dụng hết 1 Ức đi đã bạn hiền ơi")
		return 
end
end 

function tbNewTest:DongKhoa()
	me.AddBindCoin(10000000);
end

tbNewTest.nMijiLevel			= 100;	
tbNewTest.nAddedKarmaPerTime	= 3000;		
function tbNewTest:LevelUpBook()
	local pItem		= me.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
        Dialog:Say("1. Trang bị mật tịch lên <color=yellow>Thuộc Tính Nhân Vật (F1)<color> mới có thể luyện max mật tịch!", {"Kết thúc đối thoại !"}); 
		return;
	end
	local nLevel = pItem.GetGenInfo(1);
	if nLevel >=  self.nMijiLevel then
		me.Msg("Cấp độ đã đạt mức cao nhất");
		return;
	end
	for i = 1, 1000 do
		local nLevel = pItem.GetGenInfo(1);			-- 秘籍当前等级
		if (nLevel >= self.nMijiLevel) then
			break;
		end
		Item:AddBookKarma(me, self.nAddedKarmaPerTime);
	end
	
end

function tbNewTest:nhanthucuoi()
	me.AddItem(1,12,33,4).Bind(1);
end

function tbNewTest:CuongHoaAn()
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
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
	local szMsg = "Bạn muốn làm gì?";
	local tbOpt = 
	{
		{"Cường ngũ hành tương khắc<color=yellow> +1000 điểm<color>",self.CuongHoaAn1,self,1},
		{"Nhược ngũ hành tương khắc<color=yellow> +1000 điểm<color>",self.CuongHoaAn1,self,2},
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbNewTest:CuongHoaAn1(nMagicIndex)
	local pSignet = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_SIGNET, 0);
	if not pSignet then
		Dialog:Say("Thăng cấp thành công.");
		return 0;
	end
	local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
	if nLevel >= 1000 then
		Dialog:Say("Ấn đã thăng cấp tối đa.");
		return 0;
	end
	nLevel = nLevel + 1000;
	if nLevel > 1000 then
		nLevel = 1000;
	end
	Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
	Dialog:Say("<color=yellow>Tăng cấp - Ngũ Hành Ấn<color> thành công");
end

function tbNewTest:PhiPhong7()
	me.AddItem(1,17,10,7,5);	
	me.AddItem(1,17,9,7,5);	
	me.AddItem(1,17,8,7,4);
	me.AddItem(1,17,7,7,4);
	me.AddItem(1,17,6,7,3);	
	me.AddItem(1,17,5,7,3);	
	me.AddItem(1,17,4,7,2);	
	me.AddItem(1,17,3,7,2);	
	me.AddItem(1,17,2,7,1);
	me.AddItem(1,17,1,7,1);
end

function tbNewTest:PhiPhong10()
	me.SetHonorLevel(10);
	me.AddItem(1,17,10,10,5);	
	me.AddItem(1,17,9,10,5);	
	me.AddItem(1,17,8,10,4);
	me.AddItem(1,17,7,10,4);
	me.AddItem(1,17,6,10,3);	
	me.AddItem(1,17,5,10,3);	
	me.AddItem(1,17,4,10,2);	
	me.AddItem(1,17,3,10,2);	
	me.AddItem(1,17,2,10,1);
	me.AddItem(1,17,1,10,1);
end

function tbNewTest:DBL9k()
	me.AddStackItem(18,1,190,1,nil,900);
end

function tbNewTest:tui24o()
	me.AddItem(21,9,1,1).Bind(1); --Túi phí phượng
	me.AddItem(21,9,1,1).Bind(1); --Túi phí phượng
	me.AddItem(21,9,1,1).Bind(1); --Túi phí phượng
end
function tbNewTest:DoCuoi16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Set Trang Bị Nam",self.DoNam16,self};
        {"Set Trang Bị Nữ",self.DoNu16,self },
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:DoNam16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Hệ Kim",self.HeKim16,self};
        {"Hệ Mộc",self.HeMoc16,self};
        {"Hệ Thuỷ",self.HeThuy16,self};
        {"Hệ Hỏa",self.HeHoa16,self};
        {"Hệ Thổ",self.HeTho16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:DoNu16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt = {
        {"Hệ Kim",self.HeKim161,self};
        {"Hệ Mộc",self.HeMoc161,self};
        {"Hệ Thuỷ",self.HeThuy161,self};
        {"Hệ Hỏa",self.HeHoa161,self};
        {"Hệ Thổ",self.HeTho161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeKim16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.KimNgoai16,self};
        {"Đồ Nội",self.KimNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeKim161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.KimNgoai161,self};
        {"Đồ Nội",self.KimNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeMoc16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.MocNgoai16,self};
        {"Đồ Nội",self.MocNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeMoc161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.MocNgoai161,self};
        {"Đồ Nội",self.MocNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeThuy16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThuyNgoai16,self};
        {"Đồ Nội",self.ThuyNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeThuy161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThuyNgoai161,self};
        {"Đồ Nội",self.ThuyNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeHoa16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.HoaNgoai16,self};
        {"Đồ Nội",self.HoaNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeHoa161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.HoaNgoai161,self};
        {"Đồ Nội",self.HoaNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeTho16()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThoNgoai16,self};
        {"Đồ Nội",self.ThoNoi16,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:HeTho161()
    local szMsg = "<pic=28>Hỗ trợ AlPhaTest \n Xin Chào <color=red>"..me.szName.. "<color> <pic=98> \n Tuyệt Đỉnh Kiếm Thế 2009\n<color=yellow>tuyetdinhkt2009.com";
    local tbOpt ={
        {"Đồ Ngoại",self.ThoNgoai161,self};
        {"Đồ Nội",self.ThoNoi161,self};
    }
    Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:KimNgoai16()
    me.AddGreenEquip(10,20211,10,5,16); --Th?y Hoàng H?ng Hoang Uy?n
    me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:KimNgoai161()
    me.AddGreenEquip(10,20212,10,5,16);
    me.AddGreenEquip(4,20161,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20085,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:KimNoi16()
    me.AddGreenEquip(10,20213,10,5,16);
    me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20065,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20105,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,353,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,487,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20045,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:KimNoi161()
    me.AddGreenEquip(10,20214,10,5,16);
    me.AddGreenEquip(4,20162,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20066,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20106,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20086,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,354,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,488,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20050,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20000,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:MocNgoai16()
    me.AddGreenEquip(10,20215,10,5,16);
    me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:MocNgoai161()
    me.AddGreenEquip(10,20216,10,5,16);
    me.AddGreenEquip(4,20163,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20087,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:MocNoi16()
    me.AddGreenEquip(10,20217,10,5,16);
    me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20067,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20107,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,373,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,489,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20046,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:MocNoi161()
    me.AddGreenEquip(10,20218,10,5,16);
    me.AddGreenEquip(4,20164,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20068,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20108,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20088,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,374,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,490,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20051,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20001,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThuyNgoai16()
    me.AddGreenEquip(10,20219,10,5,16);
    me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThuyNgoai161()
    me.AddGreenEquip(10,20220,10,5,16);
    me.AddGreenEquip(4,20165,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20089,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThuyNoi16()
    me.AddGreenEquip(10,20221,10,5,16);
    me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20069,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20109,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,393,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,491,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20047,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThuyNoi161()
    me.AddGreenEquip(10,20222,10,5,16);
    me.AddGreenEquip(4,20166,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20070,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20110,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20090,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,394,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,492,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20052,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20002,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:HoaNgoai16()
    me.AddGreenEquip(10,20223,10,5,16);
    me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:HoaNgoai161()
    me.AddGreenEquip(10,20224,10,5,16);
    me.AddGreenEquip(4,20167,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20091,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:HoaNoi16()
    me.AddGreenEquip(10,20225,10,5,16);
    me.AddGreenEquip(4,20168,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20071,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20111,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,413,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,493,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20048,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:HoaNoi161()
    me.AddGreenEquip(10,20226,10,5,16);
    me.AddGreenEquip(4,20168,10,5,16);--V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20072,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20112,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20092,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,414,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,494,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20053,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20003,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThoNgoai16()
    me.AddGreenEquip(10,20227,10,5,16);
    me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThoNgoai161()
    me.AddGreenEquip(10,20228,10,5,16);
    me.AddGreenEquip(4,20169,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20093,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThoNoi16()
    me.AddGreenEquip(10,20229,10,5,16);
    me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20073,10,5,16); --Tiêu Dao Bá V??ng Ngoa
    me.AddGreenEquip(11,20113,10,5,16); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
    me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,433,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,495,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20049,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:ThoNoi161()
    me.AddGreenEquip(10,20230,10,5,16);
    me.AddGreenEquip(4,20170,10,5,16); --V? Uy C? Tinh Gi?i
    me.AddGreenEquip(7,20074,10,5,16); --Tiêu Dao Huy?n N? Ngoa
    me.AddGreenEquip(11,20114,10,5,16); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
    me.AddGreenEquip(5,20094,10,5,16); --Tr?c L?c Thiên ?i?p L?u Van Liên
    me.AddGreenEquip(8,434,10,5,16); --Tr?c L?c Hoàng Long Tri?n Yêu
    me.AddGreenEquip(9,496,10,5,16); --Tr?c L?c Kinh Van Kh?i
    me.AddGreenEquip(3,20054,10,5,16); --Th?y Hoàng Long Lan Y
    me.AddGreenEquip(6,20004,10,5,16); --V? Uy L?m Nh?t Tinh Huy?n Phù
end

function tbNewTest:vukhitest()
    local szMsg = "Ngươi thuộc hệ phái gì ?";
        local tbOpt =
        {
            {"Thiên Vương Thương", self.vktvt,self},
            {"Thiên vương Chùy", self.vktvc,self},
            {"Thiếu Lâm Đao", self.vktld,self},
            {"Thiếu Lâm Bổng", self.vktlb,self},
            {"Minh Giáo Kiếm", self.vkmgk,self},
            {"Minh Giáo Chùy", self.vkmgc,self},
            {"Đường Môn Tụ Tiễn", self.vkdmtt,self},
            {"Đường Môn Hãm Tĩnh", self.vkdmht,self},
            {"Ngũ Độc Chưởng", self.vkndc,self},
            {"Ngũ Độc Đao", self.vkndd,self},
            {"Đoàn Thị Kiếm", self.vkdtk,self},
            {"Đoàn Thị Chỉ", self.vkdtc,self},
            {"Thuy Yên Kiếm", self.vktyk,self},
            {"Thúy Yên Đao", self.vktyd,self},
            {"Nga My Kiếm", self.vknmk,self},
            {"Nga My Chưởng", self.vknmc,self},
            {"<color=pink>Trang Sau<color>", self.vktrangsau,self},

        }
        Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:vktrangsau()
    local szMsg = "Ngươi thuộc hệ phái gì ?";
        local tbOpt =
        {
            {"Cái Bang Rồng", self.vkcbr,self},
            {"Cái Bang Bổng", self.vkcbb,self},
            {"Thiên Nhẫn Đao", self.vktnd,self},
            {"Thiên Nhẫn Kích", self.vktnk,self},
            {"Côn Lôn Kiếm", self.vkclk,self},
            {"Côn Lôn Đao", self.vkcld,self},
            {"Võ Đang Khí", self.vkvdk,self},
            {"Võ Đang Kiếm", self.vkvdkk,self},

        }
        Dialog:Say(szMsg,tbOpt);
end

function tbNewTest:vkmgk()
        local item10 = me.AddItem(2,1,1354,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkmgc()
        local item10 = me.AddItem(2,1,1353,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkdmtt()
        local item10 = me.AddItem(2,2,148,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkdmht()
        local item10 = me.AddItem(2,2,147,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkndc()
        local item10 = me.AddItem(2,1,1340,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkndd()
        local item10 = me.AddItem(2,1,1339,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkdtk()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkdtc()
        local item10 = me.AddItem(2,1,1342,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktyk()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktyd()
        local item10 = me.AddItem(2,1,1341,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vknmk()
        local item10 = me.AddItem(2,1,1344,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vknmc()
        local item10 = me.AddItem(2,1,1343,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktvt()
        local item10 = me.AddItem(2,1,1337,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktvc()
        local item10 = me.AddItem(2,1,1338,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktld()
        local item10 = me.AddItem(2,1,1335,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktlb()
        local item10 = me.AddItem(2,1,1336,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkcbb()
        local item10 = me.AddItem(2,1,1345,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkcbr()
        local item10 = me.AddItem(2,1,1347,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktnd()
        local item10 = me.AddItem(2,1,1348,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vktnk()
        local item10 = me.AddItem(2,1,1346,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkclk()
        local item10 = me.AddItem(2,1,1352,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkcld()
        local item10 = me.AddItem(2,1,1349,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkvdk()
        local item10 = me.AddItem(2,1,1351,10,1,16);
        item10.Bind(1);
end

function tbNewTest:vkvdkk()
        local item10 = me.AddItem(2,1,1350,10,1,16);
        item10.Bind(1);
end