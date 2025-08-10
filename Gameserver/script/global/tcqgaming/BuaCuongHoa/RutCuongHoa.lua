-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbRutCuongHoa ={};
SpecialEvent.RutCuongHoa= tbRutCuongHoa;
tbRutCuongHoa.TASK_NON = 3121;
tbRutCuongHoa.TASK_AO = 3122;
tbRutCuongHoa.TASK_LUNG = 3123;
tbRutCuongHoa.TASK_TAY = 3124;
tbRutCuongHoa.TASK_GIAY = 3125;
tbRutCuongHoa.TASK_PHU = 3126;
tbRutCuongHoa.TASK_BOI = 3127;
tbRutCuongHoa.TASK_NHAN = 3128;
tbRutCuongHoa.TASK_LIEN = 3129;
tbRutCuongHoa.TASK_RutCuongHoa = 3130;
function tbRutCuongHoa:OnDialog()
	local nCount1 = me.GetTask(3130,1)
	local TichCHRutNap = me.GetTask(3129,1)

	if me.CountFreeBagCell() < 3 then
	Dialog:Say("Kiểm tra hành trang không đủ 3 ô trống");
	return 0;
	end
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Hãy mở khóa rương!");
        return 0;    
	end
	local nCount = me.GetTask(3028,1)
	if nCount < 500 then
	Dialog:Say("Tính năng này chỉ dành cho người chơi đạt mốc tích lũy rút <color=cyan>500 vạn đồng<color> trở lên");
	return 0;
	end
	local szMsg = "Lượt rút Cường Hóa của bạn còn: <color=cyan>"..nCount1.."<color>";
	local tbOpt = 
	{
		{"<color=cyan>Ta muốn rút cường hóa<color>", self.OkRutCuong, self},
		{"Kiểm tra lượt và rút cường hóa", self.CheckRut, self},
   		{"Khi khác ta tới"}
	};
	
	Dialog:Say(szMsg,tbOpt)
end

function tbRutCuongHoa:OkRutCuong()
	local szMsg = "Trang bị cần rút cường hóa";
	Dialog:OpenGift(szMsg, nil, {self.RutCuongNgay, self});
end

function tbRutCuongHoa:RutCuongNgay(tbItemObj)
	local nCount = 0; 
    for i = 1, #tbItemObj do 
        nCount = nCount + tbItemObj[i][1].nCount; 
    end

    if nCount ~= 1 then 
    me.Msg("<color=yellow>Mỗi lần rút chỉ dược bỏ vào 1 trang bị<color>");
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

    if szKey ~= nCheck and szKey ~= nCheckThe and szKey ~= nCheckk then 
    Dialog:Say("Hãy đặt trang bị vào");
    return 0;
    end

    if szLever < nCheckLev then 
    Dialog:Say("Trang bị cường hóa 12 trở lên mới được rút");
    return 0;
    end
local szLoai = string.format("%s",CheckItem.nDetail);
	if szLoai == "1" or szLoai == "2" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end

		local szTanLang = string.format("%s",CheckItem.nParticular);
		local szLelver = string.format("%s",CheckItem.nLevel);
		if szTanLang >= "1355" and szTanLang < "1425" and szLelver == "10" then
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20400,CheckItem.nEnhTimes);
		-- me.AddItem(18,2,385,1); --vũ khí thanh đồng luyện hóa đồ
		elseif szTanLang >= "149" and szTanLang < "161" and szLelver == "10" then
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20400,CheckItem.nEnhTimes);
		-- me.AddItem(18,2,385,1); --vũ khí thanh đồng luyện hóa đồ
		else
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20400,CheckItem.nEnhTimes);
		end
	elseif szLoai == "3" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20401,CheckItem.nEnhTimes);
	elseif szLoai == "4" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20402,CheckItem.nEnhTimes);
	elseif szLoai == "5" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20402,CheckItem.nEnhTimes);
	elseif szLoai == "6" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20402,CheckItem.nEnhTimes);
	elseif szLoai == "7" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20401,CheckItem.nEnhTimes);
	elseif szLoai == "8" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20401,CheckItem.nEnhTimes);
	elseif szLoai == "9" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20401,CheckItem.nEnhTimes);
	elseif szLoai == "10" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20401,CheckItem.nEnhTimes);
	elseif szLoai == "11" then
		local nCVuKhi = me.GetTask(self.TASK_RutCuongHoa,1)
		if nCVuKhi < 1 then
        me.Msg("<color=yellow>Lượt rút cường hóa của bạn đã hết<color>");
        return 0;
		end
		me.SetTask(self.TASK_RutCuongHoa,1,nCVuKhi - 1)
		me.AddItem(18,1,20402,CheckItem.nEnhTimes);
	else
    me.Msg("<color=yellow>Hiện tại không thể rút cường hóa trang bị này, hãy liên hệ GM<color>");
    end
	end
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
	end
	end
function tbRutCuongHoa:CheckRut()
	local nCount = me.GetTask(3130,1)
	local TichCHRutNap = me.GetTask(3129,1)
	local szMsg = "Tích lũy sau khi rút hiện nay là<color=yellow> "..TichCHRutNap.." vạn đồng<color>\n <color=red>Lưu ý : Đây là mốc tích lũy cường hóa cứ mỗi 1000 Vạn đồng bạn sẽ rút lần chuyển được , sau khi rút tích lũy sẽ về 0<color>\nLượt rút Cường Hóa của bạn còn: <color=cyan>"..nCount.."<color>";
	local tbOpt = 
	{
		{"Rút 1 Lần", self.laychuyen, self},
		{"Trở lại", self.OnDialog, self},
   		{"Kết thúc đối thoại"}
	};
	Dialog:Say(szMsg,tbOpt)
end
function tbRutCuongHoa:laychuyen()
local TichCHRutNap = me.GetTask(3129,1)
local nCount = me.GetTask(3130,1)
if TichCHRutNap >= 1000 then
me.Msg("<color=yellow>Bạn đã rút ra thành công 1 lần chuyển cường hóa<color>");
me.SetTask(3130,1,nCount + 1)
me.SetTask(3129,1,TichCHRutNap - 1000)
else
    Dialog:Say("<color=yellow>Hiện tại tích nạp của bạn "..TichCHRutNap.."/ 1000 vạn đồng\n Bạn còn nạp thiếu hãy mau mau nạp đủ 1000 vạn đồng \n <color=red>Lưu ý : Đây là mốc tích lũy cường hóa cứ mỗi 1000 Vạn đồng bạn sẽ rút lần chuyển được , sau khi rút tích lũy sẽ bị trừ 1000 điểm<color>");
end
end