-- date:24/07/2018
-- by:iDoctor
-------------------------------------------------------
local tbSetDoTest ={};
SpecialEvent.SetDoTest= tbSetDoTest;

function tbSetDoTest:OnDialog()
	local szMsg = "Hỗ trợ người chơi thử nghiệm alphatest";
	local tbOpt = 
	{
	    {"Ta muốn nhận trang bị" , self.nhando902, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbSetDoTest:nhando902()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Thiếu Lâm", self.tl,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
	if tbInfo.nSex == 1 then
		local szMsg = "Ngươi thuộc môn phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương", self.tv,self},
			{"Đường Môn", self.dm,self},
			{"Ngũ Độc", self.nd,self},
			{"Minh Giáo", self.mg,self},
			{"Đoàn Thị", self.dt,self},
			{"Nga My", self.nm,self},
			{"Thúy Yên", self.ty,self},
			{"Cái Bang", self.cb,self},
			{"Thiên Nhẫn", self.tn,self},
			{"Võ Đang", self.vd,self},
			{"Côn Lôn", self.cl,self},
		}
		Dialog:Say(szMsg,tbOpt);
	end
end
function tbSetDoTest:tv()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.tvt,self},
			{"Thiên vương Chùy", self.tvc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:tl()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiếu Lâm Đao", self.tld,self},
			{"Thiếu Lâm Bỗng", self.tlb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:dm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:nd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:mg()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:dt()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đoàn Thị Kiếm", self.dtk,self},
			{"Đoàn Thị Chỉ", self.dtc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:nm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Nga My Chưởng", self.nmc,self},
			{"Nga My Kiếm", self.nmk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:ty()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thúy Yên Đao", self.tyd,self},
			{"Thúy Yên Kiếm", self.tyk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:cb()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.cbr,self},
			{"Cái Bang Bỗng", self.cbb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:tn()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ma Nhẫn", self.tnd,self},
			{"Chiến Nhẫn", self.tnt,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:vd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Võ Đang Khí", self.vdkhi,self},
			{"Võ Đang Kiếm", self.vdkiem,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:cl()

	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Côn Lôn Kiếm", self.clk,self},
			{"Côn Lôn Đao", self.cld,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTest:tvt()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,810,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,812,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,410,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,312,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,412,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,316,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,210,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,410,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,211,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,751,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,820,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,822,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,420,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,322,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,422,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,316,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,210,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,420,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,211,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,751,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:tvc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,810,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,812,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,410,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,312,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,412,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,316,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,210,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,410,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,211,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,761,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,820,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,822,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,420,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,322,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,422,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,316,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,210,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,420,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,211,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,761,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:tld()
		local item1 = me.AddItem(2,9,830,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,832,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,410,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,312,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,412,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,316,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,210,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,410,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,211,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,731,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
end
function tbSetDoTest:tlb()
		local item1 = me.AddItem(2,9,810,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,812,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,410,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,312,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,412,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,316,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,210,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,410,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,211,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,741,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
end
function tbSetDoTest:dmtt()
local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,850,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,852,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,100,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,860,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,862,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,100,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:dmht()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,850,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,852,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,90,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,860,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,862,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,90,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:ndd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,850,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,852,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,771,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,860,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,862,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,771,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
		
end
function tbSetDoTest:ndc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,870,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,872,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,781,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,880,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,882,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,781,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:mgk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,850,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,852,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,1001,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,860,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,862,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,1001,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:mgc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,850,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,852,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,430,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,332,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,432,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,322,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,220,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,430,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,221,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,991,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,860,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,862,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,440,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,342,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,442,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,322,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,220,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,440,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,221,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,991,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:dtk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,910,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,912,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,450,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,352,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,452,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,328,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,230,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,450,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,231,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,821,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,920,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,922,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,821,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:dtc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,890,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,892,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,450,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,352,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,452,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,328,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,230,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,450,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,231,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,801,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,900,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,902,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,801,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:nmc()
		local item11 = me.AddItem(2,9,920,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,922,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,811,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	
end
function tbSetDoTest:nmk()
		local item11 = me.AddItem(2,9,920,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,922,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item10 = me.AddItem(2,1,821,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
end
function tbSetDoTest:tyd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,910,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,912,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,450,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,352,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,452,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,328,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,230,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,450,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,231,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,791,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,920,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,922,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,791,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:tyk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,910,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,912,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,450,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,352,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,452,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,328,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,230,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,450,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,231,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,821,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,920,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,922,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,460,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,362,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,462,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,328,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,230,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,460,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,231,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,821,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:cbr()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,950,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,952,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,470,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,372,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,472,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,334,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,240,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,470,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,241,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,851,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,960,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,962,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,480,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,382,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,482,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,334,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,240,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,480,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,241,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,851,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:cbb()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,950,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,952,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,470,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,372,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,472,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,334,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,240,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,470,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,241,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,831,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,960,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,962,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,480,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,382,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,482,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,334,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,240,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,480,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,241,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,831,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:tnd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,950,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,952,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,470,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,372,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,472,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,334,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,240,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,470,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,241,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,861,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,960,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,962,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,480,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,382,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,482,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,334,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,240,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,480,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,241,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,861,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:tnt()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,930,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,932,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,470,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,372,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,472,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,334,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,240,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,470,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,241,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,841,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,940,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,942,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,480,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,382,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,482,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,334,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,240,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,480,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,241,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,841,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:vdkhi()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,990,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,992,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,490,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,392,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,492,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,340,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,250,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,490,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,251,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,891,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,1000,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1002,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,500,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,402,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,502,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,340,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,250,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,500,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,251,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,891,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:vdkiem()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,970,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,972,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,490,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,392,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,492,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,340,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,250,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,490,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,251,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,881,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,980,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,982,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,500,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,402,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,502,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,340,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,250,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,500,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,251,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,881,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:clk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,990,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,992,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,490,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,392,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,492,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,340,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,250,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,490,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,251,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,901,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,1000,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1002,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,500,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,402,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,502,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,340,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,250,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,500,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,251,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,901,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
function tbSetDoTest:cld()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,990,10,1,14);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,992,10,1,14);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,490,10,1,14);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,392,10,1,14);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,492,10,1,14);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,340,10,1,14);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,250,10,1,14);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,490,10,1,14);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,251,10,1,14);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,871,10,1,14);
		item10.Bind(1);
		me.SetTask(2122,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,1000,10,1,14);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1002,10,1,14);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,500,10,1,14);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,402,10,1,14);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,502,10,1,14);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,340,10,1,14);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,250,10,1,14);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,500,10,1,14);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,251,10,1,14);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,871,10,1,14);
		item20.Bind(1);
		me.SetTask(2122,1,1);
	end
	
end
