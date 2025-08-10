--Event Quốc tế phụ nữ 08/03
--TCQGaming - 08/03/2024

local tbItem = Item:GetClass("bohongdacbiettcq");

tbItem.Level_Exp = 129;

function tbItem:OnUse()

	if me.nFightState ~= 0 then
		me.Msg("Chỉ sử dụng trong thôn trấn hoặc thành thị");
		return 0;
	end	
	if me.CountFreeBagCell() < 15 then
		local szAnnouce = "Hành trang của bạn không đủ 15 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	
	local nNguyenLieu = {
6,
7,
8,
}
	
local ngaunhien = MathRandom(1,200)
local ngaunhientiendulong = MathRandom(1,5)
local SoLuongSuDung = me.GetTask(9178,153)

if SoLuongSuDung >= 1000 then 
me.Msg("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng tối đa<color=yellow> 1000 Bó Hồng Đặc Biệt <color>rồi<color>");
return 0
end
if SoLuongSuDung == 50 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---Bạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow>Bó Hồng Đặc Biệt<color> 50 lần <color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end
if SoLuongSuDung == 150 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow>Bó Hồng Đặc Biệt<color> 150 lần<color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end 
if SoLuongSuDung == 300 then
me.AddStackItem(18,1,114,7,{bForceBind=1},2)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow>Bó Hồng Đặc Biệt<color> 300 lần<color=gold>\nPhần Thường : \n2 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");
end
if SoLuongSuDung == 500 then
me.AddStackItem(18,1,114,7,{bForceBind=1},4)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},100)--25-Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow> Bó Hồng Đặc Biệt<color> 500 lần<color=gold>\nPhần Thường : \n4 Huyền Tinh Cấp 7\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n100 Tiền Du Long");

end
if SoLuongSuDung == 600 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow> Bó Hồng Đặc Biệt<color> 600 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 700 then
local nRan = MathRandom(1,100)
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow> Bó Hồng Đặc Biệt<color> 700 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 800 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow> Bó Hồng Đặc Biệt<color> 800 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 900 then
me.AddStackItem(18,1,114,8,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},200)---Tiền Du Long
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng <color=yellow> Bó Hồng Đặc Biệt<color> 900 lần<color=gold>\nPhần Thường : \n1 Huyền Tinh Cấp 8\n15 Van Bạc Khóa\n15 Vạn Đồng Khóa\n200 Tiền Du Long");

end
if SoLuongSuDung == 999 then
	me.SetTask(9178,156,1)
me.AddStackItem(18,1,1875,1,nil,150); --- Rương tb đồng hành
me.AddStackItem(18,1,114,10,{bForceBind=1},1)
me.AddBindMoney(150000);---50vBạc Khóa
me.AddBindCoin(150*10000);	-- 15v đồng khóa
me.AddStackItem(18,1,553,1,{bForceBind=1},800)---Tiền Du Long
me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
me.AddStackItem(18,1,2026,1,nil,10)---Thất Sắc Hồn
 me.AddStackItem(18,1,402,1,nil,200)---Chân Nguyên Tu Luyện Đơn Exp Đồng Hành
 me.AddStackItem(18,1,1327,13,nil,50)-- mảnh ghép hòa thị ngọc thô
 me.AddStackItem(18,1,1875,1,nil,150); --- Rương tb đồng hành
 me.AddStackItem(18,1,1303,1,nil,10)-- rương ngọc vỡ 
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã sử dụng tối đa 1000 lần Bó Hồng Đặc Biệt xin chúc mừng<color><color=gold>\nPhần Thường :\n10 Thất Sắc Hồn\n200 Chân Nguyên Tu Luyện Đơn\n50 MG Hòa Thị Ngọc thô\n10 Rương ngọc vỡ cấp 1\n150 Rương TB Đồng hành\n1 Huyền Tinh Cấp 10\n15 Van Bạc Khóa\n150 Vạn Đồng Khóa\n800 Tiền Du Long\n1 Bổ Tu Lệnh Khóa");

    -- Điều chỉnh tỷ lệ ngẫu nhiên
    local ngaunhienphanthuong = MathRandom(1,100) -- Sử dụng 1 đến 100 để dễ điều chỉnh tỷ lệ

    -- Bùa chuyển cường hóa (tỷ lệ 10%)
    if ngaunhienphanthuong <= 10 then 
        me.AddStackItem(18,1,1327,14,{bForceBind=1},1)---Bùa chuyển cường hóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được Bùa 1 lần chuyển cường hóa từ mốc phần thưởng 1000 Bánh Trưng Đặc Biệt Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    
    -- Huyền Tinh cấp 8 (tỷ lệ 20%)
    elseif ngaunhienphanthuong <= 30 then 
        me.AddStackItem(18,1,114,8,{bForceBind=1},1)
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 1 Huyền Tinh cấp 8 từ mốc phần thưởng 1000 Bánh Trưng Đặc Biệt Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    
    -- 50 vạn đồng khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 55 then 
        me.AddBindCoin(50*10000);	-- 50 vạn đồng khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn đồng khóa từ mốc phần thưởng 1000 Bánh Trưng Đặc Biệt Đặc Biệt\nPhần thưởng này là ngẫu nhiên");

    -- 50 vạn bạc khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 80 then 
        me.AddBindMoney(50*10000);---50v Bạc Khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn bạc khóa từ mốc phần thưởng 1000 Bánh Trưng Đặc Biệt Đặc Biệt\nPhần thưởng này là ngẫu nhiên");

    -- 300 Tiền Du Long (tỷ lệ 20%)
    else
        me.AddStackItem(18,1,553,1,{bForceBind=1},300)---Tiền Du Long
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 300 Tiền Du Long từ mốc phần thưởng 1000 Bánh Trưng Đặc Biệt Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    end 
end

if ngaunhien == 1 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Bó Hồng Đặc Biệt đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 2 then
me.AddStackItem(18,1,114,4,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Bó Hồng Đặc Biệt đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 4");
elseif ngaunhien == 3 then
me.AddStackItem(18,1,114,5,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Bó Hồng Đặc Biệt đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 5");
elseif ngaunhien == 4 then
me.AddStackItem(18,1,114,6,{bForceBind=1},1)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Bó Hồng Đặc Biệt đã may mắn nhận được<color><color=gold>\n 1 Huyền Tinh 6");
elseif ngaunhien == 5 then
me.AddStackItem(18,1,553,1,{bForceBind=1},ngaunhientiendulong)
KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color>đã sử dụng <color=yellow>Bó Hồng Đặc Biệt đã may mắn nhận được<color><color=gold>\n "..ngaunhientiendulong.." Tiền Du Long");
end

if me.nLevel < self.Level_Exp then
me.AddExp(15000000);-----5tr Exp
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9178,153, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." Bó Hồng Đặc Biệt<color>");

return 1;-----Xóa vật phẩm sau khi sử dụng
end
