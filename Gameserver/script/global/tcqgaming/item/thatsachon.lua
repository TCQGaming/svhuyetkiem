-----Dev : TCQGaming
-----Time : 13/02/2023 7:38 PM
local KnbBiz = Item:GetClass("thatsachon");

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\thatsachon.lua");
local ngaunhien = MathRandom(2,8)
local nRandom = MathRandom(3,6)
local tbItemId	= {18,1,2026,1,0,0};  -- Gio hoa
me.AddStackItem(18,1,2026,ngaunhien,{bForceBind=1},1)
	-- me.Msg("Bạn nhận được <color=gold>số ngẫu nhiên là "..ngaunhien.."<color>");
Task:DelItem(me, tbItemId, 1);
end

