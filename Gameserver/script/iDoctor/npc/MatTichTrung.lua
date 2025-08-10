-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbMatTichTrung ={};
SpecialEvent.BanMatTichTrung= tbMatTichTrung;

function tbMatTichTrung:OnDialog()
	local nFaction = me.nFaction;
	if nFaction <= 0 then
		Dialog:Say("Bạn chưa gia nhập môn phái, hãy chọn cho mình một môn phái");
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

function tbMatTichTrung:HeTho()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Trung<color> cần <color=green>150 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Trung Cấp<color> được bán với giá <color=yellow>150 Ngũ Hành Hồn Thạch<color>";
	local tbOpt =
	{
		{"Côn Lôn Kiếm", self.clk,self},
		{"Côn Lôn Đao", self.cld,self},
		{"Võ Đang Khí", self.vdkhi,self},
		{"Võ Đang Kiếm", self.vdk,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichTrung:vdk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,18,2);
end

function tbMatTichTrung:vdkhi()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,17,2);
end

function tbMatTichTrung:cld()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,19,2);
end

function tbMatTichTrung:clk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,20,2);
end

function tbMatTichTrung:HeHoa()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Trung<color> cần <color=green>150 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Trung Cấp<color> được bán với giá <color=yellow>150 Ngũ Hành Hồn Thạch<color>";
	local tbOpt =
	{
		{"Thiên Nhẫn Đao", self.tnd,self},
		{"Thiên Nhẫn Kích", self.tnk,self},
		{"Cái Bang Bổng", self.cbb,self},
		{"Cái Bang Rồng", self.cbr,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichTrung:cbr()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,13,2);
end

function tbMatTichTrung:cbb()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,14,2);
end

function tbMatTichTrung:tnk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,15,2);
end

function tbMatTichTrung:tnd()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,16,2);
end

function tbMatTichTrung:HeThuy()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Trung<color> cần <color=green>150 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Trung Cấp<color> được bán với giá <color=yellow>150 Ngũ Hành Hồn Thạch<color>";
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

function tbMatTichTrung:dtc()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,23,2);
end

function tbMatTichTrung:dtk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,24,2);
end

function tbMatTichTrung:nmc()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,9,2);
end

function tbMatTichTrung:nmk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,10,2);
end

function tbMatTichTrung:tyd()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,12,2);
end

function tbMatTichTrung:tyk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,11,2);
end

function tbMatTichTrung:HeKim()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Trung<color> cần <color=green>150 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Trung Cấp<color> được bán với giá <color=yellow>150 Ngũ Hành Hồn Thạch<color>";
	local tbOpt =
	{
		{"Thiên Vương Thương", self.tvt,self},
		{"Thiên vương Chùy", self.tvc,self},
		{"Thiếu Lâm Đao", self.tld,self},
		{"Thiếu Lâm Bỗng", self.tlb,self},
	}
	Dialog:Say(szMsg,tbOpt);
end

function tbMatTichTrung:tld()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,1,2);
end

function tbMatTichTrung:tlb()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,2,2);
end

function tbMatTichTrung:tvt()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,3,2);
end

function tbMatTichTrung:tvc()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,4,2);
end

function tbMatTichTrung:HeMoc()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 150 then
    	Dialog:Say("Để mua <color=yellow>Mật Tịch Trung<color> cần <color=green>150 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end

	local szMsg = "<color=yellow>Mật Tịch Trung Cấp<color> được bán với giá <color=yellow>150 Ngũ Hành Hồn Thạch<color>";
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

function tbMatTichTrung:mgc()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,21,2);
end

function tbMatTichTrung:mgk()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,22,2);
end

function tbMatTichTrung:ndc()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,8,2);
end

function tbMatTichTrung:ndd()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,7,2);
end

function tbMatTichTrung:dmht()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,5,2);
end

function tbMatTichTrung:dmtt()
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 150);
	me.AddItem(1,14,6,2);
end

