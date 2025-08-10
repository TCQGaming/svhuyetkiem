
SpecialEvent.NhiemVuHangNgay = SpecialEvent.NhiemVuHangNgay or {};
local tbNhiemVu = SpecialEvent.NhiemVuHangNgay;
tbNhiemVu.TaskGroup = 9055;
tbNhiemVu.TaskDate = 1;
tbNhiemVu.TaskId = 2; 
tbNhiemVu.TaskTDC = 3;
tbNhiemVu.TaskBHD = 4;
tbNhiemVu.TaskTK = 5;--
tbNhiemVu.TaskNVHN = 6;--
tbNhiemVu.TaskBVD = 7;


tbNhiemVu.nSoNhiemVuTDC = 1;
tbNhiemVu.nSoNhiemVuBHD = 1;
tbNhiemVu.nSoNhiemVuTK = 2;
tbNhiemVu.nSoNhiemVuHT = 6;
tbNhiemVu.nSoNhiemVuBVD = 40;
tbNhiemVu.nSoNhiemVuDietQuai = 3;


function tbNhiemVu:OnDiaLog()
DoScript("\\script\\NVHN\\NhiemVuHangNgay.lua");

	self:ResetTaskDaily()-- reset lai nhiem vu moi ngay
	
	local nCountTDC = me.GetTask(self.TaskGroup, self.TaskTDC);
	local nCountBHD = me.GetTask(self.TaskGroup, self.TaskBHD);
	local nCountTK = me.GetTask(self.TaskGroup, self.TaskTK);
	local nCountBVD = me.GetTask(self.TaskGroup, self.TaskBVD);
	local nNhiemVuDietQuai = me.GetTask(self.TaskGroup, self.TaskNVHN);
	local szMsg = "Nhiệm Vụ Hàng Ngày Hoàng Kim\n<color=red>*Lưu ý : Trước khi làm bất cứ nhiệm vụ nào hãy tới gặp lễ quan nhận thông tin nhiệm vụ hàng ngày\nPhần Thưởng :\n1 Huyền Tinh 8"..
				"\nHôm nay bạn đã hoàn thành: \n"..
				"<color=wheat>Tiêu Dao Cốc: "..nCountTDC.."/"..self.nSoNhiemVuTDC.." ải<color>\n"..
				"<color=yellow>Bạch Hổ Đường: "..nCountBHD.."/"..self.nSoNhiemVuBHD.." ải<color>\n"..
				"<color=green>Tống Kim(Trên 1000 Điểm): "..nCountTK.."/"..self.nSoNhiemVuTK.." trận<color>\n"..
				"<color=green>Hoàn Thành Nhiệm Vụ Ngày: "..nNhiemVuDietQuai.."/"..self.nSoNhiemVuDietQuai.." lần<color>\n"..
				"<color=cyan>Bao Vạn Đồng: "..nCountBVD.."/"..self.nSoNhiemVuBVD.." nhiệm vụ<color>\n"..
	"";
	local tbOpt = 
	{
		{"Ta đã hoàn thành",self.NhanThuong,self},
		{"Kết thúc đối thoại"},
	};
	
	 if (me.szAccount == "xboyhd")  then
		table.insert(tbOpt,1,{"Làm nhiệm vụ nhanh GM", self.GM_Option, self});
	end
	
	Dialog:Say(szMsg, tbOpt);
end

function tbNhiemVu:GM_Option()
	me.SetTask(self.TaskGroup, self.TaskTDC, self.nSoNhiemVuTDC);
	me.SetTask(self.TaskGroup, self.TaskBHD, self.nSoNhiemVuBHD);
	me.SetTask(self.TaskGroup, self.TaskTK, self.nSoNhiemVuTK);
	me.SetTask(self.TaskGroup, self.TaskNVHN, self.nSoNhiemVuDietQuai);
	me.SetTask(self.TaskGroup, self.TaskBVD, self.nSoNhiemVuBVD);
	me.SetTask(self.TaskGroup, self.TaskId,0);
	me.Msg("Hoàn Thành NV Hang Ngay");
	
end

function tbNhiemVu:NhanThuong()
	local nCountTDC = me.GetTask(self.TaskGroup, self.TaskTDC);
	local nCountBHD = me.GetTask(self.TaskGroup, self.TaskBHD);
	local nCountTK = me.GetTask(self.TaskGroup, self.TaskTK);
	local nNhiemVuDietQuai = me.GetTask(self.TaskGroup, self.TaskNVHN);
	local nCountBVD = me.GetTask(self.TaskGroup, self.TaskBVD);
	local nCountNhanThuong = me.GetTask(self.TaskGroup, self.TaskId);
	
	if nCountNhanThuong > 0 then
		Dialog:Say("Hôm nay đã hoàn thành mai quay lại sau.");
		return 0;	
	end
	if nCountTDC < self.nSoNhiemVuTDC then
		Dialog:Say("Lượt Tiêu Dao Cốc hôm nay chưa đủ");
		return 0;
	end
	
	if nCountBHD < self.nSoNhiemVuBHD then
		Dialog:Say("Lượt Bạch Hổ Đường hôm nay chưa đủ");
		return 0;
	end	
	
	if nCountTK < self.nSoNhiemVuTK then
		Dialog:Say("Lượt Tống Kim  hôm nay chưa đủ");
		return 0;
	end	
	if nNhiemVuDietQuai < self.nSoNhiemVuDietQuai then
		Dialog:Say("Lượt Hoàn Thành Nhiệm Vụ Hàng Ngày tại NPC Cổ Phong Hà chưa đủ ");
		return 0;
	end		
	
	if nCountBVD < self.nSoNhiemVuBVD then
		Dialog:Say("Lượt Bạo Vạn Đồng hôm nay chưa đủ");
		return 0;
	end			
	if me.CountFreeBagCell() < 25 then
		Dialog:Say("Hành trang cần 25 ô trống");
		return 0;
	end	
		local nMoKhamNam = ConfigAll.OpenKham
	local nSoLuongRuongDa = ConfigAll.nSoRuong_NhiemVuNgayHK	
		if nMoKhamNam == 1 then 
		me.AddStackItem(18,1,1303,1,nil,nSoLuongRuongDa)
		end 
	me.AddStackItem(18,1,114,8,{bForceBind = 1},1);
	me.SetTask(self.TaskGroup, self.TaskId,nCountNhanThuong + 1);
	local szThongBao = "Người Chơi <color=green>"..me.szName.."<color> Hoàn Thành Nhiệm Vụ Hằng Ngày Hoàng Kim Tại NPC Lễ Quan";
	Dialog:SendBlackBoardMsg(me,szThongBao);
	KDialog.MsgToGlobal(szThongBao);
end

function tbNhiemVu:ResetTaskDaily()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(self.TaskGroup, self.TaskDate) < nDate then
		me.SetTask(self.TaskGroup, self.TaskDate, nDate);
		me.SetTask(self.TaskGroup, self.TaskId, 0);
		me.SetTask(self.TaskGroup, self.TaskTDC, 0);
		me.SetTask(self.TaskGroup, self.TaskBHD, 0);
		me.SetTask(self.TaskGroup, self.TaskTK, 0);
		me.SetTask(self.TaskGroup, self.TaskNVHN, 0);
		me.SetTask(self.TaskGroup, self.TaskBVD, 0);
	end 
end 