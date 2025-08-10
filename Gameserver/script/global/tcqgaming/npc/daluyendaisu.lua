
local tbYanLianDaShi = Npc:GetClass("yeliandashi");
-- tbYanLianDaShi.Signet_Max = 501;
function tbYanLianDaShi:OnDialog()
-- DoScript("\\script\\npc\\yeliandashi.lua");
-- DoScript("\\script\\global\\tcqgaming\\npc\\daluyendaisu.lua");

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	
	if me.CountFreeBagCell() < 6 then
	Dialog:Say("Hãy chú ý sắp xếp hành trang có đủ 6 ô trống");
	return 0;
	end	

	-- 剥离选项：by zhangjinpin@kingsoft
	local tbOpt = {
			{"<color=gold>Chuyển cường hóa trang bị<color>", self.CheckPermission, self, {self.chuyencuonghoane, self}},
			{"<color=gold>Tính năng Huy Chương", self.CheckPermission, self, {self.huychuong, self}},
			-- {"<color=gold>Tính năng Lôi Đình Ấn\n<color=green>(Cấp 129 Khai Mở Tính Năng Này)", self.CheckPermission, self, {self.tinhnangloidinhan, self}},
			-- {"Demo", self.CheckPermission, self, {self.tbChuyenCuong, self}},
			{"Cường Hóa Trang Bị", self.CheckPermission, self, {self.SelectMoneyType, self, Item.ENHANCE_MODE_ENHANCE}},
			-- {"Ghép Huyền Tinh", self.CheckPermission, self, {self.SelectMoneyType, self, Item.ENHANCE_MODE_COMPOSE}},
			{"Ghép Huyền Tinh Nhanh", SpecialEvent.GhepHTBacKhoa.OnDialog,SpecialEvent.GhepHTBacKhoa},
            {"Phân giải Huyền Tinh", self.phantachhtne, self},
            -- {"Phân giải Huyền Tinh", self.tachht, self},
			{"Tách Huyền Tinh từ trang bị cao", self.CheckPermission, self, {me.OpenEnhance, Item.ENHANCE_MODE_PEEL, Item.BIND_MONEY}},
			{"Tăng Cấp Ngũ Hành Ấn", self.CheckPermission, self, {me.OpenEnhance, Item.ENHANCE_MODE_UPGRADE, Item.BIND_MONEY}},
			{"Luyện Hóa Trang Bị", self.CheckPermission, self, {me.OpenEnhance, Item.ENHANCE_MODE_REFINE, Item.BIND_MONEY}},
			-- {"Tăng Cấp Ngũ Hành Ấn", self.CheckPermission, self, {self.tangcapnguhanhan, self}},
			{"Sửa Trang bị", self.CheckPermission, self, {self.SelectMoneyType, self, Item.ENHANCE_MODE_STRENGTHEN}},
			{"Để khi khác ta tới"},
		};
		
	local bState = Item.CheckApplyPeelState();
	if bState == 0 then
		table.insert(tbOpt, 6, {"Xin tách Huyền Tinh từ trang bị cao", self.CheckPermission, self, {self.ApplyPeelHighEquip, self}});
	elseif bState == 1 then
		table.insert(tbOpt, 6, {"Ta muốn hủy bỏ tách", self.CheckPermission, self, {self.CancelPeelHighEquip, self}});
	end
	
	Dialog:Say("Cường hóa làm tăng thuộc tính của trang bị,cũng như giúp kích hoạt những thuộc tính ẩn,cấp cường hóa càng cao thuộc tính trang bị càng cao", tbOpt);
end



function tbYanLianDaShi:phantachhtne()
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
        return 0;    
	end

	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local szMsg = "Tiêu tốn <color=purple>bạc khóa và 1 viên Huyền Tinh Cấp Cao nhận 3 Viên HT Nhỏ Hơn<color>\nHãy chọn loại huyền tinh ngươi muốn Phân Tách:";

	local tbOpt = {
		{"Phân Tách <color=purple>Huyền Tinh Cấp 9<color> thành HT8",self.tachht9tcq,self};
		{"Phân Tách <color=purple>Huyền Tinh Cấp 10<color> thành HT9",self.tachht10tcq,self};
		{"Phân Tách <color=purple>Huyền Tinh Cấp 11<color> thành HT10",self.tachht11tcq,self};
		{"Phân Tách <color=purple>Huyền Tinh Cấp 12<color> thành HT11",self.tachht12tcq,self};
		{"Kết thúc đối thoại"},
	};
	
	Dialog:Say(szMsg,tbOpt);
end

function tbYanLianDaShi:tachht9tcq()
	local szMsg = "Phân Tách Toàn Bộ HT9 Chứ ";

	local tbOpt = {
		{"Phân giải <color=yellow>Tất Cả Huyền Tinh Cấp 9<color>",self.HuyenTinh9tach,self};
		{"Phân giải <color=yellow>1 Huyền Tinh Cấp 9<color>",self.tach9,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbYanLianDaShi:tachht10tcq()
	local szMsg = "Phân Tách Toàn Bộ HT10 Chứ ";

	local tbOpt = {
		{"Phân giải <color=yellow>Tất Cả Huyền Tinh 10",self.HuyenTinh10tach,self};
		{"Phân giải <color=yellow>1 Huyền Tinh Cấp 10<color>",self.tach10,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbYanLianDaShi:tachht11tcq()
	local szMsg = "Phân Tách Toàn Bộ HT11 Chứ ";

	local tbOpt = {
		{"Phân giải <color=yellow>Tất Cả Huyền Tinh 11",self.HuyenTinh11tach,self};
				{"Phân giải <color=yellow>1 Huyền Tinh Cấp 11<color>",self.tach11,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbYanLianDaShi:tachht12tcq()
	local szMsg = "Phân Tách Toàn Bộ HT11 Chứ ";

	local tbOpt = {
		{"Phân giải <color=yellow>Tất Cả Huyền Tinh 12",self.HuyenTinh12tach,self};
				{"Phân giải <color=yellow>1 Huyền Tinh Cấp 12<color>",self.tach12,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbYanLianDaShi:HuyenTinh9tach()
    local nCapHuyenTinhBanDau = 9;
    local nCapHuyenTinhBanDauTinhPhanTach = 8;
    local nSoBacKhoa = 240000;
    local nHtkhoa = me.GetItemCountInBags(18, 1, 114, nCapHuyenTinhBanDau)
    local nKokhoa = me.GetItemCountInBags(18, 1, 1, nCapHuyenTinhBanDau) 
    local nCount = nHtkhoa + nKokhoa;
    if nCount < 1 then
        Dialog:Say("Không đủ 1 Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " để tách");
        return 0;
    end

    local nCheck = 3
	local nSoLuongNe = nCheck * nCount

    if me.CountFreeBagCell() < nSoLuongNe then
        Dialog:Say("Không đủ không gian "..nSoLuongNe.." ô trong hành trang");
        return 0;
    end

    local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = nSoBacKhoa * nCount;

    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Rã " .. nCount .. " Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " cần " .. nRequiredMoney / 10000 .. " Vạn Bạc khóa");
        return 0;
    end

    me.CostBindMoney(nRequiredMoney, 0);

    local nHuyenTinh = nCheck * 1;
    local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
    local tbItemId1 = {18, 1, 114, nCapHuyenTinhBanDau, 0, 0}; 
    local tbItemId2 = {18, 1, 1, nCapHuyenTinhBanDau, 0, 0};
if nHtkhoa > 0 then 
    Task:DelItem(me, tbItemId1, nHtkhoa);
end 
if nKokhoa > 0 then 
    Task:DelItem(me, tbItemId2, nKokhoa);
end 
    me.AddStackItem(18, 1, 114, nCapHuyenTinhBanDauTinhPhanTach, nil, nCount * 3);

    me.Msg("Tách Thành Công Tiêu hao : <color=gold>" .. nCount .. " Huyền Tinh <color>" .. nCapHuyenTinhBanDau .. " và <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> nhận được : <color=gold>" .. nSoLuongNe .. " Huyền Tinh " .. nCapHuyenTinhBanDauTinhPhanTach .. " ");
    self:phantachhtne();
end

function tbYanLianDaShi:HuyenTinh10tach()
    -- Số lượng cần phân rã
    local nCapHuyenTinhBanDau = 10;
    local nCapHuyenTinhBanDauTinhPhanTach = 9;
    local nSoBacKhoa = 850000;
    local nHtkhoa = me.GetItemCountInBags(18, 1, 114, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nKokhoa = me.GetItemCountInBags(18, 1, 1, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nCount = nHtkhoa + nKokhoa;

    -- Kiểm tra xem có đủ ít nhất 3 mảnh Huyền Tinh cấp 9 không
    if nCount < 1 then
        Dialog:Say("Không đủ 1 Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " để tách");
        return 0;
    end

    -- Tính toán số lượng Huyền Tinh cấp 8 cần được tạo ra
    local nCheck = 3
	local nSoLuongNe = nCheck * nCount
    -- Kiểm tra xem người chơi có đủ vị trí trống trong hành trang không
    if me.CountFreeBagCell() < nSoLuongNe then
        Dialog:Say("Không đủ không gian "..nSoLuongNe.." ô trong hành trang");
        return 0;
    end

    -- Kiểm tra số lượng Bạc khóa cần cho phân rã
    local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = nSoBacKhoa * nCount;

    -- Kiểm tra xem có đủ Bạc khóa không
    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Rã " .. nCount .. " Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " cần " .. nRequiredMoney / 10000 .. " Vạn Bạc khóa");
        return 0;
    end

    -- Trừ tiền
    me.CostBindMoney(nRequiredMoney, 0);

    -- Xử lý phân rã
    local nHuyenTinh = nCheck * 1;
    local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
    local tbItemId1 = {18, 1, 114, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc
    local tbItemId2 = {18, 1, 1, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc

    -- Loại bỏ mảnh Huyền Tinh cấp 9
    Task:DelItem(me, tbItemId1, nHtkhoa);
    Task:DelItem(me, tbItemId2, nKokhoa);

    -- Thêm mảnh Huyền Tinh cấp 8 vào hành trang
    me.AddStackItem(18, 1, 114, nCapHuyenTinhBanDauTinhPhanTach, nil, nCount * 3);

    -- Thông báo thành công
    me.Msg("Tách Thành Công Tiêu hao : <color=gold>" .. nCount .. " Huyền Tinh <color>" .. nCapHuyenTinhBanDau .. " và <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> nhận được : <color=gold>" .. nSoLuongNe .. " Huyền Tinh " .. nCapHuyenTinhBanDauTinhPhanTach .. " ");
    self:phantachhtne();
end

function tbYanLianDaShi:HuyenTinh11tach()
    -- Số lượng cần phân rã
    local nCapHuyenTinhBanDau = 11;
    local nCapHuyenTinhBanDauTinhPhanTach = 10;
    local nSoBacKhoa = 3000000;
    local nHtkhoa = me.GetItemCountInBags(18, 1, 114, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nKokhoa = me.GetItemCountInBags(18, 1, 1, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nCount = nHtkhoa + nKokhoa;

    -- Kiểm tra xem có đủ ít nhất 3 mảnh Huyền Tinh cấp 9 không
    if nCount < 1 then
        Dialog:Say("Không đủ 1 Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " để tách");
        return 0;
    end

    -- Tính toán số lượng Huyền Tinh cấp 8 cần được tạo ra
    local nCheck = 3
	local nSoLuongNe = nCheck * nCount
    -- Kiểm tra xem người chơi có đủ vị trí trống trong hành trang không
    if me.CountFreeBagCell() < nSoLuongNe then
        Dialog:Say("Không đủ không gian "..nSoLuongNe.." ô trong hành trang");
        return 0;
    end

    -- Kiểm tra số lượng Bạc khóa cần cho phân rã
    local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = nSoBacKhoa * nCount;

    -- Kiểm tra xem có đủ Bạc khóa không
    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Rã " .. nCount .. " Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " cần " .. nRequiredMoney / 10000 .. " Vạn Bạc khóa");
        return 0;
    end

    -- Trừ tiền
    me.CostBindMoney(nRequiredMoney, 0);

    -- Xử lý phân rã
    local nHuyenTinh = nCheck * 1;
    local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
    local tbItemId1 = {18, 1, 114, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc
    local tbItemId2 = {18, 1, 1, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc

    -- Loại bỏ mảnh Huyền Tinh cấp 9
    Task:DelItem(me, tbItemId1, nHtkhoa);
    Task:DelItem(me, tbItemId2, nKokhoa);

    -- Thêm mảnh Huyền Tinh cấp 8 vào hành trang
    me.AddStackItem(18, 1, 114, nCapHuyenTinhBanDauTinhPhanTach, nil, nCount * 3);

    -- Thông báo thành công
    me.Msg("Tách Thành Công Tiêu hao : <color=gold>" .. nCount .. " Huyền Tinh <color>" .. nCapHuyenTinhBanDau .. " và <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> nhận được : <color=gold>" .. nSoLuongNe .. " Huyền Tinh " .. nCapHuyenTinhBanDauTinhPhanTach .. " ");
    self:phantachhtne();
end

function tbYanLianDaShi:HuyenTinh12tach()
    -- Số lượng cần phân rã
    local nCapHuyenTinhBanDau = 12;
    local nCapHuyenTinhBanDauTinhPhanTach = 11;
    local nSoBacKhoa = 11000000;
    local nHtkhoa = me.GetItemCountInBags(18, 1, 114, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nKokhoa = me.GetItemCountInBags(18, 1, 1, nCapHuyenTinhBanDau) -- Mảnh ghép chúc phúc
    local nCount = nHtkhoa + nKokhoa;

    -- Kiểm tra xem có đủ ít nhất 3 mảnh Huyền Tinh cấp 9 không
    if nCount < 1 then
        Dialog:Say("Không đủ 1 Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " để tách");
        return 0;
    end

    -- Tính toán số lượng Huyền Tinh cấp 8 cần được tạo ra
    local nCheck = 3
	local nSoLuongNe = nCheck * nCount
    -- Kiểm tra xem người chơi có đủ vị trí trống trong hành trang không
    if me.CountFreeBagCell() < nSoLuongNe then
        Dialog:Say("Không đủ không gian "..nSoLuongNe.." ô trong hành trang");
        return 0;
    end

    -- Kiểm tra số lượng Bạc khóa cần cho phân rã
    local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = nSoBacKhoa * nCount;

    -- Kiểm tra xem có đủ Bạc khóa không
    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Rã " .. nCount .. " Huyền Tinh cấp " .. nCapHuyenTinhBanDau .. " cần " .. nRequiredMoney / 10000 .. " Vạn Bạc khóa");
        return 0;
    end

    -- Trừ tiền
    me.CostBindMoney(nRequiredMoney, 0);

    -- Xử lý phân rã
    local nHuyenTinh = nCheck * 1;
    local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
    local tbItemId1 = {18, 1, 114, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc
    local tbItemId2 = {18, 1, 1, nCapHuyenTinhBanDau, 0, 0}; -- Mảnh ghép chúc phúc

    -- Loại bỏ mảnh Huyền Tinh cấp 9
    Task:DelItem(me, tbItemId1, nHtkhoa);
    Task:DelItem(me, tbItemId2, nKokhoa);

    -- Thêm mảnh Huyền Tinh cấp 8 vào hành trang
    me.AddStackItem(18, 1, 114, nCapHuyenTinhBanDauTinhPhanTach, nil, nCount * 3);

    -- Thông báo thành công
    me.Msg("Tách Thành Công Tiêu hao : <color=gold>" .. nCount .. " Huyền Tinh <color>" .. nCapHuyenTinhBanDau .. " và <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> nhận được : <color=gold>" .. nSoLuongNe .. " Huyền Tinh " .. nCapHuyenTinhBanDauTinhPhanTach .. " ");
    self:phantachhtne();
end




function tbYanLianDaShi:tinhnangloidinhan() 
if me.nLevel < 120 then
			Dialog:Say("Bạn chưa đạt cấp 120 , Cấp 120 mới có thể mở");
			return 
end
	local szMsg = "Ngươi gặp ta hỏi gì ?<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"<color=gold>Chuyển Cường Nhược Hóa Từ Ngũ Hành Ấn Sang Lôi Đình Ấn <color>",SpecialEvent.tbChuyenThuocTinhAn.OnDialog,SpecialEvent.tbChuyenThuocTinhAn};
		{"<color=gold>Đổi Lôi Đình Ấn",self.doiloidinhanne,self};
		{"<color=gold>Đổi Cờ Chiến Công",self.DoiCoChienCongAn,self};
		{"<color=gold>Tăng Cấp Lôi Đình Ấn<color>",SpecialEvent.tbMainLoiDinhAnTangCap.OnDialog,SpecialEvent.tbMainLoiDinhAnTangCap};
		{"<color=gold>Nâng Cấp Lôi Đình Ấn<color>",SpecialEvent.tbMainLoiDinhAn.OnDialog,SpecialEvent.tbMainLoiDinhAn};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbYanLianDaShi:DoiCoChienCongAn()
	local szMsg = "Công thức đổi Cờ Chiến Công\n1 <color=yellow>Huyền Tinh Cấp 8<color=green>\n(2 Cờ Chiến Công)<color>";
	local tbOpt = {
		{"<color=yellow>Đồng Ý",self.doicothoi,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbYanLianDaShi:doicothoi()
	local szMsg = "Ta muốn đổi :"
	local tbOpt = {
		{"<color=yellow>Đổi hết huyền tinh 8",self.doicothoiht8,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbYanLianDaShi:doicothoiht8()
local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 8 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*2
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2032,11,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Cờ Chiến Công<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 8<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*2
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2032,11,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Cờ Chiến Công<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 8<color><color>");
end
end


function tbYanLianDaShi:doiloidinhanne()
Dialog : OpenGift("Hãy đặt vào <color=yellow>100 Mảnh Lôi Đình Ấn<color>, ta sẽ đổi cho ngươi 1 <color=yellow>Lôi Đình Ấn<color> hoàn chỉnh.", nil ,{self.doiloidinhanne1, self});
end


function tbYanLianDaShi : doiloidinhanne1(tbItemObj)
local nCount = 0;
for _, pItem in pairs(tbItemObj) do
local szItem = string.format("%s,%s,%s,%s",pItem[1].nGenre, pItem[1].nDetail, pItem[1].nParticular, pItem[1].nLevel);
if "18,1,2032,10" ~= szItem then
Dialog : Say("Vật phẩm đặt vào không đúng, hãy đặt Mảnh Lôi Đình Ấn.");
return 0;
end;
nCount = nCount + pItem[1].nCount;
end
if nCount ~= 100 then
Dialog : Say("Số lượng đặt vào không đúng, hãy đặt 100 Mảnh Lôi Đình Ấn.");
return 0;
end
for _, pItem in pairs(tbItemObj) do
if me.DelItem(pItem[1]) ~= 1 then
return 0;
end
end
me.AddItem(1,16,29,10);
Dbg : WriteLog("Người chơi ["..me.szName.."] đổi được Lôi Đình Ấn.");
return 1;
end

function tbYanLianDaShi:huychuong() 
-- if me.nLevel < 119 then
			-- Dialog:Say("Bạn chưa đạt cấp 119 , Cấp 119 mới có thể mở");
			-- return 
-- end
	local szMsg = "Ngươi gặp ta hỏi gì ?<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		-- {"<color=yellow>Đổi Sao Chiến Tích",self.doisaone,self};
		{"<color=gold>Nhận Huy Chương - Hắc Thiết",self.nhanhuychuong,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbYanLianDaShi:doisaone()
	local szMsg = "Công thức đổi Sao Chiến Tích\n1 <color=yellow>Huyền Tinh Cấp 6<color=green>\n(2 Sao Chiến Tích)<color>\n1 Huyền Tinh Cấp 7 <color=green>\n(6 Sao Chiến Tích)<color>\n1 Huyền Tinh Cấp 8 <color=green>\n(18 Sao Chiến Tích)<color>\n1 Huyền Tinh Cấp 9 <color=green>\n(54 Sao Chiến Tích)\n<color>1 Huyền Tinh Cấp 10 <color=green>\n(162 Sao Chiến Tích)<color>\n1 Huyền Tinh Cấp 11 <color=green>\n(486 Sao Chiến Tích)<color>\n1 Huyền Tinh Cấp 12 <color=green>\n(1458 Sao Chiến Tích)<color>";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"<color=yellow>Đồng Ý",self.doisaothoi,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbYanLianDaShi:doisaothoi()
	local szMsg = "Ta muốn đổi :"
	local tbOpt = {
		{"<color=yellow>Đổi hết huyền tinh 6",self.doisaoht6,self};
		{"<color=yellow>Đổi hết huyền tinh 7",self.doisaoht7,self};
		{"<color=yellow>Đổi hết huyền tinh 8",self.doisaoht8,self};
		{"<color=yellow>Đổi hết huyền tinh 9",self.doisaoht9,self};
		{"<color=yellow>Đổi hết huyền tinh 10",self.doisaoht10,self};
		{"<color=yellow>Đổi hết huyền tinh 11",self.doisaoht11,self};
		{"<color=yellow>Đổi hết huyền tinh 12",self.doisaoht12,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbYanLianDaShi:doisaoht6()
local tbHuyenTinh	= {18,1,114,6}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,6}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,6) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,6) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 6 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*2
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 6<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*2
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 6<color><color>");
end
end

function tbYanLianDaShi:doisaoht7()
local tbHuyenTinh	= {18,1,114,7}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,7}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,7) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,7) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 7 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*6
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 7<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*6
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 7<color><color>");
end
end

function tbYanLianDaShi:doisaoht8()
local tbHuyenTinh	= {18,1,114,8}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,8}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,8) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,8) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 8 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*18
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 8<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*18
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 8<color><color>");
end
end

function tbYanLianDaShi:doisaoht9()
local tbHuyenTinh	= {18,1,114,9}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,9}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,9) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,9) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 9 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*54
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 9<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*54
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 9<color><color>");
end
end

function tbYanLianDaShi:doisaoht10()
local tbHuyenTinh	= {18,1,114,10}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,10}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,10) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,10) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 10 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*162
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 10<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*162
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 10<color><color>");
end
end

function tbYanLianDaShi:doisaoht11()
local tbHuyenTinh	= {18,1,114,11}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,11}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,11) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,11) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 11 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*486
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 11<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*486
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 11<color><color>");
end
end

function tbYanLianDaShi:doisaoht12()
local tbHuyenTinh	= {18,1,114,12}; -- Huyền Tinh 7
local tbHuyenTinh1	= {18,1,1,12}; -- Huyền Tinh 7
local nSoLuongHT = me.GetItemCountInBags(18,1,114,12) -- Huyền Tinh 9
local nSoLuongHT1 = me.GetItemCountInBags(18,1,1,12) -- Huyền Tinh 9
local tbItemInfo = {bForceBind=1,};
    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	if (nSoLuongHT < 1) and (nSoLuongHT1 < 1) then 
		Dialog:Say("<color=yellow>Bạn không mang theo Huyền Tinh 12 rồi xin hãy kiểm tra lại"); 
	return 0;
	end

if nSoLuongHT >= 1 then
local nSoSao = nSoLuongHT*1458
Task:DelItem(me, tbHuyenTinh, nSoLuongHT);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT.." Huyền Tinh 12<color><color>");
elseif nSoLuongHT1 >= 1 then
local nSoSao = nSoLuongHT1*1458
Task:DelItem(me, tbHuyenTinh1, nSoLuongHT1);
    me.AddStackItem(18,1,2028,7,tbItemInfo,nSoSao);
	me.Msg("Đổi thành công <color=purple>"..nSoSao.." Sao Chiến Tích<color>, tiêu hao <color=purple>"..nSoLuongHT1.." Huyền Tinh 12<color><color>");
end
end

function tbYanLianDaShi:nhanhuychuong()
local nGioiHan = me.GetTask(9163,1)
local tbItemInfo = {bForceBind=1,};
-- if me.nLevel < 119 then
	-- Dialog:Say(string.format("Bạn chưa đạt cấp 119"));
	-- return 0;
-- end
if nGioiHan >= 1 then
	Dialog:Say("<color=yellow>Bạn đã nhận Huy Chương Hắc Thiết rồi xin hãy kiểm tra lại"); 
return 0;
end
me.SetTask(9163,1, nGioiHan + 1);
me.AddFightSkill(1992, 1);---Kỹ năng huy chương
me.AddStackItem(18,1,2028,1,tbItemInfo,1);----Hắc thiết
end

function tbYanLianDaShi:chuyencuonghoane()

	if me.CountFreeBagCell() < 3 then
	Dialog:Say("Hãy chú ý sắp xếp hành trang có đủ 3 ô trống");
	return 0;
	end	
	local nCount = me.GetTask(3028,1)
	if nCount < 500 then
	Dialog:Say("Tính năng này chỉ dành cho người chơi đạt mốc tích lũy rút <color=cyan>500 vạn đồng<color> trở lên");
	return 0;
	end
			local nCount1 = me.GetTask(3130,1)
		if nCount1 < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
	-- local pItem = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_WEAPON, 0);
	-- if not pItem then
		-- Dialog:Say("Ngươi chưa trang bị <color=yellow>Vũ Khí<color> lên người, không thể chuyển");
		-- return 0;
	-- end  
		-- local szItemName = pItem.szName;
		-- local Lever = pItem.nEnhTimes;
		-- if Lever > 1 then 
				-- Dialog:Say("<color=yellow>Trang bị đích của ngươi hiện tại là \n+ "..Lever.."\nhãy mang trang bị chưa cường hóa rồi tới đây tìm ta");
				-- return 0 
				-- end
				 
		
		local szMsg = "Lượt rút Cường Hóa của bạn còn: <color=cyan>"..nCount1.."<color>\n<color=yellow>Chuyển Cường Hóa<color>\nHãy đặt trang bị +1 trở lên\n<color=yellow>Hệ thống sẽ giúp bạn chuyển sang trang bị đích";
	local tbOpt = 
	{
		{"<color=gold>Vũ Khí<color>",SpecialEvent.tbChuyenVuKhi.OnDialog,SpecialEvent.tbChuyenVuKhi};
		{"<color=gold>Áo<color>",SpecialEvent.tbChuyenAo.OnDialog,SpecialEvent.tbChuyenAo};
		{"<color=gold>Nón<color>",SpecialEvent.tbChuyenNon.OnDialog,SpecialEvent.tbChuyenNon};
		{"<color=gold>Đai Lưng<color>",SpecialEvent.tbChuyenDai.OnDialog,SpecialEvent.tbChuyenDai};
		{"<color=gold>Hộ Uyển<color>",SpecialEvent.tbChuyenTay.OnDialog,SpecialEvent.tbChuyenTay};
		{"<color=gold>Giày<color>",SpecialEvent.tbChuyenGiay.OnDialog,SpecialEvent.tbChuyenGiay};
		{"<color=gold>Hạng Liên<color>",SpecialEvent.tbChuyenLien.OnDialog,SpecialEvent.tbChuyenLien};
		{"<color=gold>Giới Chỉ<color>",SpecialEvent.tbChuyenNhan.OnDialog,SpecialEvent.tbChuyenNhan};
		{"<color=gold>Ngọc Bội<color>",SpecialEvent.tbChuyenBoi.OnDialog,SpecialEvent.tbChuyenBoi};
		{"<color=gold>Hộ Phù<color>",SpecialEvent.tbChuyenPhu.OnDialog,SpecialEvent.tbChuyenPhu};
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbYanLianDaShi:tangcapnguhanhan()
	local szMsg = "Trang bị Ngũ Hành Ấn lên F1 trước khi tiến hành tăng cấp\n\n<color=gold>Ký hiệu:<color>\n- NHHT = Ngũ Hành Hồn Thạch\n<color=gold>Tỷ lệ cường hóa:<color>\n- 1 Điểm Cường Hóa = 80 NHHT";
	local tbOpt = 
	{
		{"Cường Hóa Ngũ Hành Ấn (Dòng 1)",self.CuongHoa,self};
		{"Nhược Hóa Ngũ Hành Ấn (Dòng 2)",self.NhuocHoa,self};
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbYanLianDaShi:NhuocHoa()
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
	-- local tbYanLianDaShi.nDiemAn = 0
if me.nLevel >= 69 then
	tbYanLianDaShi.nDiemAn = 300
	end
if me.nLevel >= 79 then
	tbYanLianDaShi.nDiemAn = 600
	end
if me.nLevel >= 89 then
	tbYanLianDaShi.nDiemAn = 1000
end
	local szMsg = "";
	szMsg = szMsg .. string.format("Đằng cấp hiện tại của bạn là "..me.nLevel.." có thể Cường/Nhược Hóa đến <color=yellow>%s điểm<color><enter>Lựa chọn số điểm muốn Nhược Hóa Ngũ Hành Ấn:",tbYanLianDaShi.nDiemAn);
	local tbOpt = 
	{
		{"Nhược Hóa +100 điểm = 8000 NHHT",self.AnNhuocHoa100,self,2},
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end
-- end
--------------------------------------------------------------------------------
function tbYanLianDaShi:AnNhuocHoa100(nMagicIndex)
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
	
	local nCount1 = me.GetItemCountInBags(18,1,205,1) -- Ngũ hành hồn thạch
	if nCount1 < 8000 then
		Dialog:Say("Trong hành trang không đủ <color=red>8000 Ngũ Hành Hồn Thạch<color> yêu cầu");
		return 0;
	end
if me.nLevel >= 69 then
	tbYanLianDaShi.nDiemAn = 300
	end
if me.nLevel >= 79 then
	tbYanLianDaShi.nDiemAn = 600
	end
if me.nLevel >= 89 then
	tbYanLianDaShi.nDiemAn = 1000
end
	
	local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
	if nLevel >= tbYanLianDaShi.nDiemAn then
		Dialog:Say("Ấn đã thăng cấp tối đa.");
		return 0;
	end	
	local tbItemId1	= {18,1,205,1,0,0};
	Task:DelItem(me, tbItemId1, 8000);
	nLevel = nLevel + 100;
	Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
	Dialog:Say("<color=yellow>Nhược Hóa - Ngũ Hành Ấn<color> thành công <color=yellow>100 điểm<color>");
end

function tbYanLianDaShi:CuongHoa()
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
	-- local solan = 100
if me.nLevel >= 69 then
	tbYanLianDaShi.nDiemAn = 300
	end
if me.nLevel >= 79 then
	tbYanLianDaShi.nDiemAn = 600
	end
if me.nLevel >= 89 then
	tbYanLianDaShi.nDiemAn = 1000
end
	-- local nMax = self.nDiemAn;
	local szMsg = "";
	szMsg = szMsg .. string.format("Đằng cấp hiện tại của bạn là "..me.nLevel.." có thể Cường/Nhược Hóa đến <color=yellow>%s điểm<color><enter>Lựa chọn số điểm muốn Cường Hóa Ngũ Hành Ấn:",tbYanLianDaShi.nDiemAn);
	local tbOpt = 
	{
		{"Cường Hóa +100 điểm = 8000 NHHT",self.CuongHoa100,self,1},
		{"Ta chưa muốn"},
	};
Dialog:Say(szMsg,tbOpt)
end

function tbYanLianDaShi:CuongHoa100(nMagicIndex)
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
	
	local nCount1 = me.GetItemCountInBags(18,1,205,1) -- Ngũ hành hồn thạch
	if nCount1 < 8000 then
		Dialog:Say("Trong hành trang không đủ <color=red>8000 Ngũ Hành Hồn Thạch<color> yêu cầu");
		return 0;
	end
if me.nLevel >= 69 then
	tbYanLianDaShi.nDiemAn = 300
	end
if me.nLevel >= 79 then
	tbYanLianDaShi.nDiemAn = 600
	end
if me.nLevel >= 89 then
	tbYanLianDaShi.nDiemAn = 1000
end
	-- local nMax = self.nDiemAn;
	local nLevel 	= pSignet.GetGenInfo(nMagicIndex * 2 - 1, 0);
	if nLevel >= tbYanLianDaShi.nDiemAn then
		Dialog:Say("Ấn đã thăng cấp tối đa.");
		return 0;
	end	
	local tbItemId1	= {18,1,205,1,0,0};
	Task:DelItem(me, tbItemId1, 8000);
	nLevel = nLevel + 100;
	Item:SetSignetMagic(pSignet, nMagicIndex, nLevel, 0);
	Dialog:Say("<color=yellow>Cường Hóa - Ngũ Hành Ấn<color> thành công <color=yellow>100 điểm<color>");
end


function tbYanLianDaShi:tach9()
	local nSoBacKhoa = 240000 / 10000
    Dialog:OpenGift("Công Thức Cho Vào 1 Viên 9:<enter>100% nhận được <color=yellow><enter>3 huyền tinh 8<color>\n<color=red>Tốn <color> "..nSoBacKhoa.."<color=red> Vạn Bạc Khóa", nil ,{self.OnTach9, self});
end

function tbYanLianDaShi:OnTach9(tbItemObj)
    local HuyenTinh9tach = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= HuyenTinh9tach and szKeyy ~= huyentinhk then 
    Dialog:Say("Item đặt vào sai quy định, không thao tác được", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = 240000;

    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Tách 1 Viên HT9 Cần Phải Có <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> Bạc Khóa ");
        return 0;
    end
	
    if nCount ~= 1 then 
    Dialog:Say("Số lượng đặt vào sai cấu trúc, dừng thao tác", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
	me.CostBindMoney(nRequiredMoney, 0);
    me.AddStackItem(18,1,114,8,tbItemInfo,3);
    self:tachht9tcq();
        return 1;
end

function tbYanLianDaShi:tach10()
local nSoBacKhoa = 850000 / 10000
    Dialog:OpenGift("Công Thức Cho Vào 1 Viên 10:<enter>100% nhận được <color=yellow><enter>3 huyền tinh 9<color>\n<color=red>Tốn <color> "..nSoBacKhoa.."<color=red> Vạn Bạc Khóa", nil ,{self.OnTach10, self});
end

function tbYanLianDaShi:tach11()
local nSoBacKhoa = 3000000 / 10000
    Dialog:OpenGift("Công Thức Cho Vào 1 Viên 11:<enter>100% nhận được <color=yellow><enter>3 huyền tinh 10<color>\n<color=red>Tốn <color> "..nSoBacKhoa.."<color=red> Vạn Bạc Khóa", nil ,{self.OnTach11, self});
end

function tbYanLianDaShi:tach12()
local nSoBacKhoa = 11000000 / 10000
    Dialog:OpenGift("Công Thức Cho Vào 1 Viên 12:<enter>100% nhận được <color=yellow><enter>3 huyền tinh 11<color>\n<color=red>Tốn <color> "..nSoBacKhoa.."<color=red> Vạn Bạc Khóa", nil ,{self.OnTach12, self});
end

function tbYanLianDaShi:OnTach12(tbItemObj)
    local HuyenTinh9tach = "18,1,1,12"; 
    local huyentinhk = "18,1,114,12"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= HuyenTinh9tach and szKeyy ~= huyentinhk then 
    Dialog:Say("Item đặt vào sai quy định, không thao tác được", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 1 then 
    Dialog:Say("Số lượng đặt vào sai cấu trúc, dừng thao tác", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
			  local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = 11000000;

    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Tách 1 Viên HT12 Cần Phải Có <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> Bạc Khóa ");
        return 0;
    end

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
				me.CostBindMoney(nRequiredMoney, 0);
    me.AddStackItem(18,1,114,11,tbItemInfo,3);
    self:tachht12tcq();
        return 1;
end

function tbYanLianDaShi:OnTach11(tbItemObj)
    local HuyenTinh9tach = "18,1,1,11"; 
    local huyentinhk = "18,1,114,11"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= HuyenTinh9tach and szKeyy ~= huyentinhk then 
    Dialog:Say("Item đặt vào sai quy định, không thao tác được", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 1 then 
    Dialog:Say("Số lượng đặt vào sai cấu trúc, dừng thao tác", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
		  local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = 3000000;

    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Tách 1 Viên HT11 Cần Phải Có <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> Bạc Khóa ");
        return 0;
    end

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
			me.CostBindMoney(nRequiredMoney, 0);
    me.AddStackItem(18,1,114,10,tbItemInfo,3);
    self:tachht11tcq();
        return 1;
end
function tbYanLianDaShi:OnTach10(tbItemObj)
    local HuyenTinh9tach = "18,1,1,10"; 
    local huyentinhk = "18,1,114,10"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= HuyenTinh9tach and szKeyy ~= huyentinhk then 
    Dialog:Say("Item đặt vào sai quy định, không thao tác được", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 1 then 
    Dialog:Say("Số lượng đặt vào sai cấu trúc, dừng thao tác", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
	  local nMyMoney = me.GetBindMoney();
    local nRequiredMoney = 850000;

    if nMyMoney < nRequiredMoney then
        Dialog:Say("Để Phân Tách 1 Viên HT10 Cần Phải Có <color=gold>" .. nRequiredMoney / 10000 .. " Vạn Bạc khóa<color> Bạc Khóa ");
        return 0;
    end

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
		me.CostBindMoney(nRequiredMoney, 0);
    me.AddStackItem(18,1,114,9,tbItemInfo,3);
    self:tachht10tcq();
        return 1;
end

function tbYanLianDaShi:SelectMoneyType(nMode)
	local szMsg = "Lựa chọn"
	if nMode == Item.ENHANCE_MODE_ENHANCE then
		szMsg = "Bạn muốn nhận bạc?"
	elseif nMode == Item.ENHANCE_MODE_STRENGTHEN then
		szMsg = "Bạn muốn nhận bạc?"	
	else
		szMsg = "Bạn muốn nhận bạc?"	
	end
	
	Dialog:Say(szMsg,
		{
			{"Bạc Khóa", me.OpenEnhance, nMode, Item.BIND_MONEY},
			{"Bạc Thường", me.OpenEnhance, nMode, Item.NORMAL_MONEY},
			{"Ta chỉ ghé ngang qua"},
		});
end

function tbYanLianDaShi:CheckPermission(tbOption)
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
		return;
	end
	Lib:CallBack(tbOption);
end

-- 申请装备剥离
function tbYanLianDaShi:ApplyPeelHighEquip()	
	local szMsg = "Tách trang bị cường hóa cao là việc khó khăn,ta cần chuẩn bị <color=red>(3 giờ)<color>，Sau thời gian đó hãy quay lại gặp ta. Nếu quá 6 giờ mà ngươi không quay lại thì hãy xin tách lại và đợi thêm 3 giờ nữa ~~!";
	local tbOpt = {
			{"Tôi muốn tách Huyền Tinh", Item.ApplyPeelHighEquipSure, Item},
			{"Hủy bỏ"}
		};
	Dialog:Say(szMsg, tbOpt);	
end

-- 取消装备剥离
function tbYanLianDaShi:CancelPeelHighEquip()
	local szMsg = "Bạn muốn thực hiện tách Huyền Tinh?";
	local tbOpt = {
			{"Có", Item.CancelPeelHighEquipSure, Item},
			{"Không"}
		};	
	Dialog:Say(szMsg, tbOpt);	
end

	
	
