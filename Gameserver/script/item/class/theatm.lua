
local tbATM = Item:GetClass("theatmviphaha");

function tbATM:OnUse()	
DoScript("\\script\\item\\class\\theatm.lua");
    local SoDong = me.AddJbCoin(10000);
    local nCount = me.GetTask(3026, 1);
    me.SetTask(3026, 1, nCount + SoDong)
	local nCountt = me.GetTask(3026, 1);
	me.Msg("<color=yellow>Bạn đã nhận được " .. SoDong .." vạn đồng vào mốc nạp<color> - Tổng số đồng tích lũy được là <color=red>"..nCountt.."<color> vạn đồng");
	return 1;
end

