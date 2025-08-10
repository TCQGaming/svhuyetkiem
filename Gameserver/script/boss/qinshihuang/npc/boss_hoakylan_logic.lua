if not MODULE_GAMESERVER then
	return;
end

local tbBossData = {
	Boss45 = {
		{ nNpcId = 10374, szName = "<color=green>Vân Tuyết Sơn<color>", nSeries = 2, tbPosList = {
			{ nMapId = 75, nX = 1950, nY = 3614 },
			{ nMapId = 75, nX = 1690, nY = 3228 },
			{ nMapId = 75, nX = 1632, nY = 3716 },
			{ nMapId = 74, nX = 1642, nY = 3699 },
			{ nMapId = 74, nX = 1750, nY = 3838 },
			{ nMapId = 70, nX = 1364, nY = 2903 },
			{ nMapId = 70, nX = 1644, nY = 3208 }
		}},
		{ nNpcId = 10378, szName = "<color=gold>Thác Bạc Sơn Uyên<color>", nSeries = 1, tbPosList = {
			{ nMapId = 66, nX = 1742, nY = 3690 },
			{ nMapId = 66, nX = 1656, nY = 3952 },
			{ nMapId = 69, nX = 1551, nY = 2900 },
			{ nMapId = 69, nX = 1600, nY = 2288 },
			{ nMapId = 67, nX = 1496, nY = 3302 },
			{ nMapId = 67, nX = 1657, nY = 3391 }
		}},	
		{ nNpcId = 10379, szName = "<color=blue>Dương Liễu<color>", nSeries = 3, tbPosList = {
			{ nMapId = 67, nX = 1542, nY = 3361 },
			{ nMapId = 67, nX = 1803, nY = 3366 },
			{ nMapId = 66, nX = 1716, nY = 3513 },
			{ nMapId = 66, nX = 1907, nY = 3602 },
			{ nMapId = 69, nX = 1384, nY = 2304 },
			{ nMapId = 69, nX = 1168, nY = 2848 }
		}},	
		{ nNpcId = 10376, szName = "<bclr=red><color=yellow>Vạn Lão Điên<bclr><color>", nSeries = 4, tbPosList = {
			{ nMapId = 71, nX = 1664, nY = 3408 },
			{ nMapId = 71, nX = 1736, nY = 3744 },
			{ nMapId = 72, nX = 1912, nY = 3408 },
			{ nMapId = 72, nX = 1880, nY = 3440 },
			{ nMapId = 73, nX = 1856, nY = 3360 },
			{ nMapId = 73, nX = 1752, nY = 3472 }
		}},		
		{ nNpcId = 10375, szName = "<color=white>Hình Bổ Đầu<color>", nSeries = 5, tbPosList = {
			{ nMapId = 70, nX = 1296, nY = 3152 },
			{ nMapId = 70, nX = 1536, nY = 3248 },
			{ nMapId = 74, nX = 1830, nY = 3603 },
			{ nMapId = 74, nX = 1697, nY = 3646 },
			{ nMapId = 75, nX = 1920, nY = 3360 },
			{ nMapId = 75, nX = 1816, nY = 3552 }

		}},		
		{ nNpcId = 10377, szName = "<color=white>Cao Sĩ Hiền<color>", nSeries = 5, tbPosList = {
			{ nMapId = 71, nX = 1744, nY = 3440 },
			{ nMapId = 71, nX = 1624, nY = 3664 },
			{ nMapId = 71, nX = 1792, nY = 3424 },
			{ nMapId = 72, nX = 2016, nY = 3488 },
			{ nMapId = 72, nX = 2152, nY = 3920 },
			{ nMapId = 72, nX = 2312, nY = 3696 },
			{ nMapId = 73, nX = 1664, nY = 3600 },
			{ nMapId = 73, nX = 1616, nY = 3360 },
			{ nMapId = 73, nX = 1720, nY = 3616 }
		}},

	},

	Boss75 = {
		{ nNpcId = 10381, szName = "<color=green>Triệu ứng Tiên<color>", nSeries = 2, tbPosList = {
			{ nMapId = 100, nX = 1961, nY = 3155 },
			{ nMapId = 100, nX = 1929, nY = 3492 },
			{ nMapId = 101, nX = 1817, nY = 3811 },
			{ nMapId = 101, nX = 1850, nY = 3842 },
			{ nMapId = 101, nX = 1841, nY = 3741 },
			{ nMapId = 101, nX = 1874, nY = 3395 },
			{ nMapId = 106, nX = 1626, nY = 3474 },
			{ nMapId = 106, nX = 1768, nY = 3601 }
		}},		
		{ nNpcId = 10380, szName = "<color=gold>Thần Thương Phương Vãn<color>", nSeries = 1, tbPosList = {
			{ nMapId = 105, nX = 1388, nY = 3424 },
			{ nMapId = 105, nX = 1290, nY = 3343 },
			{ nMapId = 105, nX = 1440, nY = 3205 },
			{ nMapId = 105, nX = 1717, nY = 3529 },
			{ nMapId = 101, nX = 1714, nY = 3678 },
			{ nMapId = 101, nX = 1642, nY = 3394 },
			{ nMapId = 100, nX = 1680, nY = 3136 },
			{ nMapId = 100, nX = 1828, nY = 3433 }
		}},
	
		{ nNpcId = 10383, szName = "<bclr=red><color=yellow>Man Tăng Bất Giới Hòa Thượng<bclr><color>", nSeries = 4, tbPosList = {
		{ nMapId = 103, nX = 1928, nY = 3872 }, 
			{ nMapId = 103, nX = 1704, nY = 3872 },
			{ nMapId = 103, nX = 1816, nY = 3824 },
			{ nMapId = 103, nX = 1952, nY = 3600 },
			{ nMapId = 104, nX = 1920, nY = 3472 }, 
			{ nMapId = 104, nX = 1880, nY = 3728 },
			{ nMapId = 106, nX = 1752, nY = 3264 }, 
			{ nMapId = 106, nX = 1846, nY = 3279 }
		}},		
		{ nNpcId = 10384, szName = "<color=white>Nam Quách Nho<color>", nSeries = 5, tbPosList = {
		{ nMapId = 102, nX = 1304, nY = 3168 }, 
		{ nMapId = 102, nX = 1568, nY = 2656 },
		{ nMapId = 104, nX = 1840, nY = 3472 }, 
		{ nMapId = 104, nX = 1659, nY = 3648 }, 
		{ nMapId = 105, nX = 1558, nY = 3475 }, 
		{ nMapId = 105, nX = 1704, nY = 3232 }  
		}},
				{ nNpcId = 10382, szName = "<color=blue>Hương Ngọc Tiên<color>", nSeries = 3, tbPosList = {
			{ nMapId = 100, nX = 1906, nY = 3715 },
			{ nMapId = 100, nX = 1706, nY = 3731 },
			{ nMapId = 104, nX = 1593, nY = 3477 },
			{ nMapId = 104, nX = 1559, nY = 3735 },
			{ nMapId = 106, nX = 1897, nY = 3525 },
			{ nMapId = 106, nX = 1810, nY = 3691 },
			{ nMapId = 106, nX = 1696, nY = 3762 }
		}},	
	},
	
Boss95 = {
	{
		nNpcId = 10385,
		szName = "<color=gold>Nhu Tiểu Thúy<color>",
		nSeries = 1,
		tbPosList = {
			{ nMapId = 114, nX = 1640, nY = 3360 },  
			{ nMapId = 116, nX = 1960, nY = 3600 }, 
			{ nMapId = 117, nX = 1664, nY = 2896 },  
			{ nMapId = 119, nX = 1616, nY = 3168 }, 
			{ nMapId = 121, nX = 1464, nY = 3248 }
		}
	},
	{
		nNpcId = 10386,
		szName = "<color=green>Trương Thiện Đức<color>",
		nSeries = 2,
		tbPosList = {
			{ nMapId = 114, nX = 1896, nY = 3392 },
			{ nMapId = 115, nX = 1768, nY = 3232 },
			{ nMapId = 116, nX = 1576, nY = 3824 },
			{ nMapId = 117, nX = 1496, nY = 3136 },
			{ nMapId = 119, nX = 1704, nY = 3776 }
		}
	},
	{
		nNpcId = 10387,
		szName = "<color=blue>Giả Dật Sơn<color>",
		nSeries = 3,
		tbPosList = {
			{ nMapId = 114, nX = 1872, nY = 3824 },
			{ nMapId = 117, nX = 1480, nY = 3440 },
			{ nMapId = 118, nX = 1512, nY = 3472 },
			{ nMapId = 119, nX = 1840, nY = 3408 },
			{ nMapId = 120, nX = 1912, nY = 3856 },
			{ nMapId = 121, nX = 1784, nY = 3408 }
		}
	},
	{
		nNpcId = 10388,
		szName = "<bclr=red><color=yellow>Ô Sơn Thanh<bclr><color>",
		nSeries = 4,
		tbPosList = {
			{ nMapId = 115, nX = 1432, nY = 3088 },
			{ nMapId = 116, nX = 1592, nY = 3344 },
			{ nMapId = 118, nX = 1712, nY = 3936 },
			{ nMapId = 120, nX = 1608, nY = 3328 },
			{ nMapId = 121, nX = 1600, nY = 3536 }
		}
	},
	{
		nNpcId = 10389,
		szName = "<color=gold>Trần Vô Mệnh<color>",
		nSeries = 5,
		tbPosList = {
			{ nMapId = 115, nX = 1712, nY = 2864 },
			{ nMapId = 116, nX = 1904, nY = 3280 }, 
			{ nMapId = 118, nX = 1816, nY = 3440 },
			{ nMapId = 120, nX = 1616, nY = 3840 },
			{ nMapId = 121, nX = 1592, nY = 3082 }
		}
	}
}

	
};

function GoiKyLan:GoiBoss45(nNpcId, nLevel, nSeries, nMapId, nX, nY, szName)
    local nMapIndex = SubWorldID2Idx(nMapId)
    if nMapIndex < 0 then
     --   print("[ERROR] Map không hợp lệ khi gọi boss:", nMapId)
        return
    end

    KDialog.MsgToGlobal(string.format(
        "Nghe nói võ lâm cao thủ %s đã xuất hiện tại <color=green>%s<color>!",
        szName,
        GetMapNameFormId(nMapId)
    ))

    local pNpc = KNpc.Add2(nNpcId, nLevel, nSeries, nMapId, nX, nY)
    if pNpc then
        pNpc.SetLoseItemCallBack(1)
        Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId)
    end
end

function GoiKyLan:GoiBoss75(nNpcId, nLevel, nSeries, nMapId, nX, nY, szName)
    local nMapIndex = SubWorldID2Idx(nMapId)
    if nMapIndex < 0 then
   --     print("[ERROR] Map không hợp lệ khi gọi boss:", nMapId)
        return
    end

    KDialog.MsgToGlobal(string.format(
        "Nghe nói võ lâm cao thủ %s đã xuất hiện tại <color=green>%s<color>!",
        szName,
        GetMapNameFormId(nMapId)
    ))

    local pNpc = KNpc.Add2(nNpcId, nLevel, nSeries, nMapId, nX, nY)
    if pNpc then
        pNpc.SetLoseItemCallBack(1)
        Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId)
    end
end

function GoiKyLan:GoiBoss95(nNpcId, nLevel, nSeries, nMapId, nX, nY, szName)
    local nMapIndex = SubWorldID2Idx(nMapId)
    if nMapIndex < 0 then
   --     print("[ERROR] Map không hợp lệ khi gọi boss:", nMapId)
        return
    end

    KDialog.MsgToGlobal(string.format(
        "Nghe nói võ lâm cao thủ %s đã xuất hiện tại <color=green>%s<color>!",
        szName,
        GetMapNameFormId(nMapId)
    ))

    local pNpc = KNpc.Add2(nNpcId, nLevel, nSeries, nMapId, nX, nY)
    if pNpc then
        pNpc.SetLoseItemCallBack(1)
        Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId)
    end
end



function GoiKyLan:AddKyLan_GS()
		local nMapIndex = SubWorldID2Idx(2029);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân<color> xuất hiện tại <pos=2029,1816,3488>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân<<color> xuất hiện tại <pos=2029,1816,3488>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân<<color> xuất hiện tại <pos=2029,1816,3488>!<color>");
local pNpc = KNpc.Add2(20005, 200, 0, 2029, 1816, 3488)
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:XoaHoaKyLan_GS()
		local nMapIndex = SubWorldID2Idx(2029);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân Tuần Này Đã Kết Thúc<color>!!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân Tuần Này Đã Kết Thúc<color>!!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Viễn Cổ Thần Thú Hỏa Kỳ Lân Tuần Này Đã Kết Thúc<color>!!<color>");	
ClearMapNpcWithName(2029, "Hỏa Kỳ Lân");	
	LOIDAI16:xoabaodanhbang()
	LOIDAI16:xoathanhvienthamgia()
	LOIDAI16:xoalogcap()
	LOIDAI16:xoadanhsachcap()
	LOIDAI16:xoalogketquawin()
	LOIDAI16:xoalogketquathua()
	end
	
function GoiKyLan:Xoa_TieuGS()
		local nMapIndex = SubWorldID2Idx(118);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(118, "Long Trụ Bất Tử");	
-- ClearMapNpcWithName(2, "Xe Tiêu của NgọaLong");	
-- ClearMapNpcWithName(2, "Xe Tiêu của Tửảnh5Đ");	
-- ClearMapNpcWithName(2, "Xe Tiêu của ZzTakashizZ");	
end
	
function GoiKyLan:XoaBoss4575()
		local nMapIndex = SubWorldID2Idx(105);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Toàn Bộ Boss Võ Lâm Cao Thủ Đã Thoái Ẩn<color>!!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Toàn Bộ Boss Võ Lâm Cao Thủ Đã Thoái Ẩn<color>!!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Boss Võ Lâm Cao Thủ Thần Thương Phương Vãn Đã Thoái Ẩn do ADM thực hiện thủ công<color>!!<color>");	
ClearMapNpcWithName(105, "Thần Thương Phương Vãn");
end

function GoiKyLan:goiboss_45_vantuyetson()
		local nMapIndex = SubWorldID2Idx(75);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=green>Vân Tuyết Sơn<color> xuất hiện tại <pos=75,1950,3614>");
local nNpcId = 10374
local pNpc = KNpc.Add2(nNpcId, 55, 2, 75, 1950, 3614)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	

end

function GoiKyLan:goiboss_45_hinhbodau()
		local nMapIndex = SubWorldID2Idx(70);
	if nMapIndex < 0 then
		return;
	end
	local nNpcId = 10375
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=white>Hình Bổ Đầu<color> xuất hiện tại <pos=70,1297,3155>");
local pNpc = KNpc.Add2(nNpcId, 55, 5, 70,1297,3155)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_45_vanlaodien()
		local nMapIndex = SubWorldID2Idx(71);
	if nMapIndex < 0 then
		return;
	end
		local nNpcId = 10376
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <bclr=red><color=yellow>Vạn Lão Điên<bclr><color> xuất hiện tại <pos=71,1736,3754>");
local pNpc = KNpc.Add2(nNpcId, 55, 4, 71,1736,3754)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_45_caosihien()
		local nMapIndex = SubWorldID2Idx(72);
	if nMapIndex < 0 then
		return;
	end
			local nNpcId = 10377
	KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=white>Cao Sĩ Hiền<color> xuất hiện tại <pos=72,2310,3700>");
local pNpc = KNpc.Add2(nNpcId, 55, 5, 72,2310,3700)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_45_thacbacsonuyen()
		local nMapIndex = SubWorldID2Idx(66);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10378
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=gold>Thác Bạc Sơn Uyên<color> xuất hiện tại <pos=66,1734,3692>");
local pNpc = KNpc.Add2(nNpcId, 55, 1, 66,1734,3692)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_45_duonglieu()
		local nMapIndex = SubWorldID2Idx(69);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10379
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=blue>Dương Liễu<color> xuất hiện tại <pos=69,1170,2854>");
local pNpc = KNpc.Add2(nNpcId, 55, 3, 69,1170,2854)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_75_kim()
		local nMapIndex = SubWorldID2Idx(105);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10380
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=gold>Thần Thương Phương Vãn<color> xuất hiện tại <pos=105,1387,3422>");
local pNpc = KNpc.Add2(nNpcId, 75, 1, 105,1387,3422)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_75_moc()
		local nMapIndex = SubWorldID2Idx(101);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10381
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=green>Triệu ứng Tiên<color> xuất hiện tại <pos=101,1818,3815>");
local pNpc = KNpc.Add2(nNpcId, 75, 2,101,1818,3815)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_75_thuy()
		local nMapIndex = SubWorldID2Idx(106);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10382
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=blue>Hương Ngọc Tiên<color> xuất hiện tại <pos=106,1815,3696>");
local pNpc = KNpc.Add2(nNpcId, 75, 3, 106,1815,3696)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_75_hoa()
		local nMapIndex = SubWorldID2Idx(103);
	if nMapIndex < 0 then
		return;
	end
					local nNpcId = 10383
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <bclr=red><color=yellow>Man Tăng Bất Giới Hòa Thượng<bclr><color> xuất hiện tại <pos=103,1810,3819>");
local pNpc = KNpc.Add2(nNpcId, 75, 4, 103,1810,3819)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_75_tho()
		local nMapIndex = SubWorldID2Idx(102);
	if nMapIndex < 0 then
		return;
	end
					local nNpcId = 10384
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=white>Nam Quách Nho<color> xuất hiện tại <pos=102,1575,3090>");
local pNpc = KNpc.Add2(nNpcId, 75, 5, 102,1575,3090)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_95_kim()
		local nMapIndex = SubWorldID2Idx(119);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10385
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=gold>Nhu Tiểu Thúy<color> xuất hiện tại <pos=119,1642,3187>");
local pNpc = KNpc.Add2(nNpcId, 95, 1, 119,1642,3187)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_95_moc()
		local nMapIndex = SubWorldID2Idx(117);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10386
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=green>Trương Thiện Đức<color> xuất hiện tại <pos=117,1498,3149>");
local pNpc = KNpc.Add2(nNpcId, 95, 2, 117,1498,3149)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_95_thuy()
		local nMapIndex = SubWorldID2Idx(120);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10387
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=blue>Giả Dật Sơn<color> xuất hiện tại <pos=120,1906,3857>");
local pNpc = KNpc.Add2(nNpcId, 95, 3, 120,1906,3857)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_95_hoa()
		local nMapIndex = SubWorldID2Idx(115);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10388
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <bclr=red><color=yellow>Ô Sơn Thanh<bclr><color> xuất hiện tại <pos=115,1430,3089>");
local pNpc = KNpc.Add2(nNpcId, 95, 4, 115,1430,3089)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_95_tho()
		local nMapIndex = SubWorldID2Idx(116);
	if nMapIndex < 0 then
		return;
	end
				local nNpcId = 10389
KDialog.MsgToGlobal("Nghe nói võ lâm cao thủ <color=gold>Trần Vô Mệnh<color> xuất hiện tại <pos=116,1908,3286>");
local pNpc = KNpc.Add2(nNpcId, 95, 5, 116,1908,3286)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

	
---- yên nam thiên
function GoiBossSLTK:yennamthien_GS()
		local nMapIndex = SubWorldID2Idx(31);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Đại Cao Thủ Yến Nam Thiên<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=31,1837,3741>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Đại Cao Thủ Yến Nam Thiên<<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=31,1837,3741>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Đại Cao Thủ Yến Nam Thiên<<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=31,1837,3741>!<color>");

local pNpc = KNpc.Add2(9669, 200, 0, 31, 1837, 3741);

if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
function GoiBossSLTK:Xoayennamthien_GS()
		local nMapIndex = SubWorldID2Idx(31);
	if nMapIndex < 0 then
		return;
	end
	ClearMapNpcWithName(31, "Yến Nam Thiên");
end	
--- yến thập tam
function GoiBossSLTK:yenthaptam_GS()
		local nMapIndex = SubWorldID2Idx(30);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Đại Cao Thủ Yến Thập Tam<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=30,1807,3821>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Đại Cao Thủ Yến Thập Tam<<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=30,1807,3821>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Đại Cao Thủ Yến Thập Tam<<color> Thách Đấu Toàn Cỏi Võ Lâm tại <pos=30,1807,3821>!<color>");

local pNpc = KNpc.Add2(9675, 200, 0, 30, 1807, 3821);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	

end
function GoiBossSLTK:Xoayenthaptam_GS()
		local nMapIndex = SubWorldID2Idx(30);
	if nMapIndex < 0 then
		return;
	end
	ClearMapNpcWithName(30, "Yến Thập Tam");
end	
--- diệp cô thành
function GoiBossSLTK:diepcothanh_GS()
		local nMapIndex = SubWorldID2Idx(32);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Đại Cao Thủ Diệp Cô Thành<color> Nhân sĩ võ lâm chỉ là bọn phàm phu tục tử <pos=32,1693,4003>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Đại Cao Thủ Diệp Cô Thành<<color> Nhân sĩ võ lâm chỉ là bọn phàm phu tục tử <pos=32,1693,4003>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Đại Cao Thủ Diệp Cô Thành<<color> Nhân sĩ võ lâm chỉ là bọn phàm phu tục tử <pos=32,1693,4003>!<color>");

local pNpc = KNpc.Add2(9670, 200, 0, 32, 1693, 4003);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	

end
function GoiBossSLTK:Xoadiepcothanh_GS()
		local nMapIndex = SubWorldID2Idx(32);
	if nMapIndex < 0 then
		return;
	end
	ClearMapNpcWithName(32, "Diệp Cô Thành");
end	
--- Tây Môn
function GoiBossSLTK:taymon_GS()
		local nMapIndex = SubWorldID2Idx(33);
	if nMapIndex < 0 then
		return;
	end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Đại Cao Thủ Tây Môn Xuy Tuyết<color> Diệp Cô Thành người là tên ngụy quân tử, tiểu nhân bỉ ổi <pos=33,1869,3885>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Đại Cao Thủ Tây Môn Xuy Tuyết<<color> Diệp Cô Thành người là tên ngụy quân tử, tiểu nhân bỉ ổi <pos=33,1869,3885>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Đại Cao Thủ Tây Môn Xuy Tuyết<<color> Diệp Cô Thành người là tên ngụy quân tử, tiểu nhân bỉ ổi <pos=33,1869,3885>!<color>");

local pNpc = KNpc.Add2(9671, 200, 0, 33, 1869, 3885);
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end

function GoiBossSLTK:Xoataymon_GS()
		local nMapIndex = SubWorldID2Idx(33);
	if nMapIndex < 0 then
		return;
	end
	ClearMapNpcWithName(33, "Tây Môn Xuy Tuyết");
end	
----
function GoiBossSLTK:AddHacKyLan_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
end
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Hắc Kỳ Lân<color> xuất hiện tại <pos=132,1780,3552>!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Hắc Kỳ Lân<color> xuất hiện tại <pos=132,1780,3552>!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Hắc Kỳ Lân<color> xuất hiện tại <pos=132,1780,3552>!<color>");
local pNpc = KNpc.Add2(20007, 200, 0, 132, 1780, 3552)
if pNpc then
	pNpc.SetLoseItemCallBack(1);
end	
end
----
function GoiBossSLTK:XoaHacKyLan_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
	ClearMapNpcWithName(132, "Hắc Kỳ Lân");
end
function GoiKyLan:goiboss_tamma_thieulam()
		local nMapIndex = SubWorldID2Idx(130);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Huyền Từ<color> xuất hiện tại <pos=130,1720,3458>");
local nNpcId = 10413
local pNpc = KNpc.Add2(nNpcId, 150, 1, 130,1720,3458)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	

end
function GoiKyLan:goiboss_tamma_duongmon()
		local nMapIndex = SubWorldID2Idx(131);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Đường Hiểu<color> xuất hiện tại <pos=131,1793,3493>");
local nNpcId = 10414
local pNpc = KNpc.Add2(nNpcId, 150, 2, 131,1793,3493)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_thienvuong()
		local nMapIndex = SubWorldID2Idx(123);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Dương Thiết Tâm<color> xuất hiện tại <pos=123,1835,3657>");
local nNpcId = 10415
local pNpc = KNpc.Add2(nNpcId, 150, 1, 123,1835,3657)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_caibang()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Thạch Hiên Viên<color> xuất hiện tại <pos=132,1784,3551>");
local nNpcId = 10411
local pNpc = KNpc.Add2(nNpcId, 150, 4, 132,1784,3551)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_ngamy()
		local nMapIndex = SubWorldID2Idx(133);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Vô Tưởng Sư Thái<color> xuất hiện tại <pos=133,1714,3479>");
local nNpcId = 10412
local pNpc = KNpc.Add2(nNpcId, 150, 3, 133,1714,3479)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end

function GoiKyLan:goiboss_tamma_ngudoc()
		local nMapIndex = SubWorldID2Idx(134);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Cổ Yên Nhiên<color> xuất hiện tại <pos=134,1765,3490>");
local nNpcId = 10416
local pNpc = KNpc.Add2(nNpcId, 150, 2, 134,1765,3490)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_thuyyen()
		local nMapIndex = SubWorldID2Idx(126);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Doãn Tiêu Vũ<color> xuất hiện tại <pos=126,1702,3601>");
local nNpcId = 10417
local pNpc = KNpc.Add2(nNpcId, 150, 3, 126,1702,3601)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_thiennhan()
		local nMapIndex = SubWorldID2Idx(135);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Hoàn Nhan Tương<color> xuất hiện tại <pos=135,1810,3692>");
local nNpcId = 10418
local pNpc = KNpc.Add2(nNpcId, 150, 4, 135,1810,3692)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_vodang()
		local nMapIndex = SubWorldID2Idx(129);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Vương Trùng Dương<color> xuất hiện tại <pos=129,1776,3454>");
local nNpcId = 10419
local pNpc = KNpc.Add2(nNpcId, 150, 5, 129,1776,3454)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_conlon()
		local nMapIndex = SubWorldID2Idx(136);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Tống Thu Thạch<color> xuất hiện tại <pos=136,1691,3457>");
local nNpcId = 10420
local pNpc = KNpc.Add2(nNpcId, 150, 5, 136,1691,3457)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_minhgiao()
		local nMapIndex = SubWorldID2Idx(137);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Phương Hành Giác<color> xuất hiện tại <pos=137,1785,3604>");
local nNpcId = 10421
local pNpc = KNpc.Add2(nNpcId, 150, 2, 137,1785,3604)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end
function GoiKyLan:goiboss_tamma_doanthi()
		local nMapIndex = SubWorldID2Idx(128);
	if nMapIndex < 0 then
		return;
	end
KDialog.MsgToGlobal("Tâm Ma của thập nhị môn phái đã xuất hiện mang theo quá nhiều bí mật của các đại phái <color=green>Đoàn Trí Hưng<color> xuất hiện tại <pos=128,1725,3466>");
local nNpcId = 10422
local pNpc = KNpc.Add2(nNpcId, 150, 3, 128,1725,3466)
local ReadyTimerId = Timer:Register(1 * Env.GAME_FPS, self.OnNpcTimer, self, pNpc.dwId);
if pNpc then
pNpc.SetLoseItemCallBack(1);
end	
end


function GoiKyLan:OnNpcTimer(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	self:AddAroundPlayersExp(nNpcId);			
	return 3 * Env.GAME_FPS;
end 

function GoiKyLan:AddAroundPlayersExp(nNpcId)
    local pNpc = KNpc.GetById(nNpcId);
    if (not pNpc) then
        return 0;
    end

    local tbDamage = pNpc.GetDamageTable();
    self.tbDamage = tbDamage;
    local tbPlayer = {unpack(tbDamage)};
    local tbPlayerId = {};

    if tbPlayer then
        for i = 1, #tbPlayer do
            self:AddExp2Player(tbPlayer[i].nPlayerId, nNpcId);
        end
    end

    local tbListPlayerXungQuanh = KNpc.GetAroundPlayerList(nNpcId, 56);
    if tbListPlayerXungQuanh then
        for _, pPlayer in pairs(tbListPlayerXungQuanh) do
            self:AddExp2Player(pPlayer.nId, nNpcId);
        end
    end
end


function GoiKyLan:AddExp2Player(nPlayerId, nNpcId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	local tbDamage = pNpc.GetDamageTable();
	if (not pNpc) then
		return 0;
	end
		local szMsg = "<color=green>Tên Boss: <color=white>"..pNpc.szName.."<color>\n";
	
	-- 排序
	local tbSort = {unpack(tbDamage)};
	table.sort(tbSort, self._SortDamage);
	local nDamage = 0;
		for i=1,#tbSort  do
			nDamage = nDamage + tbSort[i].nDamage;
		end

	for i = 1, 3 do
		if tbSort[i] then
			local szCaptainName = nil;
			local szTKName		= "Không";
				if tbSort[i].nPlayerId > 0 then
				if tbSort[i].nTeamId == 0 then
					szCaptainName = KGCPlayer.GetPlayerName(tbSort[i].nPlayerId);
				else
					local tbPlayer = KTeam.GetTeamMemberList(tbSort[i].nTeamId) or {};
					if tbPlayer[1] then
						szCaptainName = KGCPlayer.GetPlayerName(tbPlayer[1]);
					end
				end
			end
			if szCaptainName then
				szMsg = szMsg .. string.format("<color=green>%d: <color>", i) .. "<color=red>Đội <color=yellow>" .. szCaptainName .. "<color> : <color=yellow> ".. math.floor(tbSort[i].nDamage) .."<color> <color=red>ST<color>\n";
			end
		end
	end
	Dialog:SendBattleMsg(pPlayer,szMsg, 1);
	Dialog:ShowBattleMsg(pPlayer, 1, 0);
end

GoiKyLan._SortDamage = function(tbDamage1, tbDamage2)
	return tbDamage1.nDamage > tbDamage2.nDamage;
end