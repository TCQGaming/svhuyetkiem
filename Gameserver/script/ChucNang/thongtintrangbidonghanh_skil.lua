Require("\\script\\misc\\c2scall.lua")
function c2s:UpdateSkil_TrangBi_DH(Name)
	local nPlayerId = KGCPlayer.GetPlayerIdByName(Name);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0
	end	
	local nLevelVuKhi = pPlayer.GetSkillLevel(1982)
	local nLevelAo = pPlayer.GetSkillLevel(1983)
	local nLevelNhan = pPlayer.GetSkillLevel(1984)
	local nLevelTay = pPlayer.GetSkillLevel(1985)
	local nLevelPhu = pPlayer.GetSkillLevel(1986)
	---
	local nLevelHangLien = pPlayer.GetSkillLevel(1987)
	local nLevelYeuDai = pPlayer.GetSkillLevel(1988)
	local nLevelChienNgoa = pPlayer.GetSkillLevel(1989)
	local nLevelNgocBoi = pPlayer.GetSkillLevel(1990)
	local nLevelThietKhoi = pPlayer.GetSkillLevel(1991)

	local nLevelCNQ = pPlayer.GetSkillLevel(1979)
	local nLevelNKQ = pPlayer.GetSkillLevel(1980)
	local nLevelHNQ = pPlayer.GetSkillLevel(1981)
	----
	if nLevelNKQ < 0 then
		nLevelNKQ = 0;
	end
	if nLevelCNQ < 0 then
		nLevelCNQ = 0;
	end
	if nLevelHNQ < 0 then
		nLevelHNQ = 0;
	end
	if nLevelVuKhi < 0 then
		nLevelVuKhi = 0;
	end
	if nLevelAo < 0 then 
	nLevelAo = 0
	end
	if nLevelNhan < 0 then 
	nLevelNhan = 0
	end
	if nLevelTay < 0 then 
		nLevelTay = 0
	end
	if nLevelPhu < 0 then 
		nLevelPhu = 0
	end
	if nLevelHangLien < 0 then 
		nLevelHangLien = 0
	end
	if nLevelYeuDai < 0 then 
		nLevelYeuDai = 0
	end
	if nLevelChienNgoa < 0 then 
		nLevelChienNgoa = 0
	end 
	if nLevelNgocBoi < 0 then 
		nLevelNgocBoi = 0
	end 
	if nLevelThietKhoi < 0 then 
		nLevelThietKhoi = 0
end 
	me.CallClientScript({"Ui:ServerCall", "UI_VIEWPLAYER", "UpdateImgLienPet1",nLevelVuKhi,nLevelAo,nLevelNhan,nLevelTay,nLevelPhu,nLevelHangLien,nLevelYeuDai,nLevelChienNgoa,nLevelNgocBoi,nLevelThietKhoi,nLevelCNQ,nLevelNKQ,nLevelHNQ});
end