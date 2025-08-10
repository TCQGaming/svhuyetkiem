
local tbMapPhuongTuong = Map:GetClass(24); -- µØÍ¼Id


function tbMapPhuongTuong:OnEnter(szParam)
	
end;

function tbMapPhuongTuong:OnLeave(szParam)
	
end;
local tbTrapMapLongMon	= tbMapPhuongTuong:GetTrapClass("to_longmenzhen")----Long Môn Trấn
function tbTrapMapLongMon:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(24, 1764, 3538);
	return 0 
	else 
		me.NewWorld(2, 1737, 3728);
	end
end;
 
local tbTrapMapConLon	= tbMapPhuongTuong:GetTrapClass("to_kunlunpai")
function tbTrapMapConLon:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(24, 1764, 3538);
	return 0 
	else 
		me.NewWorld(12, 1600, 3234);
	end
end;

local tbTrapMapSamac	= tbMapPhuongTuong:GetTrapClass("to_xixiayipintang")-----Tây Hạ Nhất Phẩm Đường
function tbTrapMapSamac:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(24, 1764, 3538);
	return 0 
	else 
		me.NewWorld(13, 1554, 3382);
	end
end;

local tbTrapMapSamac1	= tbMapPhuongTuong:GetTrapClass("to_dasanguan")----Đại Tán Quan
function tbTrapMapSamac1:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(24, 1764, 3538);
	return 0 
	else 
		me.NewWorld(87, 1596, 3382);
	end 
end;

local tbTrapMapSamac2	= tbMapPhuongTuong:GetTrapClass("to_juyanze")-----Cư Diên Trạch 65
function tbTrapMapSamac2:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.SetFightState(0);
	me.NewWorld(24, 1764, 3538);
	return 0 
	else 
		me.NewWorld(94, 1778, 3968);
	end 
end;

local tbTrapMapSamac3	= tbMapPhuongTuong:GetTrapClass("to_shamomigong")------Mê cung sa mạc
function tbTrapMapSamac3:OnPlayer()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeOpenSever then
		Dialog:Say(ConfigAll.ThongBao)
	me.NewWorld(24, 1764, 3538);
	me.SetFightState(0);
	return 0 
	else 
		me.NewWorld(101, 1616, 3872);
	end
end;

