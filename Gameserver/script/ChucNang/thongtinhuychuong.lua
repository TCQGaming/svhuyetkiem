Require("\\script\\misc\\c2scall.lua")
function c2s:UpdateInforHuyChuongPlayer(Name)
	local nPlayerId = KGCPlayer.GetPlayerIdByName(Name);
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if not pPlayer then
		return 0
	end	
	local nLevelcovat = pPlayer.GetSkillLevel(1992)
	---
	if nLevelcovat < 0 then
		nLevelcovat = 0;
	end
me.CallClientScript({"Ui:ServerCall", "UI_VIEWPLAYER", "TCQGaming",nLevelcovat});
end