--Dev : TCQGaming
local tbItemHuiHuangZhiGuo= Item:GetClass("vannientranlo");

function tbItemHuiHuangZhiGuo:OnUse()	--辉煌之果的使用
    local nVanNienTranLo = me.GetTask(9188, 1);
	me.SetTask(9188,1,nVanNienTranLo + 1)
	local nDem = nVanNienTranLo + 1
	me.Msg("Các hạ vừa sử dụng 1 vạn niên trân lộ nâng tổng số lần hái quả vạn niên lên "..nDem.." quả")
	return 1;
end
