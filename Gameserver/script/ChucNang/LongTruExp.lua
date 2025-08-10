--============================================================--
--Phát triển bởi Tình Tính Tang Dev
--SĐT: 0906024054
--Facebook: https://www.facebook.com/duongvantinh19843
--============================================================--
local tbNpc = Npc:GetClass("LongTruExp");
--============================================================--
function tbNpc:AddExp2Player(nPlayerId, nNpcId)
	local szMsg		= "Ngươi có công bảo vệ long trụ, nhận được phần thưởng.";
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	
	local tbTmp		= pNpc.GetTempTable("Npc");
	pPlayer.CastSkill(377, 10, -1, pPlayer.GetNpc().nIndex);
	pPlayer.AddExp(5000);
	--pPlayer.Earn(CTC.CoinProtect,0);
	
	--local nPoint = 10 ;
	-- local newpos = CTC:FindPosTong(CTC.Result,pPlayer.dwTongId);
	-- CTC.Result[newpos][2] =  CTC.Result[newpos][2] + CTC.Point[3];
	-- pPlayer.Msg("Bảo vệ trụ thành công <color=yellow>+ "..CTC.Point[3].." điểm<color>");
	----------------
--	pPlayer.Msg(szMsg);

end