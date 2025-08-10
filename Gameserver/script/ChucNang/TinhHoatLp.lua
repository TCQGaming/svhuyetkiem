-- date:22/07
-- by:iDoctor
-------------------------------------------------------
local tbTinhHoatLp ={};
TinhHoat.TinhHoatLp= tbTinhHoatLp;
tbTinhHoatLp.Gia_TinhLuc_Tieu = 300;
tbTinhHoatLp.Gia_TinhLuc_Trung = 700;
tbTinhHoatLp.Gia_TinhLuc_Dai = 1000;
tbTinhHoatLp.Gia_TinhLuc_Bo = 100000;
tbTinhHoatLp.Task_Goup = 3118;
tbTinhHoatLp.Task_Tinh_Tieu = 64;
tbTinhHoatLp.Task_Tinh_Trung = 66;
tbTinhHoatLp.Task_Tinh_Dai = 68;
tbTinhHoatLp.Task_Hoat_Tieu = 70;
tbTinhHoatLp.Task_Hoat_Trung = 72;
tbTinhHoatLp.Task_Hoat_Dai = 74;
tbTinhHoatLp.Gioi_Han_Tieu = 5;
tbTinhHoatLp.Gioi_Han_Trung = 5;
tbTinhHoatLp.Gioi_Han_Dai = 10;

function tbTinhHoatLp:OnDialog()
	DoScript("\\script\\ChucNang\\TinhHoatLp.lua");
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(3118,69) < nDate then
		me.SetTask(3118,69, nDate);
		me.SetTask(3118,70, 0);
	end 

	if me.GetTask(3118,71) < nDate then
		me.SetTask(3118,71, nDate);
		me.SetTask(3118,72, 0);
	end 

	if me.GetTask(3118,73) < nDate then
		me.SetTask(3118,73, nDate);
		me.SetTask(3118,74, 0);
	end 

	if me.GetTask(3118,75) < nDate then
		me.SetTask(3118,75, nDate);
		me.SetTask(3118,76, 0);
	end 

	local nCheckBo = me.GetTask(3118,76)
	if nCheckBo >= 1 then
	Dialog:Say("Hôm nay bạn đã mua trọn bộ, hẹn ngày mai nhé");
	return 0;
	end

	local szMsg = "Đơn giá bán:\n\n- <color=red>Là<color>"..self.Gia_TinhLuc_Bo
	.." Đồng Thường<color>";
	local tbOpt = 
	{
		{"<color=red>Đồng ý Mua<color>", self.OkMByBo, self},
		-- {"<color=red>Tinh Khí Tán (Tiểu)<color>", self.tltieudt, self},
		-- {"<color=blue>Hoạt Khí Tán (Tiểu)<color>", self.hltieudt, self},
		-- {"<color=red>Tinh Khí Tán (Trung)<color>", self.tltrungdt, self},
		-- {"<color=blue>Hoạt Khí Tán (Trung)<color>", self.hltrungdt, self},
		-- {"<color=red>Tinh Khí Tán (Đại)<color>", self.tldai, self},
		-- {"<color=blue>Hoạt Khí Tán (Đại)<color>", self.hldai, self},
   		{"Kết thúc đối thoại"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:tldai()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local szMsg = "Mỗi ngày dùng được <color=red>"..self.Gioi_Han_Dai.." Tinh Khí Tán (Đại)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Dai.."<color>";
	local tbOpt = 
	{
		{"Mua <color=red>1B = 1.500 Tinh Lực<color>", self.mottldai, self},
		{"Mua <color=red>2B = 3.000 Tinh Lực<color>", self.haitldai, self},
		{"Mua <color=red>3B = 4.500 Tinh Lực<color>", self.batldai, self},
		{"Mua <color=red>4B = 6.000 Tinh Lực<color>", self.bontldai, self},
		{"Mua <color=red>5B = 7.500 Tinh Lực<color>", self.namtldai, self},
		{"Mua <color=red>10B = 15.000 Tinh Lực<color>", self.muoitldai, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:muoitldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 10;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:namtldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 5;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:bontldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 4;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:batldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 3;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:haitldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 2;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:mottldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Dai)
	local nCount = 1;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Dai,nChTieu + nCount);
	me.ChangeCurMakePoint(1500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:hldai()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local szMsg = "Mỗi ngày dùng được <color=blue>"..self.Gioi_Han_Dai.." Hoạt Khí Tán (Đại)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Dai.."<color>";
	local tbOpt = 
	{
		{"Mua <color=blue>1B = 1.500 Hoạt Lực<color>", self.mothldai, self},
		{"Mua <color=blue>2B = 3.000 Hoạt Lực<color>", self.haihldai, self},
		{"Mua <color=blue>3B = 4.500 Hoạt Lực<color>", self.bahldai, self},
		{"Mua <color=blue>4B = 6.000 Hoạt Lực<color>", self.bonhldai, self},
		{"Mua <color=blue>5B = 7.500 Hoạt Lực<color>", self.namhldai, self},
		{"Mua <color=blue>10B = 15.000 Hoạt Lực<color>", self.muoihldai, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:muoihldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 10;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:namhldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 5;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bonhldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 4;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bahldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 3;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:haihldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 2;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:mothldai()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Dai)
	local nCount = 1;
	if nChTieu + nCount > self.Gioi_Han_Dai then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Dai * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Dai * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Dai,nChTieu + nCount);
	me.ChangeCurGatherPoint(1500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:hltrungdt()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local szMsg = "Mỗi ngày dùng được <color=blue>"..self.Gioi_Han_Trung.." Hoạt Khí Tán (Trung)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Trung.."<color>";
	local tbOpt = 
	{
		{"Mua <color=blue>1B = 1.000 Hoạt Lực<color>", self.mothltrungdt, self},
		{"Mua <color=blue>2B = 2.000 Hoạt Lực<color>", self.haihltrungdt, self},
		{"Mua <color=blue>3B = 3.000 Hoạt Lực<color>", self.bahltrungdt, self},
		{"Mua <color=blue>4B = 4.000 Hoạt Lực<color>", self.bonhltrungdt, self},
		{"Mua <color=blue>5B = 5.000 Hoạt Lực<color>", self.namhltrungdt, self},
		--{"Mua <color=blue>10B = 10.000 Hoạt Lực<color>", self.mouhltrungdt, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:mothltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 1;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:haihltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 2;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bahltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 3;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bonhltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 4;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:namhltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 5;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:mouhltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Trung)
	local nCount = 10;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Trung,nChTieu + nCount);
	me.ChangeCurGatherPoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:tltrungdt()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local szMsg = "Mỗi ngày dùng được <color=red>"..self.Gioi_Han_Trung.." Tinh Khí Tán (Trung)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Trung.."<color>";
	local tbOpt = 
	{
		{"Mua <color=red>1B = 1.000 Tinh Lực<color>", self.mottltrungdt, self},
		{"Mua <color=red>2B = 2.000 Tinh Lực<color>", self.haitltrungdt, self},
		{"Mua <color=red>3B = 3.000 Tinh Lực<color>", self.batltrungdt, self},
		{"Mua <color=red>4B = 4.000 Tinh Lực<color>", self.bontltrungdt, self},
		{"Mua <color=red>5B = 5.000 Tinh Lực<color>", self.namtltrungdt, self},
		--{"Mua <color=red>10B = 10.000 Tinh Lực<color>", self.moutltrungdt, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:moutltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 10;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:namtltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 5;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bontltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 4;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:batltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 3;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:haitltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 2;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:mottltrungdt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Trung)
	local nCount = 1;
	if nChTieu + nCount > self.Gioi_Han_Trung then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Trung * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Trung * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Trung,nChTieu + nCount);
	me.ChangeCurMakePoint(1000 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:hltieudt()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local szMsg = "Mỗi ngày dùng được <color=blue>5 Hoạt Khí Tán (Tiểu)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Tieu.."<color>";
	local tbOpt = 
	{
		{"Mua <color=blue>1B = 500 Hoạt Lực<color>", self.mothldt, self},
		{"Mua <color=blue>2B = 1.000 Hoạt Lực<color>", self.haihldt, self},
		{"Mua <color=blue>3B = 1.500 Hoạt Lực<color>", self.bahldt, self},
		{"Mua <color=blue>4B = 2.000 Hoạt Lực<color>", self.bonhldt, self},
		{"Mua <color=blue>5B = 2.500 Hoạt Lực<color>", self.namhldt, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:namhldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local nCount = 5;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Tieu,nChTieu + nCount);
	me.ChangeCurGatherPoint(500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bonhldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local nCount = 4;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Tieu,nChTieu + nCount);
	me.ChangeCurGatherPoint(500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:bahldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local nCount = 3;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Tieu,nChTieu + nCount);
	me.ChangeCurGatherPoint(500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:haihldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local nCount = 2;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Tieu,nChTieu + nCount);
	me.ChangeCurGatherPoint(500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:mothldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Hoat_Tieu)
	local nCount = 1;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Hoat_Tieu,nChTieu + nCount);
	me.ChangeCurGatherPoint(500 * nCount); --Nhận Hoạt Lực
	return 1;
end

function tbTinhHoatLp:tltieudt()

	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local szMsg = "Mỗi ngày dùng được <color=red>5 Tinh Khí Tán (Tiểu)<color>\n\nHôm nay đã sử dụng: <color=green>"..nChTieu.."<color> bình\n\nĐơn giá: <color=green>"..self.Gia_TinhLuc_Tieu.."<color>";
	local tbOpt = 
	{
		{"Mua <color=red>1B = 500 Tinh Lực<color>", self.mottldt, self},
		{"Mua <color=red>2B = 1000 Tinh Lực<color>", self.haitldt, self},
		{"Mua <color=red>3B = 1500 Tinh Lực<color>", self.batldt, self},
		{"Mua <color=red>4B = 2000 Tinh Lực<color>", self.bontldt, self},
		{"Mua <color=red>5B = 2500 Tinh Lực<color>", self.namtldt, self},
   		{"Hiện tại ta chưa muốn"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:namtldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local nCount = 5;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Tieu,nChTieu + nCount);
	me.ChangeCurMakePoint(500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:bontldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local nCount = 4;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Tieu,nChTieu + nCount);
	me.ChangeCurMakePoint(500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:batldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local nCount = 3;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Tieu,nChTieu + nCount);
	me.ChangeCurMakePoint(500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:haitldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local nCount = 2;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu * nCount) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu * nCount);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Tieu,nChTieu + nCount);
	me.ChangeCurMakePoint(500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:mottldt()
	local nChTieu = me.GetTask(self.Task_Goup,self.Task_Tinh_Tieu)
	local nCount = 1;
	if nChTieu + nCount > 5 then
	me.Msg("<color=yellow>Chọn mua "..nCount.."b đạt giới hạn mỗi ngày, hãy chọn số lượng mua ít hơn<color>");
    return 0; 
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Tieu) then
	me.Msg("<color=yellow>Đồng thường trong hành trang không đủ <color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Tieu);
	me.SetTask(self.Task_Goup,self.Task_Tinh_Tieu,nChTieu + 1);
	me.ChangeCurMakePoint(500 * nCount); --Nhận Tinh Lực
	return 1;
end

function tbTinhHoatLp:tronbodt()
	local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>(5 Tiểu, "..self.Gioi_Han_Trung.." Trung, 10 Đại mỗi loại)<color>\nĐơn giá bán:<color=yellow> "..self.Gia_TinhLuc_Bo
	.." Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.OkMByBo, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:OkMByBo()
	local nCtTieu = me.GetTask(3118,64)
	local nCtTrun = me.GetTask(3118,66)
	local nCtTdai = me.GetTask(3118,68)
	local nChhTieu = me.GetTask(3118,70)
	local nChhTrun = me.GetTask(3118,72)
	local nChhTdai = me.GetTask(3118,74)

	if (nCtTieu >= 1) or (nCtTrun >= 1) or (nCtTdai >= 1) or (nChhTieu >= 1) or (nChhTrun >= 1) or (nChhTdai >= 1) then
	Dialog:Say("Hôm Nay Bạn Đã Mua rồi, ngày mai quay lại nhé");
	return 0;
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Bo) then
	me.Msg("<color=yellow>Bạn Không Đủ <color><color=red>"..self.Gia_TinhLuc_Bo.."<color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Bo);
	local nCheckBo = me.GetTask(self.Task_Goup,76)
	me.SetTask(self.Task_Goup,76,nCheckBo + 1);
	me.ChangeCurMakePoint(30000); --Nhận Tinh Lực
	me.ChangeCurGatherPoint(30000); --Nhận Hoạt Lực
end
