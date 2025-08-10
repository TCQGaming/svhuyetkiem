local tbDBBox = Item:GetClass("webjx_duobao_box");
tbDBBox.GiftItem = {18,1,1011,2};
function tbDBBox:PickUp(nX, nY)
	local itemType = tonumber(it.GetExtParam(1));
	if itemType == 1 then
		if (DuoBao.tbMission[DuoBao.NowType].nState) and (DuoBao.tbMission[DuoBao.NowType].nState ~= 0) then
			--还在战斗中
			DuoBao.tbMission[DuoBao.NowType].pBoxPlayer = me;
			DuoBao.tbMission[DuoBao.NowType].pBoxPlayerIndex = me.nPlayerIndex;
			local szMsg = string.format("<color=yellow> [%s] <color> mang <color=yellow>[Bảo vật]<color> trong <color=yellow>đấu trường<color>, mau giết chết hắn để rơi ra để giành lại",me.szName);
			KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
			KDialog.MsgToGlobal(szMsg);
			if (DuoBao.tbMission[DuoBao.NowType].tbTimer2) then
				local nRemainFrame		= Timer:GetRestTime(DuoBao.tbMission[DuoBao.NowType].tbTimer2.nRegisterId);
				local nVIP = NVip:GetLevel();
				if nVIP > 0 then
					me.RemoveSkillState(DuoBao.VIPSkillId);
					me.RemoveSkillState(DuoBao.SkillId);
					me.AddSkillState(DuoBao.VIPSkillId, nVIP, 1, nRemainFrame, 0, 1, 1);
					--szMsg = string.format("<color=yellow>[%s]<color> ảnh hưởng kĩ năng VIP <color=green>[%d]<color>. Cải thiện đáng kể sức mạnh. Sẽ bị mất sau khi chết.",me.szName,nVIP);
					--KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
					--KDialog.MsgToGlobal(szMsg);
				else
					me.RemoveSkillState(DuoBao.VIPSkillId);
					me.RemoveSkillState(DuoBao.SkillId);
					me.AddSkillState(DuoBao.SkillId, 1, 1, nRemainFrame, 0, 1, 1);
					--szMsg = string.format("<color=yellow>[%s]<color> ảnh hưởng kĩ năng VIP <color=yellow>%d<color>. Cải thiện sức mạnh đáng kể. Sẽ bị mất sau khi chết.",me.szName,nVIP);
					--KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
					--KDialog.MsgToGlobal(szMsg);
				end
			end
		else
			--战斗已结束
			local szMsg = string.format("<color=yellow>[%s]<color> nhận được <color=yellow>[Bảo vật]<color>",me.szName);
			KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
			KDialog.MsgToGlobal(szMsg);
		end
	end
	return	1;
end

function tbDBBox:OnUse()
	local szMsg = "";
	local tbOpt = {};
	local itemType = tonumber(it.GetExtParam(1));
	if itemType == 1 then
		if DuoBao.tbMission and (DuoBao.tbMission[DuoBao.NowType]) and (DuoBao.tbMission[DuoBao.NowType].nState) and (DuoBao.tbMission[DuoBao.NowType].nState ~= 0) then
			table.insert(tbOpt, {"Ta đã hiểu"});
			Dialog:Say("Bảo vật đã được niêm phong, chỉ thời gian kết thúc hoạt động mới có thể mở", tbOpt);
		else
			if (me.CountFreeBagCell() < 1) then
				table.insert(tbOpt, {"Ta đã hiểu"});
				Dialog:Say("Hành trang không đủ 1 ô trống", tbOpt);
				return 0;
			else
				local pItem = me.AddItem(unpack(tbDBBox.GiftItem)).Bind(1);
				szMsg = string.format("<color=yellow>[%s]<color> mở khóa <color=yellow> [Bảo vật]đấu trường<color>.",me.szName);
				KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
				KDialog.MsgToGlobal(szMsg);
				return 1;
			end
		end
		return 0;
	else
		--开启宝箱获得奖励
		local nBagNum = NVip.OnlineGiftBox[DuoBao.GiftId][1];
		local nBindCoin = NVip.OnlineGiftBox[DuoBao.GiftId][2];
		local nJBCoin = NVip.OnlineGiftBox[DuoBao.GiftId][3];
		local tbItemList = NVip.OnlineGiftBox[DuoBao.GiftId][4];
		
		if (me.CountFreeBagCell() < nBagNum) then
			Dialog:Say(string.format("Hành trang không đủ %s ô trống",nBagNum));
			return;
		end
		if nBindCoin > 0 then me.AddBindCoin(nBindCoin); end
		if nJBCoin > 0 then me.AddJbCoin(nJBCoin); end
		--for nItemPK in tbItemList do
		for ni, tbItem in pairs(tbItemList) do
			me.AddStackItem(unpack(tbItem));
		end
		local szMsg = string.format("Xin chúc mừng <color=yellow>[%s]<color> nhận được <color=yellow>[%s]<color>.", me.szName,it.szName);
		KDialog.NewsMsg(0, Env.NEWSMSG_COUNT, szMsg);
		KDialog.MsgToGlobal(szMsg);	
		return 1;
	end
end