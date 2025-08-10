-- 文件名　：scheduletask.lua
-- 創建者　：sunduoliang
-- 創建時間：2009-04-27 16:10:50
-- 描  述  ：

function Esport:ScheduletaskDragonBoat()
	if Esport.DragonBoat:CheckState() == 1 then
		Esport.DragonBoatConsole:StartSignUp();
	end
end
