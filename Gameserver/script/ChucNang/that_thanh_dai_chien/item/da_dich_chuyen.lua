-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("da_dich_chuyen");

function KnbBiz:OnUse()	
    DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\item\\da_dich_chuyen.lua");
    local nMapId, nPosX, nPosY = me.GetWorldPos()
	if (nMapId ~= 2163) and (nMapId ~= 2164)  and (nMapId ~= 2165)  and (nMapId ~= 2166)  and (nMapId ~= 2167)  and (nMapId ~= 2168) and (nMapId ~= 2169) then 
	 me.Msg("Ngươi đang không trong khu vực <color=yellow>Thất Thành Đại Chiến <color>không thể sử dụng")
	return 
	end 
			local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SIT,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
	}

	GeneralProcess:StartProcess("Đang triệu hồi đồng đội…", 2 * Env.GAME_FPS, {self.trieuhoi, self}, nil, tbEvent);		
end 

function KnbBiz:trieuhoi()	
    local nMapId, nPosX, nPosY = me.GetWorldPos()
	if (nMapId ~= 2163) and (nMapId ~= 2164)  and (nMapId ~= 2165)  and (nMapId ~= 2166)  and (nMapId ~= 2167)  and (nMapId ~= 2168) and (nMapId ~= 2169) then 
	 me.Msg("Ngươi đang không trong khu vực <color=yellow>Thất Thành Đại Chiến <color>không thể sử dụng")
	return 
	end 
    local tbMember = KTeam.GetTeamMemberList(me.nTeamId)
    if not tbMember then
        Dialog:Say("Bạn chưa tổ đội!")
        return 0
    end

    if me.nId ~= tbMember[1] then
        Dialog:Say("Hãy bảo đội trưởng đến gặp ta!")
        return 0
    end

        for _, nMemberId in ipairs(tbMember) do
			table.insert(CTC_7_Thanh.PlayerList,nMemberId);
            GlobalExcute({"DietQuai:HoTroDichChuyenCTC7Thanh", me.szAccount, nMemberId, nMapId, nPosX, nPosY})
        end
		me.Msg("<color=cyan>Triệu hồi thành viên nhóm thành công! Ai cùng bản đồ sẽ không được dịch chuyển !!")
end 


