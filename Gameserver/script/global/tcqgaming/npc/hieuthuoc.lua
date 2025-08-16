
local tbNpc = Npc:GetClass("yaopulaoban");
function tbNpc:OnDialog()
-- DoScript("\\script\\global\\tcqgaming\\npc\\hieuthuoc.lua");
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản của bạn bị khóa, không thể thực hiện thao tác này!");
		return;
	end

	local szMsg = "Những năm gần đây cục thế biến loạn nhưng tiệm thuốc của ta lại làm ăn ngày càng phát đạt, ta nên vui hay nên buồn đây…Thật mong sao phi phong của Tạ Hiền có thể thay đổi thời cuộc này"
	    local tbOpt =     {} 
			--	table.insert(tbOpt, {"<color=gold>[Bạc khóa]<color> Dược phẩm",self.duocpham,self});
				table.insert(tbOpt, {"<color=gold>[Mua máu]<color> Toàn tổ đội<color>",self.muamaunhanh,self});
			--	table.insert(tbOpt, {"Dược phẩm",self.duocpham1,self});
				table.insert(tbOpt, {"Thuốc",self.thuoc,self});

			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function tbNpc:duocpham()
me.OpenShop(14, 7);
end 

function tbNpc:duocpham1()
me.OpenShop(14, 1);
end 

function tbNpc:thuoc()
me.OpenShop(18, 1);
end 

function tbNpc:muamaunhanh()
CTC_7_Thanh:MuaMauNhanh()
end 
