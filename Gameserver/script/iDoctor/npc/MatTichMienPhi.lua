-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbMatTichMienPhi ={};
SpecialEvent.MatTichMienPhi= tbMatTichMienPhi;

function tbMatTichMienPhi:OnDialog()
	local nFaction = me.nFaction;
	if nFaction <= 0 then
		Dialog:Say("Bạn chưa gia nhập môn phái, hãy chọn cho mình một môn phái");
		return 0;
	end
	
	local nCountt = me.GetTask(3028,1)
	if nCountt < 3500 then
		Dialog:Say(string.format("Bạn chưa đạt mốc tích lũy nạp thẻ <color=red>3500 vạn đồng<color>"));
		return 0;
	end

	if me.nLevel < 70 then
		Dialog:Say(string.format("Bạn chưa đạt cấp <color=red>70<color>"));
		return 0;
	end

	if me.nSeries == 1 then
		self:HeKim();	
	elseif me.nSeries == 2 then
		self:HeMoc();	
	elseif me.nSeries == 3 then
		self:HeThuy();	
	elseif me.nSeries == 4 then
		self:HeHoa();	
	elseif me.nSeries == 5 then
		self:HeTho();	
	end
end

function tbMatTichMienPhi:HeTho()
	local szMsg = "Mật tịch mua giá 0 NHHT dành cho người chơi đạt mốc nạp thẻ 3500 vạn đồng";
	local tbOpt =
	{
		{"Côn Lôn Kiếm", self.clk,self},
		{"Côn Lôn Đao", self.cld,self},
		{"Võ Đang Khí", self.vdkhi,self},
		{"Võ Đang Kiếm", self.vdk,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichMienPhi:vdk()
	me.AddItem(1,14,18,2);
	me.AddItem(1,14,18,2);
	me.AddItem(1,14,18,2);
end

function tbMatTichMienPhi:vdkhi()
	me.AddItem(1,14,17,2);
	me.AddItem(1,14,17,2);
	me.AddItem(1,14,17,2);
end

function tbMatTichMienPhi:cld()
	me.AddItem(1,14,19,2);
	me.AddItem(1,14,19,2);
	me.AddItem(1,14,19,2);
end

function tbMatTichMienPhi:clk()
	me.AddItem(1,14,20,2);
	me.AddItem(1,14,20,2);
	me.AddItem(1,14,20,2);
end

function tbMatTichMienPhi:HeHoa()
	local szMsg = "Mật tịch mua giá 0 NHHT dành cho người chơi đạt mốc nạp thẻ 3500 vạn đồng";
	local tbOpt =
	{
		{"Thiên Nhẫn Đao", self.tnd,self},
		{"Thiên Nhẫn Kích", self.tnk,self},
		{"Cái Bang Bổng", self.cbb,self},
		{"Cái Bang Rồng", self.cbr,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichMienPhi:cbr()
	me.AddItem(1,14,13,2);
	me.AddItem(1,14,13,2);
	me.AddItem(1,14,13,2);
end

function tbMatTichMienPhi:cbb()
	me.AddItem(1,14,14,2);
	me.AddItem(1,14,14,2);
	me.AddItem(1,14,14,2);
end

function tbMatTichMienPhi:tnk()
	me.AddItem(1,14,15,2);
	me.AddItem(1,14,15,2);
	me.AddItem(1,14,15,2);
end

function tbMatTichMienPhi:tnd()
	me.AddItem(1,14,16,2);
	me.AddItem(1,14,16,2);
	me.AddItem(1,14,16,2);
end

function tbMatTichMienPhi:HeThuy()
	local szMsg = "Mật tịch mua giá 0 NHHT dành cho người chơi đạt mốc nạp thẻ 3500 vạn đồng";
	local tbOpt =
	{
		{"Thúy Yên Kiếm", self.tyk,self},
		{"Thúy Yên Đao", self.tyd,self},
		{"Nga My Kiếm", self.nmk,self},
		{"Nga My Chưởng", self.nmc,self},
		{"Đoàn Thị Kiếm", self.dtk,self},
		{"Đoàn Thị Chỉ", self.dtc,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichMienPhi:dtc()
	me.AddItem(1,14,23,2);
	me.AddItem(1,14,23,2);
	me.AddItem(1,14,23,2);
end

function tbMatTichMienPhi:dtk()
	me.AddItem(1,14,24,2);
	me.AddItem(1,14,24,2);
	me.AddItem(1,14,24,2);
end

function tbMatTichMienPhi:nmc()
	me.AddItem(1,14,9,2);
	me.AddItem(1,14,9,2);
	me.AddItem(1,14,9,2);
end

function tbMatTichMienPhi:nmk()
	me.AddItem(1,14,10,2);
	me.AddItem(1,14,10,2);
	me.AddItem(1,14,10,2);
end

function tbMatTichMienPhi:tyd()
	me.AddItem(1,14,12,2);
	me.AddItem(1,14,12,2);
	me.AddItem(1,14,12,2);
end

function tbMatTichMienPhi:tyk()
	me.AddItem(1,14,11,2);
	me.AddItem(1,14,11,2);
	me.AddItem(1,14,11,2);
end

function tbMatTichMienPhi:HeKim()
	local szMsg = "Mật tịch mua giá 0 NHHT dành cho người chơi đạt mốc nạp thẻ 3500 vạn đồng";
	local tbOpt =
	{
		{"Thiên Vương Thương", self.tvt,self},
		{"Thiên vương Chùy", self.tvc,self},
		{"Thiếu Lâm Đao", self.tld,self},
		{"Thiếu Lâm Bỗng", self.tlb,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichMienPhi:tld()
	me.AddItem(1,14,1,2);
	me.AddItem(1,14,1,2);
	me.AddItem(1,14,1,2);
end

function tbMatTichMienPhi:tlb()
	me.AddItem(1,14,2,2);
	me.AddItem(1,14,2,2);
	me.AddItem(1,14,2,2);
end

function tbMatTichMienPhi:tvt()
	me.AddItem(1,14,3,2);
	me.AddItem(1,14,3,2);
	me.AddItem(1,14,3,2);
end

function tbMatTichMienPhi:tvc()
	me.AddItem(1,14,4,2);
	me.AddItem(1,14,4,2);
	me.AddItem(1,14,4,2);
end

function tbMatTichMienPhi:HeMoc()
	local szMsg = "Mật tịch mua giá 0 NHHT dành cho người chơi đạt mốc nạp thẻ 3500 vạn đồng";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichMienPhi:mgc()
	me.AddItem(1,14,21,2);
	me.AddItem(1,14,21,2);
	me.AddItem(1,14,21,2);
end

function tbMatTichMienPhi:mgk()
	me.AddItem(1,14,22,2);
	me.AddItem(1,14,22,2);
	me.AddItem(1,14,22,2);
end

function tbMatTichMienPhi:ndc()
	me.AddItem(1,14,8,2);
	me.AddItem(1,14,8,2);
	me.AddItem(1,14,8,2);
end

function tbMatTichMienPhi:ndd()
	me.AddItem(1,14,7,2);
	me.AddItem(1,14,7,2);
	me.AddItem(1,14,7,2);
end

function tbMatTichMienPhi:dmht()
	me.AddItem(1,14,5,2);
	me.AddItem(1,14,5,2);
	me.AddItem(1,14,5,2);
end

function tbMatTichMienPhi:dmtt()
	me.AddItem(1,14,6,2);
	me.AddItem(1,14,6,2);
	me.AddItem(1,14,6,2);
end
