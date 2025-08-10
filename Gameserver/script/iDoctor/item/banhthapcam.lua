
local tbBanhThapCam = Item:GetClass("banhthapcam");
tbBanhThapCam.Use_Max = 5;
tbBanhThapCam.Use_All = 300;

function tbBanhThapCam:OnUse()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(3107,1) < nDate then
		me.SetTask(3107,1, nDate);
		me.SetTask(3107,2, 0);
	end 

	local nTcount = me.GetTask(3164,1)
	if nTcount >= self.Use_All then
		Dialog:Say(string.format("Bạn đã sử dụng <color=yellow>"..self.Use_All.."<color> lần, đạt đến giới hạn của Sự Kiện"));
		return 0;
	end

	--local nCountt = me.GetTask(3107,2)
	--if nCountt >= self.Use_Max then
		--Dialog:Say(string.format("Hôm nay bạn đã sử dụng <color=yellow>"..self.Use_Max.."<color> lần, Ngày mai hãy sử dụng tiếp nhé"));
		--return 0;
	--end

	if me.CountFreeBagCell() < 3 then
	me.Msg("Túi của bạn đã đầy, cần ít nhất 3 ô trống.");
	return 0;
	end	
	
-------
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	nRand = MathRandom(1, 1000);
	local tbRate = {500, 260, 205, 10, 10, 10, 5}; -- Rate Item
	local tbAward = {1 ,2, 3, 4, 5, 6, 7}; -- Rate 3 con số
	for i = 1, 7 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end

	local nCount = me.GetTask(3107,2)
	
	if (tbAward[nIndex]==1) then -- Xác xuất ra số 1 là 75/100 (80%)
	me.SetTask(3107,2, nCount + 1);
	me.AddItem(18,1,114,5);
	elseif (tbAward[nIndex]==2) then -- Xác xuất ra số 1 là 15/100 (15%)
	me.SetTask(3107,2, nCount + 1);
	me.AddStackItem(18,1,553,1,nil,30);
	elseif (tbAward[nIndex]==3) then -- Xác xuất ra số 1 là 10/100 (5%)
	me.SetTask(3107,2, nCount + 1);
	me.AddItem(18,1,114,6);
	elseif (tbAward[nIndex]==4) then -- Xác xuất ra số 1 là 10/100 (5%)
	me.SetTask(3107,2, nCount + 1);
	me.AddItem(18,1,326,2);
	elseif (tbAward[nIndex]==5) then -- Xác xuất ra số 1 là 10/100 (5%)
	me.SetTask(3107,2, nCount + 1);
	me.AddItem(18,1,326,3);
	elseif (tbAward[nIndex]==6) then -- Xác xuất ra số 1 là 10/100 (5%)
	me.SetTask(3107,2, nCount + 1);
	local pItem = me.AddItem(1,12,100,4);
	if pItem then
		me.SetItemTimeout(pItem, 2*24*60,0);
	end
	elseif (tbAward[nIndex]==7) then -- Xác xuất ra số 1 là 10/100 (5%)
	me.SetTask(3107,2, nCount + 1);
	local pItem = me.AddItem(1,12,101,4);
	if pItem then
		me.SetItemTimeout(pItem, 6*60,0);
	end
	end

	me.SetTask(3164,1, nTcount + 1);
	me.Msg(string.format("<color=yellow>Tổng số Sự Kiện: Bạn đã sử dụng <color=gold>%d / "..self.Use_All.."<color> lần<color>",nTcount + 1));
-------

	return 1;
end
