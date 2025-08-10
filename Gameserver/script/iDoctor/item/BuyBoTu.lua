-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbBuyBoTu ={};
SpecialEvent.BuyBoTu= tbBuyBoTu;
tbBuyBoTu.So_Luot_Mua = 2;
tbBuyBoTu.Don_Gia_Mua = 1000000;

function tbBuyBoTu:OnDialog()
	local nCount = me.GetTask(3143,1)
	local szMsg = "Tối đa có thể mua: <color=yellow>"..nCount
	.."/"..self.So_Luot_Mua.." cái<color>\n\nGiá bán: <color=yellow>"..self.Don_Gia_Mua
	.." Đồng Thường<color>\n\n";
	local tbOpt = 
	{
		{"Sử dụng đồng để mua", self.tieptucboul, self},
   		{"Tại hạ chưa cần tới, đa tạ !"}
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbBuyBoTu:tieptucboul()
	local szMsg = "Bạn chắc chắn sử dụng <color=green>"..self.Don_Gia_Mua
	.." Đồng Thường<color> để mua 1 Bổ Tu Lệnh?\n\nBổ Tu Lệnh là Lệnh bài đổi môn phái đã phụ tu, KHÔNG THỂ THÊM PHÁI PHỤ TU";
	local tbOpt = 
	{
		{"Đồng ý", self.OkBuyBtl, self},
   		{"Để ta suy nghĩ đã"}
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbBuyBoTu:OkBuyBtl()
    local nNeedBag = 3;
    if me.CountFreeBagCell() < nNeedBag then
        local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
        Dialog:Say(szAnnouce);
        return 0;    
    end
	
--check đồng
	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Don_Gia_Mua) then
	Dialog:Say("Bạn không đủ <color=red> "..self.Don_Gia_Mua.."<color> Đồng thường, Hiện bạn chỉ có <color=yellow>"..nMyCoin.." Đồng thường");
    return 0; 
	end
	local nCount = me.GetTask(3143,1)
	if nCount >= self.So_Luot_Mua then
		me.Msg("Tối đa mỗi nhân vật chỉ được mua <color=green>"..self.So_Luot_Mua.."<color> Bổ Tu Lệnh");
		return 0;
	end
	me.SetTask(3143,1, nCount + 1);
	me.AddJbCoin(-self.Don_Gia_Mua);
	me.AddItem(18,1,479,1).Bind(1); -- bổ tu lệnh
end
