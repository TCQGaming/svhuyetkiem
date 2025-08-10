local tbItem = Item:GetClass("skillpartnerBoDuyPhong");

tbItem.SkillRate = {
	[0] = 100,
	[1] = 100,
	[2] = 100,
	[3] = 90,
	[4] = 80,
	[5] = 70,
	[6] = 10,
	[7] = 0,
	[8] = 0,
	[9] = 0,
	[10] = 0,
}

function tbItem:OnUse()
DoScript("\\script\\webjx\\partner\\skillpartnerBoDuyPhong.lua");
	if (Partner.bOpenPartner ~= 1) then
		Dialog:Say("Hệ thống đồng hành chưa mở");
		return 0;
	end	
	local szMsg = "   Sử dụng kỹ năng bạn đồng hành này, bạn đồng hành của bạn sẽ có kĩ năng mới, hoặc thay thế các kỹ năng đồng hành hiện có.<color=yellow> Càng ít kĩ năng xác suất kĩ năng mới càng cao, cao nhất là 7 kĩ năng<color><enter><color=red>     Đặc biệt chú ý khi sử dụng! Nếu kỹ năng đã tồn tại thì không thể sử dụng được<color>. Chắc chắn sử dụng không??";
	local tbOpt = {};
	
	for i = 1, me.nPartnerCount do
		local pPartner = me.GetPartner(i - 1);
		
		if pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_LEVEL) < 120 then
			Dialog:Say("Đồng hành chưa đạt cấp 120 chưa thể sử dụng!", {"Ta biết rồi"});
			return 0;
		end
		
		if pPartner then
			table.insert(tbOpt, {pPartner.szName, self.AddNewSkill, self, i - 1, it.dwId});
		end
	end
	
	if #tbOpt == 0 then
		me.Msg("Bạn không có đồng hành!");
		Dialog:Say("Bạn không có đồng hành!");
		return 0;
	end
	
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbItem:AddNewSkill(nIndex, dwId)
	local pPartner = me.GetPartner(nIndex);
	local pItem = KItem.GetObjById(dwId);

	local pSkillId = tonumber(pItem.GetExtParam(2)); 
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner or not pItem then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = tbItem.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("Đồng hành của bạn không thể dùng kĩ năng <color=green>%s<color> ",pSkillName));
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then
			Dialog:Say(string.format("Đồng hành của bạn không nhận được kĩ năng này vì đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507) then
			Dialog:Say(string.format("Đồng hành của bạn không nhận được kĩ năng này vì đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
			return 0;
		end
		if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then
			Dialog:Say(string.format("Đồng hành của bạn không nhận được kĩ năng này vì đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1496) and (pSkillId >=1492) and (pSkillId <=1496) then
			Dialog:Say(string.format("Đồng hành của bạn không nhận được kĩ năng này vì đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
			return 0;
		end
	end
	local nRandom = MathRandom(1,100);
	me.Msg(string.format("Xác suất nhận được skill mới [%d]，Xác xuất thay thế kĩ năng cũ [%d].",nNewSkillRate,nRandom));
	if nRandom <= nNewSkillRate then
		local tbAddSkill = {};
		tbAddSkill.nId = pSkillId;
		tbAddSkill.nLevel = 1;	
		pPartner.AddSkill(tbAddSkill);	
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
	else
		nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận kĩ năng <color=green>[%s]<color> thay thế kĩ năng <color=green>[%s]<color>!",pSkillName,KFightSkill.GetSkillName(SkillList[nRandom].nId)));
	end
	pItem.Delete(me);
	return 1;
end