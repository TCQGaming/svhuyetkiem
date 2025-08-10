-- date:28/03
-- by:iDoctor
-------------------------------------------------------
local tbDoCap5 ={};
SpecialEvent.DoCap5= tbDoCap5;

function tbDoCap5:OnDialog()
	local nCountt = me.GetTask(3089,1)
	if nCountt >= 1 then
		Dialog:Say(string.format("Bạn đã nhận trang bị rồi"));
		return 0;
	end
	
	-- local nDongrut = me.GetTask(3028,1)
	-- if nDongrut < 100 then
		-- Dialog:Say("Để hạn chế lập clone, chỉ những acc đã tích lũy rút 100v Đồng mới có thể nhận");
		-- return 0;
	-- end

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
function tbDoCap5:tv()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiên Vương Thương", self.tvt,self},
			{"Thiên vương Chùy", self.tvc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:tl()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thiếu Lâm Đao", self.tld,self},
			{"Thiếu Lâm Bỗng", self.tlb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:dm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đường Môn Tụ Tiễn", self.dmtt,self},
			{"Đường Môn Hạm Tĩnh", self.dmht,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:nd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ngũ Độc Đao", self.ndd,self},
			{"Ngũ Độc Chưởng", self.ndc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:mg()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Minh Giáo Kiếm", self.mgk,self},
			{"Minh Giáo Chùy", self.mgc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:dt()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Đoàn Thị Kiếm", self.dtk,self},
			{"Đoàn Thị Chỉ", self.dtc,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:nm()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Nga My Chưởng", self.nmc,self},
			{"Nga My Kiếm", self.nmk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:ty()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Thúy Yên Đao", self.tyd,self},
			{"Thúy Yên Kiếm", self.tyk,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:cb()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Cái Bang Rồng", self.cbr,self},
			{"Cái Bang Bỗng", self.cbb,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:tn()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Ma Nhẫn", self.tnd,self},
			{"Chiến Nhẫn", self.tnt,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:vd()
	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Võ Đang Khí", self.vdkhi,self},
			{"Võ Đang Kiếm", self.vdkiem,self},
		}
		Dialog:Say(szMsg,tbOpt);
end
function tbDoCap5:cl()

	local szMsg = "Ngươi thuộc hệ phái gì ?";
		local tbOpt =
		{
			{"Côn Lôn Kiếm", self.clk,self},
			{"Côn Lôn Đao", self.cld,self},
		}
		Dialog:Say(szMsg,tbOpt);
end

function tbDoCap5:tvt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,5,157,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,11,307,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,4,157,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,6,208,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,3,809,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,8,407,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,409,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,10,409,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,9,827,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,568,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,5,157,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,819,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,417,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,319,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,419,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,9,817,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,207,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,417,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,208,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,568,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:tvc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,807,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,809,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,407,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,309,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,409,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,313,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,207,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,407,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,208,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,578,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,817,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,819,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,417,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,319,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,419,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,313,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,207,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,417,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,208,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,578,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:tld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item1 = me.AddItem(2,1,551-10+tbGift.nWeaponLevel, tbGift.nWeaponLevel, nil,tbGift.CuongHoa1);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,632-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item2.Bind(1);
		local item3 = me.AddItem(2,9,630-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item3.Bind(1);
		local item4 = me.AddItem(2,8,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item4.Bind(1);
		local item5 = me.AddItem(2,7,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item5.Bind(1);
		local item6 = me.AddItem(2,10,312-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item7.Bind(1);
		local item8 = me.AddItem(2,4,160-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item8.Bind(1);
		local item9 = me.AddItem(2,11,310-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item9.Bind(1);
		local item10 = me.AddItem(2,6,161-10+tbGift.nArmor_Level, tbGift.nArmor_Level, nil,tbGift.CuongHoa);
		item10.Bind(1);
		me.SetTask(3089,1,1);
end
function tbDoCap5:tlb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item1 = me.AddItem(2,5,207,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,11,307,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,4,157,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,6,208,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,3,809,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,8,407,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,5,409,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,10,409,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,9,827,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,558,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
end
function tbDoCap5:dmtt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,57,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,57,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:dmht()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,2,67,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,2,67,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:ndd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,588,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,588,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
		
end
function tbDoCap5:ndc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,598,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,598,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:mgk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,978,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,978,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:mgc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,847,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,849,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,427,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,329,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,429,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,319,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,217,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,427,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,218,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,968,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,857,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,859,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,437,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,339,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,439,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,319,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,217,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,437,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,218,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,968,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:dtk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,907,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,909,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,447,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,349,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,449,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,325,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,227,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,447,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,228,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,638,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,638,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:dtc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,907,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,909,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,447,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,349,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,449,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,325,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,227,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,447,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,228,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,618,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,618,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:nmc()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,628,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	
end
function tbDoCap5:nmk()
		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item10 = me.AddItem(2,1,638,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
end
function tbDoCap5:tyd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,907,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,909,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,447,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,349,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,449,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,325,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,227,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,447,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,228,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,608,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item20 =  me.AddItem(2,1,608,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:tyk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,907,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,909,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,447,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,349,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,449,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,325,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,227,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,447,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,228,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,638,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,917,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,919,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,457,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,359,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,459,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,325,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,227,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,457,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,228,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,638,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:cbr()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,947,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,949,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,467,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,369,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,469,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,331,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,237,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,467,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,238,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,668,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,957,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,959,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,477,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,379,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,479,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,331,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,237,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,477,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,238,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,668,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:cbb()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,947,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,949,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,467,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,369,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,469,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,331,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,237,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,467,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,238,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,648,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,957,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,959,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,477,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,379,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,479,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,331,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,237,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,477,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,238,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,648,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:tnd()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,947,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,949,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,467,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,369,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,469,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,331,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,237,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,467,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,238,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,678,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,957,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,959,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,477,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,379,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,479,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,331,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,237,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,477,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,238,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,678,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:tnt()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,947,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,949,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,467,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,369,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,469,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,331,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,237,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,467,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,238,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,658,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,957,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,959,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,477,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,379,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,479,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,331,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,237,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,477,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,238,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,658,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:vdkhi()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,987,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,989,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,487,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,389,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,489,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,337,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,247,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,487,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,248,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,508,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,997,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,999,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,497,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,399,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,499,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,337,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,247,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,497,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,248,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,508,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:vdkiem()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		me.SetTask(3089,1,1);
		local item1 = me.AddItem(2,9,987,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,989,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,487,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,389,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,489,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,337,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,247,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,487,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,248,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,698,5);
		item10.Bind(1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,997,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,999,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,497,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,399,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,499,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,337,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,247,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,497,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,248,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,698,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:clk()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,987,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,989,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,487,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,389,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,489,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,337,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,247,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,487,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,248,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,518,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item21 = me.AddItem(2,9,997,5);
		item21.Bind(1);
		local item12 = me.AddItem(2,3,999,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,497,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,399,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,499,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,337,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,247,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,497,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,248,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,518,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
	
end
function tbDoCap5:cld()
	local nNeedBag = 20;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 then
		local item1 = me.AddItem(2,9,987,5);
		item1.Bind(1);
		local item2 = me.AddItem(2,3,989,5);
		item2.Bind(1);
		local item3 = me.AddItem(2,8,487,5);
		item3.Bind(1);
		local item4 = me.AddItem(2,10,389,5);
		item4.Bind(1);
		local item5 = me.AddItem(2,5,489,5);
		item5.Bind(1);
		local item6 = me.AddItem(2,5,337,5);
		item6.Bind(1);
		local item7 = me.AddItem(2,4,247,5);
		item7.Bind(1);
		local item8 = me.AddItem(2,11,487,5);
		item8.Bind(1);
		local item9 = me.AddItem(2,6,248,5);
		item9.Bind(1);
		local item10 = me.AddItem(2,1,688,5);
		item10.Bind(1);
		me.SetTask(3089,1,1);
	end
	if tbInfo.nSex == 1 then
		local item11 = me.AddItem(2,9,997,5);
		item11.Bind(1);
		local item12 = me.AddItem(2,3,999,5);
		item12.Bind(1);
		local item13 = me.AddItem(2,8,497,5);
		item13.Bind(1);
		local item14 = me.AddItem(2,10,399,5);
		item14.Bind(1);
		local item15 = me.AddItem(2,5,499,5);
		item15.Bind(1);
		local item16 = me.AddItem(2,5,337,5);
		item16.Bind(1);
		local item17 = me.AddItem(2,4,247,5);
		item17.Bind(1);
		local item18 = me.AddItem(2,11,497,5);
		item18.Bind(1);
		local item19 = me.AddItem(2,6,248,5);
		item19.Bind(1);
		local item20 = me.AddItem(2,1,688,5);
		item20.Bind(1);
		me.SetTask(3089,1,1);
	end
end
