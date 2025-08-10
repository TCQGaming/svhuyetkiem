-- Dev : TCQGaming
-- Time: 01/06/2023 7:00 PM

local HuyChuong = Item:GetClass("huychuongtcq");

function HuyChuong:OnUse()
	local SoCapHuyChuong = me.GetSkillLevel(1992)
	local nSoCapText = SoCapHuyChuong + 1
	local nTenHuanChuong = ""

	if SoCapHuyChuong < 20 then 
		nTenHuanChuong = "Hắc Thiết"
	elseif SoCapHuyChuong < 30 then 
		nTenHuanChuong = "Thanh Đồng"
	elseif SoCapHuyChuong < 40 then 
		nTenHuanChuong = "Bạch Ngân"
	elseif SoCapHuyChuong < 50 then 
		nTenHuanChuong = "Hoàng Kim"
	elseif SoCapHuyChuong < 60 then 
		nTenHuanChuong = "Kim Long"
	elseif SoCapHuyChuong == 60 then 
		nTenHuanChuong = "Bích Long"
	end

	local tbRequire = {
		{min = 1, max = 10,  level = 80,  ruong = 1, danhle = 100, sao = 100, dong = 50},
		{min = 11, max = 20, level = 90,  ruong = 1, danhle = 150, sao = 100, dong = 100},
		{min = 21, max = 30, level = 100, ruong = 1, danhle = 200, sao = 200, dong = 150},
		{min = 31, max = 40, level = 110, ruong = 2, danhle = 350, sao = 250, dong = 150},
		{min = 41, max = 50, level = 120, ruong = 2, danhle = 400, sao = 250, dong = 200},
		{min = 51, max = 60, level = 130, ruong = 2, danhle = 400, sao = 300, dong = 250},
	}

	local req = nil
	for _, v in ipairs(tbRequire) do
		if nSoCapText >= v.min and nSoCapText <= v.max then
			req = v
			break
		end
	end

	local szMsg = "<color=gold>     Huân Chương - "..nTenHuanChuong.."<color>\n"
	szMsg = szMsg .. "Cấp hiện tại: <color=yellow>"..SoCapHuyChuong.." cấp<color>\n"
	szMsg = szMsg .. "<color=green>Để nâng cấp lên cấp "..nSoCapText..", bạn cần:<color>\n"
	szMsg = szMsg .. "- Cấp nhân vật yêu cầu: <color=yellow>"..(req and req.level or "?").."<color>\n"
	szMsg = szMsg .. "- Rương Cao Quý: <color=yellow>"..(req and req.ruong or "?").."<color>\n"
	szMsg = szMsg .. "- Danh Bổ Lệnh: <color=yellow>"..(req and req.danhle or "?").."<color>\n"
	szMsg = szMsg .. "- Mảnh Sao Chiến Tích: <color=yellow>"..(req and req.sao or "?").."<color>\n"
	szMsg = szMsg .. "- Đồng thường: <color=yellow>"..(req and req.dong or "?").." vạn<color>"

	local tbOpt = {}
	table.insert(tbOpt, {"<color=yellow>Thăng cấp lên cấp "..nSoCapText.."<color>", self.NangCap, self});
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt)
end

function HuyChuong:NangCap()
	local tbItemInfo = {bForceBind = 1};
	local SoCapHuyChuong = me.GetSkillLevel(1992)
	local nSoCapText = SoCapHuyChuong + 1

	-- ID chính xác các vật phẩm yêu cầu
	local RuongID = {18, 1, 324, 1, 0, 0}          -- Rương Cao Quý
	local DanhBoLenhID = {18, 1, 190, 1, 0, 0}     -- Danh Bổ Lệnh
	local SaoChienTichID = {18, 1, 2028, 7, 0, 0}  -- Mảnh Sao Chiến Tích

	-- Điều kiện theo từng mốc nâng cấp
	local tbRequire = {
		{min = 1, max = 10,  level = 80,  ruong = 1, danhle = 100, sao = 100, dong = 50},
		{min = 11, max = 20, level = 90,  ruong = 1, danhle = 150, sao = 100, dong = 100},
		{min = 21, max = 30, level = 100, ruong = 1, danhle = 200, sao = 200, dong = 150},
		{min = 31, max = 40, level = 110, ruong = 2, danhle = 350, sao = 250, dong = 150},
		{min = 41, max = 50, level = 120, ruong = 2, danhle = 400, sao = 250, dong = 200},
		{min = 51, max = 60, level = 130, ruong = 2, danhle = 400, sao = 300, dong = 250},
	}

	local req = nil
	for _, v in ipairs(tbRequire) do
		if nSoCapText >= v.min and nSoCapText <= v.max then
			req = v
			break
		end
	end

	if not req then
		Dialog:Say("Không tìm thấy điều kiện nâng cấp phù hợp.")
		return 0
	end

	if me.nLevel < req.level then
		Dialog:Say("Bạn cần đạt cấp "..req.level.." mới có thể nâng cấp huân chương này.")
		return 0
	end

	if me.GetItemCountInBags(unpack(RuongID, 1, 4)) < req.ruong then
		Dialog:Say("Bạn cần "..req.ruong.." Rương Cao Quý.")
		return 0
	end

	if me.GetItemCountInBags(unpack(DanhBoLenhID, 1, 4)) < req.danhle then
		Dialog:Say("Bạn cần "..req.danhle.." Danh Bổ Lệnh.")
		return 0
	end

	if me.GetItemCountInBags(unpack(SaoChienTichID, 1, 4)) < req.sao then
		Dialog:Say("Bạn cần "..req.sao.." Mảnh Sao Chiến Tích.")
		return 0
	end

	local nDong = me.GetJbCoin()
	if nDong < req.dong * 10000 then
		Dialog:Say("Bạn cần "..req.dong.." vạn đồng thường.")
		return 0
	end

	-- Trừ vật phẩm
	Task:DelItem(me, RuongID, req.ruong)
	Task:DelItem(me, DanhBoLenhID, req.danhle)
	Task:DelItem(me, SaoChienTichID, req.sao)
	me.AddJbCoin(-req.dong * 10000)

	-- Nâng cấp kỹ năng
	me.AddFightSkill(1992, SoCapHuyChuong + 1)

	Dialog:Say("Chúc mừng bạn đã nâng cấp Huân Chương lên cấp "..nSoCapText.." thành công!")
end
