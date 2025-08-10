Require("\\script\\task\\merchant\\merchant_define.lua")
local MerchantNpc = {};

Merchant.Npc = MerchantNpc;
local tbNpc = Npc:GetClass("merchant");
function tbNpc:OnDialog()
		local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local nWeekDay = tonumber(GetLocalDate("%w"));
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	if (nWeekDay == 0) and (nCurTime > 2300 or nCurTime >= 2359) then
	Dialog:Say("Chủ nhật từ 23h00 - 23h59 Hiện không thể nhận nhiệm vụ, hãy quay lại sau 00h nhé !");
	return 
	end
	local tbOpt = {
		{"Giới thiệu nhiệm vụ thương hội", Merchant.Npc.About, Merchant.Npc},
		{"Nhận thư thương hội", Merchant.Npc.GetDervielItem, Merchant.Npc},
		{"Nhận hộp thu thập Lệnh bài thương hội", Merchant.Npc.GetMerchantBox, Merchant.Npc},
		{"<color=gold>Shop lệnh bài thương hội<color>", SpecialEvent.ThuongHoi.OnDialog,SpecialEvent.ThuongHoi},
		-- {"Shop thương hội", Shop.SellItem.OnOpenSell, Shop.SellItem},
		{"Hoàn thành nhanh thương hội\n<color=green>(20 Vạn Đồng)", Merchant.Npc.MuaNhanhThuongHoi, Merchant.Npc},
		--{"Hủy nhiệm vụ thương hội", Merchant.Npc.CancelTask, Merchant.Npc},
		{"Kết thúc đối thoại"},
	}
	local szMsg =  [[Chủ Thương Hội: Giúp ta hoàn thành 40 nhiệm vụ ngươi có thể nhận được rât nhiều bạc và huyền tinh.
	Tham gia nhiệm vụ Thương Hội phải thỏa mãi những điều kiện sau:<color=yellow>
		1. Đạt cấp 60
		2. Uy danh giang hồ đạt 50 điểm.
		3. Mỗi tuần chỉ nhận 1 nhiệm vụ Thương Hội.
		4. Hoàn thành Không Có được Uy Danh
		<color>]]
	Dialog:Say(szMsg, tbOpt);
end

function MerchantNpc:MuaNhanhThuongHoi()
local nGioiHan = me.GetTask(2036,1)
if nGioiHan == 1 then 
	Dialog:Say("Tuần này ngươi đã làm rồi mà")
return 0
end 
local nXacNhan = me.GetTask(2036,2)
if nXacNhan == 0 then 
	Dialog:Say("Ngươi chưa nhận nhiệm vụ tuần này sao mà hoàn thành")
return 0
end 
	local szMsg = "Cần tốn 20 vạn đồng để hoàn thành nhanh\n<color=red>Lưu Ý : Hãy nhận nhiệm vụ thương hội sau đó mới hoàn thành nhanh 40 bước nhiệm vụ\n<color><color=yellow>Sau đó bạn chỉ cần hoàn thành 1 bước là sẽ hoàn tất 40 nhiệm vụ";
	-- local szMsg = "Chọn loại bạn muốn nhận";
	local tbOpt = {
		{"Ta muốn hoàn thành nhanh",self.MuaNhanhThuongHoi_OK,self};
		{"Hiện tại ta chưa muốn"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function MerchantNpc:MuaNhanhThuongHoi_OK()
local nDong = me.GetJbCoin()
if nDong < 20*10000 then 
	Dialog:Say("Bạn chưa đủ 20 vạn đồng thường rồi")
return 
end
local nTaskNhiemVu = me.GetTask(2036,2)
me.SetTask(2036,2,nTaskNhiemVu + 40)
	Dialog:Say("Đã mua nhiệm vụ thành công bạn chỉ cần hoàn thành 1 nhiệm vụ để hoàn nhận thưởng")
	me.AddJbCoin(-20*10000)
end
function MerchantNpc:GetMerchantBox()
	local tbFind1 = me.FindItemInBags(unpack(Merchant.MERCHANT_BOX_ITEM));
	local tbFind2 = me.FindItemInRepository(unpack(Merchant.MERCHANT_BOX_ITEM));
	if #tbFind1 > 0 or #tbFind2 > 0 then
		Dialog:Say("Đã có hộp thu thập lệnh bài Thương Hội.");
		return 0;
	end
	if me.CountFreeBagCell() < 1 then
		Dialog:Say("Hành trang của bạn đã đầy, hãy sắp xếp và thử lại.");
		return 0;
	end
	me.AddItem(unpack(Merchant.MERCHANT_BOX_ITEM));
	Dialog:Say("Bạn nhận được hộp thu thập Lệnh Bài Thương Hội");
end

function MerchantNpc:GetDervielItem()
	
	if Merchant:GetTask(Merchant.TASK_OPEN) == 1 then
		Dialog:Say("Không cần thư Thương Hội.");
		return 0;
	end
	
	if Merchant:GetTask(Merchant.TASK_TYPE) ~= Merchant.TYPE_DELIVERITEM and Merchant:GetTask(Merchant.TASK_TYPE) ~= Merchant.TYPE_DELIVERITEM_NEW then
		Dialog:Say("Không cần thư Thương Hội.");
		return 0;
	end
	
	local tbFind1 = me.FindItemInBags(unpack(Merchant.DERIVEL_ITEM));
	local tbFind2 = me.FindItemInRepository(unpack(Merchant.DERIVEL_ITEM));
	if #tbFind1 > 0 or #tbFind2 > 0 then
		Dialog:Say("Bạn đã có thư Thương Hội.")
		return 0;
	end
	if me.CountFreeBagCell() < 1 then
		Dialog:Say("Hành trang của bạn đã đầy, hãy sắp xếp và thử lại.")
		return 0;
	end	
	me.AddItem(unpack(Merchant.DERIVEL_ITEM));
end

function MerchantNpc:CancelTask()
	Task:CloseTask(Merchant.TASKDATA_ID, "giveup");
	Merchant:SetTask(Merchant.TASK_OPEN, 0);
	Merchant:SetTask(Merchant.TASK_STEP_COUNT, 0);
	Merchant:SetTask(Merchant.TASK_TYPE, 0);
	Merchant:SetTask(Merchant.TASK_STEP, 0);
	Merchant:SetTask(Merchant.TASK_LEVEL, 0);
	Merchant:SetTask(Merchant.TASK_NOWTASK, 0);	
end

function MerchantNpc:About()
	local szMsg = [[Chủ Thương Hội: Giúp ta hoàn thành 40 nhiệm vụ ngươi có thể nhận được rât nhiều bạc và huyền tinh.
	Tham gia nhiệm vụ Thương Hội phải thỏa mãi những điều kiện sau:<color=yellow>
		1. Đạt cấp 60
		2. Uy danh giang hồ đạt 50 điểm.
		3. Hoàn thành nhiệm vụ chính tuyến lv50.
		4. Mỗi tuần chỉ nhận 1 nhiệm vụ Thương Hội.
		<color>
	Nhiệm vụ Thương Hội có các loại sau:<color=yellow>
		1. Đưa thư: Đưa giấy viết thư của Thương Hội đến chỗ người chỉ định (Người Liên Lạc Thương Hội sẽ xuất hiện trong bản đồ chỉ định)
		2. Tìm vật: Thu thập đạo cụ chỉ định cho  Thương Hội (nhận được trong các hoạt động tương ứng)
		3. Sưu tầm: Đến địa điểm chỉ định sưu tầm vật phẩm chỉ định (vật phẩm được quái vật bảo vệ, phải đi cùng tổ đội)
		<color>]]
	Dialog:Say(szMsg);
end

