-- 宋金马夫（车夫）脚本

local tbNpc	= Npc:GetClass("Longtrutrunglap2");
function tbNpc:OnDeath(pNpcKiller)
	local pNpc = him;
	local pPlayer = pNpcKiller.GetPlayer();
	local nMapId, nX, nY = pNpc.GetWorldPos();
	local nTongId		= pPlayer.dwTongId;
	local pTong			= KTong.GetTong(nTongId);
	local szTKName		= "Không";
	if (pTong) then
		szTKName	= pTong.GetName();
	local pNpc2 = KNpc.Add2(7413, 10, -1, nMapId, nX, nY);
	
		pNpc2.szName = "Long Trụ của " .. szTKName;
		pNpc2.SetTitle ( "<color=gold>" .. szTKName.." Long Trụ<color>");
	else
	local pNpc2 = KNpc.Add2(7413, 10, -1, nMapId, nX, nY);
	
	end
		-- return 0, pNpc;

end
