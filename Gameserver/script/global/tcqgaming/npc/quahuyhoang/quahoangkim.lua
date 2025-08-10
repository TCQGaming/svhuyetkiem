--Dev : TCQGaming

local tbItemHuangJinZhiGuo = Item:GetClass("huangjinzhiguo");

tbItemHuangJinZhiGuo.DAY_LIMIT			= 7*3600*24;
tbItemHuangJinZhiGuo.nExp				= 10000000;--1000w 
--tbItemHuangJinZhiGuo.nUseCountLimit		= 30;--最多吃30个 废除

function tbItemHuangJinZhiGuo:OnUse()
	--黄金辉煌之果的使用
	local nGetPlayerRank	= HuiHuangZhiGuo.GetPlayerRank();
	local nItemLevel		= it.nLevel;
	local nUseTime			= me.GetTask(HuiHuangZhiGuo.TSKG_HuiHuangZhiGuo_ACT,HuiHuangZhiGuo.TSK_HuangJinGuo_UseTime);
	local nNowTime			= GetTime();
	--local nCount			= me.GetTask(HuiHuangZhiGuo.TSKG_HuiHuangZhiGuo_ACT,HuiHuangZhiGuo.TSK_HuangJinGuo_UseCount);废除
	local nExp				= self.nExp;
	local nLevelExp			= me.GetUpLevelExp()-me.GetExp();
	
	if (nGetPlayerRank ~= nItemLevel) then
		if (1 == nItemLevel) then
			me.Msg("Quả này chỉ dành cho người cấp 70 trở lên dùng!");
		end
		return 0;
	end
	
	-- if (nLevelExp < nExp) then
		-- nExp = nLevelExp;
	-- end
	-- me.AddExp(nExp);
		me.AddStackItem(18, 1, 1, 7,nil, 2);--3 HT7
		me.AddStackItem(18, 1, 553, 1, {bForceBind=1}, 30);---50 tiền du long
		me.AddJbCoin(70*10000)-- 70 vạn đồng thường
		me.AddBindCoin(5*10000);---- 5 vạn đồng khóa
			local nCoDuaTOP = ConfigAll.KhoiDong_VatPham_DuaTOP_TongKim
	local VatPham_DuaTOP = ConfigAll.VatPham_DuaTOP
				if nCoDuaTOP == 1 then 
					me.AddStackItem(VatPham_DuaTOP[1], VatPham_DuaTOP[2], VatPham_DuaTOP[3], VatPham_DuaTOP[4],nil,1);---- Vật phẩm đua top
						KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã ăn Quả Hoàng Kim nhận được 2 viên HT7\n30 Tiền Du Long\n70 Vạn đồng thường\n5 vạn đồng khóa\n1 Vật Phẩm Đua TOP")
				else 
					KDialog.MsgToGlobal("Chúc mừng <color=yellow>["..me.szName .. "]<color> đã ăn Quả Hoàng Kim nhận được 2 viên HT7\n30 Tiền Du Long\n70 Vạn đồng thường\n5 vạn đồng khóa")
				end 
	me.SetTask(HuiHuangZhiGuo.TSKG_HuiHuangZhiGuo_ACT,HuiHuangZhiGuo.TSK_HuangJinGuo_UseTime,GetTime());
	return 1;
end
