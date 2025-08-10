local tbItem = Item:GetClass("skillpartnerBoDuyPhong1");
tbItem.tbSkillList = {1491,1492,1493,1494,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522}

function tbItem:OnUse()
DoScript("\\script\\webjx\\partner\\skillpartnerBoDuyPhong1.lua");
	if (Partner.bOpenPartner ~= 1) then
		Dialog:Say("Hệ thống đồng hành chưa mở");
		return 0;
	end
	
	local szMsg = "    Sử dụng Tẩy tủy kinh (trung cấp) để thay thế <color=red> kĩ năng<color> được chỉ định để thay thế kĩ năng cũ. <enter> Sử dụng Tẩy tủy kinh (trung cấp) để thay thế <color=red> kĩ năng<color> được chỉ định thay thế hoặc thêm mới năng thứ 7-10 <enter> <color=red>	Đạo cụ dùng chỉ tăng tối đa 10 kĩ năng <color>, chắc chắn sử dụng không?";
	local tbOpt = {};
	
	for i = 1, me.nPartnerCount do
		local pPartner = me.GetPartner(i - 1);

		if pPartner then
			if pPartner.nSkillCount >= 6 then
				table.insert(tbOpt, {pPartner.szName.."["..pPartner.nSkillCount.." ]", self.SelectOldSkill, self, pPartner, it});
			end
		end
	end
	
	if #tbOpt == 0 then
		me.Msg("Bạn chưa có đồng hành!");
		Dialog:Say("Bạn chưa có đồng hành!");
		return 0;
	end
	
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbItem:SelectOldSkill(pPartner,pItem)
	local tbOpt = {};
	local szMsg = "    Chọn kĩ năng đồng hành ["..pPartner.szName.."] để thay thế kĩ năng mới";
	local nSkillList = {};
	local pType = tonumber(pItem.GetExtParam(1)); 
	
	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		nSkillList[i]=tbSkill;
		table.insert(tbOpt,{""..i.."<color=green> "..KFightSkill.GetSkillName(nSkillList[i].nId).."<color>",self.SelectNewSkill, self, pPartner,pItem,nSkillList,i,nSkillList[i].nId})
	end
	
		if pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_LEVEL) < 120 then
			Dialog:Say("Đồng hành chưa đạt cấp 120 chưa thể sử dụng!", {"Ta biết rồi"});
			return 0;
		end

	if ((pPartner.nSkillCount == 6) and (pType==2)) then
	
		table.insert(tbOpt, {"<color=yellow>Tăng <color><color=red>mới<color> kỹ năng thứ bảy",self.SelectNewSkill,self,pPartner,pItem,nSkillList,7,0});
	end
	if ((pPartner.nSkillCount == 7) and (pType==2)) then
		table.insert(tbOpt, {"<color=yellow>Tăng <color><color=red>mới<color> kỹ năng thứ tám",self.SelectNewSkill,self,pPartner,pItem,nSkillList,8,0});
	end
	if ((pPartner.nSkillCount == 8) and (pType==2)) then
		table.insert(tbOpt, {"<color=yellow>Tăng <color><color=red>mới<color> kỹ năng thứ chín",self.SelectNewSkill,self,pPartner,pItem,nSkillList,9,0});
	end
	if ((pPartner.nSkillCount == 9) and (pType==2)) then
		table.insert(tbOpt, {"<color=yellow>Tăng <color><color=red>mới<color> kỹ năng thứ mười",self.SelectNewSkill,self,pPartner,pItem,nSkillList,10,0});
	end
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbItem:SelectNewSkill(pPartner,pItem,OldSkillList,nOldSkillIndex,nOldSkillId)
	local tbOpt = {};
	local szMsg = "    Vui lòng chọn các kỹ năng cần thêm mới!";
	for i = 1491,1522 do
		local IfCan = true;
		for j = 1,#OldSkillList do
			if OldSkillList[j].nId == i then
				IfCan=false;
			end
			if (i >= 1517) and (i <= 1521) and (OldSkillList[j].nId >=1517) and (OldSkillList[j].nId <=1521) then
				IfCan=false;
			end
			if (i >= 1503) and (i <= 1507) and (OldSkillList[j].nId >=1503) and (OldSkillList[j].nId <=1507) then
				IfCan=false;
			end
			if (i >= 1497) and (i <= 1501) and (OldSkillList[j].nId >=1497) and (OldSkillList[j].nId <=1501) then
				IfCan=false;
			end
			if (i >= 1492) and (i <= 1496) and (OldSkillList[j].nId >=1492) and (OldSkillList[j].nId <=1496) then
				IfCan=false;
			end
		end
		if IfCan then
			table.insert(tbOpt,{"<color=green>"..KFightSkill.GetSkillName(i).."<color>",self.SelectReSkill, self, pPartner,pItem,i,OldSkillList,nOldSkillIndex,nOldSkillId});
		end
	end
	table.insert(tbOpt, {"Kết thúc đối thoại"});
	Dialog:Say(szMsg, tbOpt);
	return 0;
end

function tbItem:SelectReSkill(pPartner,pItem,NewSkillId,OldSkillList,nOldSkillIndex,nOldSkillId)
	local nOldSkillName = "";
	if nOldSkillId == 0 then
		local tbSkill = {};
		tbSkill.nLevel = 1;
		OldSkillList[nOldSkillIndex] = tbSkill;
		nOldSkillName = "<color><color=red>Vị trí kỹ năng thứ " ..nOldSkillIndex;
	else
		nOldSkillName = KFightSkill.GetSkillName(nOldSkillId);
	end
	
	OldSkillList[nOldSkillIndex].nId = NewSkillId;
	
	pPartner.DeleteAllSkill();
	for i = 1, #OldSkillList do
		pPartner.AddSkill(OldSkillList[i]);
	end
	Dialog:Say(string.format("Đồng hành của bạn học kỹ năng <color=green>[%s]<color> thay thế kĩ năng <color=green>[%s]<color>！",KFightSkill.GetSkillName(NewSkillId),nOldSkillName));
	pItem.Delete(me);
	return 1;
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
			Dialog:Say(string.format("Đồng hành của bạn nhận được kĩ năng <color=green>%s<color> ",pSkillName));
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
		Dialog:Say(string.format("Đồng hành của bạn nhận kĩ năng <color=green>[%s]<color> thay thế kĩ năng <color=green>[%s]<color>！",pSkillName,KFightSkill.GetSkillName(SkillList[nRandom].nId)));
	end
	pItem.Delete(me);
	return 1;
end