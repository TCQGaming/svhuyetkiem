-----Dev : TCQGaming
-----Time : 11/01/2024 13:19 PM
local tbTelePlayerTCQ = Item:GetClass("tele_player");

function c2s:TongKim_TCQ()
	local t = math.floor(os.clock());
	local currentTime = me.GetTask(9155,1);
	if t < currentTime then
		me.SetTask(9155,1,0);
	end
	if ( t - currentTime ) < 2 then
		me.Msg("Bạn thao tác quá nhanh ");
		return;
	end
	me.SetTask(9155,1,t);
 tbTelePlayerTCQ:ChucNang()	
end
function c2s:SuaDo()
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
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể sửa đồ nhanh"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
		-- local nMyCoin = pPlayer.nCoin;
		-- if (nMyCoin < 15000) then
		-- Dialog:Say("<color=yellow>"..playerName.."<color> không đủ <color=red>1,5 vạn đồng<color> không thể mở máu nhanh");
		-- return 0; 
		-- end
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
            Dialog:Say("Có người chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta")
            return 0
        end
		
			pPlayer.OpenShop(21,7);
end
end 
function c2s:MoMau()
	local t = math.floor(os.clock());
	local currentTime = me.GetTask(9155,1);
	if t < currentTime then
		me.SetTask(9155,1,0);
	end
	if ( t - currentTime ) < 2 then
		me.Msg("Bạn thao tác quá nhanh ");
		return;
	end
	me.SetTask(9155,1,t);
 tbTelePlayerTCQ:momautoanpt()	
end
function c2s:XoaMau()
	local t = math.floor(os.clock());
	local currentTime = me.GetTask(9155,1);
	if t < currentTime then
		me.SetTask(9155,1,0);
	end
	if ( t - currentTime ) < 2 then
		me.Msg("Bạn thao tác quá nhanh ");
		return;
	end
	me.SetTask(9155,1,t);
 tbTelePlayerTCQ:xoamautoanpt()	
end
function tbTelePlayerTCQ:OnUse()	
    DoScript("\\script\\global\\tcqgaming\\item\\hotro_dichchuyen_nhanh.lua");
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Tiến vào<color=yellow> Báo Danh Tống Kim<color>",self.bdtongkim,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Bạch Hổ Đường<color>",self.daidienbhd,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Tiêu Dao Cốc<color>",self.BaoDanhTDC,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Quân Doanh<color>",self.BaoDanhQD,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Tần Lăng<color> tầng 1",self.tanlang,self});
				-- table.insert(tbOpt, {"Mở máu <color=yellow>Toàn Tổ Đội<color>\n<color=green><<10x (1,5v)---10x>> (3v)",self.momautoanpt,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTelePlayerTCQ:ChucNang()	
    -- DoScript("\\script\\global\\tcqgaming\\item\\hotro_dichchuyen_nhanh.lua");
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	return 0 
	end 
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Tiến vào<color=yellow> Báo Danh Tống Kim<color>",self.bdtongkim,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Bạch Hổ Đường<color>",self.daidienbhd,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Tiêu Dao Cốc<color>",self.BaoDanhTDC,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Quân Doanh<color>",self.BaoDanhQD,self});
				table.insert(tbOpt, {"Tiến vào<color=yellow> Tần Lăng<color> tầng 1",self.tanlang,self});
				-- table.insert(tbOpt, {"Mở máu <color=yellow>Toàn Tổ Đội<color>\n<color=green><<10x (1,5v)---10x>> (3v)",self.momautoanpt,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTelePlayerTCQ:bdtongkim()	
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Tới khu vực Báo Danh <color=yellow>Phe Tống<color>",self.baodanhtong,self});
				table.insert(tbOpt, {"Tới khu vực Báo Danh <color=yellow>Phe Kim<color>",self.baodanhkim,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTelePlayerTCQ:daidienbhd()	
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Tới<color=yellow> Đại Điện Bạch Hổ Đường<color>",self.bachhoduong,self});
				table.insert(tbOpt, {"Ra khỏi<color=yellow>Đại Điện Bạch Hổ Đường<color>",self.rabachhoduong,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTelePlayerTCQ:BaoDanhQD()	
			if me.nLevel < 90 then 
			Dialog:Say("Bạn chưa đủ cấp độ 90")
			return 
			end 
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Tới<color=yellow> Huyền Vũ<color>",self.huyenvuqd,self});
				table.insert(tbOpt, {"Tới<color=yellow> Chu Tước<color>",self.chutuocqd,self});
				table.insert(tbOpt, {"Tới<color=yellow> Thanh Long<color>",self.thanhlongqd,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbTelePlayerTCQ:BaoDanhTDC()	
	local szMsg = "Tổ đội của bạn muốn đi tới đâu ?"
    local tbOpt =     {} 
				table.insert(tbOpt, {"Báo Danh<color=yellow> Tiêu Dao Cốc 1<color>",self.tieudaococ1,self});
				table.insert(tbOpt, {"Báo Danh<color=yellow> Tiêu Dao Cốc 2<color>",self.tieudaococ2,self});
				table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end


function tbTelePlayerTCQ:bachhoduong()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
local nMapId, nPosX, nPosY
			if me.nLevel < 90 then 
				nMapId, nPosX, nPosY = 225, 1612, 3183
			else 	
				nMapId, nPosX, nPosY = 233, 1612, 3183
			end
	for _, nMemberId in ipairs(tbMember) do
		GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
	end

end 

function tbTelePlayerTCQ:rabachhoduong()	
    local nMapIdKey = me.GetWorldPos()
	local nIDMAP
			if me.nLevel < 90 then 
			 nIDMAP = 225
			 else 
			 nIDMAP = 233
			end 
	if nMapIdKey ~= nIDMAP then 
	me.Msg("Toàn Đội Phải Ở Trong Đại Điện thì mới ra cùng chứ ? Có vẻ ngươi nhanh chân ra trước rồi")
	return 
	end 
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	    local nMapId, nPosX, nPosY = 24,1742,3504
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
end 

function tbTelePlayerTCQ:tieudaococ1()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		if not pPlayer then
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể dịch chuyển"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
	if pPlayer.nLevel < 80 then
		local szMsg = "<color=yellow>Công lực của "..playerName.."<color> quá thấp, hãy luyện lên cấp 80"
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
	
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
			local nNgay    = tonumber(GetLocalDate("%d%m%y"));
			if pPlayer.GetTask(9179,1) ~= nNgay then
			pPlayer.SetTask(9179,1, nNgay);
			pPlayer.SetTask(9180,1, 0);
			end 
			pPlayer.NewWorld(341,1624,3184)
		end
	end
end 

function tbTelePlayerTCQ:tieudaococ2()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	
	if me.nLevel < 80 then
		Dialog:Say("Công lực của ngươi quá thấp, hãy luyện lên cấp 80 ");
		return 0;
	end
	if me.GetCamp() == 0 then
		Dialog:Say("Ngươi chưa vào phái, hãy gia nhập môn phái rồi đến tìm lão phu.");
		return 0;
	end
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		if not pPlayer then
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể dịch chuyển"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
	if pPlayer.nLevel < 80 then
		local szMsg = "<color=yellow>Công lực của "..playerName.."<color> quá thấp, hãy luyện lên cấp 80"
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
	
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
		
			local nNgay    = tonumber(GetLocalDate("%d%m%y"));
			if pPlayer.GetTask(9179,1) ~= nNgay then
			pPlayer.SetTask(9179,1, nNgay);
			pPlayer.SetTask(9180,1, 0);
			end 
			pPlayer.NewWorld(342,1624,3184)
		end
	end
end 

function tbTelePlayerTCQ:tanlang()	
			if me.nLevel < 100 then 
			Dialog:Say("Bạn chưa đủ cấp độ 100")
			return 
			end 
	local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local nMapIdKey = me.GetWorldPos()
	if nMapIdKey == 132 or  nMapIdKey == 1536 then 
	me.Msg("Đội trưởng , ta thấy ngươi đã đến Tàn Tích Cung A Phòng hoặc Tần Lăng 1 rồi còn lười gì nữa, bằng không hãy ở thành thị rồi dịch chuyển")
	return 
	end 
		local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
		if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		Dialog:Say("Lương mỉm cười: Bạn đã ở trong Tần Lăng quá lâu, Hãy về nhà nghỉ ngơi và trở lại vào ngày mai ！", {"Tôi biết"});
		return;
	end
	DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_3.lua");
	DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_4.lua");
	-- DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_5.lua");
	if Boss.Qinshihuang:_CheckState() ~= 1 then
		Dialog:Say("Xin lỗi, Hệ thống Lăng tạm thời đóng cửa", {"Tôi biết"});
		return;
	end

    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end
	local nTruyenKey = me.nTeamId
    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	local nBienCo = true
	    local nMapId, nPosX, nPosY = me.GetWorldPos()
    for i = 1, #tbMember do
        local nPlayerId = tbMember[i]
			local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
		 if  pPlayer then
			local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
				    local nMapIdMem = pPlayer.GetWorldPos()
			if nMapIdMem == 132 or nMapIdMem == 1536 or nMapIdMem == 1537 or nMapIdMem == 1538 or nMapIdMem == 1539 then 
			me.Msg("Ta thấy thành viên <color=yellow>"..playerName.."<color> đang ở bản đồ<color=yellow> Tần Lăng 1 <color>hoặc <color=yellow>Tàn Tích Cung A Phòng<color> rồi nên bạn không thể sử dụng Trục Dịch Chuyển")
			return 
			end 
			local nHonorValue = PlayerHonor:GetPlayerMaxHonorLevel(pPlayer);
			if nHonorValue < ConfigAll.GioiHanTaiPhu_TanLang then
				Dialog:Say("Thành viên <color=yellow>" .. playerName .. "<color> Tài phú hiện nay là :<color=yellow> "..nHonorValue.."<color> không đạt đủ<color=yellow> cấp "..ConfigAll.GioiHanTaiPhu_TanLang.." <color>tài phú để tham gia");
			return 0;
			end
			if pPlayer.nLevel < 100 then
			Dialog:Say("Trong nhóm có người chơi "..playerName.." không đủ cấp 100", {"Ok, để tôi đi tập thể hình"});
			return;
			end

			if pPlayer.nFaction <= 0 then
			Dialog:Say("Trong nhóm có người chơi "..playerName.." là chữ trắng không thể vào", {"Tôi biết"});
			return;
			end
			pPlayer.SetFightState(0)
			pPlayer.NewWorld(1536, 1567, 3629)
	else 
	nBienCo = false
	end 
	end 
	if not nBienCo then 
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:HoTroDichChuyenTanLang", me.szAccount, nMemberId})
        end
	end 
end


function tbTelePlayerTCQ:huyenvuqd()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	    local nMapId, nPosX, nPosY = 559,1627,3157
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
end 

function tbTelePlayerTCQ:chutuocqd()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	    local nMapId, nPosX, nPosY = 558,1627,3157
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
end 

function tbTelePlayerTCQ:thanhlongqd()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	    local nMapId, nPosX, nPosY = 556,1627,3157
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
end 

function tbTelePlayerTCQ:baodanhtong()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
	local nMapId, nPosX, nPosY
			if me.nLevel < 90 then 
				nMapId, nPosX, nPosY = 181,1687,3287
			else 	
				nMapId, nPosX, nPosY = 182,1687,3287
			end

       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end

end 

function tbTelePlayerTCQ:baodanhkim()	
		local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	if (nCanUse == 0) then
		me.Msg(szRetMsg);
		return;
	end
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Ngươi không phải đội trưởng!")
        return 0
    end
			local nMapId, nPosX, nPosY
			if me.nLevel < 90 then 
				nMapId, nPosX, nPosY = 184,1684,3290
			else 	
				nMapId, nPosX, nPosY = 185,1684,3290
			end
       for _, nMemberId in ipairs(tbMember) do
            GlobalExcute({"DietQuai:DichChuyen", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
end 



function tbTelePlayerTCQ:momautoanpt()
	local tbBreakEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SIT,
		Player.ProcessBreakEvent.emEVENT_RIDE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_CHANGEEQUIP,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,		
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_REVIVE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	}
	
	GeneralProcess:StartProcess("Đang mở máu...", 4 * Env.GAME_FPS, {self.momautoanpt_1, self}, nil, tbBreakEvent);	
	return 0;
end

function tbTelePlayerTCQ:momautoanpt_1()	
		-- local nCanUse, szRetMsg = Item:CheckIsUseAtMap(me.nMapId, "chuansong");
	-- if (nCanUse == 0) then
		-- me.Msg(szRetMsg);
		-- return;
	-- end
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
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể mở máu nhanh"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
		-- local nMyCoin = pPlayer.nCoin;
		-- if (nMyCoin < 15000) then
		-- Dialog:Say("<color=yellow>"..playerName.."<color> không đủ <color=red>1,5 vạn đồng<color> không thể mở máu nhanh");
		-- return 0; 
		-- end
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
            local szMsg = "Đội trưởng vừa mở máu toàn tổ đội , ai không ở cùng map không thể mở máu"
					KTeam.Msg2Team(me.nTeamId, szMsg);	
            return 0
        end

        if pPlayer.GetCamp() == 0 then
            Dialog:Say("Có người chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta")
            return 0
        end

        if pPlayer.nMapId ~= nMapId then
            me.Msg("<color=yellow>Trong đội các ngươi " .. playerName .. " không ở gần đây, không thể mở máu cho họ")
            return 0
        end
		

        local nSoLuongHanhTrang = pPlayer.CountFreeBagCell()
		local nSoLuong = nSoLuongHanhTrang - 5
	if nSoLuongHanhTrang < 10 then 
	 local szMsg = "" .. playerName .. " hành trang không có chỗ trống 10 ô nghĩa là hắn vẫn còn máu nên không mất đồng mở máu thêm"
	KTeam.Msg2Team(me.nTeamId, szMsg);	
	return 
	end 
if pPlayer.nFaction == 9 then
		if	pPlayer.nLevel >= 50 and pPlayer.nLevel < 70 then 
			-- pPlayer.AddJbCoin(-15000)
		pPlayer.AddStackItem(17,3,1,3,{bForceBind=1},nSoLuong)
		end 
    	if	pPlayer.nLevel >= 70 and pPlayer.nLevel < 90 then 
            pPlayer.AddStackItem(17, 3, 1, 4, {bForceBind = 1}, nSoLuong)
			-- pPlayer.AddJbCoin(-15000)
		end 
		if	pPlayer.nLevel >= 90 and pPlayer.nLevel < 100 then 
			-- pPlayer.AddJbCoin(-15000)
            pPlayer.AddStackItem(17, 3, 1, 5, {bForceBind = 1}, nSoLuong)
        end 
			if	pPlayer.nLevel >= 100 then 
			-- pPlayer.AddJbCoin(-3*10000)
            pPlayer.AddStackItem(17, 3, 1, 6, {bForceBind = 1}, nSoLuong)
			end 
else 
		if	pPlayer.nLevel >= 50 and pPlayer.nLevel < 70 then 
			-- pPlayer.AddJbCoin(-15000)
		pPlayer.AddStackItem(17,1,1,3,{bForceBind=1},nSoLuong)
		end 
    	if	pPlayer.nLevel >= 70 and pPlayer.nLevel < 90 then 
			-- pPlayer.AddJbCoin(-15000)
            pPlayer.AddStackItem(17, 1, 1, 4, {bForceBind = 1}, nSoLuong)
		end 
			if	pPlayer.nLevel >= 90 and pPlayer.nLevel < 100 then 
			-- pPlayer.AddJbCoin(-15000)
            pPlayer.AddStackItem(17, 1, 1, 5, {bForceBind = 1}, nSoLuong)
        end 
			if	pPlayer.nLevel >= 100 then 
			-- pPlayer.AddJbCoin(-3*10000)
            pPlayer.AddStackItem(17, 1, 1, 6, {bForceBind = 1}, nSoLuong)
			end 
    end
	end 
    return 1
end



function tbTelePlayerTCQ:xoamautoanpt()	

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
            local szMsg = "Ta thấy tổ đội của ngươi có thành viên không đứng cùng map với đội trưởng không thể xóa máu nhanh"
            KTeam.Msg2Team(me.nTeamId, szMsg)
            return
		end
	end
	
	for _, nPlayerId in ipairs(tbMember) do
		local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
		local playerName = pPlayer and pPlayer.szName or "ID: " .. nPlayerId;  -- Lấy tên nếu có, ngược lại hiển thị ID
		if pPlayer then
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
            local szMsg = "Đội trưởng vừa xóa máu toàn tổ đội , ai không ở cùng map không thể xóa máu"
					KTeam.Msg2Team(me.nTeamId, szMsg);	
            return 0
        end

        if pPlayer.GetCamp() == 0 then
            Dialog:Say("Có người chưa vào phái, hãy gia nhập môn phái rồi đến tìm ta")
            return 0
        end

        if pPlayer.nMapId ~= nMapId then
            me.Msg("<color=yellow>Trong đội các ngươi " .. playerName .. " không ở gần đây, không thể xóa máu cho họ")
            return 0
        end

	local nMau
	local nMau1
if pPlayer.nFaction == 9 then
		if	pPlayer.nLevel >= 50 and pPlayer.nLevel < 70 then 
		 nMau = pPlayer.GetItemCountInBags(17,3,1,3) 
		 nMau1	= {17,3,1,3,0,0}; 
		end 
    	if	pPlayer.nLevel >= 70 and pPlayer.nLevel < 90 then 
         nMau1	= {17,3,1,4,0,0}; 
		 nMau = pPlayer.GetItemCountInBags(17,3,1,4) 
		end 
		if	pPlayer.nLevel >= 90 and pPlayer.nLevel < 100 then 
		 nMau = pPlayer.GetItemCountInBags(17,3,1,5) 
		  nMau1	= {17,3,1,5,0,0}; 
        end 
			if	pPlayer.nLevel >= 100 then 
		 nMau = pPlayer.GetItemCountInBags(17,3,1,6) 
          nMau1	= {17,3,1,6,0,0}; 
			end 
else 
		if	pPlayer.nLevel >= 50 and pPlayer.nLevel < 70 then 
			nMau = pPlayer.GetItemCountInBags(17,1,1,3) 
          nMau1	= {17,1,1,3,0,0}; 
		end 
    	if	pPlayer.nLevel >= 70 and pPlayer.nLevel < 90 then 
			nMau = pPlayer.GetItemCountInBags(17,1,1,4) 
          nMau1	= {17,1,1,4,0,0}; 
		end 
			if	pPlayer.nLevel >= 90 and pPlayer.nLevel < 100 then 
			nMau = pPlayer.GetItemCountInBags(17,1,1,5) 
          nMau1	= {17,1,1,5,0,0}; 
        end 
			if	pPlayer.nLevel >= 100 then 
			nMau = pPlayer.GetItemCountInBags(17,1,1,6) 
          nMau1	= {17,1,1,6,0,0}; 
			end 
    end
			if nMau > 0 then 
			Task:DelItem(pPlayer, nMau1, nMau);
			local szMsg = "<color=yellow>"..playerName.."<color>đã xóa thành công "..nMau.." bình máu"
			KTeam.Msg2Team(pPlayer.nTeamId, szMsg);
			else 
						pPlayer.Msg("Bạn không có máu để xóa")
			end 
	end 
    return 1
end