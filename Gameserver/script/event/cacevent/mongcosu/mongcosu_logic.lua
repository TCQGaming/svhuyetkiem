if not MODULE_GAMESERVER then
	return;
end
function DaiChienQuanMongCo:ThongBaoLan1_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Quân Lính Mông Cổ<color> chuẩn bị tấn công <pos=132,1785,3558> Tàn Tích Cung A Phòng. Các nhân sĩ mau mau tới đó ! Lệnh triệu tập lúc 18h00";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
	end
function DaiChienQuanMongCo:ThongBaoLan2_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Quân Lính Mông Cổ<color> chuẩn bị tấn công <pos=132,1785,3558> Tàn Tích Cung A Phòng. Các nhân sĩ mau mau tới đó ! Lệnh triệu tập lúc 18h00";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
	end
function DaiChienQuanMongCo:ThongBaoLan3_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Quân Lính Mông Cổ<color> chuẩn bị tấn công <pos=132,1785,3558> Tàn Tích Cung A Phòng. Các nhân sĩ mau mau tới đó ! Lệnh triệu tập lúc 18h00";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
	end
function DaiChienQuanMongCo:ThongBaoLan4_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Quân Lính Mông Cổ<color> chuẩn bị tấn công <pos=132,1785,3558> Tàn Tích Cung A Phòng. Các nhân sĩ mau mau tới đó ! Lệnh triệu tập lúc 18h00";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
	end
function DaiChienQuanMongCo:TrieuTapMember_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
	local msg = "<color=Green>Quân Lính Mông Cổ<color> chuẩn bị tấn công <pos=132,1785,3558> Tàn Tích Cung A Phòng. Lệnh triệu tập !";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
	local nMapId, nMapX, nMapY = me.GetWorldPos();
	me.Msg("Thiết lập tất cả!");
	self:RemoteCall_ApplyAll("me.NewWorld", 132, 1778, 3547);
	end
function DaiChienQuanMongCo:AddQuanLinhMC_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Quân Lính Mông Cổ<color> đang tấn công tại <pos=132,1785,3558> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1783, 3559)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1776, 3557)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1770, 3550)
KNpc.Add2(20207, 255, 0, 132, 1769, 3523)
KNpc.Add2(20207, 255, 0, 132, 1769, 3523)
KNpc.Add2(20207, 255, 0, 132, 1769, 3523)
KNpc.Add2(20207, 255, 0, 132, 1796, 3536)
KNpc.Add2(20207, 255, 0, 132, 1796, 3536)
KNpc.Add2(20207, 255, 0, 132, 1796, 3536)
KNpc.Add2(20207, 255, 0, 132, 1805, 3574)
KNpc.Add2(20207, 255, 0, 132, 1805, 3574)
KNpc.Add2(20207, 255, 0, 132, 1805, 3574)
KNpc.Add2(20207, 255, 0, 132, 1805, 3574)
KNpc.Add2(20207, 255, 0, 132, 1805, 3574)
end
------------
function DaiChienQuanMongCo:AddMCSNhat_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Nhật)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20208, 255, 0, 132, 1777, 3548)
end
function DaiChienQuanMongCo:AddMCSNguyet_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Nguyệt)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20209, 255, 0, 132, 1777, 3548)
end
function DaiChienQuanMongCo:AddMCSPhong_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Phong)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20210, 255, 0, 132, 1777, 3548)
end
function DaiChienQuanMongCo:AddMCSVan_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Vân)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20211, 255, 0, 132, 1777, 3548)
end
function DaiChienQuanMongCo:AddMCSLoi_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Lôi)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20212, 255, 0, 132, 1777, 3548)
end
function DaiChienQuanMongCo:AddMCSDien_GS()
		local nMapIndex = SubWorldID2Idx(132);
	if nMapIndex < 0 then
		return;
	end
local msg = "<color=Green>Mông Cổ Sứ (Điện)<color> đang ở <pos=132,1777,3568> Tàn Tích Cung A Phòng";
   GlobalExcute({"Dialog:GlobalNewsMsg_GS", msg});
	KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, msg);
	KDialog.MsgToGlobal(msg);
KNpc.Add2(20213, 255, 0, 132, 1777, 3548)
end
--=================================================================Ngọa Hổ Tàng Long===========================================================================--
function DaiChienQuanMongCo:Star_CongThanhChien_GS() --Gọi NPC Vào Khu Chuẩn Bị CTC
	local nMapIndex = SubWorldID2Idx(24);
		if nMapIndex < 0 then
			return;
		end
	local nMapIndex = SubWorldID2Idx(1653);
		if nMapIndex < 0 then
			return;
		end
	KNpc.Add2(7137, 255, -1, 24,1792,3550); --Trương Tuyệt Chi (Báo Danh CTC)
    KNpc.Add2(7136, 255, -1, 1653,1604,3176); --Truyền Tống Thiết Phù (PK)
    KNpc.Add2(2597, 255, -1, 1653,1573,3243); --Xa Phu Thôn
    --============================================--
		-- tbGmPlayer:Star_Delete_All(pPlayer);--tbGmPlayer
		-- GM.tbPlayer:Star_Delete_All();
    --============================================--
    --=================================================================--
	GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu báo danh, hãy đến <pos=24,1792,3550> gặp <color=yellow>Tượng Quang Danh<color> để đăng ký tham gia<color>"});
    KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu báo danh, hãy đến <pos=24,1792,3550> gặp <color=yellow>Tượng Quang Danh<color> để đăng ký tham gia<color>");
    KDialog.MsgToGlobal("<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu báo danh, hãy đến <pos=24,1792,3550> gặp <color=yellow>Tượng Quang Danh<color> để đăng ký tham gia<color>");		
end
--========================================================================================================================================--
function DaiChienQuanMongCo:PK_CongThanhChien_GS() --Bắt đầu PK (Mở Map)
	local nMapIndex = SubWorldID2Idx(1721);
		if nMapIndex < 0 then
			return;
		end
	local nExistentTime = 3600; ---Thời gian duy trì = 60 phút
	local nBaseMultip = 1000; --Số nhân % kinh nghiệm nhận được.	
	local tbNpc	= Npc:GetClass("LongTruExp");
    
	local pNpc3	= KNpc.Add2(7133, 255, 0, 1721,1745,3610); --Long trụ Thiết Phù Thành
    local pNpc4	= KNpc.Add2(7133, 255, 0, 1721,1749,3333); --Long trụ Thiết Phù Thành
    local pNpc5	= KNpc.Add2(7133, 255, 0, 1721,1944,3433); --Long trụ Thiết Phù Thành
    local pNpc6	= KNpc.Add2(7133, 255, 0, 1721,1864,3577); --Long trụ Thiết Phù Thành
	--=======================================--
	if pNpc3 then
		tbNpc:InitGouHuo(pNpc3.dwId, 0,	nExistentTime, 5, 45, nBaseMultip, 0) --Giãn cách nhảy lửa 5s
		tbNpc:StartNpcTimer(pNpc3.dwId)
	end
	if pNpc4 then
		tbNpc:InitGouHuo(pNpc4.dwId, 0,	nExistentTime, 5, 45, nBaseMultip, 0) --Giãn cách nhảy lửa 5s
		tbNpc:StartNpcTimer(pNpc4.dwId)
	end
	if pNpc5 then
		tbNpc:InitGouHuo(pNpc5.dwId, 0,	nExistentTime, 5, 45, nBaseMultip, 0) --Giãn cách nhảy lửa 5s
		tbNpc:StartNpcTimer(pNpc5.dwId)
	end
	if pNpc6 then
		tbNpc:InitGouHuo(pNpc6.dwId, 0,	nExistentTime, 5, 45, nBaseMultip, 0) --Giãn cách nhảy lửa 5s
		tbNpc:StartNpcTimer(pNpc6.dwId)
	end
	--=================================================================--
	GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu chinh chiến hãy đến <pos=1653,1604,3176> gặp <color=yellow>Truyền Tống Thiết Phù<color> để bắt đầu chinh chiến!<color>"});
    KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu chinh chiến hãy đến <pos=1653,1604,3176> gặp <color=yellow>Truyền Tống Thiết Phù<color> để bắt đầu chinh chiến!<color>");
    KDialog.MsgToGlobal("<color=yellow>Công Thành Chiến<color> <color=cyan>đã bắt đầu chinh chiến hãy đến <pos=1653,1604,3176> gặp <color=yellow>Truyền Tống Thiết Phù<color> để bắt đầu chinh chiến!<color>");		
end
--========================================================================================================================================--
function DaiChienQuanMongCo:Goi_NgaiVang_GS() --Gọi (Ngai Vàng) Sau 15 Phút
	local nMapIndex = SubWorldID2Idx(1721);
		if nMapIndex < 0 then
			return;
		end
	local nExistentTime = 3600; ---Thời gian duy trì = 60 phút
	local nBaseMultip = 10000; --Số nhân % kinh nghiệm nhận được.
	local tbNpc	= Npc:GetClass("NgaiVangExp");
    local pNpc1	= KNpc.Add2(7138, 255, 0, 1721, 1829, 3485); --Ngai Vàng
	--=======================================--
	if pNpc1 then
		tbNpc:InitGouHuo(pNpc1.dwId, 0,	nExistentTime, 5, 45, nBaseMultip, 0) --Giãn cách nhảy lửa 5s
		tbNpc:StartNpcTimer(pNpc1.dwId)
	end
	--=================================================================--
	GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>Ngai Vàng<color> <color=cyan>đã xuất hiện hãy đến <pos=1721,1829,3485> để chiếm lĩnh!<color>"});
    KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>Ngai Vàng<color> <color=cyan>đã xuất hiện hãy đến <pos=1721,1829,3485> để chiếm lĩnh!<color>");
    KDialog.MsgToGlobal("<color=yellow>Ngai Vàng<color> <color=cyan>đã xuất hiện hãy đến <pos=1721,1829,3485> để chiếm lĩnh!<color>");		
end
--========================================================================================================================================--
function DaiChienQuanMongCo:KetThuc_CongThanhChien_GS()
	local nMapIndex = SubWorldID2Idx(24);
		if nMapIndex < 0 then
			return;
		end
	local nMapIndex = SubWorldID2Idx(1653);
		if nMapIndex < 0 then
			return;
		end
	local nMapIndex = SubWorldID2Idx(1721);
		if nMapIndex < 0 then
			return;
		end
	ClearMapNpcWithName(24, "Trương Tuyệt Chi");
	ClearMapNpcWithName(1653, "Truyền Tống Thiết Phù");
    ClearMapNpcWithName(1721, "Long Trụ Thiết Phù Thành");
    ClearMapNpcWithName(1721, "Long Trụ Thiết Phù Thành (1)");
    ClearMapNpcWithName(1721, "Long Trụ Thiết Phù Thành (2)");
    ClearMapNpcWithName(1721, "Ngai Vàng");
    ClearMapNpcWithName(1721, "Ngai Vàng (1)");
    ClearMapNpcWithName(1721, "Ngai Vàng (2)");
	--=================================================================--
	local tbLocalPlayer = KPlayer.GetAllPlayer();
		for _, pPlayer in pairs(tbLocalPlayer) do
			local nMapId, nPosX, nPosY = pPlayer.GetWorldPos();
			if nMapId == 1653 or nMapId == 1721 then
				pPlayer.NewWorld(21,1632,3409) --Phượng Tường Phủ
				pPlayer.SetFightState(0); --Trạng Thái Phi Chiến Đấu
			end
		end
	--=================================================================--
	GlobalExcute({"Dialog:GlobalNewsMsg_GS","<color=yellow>ĐẾN TƯỢNG BÁO DANH NHẬN THƯỞNG .Công Thành Chiến<color><color=cyan> Kẻ đăng quan ngai vàng người ganh ghét đố kỵ, hãy đến tượng người đó phỉ nhổ hoặc sùng bái"});
    KDialog.NewsMsg(1, Env.NEWSMSG_COUNT,"<color=yellow>ĐẾN TƯỢNG BÁO DANH NHẬN THƯỞNG .Công Thành Chiến<color><color=cyan>Kẻ đăng quan ngai vàng người ganh ghét đố kỵ, hãy đến tượng người đó phỉ nhổ hoặc sùng bái");
    KDialog.MsgToGlobal("<color=yellow>ĐẾN TƯỢNG BÁO DANH NHẬN THƯỞNG .Công Thành Chiến<color><color=cyan>Kẻ đăng quan ngai vàng người ganh ghét đố kỵ, hãy đến tượng người đó phỉ nhổ hoặc sùng bái");	
end
