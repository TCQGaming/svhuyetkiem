local tbChuyenAo ={};
SpecialEvent.tbChuyenAo= tbChuyenAo;
tbChuyenAo.TASK_RutCuongHoa = 3130;

function tbChuyenAo:OnDialog()
	local nCount1 = me.GetTask(3130,1)
	if me.CountFreeBagCell() < 3 then
	Dialog:Say("Hãy chú ý sắp xếp hành trang có đủ 3 ô trống");
	return 0;
	end	
	local nCount = me.GetTask(3028,1)
	if nCount < 500 then
	Dialog:Say("Tính năng này chỉ dành cho người chơi đạt mốc tích lũy rút <color=cyan>500 vạn đồng<color> trở lên");
	return 0;
	end
	-- local pItem1 = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_HEAD, 0);-- Nón
	local pItem = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_BODY, 0);--Áo
	-- local pItem3 = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_BELT, 0);---Đai
	-- local pItem4 = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_FOOT, 0);---Giày
	-- local pItem5 = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_CUFF, 0);--Tay

	-- local PItems = pItem1 or pItem2 or pItem3 or pItem4 or pItem5;
	if not pItem then
		Dialog:Say("Ngươi chưa trang bị <color=yellow>Áo<color> lên người, không thể chuyển");
		return 0;
	end  
	 	local pItemPhu = me.GetItem(Item.ROOM_EQUIPEX,Item.EQUIPEXPOS_BODY, 0);
		if not pItemPhu then
		local szItemName = pItem.szName;
		local Lever = pItem.nEnhTimes;
		if Lever > 0 then 
				Dialog:Say("<color=yellow>Trang bị đích của ngươi hiện tại là \n+ "..Lever.."\nhãy mang trang bị chưa cường hóa rồi tới đây tìm ta");
				return 0 
				end
				
		
		local szMsg = "Lượt rút Cường Hóa của bạn còn: <color=cyan>"..nCount1.."<color>\n<color=yellow>Chuyển Cường Hóa<color>\nTrang bị đích:\n<color=yellow>"..szItemName.." + "..Lever.."<color>\nHãy đặt trang bị +1 trở lên\n<color=yellow>Hệ thống sẽ giúp bạn chuyển sang trang bị đích\nHãy quyết định trước khi đồng ý";
	Dialog:OpenGift(szMsg, nil, {self.ChuyenCuongHoa, self});
		else
	Dialog:Say("Ngươi cần tháo <color=yellow>Áo<color> Phụ xuống hành trang mới có thể chuyển");
	return 0;
end 
end

function tbChuyenAo:ChuyenCuongHoa(tbItemObj)
	local pItem = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_BODY, 0);
	local nCount = 0; 
    for i = 1, #tbItemObj do 
        nCount = nCount + tbItemObj[i][1].nCount; 
    end

    if nCount ~= 1 then 
    me.Msg("<color=yellow>Mỗi lần chuyển chỉ được đặt vào 1 trang bị thôi<color>");
    return 0; 
    end

    local nCheckThe = "1";
    local nCheck = "2";
    local nCheckk = "4";
    local nCheckLev = "12";
    for i = 1, #tbItemObj do 
    local CheckItem = tbItemObj[i][1]; 
    local szKey = string.format("%s",CheckItem.nGenre);
    local szLever = string.format("%s",CheckItem.nEnhTimes);
     local szLoai = string.format("%s",CheckItem.nDetail);
		-- if szLoai ~= "3" and szLoai ~= "7" and szLoai ~= "8" and szLoai ~= "9" and szLoai ~= "10" then
		if szLoai ~= "3" then
        Dialog:Say("Sai rồi , bạn chỉ có thể chuyển Cường Hóa từ Áo qua Áo", {"Kết thúc đối thoại !"}); 
	    return 0;
        end 
		
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		
    if szKey ~= nCheck and szKey ~= nCheckThe and szKey ~= nCheckk then 
    Dialog:Say("Hãy đặt trang bị vào");
    return 0;
    end
	---------------------------------------------------------------------------------------------------------------------
	-- local nLevelChuyen = CheckItem.nLevel;
	local nCapDoTrenNguoi = pItem.nLevel;
	local nCapCuongHoaChuyen = CheckItem.nEnhTimes;
if (nCapCuongHoaChuyen == 16) then 
		if (nCapDoTrenNguoi < 10) then
	Dialog:Say("Đẳng cấp Áo được nhận cường hóa không phù hợp\nLưu Ý : Áo +16 chỉ có thể chuyển cho Áo Cấp 10 hoặc Ngược Lại ", {"Kết thúc đối thoại !"}); 
		return 0;
		end 
elseif (nCapCuongHoaChuyen == 15) then 
		if (nCapDoTrenNguoi < 10) then
	Dialog:Say("Đẳng cấp Áo được nhận cường hóa không phù hợp\nLưu ý : Áo Cộng 15 chỉ có thể chuyển cho Áo Cấp 10 hoặc Ngược Lại", {"Kết thúc đối thoại !"}); 
		return 0; 
		end	
elseif (nCapCuongHoaChuyen == 14) then 
		if (nCapDoTrenNguoi < 9) then
	Dialog:Say("Đẳng cấp Áo được nhận cường hóa không phù hợp\nLưu ý : Áo Cộng 14 chỉ có thể chuyển cho Áo Cấp 9 hoặc Ngược Lại", {"Kết thúc đối thoại !"}); 
		return 0; 
		end
elseif (nCapCuongHoaChuyen == 13) then 
		if (nCapDoTrenNguoi < 9) then
	Dialog:Say("Đẳng cấp Áo được nhận cường hóa không phù hợp\nLưu ý : Áo Cộng 13 chỉ có thể chuyển cho Áo Cấp 9 hoặc Ngược Lại", {"Kết thúc đối thoại !"}); 
		return 0; 
		end
end 
	---------------------------------------------------------------------------------------------------------------------
	
    if szLever < nCheckLev then 
    Dialog:Say("Trang bị cường hóa 12 trở lên mới được chuyển");
    return 0;
    end
	local pItem = me.GetItem(Item.ROOM_EQUIP,Item.EQUIPPOS_BODY, 0);
	local szLelver = string.format("%s",CheckItem.nLevel);
	local nRet = pItem.Regenerate(
		pItem.nGenre,
		pItem.nDetail,
		pItem.nParticular,
		pItem.nLevel,
		pItem.nSeries,
		pItem.nEnhTimes + CheckItem.nEnhTimes,			-- 强化次数加一
		pItem.nLucky,
		pItem.GetGenInfo(),
		0,
		pItem.dwRandSeed,
		0
	);
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.Msg("<color=yellow>Chuyển Cường Hóa Thành Công\n<color><color=cyan> Vui lòng kiểm tra lại trong giao diện nhân vật F1<color>");
	end
	
	
		local nTonch = me.GetTask(9158,99)
		me.SetTask(9158,99,nTonch + 1)
	local szItemName = pItem.szName;
	for i = 1, #tbItemObj do 
    local pEquip = tbItemObj[i][1]; 
    local nEnhanceMax = 0;
	local nRet = pEquip.Regenerate(
		pEquip.nGenre,
		pEquip.nDetail,
		pEquip.nParticular,
		pEquip.nLevel,
		pEquip.nSeries,
		nEnhanceMax,			-- 强化次数加一
		pEquip.nLucky,
		pEquip.GetGenInfo(),
		0,
		pEquip.dwRandSeed,
		0 
	);
	pEquip.Bind(1);
	Spreader:OnItemBound(pEquip);
	local szHistory = "\\script\\global\\tcqgaming\\BuaCuongHoa\\LichSuCuongHoa.txt";
    KFile.AppendFile(szHistory, ""..me.szName.."\t"..pEquip.szName.."\t"..pItem.nEnhTimes.."\t"..nTonch.."\t"..szItemName.."\n");
	end
	end
	------------------------------------------Phong Cu-------------------------------------------------------------