
local tbJinxiangziItem = Item:GetClass("jinxiangzi");
tbJinxiangziItem.TASK_GROUP = 3031;
tbJinxiangziItem.TASK_DAY = 1;
function tbJinxiangziItem:OnUse()
DoScript("\\script\\baibaoxiang\\item\\jinxiangzi.lua");
	local nWeekOpen = me.GetTask(tbJinxiangziItem.TASK_GROUP, tbJinxiangziItem.TASK_DAY)
	local nTuan = 1;
	local nShow = tonumber(GetLocalDate("%W"));
	local nReal = nShow;--23-20

	local nNum = nReal * 7;-- số lượng 1 rương của 1 tuần 
	local nOpenDay = DietQuai:NgayMoMayChu()
		-- local tbItemId	= {18,1,324,1,0,0};  -- Gio hoa
	if nTuan == 0 then
		me.Msg("Máy chủ chưa cho phép mở rương cao quý, hẹn tuần sau nhé!");
		return 0;		
	end
	if nWeekOpen >= nNum then
		me.Msg("Hiện tại máy chủ chỉ có thể mở tối đa <color=yellow>"..nNum.."<color> rương, hẹn tuần sau nhé!\n Hiện tại nhân vật của bạn đã mở  <color=green>"..nWeekOpen.."/"..nNum.." Rương");
		return 0;		
	end;
	
	if me.CountFreeBagCell() < 1 then
		me.Msg("Túi của bạn đã đầy, cần ít nhất 1 ô trống.");
		return 0;
	end
	
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	
	-- random
	nRand = MathRandom(1, 10000);
	
	-- fill 3 rate	
	local tbRate = {9900, 90, 10};
	local tbAward = {8,9, 10};
	
	-- get index
	for i = 1, 5 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
	
	if nIndex == 0 then
		me.Msg("Xin lỗi, bạn không nhận được gì.");
		return 0;
	end;
	
	local pItem = me.AddItem(18, 1, 1, tbAward[nIndex]);
	pItem.Bind(1);

	me.SetTask(tbJinxiangziItem.TASK_GROUP, tbJinxiangziItem.TASK_DAY, nWeekOpen + 1);
	
	me.Msg("Bạn mở rương cao quý phát hiện <color=yellow>"..pItem.szName.."<color>\nHiện nay bạn đã mở "..nWeekOpen.."/ "..nNum.."<color=yellow> Rương có thể nuốt <color>");
	-- Task:DelItem(me, tbItemId, 1); 
	me.SendMsgToFriend("Hảo hữu của bạn thật may mắn [<color=yellow>" .. me.szName 
		.. "<color>] mở rương vừa đẹp vừa cao quý nhận được <color=yellow>"
		.. pItem.szName .."<color>!");
	return 1;
end
