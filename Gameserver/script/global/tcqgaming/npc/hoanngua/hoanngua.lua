----Dev TCQGaming
----02/04/2023 3:43
--- fb.com/xboy.hd

local HoanNgua ={};
SpecialEvent.HoanNgua= HoanNgua;

function HoanNgua:OnDialog() 
DoScript("\\script\\global\\tcqgaming\\npc\\HoanNgua\\hoanngua.lua");
	local szMsg = "Hãy lựa chọn cho mình hình dáng ưng ý nhất \n<color=cyan> Xin Lưu Ý : Chỉ để 1 con ngựa duy nhất tại hành trang rồi tiến hành hoán đổi , nếu có nhiều ngựa tại hành trang sau khí hoán sẽ mất hết chỉ còn 1 ngựa<color>\n<color=cyan>";
	local tbOpt =
	{
		{"<color=yellow>Hoán Miễn Phí \n<color> <color=green>( Yêu Cầu Mốc Nạp 50tr VNĐ)<color>", self.hoanmienphi,self},
		{"<color=yellow>Hoán Trả Phí\n<color> <color=green>(Cần Tiêu Tốn 500 Vạn Đồng Thường)", self.hoantraphi,self},
		{"<color=yellow>Hoán Ngựa Mới\n<color> <color=green>(Đọc Kỹ Trước Khi Click)", self.hoannguamoi,self},
		{"<color=yellow>Ta muốn trở về ngựa ban đầu\nLưu Ý : Chỉ Để 1 Ngựa ở Hành trang<color> ", self.trove,self},
		{"Kết thúc đối thoại"},
	}
	Dialog:Say(szMsg,tbOpt);
end

function HoanNgua:trove()
	local szMsg = "<color=red>Tránh Spam Nên Bạn Cần Tốn 50 Vạn Đồng Để Trở Về Trạng Thái Ban Đầu";
	local tbOpt = 
	{
			{"<color=yellow>Ngựa Mốc 10tr<color>",self.trove10tr,self};
			{"<color=yellow>Ngựa Mốc 20tr<color>",self.trove20tr,self};
			{"<color=yellow>Ngựa Mốc 30tr<color>",self.trove30tr,self};
			{"<color=yellow>Ngựa Mốc 50tr<color>",self.trove50tr,self};
			{"<color=yellow>Ngựa Mốc 75tr<color>",self.trove75tr,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function HoanNgua:trove10tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
	end
local nCheckHyHy = me.GetItemCountInBags(1,12,26,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,27,4) 
local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20265,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20266,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20267,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20268,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20269,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20270,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20271,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20272,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20273,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20274,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20275,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20276,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20277,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20278,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20279,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20280,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20281,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20282,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20283,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20284,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20285,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20286,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20287,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckTuyetHon > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(26,28)
			local nPhienVuMoc	= {1,12,26,4,0,0}; 
			local nTieuDaoMoc	= {1,12,27,4,0,0}; 
			local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20265,4,0,0}; 
			local nPanDa	= {1,12,20266,4,0,0}; 
			local nThuyLongVuong	= {1,12,20267,4,0,0}; 
			local nLamMaoTu	= {1,12,20268,4,0,0}; 
			local nTaiThaiTue	= {1,12,20269,4,0,0}; 
			local nViemLangVuong	= {1,12,20270,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20271,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20272,4,0,0}; 
			local nLamMaThietKy	= {1,12,20273,4,0,0}; 
			local nHacMaThietKy	= {1,12,20274,4,0,0}; 
			local nHoaViemTu	= {1,12,20275,4,0,0}; 
			local nKimLangVuong	= {1,12,20276,4,0,0}; 
			local nLonDo	= {1,12,20277,4,0,0}; 
			local nLonXanh	= {1,12,20278,4,0,0}; 
			local nLonDen	= {1,12,20279,4,0,0}; 
			local nLonXanhDuong	= {1,12,20280,4,0,0}; 
			local nHuyetLongCau	= {1,12,20281,4,0,0}; 
			local nNgocKyLan	= {1,12,20282,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20283,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20284,4,0,0}; 
			local nBachNguu	= {1,12,20285,4,0,0}; 
			local nHoaNguu	= {1,12,20286,4,0,0}; 
			local nHacNguu	= {1,12,20287,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-500000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 10tr <color>"));
	return
end
end

function HoanNgua:trove20tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,29,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,30,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,45,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,46,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,47,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,48,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,49,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,50,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,51,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,52,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,53,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,54,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,55,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,56,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,57,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,58,4) 

local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20288,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20289,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20290,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20291,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20292,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20293,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20294,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20295,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20296,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20297,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20298,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20299,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20300,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20301,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20302,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20303,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20304,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20305,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20306,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20307,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20308,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20309,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20310,4) 
if nCheckTieuDaoMoc > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(29,30)
			local nPhienVuMoc	= {1,12,29,4,0,0}; 
			local nTieuDaoMoc	= {1,12,30,4,0,0}; 
			local nPhienVuHoan	= {1,12,45,4,0,0}; 
			local nTieuDaoHoan	= {1,12,46,4,0,0}; 
			local nLangThien	= {1,12,47,4,0,0}; 
			local nKySy	= {1,12,48,4,0,0}; 
			local nTrucNhat	= {1,12,49,4,0,0}; 
			local nUcVan	= {1,12,50,4,0,0}; 
			local nTuQuy	= {1,12,51,4,0,0}; 
			local nViemLongTu	= {1,12,52,4,0,0}; 
			local nTuyetVu	= {1,12,53,4,0,0}; 
			local nHoaKyLan	= {1,12,54,4,0,0}; 
			local nHacKyLan	= {1,12,55,4,0,0}; 
			local nLamKyLan	= {1,12,56,4,0,0}; 
			local nMachThuong	= {1,12,57,4,0,0}; 
			local nThienHuong	= {1,12,58,4,0,0}; 
			
			local nHoaVuThienHuong	= {1,12,20288,4,0,0}; 
			local nPanDa	= {1,12,20289,4,0,0}; 
			local nThuyLongVuong	= {1,12,20290,4,0,0}; 
			local nLamMaoTu	= {1,12,20291,4,0,0}; 
			local nTaiThaiTue	= {1,12,20292,4,0,0}; 
			local nViemLangVuong	= {1,12,20293,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20294,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20295,4,0,0}; 
			local nLamMaThietKy	= {1,12,20296,4,0,0}; 
			local nHacMaThietKy	= {1,12,20297,4,0,0}; 
			local nHoaViemTu	= {1,12,20298,4,0,0}; 
			local nKimLangVuong	= {1,12,20299,4,0,0}; 
			local nLonDo	= {1,12,20300,4,0,0}; 
			local nLonXanh	= {1,12,20301,4,0,0}; 
			local nLonDen	= {1,12,20302,4,0,0}; 
			local nLonXanhDuong	= {1,12,20303,4,0,0}; 
			local nHuyetLongCau	= {1,12,20304,4,0,0}; 
			local nNgocKyLan	= {1,12,20305,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20306,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20307,4,0,0}; 
			local nBachNguu	= {1,12,20308,4,0,0}; 
			local nHoaNguu	= {1,12,20309,4,0,0}; 
			local nHacNguu	= {1,12,20310,4,0,0}; 

Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);

Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-500000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 20tr <color>"));
	return
end
end

function HoanNgua:trove30tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,31,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,32,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,59,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,60,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,61,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,62,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,63,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,64,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,65,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,66,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,67,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,68,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,69,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,70,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,71,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,72,4) 

local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20311,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20312,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20313,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20314,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20315,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20316,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20317,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20318,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20319,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20320,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20321,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20322,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20323,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20324,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20325,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20326,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20327,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20328,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20329,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20330,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20331,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20332,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20333,4) 

if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 or
nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(31,32)
			local nPhienVuMoc	= {1,12,31,4,0,0}; 
			local nTieuDaoMoc	= {1,12,32,4,0,0}; 
			local nPhienVuHoan	= {1,12,59,4,0,0}; 
			local nTieuDaoHoan	= {1,12,60,4,0,0}; 
			local nLangThien	= {1,12,61,4,0,0}; 
			local nKySy	= {1,12,62,4,0,0}; 
			local nTrucNhat	= {1,12,63,4,0,0}; 
			local nUcVan	= {1,12,64,4,0,0}; 
			local nTuQuy	= {1,12,65,4,0,0}; 
			local nViemLongTu	= {1,12,66,4,0,0}; 
			local nTuyetVu	= {1,12,67,4,0,0}; 
			local nHoaKyLan	= {1,12,68,4,0,0}; 
			local nHacKyLan	= {1,12,69,4,0,0}; 
			local nLamKyLan	= {1,12,70,4,0,0}; 
			local nMachThuong	= {1,12,71,4,0,0}; 
			local nThienHuong	= {1,12,72,4,0,0}; 

			local nHoaVuThienHuong	= {1,12,20311,4,0,0}; 
			local nPanDa	= {1,12,20312,4,0,0}; 
			local nThuyLongVuong	= {1,12,20313,4,0,0}; 
			local nLamMaoTu	= {1,12,20314,4,0,0}; 
			local nTaiThaiTue	= {1,12,20315,4,0,0}; 
			local nViemLangVuong	= {1,12,20316,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20317,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20318,4,0,0}; 
			local nLamMaThietKy	= {1,12,20319,4,0,0}; 
			local nHacMaThietKy	= {1,12,20320,4,0,0}; 
			local nHoaViemTu	= {1,12,20321,4,0,0}; 
			local nKimLangVuong	= {1,12,20322,4,0,0}; 
			local nLonDo	= {1,12,20323,4,0,0}; 
			local nLonXanh	= {1,12,20324,4,0,0}; 
			local nLonDen	= {1,12,20325,4,0,0}; 
			local nLonXanhDuong	= {1,12,20326,4,0,0}; 
			local nHuyetLongCau	= {1,12,20327,4,0,0}; 
			local nNgocKyLan	= {1,12,20328,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20329,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20330,4,0,0}; 
			local nBachNguu	= {1,12,20331,4,0,0}; 
			local nHoaNguu	= {1,12,20332,4,0,0}; 
			local nHacNguu	= {1,12,20333,4,0,0}; 
			
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);	
			
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-500000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 30tr <color>"));
	return
end
end

function HoanNgua:trove50tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,33,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,34,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,73,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,74,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,75,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,76,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,77,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,78,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,79,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,80,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,81,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,82,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,83,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,84,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,85,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,86,4) 

local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20334,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20335,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20336,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20337,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20338,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20339,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20340,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20341,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20342,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20343,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20344,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20345,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20346,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20347,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20348,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20349,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20350,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20351,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20352,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20353,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20354,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20355,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20356,4) 

if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 or
nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then
local nRandomNgua = MathRandom(33,34) 
			local nPhienVuMoc	= {1,12,33,4,0,0}; 
			local nTieuDaoMoc	= {1,12,34,4,0,0}; 
			local nPhienVuHoan	= {1,12,73,4,0,0}; 
			local nTieuDaoHoan	= {1,12,74,4,0,0}; 
			local nLangThien	= {1,12,75,4,0,0}; 
			local nKySy	= {1,12,76,4,0,0}; 
			local nTrucNhat	= {1,12,77,4,0,0}; 
			local nUcVan	= {1,12,78,4,0,0}; 
			local nTuQuy	= {1,12,79,4,0,0}; 
			local nViemLongTu	= {1,12,80,4,0,0}; 
			local nTuyetVu	= {1,12,81,4,0,0}; 
			local nHoaKyLan	= {1,12,82,4,0,0}; 
			local nHacKyLan	= {1,12,83,4,0,0}; 
			local nLamKyLan	= {1,12,84,4,0,0}; 
			local nMachThuong	= {1,12,85,4,0,0}; 
			local nThienHuong	= {1,12,86,4,0,0}; 
			
			local nHoaVuThienHuong	= {1,12,20334,4,0,0}; 
			local nPanDa	= {1,12,20335,4,0,0}; 
			local nThuyLongVuong	= {1,12,20336,4,0,0}; 
			local nLamMaoTu	= {1,12,20337,4,0,0}; 
			local nTaiThaiTue	= {1,12,20338,4,0,0}; 
			local nViemLangVuong	= {1,12,20339,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20340,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20341,4,0,0}; 
			local nLamMaThietKy	= {1,12,20342,4,0,0}; 
			local nHacMaThietKy	= {1,12,20343,4,0,0}; 
			local nHoaViemTu	= {1,12,20344,4,0,0}; 
			local nKimLangVuong	= {1,12,20345,4,0,0}; 
			local nLonDo	= {1,12,20346,4,0,0}; 
			local nLonXanh	= {1,12,20347,4,0,0}; 
			local nLonDen	= {1,12,20348,4,0,0}; 
			local nLonXanhDuong	= {1,12,20349,4,0,0}; 
			local nHuyetLongCau	= {1,12,20350,4,0,0}; 
			local nNgocKyLan	= {1,12,20351,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20352,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20353,4,0,0}; 
			local nBachNguu	= {1,12,20354,4,0,0}; 
			local nHoaNguu	= {1,12,20355,4,0,0}; 
			local nHacNguu	= {1,12,20356,4,0,0}; 
			
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);

Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-500000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 50tr <color>"));
	return
end
end

function HoanNgua:trove75tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 500000) then
	Dialog:Say("Bạn không đủ <color=red>50 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,35,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,36,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,87,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,88,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,89,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,90,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,91,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,92,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,93,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,94,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,95,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,96,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,97,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,98,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,99,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,100,4) 

local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20357,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20358,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20359,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20360,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20361,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20362,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20363,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20364,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20365,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20366,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20367,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20368,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20369,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20370,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20371,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20372,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20373,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20374,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20375,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20376,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20377,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20378,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20379,4) 

if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 or 
nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then
local nRandomNgua = MathRandom(35,36) 
			local nPhienVuMoc	= {1,12,35,4,0,0}; 
			local nTieuDaoMoc	= {1,12,36,4,0,0}; 
			local nPhienVuHoan	= {1,12,87,4,0,0}; 
			local nTieuDaoHoan	= {1,12,88,4,0,0}; 
			local nLangThien	= {1,12,89,4,0,0}; 
			local nKySy	= {1,12,90,4,0,0}; 
			local nTrucNhat	= {1,12,91,4,0,0}; 
			local nUcVan	= {1,12,92,4,0,0}; 
			local nTuQuy	= {1,12,93,4,0,0}; 
			local nViemLongTu	= {1,12,94,4,0,0}; 
			local nTuyetVu	= {1,12,95,4,0,0}; 
			local nHoaKyLan	= {1,12,96,4,0,0}; 
			local nHacKyLan	= {1,12,97,4,0,0}; 
			local nLamKyLan	= {1,12,98,4,0,0}; 
			local nMachThuong	= {1,12,99,4,0,0}; 
			local nThienHuong	= {1,12,100,4,0,0}; 

			local nHoaVuThienHuong	= {1,12,20357,4,0,0}; 
			local nPanDa	= {1,12,20358,4,0,0}; 
			local nThuyLongVuong	= {1,12,20359,4,0,0}; 
			local nLamMaoTu	= {1,12,20360,4,0,0}; 
			local nTaiThaiTue	= {1,12,20361,4,0,0}; 
			local nViemLangVuong	= {1,12,20362,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20363,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20364,4,0,0}; 
			local nLamMaThietKy	= {1,12,20365,4,0,0}; 
			local nHacMaThietKy	= {1,12,20366,4,0,0}; 
			local nHoaViemTu	= {1,12,20367,4,0,0}; 
			local nKimLangVuong	= {1,12,20368,4,0,0}; 
			local nLonDo	= {1,12,20369,4,0,0}; 
			local nLonXanh	= {1,12,20370,4,0,0}; 
			local nLonDen	= {1,12,20371,4,0,0}; 
			local nLonXanhDuong	= {1,12,20372,4,0,0}; 
			local nHuyetLongCau	= {1,12,20373,4,0,0}; 
			local nNgocKyLan	= {1,12,20374,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20375,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20376,4,0,0}; 
			local nBachNguu	= {1,12,20377,4,0,0}; 
			local nHoaNguu	= {1,12,20378,4,0,0}; 
			local nHacNguu	= {1,12,20379,4,0,0}; 
			
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-500000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 75tr <color>"));
	return
end
end 

function HoanNgua:hoannguamoi()
	local szMsg = "<color=red>Mốc Nạp Giảm Giá Hoán Ngựa Mới\n<color=yellow>Tích Nạp 10tr<color=red> (Giảm 10%) - <color><color=green>1350v Đồng<color>\nTích Nạp 20tr<color=red> (Giảm 30%) - <color><color=green>1050v Đồng<color>\nTích Nạp 30tr <color=red>(Giảm 50%) - <color><color=green>750v Đồng<color>\nTích Nạp 50tr <color=red>(Giảm 70%) - <color><color=green>450v Đồng<color>\nTích Nạp 75tr <color=red>(Giảm 90%) - <color><color=green>150v Đồng<color>\n<color=blue>Nếu Tích Nạp Chưa đủ thì bạn cần 1500 vạn đồng cho 1 lần hoán";
	local tbOpt = 
	{
			{"<color=yellow>Ngựa Mốc 10tr<color>",self.nguamoi10tr,self};
			{"<color=yellow>Ngựa Mốc 20tr<color>",self.nguamoi20tr,self};
			{"<color=yellow>Ngựa Mốc 30tr<color>",self.nguamoi30tr,self};
			{"<color=yellow>Ngựa Mốc 50tr<color>",self.nguamoi50tr,self};
			{"<color=yellow>Ngựa Mốc 75tr<color>",self.nguamoi75tr,self};
			-- {"<color=yellow>Ngựa Mốc 100tr<color>",self.nguamoi100tr,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function HoanNgua:hoanmienphi()
	local szMsg = "Hãy lựa chọn cho mình hình dáng ưng ý nhất \n<color=cyan> Xin Lưu Ý : Chỉ để 1 con ngựa duy nhất tại hành trang rồi tiến hành hoán đổi , nếu có nhiều ngựa tại hành trang sau khí hoán sẽ mất hết chỉ còn 1 ngựa<color>\n<color=cyan>";
	local tbOpt = 
	{
			-- {"<color=yellow>Ngựa Mốc Test<color>",self.HoanDoiNgua,self};
			{"<color=yellow>Ngựa Mốc 20tr<color>",self.ngua20trmienphi,self};
			{"<color=yellow>Ngựa Mốc 30tr<color>",self.nguamienphi30tr,self};
			{"<color=yellow>Ngựa Mốc 50tr<color>",self.nguamienphi50tr,self};
			{"<color=yellow>Ngựa Mốc 75tr<color>",self.nguamienphi75tr,self};
			-- {"<color=yellow>Ngựa Mốc 100tr<color>",self.nguamienphi100tr,self};
			-- {"<color=yellow>Ngựa Mốc 125tr<color>",self.nguamienphi125tr,self};
			-- {"<color=yellow>Ngựa Mốc 150tr<color>",self.nguamienphi150tr,self};
			-- {"<color=yellow>Ngựa Mốc 180tr<color>",self.nguamienphi180tr,self};
			-- {"<color=yellow>Ngựa Mốc 200tr<color>",self.nguamienphi200tr,self};
			-- {"<color=yellow>Ngựa Mốc 250tr<color>",self.nguamienphi250tr,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function HoanNgua:HoanDoiNgua()
    local nCheckNgua = {
        [1] = {1, 12, 29, 4},   -- Phien Vu Moc (20 triệu)
        [2] = {1, 12, 30, 4},   -- Tieu Dao Moc (20 triệu)
        [3] = {1, 12, 45, 4},   -- Phien Vu Hoan (20 triệu)
        [4] = {1, 12, 46, 4},   -- Tieu Dao Hoan (20 triệu)
        [5] = {1, 12, 47, 4},   -- Lang Thien (20 triệu)
        [6] = {1, 12, 48, 4},   -- Ky Sy Bong Dem (20 triệu)
        [7] = {1, 12, 49, 4},   -- Truc Nhat (20 triệu)
        [8] = {1, 12, 50, 4},   -- Uc Van (20 triệu)
        [9] = {1, 12, 51, 4},   -- Tu Quy (20 triệu)
        [10] = {1, 12, 52, 4},  -- Viem Long Tu (20 triệu)
        [11] = {1, 12, 53, 4},  -- Tieu Tuyet Vu (20 triệu)
        [12] = {1, 12, 54, 4},  -- Hoa Ky Lan (20 triệu)
        [13] = {1, 12, 55, 4},  -- Hac Ky Lan (20 triệu)
        [14] = {1, 12, 56, 4},  -- Lam Ky Lan (20 triệu)
        [15] = {1, 12, 57, 4},  -- Phi Suong (20 triệu)
        [16] = {1, 12, 31, 4},   -- Phien Vu Moc (30 triệu)
        [17] = {1, 12, 32, 4},   -- Tieu Dao Moc (30 triệu)
        [18] = {1, 12, 59, 4},   -- Phien Vu Hoan (30 triệu)
        [19] = {1, 12, 60, 4},   -- Tieu Dao Hoan (30 triệu)
        [20] = {1, 12, 61, 4},   -- Lang Thien (30 triệu)
        [21] = {1, 12, 62, 4},   -- Ky Sy Bong Dem (30 triệu)
        [22] = {1, 12, 63, 4},   -- Truc Nhat (30 triệu)
        [23] = {1, 12, 64, 4},   -- Uc Van (30 triệu)
        [24] = {1, 12, 65, 4},   -- Tu Quy (30 triệu)
        [25] = {1, 12, 66, 4},   -- Viem Long Tu (30 triệu)
        [26] = {1, 12, 67, 4},   -- Tieu Tuyet Vu (30 triệu)
        [27] = {1, 12, 68, 4},   -- Hoa Ky Lan (30 triệu)
        [28] = {1, 12, 69, 4},   -- Hac Ky Lan (30 triệu)
        [29] = {1, 12, 70, 4},   -- Lam Ky Lan (30 triệu)
        [30] = {1, 12, 71, 4},   -- Phi Suong (30 triệu)
        [31] = {1, 12, 72, 4}    -- Tuyet Vu Thien Huong (30 triệu)
    }
    local countNgua20Tr = 0
    local countNgua30Tr = 0

for i = 1, #nCheckNgua do
    local ngua = nCheckNgua[i]
    local nCount = me.GetItemCountInBags(ngua[1], ngua[2], ngua[3], ngua[4])

    if nCount > 1 then
        Dialog:Say("<color=yellow>Bạn có "..nCount.." ngựa trong hành trang. Hãy cất bớt một ngựa vào thủ khố và chỉ để lại một con.")
        return
    elseif nCount == 1 then
        if i <= 15 then
            countNgua20Tr = countNgua20Tr + 1
        else
            countNgua30Tr = countNgua30Tr + 1
        end
			Task:DelItem(me, ngua, nCount) 
        -- Task:DelItem(me, ngua[1], ngua[2], ngua[3], ngua[4], nCount)
    end
end

if countNgua20Tr > 0 then
    local nRandomNgua = MathRandom(1, 15)
    local ngua = nCheckNgua[nRandomNgua]
    me.AddItem(unpack(ngua)).Bind(1)
    me.Msg("<color=yellow>Bạn đã hoán đổi thành công một ngựa 20 triệu khác.")
    countNgua20Tr = countNgua20Tr - 1 -- Giảm số lượng ngựa 20 triệu sau khi hoán đổi thành công
elseif countNgua30Tr > 0 then
    local nRandomNgua = MathRandom(16, 31)
    local ngua = nCheckNgua[nRandomNgua]
    me.AddItem(unpack(ngua)).Bind(1)
    me.Msg("<color=yellow>Bạn đã hoán đổi thành công một ngựa 30 triệu khác.")
    countNgua30Tr = countNgua30Tr - 1 -- Giảm số lượng ngựa 30 triệu sau khi hoán đổi thành công
else
    Dialog:Say("<color=yellow>Trong Hành Trang Của Bạn Không Có Ngựa Nào!")
end



end 




function HoanNgua:hoantraphi()
	local szMsg = "Hãy lựa chọn cho mình hình dáng ưng ý nhất<color>\n<color=cyan>";
	local tbOpt = 
	{
			{"<color=yellow>Ngựa Mốc 20tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi20tr,self};
			{"<color=yellow>Ngựa Mốc 30tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi30tr,self};
			{"<color=yellow>Ngựa Mốc 50tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi50tr,self};
			{"<color=yellow>Ngựa Mốc 75tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi75tr,self};
			-- {"<color=yellow>Ngựa Mốc 100tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi100tr,self};
			-- {"<color=yellow>Ngựa Mốc 125tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi125tr,self};
			-- {"<color=yellow>Ngựa Mốc 150tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi150tr,self};
			-- {"<color=yellow>Ngựa Mốc 180tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi180tr,self};
			-- {"<color=yellow>Ngựa Mốc 200tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi200tr,self};
			-- {"<color=yellow>Ngựa Mốc 250tr\n<color=green>(500v đồng / lượt)<color>",self.nguatraphi250tr,self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function HoanNgua:ngua20trmienphi()
    local nMocNap = me.GetTask(3028, 1)
    if nMocNap < 56750 then
        Dialog:Say("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí")
        return
    end

    local nCheckNgua = {
        {1, 12, 29, 4},   -- Phien Vu Moc
        {1, 12, 30, 4},   -- Tieu Dao Moc
        {1, 12, 45, 4},   -- Phien Vu Hoan
        {1, 12, 46, 4},   -- Tieu Dao Hoan
        {1, 12, 47, 4},   -- Lang Thien
        {1, 12, 48, 4},   -- Ky Sy Bong Dem
        {1, 12, 49, 4},   -- Truc Nhat
        {1, 12, 50, 4},   -- Uc Van
        {1, 12, 51, 4},   -- Tu Quy
        {1, 12, 52, 4},   -- Viem Long Tu
        {1, 12, 53, 4},   -- Tieu Tuyet Vu
        {1, 12, 54, 4},   -- Hoa Ky Lan
        {1, 12, 55, 4},   -- Hac Ky Lan
        {1, 12, 56, 4},   -- Lam Ky Lan
        {1, 12, 57, 4}    -- Phi Suong
    }

    local countNgua = 0
    
    for _, ngua in ipairs(nCheckNgua) do
        local nCount = me.GetItemCountInBags(unpack(ngua))
        countNgua = countNgua + nCount
        if nCount > 0 then
            if countNgua > 1 then
                Dialog:Say("<color=yellow>Bạn có quá nhiều ngựa trong hành trang. Hãy cất bớt một ngựa vào thủ khố và chỉ để lại một con.")
                return
            else
                Task:DelItem(me, ngua, nCount)
            end
        end
    end
    
    if countNgua > 0 then
        local nRandomNgua = MathRandom(45, 57)
        me.AddItem(1, 12, nRandomNgua, 4).Bind(1)
    else
        Dialog:Say("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 20tr <color>")
        return
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function HoanNgua:nguamienphi30tr()
    local nMocNap = me.GetTask(3028, 1)
    if nMocNap < 56750 then
        Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"))
        return 0
    end

    local nCheckNgua = {
        {1, 12, 31, 4, 0, 0},   -- PhienVuMoc
        {1, 12, 32, 4, 0, 0},   -- TieuDaoMoc
        {1, 12, 59, 4, 0, 0},   -- PhienVuHoan
        {1, 12, 60, 4, 0, 0},   -- TieuDaoHoan
        {1, 12, 61, 4, 0, 0},   -- LangThien
        {1, 12, 62, 4, 0, 0},   -- KySyBongDem
        {1, 12, 63, 4, 0, 0},   -- TrucNhat
        {1, 12, 64, 4, 0, 0},   -- UcVan
        {1, 12, 65, 4, 0, 0},   -- TuQuy
        {1, 12, 66, 4, 0, 0},   -- ViemLongTu
        {1, 12, 67, 4, 0, 0},   -- TieuTuyetVu
        {1, 12, 68, 4, 0, 0},   -- HoaKyLan
        {1, 12, 69, 4, 0, 0},   -- HacKyLan
        {1, 12, 70, 4, 0, 0},   -- LamKyLan
        {1, 12, 71, 4, 0, 0},   -- PhiSuong
        {1, 12, 72, 4, 0, 0}    -- TuyetVuThienHuong
    }

    local countNgua = 0
    
    for _, ngua in ipairs(nCheckNgua) do
        local nCount = me.GetItemCountInBags(unpack(ngua))
        countNgua = countNgua + nCount
        if nCount > 0 then
            if countNgua > 1 then
                Dialog:Say("<color=yellow>Bạn có quá nhiều ngựa trong hành trang. Hãy cất bớt một ngựa vào thủ khố và chỉ để lại một con.")
                return
            else
                Task:DelItem(me, ngua, nCount)
            end
        end
    end
    
    if countNgua > 0 then
        local nRandomNgua = MathRandom(59, 72)
        me.AddItem(1, 12, nRandomNgua, 4).Bind(1)
    else
        Dialog:Say("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 30tr <color>")
        return
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi50tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,33,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,34,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,73,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,74,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,75,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,76,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,77,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,78,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,79,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,80,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,81,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,82,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,83,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,84,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,85,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,86,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(73,86) 
			local nPhienVuMoc	= {1,12,33,4,0,0}; 
			local nTieuDaoMoc	= {1,12,34,4,0,0}; 
			local nPhienVuHoan	= {1,12,73,4,0,0}; 
			local nTieuDaoHoan	= {1,12,74,4,0,0}; 
			local nLangThien	= {1,12,75,4,0,0}; 
			local nKySy	= {1,12,76,4,0,0}; 
			local nTrucNhat	= {1,12,77,4,0,0}; 
			local nUcVan	= {1,12,78,4,0,0}; 
			local nTuQuy	= {1,12,79,4,0,0}; 
			local nViemLongTu	= {1,12,80,4,0,0}; 
			local nTuyetVu	= {1,12,81,4,0,0}; 
			local nHoaKyLan	= {1,12,82,4,0,0}; 
			local nHacKyLan	= {1,12,83,4,0,0}; 
			local nLamKyLan	= {1,12,84,4,0,0}; 
			local nMachThuong	= {1,12,85,4,0,0}; 
			local nThienHuong	= {1,12,86,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 50tr <color>"));
	return
end
end 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi75tr()
    local nMocNap = me.GetTask(3028, 1)
    if nMocNap < 56750 then
        Dialog:Say("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí")
        return 0
    end
    
    local nCheckNgua = {
        {1, 12, 35, 4}, -- TuQuy Goc
        {1, 12, 36, 4}, -- Viem Long Tu Goc
        {1, 12, 87, 4}, -- PhienVuHoan
        {1, 12, 88, 4}, -- TieuDaoHoan
        {1, 12, 89, 4}, -- LangThien
        {1, 12, 90, 4}, -- KySyBongDem
        {1, 12, 91, 4}, -- TrucNhat
        {1, 12, 92, 4}, -- UcVan
        {1, 12, 93, 4}, -- TuQuy
        {1, 12, 94, 4}, -- ViemLongTu
        {1, 12, 95, 4}, -- TieuTuyetVu
        {1, 12, 96, 4}, -- HoaKyLan
        {1, 12, 97, 4}, -- HacKyLan
        {1, 12, 98, 4}, -- LamKyLan
        {1, 12, 99, 4}, -- PhiSuong
        {1, 12, 100, 4} -- TuyetVuThienHuong
    }
    
    local countNgua = 0
    
    for _, ngua in ipairs(nCheckNgua) do
        local nCount = me.GetItemCountInBags(unpack(ngua))
        countNgua = countNgua + nCount
        if nCount > 0 then
            if countNgua > 1 then
                Dialog:Say("<color=yellow>Bạn có quá nhiều ngựa trong hành trang. Hãy cất bớt một ngựa vào thủ khố và chỉ để lại một con.")
                return
            else
                Task:DelItem(me, ngua, nCount)
            end
        end
    end
    
    if countNgua > 0 then
        local nRandomNgua = MathRandom(87, 100)
        me.AddItem(1, 12, nRandomNgua, 4).Bind(1)
    else
        Dialog:Say("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 75tr <color>")
        return
    end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function HoanNgua:nguamienphi100tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,37,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,101,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,102,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,103,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,104,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,105,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,106,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,107,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,108,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,109,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,110,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,111,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,112,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,113,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,114,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(101,114) 
			local nTieuDaoMoc	= {1,12,37,4,0,0}; 
			local nPhienVuHoan	= {1,12,101,4,0,0}; 
			local nTieuDaoHoan	= {1,12,102,4,0,0}; 
			local nLangThien	= {1,12,103,4,0,0}; 
			local nKySy	= {1,12,104,4,0,0}; 
			local nTrucNhat	= {1,12,105,4,0,0}; 
			local nUcVan	= {1,12,106,4,0,0}; 
			local nTuQuy	= {1,12,107,4,0,0}; 
			local nViemLongTu	= {1,12,108,4,0,0}; 
			local nTuyetVu	= {1,12,109,4,0,0}; 
			local nHoaKyLan	= {1,12,110,4,0,0}; 
			local nHacKyLan	= {1,12,111,4,0,0}; 
			local nLamKyLan	= {1,12,112,4,0,0}; 
			local nMachThuong	= {1,12,113,4,0,0}; 
			local nThienHuong	= {1,12,114,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 100tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi125tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,38,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,115,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,116,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,117,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,118,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,119,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,120,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,121,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,122,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,123,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,124,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,125,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,126,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,127,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,128,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(115,128) 
			local nTieuDaoMoc	= {1,12,38,4,0,0}; 
			local nPhienVuHoan	= {1,12,115,4,0,0}; 
			local nTieuDaoHoan	= {1,12,116,4,0,0}; 
			local nLangThien	= {1,12,117,4,0,0}; 
			local nKySy	= {1,12,118,4,0,0}; 
			local nTrucNhat	= {1,12,119,4,0,0}; 
			local nUcVan	= {1,12,120,4,0,0}; 
			local nTuQuy	= {1,12,121,4,0,0}; 
			local nViemLongTu	= {1,12,122,4,0,0}; 
			local nTuyetVu	= {1,12,123,4,0,0}; 
			local nHoaKyLan	= {1,12,124,4,0,0}; 
			local nHacKyLan	= {1,12,125,4,0,0}; 
			local nLamKyLan	= {1,12,126,4,0,0}; 
			local nMachThuong	= {1,12,127,4,0,0}; 
			local nThienHuong	= {1,12,128,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 125tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi150tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,39,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,129,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,130,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,131,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,132,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,133,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,134,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,135,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,136,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,137,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,138,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,139,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,140,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,141,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,142,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(129,142) 
			local nTieuDaoMoc	= {1,12,39,4,0,0}; 
			local nPhienVuHoan	= {1,12,129,4,0,0}; 
			local nTieuDaoHoan	= {1,12,130,4,0,0}; 
			local nLangThien	= {1,12,131,4,0,0}; 
			local nKySy	= {1,12,132,4,0,0}; 
			local nTrucNhat	= {1,12,133,4,0,0}; 
			local nUcVan	= {1,12,134,4,0,0}; 
			local nTuQuy	= {1,12,135,4,0,0}; 
			local nViemLongTu	= {1,12,136,4,0,0}; 
			local nTuyetVu	= {1,12,137,4,0,0}; 
			local nHoaKyLan	= {1,12,138,4,0,0}; 
			local nHacKyLan	= {1,12,139,4,0,0}; 
			local nLamKyLan	= {1,12,140,4,0,0}; 
			local nMachThuong	= {1,12,141,4,0,0}; 
			local nThienHuong	= {1,12,142,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 150tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi180tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,40,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,143,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,144,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,145,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,146,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,147,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,148,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,149,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,150,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,151,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,152,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,153,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,154,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,155,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,156,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(143,156) 
			local nTieuDaoMoc	= {1,12,40,4,0,0}; 
			local nPhienVuHoan	= {1,12,143,4,0,0}; 
			local nTieuDaoHoan	= {1,12,144,4,0,0}; 
			local nLangThien	= {1,12,145,4,0,0}; 
			local nKySy	= {1,12,146,4,0,0}; 
			local nTrucNhat	= {1,12,147,4,0,0}; 
			local nUcVan	= {1,12,148,4,0,0}; 
			local nTuQuy	= {1,12,149,4,0,0}; 
			local nViemLongTu	= {1,12,150,4,0,0}; 
			local nTuyetVu	= {1,12,151,4,0,0}; 
			local nHoaKyLan	= {1,12,152,4,0,0}; 
			local nHacKyLan	= {1,12,153,4,0,0}; 
			local nLamKyLan	= {1,12,154,4,0,0}; 
			local nMachThuong	= {1,12,155,4,0,0}; 
			local nThienHuong	= {1,12,156,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 180tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi200tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,41,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,157,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,158,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,159,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,160,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,161,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,162,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,163,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,164,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,165,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,166,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,167,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,168,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,169,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,170,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(157,170) 
			local nTieuDaoMoc	= {1,12,41,4,0,0}; 
			local nPhienVuHoan	= {1,12,157,4,0,0}; 
			local nTieuDaoHoan	= {1,12,158,4,0,0}; 
			local nLangThien	= {1,12,159,4,0,0}; 
			local nKySy	= {1,12,160,4,0,0}; 
			local nTrucNhat	= {1,12,161,4,0,0}; 
			local nUcVan	= {1,12,162,4,0,0}; 
			local nTuQuy	= {1,12,163,4,0,0}; 
			local nViemLongTu	= {1,12,164,4,0,0}; 
			local nTuyetVu	= {1,12,165,4,0,0}; 
			local nHoaKyLan	= {1,12,166,4,0,0}; 
			local nHacKyLan	= {1,12,167,4,0,0}; 
			local nLamKyLan	= {1,12,168,4,0,0}; 
			local nMachThuong	= {1,12,169,4,0,0}; 
			local nThienHuong	= {1,12,170,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 200tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamienphi250tr()
local nMocNap = me.GetTask(3028,1)
if nMocNap < 56750 then
		Dialog:Say(string.format("<color=yellow>Bạn chưa tích lũy đủ mốc nạp tiền 50tr nên chưa thể sử dụng tính năng hoán miễn phí"));
return 0;
end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,42,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,171,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,172,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,173,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,174,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,175,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,176,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,177,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,178,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,179,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,180,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,181,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,182,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,183,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,184,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(171,184) 
			local nTieuDaoMoc	= {1,12,42,4,0,0}; 
			local nPhienVuHoan	= {1,12,171,4,0,0}; 
			local nTieuDaoHoan	= {1,12,172,4,0,0}; 
			local nLangThien	= {1,12,173,4,0,0}; 
			local nKySy	= {1,12,174,4,0,0}; 
			local nTrucNhat	= {1,12,175,4,0,0}; 
			local nUcVan	= {1,12,176,4,0,0}; 
			local nTuQuy	= {1,12,177,4,0,0}; 
			local nViemLongTu	= {1,12,178,4,0,0}; 
			local nTuyetVu	= {1,12,179,4,0,0}; 
			local nHoaKyLan	= {1,12,180,4,0,0}; 
			local nHacKyLan	= {1,12,181,4,0,0}; 
			local nLamKyLan	= {1,12,182,4,0,0}; 
			local nMachThuong	= {1,12,183,4,0,0}; 
			local nThienHuong	= {1,12,184,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 250tr <color>"));
	return
end
end
-------------------------------------------------------Trả Phí-----------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi20tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end

local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,29,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,30,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,45,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,46,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,47,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,48,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,49,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,50,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,51,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,52,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,53,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,54,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,55,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,56,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,57,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,58,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(45,58)
			local nPhienVuMoc	= {1,12,29,4,0,0}; 
			local nTieuDaoMoc	= {1,12,30,4,0,0}; 
			local nPhienVuHoan	= {1,12,45,4,0,0}; 
			local nTieuDaoHoan	= {1,12,46,4,0,0}; 
			local nLangThien	= {1,12,47,4,0,0}; 
			local nKySy	= {1,12,48,4,0,0}; 
			local nTrucNhat	= {1,12,49,4,0,0}; 
			local nUcVan	= {1,12,50,4,0,0}; 
			local nTuQuy	= {1,12,51,4,0,0}; 
			local nViemLongTu	= {1,12,52,4,0,0}; 
			local nTuyetVu	= {1,12,53,4,0,0}; 
			local nHoaKyLan	= {1,12,54,4,0,0}; 
			local nHacKyLan	= {1,12,55,4,0,0}; 
			local nLamKyLan	= {1,12,56,4,0,0}; 
			local nMachThuong	= {1,12,57,4,0,0}; 
			local nThienHuong	= {1,12,58,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 20tr <color>"));
	return
end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function HoanNgua:nguatraphi30tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,31,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,32,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,59,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,60,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,61,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,62,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,63,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,64,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,65,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,66,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,67,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,68,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,69,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,70,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,71,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,72,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(59,72)
			local nPhienVuMoc	= {1,12,31,4,0,0}; 
			local nTieuDaoMoc	= {1,12,32,4,0,0}; 
			local nPhienVuHoan	= {1,12,59,4,0,0}; 
			local nTieuDaoHoan	= {1,12,60,4,0,0}; 
			local nLangThien	= {1,12,61,4,0,0}; 
			local nKySy	= {1,12,62,4,0,0}; 
			local nTrucNhat	= {1,12,63,4,0,0}; 
			local nUcVan	= {1,12,64,4,0,0}; 
			local nTuQuy	= {1,12,65,4,0,0}; 
			local nViemLongTu	= {1,12,66,4,0,0}; 
			local nTuyetVu	= {1,12,67,4,0,0}; 
			local nHoaKyLan	= {1,12,68,4,0,0}; 
			local nHacKyLan	= {1,12,69,4,0,0}; 
			local nLamKyLan	= {1,12,70,4,0,0}; 
			local nMachThuong	= {1,12,71,4,0,0}; 
			local nThienHuong	= {1,12,72,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 30tr <color>"));
	return
end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi50tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,33,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,34,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,73,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,74,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,75,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,76,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,77,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,78,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,79,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,80,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,81,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,82,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,83,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,84,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,85,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,86,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(73,86) 
			local nPhienVuMoc	= {1,12,33,4,0,0}; 
			local nTieuDaoMoc	= {1,12,34,4,0,0}; 
			local nPhienVuHoan	= {1,12,73,4,0,0}; 
			local nTieuDaoHoan	= {1,12,74,4,0,0}; 
			local nLangThien	= {1,12,75,4,0,0}; 
			local nKySy	= {1,12,76,4,0,0}; 
			local nTrucNhat	= {1,12,77,4,0,0}; 
			local nUcVan	= {1,12,78,4,0,0}; 
			local nTuQuy	= {1,12,79,4,0,0}; 
			local nViemLongTu	= {1,12,80,4,0,0}; 
			local nTuyetVu	= {1,12,81,4,0,0}; 
			local nHoaKyLan	= {1,12,82,4,0,0}; 
			local nHacKyLan	= {1,12,83,4,0,0}; 
			local nLamKyLan	= {1,12,84,4,0,0}; 
			local nMachThuong	= {1,12,85,4,0,0}; 
			local nThienHuong	= {1,12,86,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 50tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi75tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckPhienVuMoc = me.GetItemCountInBags(1,12,35,4) 
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,36,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,87,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,88,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,89,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,90,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,91,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,92,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,93,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,94,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,95,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,96,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,97,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,98,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,99,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,100,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(87,100) 
			local nPhienVuMoc	= {1,12,35,4,0,0}; 
			local nTieuDaoMoc	= {1,12,36,4,0,0}; 
			local nPhienVuHoan	= {1,12,87,4,0,0}; 
			local nTieuDaoHoan	= {1,12,88,4,0,0}; 
			local nLangThien	= {1,12,89,4,0,0}; 
			local nKySy	= {1,12,90,4,0,0}; 
			local nTrucNhat	= {1,12,91,4,0,0}; 
			local nUcVan	= {1,12,92,4,0,0}; 
			local nTuQuy	= {1,12,93,4,0,0}; 
			local nViemLongTu	= {1,12,94,4,0,0}; 
			local nTuyetVu	= {1,12,95,4,0,0}; 
			local nHoaKyLan	= {1,12,96,4,0,0}; 
			local nHacKyLan	= {1,12,97,4,0,0}; 
			local nLamKyLan	= {1,12,98,4,0,0}; 
			local nMachThuong	= {1,12,99,4,0,0}; 
			local nThienHuong	= {1,12,100,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 75tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function HoanNgua:nguatraphi100tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,37,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,101,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,102,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,103,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,104,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,105,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,106,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,107,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,108,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,109,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,110,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,111,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,112,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,113,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,114,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(101,114) 
			local nTieuDaoMoc	= {1,12,37,4,0,0}; 
			local nPhienVuHoan	= {1,12,101,4,0,0}; 
			local nTieuDaoHoan	= {1,12,102,4,0,0}; 
			local nLangThien	= {1,12,103,4,0,0}; 
			local nKySy	= {1,12,104,4,0,0}; 
			local nTrucNhat	= {1,12,105,4,0,0}; 
			local nUcVan	= {1,12,106,4,0,0}; 
			local nTuQuy	= {1,12,107,4,0,0}; 
			local nViemLongTu	= {1,12,108,4,0,0}; 
			local nTuyetVu	= {1,12,109,4,0,0}; 
			local nHoaKyLan	= {1,12,110,4,0,0}; 
			local nHacKyLan	= {1,12,111,4,0,0}; 
			local nLamKyLan	= {1,12,112,4,0,0}; 
			local nMachThuong	= {1,12,113,4,0,0}; 
			local nThienHuong	= {1,12,114,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 100tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi125tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,38,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,115,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,116,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,117,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,118,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,119,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,120,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,121,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,122,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,123,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,124,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,125,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,126,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,127,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,128,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(115,128) 
			local nTieuDaoMoc	= {1,12,38,4,0,0}; 
			local nPhienVuHoan	= {1,12,115,4,0,0}; 
			local nTieuDaoHoan	= {1,12,116,4,0,0}; 
			local nLangThien	= {1,12,117,4,0,0}; 
			local nKySy	= {1,12,118,4,0,0}; 
			local nTrucNhat	= {1,12,119,4,0,0}; 
			local nUcVan	= {1,12,120,4,0,0}; 
			local nTuQuy	= {1,12,121,4,0,0}; 
			local nViemLongTu	= {1,12,122,4,0,0}; 
			local nTuyetVu	= {1,12,123,4,0,0}; 
			local nHoaKyLan	= {1,12,124,4,0,0}; 
			local nHacKyLan	= {1,12,125,4,0,0}; 
			local nLamKyLan	= {1,12,126,4,0,0}; 
			local nMachThuong	= {1,12,127,4,0,0}; 
			local nThienHuong	= {1,12,128,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 125tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi150tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,39,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,129,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,130,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,131,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,132,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,133,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,134,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,135,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,136,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,137,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,138,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,139,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,140,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,141,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,142,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(129,142) 
			local nTieuDaoMoc	= {1,12,39,4,0,0}; 
			local nPhienVuHoan	= {1,12,129,4,0,0}; 
			local nTieuDaoHoan	= {1,12,130,4,0,0}; 
			local nLangThien	= {1,12,131,4,0,0}; 
			local nKySy	= {1,12,132,4,0,0}; 
			local nTrucNhat	= {1,12,133,4,0,0}; 
			local nUcVan	= {1,12,134,4,0,0}; 
			local nTuQuy	= {1,12,135,4,0,0}; 
			local nViemLongTu	= {1,12,136,4,0,0}; 
			local nTuyetVu	= {1,12,137,4,0,0}; 
			local nHoaKyLan	= {1,12,138,4,0,0}; 
			local nHacKyLan	= {1,12,139,4,0,0}; 
			local nLamKyLan	= {1,12,140,4,0,0}; 
			local nMachThuong	= {1,12,141,4,0,0}; 
			local nThienHuong	= {1,12,142,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 150tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi180tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,40,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,143,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,144,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,145,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,146,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,147,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,148,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,149,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,150,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,151,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,152,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,153,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,154,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,155,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,156,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(143,156) 
			local nTieuDaoMoc	= {1,12,40,4,0,0}; 
			local nPhienVuHoan	= {1,12,143,4,0,0}; 
			local nTieuDaoHoan	= {1,12,144,4,0,0}; 
			local nLangThien	= {1,12,145,4,0,0}; 
			local nKySy	= {1,12,146,4,0,0}; 
			local nTrucNhat	= {1,12,147,4,0,0}; 
			local nUcVan	= {1,12,148,4,0,0}; 
			local nTuQuy	= {1,12,149,4,0,0}; 
			local nViemLongTu	= {1,12,150,4,0,0}; 
			local nTuyetVu	= {1,12,151,4,0,0}; 
			local nHoaKyLan	= {1,12,152,4,0,0}; 
			local nHacKyLan	= {1,12,153,4,0,0}; 
			local nLamKyLan	= {1,12,154,4,0,0}; 
			local nMachThuong	= {1,12,155,4,0,0}; 
			local nThienHuong	= {1,12,156,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 180tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi200tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,41,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,157,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,158,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,159,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,160,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,161,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,162,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,163,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,164,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,165,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,166,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,167,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,168,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,169,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,170,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(157,170) 
			local nTieuDaoMoc	= {1,12,41,4,0,0}; 
			local nPhienVuHoan	= {1,12,157,4,0,0}; 
			local nTieuDaoHoan	= {1,12,158,4,0,0}; 
			local nLangThien	= {1,12,159,4,0,0}; 
			local nKySy	= {1,12,160,4,0,0}; 
			local nTrucNhat	= {1,12,161,4,0,0}; 
			local nUcVan	= {1,12,162,4,0,0}; 
			local nTuQuy	= {1,12,163,4,0,0}; 
			local nViemLongTu	= {1,12,164,4,0,0}; 
			local nTuyetVu	= {1,12,165,4,0,0}; 
			local nHoaKyLan	= {1,12,166,4,0,0}; 
			local nHacKyLan	= {1,12,167,4,0,0}; 
			local nLamKyLan	= {1,12,168,4,0,0}; 
			local nMachThuong	= {1,12,169,4,0,0}; 
			local nThienHuong	= {1,12,170,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 200tr <color>"));
	return
end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HoanNgua:nguatraphi250tr()
	local nMyCoin = me.nCoin;
	if (nMyCoin < 5000000) then
	Dialog:Say("Bạn không đủ <color=red>500 vạn đồng<color>");
    return 0; 
	end
local nCheckTieuDaoMoc = me.GetItemCountInBags(1,12,42,4) 
local nCheckPhienVuHoan = me.GetItemCountInBags(1,12,171,4) 
local nCheckTieuDaoHoan = me.GetItemCountInBags(1,12,172,4) 
local nCheckLangThien = me.GetItemCountInBags(1,12,173,4) 
local nCheckKySyBongDem = me.GetItemCountInBags(1,12,174,4) 
local nCheckTrucNhat = me.GetItemCountInBags(1,12,175,4) 
local nCheckUcVan = me.GetItemCountInBags(1,12,176,4) 
local nCheckTuQuy = me.GetItemCountInBags(1,12,177,4) 
local nCheckViemLongTu = me.GetItemCountInBags(1,12,178,4) 
local nCheckTieuTuyetVu = me.GetItemCountInBags(1,12,179,4) 
local nCheckHoaKyLan = me.GetItemCountInBags(1,12,180,4) 
local nCheckHacKyLan = me.GetItemCountInBags(1,12,181,4) 
local nCheckLamKyLan = me.GetItemCountInBags(1,12,182,4) 
local nCheckPhiSuong = me.GetItemCountInBags(1,12,183,4) 
local nCheckTuyetVuThienHuong = me.GetItemCountInBags(1,12,184,4) 
if nCheckTieuDaoMoc > 0 or nCheckPhienVuHoan > 0 or nCheckTieuDaoHoan > 0 or nCheckLangThien > 0 or nCheckKySyBongDem > 0 or nCheckTrucNhat > 0 or nCheckUcVan > 0 or nCheckTuQuy > 0 or nCheckViemLongTu > 0 or nCheckTieuTuyetVu > 0 or nCheckHoaKyLan > 0 or nCheckHacKyLan > 0 or nCheckLamKyLan > 0 or nCheckPhiSuong > 0 or nCheckTuyetVuThienHuong > 0 then 

local nRandomNgua = MathRandom(171,184) 
			local nTieuDaoMoc	= {1,12,42,4,0,0}; 
			local nPhienVuHoan	= {1,12,171,4,0,0}; 
			local nTieuDaoHoan	= {1,12,172,4,0,0}; 
			local nLangThien	= {1,12,173,4,0,0}; 
			local nKySy	= {1,12,174,4,0,0}; 
			local nTrucNhat	= {1,12,175,4,0,0}; 
			local nUcVan	= {1,12,176,4,0,0}; 
			local nTuQuy	= {1,12,177,4,0,0}; 
			local nViemLongTu	= {1,12,178,4,0,0}; 
			local nTuyetVu	= {1,12,179,4,0,0}; 
			local nHoaKyLan	= {1,12,180,4,0,0}; 
			local nHacKyLan	= {1,12,181,4,0,0}; 
			local nLamKyLan	= {1,12,182,4,0,0}; 
			local nMachThuong	= {1,12,183,4,0,0}; 
			local nThienHuong	= {1,12,184,4,0,0}; 
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nTieuDaoHoan, 1);
Task:DelItem(me, nLangThien, 1);
Task:DelItem(me, nKySy, 1);
Task:DelItem(me, nTrucNhat, 1);
Task:DelItem(me, nUcVan, 1);
Task:DelItem(me, nTuQuy, 1);
Task:DelItem(me, nViemLongTu, 1);
Task:DelItem(me, nTuyetVu, 1);
Task:DelItem(me, nHoaKyLan, 1);
Task:DelItem(me, nHacKyLan, 1);
Task:DelItem(me, nLamKyLan, 1);
Task:DelItem(me, nMachThuong, 1);
Task:DelItem(me, nThienHuong, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
me.AddJbCoin(-5000000)
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 250tr <color>"));
	return
end
end


-------------------------------------------------------Trả Phí---new--------------------------------------------------------------------------------------------------------------
function HoanNgua:nguamoi10tr()
	local nTichNap = me.GetTask(3028,1)
	local nMyCoin = me.nCoin;
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
		if (nMyCoin < 13500000) then
	Dialog:Say("Bạn đạt mốc nạp 10tr được giảm 10% giá và Bạn không đủ <color=red>1350 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
		if (nMyCoin < 10500000) then
	Dialog:Say("Bạn đạt mốc nạp 20tr được giảm 30% giá và Bạn không đủ <color=red>1050 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
		if (nMyCoin < 7500000) then
	Dialog:Say("Bạn đạt mốc nạp 30tr được giảm 50% giá và Bạn không đủ <color=red>750 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
	if (nMyCoin < 4500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 70% giá Bạn không đủ <color=red>450 vạn đồng<color>");
    return 0; 
	end
	elseif  nTichNap > 91750 then 
	if (nMyCoin < 1500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 90% giá Bạn không đủ <color=red>150 vạn đồng<color>");
    return 0; 
	end
	else
		if (nMyCoin < 15000000) then
	Dialog:Say("Mốc nạp của bạn hiện tại chưa được giảm giá và Bạn không đủ <color=red>1500 vạn đồng<color>");
    return 0; 
	end
	end

local nCheckHyHy = me.GetItemCountInBags(1,12,26,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,27,4) 
local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20265,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20266,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20267,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20268,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20269,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20270,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20271,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20272,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20273,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20274,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20275,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20276,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20277,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20278,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20279,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20280,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20281,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20282,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20283,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20284,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20285,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20286,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20287,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckTuyetHon > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(20265,20287)
			local nPhienVuMoc	= {1,12,26,4,0,0}; 
			local nTieuDaoMoc	= {1,12,27,4,0,0}; 
			local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20265,4,0,0}; 
			local nPanDa	= {1,12,20266,4,0,0}; 
			local nThuyLongVuong	= {1,12,20267,4,0,0}; 
			local nLamMaoTu	= {1,12,20268,4,0,0}; 
			local nTaiThaiTue	= {1,12,20269,4,0,0}; 
			local nViemLangVuong	= {1,12,20270,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20271,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20272,4,0,0}; 
			local nLamMaThietKy	= {1,12,20273,4,0,0}; 
			local nHacMaThietKy	= {1,12,20274,4,0,0}; 
			local nHoaViemTu	= {1,12,20275,4,0,0}; 
			local nKimLangVuong	= {1,12,20276,4,0,0}; 
			local nLonDo	= {1,12,20277,4,0,0}; 
			local nLonXanh	= {1,12,20278,4,0,0}; 
			local nLonDen	= {1,12,20279,4,0,0}; 
			local nLonXanhDuong	= {1,12,20280,4,0,0}; 
			local nHuyetLongCau	= {1,12,20281,4,0,0}; 
			local nNgocKyLan	= {1,12,20282,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20283,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20284,4,0,0}; 
			local nBachNguu	= {1,12,20285,4,0,0}; 
			local nHoaNguu	= {1,12,20286,4,0,0}; 
			local nHacNguu	= {1,12,20287,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
me.AddJbCoin(-13500000)
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
me.AddJbCoin(-10500000)
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
me.AddJbCoin(-7500000)
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
me.AddJbCoin(-4500000)
	elseif nTichNap > 91750 then 
me.AddJbCoin(-1500000)
else
me.AddJbCoin(-15000000)
	end
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 10tr <color>"));
	return
end
end

function HoanNgua:nguamoi20tr()
	local nTichNap = me.GetTask(3028,1)
	local nMyCoin = me.nCoin;
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
		if (nMyCoin < 13500000) then
	Dialog:Say("Bạn đạt mốc nạp 10tr được giảm 10% giá và Bạn không đủ <color=red>1350 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
		if (nMyCoin < 10500000) then
	Dialog:Say("Bạn đạt mốc nạp 20tr được giảm 30% giá và Bạn không đủ <color=red>1050 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
		if (nMyCoin < 7500000) then
	Dialog:Say("Bạn đạt mốc nạp 30tr được giảm 50% giá và Bạn không đủ <color=red>750 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
	if (nMyCoin < 4500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 70% giá Bạn không đủ <color=red>450 vạn đồng<color>");
    return 0; 
	end
	elseif  nTichNap > 91750 then 
	if (nMyCoin < 1500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 90% giá Bạn không đủ <color=red>150 vạn đồng<color>");
    return 0; 
	end
	else
		if (nMyCoin < 15000000) then
	Dialog:Say("Mốc nạp của bạn hiện tại chưa được giảm giá và Bạn không đủ <color=red>1500 vạn đồng<color>");
    return 0; 
	end
	end

local nCheckHyHy = me.GetItemCountInBags(1,12,29,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,30,4) 
-- local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20288,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20289,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20290,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20291,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20292,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20293,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20294,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20295,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20296,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20297,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20298,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20299,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20300,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20301,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20302,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20303,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20304,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20305,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20306,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20307,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20308,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20309,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20310,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(20288,20310)
			local nPhienVuMoc	= {1,12,29,4,0,0}; 
			local nTieuDaoMoc	= {1,12,30,4,0,0}; 
			-- local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20288,4,0,0}; 
			local nPanDa	= {1,12,20289,4,0,0}; 
			local nThuyLongVuong	= {1,12,20290,4,0,0}; 
			local nLamMaoTu	= {1,12,20291,4,0,0}; 
			local nTaiThaiTue	= {1,12,20292,4,0,0}; 
			local nViemLangVuong	= {1,12,20293,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20294,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20295,4,0,0}; 
			local nLamMaThietKy	= {1,12,20296,4,0,0}; 
			local nHacMaThietKy	= {1,12,20297,4,0,0}; 
			local nHoaViemTu	= {1,12,20298,4,0,0}; 
			local nKimLangVuong	= {1,12,20299,4,0,0}; 
			local nLonDo	= {1,12,20300,4,0,0}; 
			local nLonXanh	= {1,12,20301,4,0,0}; 
			local nLonDen	= {1,12,20302,4,0,0}; 
			local nLonXanhDuong	= {1,12,20303,4,0,0}; 
			local nHuyetLongCau	= {1,12,20304,4,0,0}; 
			local nNgocKyLan	= {1,12,20305,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20306,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20307,4,0,0}; 
			local nBachNguu	= {1,12,20308,4,0,0}; 
			local nHoaNguu	= {1,12,20309,4,0,0}; 
			local nHacNguu	= {1,12,20310,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
-- Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
me.AddJbCoin(-13500000)
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
me.AddJbCoin(-10500000)
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
me.AddJbCoin(-7500000)
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
me.AddJbCoin(-4500000)
	elseif nTichNap > 91750 then 
me.AddJbCoin(-1500000)
else
me.AddJbCoin(-15000000)
	end
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 20tr <color>"));
	return
end
end

function HoanNgua:nguamoi30tr()
	local nTichNap = me.GetTask(3028,1)
	local nMyCoin = me.nCoin;
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
		if (nMyCoin < 13500000) then
	Dialog:Say("Bạn đạt mốc nạp 10tr được giảm 10% giá và Bạn không đủ <color=red>1350 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
		if (nMyCoin < 10500000) then
	Dialog:Say("Bạn đạt mốc nạp 20tr được giảm 30% giá và Bạn không đủ <color=red>1050 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
		if (nMyCoin < 7500000) then
	Dialog:Say("Bạn đạt mốc nạp 30tr được giảm 50% giá và Bạn không đủ <color=red>750 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
	if (nMyCoin < 4500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 70% giá Bạn không đủ <color=red>450 vạn đồng<color>");
    return 0; 
	end
	elseif  nTichNap > 91750 then 
	if (nMyCoin < 1500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 90% giá Bạn không đủ <color=red>150 vạn đồng<color>");
    return 0; 
	end
	else
		if (nMyCoin < 15000000) then
	Dialog:Say("Mốc nạp của bạn hiện tại chưa được giảm giá và Bạn không đủ <color=red>1500 vạn đồng<color>");
    return 0; 
	end
	end

local nCheckHyHy = me.GetItemCountInBags(1,12,31,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,32,4) 
-- local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20311,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20312,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20313,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20314,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20315,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20316,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20317,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20318,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20319,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20320,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20321,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20322,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20323,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20324,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20325,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20326,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20327,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20328,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20329,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20330,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20331,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20332,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20333,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(20311,20333)
			local nPhienVuMoc	= {1,12,31,4,0,0}; 
			local nTieuDaoMoc	= {1,12,32,4,0,0}; 
			-- local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20311,4,0,0}; 
			local nPanDa	= {1,12,20312,4,0,0}; 
			local nThuyLongVuong	= {1,12,20313,4,0,0}; 
			local nLamMaoTu	= {1,12,20314,4,0,0}; 
			local nTaiThaiTue	= {1,12,20315,4,0,0}; 
			local nViemLangVuong	= {1,12,20316,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20317,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20318,4,0,0}; 
			local nLamMaThietKy	= {1,12,20319,4,0,0}; 
			local nHacMaThietKy	= {1,12,20320,4,0,0}; 
			local nHoaViemTu	= {1,12,20321,4,0,0}; 
			local nKimLangVuong	= {1,12,20322,4,0,0}; 
			local nLonDo	= {1,12,20323,4,0,0}; 
			local nLonXanh	= {1,12,20324,4,0,0}; 
			local nLonDen	= {1,12,20325,4,0,0}; 
			local nLonXanhDuong	= {1,12,20326,4,0,0}; 
			local nHuyetLongCau	= {1,12,20327,4,0,0}; 
			local nNgocKyLan	= {1,12,20328,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20329,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20330,4,0,0}; 
			local nBachNguu	= {1,12,20331,4,0,0}; 
			local nHoaNguu	= {1,12,20332,4,0,0}; 
			local nHacNguu	= {1,12,20333,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
-- Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
me.AddJbCoin(-13500000)
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
me.AddJbCoin(-10500000)
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
me.AddJbCoin(-7500000)
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
me.AddJbCoin(-4500000)
	elseif nTichNap > 91750 then 
me.AddJbCoin(-1500000)
else
me.AddJbCoin(-15000000)
	end
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 30tr <color>"));
	return
end
end

function HoanNgua:nguamoi50tr()
	local nTichNap = me.GetTask(3028,1)
	local nMyCoin = me.nCoin;
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
		if (nMyCoin < 13500000) then
	Dialog:Say("Bạn đạt mốc nạp 10tr được giảm 10% giá và Bạn không đủ <color=red>1350 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
		if (nMyCoin < 10500000) then
	Dialog:Say("Bạn đạt mốc nạp 20tr được giảm 30% giá và Bạn không đủ <color=red>1050 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
		if (nMyCoin < 7500000) then
	Dialog:Say("Bạn đạt mốc nạp 30tr được giảm 50% giá và Bạn không đủ <color=red>750 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
	if (nMyCoin < 4500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 70% giá Bạn không đủ <color=red>450 vạn đồng<color>");
    return 0; 
	end
	elseif  nTichNap > 91750 then 
	if (nMyCoin < 1500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 90% giá Bạn không đủ <color=red>150 vạn đồng<color>");
    return 0; 
	end
	else
		if (nMyCoin < 15000000) then
	Dialog:Say("Mốc nạp của bạn hiện tại chưa được giảm giá và Bạn không đủ <color=red>1500 vạn đồng<color>");
    return 0; 
	end
	end

local nCheckHyHy = me.GetItemCountInBags(1,12,33,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,34,4) 
-- local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20334,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20335,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20336,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20337,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20338,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20339,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20340,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20341,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20342,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20343,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20344,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20345,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20346,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20347,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20348,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20349,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20350,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20351,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20352,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20353,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20354,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20355,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20356,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(20334,20356)
			local nPhienVuMoc	= {1,12,33,4,0,0}; 
			local nTieuDaoMoc	= {1,12,34,4,0,0}; 
			-- local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20334,4,0,0}; 
			local nPanDa	= {1,12,20335,4,0,0}; 
			local nThuyLongVuong	= {1,12,20336,4,0,0}; 
			local nLamMaoTu	= {1,12,20337,4,0,0}; 
			local nTaiThaiTue	= {1,12,20338,4,0,0}; 
			local nViemLangVuong	= {1,12,20339,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20340,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20341,4,0,0}; 
			local nLamMaThietKy	= {1,12,20342,4,0,0}; 
			local nHacMaThietKy	= {1,12,20343,4,0,0}; 
			local nHoaViemTu	= {1,12,20344,4,0,0}; 
			local nKimLangVuong	= {1,12,20345,4,0,0}; 
			local nLonDo	= {1,12,20346,4,0,0}; 
			local nLonXanh	= {1,12,20347,4,0,0}; 
			local nLonDen	= {1,12,20348,4,0,0}; 
			local nLonXanhDuong	= {1,12,20349,4,0,0}; 
			local nHuyetLongCau	= {1,12,20350,4,0,0}; 
			local nNgocKyLan	= {1,12,20351,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20352,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20353,4,0,0}; 
			local nBachNguu	= {1,12,20354,4,0,0}; 
			local nHoaNguu	= {1,12,20355,4,0,0}; 
			local nHacNguu	= {1,12,20356,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
-- Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
me.AddJbCoin(-13500000)
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
me.AddJbCoin(-10500000)
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
me.AddJbCoin(-7500000)
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
me.AddJbCoin(-4500000)
	elseif nTichNap > 91750 then 
me.AddJbCoin(-1500000)
else
me.AddJbCoin(-15000000)
	end
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 50tr <color>"));
	return
end
end

function HoanNgua:nguamoi75tr()
	local nTichNap = me.GetTask(3028,1)
	local nMyCoin = me.nCoin;
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
		if (nMyCoin < 13500000) then
	Dialog:Say("Bạn đạt mốc nạp 10tr được giảm 10% giá và Bạn không đủ <color=red>1350 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
		if (nMyCoin < 10500000) then
	Dialog:Say("Bạn đạt mốc nạp 20tr được giảm 30% giá và Bạn không đủ <color=red>1050 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
		if (nMyCoin < 7500000) then
	Dialog:Say("Bạn đạt mốc nạp 30tr được giảm 50% giá và Bạn không đủ <color=red>750 vạn đồng<color>");
    return 0; 
	end
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
	if (nMyCoin < 4500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 70% giá Bạn không đủ <color=red>450 vạn đồng<color>");
    return 0; 
	end
	elseif  nTichNap > 91750 then 
	if (nMyCoin < 1500000) then
	Dialog:Say("Bạn đạt mốc nạp 75tr được giảm 90% giá Bạn không đủ <color=red>150 vạn đồng<color>");
    return 0; 
	end
	else
		if (nMyCoin < 15000000) then
	Dialog:Say("Mốc nạp của bạn hiện tại chưa được giảm giá và Bạn không đủ <color=red>1500 vạn đồng<color>");
    return 0; 
	end
	end
	
local nCheckHyHy = me.GetItemCountInBags(1,12,35,4) 
local nCheckHoCat = me.GetItemCountInBags(1,12,36,4) 
-- local nCheckTuyetHon = me.GetItemCountInBags(1,12,28,4) 
local nCheckHoaVuThienHuong = me.GetItemCountInBags(1,12,20357,4) 
local nCheckPanda = me.GetItemCountInBags(1,12,20358,4) 
local nCheckThuyLongVuong = me.GetItemCountInBags(1,12,20359,4) 
local nCheckLamMaoTu = me.GetItemCountInBags(1,12,20360,4) 
local nCheckTaiThaiTue = me.GetItemCountInBags(1,12,20361,4) 
local nCheckViemLangVuong = me.GetItemCountInBags(1,12,20362,4) 
local nCheckHacVuThienHuong = me.GetItemCountInBags(1,12,20363,4) 
local nCheckHuyetMaThietKy = me.GetItemCountInBags(1,12,20364,4) 
local nCheckLamMaThietKy = me.GetItemCountInBags(1,12,20365,4) 
local nCheckHacMaThietKy = me.GetItemCountInBags(1,12,20366,4) 
local nCheckHoaViemTu = me.GetItemCountInBags(1,12,20367,4) 
local nCheckKimLangVuong = me.GetItemCountInBags(1,12,20368,4) 
local nCheckLonDo = me.GetItemCountInBags(1,12,20369,4) 
local nCheckLonXanh = me.GetItemCountInBags(1,12,20370,4) 
local nCheckLonDen = me.GetItemCountInBags(1,12,20371,4) 
local nCheckLonXanhDuong = me.GetItemCountInBags(1,12,20372,4) 
local nCheckHuyetLongCau = me.GetItemCountInBags(1,12,20373,4) 
local nCheckNgocKyLan = me.GetItemCountInBags(1,12,20374,4) 
local nCheckHanHuyetLongCau = me.GetItemCountInBags(1,12,20375,4) 
local nCheckBachNgocKyLan = me.GetItemCountInBags(1,12,20376,4) 
local nCheckBachNguu = me.GetItemCountInBags(1,12,20377,4) 
local nCheckHoaNguu = me.GetItemCountInBags(1,12,20378,4) 
local nCheckHacNguu = me.GetItemCountInBags(1,12,20379,4) 

if nCheckHoCat > 0 or nCheckHyHy > 0 or nCheckHoaVuThienHuong > 0 or nCheckPanda > 0 or nCheckThuyLongVuong > 0 or nCheckLamMaoTu > 0 or nCheckTaiThaiTue > 0 or nCheckViemLangVuong > 0 or nCheckHacVuThienHuong > 0 or nCheckHuyetMaThietKy > 0 or nCheckLamMaThietKy > 0 or nCheckHacMaThietKy > 0 or nCheckHoaViemTu > 0 or nCheckKimLangVuong > 0 or nCheckLonDo > 0 or nCheckLonXanh > 0 or nCheckLonDen > 0 or nCheckLonXanhDuong > 0 or nCheckHuyetLongCau > 0 or nCheckNgocKyLan > 0 or nCheckHanHuyetLongCau > 0 or nCheckBachNgocKyLan > 0 or nCheckBachNguu > 0 or nCheckHoaNguu > 0 or nCheckHacNguu > 0 then 

local nRandomNgua = MathRandom(20357,20379)
			local nPhienVuMoc	= {1,12,35,4,0,0}; 
			local nTieuDaoMoc	= {1,12,36,4,0,0}; 
			-- local nPhienVuHoan	= {1,12,28,4,0,0}; 
			local nHoaVuThienHuong	= {1,12,20357,4,0,0}; 
			local nPanDa	= {1,12,20358,4,0,0}; 
			local nThuyLongVuong	= {1,12,20359,4,0,0}; 
			local nLamMaoTu	= {1,12,20360,4,0,0}; 
			local nTaiThaiTue	= {1,12,20361,4,0,0}; 
			local nViemLangVuong	= {1,12,20362,4,0,0}; 
			local nHacVuThienHuong	= {1,12,20363,4,0,0}; 
			local nHuyetMaThietKy	= {1,12,20364,4,0,0}; 
			local nLamMaThietKy	= {1,12,20365,4,0,0}; 
			local nHacMaThietKy	= {1,12,20366,4,0,0}; 
			local nHoaViemTu	= {1,12,20367,4,0,0}; 
			local nKimLangVuong	= {1,12,20368,4,0,0}; 
			local nLonDo	= {1,12,20369,4,0,0}; 
			local nLonXanh	= {1,12,20370,4,0,0}; 
			local nLonDen	= {1,12,20371,4,0,0}; 
			local nLonXanhDuong	= {1,12,20372,4,0,0}; 
			local nHuyetLongCau	= {1,12,20373,4,0,0}; 
			local nNgocKyLan	= {1,12,20374,4,0,0}; 
			local nHanHuyetLongCau	= {1,12,20375,4,0,0}; 
			local nBachNgocKyLan	= {1,12,20376,4,0,0}; 
			local nBachNguu	= {1,12,20377,4,0,0}; 
			local nHoaNguu	= {1,12,20378,4,0,0}; 
			local nHacNguu	= {1,12,20379,4,0,0}; 
Task:DelItem(me, nPhienVuMoc, 1);
Task:DelItem(me, nTieuDaoMoc, 1);
-- Task:DelItem(me, nPhienVuHoan, 1);
Task:DelItem(me, nHoaVuThienHuong, 1);
Task:DelItem(me, nPanDa, 1);
Task:DelItem(me, nThuyLongVuong, 1);
Task:DelItem(me, nLamMaoTu, 1);
Task:DelItem(me, nTaiThaiTue, 1);
Task:DelItem(me, nViemLangVuong, 1);
Task:DelItem(me, nHacVuThienHuong, 1);
Task:DelItem(me, nHuyetMaThietKy, 1);
Task:DelItem(me, nLamMaThietKy, 1);
Task:DelItem(me, nHacMaThietKy, 1);
Task:DelItem(me, nHoaViemTu, 1);
Task:DelItem(me, nKimLangVuong, 1);
Task:DelItem(me, nLonDo, 1);
Task:DelItem(me, nLonXanh, 1);
Task:DelItem(me, nLonDen, 1);
Task:DelItem(me, nLonXanhDuong, 1);
Task:DelItem(me, nHuyetLongCau, 1);
Task:DelItem(me, nNgocKyLan, 1);
Task:DelItem(me, nHanHuyetLongCau, 1);
Task:DelItem(me, nBachNgocKyLan, 1);
Task:DelItem(me, nBachNguu, 1);
Task:DelItem(me, nHoaNguu, 1);
Task:DelItem(me, nHacNguu, 1);
me.AddItem(1,12,nRandomNgua,4).Bind(1)
	if (nTichNap > 10250) and (nTichNap <= 21249) then 
me.AddJbCoin(-13500000)
	elseif  (nTichNap > 21249) and (nTichNap <= 32749) then
me.AddJbCoin(-10500000)
	elseif  (nTichNap > 32749) and (nTichNap <= 56749)  then 
me.AddJbCoin(-7500000)
	elseif  (nTichNap > 56749) and (nTichNap <= 91749)  then 
me.AddJbCoin(-4500000)
	elseif nTichNap > 91750 then 
me.AddJbCoin(-1500000)
else
me.AddJbCoin(-15000000)
	end
else
			Dialog:Say(string.format("<color=yellow>Trong Hành Trang Của Bạn Không Có <color><color=red>Ngựa Mốc Nạp 75tr <color>"));
	return
end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------


