
local KnbSmal = Item:GetClass("knbsmall");

function KnbSmal:OnUse()	
	me.AddJbCoin(10000);
	me.Msg("Bạn nhận được <color=gold>1 vạn đồng<color>");
	return 1;
end

