local tbAnThapNuong = Npc:GetClass("anthapnuong");

function tbAnThapNuong:OnDialog()
	DoScript("\\script\\npc\\anthapnuong.lua");
	DoScript("\\script\\NVHN\\NhiemVuHangNgay.lua");
	local szMsg = "Xin chào, ta có thể giúp được gì?";
	local tbOpt = {
			{"<color=red>MUA TINH HOẠT LỰC<color>", self.menutinhhoat, self},
			--{"<pic=137><color=yellow> Thuê Quan ấn", self.thuequanan, self},
			{"<color=red>MUA LẠI HOẠT ĐỘNG 0 ĐỒNG<color>", self.npcmualaihd, self},
			{"<color=orange>Nhiệm Vụ Hàng Ngày<color>", SpecialEvent.NhiemVuHangNgay.OnDiaLog,SpecialEvent.NhiemVuHangNgay},
			{"<color=yellow>GHÉP TRANG BỊ ĐỒNG HÀNH<color>", self.TestDoiItemPet, self},
			--{"<color=red> Shop <color=yellow>Vũ Khí Hoàng Kim<color>",self.ShopVuKhi_HK,self};
			{"<pic=137> Kết thúc đối thoại"},
			};
Dialog:Say(szMsg, tbOpt);
end
function tbAnThapNuong:menutinhhoat()
    local nDate = tonumber(GetLocalDate("%y%m%d"));
    if me.GetTask(3118, 63) < nDate then
        me.SetTask(3118, 63, nDate);
        me.SetTask(3118, 64, 0);
    end

    if me.GetTask(3118, 65) < nDate then
        me.SetTask(3118, 65, nDate);
        me.SetTask(3118, 66, 0);
    end

    if me.GetTask(3118, 67) < nDate then
        me.SetTask(3118, 67, nDate);
        me.SetTask(3118, 68, 0);
    end

    local szMsg = "Tính năng mua Tinh Hoạt Lực";
    local tbOpt = {
        {
            "Ta muốn mua Tinh Hoạt", TinhHoat.TinhHoatLp.OnDialog,
            TinhHoat.TinhHoatLp
        }, {"Hiện tại ta chưa muốn"}
    };
    Dialog:Say(szMsg, tbOpt);
end
function tbAnThapNuong:bauvatcongpham()
local szMsg = "<color=yellow>NGUYÊN LIỆU CẦN<color>\n"..
"<color=pink>1 Bạch Hổ Kiếm <color>\n"..
"<color=pink>1 Thanh Long Kiếm <color>\n"..
"<color=pink>1 Chu Tước Kiếm <color>\n"..
"<color=pink>1 Huyền Vũ Kiếm <color>\n"..
"<color=red>THƯỞNG<color>\n"..
"<color=red>2 Hòa Thị Bích Không Khóa<color>\n"..
"<color=red>50 Vạn Bạc Khóa<color>\n"..
"<color=red>20 Đồng Khóa<color>\n"
	local tbOpt = {
		{"<color=yellow>Ta Đồng Ý<color>", self.bauvatok, self},
		{"Ta Chỉ Xem Qua Thôi"}
	}
	Dialog:Say(szMsg,tbOpt)
end
--
function tbAnThapNuong:bauvatok()
--
if me.CountFreeBagCell() < 5 then
Dialog:Say("Phải Có 5 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
---
local checktl	= {18,1,20355,1,0,0}; 
local checkbh	= {18,1,20356,2,0,0}; 
local checkhv	= {18,1,20357,3,0,0}; 
local checkct	= {18,1,20358,4,0,0}; 
---
local sstdc = me.GetItemCountInBags(18,1,20355,1);
local ssbhd = me.GetItemCountInBags(18,1,20356,2);
local ssqd = me.GetItemCountInBags(18,1,20357,3);
local sstk = me.GetItemCountInBags(18,1,20358,4);
---
if sstdc < 1 or ssbhd < 1 or ssqd < 1 or sstk < 1 then
Dialog:Say("Bạn không đủ nguyên liệu hoặc đồng");
return
end
	me.AddItem(18,1,377,1);
	me.AddItem(18,1,377,1);
	me.AddBindMoney(500000);
	me.AddBindCoin(200000);
	Task:DelItem(me, checktl, 1);
	Task:DelItem(me, checkbh, 1);
	Task:DelItem(me, checkhv, 1);
	Task:DelItem(me, checkct, 1);
end

---
function tbAnThapNuong:okthuequanan()

if me.CountFreeBagCell() < 2 then
		Dialog:Say("Phải Có 2 Ô Trống Trong Túi Hành Trang!");
		return 0;
end
local xemqn	= {18,10,11,2,0,0};
local checkqa = me.GetItemCountInBags(18,10,11,2);
if checkqa < 2000  then
Dialog:Say("Bạn không đủ 2000 tiền cổ");
return
end
	Task:DelItem(me, xemqn, 2000);
	local pAddItem = me.AddItem(1,18,1,1);
	if pAddItem then
		pAddItem.Bind(1);
		me.SetItemTimeout(pAddItem, os.date("%Y/%m/%d/%H/%M/%S", GetTime() + 7 * 24 * 3600), 0);
		me.Msg(string.format("Bạn nhận được <color=yellow>%s<color>", pAddItem.szName));
	end
	KDialog.MsgToGlobal("\<color=pink> "..me.szName.." Đã Thuê Quan Ấn Trí Sự 6 ngày tại npc Mỹ Nhân - Cổ Long");
end
--
function tbAnThapNuong:TestDoiItemPet()
local szMsg = "Chọn Cấp Đồng Hành";
	local tbOpt = {
	       
			{"<color=blue>Ghép Bộ Đồng Hành<color>", self.Gheppet, self},
			{"<pic=137> Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end
function tbAnThapNuong:Gheppet()
local szMsg = "";
	local tbOpt = {
	       
			{"<color=blue>Ghép Bộ Đồng Hành Cấp 1<color>", self.gheppet1, self},
			-- {"<color=red>Ghép Liên, Lưng, Giày, Nón, Phù<color>", self.gheppetcu, self},
			{"<pic=137> Kết thúc đối thoại"},
};
Dialog:Say(szMsg, tbOpt);
end
function tbAnThapNuong:gheppet1()
local msg = "<color=Turquoise>Công Thức Ghép Trang Bị Pet 1<color>\n"..
"<color=yellow>100<color> Mảnh Đồng Hành + 100v đồng 300 Danh Bổ Lệnh"
local tbOpt = {
{"Đổi <color=yellow>Vũ Khí (Cấp 1)<color>", self.DoiVuKhi_Cap1, self},
{"Đổi <color=yellow>Y Phục (Cấp 1)<color>", self.DoiYPhuc_Cap1, self},
{"Đổi <color=yellow>Nhẫn (Cấp 1)<color>", self.DoiNhan_Cap1, self},
{"Đổi <color=yellow>Hộ Uyển (Cấp 1)<color>", self.DoiHoUyen_Cap1, self},
{"Đổi <color=yellow>Phù (Cấp 1)<color>", self.DoiPhu_Cap1, self},
{"Đổi <color=yellow>Liên (Cấp 1)<color>", self.lien_Cap1, self},
{"Đổi <color=yellow>Lưng (Cấp 1)<color>", self.lung_Cap1, self},
{"Đổi <color=yellow>Giày (Cấp 1)<color>", self.giay_Cap1, self},
{"Đổi <color=yellow>Bội (Cấp 1)<color>", self.boi_Cap1, self},
{"Đổi <color=yellow>Nón (Cấp 1)<color>", self.non_Cap1, self},
{"Kết thúc đối thoại"},
	};
Dialog:Say(msg, tbOpt);
end
function tbAnThapNuong:lien_Cap1()
local checkskill = me.GetSkillLevel(1831)
	if checkskill >= 1 then
	Dialog:Say("Bạn Đã Ép Trang Bị Này Rồi");
	return 0;
end
local tbGiftId1	= {18,1,1876,10,0,0};
local nCount1 = me.GetItemCountInBags(18,1,1876,10);
local tbGiftId2	= {18,1,190,1,0,0};
local nCount2 = me.GetItemCountInBags(18,1,190,1);
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return;
end
me.AddJbCoin(-1000000);
me.AddFightSkill(1831,1);
KDialog.MsgToGlobal("<color=yellow>Người Chơi"..me.szName.."<color=red> Ghép Thành Công Liên Đồng Hành");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
function tbAnThapNuong:lung_Cap1()
local checkskill = me.GetSkillLevel(1832)
	if checkskill >= 1 then
	Dialog:Say("Bạn Đã Ép Trang Bị Này Rồi");
	return 0;
end
local tbGiftId1	= {18,1,1876,9,0,0};
local nCount1 = me.GetItemCountInBags(18,1,1876,9);
local tbGiftId2	= {18,1,190,1,0,0};
local nCount2 = me.GetItemCountInBags(18,1,190,1);
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return;
end
me.AddJbCoin(-1000000);
me.AddFightSkill(1832,1);
KDialog.MsgToGlobal("<color=yellow>Người Chơi"..me.szName.."<color=red> Ghép Thành Công Lưng Đồng Hành");
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
function tbAnThapNuong:giay_Cap1()
local checkskill = me.GetSkillLevel(1833)
	if checkskill >= 1 then
	Dialog:Say("Bạn Đã Ép Trang Bị Này Rồi");
	return 0;
end
local tbGiftId1	= {18,1,1876,8,0,0};
local nCount1 = me.GetItemCountInBags(18,1,1876,8);
local tbGiftId2	= {18,1,190,1,0,0};
local nCount2 = me.GetItemCountInBags(18,1,190,1);
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return;
end
me.AddJbCoin(-1000000);
me.AddFightSkill(1833,1);
KDialog.MsgToGlobal("<color=yellow>Người Chơi"..me.szName.."<color=red> Ghép Thành Công Giày Đồng Hành");
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
function tbAnThapNuong:boi_Cap1()
local checkskill = me.GetSkillLevel(1834)
	if checkskill >= 1 then
	Dialog:Say("Bạn Đã Ép Trang Bị Này Rồi");
	return 0;
end
local tbGiftId1	= {18,1,1876,7,0,0};
local nCount1 = me.GetItemCountInBags(18,1,1876,7);
local tbGiftId2	= {18,1,190,1,0,0};
local nCount2 = me.GetItemCountInBags(18,1,190,1);
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return;
end
me.AddJbCoin(-1000000);
me.AddFightSkill(1834,1);
KDialog.MsgToGlobal("<color=yellow>Người Chơi"..me.szName.."<color=red> Ghép Thành Công Bội Đồng Hành");
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
function tbAnThapNuong:non_Cap1()
local checkskill = me.GetSkillLevel(1835)
	if checkskill >= 1 then
	Dialog:Say("Bạn Đã Ép Trang Bị Này Rồi");
	return 0;
end
local tbGiftId1	= {18,1,1876,6,0,0};
local nCount1 = me.GetItemCountInBags(18,1,1876,6);
local tbGiftId2	= {18,1,190,1,0,0};
local nCount2 = me.GetItemCountInBags(18,1,190,1);
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return;
end
me.AddJbCoin(-1000000);
me.AddFightSkill(1835,1);
KDialog.MsgToGlobal("<color=yellow>Người Chơi"..me.szName.."<color=red> Ghép Thành Công Nón Đồng Hành");
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
function tbAnThapNuong:DoiVuKhi_Cap1()
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,2004,1,0,0}; -- Mảnh Vũ Khí Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,2004,1) -- Mảnh Vũ Khí Đồng Hành
local tbGiftId2	= {18,1,190,1,0,0}; -- HT11
local nCount2 = me.GetItemCountInBags(18,1,190,1) -- ht11
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddJbCoin(-1000000);
me.AddItem(5,19,1,1).Bind(1); -- Bích Huyết Chi Nhẫn (Cấp 1)

KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]Ghép Thành Công Trang Bị Đồng Hành Vũ Khí");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
----- Doi Y Phuc --------
function tbAnThapNuong:DoiYPhuc_Cap1()
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,2005,1,0,0}; -- Mảnh Y Phục Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,2005,1) -- Mảnh Y Phục Đồng Hành
local tbGiftId2	= {18,1,190,1,0,0}; -- HT11
local nCount2 = me.GetItemCountInBags(18,1,190,1) -- ht11
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddJbCoin(-1000000);
me.AddItem(5,20,1,1).Bind(1); -- Bích Huyết Chiến Y (Cấp 1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]Ghép Thành Công Trang Bị Đồng Hành Áo");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
----- Doi Nhan --------
function tbAnThapNuong:DoiNhan_Cap1()
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,2006,1,0,0}; -- Mảnh Nhẫn Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,2006,1) -- Mảnh Nhẫn Đồng Hành
local tbGiftId2	= {18,1,190,1,0,0}; -- HT11
local nCount2 = me.GetItemCountInBags(18,1,190,1) -- ht11
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddJbCoin(-1000000);
me.AddItem(5,21,1,1).Bind(1); -- Bích Huyết Chi Giới (Cấp 1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]Ghép Thành Công Trang Bị Đồng Hành Nhẫn");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
----- Doi Ho Uyen --------
function tbAnThapNuong:DoiHoUyen_Cap1()
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,2007,1,0,0}; -- Mảnh Hộ Uyển Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,2007,1) -- Mảnh Hộ Uyển Đồng Hành
local tbGiftId2	= {18,1,190,1,0,0}; -- HT11
local nCount2 = me.GetItemCountInBags(18,1,190,1) -- ht11
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddJbCoin(-1000000);
me.AddItem(5,22,1,1).Bind(1); -- Bích Huyết Hộ Uyển (Cấp 1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]Ghép THành Công Trang Bị Đồng Hành Hộ Uyển");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
----- Doi Ngọc Bội --------
function tbAnThapNuong:DoiPhu_Cap1()
if me.CountFreeBagCell() < 15 then
		Dialog:Say("Phải Có 15 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbGiftId1	= {18,1,2008,1,0,0}; -- Mảnh Hộ Uyển Đồng Hành
local nCount1 = me.GetItemCountInBags(18,1,2008,1) -- Mảnh Hộ Uyển Đồng Hành
local tbGiftId2	= {18,1,190,1,0,0}; -- HT11
local nCount2 = me.GetItemCountInBags(18,1,190,1) -- ht11
local tienxu = me.GetJbCoin();
if nCount1 < 100 or tienxu < 1000000 or nCount2 < 300 then
Dialog:Say("Không Đủ Nguyên Liệu");
return
end
-- em muốn chổ này thêm cái tỷ lệ %
me.AddJbCoin(-1000000);
me.AddItem(5,23,1,1).Bind(1); -- Bích Huyết Hộ Thân Phù (Cấp 1)
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]Ghép Thành Công Trang Bị Hộ Thần Phù");	
Task:DelItem(me, tbGiftId1, 100);
Task:DelItem(me, tbGiftId2, 300);
end
--
function tbAnThapNuong:congpham()
local szMsg = "<color=yellow>NGUYÊN LIỆU CẦN<color>\n"..
"<color=pink>3 Vật Phẩm BHD<color>\n"..
"<color=pink>2 Vật Phẩm Tống Kim<color>\n"..
"<color=pink>1 Vật Phẩm TDC<color>\n"..
"<color=pink>1 Vật Phẩm Quân Doanh<color>\n"..
"<color=blue>THƯỞNG<color>\n"..
"<color=blue>4 Vạn Đồng<color>\n"..
"<color=blue>50 Vạn Bạc Khóa<color>\n"..
"<color=blue>30 Vạn Đồng Khóa<color>\n"
	local tbOpt = {
		{"<color=red>Ta Đồng Ý<color>", self.congphamdongy, self},
		{"Ta Chỉ Xem Qua Thôi"}
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbAnThapNuong:congphamdongy()
--
if me.CountFreeBagCell() < 5 then
Dialog:Say("Chừa Trống 5 ô hành trống");
return 0;
end
---
local checktdc	= {18,1,20350,1,0,0}; 
local checkbhd	= {18,1,20351,1,0,0}; 
local checkqd	= {18,1,20352,1,0,0}; 
local checktk	= {18,1,20353,1,0,0}; 
---
local sstdc = me.GetItemCountInBags(18,1,20350,1);
local ssbhd = me.GetItemCountInBags(18,1,20351,1);
local ssqd = me.GetItemCountInBags(18,1,20352,1);
local sstk = me.GetItemCountInBags(18,1,20353,1);
---
if sstdc < 1 or ssbhd < 3 or ssqd < 1 or sstk < 2  then
Dialog:Say("Bạn Cần 3 Vật Phẩm BHD, 2 Vật Phẩm Tk, 1 Vật Phẩm QD, 1 Vật Phẩm TDC");
return
end
	me.AddBindMoney(500000);
	me.AddBindCoin(300000);
	me.AddJbCoin(40000);
	Task:DelItem(me, checktdc, 1);
	Task:DelItem(me, checkbhd, 3);
	Task:DelItem(me, checkqd, 1);
	Task:DelItem(me, checktk, 2);
	KDialog.MsgToGlobal("\<color=pink> "..me.szName.." Hoàn Thành Nhiệm Vụ Hằng Ngày Tại NPC Hoạt Động");
end
function tbAnThapNuong:ShopNguachinh()
me.OpenShop(229,3)
end
function tbAnThapNuong:ShopMatNa1()
me.OpenShop(228,3)
end
function tbAnThapNuong:npcmualaihd()
	local tbAnThapNuong = Npc:GetClass("mualaihoatdong");
	tbAnThapNuong:OnDialog();
end
function tbAnThapNuong:ShopTranPhapCao_KTCT()
me.OpenShop(212,3)
end
function tbAnThapNuong:ShopAn_KTCT()
me.OpenShop(213,3)
end
function tbAnThapNuong:ShopNgua()
me.OpenShop(202,3)

end
function tbAnThapNuong:ShopTrangBiBaVuong_KTCT()
me.OpenShop(200,3)
end
function tbAnThapNuong:ShopTrangBiSatThan_KTCT()
me.OpenShop(210,3)
end

function tbAnThapNuong:ShopPhiPhong_KTCT()
me.OpenShop(203,3)
end



function tbAnThapNuong:ShopVuKhi_HK()
	local szMsg = "Xin mời bạn Chọn!!!";
	local tbOpt = {
		{"<pic=137> Shop Hệ <color=yellow>Kim<color>",self.Svukhi1,self};
		{"<pic=137> Shop Hệ <color=green>Mộc<color>",self.Svukhi2,self};
		{"<pic=137> Shop Hệ <color=blue>Thủy<color>",self.Svukhi3,self};
		{"<pic=137> Shop Hệ <color=red>Hỏa<color>",self.Svukhi4,self};
		{"<pic=137> Shop Hệ <color=wheat>Thổ<color>",self.Svukhi5,self};
		{"<pic=137> Kết thúc đối thoại"},
		}
		Dialog:Say(szMsg, tbOpt);
end
function tbAnThapNuong:Svukhi1()
me.OpenShop(156, 1);
end

function tbAnThapNuong:Svukhi2()
me.OpenShop(157, 1);
end

function tbAnThapNuong:Svukhi3()
me.OpenShop(158, 1);
end

function tbAnThapNuong:Svukhi4()
me.OpenShop(159, 1);
end

function tbAnThapNuong:Svukhi5()
me.OpenShop(160, 1);
end

