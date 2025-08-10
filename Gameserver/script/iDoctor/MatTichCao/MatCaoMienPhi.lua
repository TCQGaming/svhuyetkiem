-----Edit Script : TCQGaming
-------------------------------------------------------
local tbMatCaoMienPhi ={};
SpecialEvent.MatCaoMienPhi= tbMatCaoMienPhi;

function tbMatCaoMienPhi:OnDialog()
	local nFaction = me.nFaction;
	if nFaction <= 0 then
		Dialog:Say("Bạn chưa gia nhập môn phái, hãy chọn cho mình một môn phái");
		return 0;
	end

	local nCountt = me.GetTask(3028,1)
	if nCountt < 7000 then
		Dialog:Say(string.format("Bạn chưa đạt mốc tích lũy nạp thẻ <color=red>7000 vạn đồng<color>"));
		return 0;
	end
	
	if me.nLevel < 100 then
		Dialog:Say(string.format("Bạn chưa đạt cấp <color=red>100<color>"));
		return 0;
	end

	local nNeedBag = 2;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
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

function tbMatCaoMienPhi:HeTho()
	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>0 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Côn Lôn Kiếm", self.clk,self},
		{"Côn Lôn Đao", self.cld,self},
		{"Võ Đang Khí", self.vdkhi,self},
		{"Võ Đang Kiếm", self.vdk,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatCaoMienPhi:vdk()
	me.AddItem(1,14,18,3);
	me.AddItem(1,14,18,3);
	me.AddItem(1,14,18,3);
end

function tbMatCaoMienPhi:vdkhi()
	me.AddItem(1,14,17,3);
	me.AddItem(1,14,17,3);
	me.AddItem(1,14,17,3);
end

function tbMatCaoMienPhi:cld()
	me.AddItem(1,14,19,3);
	me.AddItem(1,14,19,3);
	me.AddItem(1,14,19,3);
end

function tbMatCaoMienPhi:clk()
	me.AddItem(1,14,20,3);
	me.AddItem(1,14,20,3);
	me.AddItem(1,14,20,3);
end

function tbMatCaoMienPhi:HeHoa()
	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>0 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Thiên Nhẫn Đao", self.tnd,self},
		{"Thiên Nhẫn Kích", self.tnk,self},
		{"Cái Bang Bổng", self.cbb,self},
		{"Cái Bang Rồng", self.cbr,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatCaoMienPhi:cbr()
	me.AddItem(1,14,13,3);
	me.AddItem(1,14,13,3);
	me.AddItem(1,14,13,3);
end

function tbMatCaoMienPhi:cbb()
	me.AddItem(1,14,14,3);
	me.AddItem(1,14,14,3);
	me.AddItem(1,14,14,3);
end

function tbMatCaoMienPhi:tnk()
	me.AddItem(1,14,15,3);
	me.AddItem(1,14,15,3);
	me.AddItem(1,14,15,3);
end

function tbMatCaoMienPhi:tnd()
	me.AddItem(1,14,16,3);
	me.AddItem(1,14,16,3);
	me.AddItem(1,14,16,3);
end

function tbMatCaoMienPhi:HeThuy()
	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>0 Tiền Du Long<color>";
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

function tbMatCaoMienPhi:dtc()
	me.AddItem(1,14,23,3);
	me.AddItem(1,14,23,3);
	me.AddItem(1,14,23,3);
end

function tbMatCaoMienPhi:dtk()
	me.AddItem(1,14,24,3);
	me.AddItem(1,14,24,3);
	me.AddItem(1,14,24,3);
end

function tbMatCaoMienPhi:nmc()
	me.AddItem(1,14,9,3);
	me.AddItem(1,14,9,3);
	me.AddItem(1,14,9,3);
end

function tbMatCaoMienPhi:nmk()
	me.AddItem(1,14,10,3);
	me.AddItem(1,14,10,3);
	me.AddItem(1,14,10,3);
end

function tbMatCaoMienPhi:tyd()
	me.AddItem(1,14,12,3);
	me.AddItem(1,14,12,3);
	me.AddItem(1,14,12,3);
end

function tbMatCaoMienPhi:tyk()
	me.AddItem(1,14,11,3);
	me.AddItem(1,14,11,3);
	me.AddItem(1,14,11,3);
end

function tbMatCaoMienPhi:HeKim()
	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>0 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Thiên Vương Thương", self.tvt,self},
		{"Thiên vương Chùy", self.tvc,self},
		{"Thiếu Lâm Đao", self.tld,self},
		{"Thiếu Lâm Bỗng", self.tlb,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatCaoMienPhi:tld()
	me.AddItem(1,14,1,3);
	me.AddItem(1,14,1,3);
	me.AddItem(1,14,1,3);
end

function tbMatCaoMienPhi:tlb()
	me.AddItem(1,14,2,3);
	me.AddItem(1,14,2,3);
	me.AddItem(1,14,2,3);
end

function tbMatCaoMienPhi:tvt()
	me.AddItem(1,14,3,3);
	me.AddItem(1,14,3,3);
	me.AddItem(1,14,3,3);
end

function tbMatCaoMienPhi:tvc()
	me.AddItem(1,14,4,3);
	me.AddItem(1,14,4,3);
	me.AddItem(1,14,4,3);
end

function tbMatCaoMienPhi:HeMoc()
	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>0 Tiền Du Long<color>";
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

function tbMatCaoMienPhi:mgc()
	me.AddItem(1,14,21,3);
	me.AddItem(1,14,21,3);
	me.AddItem(1,14,21,3);
end

function tbMatCaoMienPhi:mgk()
	me.AddItem(1,14,22,3);
	me.AddItem(1,14,22,3);
	me.AddItem(1,14,22,3);
end

function tbMatCaoMienPhi:ndc()
	me.AddItem(1,14,8,3);
	me.AddItem(1,14,8,3);
	me.AddItem(1,14,8,3);
end

function tbMatCaoMienPhi:ndd()
	me.AddItem(1,14,7,3);
	me.AddItem(1,14,7,3);
	me.AddItem(1,14,7,3);
end

function tbMatCaoMienPhi:dmht()
	me.AddItem(1,14,5,3);
	me.AddItem(1,14,5,3);
	me.AddItem(1,14,5,3);
end

function tbMatCaoMienPhi:dmtt()
	me.AddItem(1,14,6,3);
	me.AddItem(1,14,6,3);
	me.AddItem(1,14,6,3);
end
