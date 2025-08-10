--============================================================--
--Phát triển bởi Tình Tính Tang Dev
--SĐT: 0906024054
--Facebook: https://www.facebook.com/duongvantinh19843
--============================================================--
local tbNpc = Npc:GetClass("npc_fam");--Điêu Tượng CTC
function tbNpc:OnDialog()
local nCurTime = tonumber(GetLocalDate("%H%M"));
	if (nCurTime >= 1100 and nCurTime < 1154) or (nCurTime >= 1700 and nCurTime < 1754) or (nCurTime >= 2100 and nCurTime < 2154) or (nCurTime >= 2300 and nCurTime < 2354)then
		Dialog:Say("Tống Kim Đang Diễn Ra! Không Thể Vào!!!")
	return 0;
end
local szMsg = "<color=yellow>Khu Vực Train Đồng Thường<color>\n"..
"<color=yellow>Thời Gian : Trừ Các Giờ Tống Kim\n"..
"<color=yellow>Đánh Quái Nhận 4 Đồng/1 Con<color>\n"
local tbOpt = {
		{"<color=yellow>Ta Muốn Đến<color>", self.DoanhTrai1, self},
		{"Ta Chỉ Xem Qua Thôi"}
	}
	Dialog:Say(szMsg,tbOpt)
end

function tbNpc:DoanhTrai1(pPlayer)
local nCurTime = tonumber(GetLocalDate("%H%M"));
	if (nCurTime >= 1100 and nCurTime < 1154) or (nCurTime >= 1700 and nCurTime < 1754) or (nCurTime >= 2100 and nCurTime < 2154) or (nCurTime >= 2300 and nCurTime < 2354)then
		Dialog:Say("Tống Kim Đang Diễn Ra! Không Thể Vào!!!")
	return 0;
	end
	local pTong = KTong.GetTong(me.dwTongId);
	if not pTong then
		Dialog:Say("Bạn Không Có Bang Hội Không Thể Đến Nơi Đây");
		-- me.NewWorld(24,1802,3486);
		return 0;		--Phượng Tường Phủ
	end
	if me.IsCaptain() ~= 1 then
		Dialog:Say("Ngươi không phải đội trưởng, đội trưởng mới có thể đưa mọi người vào. ");
		return 0;
	end
	me.NewWorld(1721,1827,3478);
	-- Player.nPkModel = Player.emKPK_STATE_TONG;
	-- me.SetFightState(0);
	
end
function tbNpc:DoanhTrai2()
	me.NewWorld(1721,1900,3265); --Doanh trại 2
end
function tbNpc:DoanhTrai3()
	me.NewWorld(1721,1930,3630); --Doanh trại 3
end