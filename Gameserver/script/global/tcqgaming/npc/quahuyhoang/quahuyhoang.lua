--Dev : TCQGaming
local tbItemHuiHuangZhiGuo= Item:GetClass("huihuangzhiguo");
tbItemHuiHuangZhiGuo.nExp				= 1000000;--100w

function tbItemHuiHuangZhiGuo:OnUse()

	local nQuaHuyHoang_TichLuy = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_QUAHUYHOANG);
		local nCount = me.GetTask(HuiHuangZhiGuo.TSKG_HuiHuangZhiGuo_ACT,HuiHuangZhiGuo.TSK_HuiHuangGuo_UseCount)
	if nCount >= nQuaHuyHoang_TichLuy then
		Dialog:Say("Bạn đã hết lượt sử dụng quả huy hoàng rồi hãy chờ ngày mai\n<color=gold>Đã sử dụng : "..nCount.." / "..nQuaHuyHoang_TichLuy.."");
		return 0;
	end
	
	-- if (nLevelExp < nExp) then
		-- nExp = nLevelExp;
	-- end
	-- me.AddExp(nExp);
			me.AddStackItem(18, 1, 114, 5, {bForceBind=1}, 1);
						me.SetTask(HuiHuangZhiGuo.TSKG_HuiHuangZhiGuo_ACT,HuiHuangZhiGuo.TSK_HuiHuangGuo_UseCount,nCount+1);
	if nCount == 20 then 
				me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 100);---500 tiền du long
				me.AddStackItem(18, 1, 114, 7, {bForceBind=1}, 1);---ht7
			me.AddBindCoin(50*10000);---- 50 vạn đồng khóa
KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 20 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X100\nHuyền Tinh 7 X1\nĐồng Khóa 50 Vạn")
elseif  nCount == 60 then 
				me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 300);---500 tiền du long
				me.AddStackItem(18, 1, 114, 8, {bForceBind=1}, 1);---ht8
			me.AddBindCoin(100*10000);---- 50 vạn đồng khóa
KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 60 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X300\nHuyền Tinh 8 X1\nĐồng Khóa 100 Vạn")
elseif  nCount == 140 then 
				me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 500);---500 tiền du long
				me.AddStackItem(18, 1, 114, 9, {bForceBind=1}, 1);---ht8
			me.AddBindCoin(200*10000);---- 50 vạn đồng khóa
KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 140 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X500\nHuyền Tinh 9 X1\nĐồng Khóa 200 Vạn")
elseif  nCount == 300 then 
				me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 600);---500 tiền du long
				me.AddStackItem(18, 1, 114, 9, {bForceBind=1}, 1);---ht8
			me.AddBindCoin(250*10000);---- 50 vạn đồng khóa
KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 300 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X600\nHuyền Tinh 9 X1\nĐồng Khóa 250 Vạn")
-- elseif  nCount == 500 then 
				-- me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 1500);---500 tiền du long
				-- me.AddStackItem(18, 1, 114, 10, {bForceBind=1}, 1);---ht8
			-- me.AddBindCoin(300*10000);---- 50 vạn đồng khóa
-- KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 500 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X1500\nHuyền Tinh 10 X1\nĐồng Khóa 300 Vạn")
-- elseif  nCount == 600 then 
				-- me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 2500);---500 tiền du long
				-- me.AddStackItem(18, 1, 114, 10, {bForceBind=1}, 2);---ht10
			-- me.AddBindCoin(350*10000);---- 50 vạn đồng khóa
-- KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng đến 600 Quả Huy Hoàng nhận được:\n<color=gold>Tiền Du Long X2500\nHuyền Tinh 10 X2\nĐồng Khóa 350 Vạn")
end 
					KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã sử dụng Quả Huy Hoàng nhận được 1 viên HT cấp 5\n<color=gold>Tổng tích lũy sử dụng là "..nCount.." Quả Huy Hoàng")
	return 1;
end
