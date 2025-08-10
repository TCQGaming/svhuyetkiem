
local tbMapBLH = Map:GetClass(8); -- µØÍ¼Id
function tbMapBLH:OnEnter(szParam)
	
end;

function tbMapBLH:OnLeave(szParam)
	
end;

local tbTrapThienVuongBang	= tbMapBLH:GetTrapClass("to_tianwangbang")----Thiên Vương Bang
function tbTrapThienVuongBang:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(22, 1577, 3197);
	end
end;
 
local tbTrapMinhGiao	= tbMapBLH:GetTrapClass("to_mingjiao")-------Minh Giáo
function tbTrapMinhGiao:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
	Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(224, 1466, 3299);
	end
end;

local tbTrapBoHoDongDinh	= tbMapBLH:GetTrapClass("to_dongtinghupan")-----Bờ Hồ Động Đinh
function tbTrapBoHoDongDinh:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(37, 1788, 3255);
	end
end;

local tbTrapNhacDuongLau	= tbMapBLH:GetTrapClass("to_yueyanglou")----nhạc dương lâu
function tbTrapNhacDuongLau:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(45, 1615, 3823);
	end
end;

local tbTrapVuLangSon	= tbMapBLH:GetTrapClass("to_wulingshan")-----Vũ Lăng Sơn
function tbTrapVuLangSon:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(121, 1812, 3358);
	end
end;

local tbTrapTuongDuong	= tbMapBLH:GetTrapClass("to_xiangyangfu")------Tương Dương Phủ
function tbTrapTuongDuong:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(8, 1727, 3386);
	return 0 
	else 
		me.NewWorld(25, 1473, 3299);
	end
end;

