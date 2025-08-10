-----Dev : TCQGaming
-----Time : 11/03/2024 15:30 PM
local tbRuongNgoc = Item:GetClass("ruongngoctuychon");

function tbRuongNgoc:OnUse()	
DoScript("\\script\\global\\tcqgaming\\khamnam\\ruongngoctuychon.lua");
	local nMoKhamNam = ConfigAll.OpenKham
		if nMoKhamNam == 0 then 
	Dialog:Say("Tính năng khảm nạm chưa mở");
	return 0;
	end 
	local nLevel = it.nLevel
local szMsg = "Đại ca muốn nhận loại ngọc nào ?"
    local tbOpt =     {} 
					 table.insert(tbOpt, {"<color=yellow>Thương Lang Ngọc<color>",self.ChonNgoc,self,1,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Hoàng Quang Thạch<color>",self.ChonNgoc,self,2,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Lăng Thiên Ngọc<color>",self.ChonNgoc,self,3,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Phá Thiên Thạch<color>",self.ChonNgoc,self,4,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Băng Phong Thạch<color>",self.ChonNgoc,self,5,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Lôi Đình Ngọc<color>",self.ChonNgoc,self,6,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Kiêu Dương Thạch<color>",self.ChonNgoc,self,7,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Dạ Ma Thạch<color>",self.ChonNgoc,self,8,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Hạ Dương Thạch<color>",self.ChonNgoc,self,9,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Ly Tâm Thạch<color>",self.ChonNgoc,self,10,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Chấn Linh Ngọc<color>",self.ChonNgoc,self,11,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Chấn Lộ Thạch<color>",self.ChonNgoc,self,12,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Tuyết Linh Thạch<color>",self.ChonNgoc,self,13,nLevel});
					 table.insert(tbOpt, {"<color=yellow>U Minh Ngọc<color>",self.ChonNgoc,self,14,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Hỏa Diệm Thạch<color>",self.ChonNgoc,self,15,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Cuồng Lôi Ngọc<color>",self.ChonNgoc,self,16,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Tham Lang Thạch<color>",self.ChonNgoc,self,17,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Huyền Dương Ngọc<color>",self.ChonNgoc,self,18,nLevel});
					 table.insert(tbOpt, {"<color=yellow>Thiên Cơ Thạch<color>",self.ChonNgoc,self,19,nLevel});
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbRuongNgoc:ChonNgoc(nIndex,nLevel)	
 local tbItemId	= {18,1,1322,nLevel,0,0};  
	if nIndex == 1 then 
		me.AddStackItem(18,1,1300,nLevel,nil,1)
	elseif nIndex == 2 then 
			me.AddStackItem(18,1,1301,nLevel,nil,1)
	elseif nIndex == 3 then 
				me.AddStackItem(18,1,1302,nLevel,nil,1)
	elseif nIndex == 4 then 
					me.AddStackItem(18,1,1304,nLevel,nil,1)
	elseif nIndex == 5 then 
						me.AddStackItem(18,1,1305,nLevel,nil,1)
	elseif nIndex == 6 then 
							me.AddStackItem(18,1,1306,nLevel,nil,1)
	elseif nIndex == 7 then 
							me.AddStackItem(18,1,1307,nLevel,nil,1)
	elseif nIndex == 8 then 
							me.AddStackItem(18,1,1308,nLevel,nil,1)
	elseif nIndex == 9 then 
							me.AddStackItem(18,1,1309,nLevel,nil,1)
	elseif nIndex == 10 then 
							me.AddStackItem(18,1,1310,nLevel,nil,1)
	elseif nIndex == 11 then 
							me.AddStackItem(18,1,1311,nLevel,nil,1)
	elseif nIndex == 12 then 
							me.AddStackItem(18,1,1312,nLevel,nil,1)
	elseif nIndex == 13 then 
							me.AddStackItem(18,1,1313,nLevel,nil,1)
	elseif nIndex == 14 then 
							me.AddStackItem(18,1,1314,nLevel,nil,1)
	elseif nIndex == 15 then 
							me.AddStackItem(18,1,1315,nLevel,nil,1)
	elseif nIndex == 16 then 
							me.AddStackItem(18,1,1316,nLevel,nil,1)
	elseif nIndex == 17 then 
							me.AddStackItem(18,1,1317,nLevel,nil,1)
	elseif nIndex == 18 then 
							me.AddStackItem(18,1,1318,nLevel,nil,1)
	elseif nIndex == 19 then 
							me.AddStackItem(18,1,1319,nLevel,nil,1)
end
 Task:DelItem(me, tbItemId, 1); 
end 