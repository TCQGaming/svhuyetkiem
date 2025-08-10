
local KnbBiz = Item:GetClass("knbbig");

function KnbBiz:OnUse()	
	me.AddJbCoin(1000000);
	me.Msg("Bạn nhận được <color=gold>100 Vạn đồng<color>");
	return 1;
end

