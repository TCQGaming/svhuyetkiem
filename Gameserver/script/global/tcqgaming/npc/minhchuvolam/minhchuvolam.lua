local tbMinhChu	= Npc:GetClass("minhchuvolam");

function tbMinhChu:OnDialog()
    DoScript("\\script\\global\\tcqgaming\\npc\\minhchuvolam\\minhchuvolam.lua");
	local nMoHoatDong = ConfigAll.NpcMinhChuVoLam
	if nMoHoatDong == 0 then 
	Dialog:Say("Tính năng chưa mở");
	return 0;
	end 
    local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt";
    local szData = KFile.ReadTxtFile(szHistory);

    local tbCapMapping = {
        [1] = "Trí Sự",
        [2] = "Tư Mã",
        [3] = "Thái Thú",
        [4] = "Thiếu Khanh",
        [5] = "Thượng Khanh",
        [6] = "Quốc Công",
        [7] = "Thừa Tướng",
        [8] = "Hoàng Đế"
    };

    -- Phân tích dữ liệu từ tệp log
    local tbEntries = {};
    for szName, nCapAn, szDate in string.gmatch(szData, "(%S+)\t(%d+)\t(%S+)") do
        if not tbEntries[szName] or tbEntries[szName] < tonumber(nCapAn) then
            tbEntries[szName] = tonumber(nCapAn); -- Lưu lại cấp ấn cao nhất của mỗi người chơi
        end
    end

    -- Tìm người chơi có cấp ấn cao nhất
    local szMinhChu, nHighestCap = "Chưa có", 0;
    for szName, nCapAn in pairs(tbEntries) do
        if nCapAn > nHighestCap then
            nHighestCap = nCapAn;
            szMinhChu = szName;
        end
    end

    local tbOpt = {
            {"<color=yellow>Liên quan Quan Ấn", self.NhanQuanAn, self},
            {"<color=yellow>Ta muốn Ghi danh Tranh Đoạt Minh Chủ", self.GhiFile_List, self},
            {"<color=yellow>Nhận thưởng Minh Chủ", self.nhanThuongMinhChu, self},

            {"Để khi khác ta tới"},
        };

    local szMsg = string.format("Nếu các hạ muốn <color=yellow> Tỏa sáng 1 lần <color> còn hơn chìm trong bóng tối thì hãy gặp ta\nChỉ người chơi có Quan Ấn tại Hành trang mới có thể Ghi Danh vào <color=green>22h10 đến 22h20 Thứ 2<color>\nNgười có Quan Ấn Cao Nhất sẽ là<color=cyan> Minh Chủ Võ Lâm<color> sau <color=green>22h21 Thứ 2<color>.\nMinh Chủ tuần này là <color=yellow>%s<color> %s", szMinhChu, szMinhChu == "Chưa có" and "" or string.format("với chức danh là <color=yellow>%s<color>", tbCapMapping[nHighestCap]));
    
    Dialog:Say(szMsg, tbOpt);
end


function tbMinhChu:khongcogi()
Dialog:Say("Tính năng đang được kỹ thuật hoàn thiện")
end

function tbMinhChu:nhanThuongMinhChu()
  local nTuan    = tonumber(GetLocalDate("%W%y"));
	if me.GetTask(9172,2) ~= nTuan then
		me.SetTask(9172,2, nTuan);
		me.SetTask(9172,1, 0);------Task nhận thưởng
	end 
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))

if not ((nWeekDay == 1 and nCurTime >= 2221) or nWeekDay == 0 or (nWeekDay >= 2 and nWeekDay <= 6)) then 
	Dialog:Say("<color=yellow>Chỉ được phép nhận thưởng từ sau 22h21 Thứ 2 đến hết Chủ nhật hàng tuần.");
	return;
end

local nNhanThuong = me.GetTask(9172,1)
if nNhanThuong > 0 then 
	Dialog:Say("<color=yellow>Chỉ được nhận thưởng 1 lần 1 tuần.");
	return;
end	
	local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt";
	local szData = KFile.ReadTxtFile(szHistory);

	if not szData or szData == "" then
		Dialog:Say("Hiện chưa có ai đăng ký làm Minh Chủ tuần này.");
		return;
	end
	
	-- Phân tích dữ liệu từ tệp log
	local tbEntries = {};
	for szName, nCapAn, szDate in string.gmatch(szData, "(%S+)\t(%d+)\t(%S+)") do
		if not tbEntries[szName] or tbEntries[szName] < tonumber(nCapAn) then
			tbEntries[szName] = tonumber(nCapAn); -- Lưu lại cấp ấn cao nhất của mỗi người chơi
		end
	end

	-- Tìm người chơi có cấp ấn cao nhất
	local szMinhChu, nHighestCap = "", 0;
	for szName, nCapAn in pairs(tbEntries) do
		if nCapAn > nHighestCap then
			nHighestCap = nCapAn;
			szMinhChu = szName;
		end
	end
	
	if szMinhChu == me.szName then
	me.SetTask(9172,1,1)
	me.AddTitle(41,1,6,1); -- danh hieu
	me.AddStackItem(18,1,114,7,{bForceBind=1},2)--HT8
	me.AddStackItem(18,1,553,1,{bForceBind=1},100)--200 Tiền Du Long
	me.AddStackItem(18,1,2030,8,{bForceBind=1},2)--Tín Vật Minh Chủ
	KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Bạn đã nhận thưởng đặc biệt dành cho<color=cyan> Minh Chủ Võ Lâm<color> tuần này\n<color=yellow>2 Huyền Tinh Cấp 7 + 100 Tiền Du Long + 2 Tín Vật Minh Chủ.");
	else
	me.SetTask(9172,1,1)
	me.AddStackItem(18,1,114,7,{bForceBind=1},2)--HT8
	me.AddStackItem(18,1,553,1,{bForceBind=1},100)--100 Tiền Du Long
	KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Bạn đã nhận thưởng con dân của<color=cyan> Minh Chủ Võ Lâm<color> tuần này\n<color=yellow>2 Huyền Tinh Cấp 7 + 100 Tiền Du Long.");
	end
end


function tbMinhChu:xemminhchu()
	local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt";
	local szData = KFile.ReadTxtFile(szHistory);

	if not szData or szData == "" then
		Dialog:Say("Hiện chưa có ai đăng ký làm Minh Chủ tuần này.");
		return;
	end

	local tbCapMapping = {
		[1] = "Trí Sự",
		[2] = "Tư Mã",
		[3] = "Thái Thú",
		[4] = "Thiếu Khanh",
		[5] = "Thượng Khanh",
		[6] = "Quốc Công",
		[7] = "Thừa Tướng",
		[8] = "Hoàng Đế"
	};

	-- Phân tích dữ liệu từ tệp log
	local tbEntries = {};
	for szName, nCapAn, szDate in string.gmatch(szData, "(%S+)\t(%d+)\t(%S+)") do
		if not tbEntries[szName] or tbEntries[szName] < tonumber(nCapAn) then
			tbEntries[szName] = tonumber(nCapAn); -- Lưu lại cấp ấn cao nhất của mỗi người chơi
		end
	end

	-- Tìm người chơi có cấp ấn cao nhất
	local szMinhChu, nHighestCap = "", 0;
	for szName, nCapAn in pairs(tbEntries) do
		if nCapAn > nHighestCap then
			nHighestCap = nCapAn;
			szMinhChu = szName;
		end
	end

	if szMinhChu == "" then
		Dialog:Say("Hiện chưa có ai đăng ký làm Minh Chủ tuần này.");
	else
		Dialog:Say(string.format("Minh Chủ tuần này là <color=yellow>%s<color> với chức danh là <color=yellow>%s<color>.", szMinhChu, tbCapMapping[nHighestCap]));
	end
end




function tbMinhChu:GhiFile_List()
	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	local nCurTime = tonumber(os.date("%H%M", nTime))

	if nWeekDay ~= 1 or nCurTime < 2210 or nCurTime > 2220 then 
		Dialog:Say("<color=yellow>Ghi danh chỉ được mở vào 22h10 đến 22h20 của Thứ 2 hàng tuần.");
		return;
	end
	local tbAllRoom = {
		Item.ROOM_MAINBAG,
		Item.ROOM_EXTBAG1,
		Item.ROOM_EXTBAG2,
		Item.ROOM_EXTBAG3,
		Item.ROOM_REPOSITORY,
		Item.ROOM_EXTREP1,
		Item.ROOM_EXTREP2,
		Item.ROOM_EXTREP3,
		Item.ROOM_EXTREP4,
		Item.ROOM_EXTREP5,
	};

	local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt";
	local szData = KFile.ReadTxtFile(szHistory);

	local bHasAn = false -- Biến kiểm tra người chơi có ấn trong hành trang hay không

	for nCapAn = 1, 8 do
		for nHe = 1, 5 do
			local nCount = 0;
			local szItemCheck = string.format("%s,%s,%s,%s", 1, 18, nHe, nCapAn);
			local pattern = string.format("(%s%s%d)", me.szName, "\t", nCapAn);
			
			-- Kiểm tra xem người chơi đã ghi danh cho cấp độ ấn này hay chưa
			if szData and szData:find(pattern) then
				-- Người chơi đã ghi danh, bỏ qua lần kiểm tra này
				break;
			else
				for _, nRoom in pairs(tbAllRoom) do
					local tbIdx = me.FindAllItem(nRoom);
					for i = 1, #tbIdx do
						local pItem = KItem.GetItemObj(tbIdx[i]);
						if pItem then
							local szItem = string.format("%s,%s,%s,%s", pItem.nGenre, pItem.nDetail, pItem.nParticular, pItem.nLevel);
							if szItemCheck == szItem then
								bHasAn = true -- Người chơi có ít nhất một ấn
								nCount = nCount + pItem.nCount;
								local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime());
								local szNewData = string.format("%s\t%s\t%s\n", me.szName, nCapAn, szDate);
								KFile.AppendFile(szHistory, szNewData);
								Dialog:Say("Ghi danh thành công xin hãy chờ kết quả");
								break;
							end
						end
					end
					if bHasAn then break; end
				end
			end
			if bHasAn then break; end
		end
		if bHasAn then break; end
	end

	-- Nếu người chơi không có ấn nào
	if not bHasAn then
		Dialog:Say("Bạn không có ấn hoặc đã ghi danh rồi");
	end
end





function tbMinhChu:NhanQuanAn()
local szMsg = "<color=red>*Cách đổi Ấn HSD 6 Ngày<color> :\n" ..
              "<color=yellow>Mua Ấn Trí Sự<color> : 1 Tín Vật + 500 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Tư Mã<color> : 1 Tín Vật + 200 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Thái Thú<color> : 1 Tín Vật + 200 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Thiếu Khanh<color> : 1 Tín Vật + 500 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Thượng Khanh<color> : 1 Tín Vật + 1000 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Quốc Công<color> : 1 Tín Vật + 1000 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Thừa Tướng<color> : 1 Tín Vật + 1000 Vạn Đồng\n" ..
              "<color=yellow>Nâng Ấn Bằng Minh Chủ<color>:  2 Tín Vật + 1000 Vạn Đồng\n" ..
              "<color=red>Lưu Ý : Các Dòng Nâng Quan Ấn Liên Quan Đến Minh Chủ Sever. Nếu người có ấn cao nhất thoái ẩn giang hồ không muốn thị phi thì cấp ấn sẽ bằng với Minh Chủ hiện tại\n"..
              "<color=cyan>Cần chuyển Ấn Thành Ấn Thuộc Hệ Kim mới có thể nâng cấp";
	local tbOpt = {
		{"Đổi Tín Vật Minh Chủ Thành Không Khóa\n<color=green>5 Vạn Đồng Phí",self.doitinvat,self};
		{"<color=yellow>Ta Muốn Nâng cấp Quan Ấn",self.QuanAnKim,self};
	{"Ta Chỉ Xem Qua Thôi..."},
	};
	Dialog:Say(szMsg,tbOpt);
end

function tbMinhChu:doitinvat()
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nDong = me.GetJbCoin()
if nDong < 5*10000 then 
	Dialog:Say("Bạn chưa đủ 5 vạn đồng thường rồi")
return 
end
local tbTinVat	= {18,1,2030,8,0,0}; 
	Task:DelItem(me, tbTinVat, 1);
	me.AddItem(18,1,2030,8,nil,1);
		me.AddJbCoin(-5*10000)
end 
function tbMinhChu:QuanAnKim()
    local szMsg = "<pic=28>Xin chào \n <color=red>"..me.szName.. "<color> <pic=98> \n Bạn đang chơi tại Máy Chủ \nTuyetDinhKT2009.Com";
    
    local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt";
    local szData = KFile.ReadTxtFile(szHistory);
	local tbCapToName = {
    [1] = "Trí Sự",
    [2] = "Tư Mã",
    [3] = "Thái Thú",
    [4] = "Thiếu Khanh",
    [5] = "Thượng Khanh",
    [6] = "Quốc Công",
    [7] = "Thừa Tướng",
    [8] = "Hoàng Đế"
};

    if not szData or szData == "" then
		Dialog:Say("Hiện nay ta không thấy trong giang hộ ai là MINH CHỦ")
        return;
    end

    -- Phân tích dữ liệu từ tệp log
    local tbEntries = {};
    for szName, nCapAn, szDate in string.gmatch(szData, "(%S+)\t(%d+)\t(%S+)") do
        if not tbEntries[szName] or tbEntries[szName] < tonumber(nCapAn) then
            tbEntries[szName] = tonumber(nCapAn); -- Lưu lại cấp ấn cao nhất của mỗi người chơi
        end
    end

    -- Tìm người chơi có cấp ấn cao nhất
    local nHighestCap = 0;
    for _, nCapAn in pairs(tbEntries) do
        if nCapAn > nHighestCap then
            nHighestCap = nCapAn;
        end
    end
    
    local tbOpt = {};

    for i = 1, nHighestCap-1 do
        local szOpt = string.format("<color=yellow>Nâng cấp Quan Ấn %s", tbCapToName[i]);
        table.insert(tbOpt, {szOpt, self["QuanAnKim" .. i], self});
    end

    table.insert(tbOpt, {"<color=yellow>Nâng cấp Quan Ấn Cao Nhất Hiện Nay",self.CapAnCaoNhat,self});
    table.insert(tbOpt, {"Ta Chỉ Xem Qua Thôi..."});
    
    Dialog:Say(szMsg, tbOpt);
end


function tbMinhChu:QuanAnKim1()
local nDong = me.GetJbCoin()
if nDong < 500*10000 then 
	Dialog:Say("Bạn chưa đủ 500 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,1,1);
	me.AddJbCoin(-500*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN TRÍ SỰ.");
end

function tbMinhChu:QuanAnKim2()
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,1,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Trí Sự")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,1,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 		me.AddItem(1,18,1,2,1);
	me.AddJbCoin(-200*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
	Task:DelItem(me, tbQuanAnOld, 1);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN TƯ MÃ.");
end

function tbMinhChu:QuanAnKim3()
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,2,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Tư Mã")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,2,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,3,1);
	me.AddJbCoin(-200*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
				KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN THÁI THÚ.");
end

function tbMinhChu:QuanAnKim4()
local nDong = me.GetJbCoin()
if nDong < 500*10000 then 
	Dialog:Say("Bạn chưa đủ 500 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,3,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Thái Thú")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,3,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,4,1);
	me.AddJbCoin(-500*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
				KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN THIẾU KHANH.");
end

function tbMinhChu:QuanAnKim5()
local nDong = me.GetJbCoin()
if nDong < 1000*10000 then 
	Dialog:Say("Bạn chưa đủ 1000 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,4,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Thiếu Khanh")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,4,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,5,1);
	me.AddJbCoin(-1000*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN THƯỢNG KHANH.");
end

function tbMinhChu:QuanAnKim6()
local nDong = me.GetJbCoin()
if nDong < 1000*10000 then 
	Dialog:Say("Bạn chưa đủ 1000 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,5,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Thượng Khanh")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,5,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,6,1);
	me.AddJbCoin(-1000*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN QUỐC CÔNG.");
end

function tbMinhChu:QuanAnKim7()
local nDong = me.GetJbCoin()
if nDong < 1000*10000 then 
	Dialog:Say("Bạn chưa đủ 1000 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,6,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Quốc Công")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,6,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,7,1);
	me.AddJbCoin(-1000*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN THỪA TƯỚNG.");
end

function tbMinhChu:QuanAnKim8()
local nDong = me.GetJbCoin()
if nDong < 1000*10000 then 
	Dialog:Say("Bạn chưa đủ 1000 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 1 then 
	Dialog:Say("Trong hành trang không có nổi 1 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local nQuanAnOld = me.GetItemCountInBags(1,18,1,7,1) 
if nQuanAnOld < 1 then 
	Dialog:Say("Trong hành trang không có <color=yellow> Quan Ấn Thừa Tướng")
	return 
end 
local tbTinVat	= {18,1,2030,8,0,0}; 
local tbQuanAnOld	= {1,18,1,7,1,0}; 
local nSoLuongTinVat = 1
local nQuanAn = 	me.AddItem(1,18,1,8,1);
	me.AddJbCoin(-1000*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
		Task:DelItem(me, tbQuanAnOld, 1);
		KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công QUAN ẤN Hoàng Đế.");
end

function tbMinhChu:CapAnCaoNhat()
local szHistory = "\\script\\global\\tcqgaming\\npc\\minhchuvolam\\QuanAnMinhChu.txt"
local szData = KFile.ReadTxtFile(szHistory)

if not szData or szData == "" then
    Dialog:Say("Hiện nay ta không thấy trong giang hộ ai là MINH CHỦ")
    return
end

local lines = {}
for line in szData:gmatch("[^\r\n]+") do
    table.insert(lines, line)
end

if #lines >= 2 and lines[2] == "" then
    Dialog:Say("Hiện nay ta không thấy trong giang hộ ai là MINH CHỦ")
else
    -- Đếm dữ liệu từ dòng thứ hai trở đi ở đây
    local count = #lines - 1 -- Trừ đi một để loại bỏ dòng tiêu đề
    Dialog:Say("Hiện nay ta không thấy trong giang hộ ai là MINH CHỦ")
    -- Bạn có thể thực hiện các hành động khác với dữ liệu ở đây
end


    -- Phân tích dữ liệu từ tệp log
    local tbEntries = {};
    for szName, nCapAn, szDate in string.gmatch(szData, "(%S+)\t(%d+)\t(%S+)") do
        if not tbEntries[szName] or tbEntries[szName] < tonumber(nCapAn) then
            tbEntries[szName] = tonumber(nCapAn); -- Lưu lại cấp ấn cao nhất của mỗi người chơi
        end
    end

    -- Tìm người chơi có cấp ấn cao nhất
    local nHighestCap = 0;
    for _, nCapAn in pairs(tbEntries) do
        if nCapAn > nHighestCap then
            nHighestCap = nCapAn;
        end
    end

local tbCapToName = {
    [1] = "Trí Sự",
    [2] = "Tư Mã",
    [3] = "Thái Thú",
    [4] = "Thiếu Khanh",
    [5] = "Thượng Khanh",
    [6] = "Quốc Công",
    [7] = "Thừa Tướng",
    [8] = "Hoàng Đế"
};
-- Lấy tên của Quan Ấn dựa trên giá trị của nHighestCap
local TenAn = tbCapToName[nHighestCap - 1];  
local TenAn1 = tbCapToName[nHighestCap];  
    if nHighestCap > 0 then
local nQuanAnOld = me.GetItemCountInBags(1, 18, 1, nHighestCap - 1, 1);

if nQuanAnOld < 1 then 
Dialog:Say("Hiện nay Minh Chủ Là Cấp <color=yellow>Quan Ấn "..TenAn1.." <color>vì thế yêu cầu<color=yellow> Quan Ấn " .. TenAn .. "<color> mà Trong hành trang ngươi ta không thấy có");
	return 
end 


local nDong = me.GetJbCoin()
if nDong < 1000*10000 then 
	Dialog:Say("Bạn chưa đủ 1000 vạn đồng thường rồi")
return 
end
local nTinVat = me.GetItemCountInBags(18,1,2030,8) 
if nTinVat < 2 then 
	Dialog:Say("Trong hành trang không có nổi 2 Tín Vật Minh Chủ mà dám tơi đây gạt ta ?")
	return 
end 
local tbQuanAnOld	= {1,18,1,nHighestCap - 1,1,0}; 
local tbTinVat	= {18,1,2030,8,0,0}; 
local nSoLuongTinVat = 2
local nQuanAn = 	me.AddItem(1, 18, 1, nHighestCap, 1);
	me.AddJbCoin(-1000*10000)
	nQuanAn.Bind(1);
	me.SetItemTimeout(nQuanAn, 7*24*60, 0);
	Task:DelItem(me, tbTinVat, nSoLuongTinVat);
	Task:DelItem(me, tbQuanAnOld, 1);
    end
					-- KDialog.MsgToGlobal("Chúc mừng! Người chơi <color=cyan>[ "..me.szName.." ]<color> Đã mua thành công<color=yellow> QUAN ẤN " .. TenAn1 .. "");
end


