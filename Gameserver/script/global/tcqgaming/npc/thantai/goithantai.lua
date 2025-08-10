-------Tác giả : TCQGaming
------- 15:21 10/06/2023
if not MODULE_GAMESERVER then
return;
end
function GoiSuGiaThanMa:AddSuGiaThanMa_GS()
	GoiSuGiaThanMa:ResetFile() -- reset file save
GlobalExcute({"Dialog:GlobalNewsMsg_GS","Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại Thất Đại Thành Thị!<color> Các cao thủ hay mau chóng tìm lãnh thưởng "});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại Thất Đại Thành Thị!<color> Các cao thủ hay mau chóng tìm lãnh thưởng"); 
KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại Thất Đại Thành Thị!<color> Các cao thủ hay mau chóng tìm lãnh thưởng");	
end 

function GoiSuGiaThanMa:XoaSuGiaThanMa_GS()
GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow><color=pink>Thần Tài Năm Mới đã thoái ẩn hẹn quý vị lần kế tiếp<color>!!<color>"});
KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow><color=pink>Thần Tài Năm Mới đã thoái ẩn hẹn quý vị lần kế tiếp<color>!!<color><color>");
KDialog.MsgToGlobal("<color=yellow><color=pink>Thần Tài Năm Mới đã thoái ẩn hẹn quý vị lần kế tiếp<color>!!<color>");	
end 
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS1()
		local nMapIndex = SubWorldID2Idx(23);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(23, "Thần Tài Năm Mới");
	end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS2()
		local nMapIndex = SubWorldID2Idx(24);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(24, "Thần Tài Năm Mới");
end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS3()
		local nMapIndex = SubWorldID2Idx(25);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(25, "Thần Tài Năm Mới");
end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS4()
		local nMapIndex = SubWorldID2Idx(26);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(26, "Thần Tài Năm Mới");
end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS5()
		local nMapIndex = SubWorldID2Idx(27);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(27, "Thần Tài Năm Mới");
end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS6()
		local nMapIndex = SubWorldID2Idx(28);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(28, "Thần Tài Năm Mới");
end
function GoiSuGiaThanMa:XoaSuGiaThanMa_GS7()
		local nMapIndex = SubWorldID2Idx(29);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(29, "Thần Tài Năm Mới");
end
	----- ID : 10363 Sứ giả thần ma
	----- ID : 10391x Ông Già Noel
	----- ID : 10410 Thần Tài Năm Mới
	
function GoiSuGiaThanMa:nPhuongTuong()
	local nMapIndex = SubWorldID2Idx(24);
if nMapIndex < 0 then
return;
end
local nRandomPT = MathRandom(1,12)
	if nRandomPT == 1 then
	
KNpc.Add2(10410, 1, 0, 24, 1796, 3497) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1796, 3497>");	
elseif nRandomPT == 2 then 
KNpc.Add2(10410, 1, 0, 24, 1870, 3429) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1870, 3429>");	
elseif nRandomPT == 3 then 
KNpc.Add2(10410, 1, 0, 24, 1940, 3419) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1940, 3419>");	
elseif nRandomPT == 4 then 
KNpc.Add2(10410, 1, 0, 24, 1947, 3523) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1947, 3523>");	
elseif nRandomPT == 5 then 
KNpc.Add2(10410, 1, 0, 24, 1876, 3589) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1876, 3589>");	
elseif nRandomPT == 6 then 
KNpc.Add2(10410, 1, 0, 24, 1820, 3584) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1820, 3584>");	
elseif nRandomPT == 7 then 
KNpc.Add2(10410, 1, 0, 24, 1749, 3618) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1749, 3618>");	
elseif nRandomPT == 8 then 
KNpc.Add2(10410, 1, 0, 24, 1654, 3536) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1654, 3536>");	
elseif nRandomPT == 9 then 
KNpc.Add2(10410, 1, 0, 24, 1539, 3435) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1539, 3435>");	
elseif nRandomPT == 10 then 
KNpc.Add2(10410, 1, 0, 24, 1686, 3316) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1686, 3316>");	
elseif nRandomPT == 11 then 
KNpc.Add2(10410, 1, 0, 24, 1793, 3339) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1793, 3339>");	
elseif nRandomPT == 12 then 
KNpc.Add2(10410, 1, 0, 24, 1873, 3382) -- Map PT
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=24, 1873, 3382>");	
end
end 
function GoiSuGiaThanMa:nDuongChau()
	local nMapIndex = SubWorldID2Idx(26);
if nMapIndex < 0 then
return;
end
-- Dương Châu
local nRandomDC = MathRandom(1,12)
if nRandomDC == 1 then
KNpc.Add2(10410, 1, 0, 26, 1673, 3074) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1673, 3074> tọa độ 1");	
elseif nRandomDC == 2 then 
KNpc.Add2(10410, 1, 0, 26, 1631, 3336) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1620, 3447> tọa độ 2");	
elseif nRandomDC == 3 then 
KNpc.Add2(10410, 1, 0, 26, 1690, 3149) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1690, 3149> tọa độ 3");	
elseif nRandomDC == 4 then 
KNpc.Add2(10410, 1, 0, 26, 1682, 3272) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1682, 3272> tọa độ 4 ");	
elseif nRandomDC == 5 then 
KNpc.Add2(10410, 1, 0, 26, 1631, 3352) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1631, 3352>tọa độ 5");	
elseif nRandomDC == 6 then 
KNpc.Add2(10410, 1, 0, 26, 1485, 3098) --Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1485, 3098> tọa độ 6");	
elseif nRandomDC == 7 then 
KNpc.Add2(10410, 1, 0, 26, 1495, 3219) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1495, 3219>tọa độ 7");	
elseif nRandomDC == 8 then 
KNpc.Add2(10410, 1, 0, 26, 1391, 3183) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1391, 3183>tọa độ 8");	
elseif nRandomDC == 9 then 
KNpc.Add2(10410, 1, 0, 26, 1478, 3288) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1478, 3288>tọa độ 9");	
elseif nRandomDC == 10 then 
KNpc.Add2(10410, 1, 0, 26, 1572, 3377) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1572, 3377>tọa độ 10");	
elseif nRandomDC == 11 then 
KNpc.Add2(10410, 1, 0, 26, 1557, 3287) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1557, 3287>tọa độ 11");	
elseif nRandomDC == 12 then 
KNpc.Add2(10410, 1, 0, 26, 1598, 3202) -- Map DC
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=26, 1598, 3202>tọa độ 12");	
end

end 


function GoiSuGiaThanMa:nLamAn()
	local nMapIndex = SubWorldID2Idx(29);
if nMapIndex < 0 then
return;
end
-- Lâm An
local nRandomLA = MathRandom(1,12)
if nRandomLA == 1 then
KNpc.Add2(10410, 1, 0, 29, 1649, 3950)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1649, 3950>tọa độ 1");	
elseif nRandomLA == 2 then 
KNpc.Add2(10410, 1, 0, 29, 1726, 4029)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1726, 4029>tọa độ 2");	
elseif nRandomLA == 3 then 
KNpc.Add2(10410, 1, 0, 29, 1829, 3946)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1829, 3946>tọa độ 3");	
elseif nRandomLA == 4 then 
KNpc.Add2(10410, 1, 0, 29, 1736, 3890)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1736, 3890>tọa độ 4");	
elseif nRandomLA == 5 then 
KNpc.Add2(10410, 1, 0, 29, 1831, 3882)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1831, 3882>tọa độ 5");	
elseif nRandomLA == 6 then 
KNpc.Add2(10410, 1, 0, 29, 1694, 3798)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1694, 3798>tọa độ 6");	
elseif nRandomLA == 7 then 
KNpc.Add2(10410, 1, 0, 29, 1686, 3692)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1686, 3692>tọa độ 7");	
elseif nRandomLA == 8 then 
KNpc.Add2(10410, 1, 0, 29, 1582, 3820)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1582, 3820>tọa độ 8");	
elseif nRandomLA == 9 then 
KNpc.Add2(10410, 1, 0, 29, 1518, 3879)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1518, 3879>tọa độ 9");	
elseif nRandomLA == 10 then 
KNpc.Add2(10410, 1, 0, 29, 1475, 3774)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1475, 3774>tọa độ 10");	
elseif nRandomLA == 11 then 
KNpc.Add2(10410, 1, 0, 29, 1573, 4114)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1573, 4114>tọa độ 11");	
elseif nRandomLA == 12 then 
KNpc.Add2(10410, 1, 0, 29, 1458, 4145)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=29, 1458, 4145>tọa độ 12");	
end
end 
function GoiSuGiaThanMa:nTuongDuong()
	local nMapIndex = SubWorldID2Idx(25);
if nMapIndex < 0 then
return;
end
-- Tương Dương
local nRandomTD = MathRandom(1,12)
if nRandomTD == 1 then
KNpc.Add2(10410, 1, 0, 25, 1783, 3113)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1783, 3113>tọa độ 1");	
elseif nRandomTD == 2 then 
KNpc.Add2(10410, 1, 0, 25, 1773, 3009)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1773, 3009>tọa độ 2");	
elseif nRandomTD == 3 then 
KNpc.Add2(10410, 1, 0, 25, 1670, 3038)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1670, 3038>tọa độ 3");	
elseif nRandomTD == 4 then 
KNpc.Add2(10410, 1, 0, 25, 1590, 2926)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1590, 2926>tọa độ 4");	
elseif nRandomTD == 5 then 
KNpc.Add2(10410, 1, 0, 25, 1464, 2960)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1464, 2960>tọa độ 5");	
elseif nRandomTD == 6 then 
KNpc.Add2(10410, 1, 0, 25, 1442, 3148)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1442, 3148>tọa độ 6");	
elseif nRandomTD == 7 then 
KNpc.Add2(10410, 1, 0, 25, 1490, 3271)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1490, 3271>tọa độ 7");	
elseif nRandomTD == 8 then 
KNpc.Add2(10410, 1, 0, 25, 1587, 3249)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1587, 3249>tọa độ 8");	
elseif nRandomTD == 9 then 
KNpc.Add2(10410, 1, 0, 25, 1621, 3327)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1621, 3327>tọa độ 9");	
elseif nRandomTD == 10 then 
KNpc.Add2(10410, 1, 0, 25, 1710, 3198)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1710, 3198>tọa độ 10");	
elseif nRandomTD == 11 then 
KNpc.Add2(10410, 1, 0, 25, 1759, 3302)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1759, 3302>tọa độ 11");	
elseif nRandomTD == 12 then 
KNpc.Add2(10410, 1, 0, 25, 1789, 3195)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=25, 1789, 3195>tọa độ 12");	
end
end 

function GoiSuGiaThanMa:nThanhDo()
	local nMapIndex = SubWorldID2Idx(27);
if nMapIndex < 0 then
return;
end
-- Thành Đô
local nRandomTdo = MathRandom(1,12)
if nRandomTD == 1 then
KNpc.Add2(10410, 1, 0, 27, 1734, 3345)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1734, 3345>tọa độ 1");	
elseif nRandomTdo == 2 then 
KNpc.Add2(10410, 1, 0, 27, 1735, 3279)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1735, 3279>tọa độ 2");	
elseif nRandomTdo == 3 then 
KNpc.Add2(10410, 1, 0, 27, 1730, 3176)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1730, 3176>tọa độ 3");	
elseif nRandomTdo == 4 then 
KNpc.Add2(10410, 1, 0, 27, 1603, 3252)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1603, 3252>tọa độ 4");	
elseif nRandomTdo == 5 then 
KNpc.Add2(10410, 1, 0, 27, 1571, 3294)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1571, 3294>tọa độ 5");	
elseif nRandomTdo == 6 then 
KNpc.Add2(10410, 1, 0, 27, 1507, 3389)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1507, 3389>tọa độ 6");	
elseif nRandomTdo == 7 then 
KNpc.Add2(10410, 1, 0, 27, 1634, 3357)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1634, 3357>tọa độ 7");	
elseif nRandomTdo == 8 then 
KNpc.Add2(10410, 1, 0, 27, 1685, 3105)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1685, 3105>tọa độ 8");	
elseif nRandomTdo == 9 then 
KNpc.Add2(10410, 1, 0, 27, 1600, 3121)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1600, 3121>tọa độ 9");	
elseif nRandomTdo == 10 then 
KNpc.Add2(10410, 1, 0, 27, 1539, 3141)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1539, 3141>tọa độ 10");	
elseif nRandomTdo == 11 then 
KNpc.Add2(10410, 1, 0, 27, 1522, 3192)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1522, 3192>tọa độ 11");	
elseif nRandomTdo == 12 then 
KNpc.Add2(10410, 1, 0, 27, 1484, 3201)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=27, 1484, 3201>tọa độ 12");	
end

end 


function GoiSuGiaThanMa:nBienKinh()
	local nMapIndex = SubWorldID2Idx(23);
if nMapIndex < 0 then
return;
end
-- Bien Kinh
local nRandomBK = MathRandom(1,12)
if nRandomBK == 1 then
KNpc.Add2(10410, 1, 0, 23, 1578, 3262)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1578, 3262>tọa độ 1");	
elseif nRandomBK == 2 then 
KNpc.Add2(10410, 1, 0, 23, 1459, 3134)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1459, 3134>tọa độ 2");	
elseif nRandomBK == 3 then 
KNpc.Add2(10410, 1, 0, 23, 1526, 3121)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1526, 3121>tọa độ 3");	
elseif nRandomBK == 4 then 
KNpc.Add2(10410, 1, 0, 23, 1460, 3001)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1460, 3001>tọa độ 4");	
elseif nRandomBK == 5 then 
KNpc.Add2(10410, 1, 0, 23, 1548, 3041)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1548, 3041>tọa độ 5");	
elseif nRandomBK == 6 then 
KNpc.Add2(10410, 1, 0, 23, 1674, 3179)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1674, 3179>tọa độ 6");	
elseif nRandomBK == 7 then 
KNpc.Add2(10410, 1, 0, 23, 1689, 3088)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1689, 3088>tọa độ 7");	
elseif nRandomBK == 8 then 
KNpc.Add2(10410, 1, 0, 23, 1712, 3021)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1712, 3021>tọa độ 8");	
elseif nRandomBK == 9 then 
KNpc.Add2(10410, 1, 0, 23, 1602, 3043)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1602, 3043>tọa độ 9");	
elseif nRandomBK == 10 then 
KNpc.Add2(10410, 1, 0, 23, 1611, 2912)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1611, 2912>tọa độ 10");	
elseif nRandomBK == 11 then 
KNpc.Add2(10410, 1, 0, 23, 1541, 2982)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1541, 2982>tọa độ 11");	
elseif nRandomBK == 12 then 
KNpc.Add2(10410, 1, 0, 23, 1569, 3106)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=23, 1569, 3106>tọa độ 12");	
end
end 

function GoiSuGiaThanMa:nDaiLy()
	local nMapIndex = SubWorldID2Idx(28);
if nMapIndex < 0 then
return;
end
-- Dai Ly
local nRandomDL = MathRandom(1,12)
if nRandomDL == 1 then
KNpc.Add2(10410, 1, 0, 28, 1519, 3446)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1519, 3446>tọa độ 1");	
elseif nRandomDL == 2 then 
KNpc.Add2(10410, 1, 0, 28, 1413, 3489)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1413, 3489>tọa độ 2");	
elseif nRandomDL == 3 then 
KNpc.Add2(10410, 1, 0, 28, 1412, 3339)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1412, 3339>tọa độ 3");	
elseif nRandomDL == 4 then 
KNpc.Add2(10410, 1, 0, 28, 1502, 3279)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1502, 3279>tọa độ 4");	
elseif nRandomDL == 5 then 
KNpc.Add2(10410, 1, 0, 28, 1503, 3371)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1503, 3371>tọa độ 5");	
elseif nRandomDL == 6 then 
KNpc.Add2(10410, 1, 0, 28, 1496, 3195)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1496, 3195>tọa độ 6");	
elseif nRandomDL == 7 then 
KNpc.Add2(10410, 1, 0, 28, 1566, 3166)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1566, 3166>tọa độ 7");	
elseif nRandomDL == 8 then 
KNpc.Add2(10410, 1, 0, 28, 1648, 3140)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1648, 3140>tọa độ 8");	
elseif nRandomDL == 9 then 
KNpc.Add2(10410, 1, 0, 28, 1657, 3304)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1657, 3304>tọa độ 9");	
elseif nRandomDL == 10 then 
KNpc.Add2(10410, 1, 0, 28, 1743, 3367)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1743, 3367>tọa độ 10");	
elseif nRandomDL == 11 then 
KNpc.Add2(10410, 1, 0, 28, 1792, 3322)	
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1792, 3322>tọa độ 11");	
elseif nRandomDL == 12 then 
KNpc.Add2(10410, 1, 0, 28, 1650, 3453)
-- KDialog.MsgToGlobal("Nghe nói <color=yellow><color=pink>Thần Tài Năm Mới<color> xuất hiện tại <pos=28, 1650, 3453>tọa độ 12");	
end
end 

function GoiSuGiaThanMa:ResetFile()
	GoiSuGiaThanMa.Folder = "\\script\\global\\tcqgaming\\npc\\thantai\\"; -- duong dan folder
	GoiSuGiaThanMa.List_Player = "ghilog.txt"; -- list nhan vat
	local szFile = GoiSuGiaThanMa.Folder..GoiSuGiaThanMa.List_Player.."";
	KFile.WriteFile(szFile, "TenNV\n");	
end