-- date:24/07/2018
-- by:iDoctor
-------------------------------------------------------
local tbSetDoTam ={};
SpecialEvent.SetDoTam= tbSetDoTam;

function tbSetDoTam:OnDialog()
	local szMsg = "Hỗ trợ người chơi thử nghiệm alphatest";
	local tbOpt = 
	{
	    {"Ta muốn nhận trang bị" , self.nhando902, self};
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbSetDoTam:nhando902()
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
function tbSetDoTam:tv()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.tvt,self},
			{"Thiên vương Chùy", self.tvc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:tl()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiếu Lâm Đao", self.tld,self},
			{"Thiếu Lâm Bỗng", self.tlb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:dm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:nd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:mg()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:dt()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đoàn Thị Kiếm", self.dtk,self},
			{"Đoàn Thị Chỉ", self.dtc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:nm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Nga My Chưởng", self.nmc,self},
			{"Nga My Kiếm", self.nmk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:ty()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thúy Yên Đao", self.tyd,self},
			{"Thúy Yên Kiếm", self.tyk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:cb()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.cbr,self},
			{"Cái Bang Bỗng", self.cbb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:tn()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ma Nhẫn", self.tnd,self},
			{"Chiến Nhẫn", self.tnt,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:vd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Võ Đang Khí", self.vdkhi,self},
			{"Võ Đang Kiếm", self.vdkiem,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:cl()

	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Côn Lôn Kiếm", self.clk,self},
			{"Côn Lôn Đao", self.cld,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbSetDoTam:tvt()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,809,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,811,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,409,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,311,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,411,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,315,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,209,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,409,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,210,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,749,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,819,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,821,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,419,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,321,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,421,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,315,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,209,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,419,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,210,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,749,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:tvc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,809,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,811,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,409,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,311,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,411,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,315,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,209,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,409,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,210,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,759,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,819,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,821,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,419,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,321,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,421,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,315,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,209,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,419,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,210,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,759,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:tld()
		local item1 = me.AddItem(2,9,829,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,831,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,409,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,311,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,411,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,315,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,209,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,409,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,210,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,729,8,1,12);
		item10.Bind(1);

end
function tbSetDoTam:tlb()
		local item1 = me.AddItem(2,9,809,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,811,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,409,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,311,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,411,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,315,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,209,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,409,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,210,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,739,8,1,12);
		item10.Bind(1);

end
function tbSetDoTam:dmtt()
local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,849,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,851,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,98,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,859,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,861,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,98,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:dmht()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,849,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,851,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,88,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,859,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,861,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,88,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:ndd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,849,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,851,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,769,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,859,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,861,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,769,8,1,12);
		item20.Bind(1);

	end
		
end
function tbSetDoTam:ndc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,869,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,871,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,779,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,879,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,881,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,779,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:mgk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,849,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,851,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,999,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,859,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,861,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,999,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:mgc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,849,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,851,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,429,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,331,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,431,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,321,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,219,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,429,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,220,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,989,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,859,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,861,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,439,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,341,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,441,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,321,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,219,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,439,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,220,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,989,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:dtk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,909,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,911,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,449,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,351,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,451,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,327,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,229,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,449,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,230,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,819,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,919,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,921,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,819,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:dtc()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,889,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,891,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,449,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,351,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,451,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,327,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,229,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,449,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,230,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,799,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,899,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,901,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,799,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:nmc()
		local item11 = me.AddItem(2,9,919,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,921,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,809,8,1,12);
		item20.Bind(1);

	
end
function tbSetDoTam:nmk()
		local item11 = me.AddItem(2,9,919,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,921,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item10 = me.AddItem(2,1,819,8,1,12);
		item10.Bind(1);

end
function tbSetDoTam:tyd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,909,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,911,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,449,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,351,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,451,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,327,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,229,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,449,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,230,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,789,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,919,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,921,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,789,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:tyk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,909,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,911,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,449,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,351,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,451,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,327,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,229,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,449,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,230,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,819,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,919,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,921,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,459,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,361,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,461,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,327,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,229,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,459,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,230,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,819,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:cbr()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,949,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,951,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,469,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,371,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,471,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,333,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,239,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,469,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,240,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,849,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,959,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,961,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,479,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,381,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,481,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,333,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,239,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,479,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,240,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,849,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:cbb()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,949,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,951,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,469,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,371,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,471,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,333,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,239,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,469,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,240,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,829,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,959,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,961,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,479,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,381,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,481,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,333,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,239,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,479,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,240,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,829,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:tnd()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,949,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,951,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,469,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,371,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,471,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,333,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,239,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,469,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,240,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,859,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,959,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,961,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,479,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,381,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,481,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,333,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,239,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,479,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,240,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,859,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:tnt()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,929,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,931,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,469,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,371,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,471,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,333,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,239,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,469,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,240,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,839,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,939,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,941,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,479,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,381,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,481,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,333,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,239,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,479,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,240,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,839,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:vdkhi()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,989,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,991,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,489,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,391,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,491,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,339,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,249,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,489,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,250,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,889,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,999,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1001,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,499,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,401,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,501,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,339,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,249,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,499,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,250,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,889,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:vdkiem()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,969,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,971,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,489,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,391,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,491,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,339,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,249,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,489,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,250,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,879,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,979,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,981,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,499,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,401,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,501,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,339,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,249,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,499,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,250,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,879,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:clk()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,989,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,991,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,489,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,391,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,491,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,339,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,249,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,489,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,250,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,899,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,999,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1001,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,499,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,401,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,501,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,339,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,249,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,499,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,250,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,899,8,1,12);
		item20.Bind(1);

	end
	
end
function tbSetDoTam:cld()
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,989,9,1,12);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,991,9,1,12);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,489,9,1,12);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,391,9,1,12);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,491,9,1,12);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,339,9,1,12);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,249,9,1,12);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,489,9,1,12);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,250,9,1,12);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,869,8,1,12);
		item10.Bind(1);

	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,999,9,1,12);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,1001,9,1,12);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,499,9,1,12);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,401,9,1,12);
		item14.Bind(1);
		local item15 = me.AddItem(2,7,501,9,1,12);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,339,9,1,12);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,249,9,1,12);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,499,9,1,12);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,250,9,1,12);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,869,8,1,12);
		item20.Bind(1);

	end
	
end
