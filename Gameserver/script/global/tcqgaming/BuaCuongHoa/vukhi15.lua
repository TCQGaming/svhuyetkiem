local tbItem	= Item:GetClass("vu_khi15");
tbItem.nNumCuong = 15;
function tbItem:OnUse()

	if me.CountFreeBagCell() < 3 then
	Dialog:Say("Hãy chú ý sắp xếp hành trang có đủ 3 ô trống");
	return 0;
	end	

	local szMsg = "Đặt vào Item Cần Cường Hóa";
	Dialog:OpenGift(szMsg, nil, {self.CuongHoa, self});
end

function tbItem:CuongHoa(tbItemObj)
	local nCount = me.GetItemCountInBags(18,1,20400,self.nNumCuong)
	if nCount < 1 then
    	Dialog:Say("Đừng gian lận trong trò chơi, hãy thể hiện bạn là người chơi nghiêm túc");
		return 0;
	end

	local tbItemInfo = {bForceBind=1,};
	local tbItemList	= {};
	local nCount = 0; 
    for i = 1, #tbItemObj do 
        nCount = nCount + tbItemObj[i][1].nCount; 
        local CheckItem = tbItemObj[i][1]; 
        local nCheck = "2";
        local nCheckk = "4";
        local szKey = string.format("%s",CheckItem.nGenre);
        if szKey ~= nCheck and szKey ~= nCheckk then 
        Dialog:Say("Vật phẩm bỏ vào không phải trang bị", {"Kết thúc đối thoại !"}); 
	    return 0;
        end 

        local szLoai = string.format("%s",CheckItem.nDetail);
	    if szLoai ~= "1" and szLoai ~= "2" then
        Dialog:Say("Loại vật phẩm này chỉ dùng để cường hóa Vũ khí", {"Kết thúc đối thoại !"}); 
	    return 0;
        end

		local nLevel = CheckItem.nLevel;
		if (nLevel < 10) then-- 炼化1级的才能强16
			Dialog:Say("Không thể cường hóa vượt cấp cho phép cường hóa của trang bị", {"Kết thúc đối thoại !"}); 
			return 0;
		end
    end

    if nCount ~= 1 then 
        Dialog:Say("Chỉ được đặt vào 1 trang bị", {"Ta biết rồi !"}); 
        return 0; 
    end

	local nTonch = me.GetTask(3031,1)
	me.SetTask(3031,1,nTonch + 1)

    for i = 1, #tbItemObj do 
    local pEquip = tbItemObj[i][1]; 
    local nEnhanceMax = self.nNumCuong;
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
	me.ConsumeItemInBags(1, 18, 1, 20400, self.nNumCuong);
	pEquip.Bind(1);
	Spreader:OnItemBound(pEquip);
	local szHistory = "\\script\\global\\tcqgaming\\BuaCuongHoa\\LichSuCuongHoa.txt";
    KFile.AppendFile(szHistory, ""..me.szName.."\t"..pEquip.szName.."\t"..nEnhanceMax.."\t"..nTonch.."\n");
	end
end
