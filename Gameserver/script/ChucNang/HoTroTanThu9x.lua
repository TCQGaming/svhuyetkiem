
local tbHoTro90 = Item:GetClass("tuiquahotrotanthu9x")
function tbHoTro90:OnUse()
DoScript("\\script\\KiemThe1102\\HoTroTanThu9x.lua");
	local szMsg = "Mở ra bạn sẽ nhận được <color=yellow>Set đồ hỗ trợ tân thủ<color>";
	local tbOpt = {
		{"<color=orange>Nhận<color>",self.NhanHoTro9x, self},
			};

	Dialog:Say(szMsg, tbOpt);
end

function tbHoTro90:NhanHoTro9x()
if me.CountFreeBagCell() < 20 then
		Dialog:Say("Phải Có 20 Ô Trống Trong Túi Hành Trang!");
		return 0;
	end
local tbItemId2 = {18,1,2082,1,0,0} -- Mảnh Ghép Huyền Vũ Ấn
if me.nFaction == 0 then
Dialog:Say("<color=yellow>Chưa gia nhập môn phái không thể mở<color>")
return 
end
if me.nRouteId == 0 then
Dialog:Say("Chưa chọn hệ phái")
return
end
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nam
		me.AddGreenEquip(10,10211,10,5,16).Bind(1); --Th?y Hoàng H?ng Hoang Uy?n
		me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
		me.AddGreenEquip(7,10065,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
		me.AddGreenEquip(11,10105,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
		me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
		me.AddGreenEquip(8,353,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
		me.AddGreenEquip(9,487,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
		me.AddGreenEquip(3,10045,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
		me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,751,10,1,12);
		item10.Bind(1);
			end
	if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 1) then -- Thiên Vương Thương Nữ
	me.AddGreenEquip(10,10212,10,5,16).Bind(1);
	me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10066,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10106,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,354,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,488,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10050,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,751,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nam
		me.AddGreenEquip(10,10211,10,5,16).Bind(1); --Th?y Hoàng H?ng Hoang Uy?n
		me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
		me.AddGreenEquip(7,10065,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
		me.AddGreenEquip(11,10105,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
		me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
		me.AddGreenEquip(8,353,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
		me.AddGreenEquip(9,487,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
		me.AddGreenEquip(3,10045,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
		me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,761,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 2) and (me.nRouteId == 2) then -- Thiên Vương Chùy Nữ
	me.AddGreenEquip(10,10212,10,5,16).Bind(1);
	me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10066,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10106,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,354,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,488,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10050,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,761,10,1,12);
		item20.Bind(1);
		end
		-------------
			if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nam Đao
		me.AddGreenEquip(10,10211,10,5,16).Bind(1); --Th?y Hoàng H?ng Hoang Uy?n
		me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
		me.AddGreenEquip(7,10065,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
		me.AddGreenEquip(11,10105,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
		me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
		me.AddGreenEquip(8,353,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
		me.AddGreenEquip(9,487,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
		me.AddGreenEquip(3,10045,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
		me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,731,10,1,12);
		item10.Bind(1);
		end
		    if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 1) then -- Thiếu Lâm Nữ Đao
	me.AddGreenEquip(10,10212,10,5,16).Bind(1);
	me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10066,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10106,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,354,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,488,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10050,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,731,10,1,12);
		item10.Bind(1);
		end
		    if tbInfo.nSex == 0 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nam Bổng
		me.AddGreenEquip(10,10211,10,5,16).Bind(1); --Th?y Hoàng H?ng Hoang Uy?n
		me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
		me.AddGreenEquip(7,10065,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
		me.AddGreenEquip(11,10105,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
		me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
		me.AddGreenEquip(8,353,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
		me.AddGreenEquip(9,487,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
		me.AddGreenEquip(3,10045,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
		me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,741,10,1,12);
		item10.Bind(1);
		end
		    if tbInfo.nSex == 1 and (me.nFaction == 1) and (me.nRouteId == 2) then -- Thiếu Lâm Nữ Bổng
	me.AddGreenEquip(10,10212,10,5,16).Bind(1);
	me.AddGreenEquip(4,10161,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10066,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10106,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10085,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,354,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,488,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10050,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10000,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,741,10,1,12);
		item10.Bind(1);
		end
		---------------
			if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 2) then -- ĐMTT Nam
	me.AddGreenEquip(10,10215,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,2,100,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 2)then -- ĐMTT Nữ
	me.AddGreenEquip(10,10216,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 =  me.AddItem(2,2,100,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nam
	me.AddGreenEquip(10,10215,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,2,90,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 3) and (me.nRouteId == 1) then -- ĐMHT Nữ
	me.AddGreenEquip(10,10216,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 =  me.AddItem(2,2,90,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nam
	me.AddGreenEquip(10,10215,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,771,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1  and (me.nFaction == 4) and (me.nRouteId == 1) then -- 5 Độc Đao Nữ
	me.AddGreenEquip(10,10216,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,771,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nam
	me.AddGreenEquip(10,10217,10,5,16).Bind(1);
	me.AddGreenEquip(4,10164,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10088,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,781,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 4) and (me.nRouteId == 2) then -- 5 Độc Chưởng Nữ
	me.AddGreenEquip(10,10218,10,5,16).Bind(1);
	me.AddGreenEquip(4,10164,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10088,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,781,10,1,12);
		item20.Bind(1);
        end
			if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nam
	me.AddGreenEquip(10,10217,10,5,16).Bind(1);
	me.AddGreenEquip(4,10164,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10088,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,1001,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 2) then -- MGK Nữ
	me.AddGreenEquip(10,10218,10,5,16).Bind(1);
	me.AddGreenEquip(4,10164,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10088,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,1001,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 11) and (me.nRouteId == 1) then -- Minh Giáo Chùy Nam
	me.AddGreenEquip(10,10215,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10067,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10107,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,373,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,489,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10046,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,991,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 11) and (me.nRouteId == 1) then -- MGC Nữ
	me.AddGreenEquip(10,10216,10,5,16).Bind(1);
	me.AddGreenEquip(4,10163,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10068,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10108,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10087,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,374,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,490,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10051,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10001,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,991,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK Nam
	me.AddGreenEquip(10,10221,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,821,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 2) then -- ĐTK nữ
	me.AddGreenEquip(10,10222,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,821,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nam
	me.AddGreenEquip(10,10219,10,5,16).Bind(1);
	me.AddGreenEquip(4,10165,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10089,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,801,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 12) and (me.nRouteId == 1) then -- ĐTC Nữ
	me.AddGreenEquip(10,10220,10,5,16).Bind(1);
	me.AddGreenEquip(4,10165,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10089,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,801,10,1,12);
		item20.Bind(1);
		end
		if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nam Nga Mi Chưởng
	me.AddGreenEquip(10,10221,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,811,10,1,12);
		item20.Bind(1);
		end
		if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 1) then -- Nữ Nga Mi Chưởng
	me.AddGreenEquip(10,10222,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,811,10,1,12);
		item20.Bind(1);
		end
		if tbInfo.nSex == 0 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nam Nga Mi Kiếm
	me.AddGreenEquip(10,10221,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,821,10,1,12);
		item10.Bind(1);
		end
		if tbInfo.nSex == 1 and (me.nFaction == 5) and (me.nRouteId == 2) then -- Nữ Nga Mi Kiếm
	me.AddGreenEquip(10,10222,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,821,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nam
	me.AddGreenEquip(10,10219,10,5,16).Bind(1);
	me.AddGreenEquip(4,10165,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10089,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,791,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 2) then -- TYD Nữ
	me.AddGreenEquip(10,10220,10,5,16).Bind(1);
	me.AddGreenEquip(4,10165,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10089,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 =  me.AddItem(2,1,791,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nam
	me.AddGreenEquip(10,10221,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10069,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10109,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,393,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,491,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10047,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,821,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 6) and (me.nRouteId == 1) then --TYK Nữ
	me.AddGreenEquip(10,10222,10,5,16).Bind(1);
	me.AddGreenEquip(4,10166,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10070,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10110,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10090,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,394,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,492,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10052,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10002,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,821,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nam
	me.AddGreenEquip(10,10225,10,5,16).Bind(1);
	me.AddGreenEquip(4,10168,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10071,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10111,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10092,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,413,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,493,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10048,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,851,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 1) then -- Cái Bang Rồng Nữ
	me.AddGreenEquip(10,10226,10,5,16).Bind(1);
	me.AddGreenEquip(4,10168,10,5,16).Bind(1);--V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10072,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10112,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10092,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,414,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,494,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10053,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,851,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nam
	me.AddGreenEquip(10,10223,10,5,16).Bind(1);
	me.AddGreenEquip(4,10167,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10071,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10111,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10091,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,413,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,493,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10048,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,831,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 7) and (me.nRouteId == 2) then -- Cái Bang Bổng Nữ
	me.AddGreenEquip(10,10224,10,5,16).Bind(1);
	me.AddGreenEquip(4,10167,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10072,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10112,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10091,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,414,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,494,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10053,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,831,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and  (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nam
	me.AddGreenEquip(10,10225,10,5,16).Bind(1);
	me.AddGreenEquip(4,10168,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10071,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10111,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10092,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,413,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,493,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10048,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,861,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 2) then -- Ma Nhẫn Nữ
	me.AddGreenEquip(10,10226,10,5,16).Bind(1);
	me.AddGreenEquip(4,10168,10,5,16).Bind(1);--V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10072,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10112,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10092,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,414,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,494,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10053,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,861,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 8) and (me.nRouteId == 1) then -- Thiên Nhẫn Thương Nam
	me.AddGreenEquip(10,10223,10,5,16).Bind(1);
	me.AddGreenEquip(4,10167,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10071,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10111,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10091,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,413,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,493,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10048,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,841,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 8) and (me.nRouteId == 1) then -- THiên Nhẫn Kích Nữ
	me.AddGreenEquip(10,10224,10,5,16).Bind(1);
	me.AddGreenEquip(4,10167,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10072,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10112,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10091,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,414,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,494,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10053,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10003,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,841,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nam
	me.AddGreenEquip(10,10229,10,5,16).Bind(1);
	me.AddGreenEquip(4,10170,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10073,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10113,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10094,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,433,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,495,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10049,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,891,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 1) then -- Võ Đang Khí Nữ
	me.AddGreenEquip(10,10230,10,5,16).Bind(1);
	me.AddGreenEquip(4,10170,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10074,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10114,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10094,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,434,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,496,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10054,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,891,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0  and  (me.nFaction == 9) and (me.nRouteId == 2) then -- Võ đang kiếm nam
	me.AddGreenEquip(10,10227,10,5,16).Bind(1);
	me.AddGreenEquip(4,10169,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10073,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10113,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10093,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,433,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,495,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10049,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,881,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 9) and (me.nRouteId == 2) then  -- Võ đang kiếm nữ
	me.AddGreenEquip(10,10228,10,5,16).Bind(1);
	me.AddGreenEquip(4,10169,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10074,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10114,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10093,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,434,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,496,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10054,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,881,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nam
	me.AddGreenEquip(10,10229,10,5,16).Bind(1);
	me.AddGreenEquip(4,10170,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10073,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10113,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10094,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,433,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,495,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10049,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,901,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 2) then -- CLK Nũ
	me.AddGreenEquip(10,10230,10,5,16).Bind(1);
	me.AddGreenEquip(4,10170,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10074,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10114,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10094,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,434,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,496,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10054,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,901,10,1,12);
		item20.Bind(1);
		end
			if tbInfo.nSex == 0 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nam
	me.AddGreenEquip(10,10227,10,5,16).Bind(1);
	me.AddGreenEquip(4,10169,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10073,10,5,16).Bind(1); --Tiêu Dao Bá V??ng Ngoa
	me.AddGreenEquip(11,10113,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n ??ng Van B?i
	me.AddGreenEquip(5,10093,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,433,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,495,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10049,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item10 = me.AddItem(2,1,871,10,1,12);
		item10.Bind(1);
		end
			if tbInfo.nSex == 1 and (me.nFaction == 10) and (me.nRouteId == 1) then -- CLĐ Nữ
	me.AddGreenEquip(10,10228,10,5,16).Bind(1);
	me.AddGreenEquip(4,10169,10,5,16).Bind(1); --V? Uy C? Tinh Gi?i
	me.AddGreenEquip(7,10074,10,5,16).Bind(1); --Tiêu Dao Huy?n N? Ngoa
	me.AddGreenEquip(11,10114,10,5,16).Bind(1); --Th?y Hoàng Chi?n Th?n B?ng Tinh H??ng Nang
	me.AddGreenEquip(5,10093,10,5,16).Bind(1); --Tr?c L?c Thiên ?i?p L?u Van Liên
	me.AddGreenEquip(8,434,10,5,16).Bind(1); --Tr?c L?c Hoàng Long Tri?n Yêu
	me.AddGreenEquip(9,496,10,5,16).Bind(1); --Tr?c L?c Kinh Van Kh?i
	me.AddGreenEquip(3,10054,10,5,16).Bind(1); --Th?y Hoàng Long Lan Y
	me.AddGreenEquip(6,10004,10,5,16).Bind(1); --V? Uy L?m Nh?t Tinh Huy?n Phù
		local item20 = me.AddItem(2,1,871,10,1,12);
		item20.Bind(1);
		end
Task:DelItem(me, tbItemId2, 1); -- Xóa Túi Hỗ Trợ Tân Thủ	
 end
