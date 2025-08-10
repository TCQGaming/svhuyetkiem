-- 文件名　：randomitem2.lua
-- 创建者　：jiazhenwei
-- 创建时间：2013-01-11 10:10:50
-- 功能说明：	获取随机物品，通用脚本(延用金品新算法，每次都要额外写脚本太累了，还是写个通用的吧)


local tbRandomItem = Item:GetClass("qian_randomitem2");
function tbRandomItem:OnUse()

local nTaskCount = me.GetTask(8011,1);
local nTaskDay = me.GetTask(8011,2);
local nDate = tonumber(GetLocalDate("%y%m%d"));
if nTaskDay < nDate then
me.SetTask(8011,2,nDate);
me.SetTask(8011,1,0);
end
if nTaskCount > 0 then
Dialog:Say("Mỗi ngày chỉ nhận 1 lần.");
return 0;
end

me.SetTask(8011,1,nTaskCount+1); -- task time nhận hàng ngày
me.AddItem(18,1,114,6);
return 1;
end

