-------------------------------------------------------
-- 文件名　:atlantis_npc_city.lua
-- 创建者　:zhangjinpin@kingsoft
-- 创建时间:2011-03-15 16:35:12
-- 文件描述:
-------------------------------------------------------

if not MODULE_GAMESERVER then
	return;
end

Require("\\script\\boss\\atlantis\\atlantis_def.lua");

local tbNpc = Npc:GetClass("atlantis_npc_city");

function tbNpc:OnDialog()

	local szMsg = "    Vị Đại hiệp này có từng nghe qua truyền thuyết về <color=yellow>Lâu Lan Cổ Thành<color>- vùng hoang mạc thần bí ở hướng Tây? Từ khi bọn lâu la của Nhất Phẩm Đường đến đó, đến nay biệt vô âm tín, ngay cả xác cũng không tìm thấy, ta không muốn mang tội đã đưa chúng đi đến đường chết..Ngươi có thể giúp ta đến vùng đất thần bí đó, đem một số vật phẩm về không?";

	local tbOpt = 
	{
		 {"<color=yellow>Đến Lâu Lan Cổ Thành<color>", Atlantis.PlayerEnter, Atlantis},
		{"<color=yellow>Hướng Dẫn<color>", self.huongdan, self},
		-- {"<color=yellow>Đổi Báu Vật Lâu Lan<color>", self.bauvatcongpham, self},
		{"Ta biết rồi"},
		
	};

	Dialog:Say(szMsg, tbOpt);		
end
function tbNpc:huongdan()
local szMsg = "<color=yellow>HƯỚNG DẪN<color>\n"..
-- "<color=pink>Trừ Các Giờ 10h-12h, 16h-18h, 20h-24h <color>\n"..
-- "<color=yellow>Drop Quái:Thanh Long Kiếm, Chu Tước Kiếm,Bạch Hổ Kiếm, Huyền Vũ Kiếm<color>\n"..
"<color=yellow>Drop Quái:Mảnh ghép trang bị đồng hành<color>\n"
-- "<color=yellow>Drop Quái: đồng hành 4 Skill, 5skill<color>\n"..
-- "<color=yellow>Drop Quái: 30 Đồng/1 Con <color>\n"..
-- "<color=red>Giờ Boss: 18h01,14h01 <color>\n"..
-- "<color=red>Drop Boss: Huyền Tinh, BK Đồng Hành ĐB, Đồng Hành 6skill <color>\n"
	local tbOpt = {
		{"Ta Chỉ Xem Qua Thôi"}
	}
	Dialog:Say(szMsg,tbOpt)
end
function tbNpc:bauvatcongpham()
local szMsg = "<color=yellow>NGUYÊN LIỆU CẦN<color>\n"..
"<color=pink>1 Bạch Hổ Kiếm <color>\n"..
"<color=pink>1 Thanh Long Kiếm <color>\n"..
"<color=pink>1 Chu Tước Kiếm <color>\n"..
"<color=pink>1 Huyền Vũ Kiếm <color>\n"..
"<color=red>THƯỞNG<color>\n"..
"<color=red>2 Hòa Thị Bích Không Khóa<color>\n"..
"<color=red>50 Vạn Bạc Khóa<color>\n"..
"<color=red>20 Vạn Đồng Khóa<color>\n"
	local tbOpt = {
		{"<color=yellow>Ta Đồng Ý<color>", self.bauvatok, self},
		{"Ta Chỉ Xem Qua Thôi"}
	}
	Dialog:Say(szMsg,tbOpt)
end
--
function tbNpc:bauvatok()
--
if me.CountFreeBagCell() < 5 then
Dialog:Say("Phải Có 5 Ô, May túi ba gang ra đây mà đựng");
return 0;
end
---
local checktl	= {18,1,20355,1,0,0}; 
local checkbh	= {18,1,20356,2,0,0}; 
local checkhv	= {18,1,20357,3,0,0}; 
local checkct	= {18,1,20358,4,0,0}; 
---
local sstdc = me.GetItemCountInBags(18,1,20355,1);
local ssbhd = me.GetItemCountInBags(18,1,20356,2);
local ssqd = me.GetItemCountInBags(18,1,20357,3);
local sstk = me.GetItemCountInBags(18,1,20358,4);
---
if sstdc < 1 or ssbhd < 1 or ssqd < 1 or sstk < 1  then
Dialog:Say("Bạn không đủ nguyên liệu hoặc đồng");
return
end
	me.AddItem(18,1,20359,1);
	me.AddBindMoney(500000);
	me.AddBindCoin(200000);
	Task:DelItem(me, checktl, 1);
	Task:DelItem(me, checkbh, 1);
	Task:DelItem(me, checkhv, 1);
	Task:DelItem(me, checkct, 1);
	KDialog.MsgToGlobal("\<color=yellow> "..me.szName.." Đã Đổi rương báu vật lâu lan");
end
function tbNpc:DoiLauLa()
local tbTmpNpc0	= Npc:GetClass("doilaula");
	tbTmpNpc0:OnDialog();
end	
-- 兑换同伴碎片
function tbNpc:OnChangeChip()
	local tbOpt = {};
	local szMsg = "    Khi ngươi tìm thấy <color=yellow>Vật Báu Lâu Lan<color> trong Cổ Thành, và một số <color=yellow>Nguyệt Ảnh Thạch<color> cho ta, ta sẽ cho ngươi <color=yellow>Mảnh trang bị đồng hành<color> mà ngươi cần";
	for nIndex, tbInfo in ipairs(Atlantis.CHANGE_LIST) do
		table.insert(tbOpt, {string.format("Đổi <color=yellow>[%s]<color>", tbInfo.szName), self.OnGiftChip, self, nIndex});
	end
	tbOpt[#tbOpt + 1] = {"Tôi biết"};
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:OnGiftChip(nIndex)
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản đang khóa không thể thao tác!");
		return 0;
	end
	Dialog:AskNumber("Vui lòng nhập số lượng:", 50, self.DoChangeChip, self, nIndex);
end

function tbNpc:DoChangeChip(nIndex, nInput, nSure)
	
	local tbInfo = Atlantis.CHANGE_LIST[nIndex];
	if not tbInfo or nInput <= 0 then
		Dialog:Say("Vui lòng nhập số lượng chính xác. ");
		return 0;
	end
	
	local nNeedChip = tbInfo.nNeedChip * nInput;
	local nNeedMoon = tbInfo.nNeedMoon * nInput;
	
	if not nSure then
		local szMsg = string.format([[
    Hi hi, đây đúng là vật phẩm tốt,người cũng biết ta sẽ không để ngươi vất vả đi về tay không,giờ ngươi chỉ cần cho ta:
    <color=yellow>%s %s<color>
    <color=yellow>%s Nguyệt Ảnh Thạch<color>
    Ta sẽ cho ngươi:<color=yellow>%s %s<color>. Thế nào, giao dịch như vậy được không?]], nNeedChip, tbInfo.szBase, nNeedMoon, nInput, tbInfo.szName);
		local tbOpt =
		{
			{"<color=yellow>Xác định<color>", self.DoChangeChip, self, nIndex, nInput, 1},
			{"我再想想"},
		};
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	
	local nCount = me.GetItemCountInBags(unpack(tbInfo.tbBaseId));
	if nCount < nNeedChip then
		Dialog:Say(string.format("    Ngươi làm gì có <color=yellow>%s %s<color>，đừng có gạt ta!", tbInfo.szBase, nNeedChip));
		return 0;
	end
	
	nCount = me.GetItemCountInBags(unpack(Atlantis.ITEM_MOON_ID));
	if nCount < nNeedMoon then
		Dialog:Say(string.format("    Ngươi làm gì có <color=yellow>%s Nguyệt Ảnh Thạch<color>，đừng có gạt ta!", nNeedMoon));
		return 0;
	end
	
	local nNeedSpace = KItem.GetNeedFreeBag(tbInfo.tbItemId[1], tbInfo.tbItemId[2], tbInfo.tbItemId[3], tbInfo.tbItemId[4], nil, nInput);
	if me.CountFreeBagCell() < nNeedSpace then
		Dialog:Say(string.format("Hành trang không đủ %s chổ trống", nNeedSpace));
		return 0;
	end
	
	local nRet = me.ConsumeItemInBags2(nNeedChip, tbInfo.tbBaseId[1], tbInfo.tbBaseId[2], tbInfo.tbBaseId[3], tbInfo.tbBaseId[4]);
	if nRet ~= 0 then
		Dbg:WriteLog("楼兰古城", "Atlantis", me.szAccount, me.szName, string.format("扣除%s个%s失败", tbInfo.szBase, nNeedChip));
	end
	
	nRet = me.ConsumeItemInBags2(nNeedMoon, Atlantis.ITEM_MOON_ID[1], Atlantis.ITEM_MOON_ID[2], Atlantis.ITEM_MOON_ID[3], Atlantis.ITEM_MOON_ID[4]);
	if nRet ~= 0 then
		Dbg:WriteLog("楼兰古城", "Atlantis", me.szAccount, me.szName, string.format("扣除%s个月影之石失败", nNeedMoon));
	end
	
	me.AddStackItem(tbInfo.tbItemId[1], tbInfo.tbItemId[2], tbInfo.tbItemId[3], tbInfo.tbItemId[4], nil, nInput);
	
	Dbg:WriteLog("Atlantis", "楼兰古城", me.szAccount, me.szName, "兑换同伴碎片", string.format("%s个%s", nInput, tbInfo.szName));
--	StatLog:WriteStatLog("stat_info", "loulangucheng", "gain", me.nId, me.GetHonorLevel(), tbInfo.szName, nInput);
--	StatLog:WriteStatLog("stat_info", "yueyingxiaohao", "exchange", me.nId, nNeedMoon, tbInfo.szName, nInput);
end

-- 兑换同伴装备
function tbNpc:OnChangeEquip()
	local tbNewland = Npc:GetClass("newland_npc_city");
	tbNewland:ExchangePartnerEq();
end

-- 同伴装备兑换材料
function tbNpc:OnChangeBack()
	Dialog:OpenGift("请放入楼兰同伴装备<color=yellow>(绑定的同伴装备只能兑换绑定的珍宝)<color>", nil, {self.DoChangeBack, self});
end

function tbNpc:DoChangeBack(tbItem, nSure)
	
	local tbPartnerEquip =
	{
		[1] = {"碧血护腕", {5, 22, 1, 1}, {18, 1, 1237, 1}, 45},
		[2] = {"碧血戒指", {5, 21, 1, 1}, {18, 1, 1240, 1}, 45},
		[3] = {"金鳞护腕", {5, 22, 1, 2}, {18, 1, 1238, 1}, 45},
		[4] = {"金鳞戒指", {5, 21, 1, 2}, {18, 1, 1241, 1}, 45},
	};
	
	local nBind = 0;
	local nValue = 0;
	local tbEquip = nil;
	for _, tbTmpItem in pairs(tbItem) do
		local pItem = tbTmpItem[1];
		if Partner:GetPartnerEquipParam(pItem) ~= 1 then
			local szKey = string.format("%s,%s,%s,%s", pItem.nGenre, pItem.nDetail, pItem.nParticular, pItem.nLevel);
			for _, tbInfo in pairs(tbPartnerEquip) do
				if szKey == string.format("%s,%s,%s,%s", unpack(tbInfo[2])) then
					nValue = nValue + 1;
					tbEquip = tbInfo;
					nBind = pItem.IsBind() or 0;
				end
			end
		end
	end
	
	if nValue ~= 1 then
		Dialog:Say("请放入正确的楼兰同伴装备，每次只能放入一件. ");
		return 0;
	end

	local nNeed = KItem.GetNeedFreeBag(tbEquip[3][1], tbEquip[3][2], tbEquip[3][3], tbEquip[3][4], {bForceBind = nBind}, tbEquip[4]);
	if me.CountFreeBagCell() < nNeed then
		Dialog:Say(string.format("请留出%s格背包空间. ", nNeed));
		return 0;
	end
	
	if not nSure then
		local szMsg = string.format("你打算将<color=yellow>%s<color>兑换为<color=yellow>%s个<color>珍宝吗?",tbEquip[1], tbEquip[4]);
		local tbOpt =
		{
			{"<color=yellow>确定<color>", self.DoChangeBack, self, tbItem, 1},
			{"我再想想"},
		};
		Dialog:Say(szMsg, tbOpt);
		return 0;
	end
	
	for _, tbTmpItem in pairs(tbItem) do
		local pItem = tbTmpItem[1];
		if Partner:GetPartnerEquipParam(pItem) ~= 1 then
			local szKey = string.format("%s,%s,%s,%s", pItem.nGenre, pItem.nDetail, pItem.nParticular, pItem.nLevel);
			if szKey == string.format("%s,%s,%s,%s", unpack(tbEquip[2])) then
				if me.DelItem(pItem) == 1 then
					me.AddStackItem(tbEquip[3][1], tbEquip[3][2], tbEquip[3][3], tbEquip[3][4], {bForceBind = nBind}, tbEquip[4]);
					Dbg:WriteLog("Atlantis", "楼兰古城", me.szAccount, me.szName, "同伴装备兑换珍宝", tbEquip[1], tbEquip[4], nBind);
				--	StatLog:WriteStatLog("stat_info", "partnerequip", "reback", me.nId, tbEquip[1], tbEquip[4], nBind);
				else
					Dbg:WriteLog("Atlantis", "楼兰古城", me.szAccount, me.szName, "同伴装备兑换珍宝扣除失败", tbEquip[1], tbEquip[4], nBind);
				end
				break;
			end
		end
	end
end
