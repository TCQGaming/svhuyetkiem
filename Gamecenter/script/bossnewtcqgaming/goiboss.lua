if not MODULE_GC_SERVER then
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
		szName = "<color=white>Trần Vô Mệnh<color>",
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
function GoiKyLan:GoiBoss_45_new()
-- GlobalExcute({"GoiKyLan:goiboss_45_vantuyetson"});
-- GlobalExcute({"GoiKyLan:goiboss_45_hinhbodau"});
-- GlobalExcute({"GoiKyLan:goiboss_45_vanlaodien"});
-- GlobalExcute({"GoiKyLan:goiboss_45_caosihien"});
-- GlobalExcute({"GoiKyLan:goiboss_45_thacbacsonuyen"});
-- GlobalExcute({"GoiKyLan:goiboss_45_duonglieu"});
 -- GlobalExcute({"GoiKyLan:GoiBoss_45_NgauNhien"});
     local tbList = tbBossData.Boss45
    for _, tbBoss in ipairs(tbList) do
        local tbPos = tbBoss.tbPosList[MathRandom(1, #tbBoss.tbPosList)]
            GlobalExcute{"GoiKyLan:GoiBoss45", tbBoss.nNpcId, 45, tbBoss.nSeries, tbPos.nMapId, tbPos.nX, tbPos.nY, tbBoss.szName}
    end
end




function GoiKyLan:GoiBoss_75_new()
-- GlobalExcute({"GoiKyLan:goiboss_75_kim"});
-- GlobalExcute({"GoiKyLan:goiboss_75_moc"});
-- GlobalExcute({"GoiKyLan:goiboss_75_thuy"});
-- GlobalExcute({"GoiKyLan:goiboss_75_hoa"});
-- GlobalExcute({"GoiKyLan:goiboss_75_tho"});
     local tbList = tbBossData.Boss75
    for _, tbBoss in ipairs(tbList) do
        local tbPos = tbBoss.tbPosList[MathRandom(1, #tbBoss.tbPosList)]
            GlobalExcute{"GoiKyLan:GoiBoss75", tbBoss.nNpcId, 75, tbBoss.nSeries, tbPos.nMapId, tbPos.nX, tbPos.nY, tbBoss.szName}
    end
end

function GoiKyLan:GoiBoss_95_new()
-- GlobalExcute({"GoiKyLan:goiboss_95_kim"});
-- GlobalExcute({"GoiKyLan:goiboss_95_moc"});
-- GlobalExcute({"GoiKyLan:goiboss_95_thuy"});
-- GlobalExcute({"GoiKyLan:goiboss_95_hoa"});
-- GlobalExcute({"GoiKyLan:goiboss_95_tho"});
     local tbList = tbBossData.Boss95
    for _, tbBoss in ipairs(tbList) do
        local tbPos = tbBoss.tbPosList[MathRandom(1, #tbBoss.tbPosList)]
            GlobalExcute{"GoiKyLan:GoiBoss95", tbBoss.nNpcId, 95, tbBoss.nSeries, tbPos.nMapId, tbPos.nX, tbPos.nY, tbBoss.szName}
    end
end
function GoiKyLan:GoiBoss_TamMa_150()
GlobalExcute({"GoiKyLan:goiboss_tamma_thieulam"});
GlobalExcute({"GoiKyLan:goiboss_tamma_duongmon"});
GlobalExcute({"GoiKyLan:goiboss_tamma_thienvuong"});
GlobalExcute({"GoiKyLan:goiboss_tamma_caibang"});
GlobalExcute({"GoiKyLan:goiboss_tamma_ngamy"});
GlobalExcute({"GoiKyLan:goiboss_tamma_ngudoc"});
GlobalExcute({"GoiKyLan:goiboss_tamma_thuyyen"});
GlobalExcute({"GoiKyLan:goiboss_tamma_thiennhan"});
GlobalExcute({"GoiKyLan:goiboss_tamma_vodang"});
GlobalExcute({"GoiKyLan:goiboss_tamma_conlon"});
GlobalExcute({"GoiKyLan:goiboss_tamma_minhgiao"});
GlobalExcute({"GoiKyLan:goiboss_tamma_doanthi"});
end

function GoiKyLan:GoiLongTruTongKim()
GlobalExcute({"GoiKyLan:TrieuHoi_LongTru_TrungLapTK"});
end

function GoiKyLan:Xoa_LongTruTongKim_GC()
GlobalExcute({"GoiKyLan:Xoa_LongTruTongKim"});
end