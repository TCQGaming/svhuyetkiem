if not MODULE_GAMESERVER then
return;
end
function PKVLMC:baodanh()
KDialog.MsgToGlobal("Hoạt động <color=yellow> HOA SƠN LUẬN KIẾM <color>Đã Mở Báo Danh Tại : <pos=8,1718,3367> thời gian tham gia báo danh từ 20h00 đến 20h09 thứ 6 hàng tuần");
GlobalExcute({"Dialog:GlobalNewsMsg_GS","HOA SƠN LUẬN KIẾM <pos=24,1770,3515>"});
HslkKim:resetHWfile();
HslkMoc:resetHWfile();
HslkThuy:resetHWfile();
HslkHoa:resetHWfile();
HslkTho:resetHWfile();
PKVLMC:resetBaoDanh();
end

function PKVLMC:resetBaoDanh()
    local szFile = "\\script\\ChucNang\\taotuviet\\baodanh.txt"
	KFile.WriteFile(szFile, "");	
end

function PKVLMC:AddPKVLMC_GS()
local nWeek = tonumber(GetLocalDate("%w"));
local tbLocalPlayer = KPlayer.GetAllPlayer();
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId = pPlayer.GetWorldPos();  
        if nMapId == 2021 then
			pPlayer.nInBattleState	= 1;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
			pPlayer.SetFightState(1);
			Dialog:SendBlackBoardMsg(pPlayer, "Trạng Thái Đồ Sát Đã Sẵn Sàng, Người Chơi Có Thể PK!!!");
			KDialog.MsgToGlobal("Hoạt động <color=yellow> Giai đoạn 2 Tranh Đoạt Võ Lâm Minh Chủ đã bắt đầu vào giai đoạn PK hãy mau tiêu diệt kẻ địch<color>");
        end
    end
	KNpc.Add2(9701, 1, 0, 2021, 1656, 3272) -- Map PT
end
function PKVLMC:AddPKHSLK_GS()
local tbLocalPlayer = KPlayer.GetAllPlayer();
    for _, pPlayer in pairs(tbLocalPlayer) do
        local nMapId = pPlayer.GetWorldPos();  
        if (nMapId == 2016) or (nMapId == 2017) or (nMapId == 2018) or (nMapId == 2019) or (nMapId == 2020) then
			pPlayer.nInBattleState	= 1;	-- 0: Cùng gia tộc, bang không thể PK, 1: Có thể PK
			pPlayer.nPkModel = Player.emKPK_STATE_BUTCHER; --- chuyen pk do sat
			pPlayer.SetFightState(1);
			Dialog:SendBlackBoardMsg(pPlayer, "Trạng Thái Đồ Sát Đã Sẵn Sàng, Người Chơi Có Thể PK!!!");
			KDialog.MsgToGlobal("Hoạt động <color=yellow> Giai đoạn 1 Thi Đấu Ngũ Hành Môn Phái đã bắt đầu vào giai đoạn PK hãy mau tiêu diệt kẻ địch<color>");
        end
end
	KNpc.Add2(9691, 1, 0, 2016, 1646, 3181) -- Map PT
	KNpc.Add2(9691, 1, 0, 2017, 1646, 3181) -- Map PT
	KNpc.Add2(9691, 1, 0, 2018, 1646, 3181) -- Map PT
	KNpc.Add2(9691, 1, 0, 2019, 1646, 3181) -- Map PT
	KNpc.Add2(9691, 1, 0, 2020, 1646, 3181) -- Map PT
end

function PKVLMC:AddMoveHSLK_GS()
local tbLocalPlayer = KPlayer.GetAllPlayer();
for _, pPlayer in pairs(tbLocalPlayer) do
local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
    if (nMapId == 2016) or (nMapId == 2017) or (nMapId == 2018) or (nMapId == 2019) or (nMapId == 2020) or (nMapId == 2021) then
		pPlayer.NewWorld(24, 1767, 3540);
	end
end
PKVLMC:xoanpc();
KDialog.MsgToGlobal("Hoạt động <color=pink> HOA SƠN LUẬN KIẾM <color>Đã Kết Thúc");
GlobalExcute({"Dialog:GlobalNewsMsg_GS","HOA SƠN LUẬN KIẾM Đã Kết Thúc"});
end

function PKVLMC:xoanpc()
		local nMapIndex = SubWorldID2Idx(2021);
	if nMapIndex < 0 then
		return;
	end
ClearMapNpcWithName(2021, "Chiến Kỳ Minh Chủ");
end

