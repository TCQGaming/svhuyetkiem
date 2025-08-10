-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbRuongNgoc = Item:GetClass("ruongngoc");

function tbRuongNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\ruongngoc.lua");
	local nMoKhamNam = ConfigAll.OpenKham
		if nMoKhamNam == 0 then 
	Dialog:Say("Tính năng khảm nạm chưa mở");
	return 0;
	end 
	local nLevel = it.nLevel
	local nRandom = MathRandom(1,19)
	if nRandom == 1 then 
		me.AddStackItem(18,1,1300,nLevel,nil,1)
	elseif nRandom == 2 then 
			me.AddStackItem(18,1,1301,nLevel,nil,1)
	elseif nRandom == 3 then 
				me.AddStackItem(18,1,1302,nLevel,nil,1)
	elseif nRandom == 4 then 
					me.AddStackItem(18,1,1304,nLevel,nil,1)
	elseif nRandom == 5 then 
						me.AddStackItem(18,1,1305,nLevel,nil,1)
	elseif nRandom == 6 then 
							me.AddStackItem(18,1,1306,nLevel,nil,1)
	elseif nRandom == 7 then 
							me.AddStackItem(18,1,1307,nLevel,nil,1)
	elseif nRandom == 8 then 
							me.AddStackItem(18,1,1308,nLevel,nil,1)
	elseif nRandom == 9 then 
							me.AddStackItem(18,1,1309,nLevel,nil,1)
	elseif nRandom == 10 then 
							me.AddStackItem(18,1,1310,nLevel,nil,1)
	elseif nRandom == 11 then 
							me.AddStackItem(18,1,1311,nLevel,nil,1)
	elseif nRandom == 12 then 
							me.AddStackItem(18,1,1312,nLevel,nil,1)
	elseif nRandom == 13 then 
							me.AddStackItem(18,1,1313,nLevel,nil,1)
	elseif nRandom == 14 then 
							me.AddStackItem(18,1,1314,nLevel,nil,1)
	elseif nRandom == 15 then 
							me.AddStackItem(18,1,1315,nLevel,nil,1)
	elseif nRandom == 16 then 
							me.AddStackItem(18,1,1316,nLevel,nil,1)
	elseif nRandom == 17 then 
							me.AddStackItem(18,1,1317,nLevel,nil,1)
	elseif nRandom == 18 then 
							me.AddStackItem(18,1,1318,nLevel,nil,1)
	elseif nRandom == 19 then 
							me.AddStackItem(18,1,1319,nLevel,nil,1)
end
return 1
end
