
SpecialEvent.tbNgungTuChanNguyen = SpecialEvent.tbNgungTuChanNguyen or {};
local tbNgungTu = SpecialEvent.tbNgungTuChanNguyen;

function tbNgungTu:OnDialog()
	if (Partner.bOpenPartner ~= 1) then
		Dialog:Say("Tính năng đồng hành chưa mở.vui lòng thử lại sau");
		return 0;
	end
	
	local szMsg = "Cần chọn Đồng Hành cần ngưng tụ";
	local tbOpt = {};
	for i = 1, me.nPartnerCount do
		local pPartner = me.GetPartner(i - 1);
		
		if pPartner and pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_LEVEL) == 1 then
			table.insert(tbOpt, {pPartner.szName, self.InsertAPartners, self, i - 1});
		end
	end
	if #tbOpt == 0 then
		me.Msg("Hiện tại bạn không có đồng hành!");
		Dialog:Say("Hiện tại bạn không có đồng hành!");
		return 0;
	end
	
	table.insert(tbOpt, {"Hủy bỏ"});
	Dialog:Say(szMsg, tbOpt);
	return 0;
	
end

function tbNgungTu:InsertAPartners(nParam)
	local pPartner = me.GetPartner(nParam);
	if not pPartner then
		return;
	end
	
	local nPartnerId = pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_TEMPID);
	if (nPartnerId == 241) then -- Diệp tịnh
		me.AddStackItem(1,24,1,1,{bForceBind=1},1);
		me.DeletePartner(pPartner.nPartnerIndex);
	elseif(nPartnerId == 193) or (nPartnerId == 249) or(nPartnerId == 251) then
		me.AddStackItem(1,24,2,1,{bForceBind=1},1); -- Bảo Ngọc
	elseif(nPartnerId == 182) or (nPartnerId == 247) then
		me.AddStackItem(1,24,3,1,{bForceBind=1},1); -- Hạ Tiểu Sảnh
		me.DeletePartner(pPartner.nPartnerIndex);
	elseif(nPartnerId == 194) then
		me.AddStackItem(1,24,4,1,{bForceBind=1},1); -- Oanh Oanh
		me.DeletePartner(pPartner.nPartnerIndex);
	elseif(nPartnerId == 181) or (nPartnerId == 256)then
		me.AddStackItem(1,24,5,1,{bForceBind=1},1); -- Mộc Siêu
		me.DeletePartner(pPartner.nPartnerIndex);
	elseif(nPartnerId == 177) or (nPartnerId == 252) or (nPartnerId == 253) then
		me.AddStackItem(1,24,6,1,{bForceBind=1},1); -- Tử Uyển
		me.DeletePartner(pPartner.nPartnerIndex);
	elseif(nPartnerId == 178)  then
		me.AddStackItem(1,24,7,1,{bForceBind=1},1); -- Trần Trọng
		me.DeletePartner(pPartner.nPartnerIndex);
	else
		Dialog:Say("Hiện tại bạn không có đồng hành tương ứng!");
	return 0;
	end
end