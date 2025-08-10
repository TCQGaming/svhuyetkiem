
local tbNpc = Npc:GetClass("jipinshangren");
function tbNpc:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\thuonggiatieudao.lua");
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản của bạn bị khóa, không thể thực hiện thao tác này!");
		return;
	end
		local nMoTieuDuLong = ConfigAll.TieuDuLong

	local szMsg = "Nhắc đến Tiêu Dao Cốc, đó quả là tiên cảnh giữa cõi người! Không biết thiếu hiệp có từng đến đó chưa? Ai da, lạc đề rồi, lạc đề rồi….. Thiếu hiệp có muốn xem thử trang bị cực phẩm thế gian hiếm có không?"
	    local tbOpt =     {} 
			if nMoTieuDuLong == 1 then 
				table.insert(tbOpt, {"Mua <color=yellow>Tiểu Du Long Lệnh<color>",self.tieudulong,self});
			end 
				table.insert(tbOpt, {"<color=yellow>Trang bị Danh vọng hoạt động Thịnh Hạ",self.thinhha,self});
				table.insert(tbOpt, {"<color=yellow>Trang Bị Danh Vọng Chúc Phúc",self.chucphuc,self});
				table.insert(tbOpt, {"<color=yellow>Giày hoạt động Đoàn Viên",self.doanvien,self});
				table.insert(tbOpt, {"<color=yellow>Mua Hộ uyển Di Tích Hàn Vũ",self.hanvu,self});
				table.insert(tbOpt, {"<color=yellow>Tiệm nhẫn",self.tiemnhan,self});
				table.insert(tbOpt, {"<color=yellow>Trang bị danh vọng liên đấu",self.shopliendau,self});
				table.insert(tbOpt, {"<color=yellow>Tiệm Bội Chiến Thần",self.tiemboichienthan,self});
				table.insert(tbOpt, {"<color=yellow>Trang bị tranh đoạt lãnh thổ",self.tranhdoatlanhtho,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbNpc:tieudulong()
	local tbOpt = {
			{"<color=yellow>Tiểu Du Long [Nón] ", self.tieudulongnon, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Y phục] ", self.tieudulongao, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Yêu đái] ", self.tieudulongdailung, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Giày] ", self.tieudulonggiay, self},
			-- {"<color=yellow>Tiểu Du Long Lệnh [Hạng liên] ", self.thinhha, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Nhẫn]", self.tieudulongnhan, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Hộ uyển]", self.tieudulongbaotay, self},
			{"<color=yellow>Tiểu Du Long Lệnh [Ngọc bội]", self.tieudulongngocboi, self},
			{"<color=yellow>Tiểu Du Long [Hộ thân phù] ", self.tieudulonghtp, self},

			{"Kết thúc đối thoại"},
		};
	Dialog:Say(me.szName.."，Các loại tiểu du long lệnh tốn 1000 Tiền Du Long, Danh vọng nhận được bằng 1/10 so với Du Long Lệnh thông thường",tbOpt);
end 

function tbNpc:tieudulongnon() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Nón cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,2,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 
function tbNpc:tieudulongao() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Y Phục cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,3,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 
function tbNpc:tieudulongdailung() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Yêu Đái cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,4,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 
function tbNpc:tieudulonggiay() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Giày cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,5,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 
function tbNpc:tieudulongnhan() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 2000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Nhẫn cần 2000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,7,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 2000);
end 
function tbNpc:tieudulongbaotay() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Hộ Uyển cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,8,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 
function tbNpc:tieudulongngocboi() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 2000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Ngọc Bội cần 2000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,9,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 2000);
end 
function tbNpc:tieudulonghtp() 
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
local nCount1 = me.GetItemCountInBags(18,1,553,1) -- Mảnh Vũ Khí Đồng Hành
if nCount1 < 1000 then
Dialog:Say("Để đổi Tiểu Du Long Lệnh Hộ Thân Phù cần 1000 Tiền Du Long. Bạn chỉ có "..nCount1.." Tiền Du Long.")
return
end
me.AddStackItem(18,1,2032,1,{bForceBind=1},1)
Task:DelItem(me, tbItemId1, 1000);
end 

function tbNpc:thinhha()
me.OpenShop(128, 1);
end
function tbNpc:chucphuc()
me.OpenShop(133, 1);
end
function tbNpc:doanvien()
me.OpenShop(161, 1);
end
function tbNpc:hanvu()
me.OpenShop(185, 1);
end
function tbNpc:tiemnhan()
me.OpenShop(163, 1);
end
function tbNpc:tiemboichienthan()
me.OpenShop(168, 1);
end
function tbNpc:shopliendau()
me.OpenShop(134, 1);
end
function tbNpc:tranhdoatlanhtho()
me.OpenShop(147, 1);
end