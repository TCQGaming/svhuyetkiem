if not MODULE_GAMESERVER then
	return;
end

Require("\\script\\player\\define.lua");
Require("\\script\\item\\define.lua");
Player.TBDH = 
	{
	{5,19,1,1};{5,19,1,2};{5,19,1,3};{5,19,1,4};{5,19,1,5};{5,19,1,6};{5,19,1,7};{5,19,10,8};{5,19,11,9};{5,19,12,10};{5,19,2,10};{5,19,3,10};{5,19,4,10};{5,19,5,10};{5,19,6,10};{5,19,7,10};{5,19,8,10};{5,19,9,10};
-----------------------------------------------------------
	{5,20,1,1};{5,20,1,2};{5,20,1,3};{5,20,1,4};{5,20,1,5};{5,20,1,6};{5,20,1,7};{5,20,10,8};{5,20,11,9};{5,20,12,10};{5,20,2,10};{5,20,3,10};{5,20,4,10};{5,20,5,10};{5,20,6,10};{5,20,7,10};{5,20,8,10};{5,20,9,10};
--------------------------------------------------------------
	{5,21,1,1};{5,21,1,2};{5,21,1,3};{5,21,1,4};{5,21,1,5};{5,21,1,6};{5,21,1,7};{5,21,10,8};{5,21,11,9};{5,21,12,10};{5,21,2,10};{5,21,3,10};{5,21,4,10};{5,21,5,10};{5,21,6,10};{5,21,7,10};{5,21,8,10};{5,21,9,10};
-----------------------------------------------------------------
	{5,22,1,1};{5,22,1,2};{5,22,1,3};{5,22,1,4};{5,22,1,5};{5,22,1,6};{5,22,1,7};{5,22,10,8};{5,22,11,9};{5,22,12,10};{5,22,2,10};{5,22,3,10};{5,22,4,10};{5,22,5,10};{5,22,6,10};{5,22,7,10};{5,22,8,10};{5,22,9,10};
-----------------------------------------------------------------
	{5,23,1,1};{5,23,1,2};{5,23,1,3};{5,23,1,4};{5,23,1,5};{5,23,1,6};{5,23,1,7};{5,23,10,8};{5,23,11,9};{5,23,12,10};{5,23,2,10};{5,23,3,10};{5,23,4,10};{5,23,5,10};{5,23,6,10};{5,23,7,10};{5,23,8,10};{5,23,9,10};

	  --  CÒN THIẾU TRANG BỊ TINH VÂN
	  
	};
	
Player.npctb = {2599,3690,2445,2353,2659,3689,2503,2506,2655,2656,2657,2658,20140,21124,21121,20087,9666,9667};

Item.FILE_PATH					= "\\setting\\item\\001\\extern\\change\\";
Item.SWITCH_FILE_WUQI			= "switchwuqi.txt";
Item.SWITCH_FILE_FANGJUSHOUSHI  = "switchfangjushoushi.txt";

Item.WEAPON_SWITCH_COUNT		= 1;	-- 一次只能换一件武器的五行
Item.WEAPON_SWITCH_LEVEL_LIMIT  = 10;	-- 只有10级的武器才能换五行

Item.tbEquipType = 
{
	"Hệ ngoại công", "Hệ nội công",
}

Item.tbGDPLToValue				= {};
Item.tbValueToGDPL				= {};
Item.tbWeaponCatToDetail		= {};

Item.SECOND_FEATURE_COUNT 		= 3;		-- 二级特征key数量
Item.DEFAULT_SETTING			= "0";		-- 配置表中空列的默认值

-------------------------------------------------------------------------------------------------------------------------------------


function Item:nDoiTrangBi()
--me.CallClientScript({"UiManager:OpenWindow", "UI_SWITCH_PANEL"});
Item:SwitchWeaponSeries(me)
end

---------------------------------------Cấm sử dụng đồ pet thông thường-------------------------------------------------
function Player:FixCamSuDungDoPet(pPlayer)
	local nOk = 0;
	for i = 0, Item.PARTNEREQUIP_NUM - 1 do
		local pItem = pPlayer.GetItem(Item.ROOM_PARTNEREQUIP, i, 0);
		if pItem then
			if self:Check_New(pItem) == 0 then
				nOk = 1;
				break;
			end
		end
	end
		local nSex = pPlayer.nSex;
		local szSex = "";
	
		if nSex==0 then 
			szSex = "Thật Đáng Xấu Hổ ";
		else
			szSex = "Thật Đáng Xấu Hổ ";
		end;

		if nOk == 1 then
			KDialog.MsgToGlobal(szSex.. "<color=Yellow>" .. me.szName.. "<color> Chưa đổi trang bị pet phiên bản mới nên bị Kickout hoặc nếu bạn quên hãy click vào túi tân thủ tiến hành đổi trang bị mới" );
			me.KickOut();
		end


end
function Player:Check_New(pItem)
	for _, tbItemId in pairs(self.TBDH) do
		if pItem.nGenre == tbItemId[5] then
			return 1;
		end
	end
	return 0;
end

---------------------------------------ĐEO TRANG BỊ THƯỜNG LÊN TRANG BỊ ĐỒNG HÀNH-------------------------------------------------
function Player:FixDeoDoThuongLenDoPet(pPlayer)
--[[
local nOk = 0;
for i = 1, Item.PARTNEREQUIP_NUM do
local pItem = pPlayer.GetItem(Item.ROOM_PARTNEREQUIP, i - 1, 0);
if pItem then
local nDetail = pItem.nDetail;
if nDetail < Item.EQUIP_PARTNERWEAPON then
nOk = 1;
break;
end
end
end
if nOk == 1 then
Dialog:Say("hack ha cưng");
----GM.tbGMRole:ArrestHim(pPlayer.nId);
end
]]
	local nOk = 0;
	for i = 0, Item.PARTNEREQUIP_NUM - 1 do
		local pItem = pPlayer.GetItem(Item.ROOM_PARTNEREQUIP, i, 0);
		if pItem then
			if self:Check(pItem) == 0 then
				nOk = 1;
				break;
			end
		end
	end
		local nSex = pPlayer.nSex;
		local szSex = "";
	
		if nSex==0 then 
			szSex = "Thật Đáng Xấu Hổ ";
		else
			szSex = "Thật Đáng Xấu Hổ ";
		end;

		if nOk == 1 then
			GlobalExcute({"Dialog:GlobalNewsMsg_GS", "Người chơi <color=red>"  ..me.szName.. "<color> cố tình Bug. Nên được Admin cho đi Du Lịch <color=red>Đào Hoa Nguyên<color> 1 chuyến<pic=65>"});
			pPlayer.SendMsgToFriend("Người chơi <color=red>"  ..me.szName.. "<color> cố tình Bug. Nên được Admin đưa đi Du Lịch <color=red>Đào Hoa Nguyên<color> 1 chuyến<pic=78>");
			--Dialog:Say("hack ha cưng");
			KDialog.MsgToGlobal(szSex.. "<color=Yellow>" .. me.szName.. "<color> Cố tình bug trang bị pet hoặc nếu bạn quên hãy liên hệ GM" );
			-- Player:Arrest(me.szName);
			me.KickOut();
		end


end

------------------------------------------ĐEO TRANG BỊ PET LÊN TRANG BỊ F1 -------------------------------------------------
function Player:FixDeoDoPetLenDoThuong(pPlayer)
	local nOk = 0;
	for i = 0, Item.ROOM_NUM - 1 do
		local pItem = pPlayer.GetItem(Item.ROOM_EQUIP, i, 0);
		if pItem then
			if self:Check(pItem) == 1 then
				nOk = 1;
				break;
			end
		end
	end
		local nSex = pPlayer.nSex;
		local szSex = "";
	
		if nSex==0 then 
			szSex = "Thằng cờ hó ";
		else
			szSex = "Con đĩ ";
		end;

		if nOk == 1 then
			--GlobalExcute({"Dialog:GlobalNewsMsg_GS", "Người chơi <color=red>"  ..me.szName.. "<color> cố tình Bug. Nên được Admin cho đi Du Lịch <color=red>Đào Hoa Nguyên<color> 1 chuyến<pic=65>"});
			--pPlayer.SendMsgToFriend("Người chơi <color=red>"  ..me.szName.. "<color> cố tình Bug. Nên được Admin đưa đi Du Lịch <color=red>Đào Hoa Nguyên<color> 1 chuyến<pic=78>");
			--Dialog:Say("hack ha cưng");
			KDialog.MsgToGlobal(szSex.. "<color=Yellow>" .. me.szName.. "<color>bug đã bị hệ thống phát hiện Kickout! Cẩn thận đó" );
			-- Player:Arrest(me.szName);
			me.KickOut();
		end
end

------------------------------------------CẤM BÁN TRANG BỊ ĐỒNG HÀNH-------------------------------------------------
function Player:FixBanTBDH()
	local pItem1 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_WEAPON, 0);
	local pItem2 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_BODY, 0);
	local pItem3 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_RING, 0);
	local pItem4 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_CUFF, 0);
	local pItem5 = me.GetItem(Item.ROOM_PARTNEREQUIP, Item.PARTNEREQUIP_AMULET, 0);
	local PItems = pItem1 or pItem2 or pItem3 or pItem4 or pItem5;
	
	local nCheck = 0;
	local tbAroundNpc = KNpc.GetAroundNpcList(me, 15);
	for _, pNpc in ipairs(tbAroundNpc) do
		for i = 1 , #self.npctb do
			if (pNpc.nTemplateId == self.npctb[i]) then
				nCheck = 1;
				break;
			end
		end
	end
		local nSex = me.nSex;
		local szSex = "";
	
		if nSex==0 then 
			szSex = "Ông Nội ";
		else
			szSex = "Bà Già ";
		end;
	if (nCheck ~= 1) then--check
	
		for _, tbItem in pairs(self.TBDH) do
			if #me.FindItemInBags(unpack(tbItem)) > 0 and PItems then
				local szMsg = "Đem trang bị đồng hành trong hành trang cất vào thủ khố trước khi thao tác";
				local tbOpt = 
				{
					{"Kết thúc đối thoại"},
				};
				Dialog:Say(szMsg, tbOpt);
				return 0;	
			end
		end
	end

end
------------------------------------------CHECK-------------------------------------------------
function Player:Check(pItem)
	for _, tbItemId in pairs(self.TBDH) do
		if pItem.nGenre == tbItemId[1] and pItem.nDetail == tbItemId[2] and pItem.nParticular == tbItemId[3] and pItem.nLevel == tbItemId[4] then
			return 1;
		end
	end
	return 0;
end
-----------------------------------------------------------------------------
function Item:__AdjustStr(str, szException)
	if (not str or str == "") then
		return szException;
	end
	
	return str;
end

function Item:LoadSwitchSetting(szFile)
	local tbFile = Lib:LoadTabFile(szFile);
	if not tbFile then
		return;
	end
	
	
	for _, tbData in pairs(tbFile) do
		local G = tbData.Genre;
		local D = tbData.DetailType;
		local P = tbData.ParticularType;
		local L = tbData.Level;
		
		local szGDPL = string.format("%s_%s_%s_%s", G, D, P, L);
		local szFeature1 = string.format("%s_%s_%s_%s_%s_%s_%s_%s", tbData.kind5, tbData.kind6, 
			self:__AdjustStr(tbData.SuiteID, self.DEFAULT_SETTING),
			self:__AdjustStr(tbData.bVN, self.DEFAULT_SETTING), 
			self:__AdjustStr(tbData.b2, self.DEFAULT_SETTING), 
			tbData.Category, 
			self:__AdjustStr(tbData.kind4, self.DEFAULT_SETTING),
			D);
			
		local szFeature2 = string.format("%s_%s_%s", 
			self:__AdjustStr(tbData.kind3, self.DEFAULT_SETTING), 
			self:__AdjustStr(tbData.kind2, self.DEFAULT_SETTING), 
			tbData.kind7);
		
		local szFullFeature = string.format("%s_%s", szFeature1, szFeature2);
		
		self.tbGDPLToValue[szGDPL] =  {szFeature1, szFeature2};
		
		self.tbValueToGDPL[szFeature1] = self.tbValueToGDPL[szFeature1] or {};
		table.insert(self.tbValueToGDPL[szFeature1], szGDPL);

		
		if (tonumber(D) == Item.EQUIP_MELEE_WEAPON or tonumber(D) == Item.EQUIP_RANGE_WEAPON) then
			self.tbWeaponCatToDetail[tonumber(tbData.Category)] = tonumber(D);
		end
	end	
end
Item:LoadSwitchSetting(Item.FILE_PATH..Item.SWITCH_FILE_WUQI);
Item:LoadSwitchSetting(Item.FILE_PATH..Item.SWITCH_FILE_FANGJUSHOUSHI);
