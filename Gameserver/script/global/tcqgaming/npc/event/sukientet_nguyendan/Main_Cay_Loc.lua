local tbCayLoc = Npc:GetClass("cayloc_dauxuan");
local tbItemInfoArray = {}; -- Mảng để lưu thông tin của các vật phẩm
tbCayLoc.HONOR_CLASS_MONEY		= 8;	
tbCayLoc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbCayLoc.HONOR_CLASS_MONEY,
	},
};
function tbCayLoc:OnDialog()
local nDong = 0 
if nDong == 0 then 
	Dialog:Say("Sự kiện đã kết thúc")
return 
end
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < ConfigAll.GioiHanTaiPhu_LauLan then
			Dialog:Say("Bạn không đạt đủ <color=yellow>"..ConfigAll.GioiHanTaiPhu_LauLan.." <color>điểm Tài Phú để tham gia\nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color>");
			return 0;
	end
end
local nSoLan = me.GetTask(9178,80)
	local nGioiHan = me.GetTask(9178,82)
	local nDateNVngay = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(9178,81) ~= nDateNVngay then
		me.SetTask(9178,81, nDateNVngay);
		me.SetTask(9178,80, nSoLan + 2);
		me.SetTask(9178,82, 0);
	me.Msg("<color=yellow>Bạn đã nhận thành công 2 lần lật thiệp mừng xuân")
	end 
    local szMsg = "<color=yellow>Số lượt lật thiệp của bạn hôm nay còn "..nSoLan.." lần"
    local tbOpt = {
        {"<color=yellow>Lật Thiệp Mừng Xuân<color>", self.latthiep, self},
		{"<color=yellow>Mua lượt lật thiệp 10kim<color>", self.mualuot, self},
		{"<color=yellow>Đổi Hòm Tranh Phúc Lộc Thọ<color>", SpecialEvent.tbCayLoc.doitranh,SpecialEvent.tbCayLoc},
		{"<color=yellow>Dùng Tranh Đổi Quà<color>", SpecialEvent.tbCayLoc.doiqua,SpecialEvent.tbCayLoc},
        {"Ta muốn suy nghĩ lại"}
    }
    Dialog:Say(szMsg, tbOpt)
end

function tbCayLoc:mualuot()
local nSoLan = me.GetTask(9178,80)
	local nGioiHan = me.GetTask(9178,82)
	local nDong = me.GetJbCoin()
if nDong < 10*10000 then 
	Dialog:Say("Bạn chưa đủ 10 vạn đồng thường rồi")
return 
end
	if nGioiHan < 3 then 
		me.SetTask(9178,82, nGioiHan + 1);
		me.SetTask(9178,80, nSoLan + 1);
			me.AddJbCoin(-10*10000)
		me.Msg("Bạn đã mua thành công 1 lần lật thiệp tiêu tốn 10 vạn đồng")
	else 
		Dialog:Say("<color=cyan>Hôm nay bạn đã mua tối đa 3 lần")
	return 
	end 
end 

function tbCayLoc:latthiep()
me.CallClientScript({"UiManager:OpenWindow", "UI_LatTheBai"});
end 