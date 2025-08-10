local tbTest = Map:GetClass(CTC.MapID); -- µØÍ¼Id

-- ¶¨ÒåÍæ¼Ò½øÈëÊÂ¼þ
function tbTest:OnEnter(szParam)
	if CTC:FindPlayer(me) == false then
		me.NewWorld(24,1765,3491);
	end
	--me.SetFightState(1);
	me.nPkModel = Player.emKPK_STATE_TONG;
	me.nForbidChangePK	= 1;
end;

-- ¶¨ÒåÍæ¼ÒÀë¿ªÊÂ¼þ
function tbTest:OnLeave(szParam)
		Dialog:ShowBattleMsg(me, 0, 0);
		me.nPkModel = Player.emKPK_STATE_PRACTISE;
		me.nForbidChangePK	= 0;
		--me.ReviveImmediately(0);
end;
local tbTestTrap13	= tbTest:GetTrapClass("to_in")

-- ¶¨ÒåÍæ¼ÒTrapÊÂ¼þ
function tbTestTrap13:OnPlayer()
		local i = CTC:FindPosTongList(CTC.TongList,me.dwTongId)
		if i == 0 then
				me.NewWorld(24,1765,3491);
		end
		
		me.NewWorld(unpack(CTC.MapPos_Prepare[i]));
		me.SetFightState(0)
end;
local tbTestTrap14	= tbTest:GetTrapClass("to_out")

-- ¶¨ÒåÍæ¼ÒTrapÊÂ¼þ
function tbTestTrap14:OnPlayer()	
		local i = CTC:FindPosTongList(CTC.TongList,me.dwTongId)
		if i == 0 then
				me.NewWorld(24,1765,3491);
		end
		--if CTC.nTimerId == 0 then
		if CTC.Show_Line_BD == 1 then
			Dialog:Say("Trước khi khai chiến,tất cả các binh sĩ không được rời khỏi doanh trại.Bạn hãy chuẩn bị thật tốt chờ tới lúc khai chiến!");
			me.NewWorld(unpack(CTC.MapPos_Prepare[i]));
			return 0;
		end
		----
		me.NewWorld(unpack(CTC.MapPos[i]));
		me.SetFightState(1)
		Player:AddProtectedState(me, 5);
end;
