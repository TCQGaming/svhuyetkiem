-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local tbBoHongDo = Item:GetClass("bohongdacbiettcq_20_10");
tbBoHongDo.Level_Exp = 89;
function tbBoHongDo:OnUse()	
DoScript("\\script\\global\\tcqgaming\\npc\\event\\sukienthang10\\bohongdacbiet.lua");
	if me.nFightState ~= 0 then
		me.Msg("Chỉ sử dụng trong thôn trấn hoặc thành thị");
		return 0;
	end	
	if me.CountFreeBagCell() < 10 then
		local szAnnouce = "Hành trang của bạn không đủ 10 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	
	
local ngaunhien = MathRandom(1,200)
	-- local tbItemId	= {18,1,2031,6,0,0};  -- Gio hoa
local SoLuongSuDung = me.GetTask(9170,58)

if SoLuongSuDung >= 1000 then 
me.Msg("<color=green>Người chơi <color=yellow>[ "..me.szName.." ] Bạn đã sử dụng tối đa<color=yellow> 1000 Bó Hồng Đặc Biệt <color>rồi<color>");
return 0
end

if SoLuongSuDung == 999 then
    me.AddStackItem(18,1,114,10,{bForceBind=1},1)
    me.AddBindMoney(1500000);---50v Bạc Khóa
    me.AddBindCoin(1500000);	-- 15v đồng khóa
    me.AddStackItem(18,1,479,1,{bForceBind=1},1)---Bổ Tu Lệnh
    me.AddStackItem(18,1,2025,11,nil,5)---5 Lệnh bài đồ hải tặc cấp 2
    me.AddStackItem(18,1,2031,8,{bForceBind=1},1)---Sao Chiến Thắng Tiềm Năng
    KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã sử dụng tối đa 1000 lần Bó Hồng Đặc Biệt xin chúc mừng<color><color=gold>\nPhần Thường : \n1 Bông Hồng Đỏ Tiềm Năng\n1 Huyền Tinh Cấp 8\n150 Van Bạc Khóa\n150 Vạn Đồng Khóa\n1 Bổ Tu Lệnh Khóa");

    -- Điều chỉnh tỷ lệ ngẫu nhiên
    local ngaunhienphanthuong = MathRandom(1,100) -- Sử dụng 1 đến 100 để dễ điều chỉnh tỷ lệ

    -- Bùa chuyển cường hóa (tỷ lệ 10%)
    if ngaunhienphanthuong <= 10 then 
        me.AddStackItem(18,1,1327,14,{bForceBind=1},1)---Bùa chuyển cường hóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được Bùa 1 lần chuyển cường hóa từ mốc phần thưởng 1000 Bó Hoa Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    
    -- Huyền Tinh cấp 8 (tỷ lệ 20%)
    elseif ngaunhienphanthuong <= 30 then 
        me.AddStackItem(18,1,114,8,{bForceBind=1},1)
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 1 Huyền Tinh cấp 8 từ mốc phần thưởng 1000 Bó Hoa Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    
    -- 50 vạn đồng khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 55 then 
        me.AddBindCoin(50*10000);	-- 50 vạn đồng khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn đồng khóa từ mốc phần thưởng 1000 Bó Hoa Đặc Biệt\nPhần thưởng này là ngẫu nhiên");

    -- 50 vạn bạc khóa (tỷ lệ 25%)
    elseif ngaunhienphanthuong <= 80 then 
        me.AddBindMoney(50*10000);---50v Bạc Khóa
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 50 vạn bạc khóa từ mốc phần thưởng 1000 Bó Hoa Đặc Biệt\nPhần thưởng này là ngẫu nhiên");

    -- 300 Tiền Du Long (tỷ lệ 20%)
    else
        me.AddStackItem(18,1,553,1,{bForceBind=1},300)---Tiền Du Long
        KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> Rất may mắn khi nhận được 300 Tiền Du Long từ mốc phần thưởng 1000 Bó Hoa Đặc Biệt\nPhần thưởng này là ngẫu nhiên");
    end 
end



me.AddStackItem(18,1,553,1,{bForceBind=1},3)---Tiền Du Long

if me.nLevel < self.Level_Exp then
me.AddExp(1000000);-----1tr Exp
end

local DemSoLuong = SoLuongSuDung + 1
me.SetTask(9170,58, DemSoLuong)
me.Msg("Bạn đã sử dụng <color=gold>"..DemSoLuong.." Bó Hồng Đặc Biệt<color>");
return 1;
end

