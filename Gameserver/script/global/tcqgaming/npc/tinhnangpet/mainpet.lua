----Dev TCQGaming
----02/04/2023 3:43
--- fb.com/xboy.hd

local mainpet ={};
SpecialEvent.mainpet= mainpet;

mainpet.tbSkillList = {
[0] = 1492,-------Ích Thọ Âm Dương-Tuyệt
[1] = 1493,-------Ích Thọ Âm Dương-Cực
[2] = 1494,---------Ích Thọ Âm Dương-Chấn
[3] = 1495,---------Ích Thọ Âm Dương-Hàn
[4] = 1496,--------Ích Thọ Âm Dương-Minh
[5] = 1497,---------Như Mộc Xuân Phong-Tuyệt
[6] = 1498,---------Như Mộc Xuân Phong-Cực
[7] = 1499,------Như Mộc Xuân Phong-Chấn
[8] = 1500,------Như Mộc Xuân Phong-Hàn
[9] = 1501,--------Như Mộc Xuân Phong-Minh
[10] = 1503,-------Ngũ Hành Vô Tướng-Phục Thạch
[11] = 1504,-------Ngũ Hành Vô Tướng-Chu Thiềm
[12] = 1505,--------Ngũ Hành Vô Tướng-Nghịch Thủy
[13] = 1506,------Ngũ Hành Vô Tướng-Việt Quang
[14] = 1507,-------Ngũ Hành Vô Tướng-Cự Mộc
[15] = 1509,-------Vô Niệm Kinh
[16] = 1511,------Kinh Hồng Nhất Kích Chí mạng
[17] = 1513,------Hư Không Thiểm Ảnh
[18] = 1515,-------Từ Bi Tế Vũ
[19] = 1517,--------Phá Không Trảm Ảnh-Bạch Hổ
[20] = 1518,--------Phá Không Trảm Ảnh-X
[21] = 1519,--------Phá Không Trảm Ảnh-X
[22] = 1520,--------Phá Không Trảm Ảnh-X
[23] = 1521,--------Phá Không Trảm Ảnh-X
[24] = 1522,--------Phá Không Trảm Ảnh-X
}
mainpet.SkillRate = {
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

function mainpet:OnDialog() 
-- DoScript("\\script\\global\\tcqgaming\\npc\\tinhnangpet\\mainpet.lua");
-- DoScript("\\script\\global\\tcqgaming\\item\\NewAlphaTest.lua");
	if (Partner.bOpenPartner ~= 1) then
		Dialog:Say("Hệ thống đồng hành chưa mở");
		return 0;
	end
	local szMsg = "Sử dụng<color=yellow> <enter>Linh Hồn đồng hành + 30 Vạn Đồng<color> <enter>để tẩy <color=red> kĩ năng<color> ngẫu nhiên để thay thế kĩ năng cũ , nếu xui bạn sẽ nhận được kỹ năng đã có sẵn <enter>chắc chắn sử dụng không?\n<color=red>Thất bại mất 30 vạn đồng và 1 linh hồn";
	local tbOpt = {};
	
	for i = 1, me.nPartnerCount do
		local pPartner = me.GetPartner(i - 1);
		
		if pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_LEVEL) < 120 then
			Dialog:Say("Đồng hành chưa đạt cấp 120 chưa thể sử dụng!", {"Ta biết rồi"});
			return 0;
		end
		if pPartner then
			if pPartner.nSkillCount >= 4 then
			table.insert(tbOpt, {pPartner.szName, self.AddNewSkill, self, i - 1});
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


function mainpet:AddNewSkill(nIndex)
	local pPartner = me.GetPartner(nIndex);
	local nCheck = pPartner.szName
	local nLinhHonDiepTinh = me.GetItemCountInBags(18,1,2026,2) 
	local nLinhHonBaoNgoc = me.GetItemCountInBags(18,1,2026,3) 
	local nLinhHonHaTieuSanh = me.GetItemCountInBags(18,1,2026,4) 
	local nLinhHonOanhOanh = me.GetItemCountInBags(18,1,2026,5)
	local nLinhHonMocSieu = me.GetItemCountInBags(18,1,2026,6) 
	local nLinhHonTuUyen = me.GetItemCountInBags(18,1,2026,7) 
	local nLinhHonTanTrong = me.GetItemCountInBags(18,1,2026,8)
	local nDiepTinh	= {18,1,2026,2,0,0};
	local nBaoNgoc	= {18,1,2026,3,0,0};
	local nHaTieuSanh	= {18,1,2026,4,0,0};
	local nOanhOanh	= {18,1,2026,5,0,0};
	local nMocSieu	= {18,1,2026,6,0,0};
	local nTuUyen	= {18,1,2026,7,0,0};
	local nTanTrong	= {18,1,2026,8,0,0};
local nDong = me.GetJbCoin()
if nDong < 30*10000 then 
	Dialog:Say("Bạn chưa đủ 30 vạn đồng thường rồi")
return 
end
	if nCheck == "Bảo Ngọc" then
	if nLinhHonBaoNgoc > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nBaoNgoc, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nBaoNgoc, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nBaoNgoc, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nBaoNgoc, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nBaoNgoc, 1);
				me.AddJbCoin(-30*10000)
				else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end			
elseif nCheck == "Diệp Tịnh" then
if nLinhHonDiepTinh > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nDiepTinh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nDiepTinh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nDiepTinh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nDiepTinh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nDiepTinh, 1);
					me.AddJbCoin(-30*10000)
				else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
	elseif nCheck == "Hạ Tiểu Sảnh" then
	 if  nLinhHonHaTieuSanh > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nHaTieuSanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end

		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nHaTieuSanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nHaTieuSanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nHaTieuSanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nHaTieuSanh, 1);
					me.AddJbCoin(-30*10000)
		else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
	elseif  nCheck == "Oanh Oanh" then 
	if nLinhHonOanhOanh > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nOanhOanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nOanhOanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nOanhOanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nOanhOanh, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nOanhOanh, 1);
					me.AddJbCoin(-30*10000)
						else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
	elseif  nCheck == "Mộc Siêu" then 
	if nLinhHonMocSieu > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nMocSieu, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nMocSieu, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nMocSieu, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nMocSieu, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nMocSieu, 1);
					me.AddJbCoin(-30*10000)
										else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
	elseif nCheck == "Tử Uyển" then 
	if  nLinhHonTuUyen > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nTuUyen, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTuUyen, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTuUyen, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTuUyen, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		-- if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1496) and (pSkillId >=1492) and (pSkillId <=1496) then------Ích Thọ Âm Dương
			-- Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				-- Task:DelItem(me, nTuUyen, 1);
			-- return 0;
		-- end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nTuUyen, 1);
									me.AddJbCoin(-30*10000)
										else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
	elseif nCheck == "Tần Trọng" then 
	if  nLinhHonTanTrong > 0 then
	local nRandom = MathRandom(1,24);
	local pSkillId = mainpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = mainpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nTanTrong, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTanTrong, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTanTrong, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
		-- if (tbSkill.nId >= 1497) and (tbSkill.nId <= 1501) and (pSkillId >=1497) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nTanTrong, 1);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end
		local nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
				Task:DelItem(me, nTanTrong, 1);
									me.AddJbCoin(-30*10000)
										else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> Linh Hồn "..nCheck.." <enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
		end	
		else
				Dialog:Say("<color=red>Chú ý : Đồng hành này không thể tẩy kỹ năng rồi <color>\nCó thể bạn chưa biết Đồng Hành Có thể Tẩy là: <color=yellow>\nBảo Ngọc\nHạ Tiểu Sảnh\nOanh Oanh\nMộc Siêu\nTừ Uyển\nTần Trọng\nDiệp Tịnh");
		return 0
		end
end

