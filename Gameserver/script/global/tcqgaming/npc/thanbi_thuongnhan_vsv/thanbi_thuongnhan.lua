-------Tác giả : TCQGaming
------- 15:21 10/06/2023

local tbThanBi_VSV = Npc:GetClass("thuongnhan_banso");

tbThanBi_VSV.HONOR_CLASS_MONEY		= 8;	
tbThanBi_VSV.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbThanBi_VSV.HONOR_CLASS_MONEY,
	},
};

function tbThanBi_VSV:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\thanbi_thuongnhan_vsv\\thanbi_thuongnhan.lua");
	-- for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	-- local nHonorId		= tbTypeInfo.nHonorId;
	-- local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	-- if nHonorValue < 25000 then
    	-- Dialog:Say("Bạn không đạt đủ <color=yellow>25000 <color>điểm Tài Phú để tham gia \nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color> <color>");
		-- return 0;
	-- end
	-- end
	local dong = 0
if dong == 0 then
    Dialog:Say("Cửa hàng chưa mở bán!!")
    return 0
end

local nCurTime = tonumber(GetLocalDate("%H%M"))
if nCurTime < 2030 or nCurTime > 2359 then
    Dialog:Say("Cửa hàng chỉ mở bán vào lúc 20:30 đến 23:59 hàng ngày!!!")
    return 0
end


		local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if me.GetTask(9187, 1) < nDate then
		me.SetTask(9187, 1, nDate);
		me.SetTask(9187, 2, 0);
	end 
	local nCount = me.GetTask(9187, 2);
    if nCount >= 1 then
         Dialog:Say(string.format("Hôm nay các hạ đã mua của ta tối đa 1 lần rồi"));
        return 0; 
    end    
	
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
	
	if me.CountFreeBagCell() < 5 then
		Dialog:Say("Phải Có 5 Ô Trống Trong Túi !");
		return 0;
	end
	if me.nLevel < 70 then
		Dialog:Say("Bạn chưa đạt level 70, không thể tiếp tục !");
		return 0;
	end
 	local szMsg = "<color=red>Lưu ý : nếu quay trở lại mà không mua ngươi sẽ mất lượt mua ngày hôm nay<color>\nMỗi ngày ta chỉ bán 10 suất tổng 5000 VSV\nHiện nay đã bán ra "..nVSVBanRa.." suất rồi"
local tbOpt = { 
{"<color=yellow>Ta muốn mua vỏ sò vàng...<color>",self.tienhanhgt,self};
}; 
Dialog:Say(szMsg, tbOpt);

end

---------------- qua trinh giao thong
function tbThanBi_VSV:tienhanhgt()
local nNgauNhien  = MathRandom(1,10)
	local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
	}
	    GeneralProcess:StartProcess("<color=yellow>Đang đàm phán giá cả<color>", 1 * Env.GAME_FPS, {self.GetQuest, self, him.dwId,nNgauNhien}, nil, tbEvent);
	end


function tbThanBi_VSV:GetQuest(nNpcId,nNgauNhien)
    local pNpc = KNpc.GetById(nNpcId);
    if (not pNpc) then
        return;
    end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
	me.SetTask(9187,2,1)
	local szMsg = "<color=red>Lưu ý : nếu quay trở lại mà không mua ngươi sẽ mất lượt mua ngày hôm nay<color>\nMỗi ngày ta chỉ bán 10 suất tổng 5000 VSV\nHiện nay đã bán ra "..nVSVBanRa.." suất rồi"
	    local tbOpt =     {} 
		if nNgauNhien == 1 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 250 vạn đồng)",self.mua500vsv_1,self});
					elseif nNgauNhien == 2 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 230 vạn đồng)",self.mua500vsv_2,self});
					elseif nNgauNhien == 3 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 300 vạn đồng)",self.mua500vsv_3,self});
					elseif nNgauNhien == 4 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 350 vạn đồng)",self.mua500vsv_4,self});
					elseif nNgauNhien == 5 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 240 vạn đồng)",self.mua500vsv_5,self});
					elseif nNgauNhien == 6 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 270 vạn đồng)",self.mua500vsv_7,self});
					elseif nNgauNhien == 7 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 260 vạn đồng)",self.mua500vsv_8,self});
					elseif nNgauNhien == 8 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 300 vạn đồng)",self.mua500vsv_3,self});
					elseif nNgauNhien == 9 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 350 vạn đồng)",self.mua500vsv_4,self});
					elseif nNgauNhien == 10 then 
					table.insert(tbOpt, {"<color=yellow>Mua 500 Vỏ Sò Vàng<color>\n(Giá 280 vạn đồng)",self.mua500vsv_6,self});
		end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end



function tbThanBi_VSV:mua500vsv_1() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 250*10000 then 
	Dialog:Say("Bạn chưa đủ 250 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-250*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 250 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_2() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 230*10000 then 
	Dialog:Say("Bạn chưa đủ 250 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-230*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 230 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_3() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 300*10000 then 
	Dialog:Say("Bạn chưa đủ 300 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-300*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 300 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_4() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 350*10000 then 
	Dialog:Say("Bạn chưa đủ 350 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-350*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 350 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_5() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 240*10000 then 
	Dialog:Say("Bạn chưa đủ 240 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-240*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 240 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_6() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 280*10000 then 
	Dialog:Say("Bạn chưa đủ 280 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-280*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 280 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_7() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 270*10000 then 
	Dialog:Say("Bạn chưa đủ 270 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-270*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 270 vạn đồng thường<color>");
end

function tbThanBi_VSV:mua500vsv_8() 
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	if nVSVBanRa >= 10 then 
	Dialog:Say("Hôm nay gánh hàng của ta đã xuất ra hết hẹn gặp lại quý vị vào ngày mai")
	return 0;
	end 
		local nDong = me.GetJbCoin()
if nDong < 260*10000 then 
	Dialog:Say("Bạn chưa đủ 260 vạn đồng thường rồi")
return 
end
	local nVSVBanRa = KGblTask.SCGetDbTaskInt(DBTASD_THUONGNHAN_VSV)
	KGblTask.SCSetDbTaskInt(DBTASD_THUONGNHAN_VSV, nVSVBanRa + 1);
	me.AddStackItem(18,1,325,1,nil,500)---VSV
	me.AddJbCoin(-260*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 500 Vỏ Sò Vàng tại Thần Bí Thương Nhân tiêu tốn 260 vạn đồng thường<color>");
end