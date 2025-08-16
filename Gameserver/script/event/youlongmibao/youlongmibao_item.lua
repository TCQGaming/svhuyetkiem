-------------------------------------------------------
-- 文件名　：youlongmibao_item.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-11-09 14:45:39
-- 文件描述：
-------------------------------------------------------

Require("\\script\\event\\youlongmibao\\youlongmibao_mapmgr.lua");

local tbItem = Item:GetClass("youlongzhanshu");

function tbItem:OnUse()

	-- 城市和新手村
	local nCount = me.GetTask(2106, 14);
	local nNgayMoSV = DietQuai:NgayMoMayChu();
	local nMaxDuLong = 50 * nNgayMoSV;
	local szMapClass = GetMapType(me.nMapId) or "";
	if szMapClass ~= "village" and szMapClass ~= "city" then
		me.Msg("Chiến thư du long chỉ dùng được ở Tân Thủ Thôn và các thành thị.");
		return 0;
	end
	
	-- 角色50级
	if me.nLevel < 50 then
		me.Msg("Đẳng cấp từ 50 trở lên mới có thể vào khiêu chiến");
		return 0;
	end
	
	-- 加入门派
	if me.nFaction <= 0 then
		me.Msg("Chưa gia nhập phái không thể vào khiêu chiến.");
		return 0;
	end
	
	local tbOpt = 
	{
		{"Vâng", Youlongmibao.Manager.JoinPlayer, Youlongmibao.Manager, me},
		{"Kết thúc đối thoại"},
	};
	
	Dialog:Say("Bạn muốn vào mật thất du long ?\nMỗi ngày bạn có thể khiêu chiến 50 lượt và nếu không đi sẽ tích lũy\nMáy chủ <color=yellow>S1 Bích Huyết Kiếm<color> đã mở "..nNgayMoSV.." ngày\nTổng Số lượt đã khiêu chiến <color=yellow> "..nCount.."/"..nMaxDuLong.."", tbOpt);
	
	return 0;
end
