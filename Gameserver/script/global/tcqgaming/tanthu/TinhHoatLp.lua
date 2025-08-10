-- date:22/07
-- by:iDoctor
-------------------------------------------------------
local tbTinhHoatLp ={};
TinhHoat.TinhHoatLp= tbTinhHoatLp;
tbTinhHoatLp.Gia_TinhLuc_Tieu = 300;
tbTinhHoatLp.Gia_TinhLuc_Trung = 700;
tbTinhHoatLp.Gia_TinhLuc_Dai = 1000;
tbTinhHoatLp.Gia_TinhLuc_Bo = 150000;-----15 vạn 2
tbTinhHoatLp.Gia_TinhLuc_Bo40 = 250000
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
	local nTichNapThucTe = me.GetTask(9173,1)
	local szMsg = "Giá Gốc Chọn Bộ :<color=green> 50 Vạn Đồng<color>\nĐơn giá bán:\n\n*Bộ Giảm Giá 40%: <color=green>25 Vạn Đồng <color>\n*Bộ Giảm Giá 80%: <color=green>15 Vạn Đồng <color>\n\nHãy chọn loại muốn mua?";
	 -- local szMsg = "\nHãy chọn loại muốn mua?";
	local tbOpt = 
	{
		{"Bộ <color=red>Mua Giá Gốc", self.tronbogiagoc, self},
		{"Bộ <color=red>Bộ Giảm Giá 40% <color>\n<color=yellow>Cần 80 Uy Danh", self.tronbogiam40, self},
		{"Bộ <color=red>Bộ Giảm Giá 40% <color>\n<color=yellow>Tích Nạp 200k VND", self.tronbogiam40_tichnap200k, self},
		{"Bộ <color=red>Giảm Giá 80%\n<color=yellow> Cần 140 Uy Danh", self.tronbodtuydanh80, self},
		{"Bộ <color=red>Giảm Giá 80%\n<color=yellow> Tích Nạp 400k VND<color>", self.tronbodtmocnap80, self},
		-- {"Toàn PT Mua Bộ <color=red>Giảm Giá 80%\n<color=yellow> Cần Mốc Nạp 1000 Vạn Đồng<color>", self.MuaTinhHoatToanPT, self},
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


---------------Chế sò

function tbTinhHoatLp:MuaTinhHoatToanPT()

	    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end

	if me.GetCamp() == 0 then
		Dialog:Say("Ngươi chưa vào phái, hãy gia nhập môn phái rồi đến tìm lão phu.");
		return 0;
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		if not pPlayer then
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể mua tinh hoạt nhanh toàn tổ đội"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
			local nDate = tonumber(GetLocalDate("%y%m%d"));
	if pPlayer.GetTask(3118,69) < nDate then
		pPlayer.SetTask(3118,69, nDate);
		pPlayer.SetTask(3118,70, 0);
	end 

	if pPlayer.GetTask(3118,71) < nDate then
		pPlayer.SetTask(3118,71, nDate);
		pPlayer.SetTask(3118,72, 0);
	end 

	if pPlayer.GetTask(3118,73) < nDate then
		pPlayer.SetTask(3118,73, nDate);
		pPlayer.SetTask(3118,74, 0);
	end 

	if pPlayer.GetTask(3118,75) < nDate then
		pPlayer.SetTask(3118,75, nDate);
		pPlayer.SetTask(3118,76, 0);
	end 
	
	local nCheckBo = pPlayer.GetTask(3118,76)
	if nCheckBo >= 1 then
		local szMsg = "<color=yellow>"..playerName.."<color> đã mua trọn bộ rồi hẹn gặp lại ngày mai"
		KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
	return 0;
	end
  
	if pPlayer.GetCamp() == 0 then
		local szMsg = "<color=yellow>"..playerName.."<color> chưa vào phái, hãy gia nhập môn phái rồi đến tìm lão phu"
		KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
		return 0;
	end
	end 
	end
	
	
    for i = 1, #tbMember do
	    local nMapId, nPosX, nPosY = me.GetWorldPos()
        local nPlayerId = tbMember[i]
        local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
        local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId

        if not pPlayer then
            local szMsg = "Đội trưởng vừa sửa đồ toàn tổ đội , ai không ở cùng map không thể mở sửa đồ"
					KTeam.Msg2Team(me.nTeamId, szMsg);	
            return 0
        end

        if pPlayer.GetCamp() == 0 then
				          local szMsg = "<color=yellow>"..playerName.."<color> chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta"
			KTeam.Msg2Team(me.nTeamId, szMsg);	
            return 0
        end
	local nCtTieu = pPlayer.GetTask(3118,64)
	local nCtTrun = pPlayer.GetTask(3118,66)
	local nCtTdai = pPlayer.GetTask(3118,68)
	local nChhTieu = pPlayer.GetTask(3118,70)
	local nChhTrun = pPlayer.GetTask(3118,72)
	local nChhTdai = pPlayer.GetTask(3118,74)

	if (nCtTieu >= 1) or (nCtTrun >= 1) or (nCtTdai >= 1) or (nChhTieu >= 1) or (nChhTrun >= 1) or (nChhTdai >= 1) then
	          local szMsg = "Hôm nay <color=yellow>"..playerName.."<color> đã sử dụng Tinh Hoạt, không thể mua trọn bộ"
			KTeam.Msg2Team(me.nTeamId, szMsg);	
	return 0;
	end

	local nMyCoin = pPlayer.nCoin;
	if (nMyCoin >= 152000) then
	pPlayer.AddJbCoin(-152000);
	local nCheckBo = pPlayer.GetTask(3118,76)
	pPlayer.SetTask(3118,76,nCheckBo + 1);
	pPlayer.ChangeCurMakePoint(25000); --Nhận Tinh Lực
	pPlayer.ChangeCurGatherPoint(25000); --Nhận Hoạt Lực
	else 
			 local szMsg = "Trong tổ đội của ngươi <color=yellow>"..playerName.."<color> không có đủ 15 vạn 2 đồng thường nên hắn không được mua tinh hoạt"
			KTeam.Msg2Team(me.nTeamId, szMsg);	
    return 0; 
	end
end
end 
---------------------------- END CHẾ SÒ

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

function tbTinhHoatLp:tronbodtuydanh80(nType)
	if (me.nPrestige < 80) then
		local szFailDesc = "Uy danh giang hồ của bạn <color=yellow>chưa đủ 80 điểm<color>, không thể mua Tinh Hoạt Lực.";
		Dialog:Say(szFailDesc);
		return 0;
	end
		-- local nDongRut = me.GetTask(3028,1)
	-- if nDongRut < 800 then
		-- Dialog:Say("Bạn chưa đạt mốc tích lũy 800 vạn đồng");
		-- return 0;
	-- end
	-- local nPlayerRank = GetPlayerHonorRankByName(me.szName, PlayerHonor.HONOR_CLASS_WEIWANG, 0);
	-- if nPlayerRank < 1 or nPlayerRank > 60 then
	-- Dialog:Say("Ngươi không nằm trong BXH <color=yellow>TOP 1-60<color> Uy Danh");
	-- return 0;
	-- end 
				-- local nPlayerRank = PlayerHonor:GetPlayerHonorRankByName(me.szName, PlayerHonor.HONOR_CLASS_WEIWANG, 0)
					-- if nPlayerRank < 60 then
					-- Dialog:Say("Ngươi không nằm trong BXH <color=yellow>TOP 1-60<color> Uy Danh");
					-- return 0;
					-- end
		
	local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>(25.000 TLHL<color>)\nĐơn giá bán:<color=yellow> "..self.Gia_TinhLuc_Bo
	.." Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.OkMByBo, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:tronbodtmocnap80()
	local nTichNapThucTe = me.GetTask(9173,1)
	if nTichNapThucTe < 400 then
		Dialog:Say("Bạn chưa nạp 400k VNĐ");
		return 0;
	end
		local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>(25.000 TLHL<color>)\nĐơn giá bán:<color=yellow> "..self.Gia_TinhLuc_Bo
	.." Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.OkMByBo, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:tronbogiam40_tichnap200k()
	local nTichNapThucTe = me.GetTask(9173,1)
	if (nTichNapThucTe < 200) then
		local szFailDesc = "Bạn chưa nạp thẻ đủ 200k VNĐ không thể mua gói này.";
		Dialog:Say(szFailDesc);
		return 0;
	end
	
	local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>(25.000 TLHL)<color>\nĐơn giá bán:<color=yellow> "..self.Gia_TinhLuc_Bo40
	.." Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.OkMByBo40, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:tronbogiam40()

	if (me.nPrestige < 80) then
		local szFailDesc = "Uy danh giang hồ của bạn <color=yellow>chưa đủ 80 điểm<color>, không thể mua Tinh Hoạt Lực.";
		Dialog:Say(szFailDesc);
		return 0;
	end
	
		local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>25.000 TLHL<color>\nĐơn giá bán:<color=yellow> "..self.Gia_TinhLuc_Bo40
	.." Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.OkMByBo40, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbTinhHoatLp:tronbogiagoc()

	-- if (me.nPrestige < 80) then
		-- local szFailDesc = "Uy danh giang hồ của bạn <color=yellow>chưa đủ 80 điểm<color>, không thể mua Tinh Hoạt Lực.";
		-- Dialog:Say(szFailDesc);
		-- return 0;
	-- end
	
	local szMsg = "Trọn bộ Tinh Hoạt Lực trong ngày bao gồm: <color=yellow>25.000 TLHL<color>\nĐơn giá bán:<color=yellow> 50 vạn Đồng<color>\n";
	local tbOpt = 
	{
		{"<color=yellow>Đồng ý mua<color>", self.Ok_GiaGocTLHL, self},
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
	Dialog:Say("Hôm nay bạn đã sử dụng Tinh Hoạt, không thể mua trọn bộ");
	return 0;
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Bo) then
	me.Msg("<color=yellow>Đồng thường không đủ <color><color=red>"..self.Gia_TinhLuc_Bo.."<color>");
    return 0; 
	end
	me.AddJbCoin(-self.Gia_TinhLuc_Bo);
	local nCheckBo = me.GetTask(self.Task_Goup,76)
	me.SetTask(self.Task_Goup,76,nCheckBo + 1);
	me.ChangeCurMakePoint(25000); --Nhận Tinh Lực
	me.ChangeCurGatherPoint(25000); --Nhận Hoạt Lực
end

function tbTinhHoatLp:Ok_GiaGocTLHL()
	local nCtTieu = me.GetTask(3118,64)
	local nCtTrun = me.GetTask(3118,66)
	local nCtTdai = me.GetTask(3118,68)
	local nChhTieu = me.GetTask(3118,70)
	local nChhTrun = me.GetTask(3118,72)
	local nChhTdai = me.GetTask(3118,74)

	if (nCtTieu >= 1) or (nCtTrun >= 1) or (nCtTdai >= 1) or (nChhTieu >= 1) or (nChhTrun >= 1) or (nChhTdai >= 1) then
	Dialog:Say("Hôm nay bạn đã sử dụng Tinh Hoạt, không thể mua trọn bộ");
	return 0;
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < 50*10000) then
	me.Msg("<color=yellow>Đồng thường không đủ 50 vạn");
    return 0; 
	end
	
	
	me.AddJbCoin(-50*10000);
	local nCheckBo = me.GetTask(self.Task_Goup,76)
	me.SetTask(self.Task_Goup,76,nCheckBo + 1);
	me.ChangeCurMakePoint(25000); --Nhận Tinh Lực
	me.ChangeCurGatherPoint(25000); --Nhận Hoạt Lực
end


function tbTinhHoatLp:OkMByBo40()
	local nCtTieu = me.GetTask(3118,64)
	local nCtTrun = me.GetTask(3118,66)
	local nCtTdai = me.GetTask(3118,68)
	local nChhTieu = me.GetTask(3118,70)
	local nChhTrun = me.GetTask(3118,72)
	local nChhTdai = me.GetTask(3118,74)

	if (nCtTieu >= 1) or (nCtTrun >= 1) or (nCtTdai >= 1) or (nChhTieu >= 1) or (nChhTrun >= 1) or (nChhTdai >= 1) then
	Dialog:Say("Hôm nay bạn đã sử dụng Tinh Hoạt, không thể mua trọn bộ");
	return 0;
	end

	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Gia_TinhLuc_Bo40) then
	me.Msg("<color=yellow>Đồng thường không đủ <color><color=red>"..self.Gia_TinhLuc_Bo40.."<color>");
    return 0; 
	end
	
	
	me.AddJbCoin(-self.Gia_TinhLuc_Bo40);
	local nCheckBo = me.GetTask(self.Task_Goup,76)
	me.SetTask(self.Task_Goup,76,nCheckBo + 1);
	me.ChangeCurMakePoint(25000); --Nhận Tinh Lực
	me.ChangeCurGatherPoint(25000); --Nhận Hoạt Lực
end
