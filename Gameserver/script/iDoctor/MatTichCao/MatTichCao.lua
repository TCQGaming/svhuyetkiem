-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbMatTichCao ={};
SpecialEvent.BanMatTichCao= tbMatTichCao;

function tbMatTichCao:OnDialog()
	local nFaction = me.nFaction;
	if nFaction <= 0 then
		Dialog:Say("Bạn chưa gia nhập môn phái, hãy chọn cho mình một môn phái");
		return 0;
	end
	
	local nNeedBag = 5;
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

function tbMatTichCao:HeTho()
	local nCount = me.GetItemCountInBags(18,1,553,1) -- Tiền Du Long
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Cao<color> cần <color=green>150 Tiền Du Long<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>150 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Côn Lôn Kiếm", self.clk,self},
		{"Côn Lôn Đao", self.cld,self},
		{"Võ Đang Khí", self.vdkhi,self},
		{"Võ Đang Kiếm", self.vdk,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichCao:vdk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,18,3);
end

function tbMatTichCao:vdkhi()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,17,3);
end

function tbMatTichCao:cld()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,19,3);
end

function tbMatTichCao:clk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,20,3);
end

function tbMatTichCao:HeHoa()
	local nCount = me.GetItemCountInBags(18,1,553,1) -- Tiền Du Long
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Cao<color> cần <color=green>150 Tiền Du Long<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>150 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Thiên Nhẫn Đao", self.tnd,self},
		{"Thiên Nhẫn Kích", self.tnk,self},
		{"Cái Bang Bổng", self.cbb,self},
		{"Cái Bang Rồng", self.cbr,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichCao:cbr()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,13,3);
end

function tbMatTichCao:cbb()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,14,3);
end

function tbMatTichCao:tnk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,15,3);
end

function tbMatTichCao:tnd()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,16,3);
end

function tbMatTichCao:HeThuy()
	local nCount = me.GetItemCountInBags(18,1,553,1) -- Tiền Du Long
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Cao<color> cần <color=green>150 Tiền Du Long<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>150 Tiền Du Long<color>";
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

function tbMatTichCao:dtc()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,23,3);
end

function tbMatTichCao:dtk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,24,3);
end

function tbMatTichCao:nmc()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,9,3);
end

function tbMatTichCao:nmk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,10,3);
end

function tbMatTichCao:tyd()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,12,3);
end

function tbMatTichCao:tyk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,11,3);
end

function tbMatTichCao:HeKim()
	local nCount = me.GetItemCountInBags(18,1,553,1) -- Tiền Du Long
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Cao<color> cần <color=green>150 Tiền Du Long<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>150 Tiền Du Long<color>";
	local tbOpt =
	{
		{"Thiên Vương Thương", self.tvt,self},
		{"Thiên vương Chùy", self.tvc,self},
		{"Thiếu Lâm Đao", self.tld,self},
		{"Thiếu Lâm Bỗng", self.tlb,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichCao:tld()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,1,3);
end

function tbMatTichCao:tlb()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,2,3);
end

function tbMatTichCao:tvt()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,3,3);
end

function tbMatTichCao:tvc()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,4,3);
end

function tbMatTichCao:HeMoc()
	local nCount = me.GetItemCountInBags(18,1,553,1) -- Tiền Du Long
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Cao<color> cần <color=green>150 Tiền Du Long<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Cao Cấp<color> được bán với giá <color=yellow>150 Tiền Du Long<color>";
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

function tbMatTichCao:mgc()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,21,3);
end

function tbMatTichCao:mgk()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,22,3);
end

function tbMatTichCao:ndc()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,8,3);
end

function tbMatTichCao:ndd()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,7,3);
end

function tbMatTichCao:dmht()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,5,3);
end

function tbMatTichCao:dmtt()
	local tbItemId1	= {18,1,553,1,0,0}; -- Tiền Du Long
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,6,3);
end
