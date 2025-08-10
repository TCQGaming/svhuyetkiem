
local tbThoRenBaoThach = Npc:GetClass("thorenbaothach");
function tbThoRenBaoThach:OnDialog()
DoScript("\\script\\global\\tcqgaming\\khamnam\\thorenbaothach.lua");
	local nMoKhamNam = ConfigAll.OpenKham
		if nMoKhamNam == 0 then 
	Dialog:Say("Tính năng khảm nạm chưa mở");
	return 0;
	end 
	local szMsg = "Xin chào<color=gold> "..me.szName.." <color>bạn cần ta giúp gì không ?";
    local tbOpt =     {} 
	table.insert(tbOpt, {"<color=green>Kích Hoạt Kỹ Năng Đá Bộ<color>" , SpecialEvent.HieuUng_DaBo.OnDialog, SpecialEvent.HieuUng_DaBo,});
				-- table.insert(tbOpt, {"Trao đổi bảo thạch<color=yellow> Ngẫu nhiên",self.traodoibaothach,self});
			table.insert(tbOpt, {"<color=yellow>Shop Bảo Thạch",self.shopbaothach,self});
			table.insert(tbOpt, {"<color=yellow>Gỡ Đá Khảm",self.goda,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function  tbThoRenBaoThach:traodoibaothach()
	local szMsg = "<color=red>Giới thiệu:\n<color>1 loại ngọc bất kỳ sẽ biến thành 1 ngọc ngẫu nhiên\nCần tốn 1 vạn đồng khóa 1 lượt";
    local tbOpt =     {} 
			table.insert(tbOpt, {"Tính năng chưa hoàn thiện"});
    Dialog:Say(szMsg, tbOpt)
end
function  tbThoRenBaoThach:shopbaothach()
	local szMsg = "<color=red>Giới thiệu:\n<color>Khoan Kim Cương giá : <color=gold>50 Vạn Đồng Khóa + 10 Vạn Đồng Thường<color>\nGiaỉ Ngọc Chùy :<color=gold> 15 Vạn đồng khóa<color>\n<color=cyan>Hãy tắt AutoPK trước khi bấm mua\n<color=red>Không chấp nhận xử lý do > bấm nhầm hoặc quên";
    local tbOpt =     {} 
			table.insert(tbOpt, {"Mua Mũi Khoan Kim Cương",self.muikhoankimcuong,self});
			table.insert(tbOpt, {"Mua Giải Ngọc Chùy",self.giaingocchuy,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function  tbThoRenBaoThach:muikhoankimcuong()
	  Dialog:AskNumber("Nhập Số Lượng", 30, self.muikhoankimcuong_a, self)
end 
function  tbThoRenBaoThach:muikhoankimcuong_a(szSoLuong)
local nDongKhoa = me.nBindCoin
local nDongKhoaTon = szSoLuong * (50 * 10000 )
local nDongTon = szSoLuong * (10 * 10000 )
local SoDongKhoa = math.floor(nDongKhoaTon/10000)
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongKhoaTon then 
Dialog:Say("Để tiến hành mua "..szSoLuong.." mũi khoan bạn chưa đủ "..SoDongKhoa.." vạn đồng khóa rồi")
return 
end
local nDong = me.GetJbCoin()
   if nDong < nDongTon then 
 	Dialog:Say("Để tiến hành mua "..szSoLuong.." mũi khoan bạn chưa đủ "..nDongTon.." vạn đồng thường rồi")
  return 
  end
me.AddStackItem(18,1,1320,1,{bForceBind=1},szSoLuong)
me.AddBindCoin(-nDongKhoaTon)
me.AddJbCoin(-nDongTon)
end 

function  tbThoRenBaoThach:giaingocchuy()
	  Dialog:AskNumber("Nhập Số Lượng", 30, self.giaingocchuy_a, self)
end
function  tbThoRenBaoThach:giaingocchuy_a(szSoLuong)
local nDongKhoa = me.nBindCoin
local nDongTon = szSoLuong * (15 * 10000 )
local SoDong = math.floor(nDongTon/10000)
if nDongKhoa < nDongTon then 
Dialog:Say("Để tiến hành mua "..szSoLuong.." giải ngọc chùy bạn chưa đủ "..SoDong.." vạn đồng khóa rồi")
return 
end
me.AddStackItem(18,1,1320,2,{bForceBind=1},szSoLuong)
me.AddBindCoin(-nDongTon)
end 
function  tbThoRenBaoThach:goda()
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
			table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Vũ Khí",self.govukhi,self});
			table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Ngựa",self.gongua,self});
			table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Phòng Cụ",self.gophongcu,self});
			table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Trang Sức",self.gotrangsuc,self});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbThoRenBaoThach:gophongcu()
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Nón", self.gophongcu_1, self, 1});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Áo", self.gophongcu_1, self, 2});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Đai Lưng", self.gophongcu_1, self, 3});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Hộ Uyển", self.gophongcu_1, self, 4});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Giày", self.gophongcu_1, self, 5});
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbThoRenBaoThach:gotrangsuc()
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Hạng Liên", self.gotrangsuc_1, self, 1});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Nhẫn", self.gotrangsuc_1, self, 2});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Ngọc Bội", self.gotrangsuc_1, self, 3});
    table.insert(tbOpt, {"Gỡ Đá Khảm<color=yellow> Hộ Thân Phù", self.gotrangsuc_1, self, 4});
    table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function  tbThoRenBaoThach:gotrangsuc_1(Index)
local nHangLien_CM = me.GetTask(9183,35)
local nHangLien_GiamCM = me.GetTask(9183,31)
local nHangLien_KTC = me.GetTask(9183,22)

local nNhan_CM = me.GetTask(9183,36)
local nNhan_GiamCM = me.GetTask(9183,32)
local nNhan_KTC = me.GetTask(9183,23)

local nNgocBoi_CM = me.GetTask(9183,37)
local nNgocBoi_GiamCM = me.GetTask(9183,33)
local nNgocBoi_KTC = me.GetTask(9183,24)

local nHoThanPhu_CM = me.GetTask(9183,38)
local nHoThanPhu_GiamCM = me.GetTask(9183,34)
local nHoThanPhu_KTC = me.GetTask(9183,25)

local nLevelSkil_Lien_CM = me.GetSkillLevel(1885);
local nLevelSkil_Lien_GiamCM = me.GetSkillLevel(1886);
local nLevelSkil_Lien_KTC = me.GetSkillLevel(1887);

local nLevelSkil_Nhan_CM = me.GetSkillLevel(1888);
local nLevelSkil_Nhan_GiamCM = me.GetSkillLevel(1889);
local nLevelSkil_Nhan_KTC = me.GetSkillLevel(1890);

local nLevelSkil_NgocBoi_CM = me.GetSkillLevel(1891);
local nLevelSkil_NgocBoi_GiamCM = me.GetSkillLevel(1892);
local nLevelSkil_NgocBoi_KTC = me.GetSkillLevel(1893);

local nLevelSkil_HoThanPhu_CM = me.GetSkillLevel(1894);
local nLevelSkil_HoThanPhu_GiamCM = me.GetSkillLevel(1895);
local nLevelSkil_HoThanPhu_KTC = me.GetSkillLevel(1896);
local nTenNgocCM_Lien_CM = ""
local nTenNgocCM_Nhan_CM = ""
local nTenNgocCM_NgocBoi_CM = ""
local nTenNgocCM_HoThanPhu_CM = ""
local nTenThienCoThach_Lien_GiamCM = ""
local nTenThienCoThach_Nhan_GiamCM = ""
local nTenThienCoThach_NgocBoi_GiamCM = ""
local nTenThienCoThach_HoThanPhu_GiamCM = ""
local nTenLangThienNgoc_Lien_KTC = ""
local nTenLangThienNgoc_Nhan_KTC = ""
local nTenLangThienNgoc_NgocBoi_KTC = ""
local nTenLangThienNgoc_HoThanPhu_KTC = ""
for i = 1, 10 do
    if nLevelSkil_Lien_CM == i then
        nTenNgocCM_Lien_CM = "Ly Tâm Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_Nhan_CM == i then
        nTenNgocCM_Nhan_CM = "Ly Tâm Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_NgocBoi_CM == i then
        nTenNgocCM_NgocBoi_CM = "Ly Tâm Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_HoThanPhu_CM == i then
        nTenNgocCM_HoThanPhu_CM = "Ly Tâm Thạch (cấp " .. i .. ")"
    end
end

for i = 1, 10 do
    if nLevelSkil_Lien_GiamCM == i then
        nTenThienCoThach_Lien_GiamCM = "Thiên Cơ Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_Nhan_GiamCM == i then
        nTenThienCoThach_Nhan_GiamCM = "Thiên Cơ Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_NgocBoi_GiamCM == i then
        nTenThienCoThach_NgocBoi_GiamCM = "Thiên Cơ Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_HoThanPhu_GiamCM == i then
        nTenThienCoThach_HoThanPhu_GiamCM = "Thiên Cơ Thạch (cấp " .. i .. ")"
    end
end
		
for i = 1, 10 do
    if nLevelSkil_Lien_KTC == i then
        nTenLangThienNgoc_Lien_KTC = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    if nLevelSkil_Nhan_KTC == i then
        nTenLangThienNgoc_Nhan_KTC = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    if nLevelSkil_NgocBoi_KTC == i then
        nTenLangThienNgoc_NgocBoi_KTC = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    if nLevelSkil_HoThanPhu_KTC == i then
        nTenLangThienNgoc_HoThanPhu_KTC = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
end

	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
if Index == 1 then 
	if nHangLien_CM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocCM_Lien_CM.."<color>",self.golien_cm,self,nTenNgocCM_Lien_CM,nLevelSkil_Lien_CM});
	end 
	if nHangLien_GiamCM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenThienCoThach_Lien_GiamCM.."<color>",self.golien_giamcm,self,nTenThienCoThach_Lien_GiamCM,nLevelSkil_Lien_GiamCM});
	end 
	if nHangLien_KTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Lien_KTC.."<color>",self.golien_ktc,self,nTenLangThienNgoc_Lien_KTC,nLevelSkil_Lien_KTC});
	end 
elseif Index == 2 then 
	if nNhan_CM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocCM_Nhan_CM.."<color>",self.gonhan_cm,self,nTenNgocCM_Nhan_CM,nLevelSkil_Nhan_CM});
	end 
	if nNhan_GiamCM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenThienCoThach_Nhan_GiamCM.."<color>",self.gonhan_giamcm,self,nTenThienCoThach_Nhan_GiamCM,nLevelSkil_Nhan_GiamCM});
	end 
	if nNhan_KTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Nhan_KTC.."<color>",self.gonhan_ktc,self,nTenLangThienNgoc_Nhan_KTC,nLevelSkil_Nhan_KTC});
	end 
	
	elseif Index == 3 then 
	if nNgocBoi_CM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocCM_NgocBoi_CM.."<color>",self.goboi_cm,self,nTenNgocCM_NgocBoi_CM,nLevelSkil_NgocBoi_CM});
	end 
	if nNgocBoi_GiamCM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenThienCoThach_NgocBoi_GiamCM.."<color>",self.goboi_giamcm,self,nTenThienCoThach_NgocBoi_GiamCM,nLevelSkil_NgocBoi_GiamCM});
	end 
	if nNgocBoi_KTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_NgocBoi_KTC.."<color>",self.goboi_ktc,self,nTenLangThienNgoc_NgocBoi_KTC,nLevelSkil_NgocBoi_KTC});
	end 
	
		elseif Index == 4 then 
	if nHoThanPhu_CM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocCM_HoThanPhu_CM.."<color>",self.gophu_cm,self,nTenNgocCM_HoThanPhu_CM,nLevelSkil_HoThanPhu_CM});
	end 
	if nHoThanPhu_GiamCM == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenThienCoThach_HoThanPhu_GiamCM.."<color>",self.gophu_giamcm,self,nTenThienCoThach_HoThanPhu_GiamCM,nLevelSkil_HoThanPhu_GiamCM});
	end 
	if nHoThanPhu_KTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_HoThanPhu_KTC.."<color>",self.gophu_ktc,self,nTenLangThienNgoc_HoThanPhu_KTC,nLevelSkil_HoThanPhu_KTC});
	end 
	
end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function  tbThoRenBaoThach:gophu_cm(nTenNgocCM_HoThanPhu_CM, nLevelSkil_HoThanPhu_CM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1894);
	me.AddStackItem(18,1,1310,nLevelSkil_HoThanPhu_CM,{bForceBind=1},1)
	me.SetTask(9183,38,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocCM_HoThanPhu_CM.."<color> khỏi bội")
end 
function  tbThoRenBaoThach:gophu_giamcm(nTenThienCoThach_HoThanPhu_GiamCM, nLevelSkil_HoThanPhu_GiamCM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1895);
	me.AddStackItem(18,1,1319,nLevelSkil_HoThanPhu_GiamCM,{bForceBind=1},1)
	me.SetTask(9183,34,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenThienCoThach_HoThanPhu_GiamCM.."<color> khỏi bội")
end 
function  tbThoRenBaoThach:gophu_ktc(nTenLangThienNgoc_HoThanPhu_KTC, nLevelSkil_HoThanPhu_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1896);
	me.AddStackItem(18,1,1302,nLevelSkil_HoThanPhu_KTC,{bForceBind=1},1)
	me.SetTask(9183,25,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_HoThanPhu_KTC.."<color> khỏi bội")
end

function  tbThoRenBaoThach:golien_cm(nTenNgocCM_Lien_CM, nLevelSkil_Lien_CM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1885);
	me.AddStackItem(18,1,1310,nLevelSkil_Lien_CM,{bForceBind=1},1)
	me.SetTask(9183,35,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocCM_Lien_CM.."<color> khỏi hạng liên")
end 
function  tbThoRenBaoThach:golien_giamcm(nTenThienCoThach_Lien_GiamCM, nLevelSkil_Lien_GiamCM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1886);
	me.AddStackItem(18,1,1319,nLevelSkil_Lien_GiamCM,{bForceBind=1},1)
	me.SetTask(9183,31,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenThienCoThach_Lien_GiamCM.."<color> khỏi hạng liên")
end 
function  tbThoRenBaoThach:golien_ktc(nTenLangThienNgoc_Lien_KTC, nLevelSkil_Lien_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1887);
	me.AddStackItem(18,1,1302,nLevelSkil_Lien_KTC,{bForceBind=1},1)
	me.SetTask(9183,22,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Lien_KTC.."<color> khỏi hạng liên")
end

function  tbThoRenBaoThach:gonhan_cm(nTenNgocCM_Nhan_CM, nLevelSkil_Nhan_CM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1888);
	me.AddStackItem(18,1,1310,nLevelSkil_Nhan_CM,{bForceBind=1},1)
	me.SetTask(9183,36,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocCM_Nhan_CM.."<color> khỏi nhẫn")
end 
function  tbThoRenBaoThach:gonhan_giamcm(nTenThienCoThach_Nhan_GiamCM, nLevelSkil_Nhan_GiamCM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1889);
	me.AddStackItem(18,1,1319,nLevelSkil_Nhan_GiamCM,{bForceBind=1},1)
	me.SetTask(9183,32,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenThienCoThach_Nhan_GiamCM.."<color> khỏi nhẫn")
end 
function  tbThoRenBaoThach:gonhan_ktc(nTenLangThienNgoc_Nhan_KTC, nLevelSkil_Nhan_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1890);
	me.AddStackItem(18,1,1302,nLevelSkil_Nhan_KTC,{bForceBind=1},1)
	me.SetTask(9183,23,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Nhan_KTC.."<color> khỏi nhẫn")
end

function  tbThoRenBaoThach:goboi_cm(nTenNgocCM_NgocBoi_CM, nLevelSkil_NgocBoi_CM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1891);
	me.AddStackItem(18,1,1310,nLevelSkil_NgocBoi_CM,{bForceBind=1},1)
	me.SetTask(9183,37,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocCM_NgocBoi_CM.."<color> khỏi bội")
end 
function  tbThoRenBaoThach:goboi_giamcm(nTenThienCoThach_NgocBoi_GiamCM, nLevelSkil_NgocBoi_GiamCM)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1892);
	me.AddStackItem(18,1,1319,nLevelSkil_NgocBoi_GiamCM,{bForceBind=1},1)
	me.SetTask(9183,33,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenThienCoThach_NgocBoi_GiamCM.."<color> khỏi bội")
end 
function  tbThoRenBaoThach:goboi_ktc(nTenLangThienNgoc_NgocBoi_KTC, nLevelSkil_NgocBoi_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1893);
	me.AddStackItem(18,1,1302,nLevelSkil_NgocBoi_KTC,{bForceBind=1},1)
	me.SetTask(9183,24,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_NgocBoi_KTC.."<color> khỏi bội")
end
-------------------------End Trang Sức
function  tbThoRenBaoThach:gophongcu_1(Index)
local nNonSL = me.GetTask(9183,12)
local nNonKTC = me.GetTask(9183,17)
local nNonKB = me.GetTask(9183,26)
local nAoSL = me.GetTask(9183,13)
local nAoKTC = me.GetTask(9183,18)
local nAoKH = me.GetTask(9183,27)
local nDaiLungSL = me.GetTask(9183,14)
local nDaiLungKTC = me.GetTask(9183,19)
local nDaiLungKL = me.GetTask(9183,28)
local nHoUyenSL = me.GetTask(9183,15)
local nHoUyenKTC = me.GetTask(9183,20)
local nHoUyenKV = me.GetTask(9183,29)
local nGiaySL = me.GetTask(9183,16)
local nGiayKTC = me.GetTask(9183,21)
local nGiayKD = me.GetTask(9183,30)

local nLevelSkil_Non_SL = me.GetSkillLevel(1867);
local nLevelSkil_Non_KTC = me.GetSkillLevel(1868);
local nLevelSkil_Non_KhangBang = me.GetSkillLevel(1869);
local nLevelSkil_Ao_SL = me.GetSkillLevel(1870);
local nLevelSkil_Ao_KTC = me.GetSkillLevel(1871);
local nLevelSkil_Ao_KhangHoa = me.GetSkillLevel(1872);
local nLevelSkil_Dai_SL = me.GetSkillLevel(1873);
local nLevelSkil_Dai_KTC = me.GetSkillLevel(1874);
local nLevelSkil_Dai_KhangLoi = me.GetSkillLevel(1875);

local nLevelSkil_Tay_SL = me.GetSkillLevel(1876);
local nLevelSkil_Tay_KTC = me.GetSkillLevel(1877);
local nLevelSkil_Tay_KhangVat = me.GetSkillLevel(1878);

local nLevelSkil_Giay_SL = me.GetSkillLevel(1879);
local nLevelSkil_Giay_KTC = me.GetSkillLevel(1880);
local nLevelSkil_Giay_KhangDoc = me.GetSkillLevel(1881);

local nTenNgocSL_Non = ""
local nTenNgocSL_Ao = ""
local nTenNgocSL_Dai = ""
local nTenNgocSL_Tay = ""
local nTenNgocSL_Giay = ""
local nTenLangThienNgoc_Non = ""
local nTenLangThienNgoc_Ao = ""
local nTenLangThienNgoc_Dai = ""
local nTenLangThienNgoc_Tay = ""
local nTenLangThienNgoc_Giay = ""
local nTenKieuDuongThach_KB_non = ""
local nTenBangPhongThach_KH_Ao = ""
local nTenLoiDinhNgoc_KL_DaiLung = ""
local nTenHaDuongThach_KV_Tay = ""
local nTenDaMaThach_KD_Giay = ""
for i = 1, 10 do
    if nLevelSkil_Non_SL == i then
        nTenNgocSL_Non = "Hoàng Quang Thạch (cấp " .. i .. ")"
    end 
    if nLevelSkil_Ao_SL == i then
        nTenNgocSL_Ao = "Hoàng Quang Thạch (cấp " .. i .. ")"
    end   
    if nLevelSkil_Dai_SL == i then
        nTenNgocSL_Dai = "Hoàng Quang Thạch (cấp " .. i .. ")"
    end  
    if nLevelSkil_Tay_SL == i then
        nTenNgocSL_Tay = "Hoàng Quang Thạch (cấp " .. i .. ")"
    end
    if nLevelSkil_Giay_SL == i then
        nTenNgocSL_Giay = "Hoàng Quang Thạch (cấp " .. i .. ")"
    end
end
		
for i = 1, 10 do
    if nLevelSkil_Non_KTC == i then
        nTenLangThienNgoc_Non = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    
    if nLevelSkil_Ao_KTC == i then
        nTenLangThienNgoc_Ao = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    
    if nLevelSkil_Dai_KTC == i then
        nTenLangThienNgoc_Dai = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    
    if nLevelSkil_Tay_KTC == i then
        nTenLangThienNgoc_Tay = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
    
    if nLevelSkil_Giay_KTC == i then
        nTenLangThienNgoc_Giay = "Lăng Thiên Ngọc (cấp " .. i .. ")"
    end
end

		
				if (nLevelSkil_Non_KhangBang == 1) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_Non_KhangBang == 2) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_Non_KhangBang == 3) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_Non_KhangBang == 4) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_Non_KhangBang == 5) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_Non_KhangBang == 6) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_Non_KhangBang == 7) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_Non_KhangBang == 8) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_Non_KhangBang == 9) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_Non_KhangBang == 10) then
				nTenKieuDuongThach_KB_non = "Kiêu Dương Thạch (vô song) (Cấp 10)"
		end 
						if (nLevelSkil_Ao_KhangHoa == 1) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_Ao_KhangHoa == 2) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_Ao_KhangHoa == 3) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_Ao_KhangHoa == 4) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_Ao_KhangHoa == 5) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_Ao_KhangHoa == 6) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_Ao_KhangHoa == 7) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_Ao_KhangHoa == 8) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_Ao_KhangHoa == 9) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_Ao_KhangHoa == 10) then
				nTenBangPhongThach_KH_Ao = "Băng Phong Thạch (vô song) (Cấp 10)"
		end 
		
		if (nLevelSkil_Dai_KhangLoi == 1) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_Dai_KhangLoi == 2) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_Dai_KhangLoi == 3) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_Dai_KhangLoi == 4) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_Dai_KhangLoi == 5) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_Dai_KhangLoi == 6) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_Dai_KhangLoi == 7) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_Dai_KhangLoi == 8) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_Dai_KhangLoi == 9) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_Dai_KhangLoi == 10) then
				nTenLoiDinhNgoc_KL_DaiLung = "Lôi Đình Ngọc (vô song) (Cấp 10)"
		end 
		
				if (nLevelSkil_Tay_KhangVat == 1) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_Tay_KhangVat == 2) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_Tay_KhangVat == 3) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_Tay_KhangVat == 4) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_Tay_KhangVat == 5) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_Tay_KhangVat == 6) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_Tay_KhangVat == 7) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_Tay_KhangVat == 8) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_Tay_KhangVat == 9) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_Tay_KhangVat == 10) then
				nTenHaDuongThach_KV_Tay = "Hạ Dương Thạch (vô song) (Cấp 10)"
		end 
		
						if (nLevelSkil_Giay_KhangDoc == 1) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_Giay_KhangDoc == 2) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_Giay_KhangDoc == 3) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_Giay_KhangDoc == 4) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_Giay_KhangDoc == 5) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_Giay_KhangDoc == 6) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_Giay_KhangDoc == 7) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_Giay_KhangDoc == 8) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_Giay_KhangDoc == 9) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_Giay_KhangDoc == 10) then
				nTenDaMaThach_KD_Giay = "Dạ Ma Thạch (vô song) (Cấp 10)"
		end 
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
if Index == 1 then 
	if nNonSL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocSL_Non.."<color>",self.gonon_sl,self,nTenNgocSL_Non,nLevelSkil_Non_SL});
	end 
	if nNonKTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Non.."<color>",self.gonon_ktc,self,nTenLangThienNgoc_Non,nLevelSkil_Non_KTC});
	end 
	if nNonKB == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKieuDuongThach_KB_non.."<color>",self.gonon_kb,self,nTenKieuDuongThach_KB_non,nLevelSkil_Non_KhangBang});
	end 
elseif Index == 2 then 
	if nAoSL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocSL_Ao.."<color>",self.goao_sl,self,nTenNgocSL_Ao,nLevelSkil_Ao_SL});
	end 
	if nAoKTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Ao.."<color>",self.goao_ktc,self,nTenLangThienNgoc_Ao,nLevelSkil_Ao_KTC});
	end 
	if nAoKH == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenBangPhongThach_KH_Ao.."<color>",self.goao_kh,self,nTenBangPhongThach_KH_Ao,nLevelSkil_Ao_KhangHoa});
	end 
	
	elseif Index == 3 then 
	if nDaiLungSL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocSL_Dai.."<color>",self.godai_sl,self,nTenNgocSL_Dai,nLevelSkil_Dai_SL});
	end 
	if nDaiLungKTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Dai.."<color>",self.godai_ktc,self,nTenLangThienNgoc_Dai,nLevelSkil_Dai_KTC});
	end 
	if nDaiLungKL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLoiDinhNgoc_KL_DaiLung.."<color>",self.godai_kl,self,nTenLoiDinhNgoc_KL_DaiLung,nLevelSkil_Dai_KhangLoi});
	end 
	
		elseif Index == 4 then 
	if nHoUyenSL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocSL_Tay.."<color>",self.gohouyen_sl,self,nTenNgocSL_Tay,nLevelSkil_Tay_SL});
	end 
	if nHoUyenKTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Tay.."<color>",self.gohouyen_ktc,self,nTenLangThienNgoc_Tay,nLevelSkil_Tay_KTC});
	end 
	if nHoUyenKV == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenHaDuongThach_KV_Tay.."<color>",self.gohouyen_kv,self,nTenHaDuongThach_KV_Tay,nLevelSkil_Tay_KhangVat});
	end 
	
			elseif Index == 5 then 
	if nGiaySL == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenNgocSL_Giay.."<color>",self.gogiay_sl,self,nTenNgocSL_Giay,nLevelSkil_Giay_SL});
	end 
	if nGiayKTC == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenLangThienNgoc_Giay.."<color>",self.gogiay_ktc,self,nTenLangThienNgoc_Giay,nLevelSkil_Giay_KTC});
	end 
	if nGiayKD == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenDaMaThach_KD_Giay.."<color>",self.gogiay_kd,self,nTenDaMaThach_KD_Giay,nLevelSkil_Giay_KhangDoc});
	end 
end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function  tbThoRenBaoThach:gonon_sl(nTenNgocSL_Non, nLevelSkil_Non_SL)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1867);
	me.AddStackItem(18,1,1301,nLevelSkil_Non_SL,{bForceBind=1},1)
	me.SetTask(9183,12,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocSL_Non.."<color> khỏi nón")
end 
function  tbThoRenBaoThach:gonon_ktc(nTenLangThienNgoc_Non, nLevelSkil_Non_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1868);
	me.AddStackItem(18,1,1302,nLevelSkil_Non_KTC,{bForceBind=1},1)
	me.SetTask(9183,17,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Non.."<color> khỏi nón")
end 
function  tbThoRenBaoThach:gonon_kb(nTenKieuDuongThach_KB_non, nLevelSkil_Non_KhangBang)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1869);
	me.AddStackItem(18,1,1307,nLevelSkil_Non_KhangBang,{bForceBind=1},1)
	me.SetTask(9183,26,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKieuDuongThach_KB_non.."<color> khỏi nón")
end

function  tbThoRenBaoThach:goao_sl(nTenNgocSL_Ao, nLevelSkil_Ao_SL)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1870);
	me.AddStackItem(18,1,1301,nLevelSkil_Ao_SL,{bForceBind=1},1)
	me.SetTask(9183,13,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocSL_Ao.."<color> khỏi áo")
end 
function  tbThoRenBaoThach:goao_ktc(nTenLangThienNgoc_Ao, nLevelSkil_Ao_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1871);
	me.AddStackItem(18,1,1302,nLevelSkil_Ao_KTC,{bForceBind=1},1)
	me.SetTask(9183,18,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Ao.."<color> khỏi áo")
end 
function  tbThoRenBaoThach:goao_kh(nTenBangPhongThach_KH_Ao, nLevelSkil_Ao_KhangHoa)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1872);
	me.AddStackItem(18,1,1305,nLevelSkil_Ao_KhangHoa,{bForceBind=1},1)
	me.SetTask(9183,27,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenBangPhongThach_KH_Ao.."<color> khỏi áo")
end  


function  tbThoRenBaoThach:godai_sl(nTenNgocSL_Dai, nLevelSkil_Dai_SL)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1873);
	me.AddStackItem(18,1,1301,nLevelSkil_Dai_SL,{bForceBind=1},1)
	me.SetTask(9183,14,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocSL_Dai.."<color> khỏi Đai Lưng")
end 
function  tbThoRenBaoThach:godai_ktc(nTenLangThienNgoc_Dai, nLevelSkil_Dai_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1874);
	me.AddStackItem(18,1,1302,nLevelSkil_Dai_KTC,{bForceBind=1},1)
	me.SetTask(9183,19,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Dai.."<color> khỏi Đai Lưng")
end 
function  tbThoRenBaoThach:godai_kl(nTenLoiDinhNgoc_KL_DaiLung, nLevelSkil_Dai_KhangLoi)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1875);
	me.AddStackItem(18,1,1306,nLevelSkil_Dai_KhangLoi,{bForceBind=1},1)
	me.SetTask(9183,28,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLoiDinhNgoc_KL_DaiLung.."<color> khỏi Đai Lưng")
end  


function  tbThoRenBaoThach:gohouyen_sl(nTenNgocSL_Tay, nLevelSkil_Tay_SL)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1876);
	me.AddStackItem(18,1,1301,nLevelSkil_Tay_SL,{bForceBind=1},1)
	me.SetTask(9183,15,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocSL_Tay.."<color> khỏi Hộ Uyển")
end 
function  tbThoRenBaoThach:gohouyen_ktc(nTenLangThienNgoc_Tay, nLevelSkil_Tay_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1877);
	me.AddStackItem(18,1,1302,nLevelSkil_Tay_KTC,{bForceBind=1},1)
	me.SetTask(9183,20,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Tay.."<color> khỏi Hộ Uyển")
end 
function  tbThoRenBaoThach:gohouyen_kv(nTenHaDuongThach_KV_Tay, nLevelSkil_Tay_KhangVat)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1878);
	me.AddStackItem(18,1,1309,nLevelSkil_Tay_KhangVat,{bForceBind=1},1)
	me.SetTask(9183,29,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenHaDuongThach_KV_Tay.."<color> khỏi Hộ Uyển")
end  

function  tbThoRenBaoThach:gogiay_sl(nTenNgocSL_Giay, nLevelSkil_Giay_SL)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1879);
	me.AddStackItem(18,1,1301,nLevelSkil_Giay_SL,{bForceBind=1},1)
	me.SetTask(9183,16,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenNgocSL_Giay.."<color> khỏi Giày")
end 
function  tbThoRenBaoThach:gogiay_ktc(nTenLangThienNgoc_Giay, nLevelSkil_Giay_KTC)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1880);
	me.AddStackItem(18,1,1302,nLevelSkil_Giay_KTC,{bForceBind=1},1)
	me.SetTask(9183,21,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenLangThienNgoc_Giay.."<color> khỏi Giày")
end 
function  tbThoRenBaoThach:gogiay_kd(nTenDaMaThach_KD_Giay, nLevelSkil_Giay_KhangDoc)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1881);
	me.AddStackItem(18,1,1308,nLevelSkil_Giay_KhangDoc,{bForceBind=1},1)
	me.SetTask(9183,30,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenDaMaThach_KD_Giay.."<color> khỏi Giày")
end  



function  tbThoRenBaoThach:govukhi()
local nVuKhi_A = me.GetTask(9183,1)
local nVuKhi_B = me.GetTask(9183,2)
local nVuKhi_C = me.GetTask(9183,3)
local nLevelSkil_VuKhi_A = me.GetSkillLevel(1883);
local nLevelSkil_VuKhi_B = me.GetSkillLevel(1882);
local nLevelSkil_VuKhi_C = me.GetSkillLevel(1884);
local nTenThuongLangNgoc = ""
local nTenPhaThienThach = ""
local nTenChanLinhNgoc = ""
		if (nLevelSkil_VuKhi_A == 1) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_VuKhi_A == 2) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_VuKhi_A == 3) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_VuKhi_A == 4) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_VuKhi_A == 5) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_VuKhi_A == 6) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_VuKhi_A == 7) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_VuKhi_A == 8) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_VuKhi_A == 9) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_VuKhi_A == 10) then
				nTenThuongLangNgoc = "Thương Lang Ngọc (vô song) (Cấp 10)"
		end 
		
		if (nLevelSkil_VuKhi_B == 1) then
				nTenPhaThienThach = "Phá Thiên Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_VuKhi_B == 2) then
				nTenPhaThienThach = "Phá Thiên Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_VuKhi_B == 3) then
				nTenPhaThienThach = "Phá Thiên Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_VuKhi_B == 4) then
				nTenPhaThienThach = "Phá Thiên Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_VuKhi_B == 5) then
				nTenPhaThienThach = "Phá Thiên Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_VuKhi_B == 6) then
				nTenPhaThienThach = "Phá Thiên Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_VuKhi_B == 7) then
				nTenPhaThienThach = "Phá Thiên Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_VuKhi_B == 8) then
				nTenPhaThienThach = "Phá Thiên Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_VuKhi_B == 9) then
				nTenPhaThienThach = "Phá Thiên Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_VuKhi_B == 10) then
				nTenPhaThienThach = "Phá Thiên Thạch (vô song) (Cấp 10)"
		end 
		
				if (nLevelSkil_VuKhi_C == 1) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_VuKhi_C == 2) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_VuKhi_C == 3) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_VuKhi_C == 4) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_VuKhi_C == 5) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_VuKhi_C == 6) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_VuKhi_C == 7) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_VuKhi_C == 8) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_VuKhi_C == 9) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_VuKhi_C == 10) then
				nTenChanLinhNgoc = "Chấn Linh Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào\n<color=red>Quy tắc : Gỡ đá cần tốn 1 Giải Ngọc Chùy";
    local tbOpt =     {} 
	if nVuKhi_A == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenThuongLangNgoc.."<color>",self.govukhi_A,self,nTenThuongLangNgoc,nLevelSkil_VuKhi_A});
	end 
	if nVuKhi_B == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenPhaThienThach.."<color>",self.govukhi_B,self,nTenPhaThienThach,nLevelSkil_VuKhi_B});
	end 
	if nVuKhi_C == 1 then 
				table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenChanLinhNgoc.."<color>",self.govukhi_C,self,nTenChanLinhNgoc,nLevelSkil_VuKhi_C});
	end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function  tbThoRenBaoThach:govukhi_A(nTenThuongLangNgoc, nLevelSkil_VuKhi_A)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1883);
	me.AddStackItem(18,1,1300,nLevelSkil_VuKhi_A,{bForceBind=1},1)
	me.SetTask(9183,1,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenThuongLangNgoc.."<color> khỏi Vũ Khí")
end 
function  tbThoRenBaoThach:govukhi_B(nTenPhaThienThach, nLevelSkil_VuKhi_B)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1882);
	me.AddStackItem(18,1,1304,nLevelSkil_VuKhi_B,{bForceBind=1},1)
	me.SetTask(9183,2,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenPhaThienThach.."<color> khỏi Vũ Khí")
end 

function  tbThoRenBaoThach:govukhi_C(nTenChanLinhNgoc, nLevelSkil_VuKhi_C)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1884);
	me.AddStackItem(18,1,1311,nLevelSkil_VuKhi_C,{bForceBind=1},1)
	me.SetTask(9183,3,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenChanLinhNgoc.."<color> khỏi Vũ Khí")
end 


function  tbThoRenBaoThach:gongua()
local nNgua_Khang = me.GetTask(9183,4)
local nNgua_Vat_Cong = me.GetTask(9183,5)
local nNgua_CuongNhuoc_Hoa = me.GetTask(9183,6)
local nLevelSkil_KhangVat = me.GetSkillLevel(1901);
local nLevelSkil_KhangDoc = me.GetSkillLevel(1902);
local nLevelSkil_KhangBang = me.GetSkillLevel(1903);
local nLevelSkil_KhangHoa = me.GetSkillLevel(1904);
local nLevelSkil_KhangLoi = me.GetSkillLevel(1905);
local nLevelSkil_VatCong = me.GetSkillLevel(1906);
local nLevelSkil_CuongNhuoc = me.GetSkillLevel(1907);
	local nTenKhangVat = ""
	local nTenKhangDoc = ""
	local nTenKhangBang = ""
	local nTenKhangHoa = ""
	local nTenKhangLoi = ""
	local nTenVatCong = ""
	local nTenCuongNhuoc = ""
	local nXacNhanKhangVat = me.GetTask(9183,7)
	local nXacNhanKhangDoc = me.GetTask(9183,8)
	local nXacNhanKhangBang = me.GetTask(9183,9)
	local nXacNhanKhangHoa = me.GetTask(9183,10)
	local nXacNhanKhangLoi = me.GetTask(9183,11)
		if (nLevelSkil_KhangVat == 1) then
				nTenKhangVat = "Chấn Lộ Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_KhangVat == 2) then
				nTenKhangVat = "Chấn Lộ Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_KhangVat == 3) then
				nTenKhangVat = "Chấn Lộ Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_KhangVat == 4) then
				nTenKhangVat = "Chấn Lộ Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_KhangVat == 5) then
				nTenKhangVat = "Chấn Lộ Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_KhangVat == 6) then
				nTenKhangVat = "Chấn Lộ Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_KhangVat == 7) then
				nTenKhangVat = "Chấn Lộ Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_KhangVat == 8) then
				nTenKhangVat = "Chấn Lộ Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_KhangVat == 9) then
				nTenKhangVat = "Chấn Lộ Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_KhangVat == 10) then
				nTenKhangVat = "Chấn Lộ Thạch (vô song) (Cấp 10)"
		end 
				if (nLevelSkil_KhangDoc == 1) then
				nTenKhangDoc = "U Minh Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_KhangDoc == 2) then
				nTenKhangDoc = "U Minh Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_KhangDoc == 3) then
				nTenKhangDoc = "U Minh Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_KhangDoc == 4) then
				nTenKhangDoc = "U Minh Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_KhangDoc == 5) then
				nTenKhangDoc = "U Minh Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_KhangDoc == 6) then
				nTenKhangDoc = "U Minh Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_KhangDoc == 7) then
				nTenKhangDoc = "U Minh Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_KhangDoc == 8) then
				nTenKhangDoc = "U Minh Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_KhangDoc == 9) then
				nTenKhangDoc = "U Minh Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_KhangDoc == 10) then
				nTenKhangDoc = "U Minh Ngọc (vô song) (Cấp 10)"
		end 
		
		if (nLevelSkil_KhangBang == 1) then
				nTenKhangBang = "Tuyết Linh Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_KhangBang == 2) then
				nTenKhangBang = "Tuyết Linh Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_KhangBang == 3) then
				nTenKhangBang = "Tuyết Linh Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_KhangBang == 4) then
				nTenKhangBang = "Tuyết Linh Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_KhangBang == 5) then
				nTenKhangBang = "Tuyết Linh Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_KhangBang == 6) then
				nTenKhangBang = "Tuyết Linh Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_KhangBang == 7) then
				nTenKhangBang = "Tuyết Linh Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_KhangBang == 8) then
				nTenKhangBang = "Tuyết Linh Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_KhangBang == 9) then
				nTenKhangBang = "Tuyết Linh Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_KhangBang == 10) then
				nTenKhangBang = "Tuyết Linh Thạch (vô song) (Cấp 10)"
		end 
		
						if (nLevelSkil_KhangHoa == 1) then
				nTenKhangHoa = "Hỏa Diệm Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_KhangHoa == 2) then
				nTenKhangHoa = "Hỏa Diệm Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_KhangHoa == 3) then
				nTenKhangHoa = "Hỏa Diệm Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_KhangHoa == 4) then
				nTenKhangHoa = "Hỏa Diệm Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_KhangHoa == 5) then
				nTenKhangHoa = "Hỏa Diệm Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_KhangHoa == 6) then
				nTenKhangHoa = "Hỏa Diệm Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_KhangHoa == 7) then
				nTenKhangHoa = "Hỏa Diệm Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_KhangHoa == 8) then
				nTenKhangHoa = "Hỏa Diệm Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_KhangHoa == 9) then
				nTenKhangHoa = "Hỏa Diệm Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_KhangHoa == 10) then
				nTenKhangHoa = "Hỏa Diệm Thạch (vô song) (Cấp 10)"
		end 
		
								if (nLevelSkil_KhangLoi == 1) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_KhangLoi == 2) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_KhangLoi == 3) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_KhangLoi == 4) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_KhangLoi == 5) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_KhangLoi == 6) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_KhangLoi == 7) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_KhangLoi == 8) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_KhangLoi == 9) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_KhangLoi == 10) then
				nTenKhangLoi = "Cuồng Lôi Ngọc (vô song) (Cấp 10)"
		end 
		
		if (nLevelSkil_VatCong == 1) then
				nTenVatCong = "Tham Lang Thạch (vỡ) (cấp 1)"
		elseif (nLevelSkil_VatCong == 2) then
				nTenVatCong = "Tham Lang Thạch (mòn) (cấp 2)"
		elseif (nLevelSkil_VatCong == 3) then
				nTenVatCong = "Tham Lang Thạch (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_VatCong == 4) then
				nTenVatCong = "Tham Lang Thạch (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_VatCong == 5) then
				nTenVatCong = "Tham Lang Thạch (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_VatCong == 6) then
				nTenVatCong = "Tham Lang Thạch (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_VatCong == 7) then
				nTenVatCong = "Tham Lang Thạch (lung linh) (Cấp 7)"
		elseif (nLevelSkil_VatCong == 8) then
				nTenVatCong = "Tham Lang Thạch (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_VatCong == 9) then
				nTenVatCong = "Tham Lang Thạch (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_VatCong == 10) then
				nTenVatCong = "Tham Lang Thạch (vô song) (Cấp 10)"
		end 
				if (nLevelSkil_CuongNhuoc == 1) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (vỡ) (cấp 1)"
		elseif (nLevelSkil_CuongNhuoc == 2) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (mòn) (cấp 2)"
		elseif (nLevelSkil_CuongNhuoc == 3) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (hoàn chỉnh) (cấp 3)"
		elseif (nLevelSkil_CuongNhuoc == 4) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (tinh xảo) (cấp 4)"
		elseif (nLevelSkil_CuongNhuoc == 5) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (lấp lánh) (cấp 5)"
		elseif (nLevelSkil_CuongNhuoc == 6) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (óng ánh) (Cấp 6)"
		elseif (nLevelSkil_CuongNhuoc == 7) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (lung linh) (Cấp 7)"
		elseif (nLevelSkil_CuongNhuoc == 8) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (hoàn mỹ) (Cấp 8)"
		elseif (nLevelSkil_CuongNhuoc == 9) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (chí tôn) (Cấp 9)"
		elseif (nLevelSkil_CuongNhuoc == 10) then
				nTenCuongNhuoc = "Huyền Dương Ngọc (vô song) (Cấp 10)"
		end 
	local szMsg = "Xin chào ngươi muốn gỡ đá loại nào";
    local tbOpt =     {} 
	if nNgua_Khang == 1 then 
	if nXacNhanKhangDoc == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKhangDoc.."<color>",self.gongua_khangdoc,self,nTenKhangDoc,nLevelSkil_KhangDoc});
	elseif nXacNhanKhangVat == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKhangVat.."<color>",self.gongua_khangvat,self,nTenKhangVat,nLevelSkil_KhangVat});
	elseif nXacNhanKhangBang == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKhangBang.."<color>",self.gongua_khangbang,self,nTenKhangBang,nLevelSkil_KhangBang});
	elseif nXacNhanKhangHoa == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKhangHoa.."<color>",self.gongua_khanghoa,self,nTenKhangHoa,nLevelSkil_KhangHoa});
	elseif nXacNhanKhangLoi == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenKhangLoi.."<color>",self.gongua_khangloi,self,nTenKhangLoi,nLevelSkil_KhangLoi});
	end 
	end 
if nNgua_Vat_Cong == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenVatCong.."<color>",self.gongua_vatcong,self,nTenVatCong,nLevelSkil_VatCong});
end 
if nNgua_CuongNhuoc_Hoa == 1 then 
	table.insert(tbOpt, {"Ta muốn gỡ :\n<color=yellow>"..nTenCuongNhuoc.."<color>",self.gongua_cuongnhuoc,self,nTenCuongNhuoc,nLevelSkil_CuongNhuoc});
end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function  tbThoRenBaoThach:gongua_vatcong(nTenVatCong, nLevelSkil_VatCong)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1906);
	me.AddStackItem(18,1,1317,nLevelSkil_VatCong,{bForceBind=1},1)
	me.SetTask(9183,5,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenVatCong.."<color> khỏi ngựa")
end 

function  tbThoRenBaoThach:gongua_cuongnhuoc(nTenCuongNhuoc, nLevelSkil_CuongNhuoc)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1907);
	me.AddStackItem(18,1,1318,nLevelSkil_CuongNhuoc,{bForceBind=1},1)
	me.SetTask(9183,6,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenCuongNhuoc.."<color> khỏi ngựa")
end 

function  tbThoRenBaoThach:gongua_khangvat(nTenKhangVat, nLevelSkil_KhangVat)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1901);
	me.AddStackItem(18,1,1312,nLevelSkil_KhangVat,{bForceBind=1},1)
	me.SetTask(9183,4,0)
	me.SetTask(9183,7,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKhangVat.."<color> khỏi ngựa")
end 

function  tbThoRenBaoThach:gongua_khangdoc(nTenKhangDoc, nLevelSkil_KhangDoc)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1902);
	me.AddStackItem(18,1,1314,nLevelSkil_KhangDoc,{bForceBind=1},1)
	me.SetTask(9183,4,0)
	me.SetTask(9183,8,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKhangDoc.."<color> khỏi ngựa")
end 
function  tbThoRenBaoThach:gongua_khangbang(nTenKhangBang, nLevelSkil_KhangBang)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1903);
	me.AddStackItem(18,1,1313,nLevelSkil_KhangBang,{bForceBind=1},1)
	me.SetTask(9183,4,0)
	me.SetTask(9183,9,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKhangBang.."<color> khỏi ngựa")
end 
function  tbThoRenBaoThach:gongua_khanghoa(nTenKhangHoa, nLevelSkil_KhangHoa)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1904);
	me.AddStackItem(18,1,1315,nLevelSkil_KhangHoa,{bForceBind=1},1)
	me.SetTask(9183,4,0)
	me.SetTask(9183,10,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKhangHoa.."<color> khỏi ngựa")
end 
function  tbThoRenBaoThach:gongua_khangloi(nTenKhangLoi, nLevelSkil_KhangLoi)
local nNguyenLieu = me.GetItemCountInBags(18,1,1320,2) -- giải ngọc chùy
if nNguyenLieu < 1 then 
Dialog:Say("Rất tiếc bạn không đủ giải ngọc chùy tại hành trang rồi")
return 
end 
	 local tbItemId	= {18,1,1320,2,0,0};  -- giải ngọc chùy
	 Task:DelItem(me, tbItemId, 1); 
	me.DelFightSkill(1905);
	me.AddStackItem(18,1,1316,nLevelSkil_KhangLoi,{bForceBind=1},1)
	me.SetTask(9183,4,0)
	me.SetTask(9183,11,0)
	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã gỡ thành công <color=yellow>"..nTenKhangLoi.."<color> khỏi ngựa")
end 