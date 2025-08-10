local tbSuGiaEvent	= Npc:GetClass("sugiahoatdong");

function tbSuGiaEvent:OnDialog()
	-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sugiaevent.lua");
	local szMsg = "Chào mừng bạn đến với Bích Huyết Kiếm"
	    local tbOpt =     {} 
					table.insert(tbOpt, {"<color=yellow>Sự Kiện" , self.sukien, self});
					-- table.insert(tbOpt, {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 3 Mùng 8 / 3 Mốc 1500k" , self.tuychondonghanh11, self});
					-- table.insert(tbOpt, {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 4 Mùng 8 / 3 Mốc 1500k" , self.tuychondonghanhlan4, self});
					-- table.insert(tbOpt, {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 1 Vua Hùng Mốc 1500k" , self.tuychondonghanhlan5, self});
					-- table.insert(tbOpt, {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 2 Vua Hùng Mốc 1500k" , self.tuychondonghanhlan6, self});
					-- table.insert(tbOpt, {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 3 Vua Hùng Mốc 1500k" , self.tuychondonghanhlan7, self});
					-- table.insert(tbOpt, {"<color=yellow>Nộp Vật Phẩm Đua TOP Tháng 6" , Battle.top_15tongkim1, Battle});
				-- if (me.szAccount == "xboyhd") or (me.szAccount == "xboyhd") then
					-- table.insert(tbOpt, {"<color=yellow>Lấy Sò",self.layso,self});
				-- end 
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
 
	-- local tbOpt = {
			-- {"Sự Kiện Mùng 8 Tháng 3", SpecialEvent.tbMainSuKien83.OnDialog,SpecialEvent.tbMainSuKien83},
			-- {"Sự Kiện Mùng Vua Hùng Tháng 4", SpecialEvent.tbMainSuKienVuaHung.OnDialog,SpecialEvent.tbMainSuKienVuaHung},
			-- {"Sự Kiện Mùa Hè Tháng 5", SpecialEvent.tbMainSuKienMuaHe.OnDialog,SpecialEvent.tbMainSuKienMuaHe},
			-- {"Sự Kiện Tháng 6", SpecialEvent.tbSuKienThanHoa.OnDialog,SpecialEvent.tbSuKienThanHoa},
			-- {"Sự Kiện Tháng 7", SpecialEvent.tbSuKienThanHoaT7.OnDialog,SpecialEvent.tbSuKienThanHoaT7},
			-- {"Sự Kiện Tháng 8", SpecialEvent.tbSuKienCachMangT8.OnDialog,SpecialEvent.tbSuKienThanHoaT8},
			-- {"Nhiệm Vụ Vận Tiêu", SpecialEvent.VanTieu.OnDialog,SpecialEvent.VanTieu},
			-- {"<color=yellow>Sự Kiện", self.sukien, self},
			-- {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 3 Nhà Giáo VN Mốc 2000k", self.tuychondonghanh11, self},
			-- {"<color=yellow>Nhận Trang Bị Đồng Hành Sự Kiện Lần 2 Nhà Giáo VN Mốc 2000k", self.tuychondonghanh11, self},
			-- {"Để khi khác ta tới"},
		-- };
	-- Dialog:Say("Chào mừng bạn đến với Tuyệt Đỉnh Kiếm Thế 2009\nTuyetDinhKT2009.Com", tbOpt);
-- end
function tbSuGiaEvent:khongcogi()
Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
end
function tbSuGiaEvent:layso()
    local nSoLuong = 1000
    me.AddStackItem(18, 1, 325, 1, nil, nSoLuong)
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local logMessage = string.format("Người nhận: %s, Số sò: %d, Thời gian: %s", me.szName , nSoLuong, szDate)
    local logFilePath = "\\script\\global\\tcqgaming\\gm\\nhanso.txt"
    local szData = KFile.ReadTxtFile(logFilePath)
    szData = szData and (szData .. "\n" .. logMessage) or logMessage
    KFile.WriteFile(logFilePath, szData)
end
function tbSuGiaEvent:sukien()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
			 -- {"<color=yellow>Sự Kiện Thần Hỏa Tháng 5", SpecialEvent.tbSuKienThanHoaT7.OnDialog,SpecialEvent.tbSuKienThanHoaT7},
			 -- {"<color=yellow>Sự Kiện Mùa Hè Tháng 6", SpecialEvent.tbSuKien_Thang6.OnDialog,SpecialEvent.tbSuKien_Thang6},
			 -- {"<color=yellow>Sự Kiện Thương Binh Liệt Sĩ 27/7", SpecialEvent.tbSuKien_Thang7.OnDialog,SpecialEvent.tbSuKien_Thang7},
			 -- {"<color=yellow>Sự Kiện Cách Mạng 19/08", SpecialEvent.tbThang8.OnDialog,SpecialEvent.tbThang8},
			 
			 
			 			-- {"<color=yellow>Sự Kiện Tết Dương Lịch 2025", SpecialEvent.tbThang1.OnDialog,SpecialEvent.tbThang1},
			-- {"<color=yellow>Sự Kiện Tết Dương Lịch 2024", SpecialEvent.tbThang1.OnDialog,SpecialEvent.tbThang1},
			-- {"<color=yellow>Sự Kiện Ngày Lễ Tình Yêu Valentine", SpecialEvent.tb_Valentine_Main.OnDialog,SpecialEvent.tb_Valentine_Main},
			-- {"<color=yellow>Sự Kiện Ngày Quốc Tế Phụ Nữ 08/03", SpecialEvent.tbMainSuKien83.OnDialog,SpecialEvent.tbMainSuKien83},
			-- {"<color=yellow>Sự Kiện Mùng Vua Hùng Tháng 4", SpecialEvent.tbMainSuKienVuaHung.OnDialog,SpecialEvent.tbMainSuKienVuaHung},
			-- {"<color=yellow>Sự Kiện Cách Mạng Tháng 8", SpecialEvent.tbThang8.OnDialog,SpecialEvent.tbThang8},
			-- {"<color=yellow>Sự Kiện Quốc Khánh Mùng 2 Tháng 9", SpecialEvent.tbThang9.OnDialog,SpecialEvent.tbThang9},
			-- {"<color=yellow>Sự Kiện Kỷ Niệm Ngày Phụ Nữ Việt Nam 20 Tháng 10", SpecialEvent.tbMainSuKien2010.OnDialog,SpecialEvent.tbMainSuKien2010},
			-- {"<color=yellow>Sự Kiện Kỷ Niệm Ngày Nhà Giáo Việt Nam 20 Tháng 11", SpecialEvent.tbMainSuKien2011.OnDialog,SpecialEvent.tbMainSuKien2011},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Chào mừng bạn đến với Bích Huyết Kiếm", tbOpt);
end

function tbSuGiaEvent:tuychondonghanh11()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
		{"<color=yellow>Nhận Vũ Khí Đồng Hành Cấp 1", self.nhanvukhidh1, self},
		{"<color=yellow>Nhận Áo Đồng Hành Cấp 1", self.nhanaodh1, self},
		{"<color=yellow>Nhận Hộ Uyển Đồng Hành Cấp 1", self.nhanbaotaydh1, self},
		{"<color=yellow>Nhận Nhẫn Đồng Hành Cấp 1", self.nhannhandh1, self},
		{"<color=yellow>Nhận Hộ Thân Phù Đồng Hành Cấp 1", self.nhanhothanphudh1, self},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Xin lưu ý : Chỉ được nhận duy nhất 1 món hãy cân nhắc thật chắc chắn", tbOpt);
end

function tbSuGiaEvent:tuychondonghanhlan4()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
		{"<color=yellow>Nhận Vũ Khí Đồng Hành Cấp 1", self.nhanvukhidh1_lan3, self},
		{"<color=yellow>Nhận Áo Đồng Hành Cấp 1", self.nhanaodh1_lan3, self},
		{"<color=yellow>Nhận Hộ Uyển Đồng Hành Cấp 1", self.nhanbaotaydh1_lan3, self},
		{"<color=yellow>Nhận Nhẫn Đồng Hành Cấp 1", self.nhannhandh1_lan3, self},
		{"<color=yellow>Nhận Hộ Thân Phù Đồng Hành Cấp 1", self.nhanhothanphudh1_lan3, self},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Xin lưu ý : Chỉ được nhận duy nhất 1 món hãy cân nhắc thật chắc chắn", tbOpt);
end
function tbSuGiaEvent:tuychondonghanhlan5()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
		{"<color=yellow>Nhận Vũ Khí Đồng Hành Cấp 1", self.nhanvukhidh1_lan5, self},
		{"<color=yellow>Nhận Áo Đồng Hành Cấp 1", self.nhanaodh1_lan5, self},
		{"<color=yellow>Nhận Hộ Uyển Đồng Hành Cấp 1", self.nhanbaotaydh1_lan5, self},
		{"<color=yellow>Nhận Nhẫn Đồng Hành Cấp 1", self.nhannhandh1_lan5, self},
		{"<color=yellow>Nhận Hộ Thân Phù Đồng Hành Cấp 1", self.nhanhothanphudh1_lan5, self},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Xin lưu ý : Chỉ được nhận duy nhất 1 món hãy cân nhắc thật chắc chắn", tbOpt);
end
function tbSuGiaEvent:tuychondonghanhlan6()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
		{"<color=yellow>Nhận Vũ Khí Đồng Hành Cấp 1", self.nhanvukhidh1_lan6, self},
		{"<color=yellow>Nhận Áo Đồng Hành Cấp 1", self.nhanaodh1_lan6, self},
		{"<color=yellow>Nhận Hộ Uyển Đồng Hành Cấp 1", self.nhanbaotaydh1_lan6, self},
		{"<color=yellow>Nhận Nhẫn Đồng Hành Cấp 1", self.nhannhandh1_lan6, self},
		{"<color=yellow>Nhận Hộ Thân Phù Đồng Hành Cấp 1", self.nhanhothanphudh1_lan6, self},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Xin lưu ý : Chỉ được nhận duy nhất 1 món hãy cân nhắc thật chắc chắn", tbOpt);
end

function tbSuGiaEvent:tuychondonghanhlan7()
-- Dialog:Say("Hiện nay chưa có sự kiện gì diễn ra")
	local tbOpt = {
		{"<color=yellow>Nhận Vũ Khí Đồng Hành Cấp 1", self.nhanvukhidh1_lan7, self},
		{"<color=yellow>Nhận Áo Đồng Hành Cấp 1", self.nhanaodh1_lan7, self},
		{"<color=yellow>Nhận Hộ Uyển Đồng Hành Cấp 1", self.nhanbaotaydh1_lan7, self},
		{"<color=yellow>Nhận Nhẫn Đồng Hành Cấp 1", self.nhannhandh1_lan7, self},
		{"<color=yellow>Nhận Hộ Thân Phù Đồng Hành Cấp 1", self.nhanhothanphudh1_lan7, self},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Xin lưu ý : Chỉ được nhận duy nhất 1 món hãy cân nhắc thật chắc chắn", tbOpt);
end

function tbSuGiaEvent:nhanvukhidh1()
local nMoc2000 = me.GetTask(9178,179)
local nGioiHan = me.GetTask(9178,180)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,180,1)
end
end 
function tbSuGiaEvent:nhanaodh1()
local nMoc2000 = me.GetTask(9178,179)
local nGioiHan = me.GetTask(9178,180)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,180,1)
end
end 
function tbSuGiaEvent:nhannhandh1()
local nMoc2000 = me.GetTask(9178,179)
local nGioiHan = me.GetTask(9178,180)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,180,1)
end
end 
function tbSuGiaEvent:nhanbaotaydh1()
local nMoc2000 = me.GetTask(9178,179)
local nGioiHan = me.GetTask(9178,180)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,180,1)
end
end 
function tbSuGiaEvent:nhanhothanphudh1()
local nMoc2000 = me.GetTask(9178,179)
local nGioiHan = me.GetTask(9178,180)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,180,1)
end
end 

function tbSuGiaEvent:nhanvukhidh1_lan3()
local nMoc2000 = me.GetTask(9178,192)
local nGioiHan = me.GetTask(9178,193)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,193,1)
end
end 
function tbSuGiaEvent:nhanaodh1_lan3()
local nMoc2000 = me.GetTask(9178,192)
local nGioiHan = me.GetTask(9178,193)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,193,1)
end
end 
function tbSuGiaEvent:nhannhandh1_lan3()
local nMoc2000 = me.GetTask(9178,192)
local nGioiHan = me.GetTask(9178,193)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,193,1)
end
end 
function tbSuGiaEvent:nhanbaotaydh1_lan3()
local nMoc2000 = me.GetTask(9178,192)
local nGioiHan = me.GetTask(9178,193)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,193,1)
end
end 
function tbSuGiaEvent:nhanhothanphudh1_lan3()
local nMoc2000 = me.GetTask(9178,192)
local nGioiHan = me.GetTask(9178,193)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,193,1)
end
end 



function tbSuGiaEvent:nhanvukhidh1_lan5()
local nMoc2000 = me.GetTask(9178,205)
local nGioiHan = me.GetTask(9178,207)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,207,1)
end
end 
function tbSuGiaEvent:nhanaodh1_lan5()
local nMoc2000 = me.GetTask(9178,205)
local nGioiHan = me.GetTask(9178,207)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,207,1)
end
end 
function tbSuGiaEvent:nhannhandh1_lan5()
local nMoc2000 = me.GetTask(9178,205)
local nGioiHan = me.GetTask(9178,207)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,207,1)
end
end 
function tbSuGiaEvent:nhanbaotaydh1_lan5()
local nMoc2000 = me.GetTask(9178,205)
local nGioiHan = me.GetTask(9178,207)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,207,1)
end
end 
function tbSuGiaEvent:nhanhothanphudh1_lan5()
local nMoc2000 = me.GetTask(9178,205)
local nGioiHan = me.GetTask(9178,207)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,207,1)
end
end 




function tbSuGiaEvent:nhanvukhidh1_lan6()
local nMoc2000 = me.GetTask(9178,219)
local nGioiHan = me.GetTask(9178,221)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,221,1)
end
end 
function tbSuGiaEvent:nhanaodh1_lan6()
local nMoc2000 = me.GetTask(9178,219)
local nGioiHan = me.GetTask(9178,221)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,221,1)
end
end 
function tbSuGiaEvent:nhannhandh1_lan6()
local nMoc2000 = me.GetTask(9178,219)
local nGioiHan = me.GetTask(9178,221)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,221,1)
end
end 
function tbSuGiaEvent:nhanbaotaydh1_lan6()
local nMoc2000 = me.GetTask(9178,219)
local nGioiHan = me.GetTask(9178,221)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,221,1)
end
end 
function tbSuGiaEvent:nhanhothanphudh1_lan6()
local nMoc2000 = me.GetTask(9178,219)
local nGioiHan = me.GetTask(9178,221)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,221,1)
end
end 



function tbSuGiaEvent:nhanvukhidh1_lan7()
local nMoc2000 = me.GetTask(9178,234)
local nGioiHan = me.GetTask(9178,235)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,235,1)
end
end 
function tbSuGiaEvent:nhanaodh1_lan7()
local nMoc2000 = me.GetTask(9178,234)
local nGioiHan = me.GetTask(9178,235)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,235,1)
end
end 
function tbSuGiaEvent:nhannhandh1_lan7()
local nMoc2000 = me.GetTask(9178,234)
local nGioiHan = me.GetTask(9178,235)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,235,1)
end
end 
function tbSuGiaEvent:nhanbaotaydh1_lan7()
local nMoc2000 = me.GetTask(9178,234)
local nGioiHan = me.GetTask(9178,235)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,235,1)
end
end 
function tbSuGiaEvent:nhanhothanphudh1_lan7()
local nMoc2000 = me.GetTask(9178,234)
local nGioiHan = me.GetTask(9178,235)
if nGioiHan > 0 then 
Dialog:Say("Bạn đã nhận phần quà này rồi")
return 
end 
if nMoc2000 < 1 then 
Dialog:Say("Bạn chưa hề nhận thưởng Mốc 1500k Tại Túi Tân Thủ xin hãy kiểm tra lại")
return 
end 
if nMoc2000 == 1 then 
		-- me.AddStackItem(5,19,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,20,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,21,1,1,{bForceBind=1},1);				
		-- me.AddStackItem(5,22,1,1,{bForceBind=1},1);				
		me.AddStackItem(5,23,1,1,{bForceBind=1},1);	
me.SetTask(9178,235,1)
end
end 