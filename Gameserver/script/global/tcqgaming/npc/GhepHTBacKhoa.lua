-- Edit Script
-- TCQGaming
-------------------------------------------------------
local tbBacKhoa ={};
SpecialEvent.GhepHTBacKhoa= tbBacKhoa;

tbBacKhoa.Money_HT2 = 30;
tbBacKhoa.Money_HT3 = 108;
tbBacKhoa.Money_HT4 = 389;
tbBacKhoa.Money_HT5 = 1400;
tbBacKhoa.Money_HT6 = 5039;
tbBacKhoa.Money_HT7 = 18140;
tbBacKhoa.Money_HT8 = 65304;
tbBacKhoa.Money_HT9 = 235093;
tbBacKhoa.Money_HT10 = 846333;
tbBacKhoa.Money_HT11 = 3046799;
tbBacKhoa.Money_HT12 = 10969729;

function tbBacKhoa:OnDialog()
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài Khoản của bạn đang ở trạng thái khóa bảo vệ,nên không thực hiện thao tác được");
        return 0;    
	end

	local nNeedBag = 5;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local szMsg = "Tiêu tốn <color=purple>bạc khóa<color>\n<color>Hãy chọn loại huyền tinh ngươi muốn ghép thành:";

	local tbOpt = {
		{"Ghép thành <color=purple>Huyền Tinh Cấp 2<color>",self.sll1,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 3<color>",self.sll2,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 4<color>",self.sll3,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 5<color>",self.sll4,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 6<color>",self.sll5,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 7<color>",self.sll6,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 8<color>",self.sll7,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 9<color>",self.sll8,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 10<color>",self.sll9,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 11<color>",self.sll10,self};
		{"Ghép thành <color=purple>Huyền Tinh Cấp 12<color>",self.sll11,self};
		{"Kết thúc đối thoại"},
	};
	
	Dialog:Say(szMsg,tbOpt);
end

function tbBacKhoa:sll11()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 11<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 11",self.HuyenTinh12,self};
		{"Ghép 1 HT12",self.On12,self};
		{"Ghép 2 HT12",self.ghep2ht11,self,2};
		{"Ghép 3 HT12",self.ghep2ht11,self,3};
		{"Ghép 4 HT12",self.ghep2ht11,self,4};
		{"Ghép 5 HT12",self.ghep2ht11,self,5};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbBacKhoa:ghep2ht11(nValue)
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>"..nValue.." Huyền Tinh Cấp 12 (Khóa)<color><enter>Tiêu tốn:<enter>- "..nValue*3 .." Huyền Tinh cấp 11<enter>- "..self.Money_HT12*nValue  .." lượng <color=purple> bạc khóa<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOKsl12, self,nValue});
end
--------------GHEP HUYEN TINH-------------------
function tbBacKhoa:OnOKsl12(nValue,tbItemObj)
    local huyentinh9 = "18,1,1,11"; 
    local huyentinhk = "18,1,114,11"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3*nValue then 
    Dialog:Say("Số lượng huyền tinh phải là "..nValue*3 .." Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT12*nValue) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT12*nValue,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,12,nil,nValue);
self:OnDialog();
end

function tbBacKhoa:sll10()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 11<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 10",self.HuyenTinh11,self};
		{"Ghép 1 HT11",self.On11,self};
		{"Ghép 2 HT11",self.ghep2ht10,self,2};
		{"Ghép 3 HT11",self.ghep2ht10,self,3};
		{"Ghép 4 HT11",self.ghep2ht10,self,4};
		{"Ghép 5 HT11",self.ghep2ht10,self,5};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbBacKhoa:ghep2ht10(nValue)
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>"..nValue.." Huyền Tinh Cấp 11 (Khóa)<color><enter>Tiêu tốn:<enter>- "..nValue*3 .." Huyền Tinh cấp 10<enter>- "..self.Money_HT11*nValue  .." lượng <color=purple> bạc khóa<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK211, self,nValue});
end

function tbBacKhoa:OnOpenOK211(nValue,tbItemObj)
    local huyentinh9 = "18,1,1,10"; 
    local huyentinhk = "18,1,114,10"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3*nValue then 
    Dialog:Say("Số lượng huyền tinh phải là "..nValue*3 .." Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT11*nValue) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT11*nValue,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,11,nil,nValue);
self:OnDialog();
end

function tbBacKhoa:sll9()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 10<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 9",self.HuyenTinh10,self};
		{"Ghép 1 HT10",self.On10,self};
		{"Ghép 2 HT10",self.ghep2ht9,self};
		{"Ghép 3 HT10",self.ghep3ht9,self};
		{"Ghép 4 HT10",self.ghep4ht9,self};
		{"Ghép 5 HT10",self.ghep5ht9,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbBacKhoa:ghep2ht9()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 10 (Khóa)<color><enter>Tiêu tốn:<enter>- 6 Huyền Tinh cấp 9<enter>- "..self.Money_HT10.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT9, self});
end
function tbBacKhoa:ghep3ht9()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 10 (Khóa)<color><enter>Tiêu tốn:<enter>- 9 Huyền Tinh cấp 9<enter>- "..self.Money_HT10.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT9, self});
end
function tbBacKhoa:ghep4ht9()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 10 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 9<enter>- "..self.Money_HT10.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT9, self});
end
function tbBacKhoa:ghep5ht9()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 10 (Khóa)<color><enter>Tiêu tốn:<enter>- 15 Huyền Tinh cấp 9<enter>- "..self.Money_HT10.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT9, self});
end

function tbBacKhoa:Open5HT9(tbItemObj)
    local huyentinh9 = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 15 then 
    Dialog:Say("Số lượng huyền tinh phải là 15 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT10 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT10 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,10,nil,5);
self:OnDialog();
end

function tbBacKhoa:Open4HT9(tbItemObj)
    local huyentinh9 = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT10 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT10 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,10,nil,4);
self:OnDialog();
end

function tbBacKhoa:Open3HT9(tbItemObj)
    local huyentinh9 = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 9 then 
    Dialog:Say("Số lượng huyền tinh phải là 9 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT10 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT10 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,10,nil,3);
self:OnDialog();
end

function tbBacKhoa:Open2HT9(tbItemObj)
    local huyentinh9 = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 6 then 
    Dialog:Say("Số lượng huyền tinh phải là 6 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT10 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT10 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,10,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll8()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 9<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 8",self.HuyenTinh9,self};
		{"Ghép 1 HT 9",self.On9,self};
		{"Ghép 2 HT 9",self.ghep2ht8,self};
		{"Ghép 3 HT 9",self.ghep3ht8,self};
		{"Ghép 4 HT 9",self.ghep4ht8,self};
		{"Ghép 5 HT 9",self.ghep5ht8,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbBacKhoa:ghep2ht8()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 9 (Khóa)<color><enter>Tiêu tốn:<enter>- 6 Huyền Tinh cấp 8<enter>- "..self.Money_HT9.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT8, self});
end
function tbBacKhoa:ghep3ht8()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 9 (Khóa)<color><enter>Tiêu tốn:<enter>- 9 Huyền Tinh cấp 8<enter>- "..self.Money_HT9.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT8, self});
end
function tbBacKhoa:ghep4ht8()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 9 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 8<enter>- "..self.Money_HT9.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT8, self});
end
function tbBacKhoa:ghep5ht8()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 9 (Khóa)<color><enter>Tiêu tốn:<enter>- 15 Huyền Tinh cấp 8<enter>- "..self.Money_HT9.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT8, self});
end

function tbBacKhoa:Open5HT8(tbItemObj)
    local huyentinh9 = "18,1,1,8"; 
    local huyentinhk = "18,1,114,8"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 15 then 
    Dialog:Say("Số lượng huyền tinh phải là 15 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT9 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT9 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,9,nil,5);
self:OnDialog();
end

function tbBacKhoa:Open4HT8(tbItemObj)
    local huyentinh9 = "18,1,1,8"; 
    local huyentinhk = "18,1,114,8"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT9 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT9 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,9,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT8(tbItemObj)
    local huyentinh9 = "18,1,1,8"; 
    local huyentinhk = "18,1,114,8"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 9 then 
    Dialog:Say("Số lượng huyền tinh phải là 9 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT9 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT9 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,9,nil,3);
self:OnDialog();
end

function tbBacKhoa:Open2HT8(tbItemObj)
    local huyentinh9 = "18,1,1,8"; 
    local huyentinhk = "18,1,114,8"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 6 then 
    Dialog:Say("Số lượng huyền tinh phải là 6 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT9 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT9 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,9,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll7()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 8<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 7",self.HuyenTinh8,self};
		-- {"1",self.On8,self};
		-- {"2",self.ghep2ht7,self};
		-- {"3",self.ghep3ht7,self};
		-- {"4",self.ghep4ht7,self};
		-- {"5",self.ghep5ht7,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht7()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 8 (Khóa)<color><enter>Tiêu tốn:<enter>- 6 Huyền Tinh cấp 7<enter>- "..self.Money_HT8.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT7, self});
end
function tbBacKhoa:ghep3ht7()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 8 (Khóa)<color><enter>Tiêu tốn:<enter>- 9 Huyền Tinh cấp 7<enter>- "..self.Money_HT8.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT7, self});
end
function tbBacKhoa:ghep4ht7()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 8 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 7<enter>- "..self.Money_HT8.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT7, self});
end
function tbBacKhoa:ghep5ht7()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 8 (Khóa)<color><enter>Tiêu tốn:<enter>- 15 Huyền Tinh cấp 7<enter>- "..self.Money_HT8.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT7, self});
end

function tbBacKhoa:Open5HT7(tbItemObj)
    local huyentinh9 = "18,1,1,7"; 
    local huyentinhk = "18,1,114,7"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 15 then 
    Dialog:Say("Số lượng huyền tinh phải là 15 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT8 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT8 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,8,nil,5);
self:OnDialog();
end
function tbBacKhoa:Open4HT7(tbItemObj)
    local huyentinh9 = "18,1,1,7"; 
    local huyentinhk = "18,1,114,7"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT8 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT8 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,8,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT7(tbItemObj)
    local huyentinh9 = "18,1,1,7"; 
    local huyentinhk = "18,1,114,7"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 9 then 
    Dialog:Say("Số lượng huyền tinh phải là 9 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT8 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT8 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,8,nil,3);
self:OnDialog();
end
function tbBacKhoa:Open2HT7(tbItemObj)
    local huyentinh9 = "18,1,1,7"; 
    local huyentinhk = "18,1,114,7"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 6 then 
    Dialog:Say("Số lượng huyền tinh phải là 6 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT8 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT8 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,8,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll6()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 7<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 6",self.HuyenTinh7,self};
		-- {"1",self.On7,self};
		-- {"2",self.ghep2ht6,self};
		-- {"3",self.ghep3ht6,self};
		-- {"4",self.ghep4ht6,self};
		-- {"5",self.ghep5ht6,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht6()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 7 (Khóa)<color><enter>Tiêu tốn:<enter>- 6 Huyền Tinh cấp 6<enter>- "..self.Money_HT7.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT6, self});
end
function tbBacKhoa:ghep3ht6()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 7 (Khóa)<color><enter>Tiêu tốn:<enter>- 9 Huyền Tinh cấp 6<enter>- "..self.Money_HT7.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT6, self});
end
function tbBacKhoa:ghep4ht6()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 7 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 6<enter>- "..self.Money_HT7.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT6, self});
end
function tbBacKhoa:ghep5ht6()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 7 (Khóa)<color><enter>Tiêu tốn:<enter>- 15 Huyền Tinh cấp 6<enter>- "..self.Money_HT7.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT6, self});
end
function tbBacKhoa:Open5HT6(tbItemObj)
    local huyentinh9 = "18,1,1,6"; 
    local huyentinhk = "18,1,114,6"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 15 then 
    Dialog:Say("Số lượng huyền tinh phải là 15 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT7 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT7 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,7,nil,5);
self:OnDialog();
end
function tbBacKhoa:Open4HT6(tbItemObj)
    local huyentinh9 = "18,1,1,6"; 
    local huyentinhk = "18,1,114,6"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT7 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT7 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,7,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT6(tbItemObj)
    local huyentinh9 = "18,1,1,6"; 
    local huyentinhk = "18,1,114,6"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 9 then 
    Dialog:Say("Số lượng huyền tinh phải là 9 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT7 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT7 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,7,nil,3);
self:OnDialog();
end
function tbBacKhoa:Open2HT6(tbItemObj)
    local huyentinh9 = "18,1,1,6"; 
    local huyentinhk = "18,1,114,6"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 6 then 
    Dialog:Say("Số lượng huyền tinh phải là 6 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT7 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT7 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,7,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll5()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 6<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 5",self.HuyenTinh6,self};
		-- {"1",self.On6,self};
		-- {"2",self.ghep2ht5,self};
		-- {"3",self.ghep3ht5,self};
		-- {"4",self.ghep4ht5,self};
		-- {"5",self.ghep5ht5,self};
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht5()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 6 (Khóa)<color><enter>Tiêu tốn:<enter>- 6 Huyền Tinh cấp 5<enter>- "..self.Money_HT6.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT5, self});
end
function tbBacKhoa:ghep3ht5()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 6 (Khóa)<color><enter>Tiêu tốn:<enter>- 9 Huyền Tinh cấp 5<enter>- "..self.Money_HT6.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT5, self});
end
function tbBacKhoa:ghep4ht5()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 6 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 5<enter>- "..self.Money_HT6.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT5, self});
end
function tbBacKhoa:ghep5ht5()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 6 (Khóa)<color><enter>Tiêu tốn:<enter>- 15 Huyền Tinh cấp 5<enter>- "..self.Money_HT6.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT5, self});
end
function tbBacKhoa:Open5HT5(tbItemObj)
    local huyentinh9 = "18,1,1,5"; 
    local huyentinhk = "18,1,114,5"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 15 then 
    Dialog:Say("Số lượng huyền tinh phải là 15 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT6 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT6 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,6,nil,5);
self:OnDialog();
end
function tbBacKhoa:Open4HT5(tbItemObj)
    local huyentinh9 = "18,1,1,5"; 
    local huyentinhk = "18,1,114,5"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT6 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT6 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,6,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT5(tbItemObj)
    local huyentinh9 = "18,1,1,5"; 
    local huyentinhk = "18,1,114,5"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 9 then 
    Dialog:Say("Số lượng huyền tinh phải là 9 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT6 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT6 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,6,nil,3);
self:OnDialog();
end
function tbBacKhoa:Open2HT5(tbItemObj)
    local huyentinh9 = "18,1,1,5"; 
    local huyentinhk = "18,1,114,5"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 6 then 
    Dialog:Say("Số lượng huyền tinh phải là 6 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT6 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT6 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,6,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll4()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 5<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép tất cả Huyền Tinh 4 \n<color=yellow>Tối đa hành trang 104v HT 4",self.HuyenTinh5,self};
		-- {"Ghép 1 Viên",self.On5,self};----Ghép 1 viên
		-- {"Ghép 2 Viên",self.ghep2ht4,self};
		-- {"Ghép 3 Viên",self.ghep3ht4,self};
		-- {"4",self.ghep4ht4,self};
		-- {"5",self.ghep5ht4,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht4()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 5 (Khóa)<color><enter>Tiêu tốn:<enter>- 8 Huyền Tinh cấp 4<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT4, self});
end
function tbBacKhoa:ghep3ht4()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 5 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 4<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT4, self});
end
function tbBacKhoa:ghep4ht4()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 5 (Khóa)<color><enter>Tiêu tốn:<enter>- 16 Huyền Tinh cấp 4<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT4, self});
end
function tbBacKhoa:ghep5ht4()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 5 (Khóa)<color><enter>Tiêu tốn:<enter>- 20 Huyền Tinh cấp 4<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT4, self});
end
function tbBacKhoa:Open5HT4(tbItemObj)
    local huyentinh9 = "18,1,1,4"; 
    local huyentinhk = "18,1,114,4"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 20 then 
    Dialog:Say("Số lượng huyền tinh phải là 20 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT5 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT5 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,5,nil,5);
self:OnDialog();
end
function tbBacKhoa:Open4HT4(tbItemObj)
    local huyentinh9 = "18,1,1,4"; 
    local huyentinhk = "18,1,114,4"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 16 then 
    Dialog:Say("Số lượng huyền tinh phải là 16 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT5 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT5 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,5,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT4(tbItemObj)
    local huyentinh9 = "18,1,1,4"; 
    local huyentinhk = "18,1,114,4"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT5 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT5 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,5,nil,3);
self:OnDialog();
end

function tbBacKhoa:Open2HT4(tbItemObj)
    local huyentinh9 = "18,1,1,4"; 
    local huyentinhk = "18,1,114,4"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 8 then 
    Dialog:Say("Số lượng huyền tinh phải là 8 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT5 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT5 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,5,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll3()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 4<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 3",self.HuyenTinh4,self};
		-- {"1",self.On4,self};
		-- {"2",self.ghep2ht3,self};
		-- {"3",self.ghep3ht3,self};
		-- {"4",self.ghep4ht3,self};
		-- {"5",self.ghep5ht3,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht3()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 4 (Khóa)<color><enter>Tiêu tốn:<enter>- 8 Huyền Tinh cấp 3<enter>- "..self.Money_HT4.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT3, self});
end
function tbBacKhoa:ghep3ht3()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 4 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 3<enter>- "..self.Money_HT4.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT3, self});
end
function tbBacKhoa:ghep4ht3()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 4 (Khóa)<color><enter>Tiêu tốn:<enter>- 16 Huyền Tinh cấp 3<enter>- "..self.Money_HT4.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT3, self});
end
function tbBacKhoa:ghep5ht3()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 4 (Khóa)<color><enter>Tiêu tốn:<enter>- 20 Huyền Tinh cấp 3<enter>- "..self.Money_HT4.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT3, self});
end

function tbBacKhoa:Open5HT3(tbItemObj)
    local huyentinh9 = "18,1,1,3"; 
    local huyentinhk = "18,1,114,3"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 20 then 
    Dialog:Say("Số lượng huyền tinh phải là 20 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT4 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT4 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,4,nil,5);
self:OnDialog();
end

function tbBacKhoa:Open4HT3(tbItemObj)
    local huyentinh9 = "18,1,1,3"; 
    local huyentinhk = "18,1,114,3"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 16 then 
    Dialog:Say("Số lượng huyền tinh phải là 16 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT4 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT4 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,4,nil,4);
self:OnDialog();
end

function tbBacKhoa:Open3HT3(tbItemObj)
    local huyentinh9 = "18,1,1,3"; 
    local huyentinhk = "18,1,114,3"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT4 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT4 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,4,nil,3);
self:OnDialog();
end

function tbBacKhoa:Open2HT3(tbItemObj)
    local huyentinh9 = "18,1,1,3"; 
    local huyentinhk = "18,1,114,3"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 8 then 
    Dialog:Say("Số lượng huyền tinh phải là 8 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT4 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT4 * 2,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,4,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll2()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 3<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 2",self.HuyenTinh3,self};
		-- {"1",self.On3,self};
		-- {"2",self.ghep2ht2,self};
		-- {"3",self.ghep3ht2,self};
		-- {"4",self.ghep4ht2,self};
		-- {"5",self.ghep5ht2,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbBacKhoa:ghep2ht2()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 3 (Khóa)<color><enter>Tiêu tốn:<enter>- 8 Huyền Tinh cấp 2<enter>- "..self.Money_HT3.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT2, self});
end
function tbBacKhoa:ghep3ht2()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 3 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 2<enter>- "..self.Money_HT3.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT2, self});
end
function tbBacKhoa:ghep4ht2()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 3 (Khóa)<color><enter>Tiêu tốn:<enter>- 16 Huyền Tinh cấp 2<enter>- "..self.Money_HT3.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT2, self});
end
function tbBacKhoa:ghep5ht2()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 3 (Khóa)<color><enter>Tiêu tốn:<enter>- 20 Huyền Tinh cấp 2<enter>- "..self.Money_HT3.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT2, self});
end

function tbBacKhoa:Open5HT2(tbItemObj)
    local huyentinh9 = "18,1,1,2"; 
    local huyentinhk = "18,1,114,2"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 20 then 
    Dialog:Say("Số lượng huyền tinh phải là 20 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT3 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT3 * 5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,3,nil,5);
self:OnDialog();
end

function tbBacKhoa:Open4HT2(tbItemObj)
    local huyentinh9 = "18,1,1,2"; 
    local huyentinhk = "18,1,114,2"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 16 then 
    Dialog:Say("Số lượng huyền tinh phải là 16 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT3 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT3 * 4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,3,nil,4);
self:OnDialog();
end

function tbBacKhoa:Open3HT2(tbItemObj)
    local huyentinh9 = "18,1,1,2"; 
    local huyentinhk = "18,1,114,2"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT3 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT3 * 3,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,3,nil,3);
self:OnDialog();
end

function tbBacKhoa:Open2HT2(tbItemObj)
    local huyentinh9 = "18,1,1,2"; 
    local huyentinhk = "18,1,114,2"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 8 then 
    Dialog:Say("Số lượng huyền tinh phải là 8 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT3 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT3 * 2,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,3,nil,2);
self:OnDialog();
end

function tbBacKhoa:sll1()
	local szMsg = "Hệ thống ghép Huyền Tinh<color=purple> cấp 2<color>, bạn muốn ghép bao nhiêu Huyền Tinh?";

	local tbOpt = {
		{"Ghép nhanh tất cả Huyền Tinh 1",self.HuyenTinh2,self};
		-- {"1",self.On2,self};
		-- {"2",self.ghep2ht1,self};
		-- {"3",self.ghep3ht1,self};
		-- {"4",self.ghep4ht1,self};
		-- {"5",self.ghep5ht1,self};
		{"Kết thúc đối thoại"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbBacKhoa:HuyenTinh2()
---check số lượng
	local nCapHuyen = 1;
	local nCapLenHt = 2;
	local nSoBacKhoa = 30;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:ghep2ht1()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>2 Huyền Tinh Cấp 2 (Khóa)<color><enter>Tiêu tốn:<enter>- 8 Huyền Tinh cấp 1<enter>- "..self.Money_HT2.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open2HT1, self});
end
function tbBacKhoa:ghep3ht1()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>3 Huyền Tinh Cấp 2 (Khóa)<color><enter>Tiêu tốn:<enter>- 12 Huyền Tinh cấp 1<enter>- "..self.Money_HT2.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open3HT1, self});
end
function tbBacKhoa:ghep4ht1()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>4 Huyền Tinh Cấp 2 (Khóa)<color><enter>Tiêu tốn:<enter>- 16 Huyền Tinh cấp 1<enter>- "..self.Money_HT2.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open4HT1, self});
end
function tbBacKhoa:ghep5ht1()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>5 Huyền Tinh Cấp 2 (Khóa)<color><enter>Tiêu tốn:<enter>- 20 Huyền Tinh cấp 1<enter>- "..self.Money_HT2.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.Open5HT1, self});
end
function tbBacKhoa:Open5HT1(tbItemObj)
    local huyentinh9 = "18,1,1,1"; 
    local huyentinhk = "18,1,114,1"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 20 then 
    Dialog:Say("Số lượng huyền tinh phải là 20 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT2 * 5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT2 * 5,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,2,nil,5);
self:OnDialog();
end
function tbBacKhoa:Open4HT1(tbItemObj)
    local huyentinh9 = "18,1,1,1"; 
    local huyentinhk = "18,1,114,1"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 16 then 
    Dialog:Say("Số lượng huyền tinh phải là 16 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT2 * 4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT2 * 4,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,2,nil,4);
self:OnDialog();
end
function tbBacKhoa:Open3HT1(tbItemObj)
    local huyentinh9 = "18,1,1,1"; 
    local huyentinhk = "18,1,114,1"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 12 then 
    Dialog:Say("Số lượng huyền tinh phải là 12 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT2 * 3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT2 * 3,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,2,nil,3);
self:OnDialog();
end
function tbBacKhoa:Open2HT1(tbItemObj)
    local huyentinh9 = "18,1,1,1"; 
    local huyentinhk = "18,1,114,1"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 8 then 
    Dialog:Say("Số lượng huyền tinh phải là 8 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT2 * 2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT2 * 2,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddStackItem(18,1,114,2,nil,2);
self:OnDialog();
end

function tbBacKhoa:On2()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 2 (Khóa)<color><enter>Tiêu tốn:<enter>- 4 Huyền Tinh cấp 1<enter>- "..self.Money_HT2.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK2, self});
end

function tbBacKhoa:On3()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 3 (Khóa)<color><enter>Tiêu tốn:<enter>- 4 Huyền Tinh cấp 2<enter>- "..self.Money_HT3.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK3, self});
end

function tbBacKhoa:On4()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 4 (Khóa)<color><enter>Tiêu tốn:<enter>- 4 Huyền Tinh cấp 3<enter>- "..self.Money_HT4.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK4, self});
end
function tbBacKhoa:On5()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 5 (Khóa)<color><enter>Tiêu tốn:<enter>- 4 Huyền Tinh cấp 4<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK5, self});
end

function tbBacKhoa:On6()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 6 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 5<enter>- "..self.Money_HT5.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK6, self});
end

function tbBacKhoa:On7()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 7 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 6<enter>- "..self.Money_HT7.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK7, self});
end
function tbBacKhoa:On8()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 8 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 7<enter>- "..self.Money_HT8.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK8, self});
end

function tbBacKhoa:On9()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 9 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 8<enter>- "..self.Money_HT9.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK9, self});
end
function tbBacKhoa:On10()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 10 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 9<enter>- "..self.Money_HT10.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK10, self});
end

function tbBacKhoa:On11()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 11 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 10<enter>- "..self.Money_HT11.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK11, self});
end

function tbBacKhoa:On12()
    Dialog:OpenGift("Xem trước:<enter>Chắc chắn nhận được <color=purple>1 Huyền Tinh Cấp 12 (Khóa)<color><enter>Tiêu tốn:<enter>- 3 Huyền Tinh cấp 11<enter>- "..self.Money_HT12.." lượng <color=purple> bạc khóa / 1 HT<color><enter>Hãy đặt vào Huyền Tinh theo yêu cầu", nil ,{self.OnOpenOK12, self});
end
--------------GHEP HUYEN TINH-------------------
function tbBacKhoa:OnOpenOK12(tbItemObj)
    local huyentinh9 = "18,1,1,11"; 
    local huyentinhk = "18,1,114,11"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT12) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT12);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,12);
self:OnDialog();
end

function tbBacKhoa:OnOpenOK11(tbItemObj)
    local huyentinh9 = "18,1,1,10"; 
    local huyentinhk = "18,1,114,10"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT11) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT11,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,11);
self:OnDialog();
end

function tbBacKhoa:OnOpenOK9(tbItemObj)
    local huyentinh9 = "18,1,1,8"; 
    local huyentinhk = "18,1,114,8"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT9) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT9,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,9);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK8(tbItemObj)
    local huyentinh9 = "18,1,1,7"; 
    local huyentinhk = "18,1,114,7"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT8) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT8,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,8);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK7(tbItemObj)
    local huyentinh9 = "18,1,1,6"; 
    local huyentinhk = "18,1,114,6"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT7) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT7,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,7);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK6(tbItemObj)
    local huyentinh9 = "18,1,1,5"; 
    local huyentinhk = "18,1,114,5"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT6) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT6,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,6);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK5(tbItemObj)
    local huyentinh9 = "18,1,1,4"; 
    local huyentinhk = "18,1,114,4"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 4 then 
    Dialog:Say("Số lượng huyền tinh phải là 4 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT5) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT5,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,5);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK4(tbItemObj)
    local huyentinh9 = "18,1,1,3"; 
    local huyentinhk = "18,1,114,3"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 4 then 
    Dialog:Say("Số lượng huyền tinh phải là 4 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT4) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT4,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,4);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK3(tbItemObj)
    local huyentinh9 = "18,1,1,2"; 
    local huyentinhk = "18,1,114,2"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 4 then 
    Dialog:Say("Số lượng huyền tinh phải là 4 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
	
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT3) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT3,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,3);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK2(tbItemObj)
    local huyentinh9 = "18,1,1,1"; 
    local huyentinhk = "18,1,114,1"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 4 then 
    Dialog:Say("Số lượng huyền tinh phải là 4 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 

---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT2) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT2,0);

    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
	
    me.AddItem(18,1,114,2);
self:OnDialog();
end
function tbBacKhoa:OnOpenOK10(tbItemObj)
    local huyentinh9 = "18,1,1,9"; 
    local huyentinhk = "18,1,114,9"; 
--check vật phẩm
    for i = 1, #tbItemObj do 
    local pItem = tbItemObj[i][1]; 
    local szKey = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    local szKeyy = string.format("%s,%s,%s,%s",pItem.nGenre,pItem.nDetail,pItem.nParticular,pItem.nLevel); 
    if szKey ~= huyentinh9 and szKeyy ~= huyentinhk then 
    Dialog:Say("Vật phẩm bạn bỏ vào không phải Huyền Tinh", {"Kết thúc đối thoại !"}); 
	return 0;
    end 
    end 
---check số lượng
    local nCount = 0;
    for i = 1, #tbItemObj do 
    nCount = nCount + tbItemObj[i][1].nCount; 
    end 

    if nCount ~= 3 then 
    Dialog:Say("Số lượng huyền tinh phải là 3 Huyền Tinh", {"Kết thúc đối thoại !"}); 
    return 0; 
    end 
---check bạc khóa
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < self.Money_HT10) then
    Dialog:Say("Bạn không đủ bạc khóa, hãy thu thập thêm bạc khóa để ghép", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(self.Money_HT10,0);
	
    for _, pItem in pairs(tbItemObj) do
        if me.DelItem(pItem[1]) ~= 1 then
            return 0;
        end
    end
    me.AddItem(18,1,114,10);
self:OnDialog();
end

function tbBacKhoa:HuyenTinh12()
---check số lượng
	local nCapHuyen = 11;
	local nCapLenHt = 12;
	local nSoBacKhoa = 10969729;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh11()
---check số lượng
	local nCapHuyen = 10;
	local nCapLenHt = 11;
	local nSoBacKhoa = 3046799;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh10()
---check số lượng
	local nCapHuyen = 9;
	local nCapLenHt = 10;
	local nSoBacKhoa = 846333;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh9()
---check số lượng
	local nCapHuyen = 8;
	local nCapLenHt = 9;
	local nSoBacKhoa = 235093;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh8()
---check số lượng
	local nCapHuyen = 7;
	local nCapLenHt = 8;
	local nSoBacKhoa = 65304;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh7()
---check số lượng
	local nCapHuyen = 6;
	local nCapLenHt = 7;
	local nSoBacKhoa = 18140;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh6()
---check số lượng
	local nCapHuyen = 5;
	local nCapLenHt = 6;
	local nSoBacKhoa = 5039;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh5()
---check số lượng
	local nCapHuyen = 4;
	local nCapLenHt = 5;
	local nSoBacKhoa = 1400;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh4()
---check số lượng
	local nCapHuyen = 3;
	local nCapLenHt = 4;
	local nSoBacKhoa = 389;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end

function tbBacKhoa:HuyenTinh3()
---check số lượng
	local nCapHuyen = 2;
	local nCapLenHt = 3;
	local nSoBacKhoa = 108;
	local nHtkhoa = me.GetItemCountInBags(18,1,114,nCapHuyen) -- mảnh ghép chúc phúc
	local nKokhoa = me.GetItemCountInBags(18,1,1,nCapHuyen) -- mảnh ghép chúc phúc
	local nCount = nHtkhoa + nKokhoa;
	if nCount < 3 then
        Dialog:Say("Không đủ Huyền Tinh cấp "..nCapHuyen.." để ghép");
		return 0;
	end

	local nCheck = 0;
	if nCount >= 3 and nCount < 6 then
	nCheck = 1;
	elseif nCount >= 6 and nCount < 9 then
	nCheck = 2;
	elseif nCount >= 9 and nCount < 12 then
	nCheck = 3;
	elseif nCount >= 12 and nCount < 15 then
	nCheck = 4;
	elseif nCount >= 15 and nCount < 18 then
	nCheck = 5;
	elseif nCount >= 18 and nCount < 21 then
	nCheck = 6;
	elseif nCount >= 21 and nCount < 24 then
	nCheck = 7;
	elseif nCount >= 24 and nCount < 27 then
	nCheck = 8;
	elseif nCount >= 27 and nCount < 30 then
	nCheck = 9;
	elseif nCount >= 30 and nCount < 33 then
	nCheck = 10;
	elseif nCount >= 33 and nCount < 36 then
	nCheck = 11;
	elseif nCount >= 36 and nCount < 39 then
	nCheck = 12;
	elseif nCount >= 39 and nCount < 42 then
	nCheck = 13;
	elseif nCount >= 42 and nCount < 45 then
	nCheck = 14;
	elseif nCount >= 45 and nCount < 48 then
	nCheck = 15;
	elseif nCount >= 48 and nCount < 51 then
	nCheck = 16;
	elseif nCount >= 51 and nCount < 54 then
	nCheck = 17;
	elseif nCount >= 54 and nCount < 57 then
	nCheck = 18;
	elseif nCount >= 57 and nCount < 60 then
	nCheck = 19;
	elseif nCount >= 60 and nCount < 63 then
	nCheck = 20;
	elseif nCount >= 63 and nCount < 66 then
	nCheck = 21;
	elseif nCount >= 66 and nCount < 69 then
	nCheck = 22;
	elseif nCount >= 69 and nCount < 72 then
	nCheck = 23;
	elseif nCount >= 72 and nCount < 75 then
	nCheck = 24;
	elseif nCount >= 75 and nCount < 78 then
	nCheck = 25;
	elseif nCount >= 78 and nCount < 81 then
	nCheck = 26;
	elseif nCount >= 81 and nCount < 84 then
	nCheck = 27;
	elseif nCount >= 84 and nCount < 87 then
	nCheck = 28;
	elseif nCount >= 87 and nCount < 90 then
	nCheck = 29;
	elseif nCount >= 90 and nCount < 93 then
	nCheck = 30;
	elseif nCount >= 93 and nCount < 96 then
	nCheck = 31;
	elseif nCount >= 96 and nCount < 99 then
	nCheck = 32;
	elseif nCount >= 99 and nCount < 102 then
	nCheck = 33;
	elseif nCount >= 102 and nCount < 105 then
	nCheck = 34;
	elseif nCount >= 105 and nCount < 108 then
	nCheck = 35;
	elseif nCount >= 108 and nCount < 111 then
	nCheck = 36;
	elseif nCount >= 111 and nCount < 114 then
	nCheck = 37;
	elseif nCount >= 114 and nCount < 117 then
	nCheck = 38;
	elseif nCount >= 117 and nCount < 120 then
	nCheck = 39;
	elseif nCount >= 120 then
	nCheck = 40;
	else
	nCheck = 41;
	end

	if nCheck == 41 then
    Dialog:Say("Không kiểm tra được số Huyền tinh trong hành trang, liên hệ GM", {"Kết thúc đối thoại !"}); 
	return 0;
	end

    if me.CountFreeBagCell() < 1 then
        local szAnnouce = "Cần chuẩn bị <color=purple> 1 ô trống<color> hành trang";
        Dialog:Say(szAnnouce);
        return 0;    
    end

---check bạc khóa
	if nKokhoa > nHtkhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nHtkhoa;
	local tbItemId1	= {18,1,114,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nHtkhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 1, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa > nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	elseif nHtkhoa == nKokhoa then
	local nMyMoney = me.GetBindMoney();
	if (nMyMoney < nSoBacKhoa * nCheck) then
    Dialog:Say("Để ghép thành "..nCheck.." Huyền tinh cấp "..nCapLenHt.." cần "..nSoBacKhoa*nCheck.." Bạc khóa", {"Kết thúc đối thoại !"}); 
    return 0; 
	end
	me.CostBindMoney(nSoBacKhoa * nCheck,0);
	local nHuyenTinh = nCheck * 3;
	local nKoHuyenTinh = nHuyenTinh - nKokhoa;
	local tbItemId1	= {18,1,1,nCapHuyen,0,0}; -- mảnh ghép chúc phúc
	Task:DelItem(me, tbItemId1, nKokhoa);
	me.ConsumeItemInBags(nKoHuyenTinh, 18, 1, 114, nCapHuyen);
    me.AddStackItem(18,1,114,nCapLenHt,nil,nCheck);
	me.Msg("Ghép thành công <color=purple>"..nCheck.." Huyền Tinh "..nCapLenHt.."<color>, tiêu hao <color=purple>"..nHuyenTinh.." Huyền Tinh "..nCapHuyen.."<color> và <color=purple>"..nSoBacKhoa*nCheck.." bạc khóa<color>");
	self:OnDialog();
	end
end


