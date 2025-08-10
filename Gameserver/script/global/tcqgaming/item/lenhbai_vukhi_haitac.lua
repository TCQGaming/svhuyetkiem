-----Dev : TCQGaming
-----Time : 07/04/2023 4:51 PM
local KnbBiz = Item:GetClass("lenhbaihaitac_vukhi");
KnbBiz.LenhBaiDo_HaiTac =
{
	[1] ="\\setting\\npc\\droprate\\guanfutongji\\lenhbaivukhi_haitac.txt",	--95cấp bossrơi xuống biểu 
}

function KnbBiz:OnUse()	
DoScript("\\script\\global\\tcqgaming\\item\\lenhbai_vukhi_haitac.lua"); 
-- local tbItemId	= {18,1,2033,13,0,0};  -- Rương bạc
local ngaunhien = MathRandom(10,30)
local nSoLanMoLenhBai = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TichLuyLenhBai_VuKhiHaiTac)
if nSoLanMoLenhBai == 10 then 
local ngaunhien1 = 1000
me.DropRateItem(KnbBiz.LenhBaiDo_HaiTac[1], ngaunhien, ngaunhien1, -1);
KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_TichLuyLenhBai_VuKhiHaiTac, 0);
else 
local ngaunhien1 = MathRandom(300,1000)
me.DropRateItem(KnbBiz.LenhBaiDo_HaiTac[1], ngaunhien, ngaunhien1, -1);
KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_TichLuyLenhBai_VuKhiHaiTac, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_TichLuyLenhBai_VuKhiHaiTac)+1);
end 
me.Msg("Bạn vừa mở <color=gold>Lệnh bài Vũ Khí Hải Tặc thành công<color>");
return 1;-----Xóa vật phẩm sau khi sử dụng
end