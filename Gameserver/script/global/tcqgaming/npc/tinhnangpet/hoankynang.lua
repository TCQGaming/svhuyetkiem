----Dev TCQGaming
----02/04/2023 3:43
--- fb.com/xboy.hd

local hoankynangpet ={};
SpecialEvent.hoankynangpet= hoankynangpet;

hoankynangpet.tbSkillList = {
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
-- local XacXuat = 0
	-- local nHTB = me.GetItemCountInBags(18,1,377,1) 
	-- if nHTB == 1 then 
	-- XacXuat = 30
	-- elseif nHTB == 2 then 
	-- XacXuat = 50
	-- elseif nHTB == 3 then 
	-- XacXuat = 70
	-- elseif nHTB == 4 then 
	-- XacXuat = 90
	-- else 
	-- XacXuat = 10
	-- end
	
-- hoankynangpet.SkillRate = {
	-- [0] = XacXuat,
	-- [1] = XacXuat,
	-- [2] = XacXuat,
	-- [3] = XacXuat,
	-- [4] = XacXuat,
	-- [5] = XacXuat,
-- }


function hoankynangpet:OnDialog() 
DoScript("\\script\\global\\tcqgaming\\npc\\tinhnangpet\\hoankynang.lua");
	if (Partner.bOpenPartner ~= 1) then
		Dialog:Say("Hệ thống đồng hành chưa mở");
		return 0;
	end
	local szMsg = "Sử dụng<color=yellow> <enter>300 Thất Sắc Hồn + 300 Vạn Đồng<color> <enter>để khai thiên <color=red> tái tạo kĩ năng thứ 5 và 6 <color> ngẫu nhiên để thay thế kĩ năng cũ , nếu xui bạn sẽ nhận được kỹ năng đã có sẵn <enter>chắc chắn sử dụng không?\n<color=red>Thất bại mất 300 vạn đồng và 300 Thất Sắc Hồn\nNếu như bạn để trong hành trang 4 Hòa Thị Ngọc tỉ lệ tái tạo là 100% thành công";
	local tbOpt = {};
	
	for i = 1, me.nPartnerCount do
		local pPartner = me.GetPartner(i - 1);
		
		if pPartner.GetValue(Partner.emKPARTNERATTRIBTYPE_LEVEL) < 120 then
			Dialog:Say("Đồng hành chưa đạt cấp 120 chưa thể sử dụng!", {"Ta biết rồi"});
			return 0;
		end
		if pPartner then
			if pPartner.nSkillCount < 6 then
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


function hoankynangpet:AddNewSkill(nIndex)
	local pPartner = me.GetPartner(nIndex);
	local nCheck = pPartner.szName
	local tbThatSacHon = me.GetItemCountInBags(18,1,2026,1)
	local nThatSacHon	= {18,1,2026,1,0,0};
	local nHTBXoa	= {22,1,81,1,0,0};
-- pPartner.DeleteAllSkill();
	local XacXuat = 0
	local nHTB = me.GetItemCountInBags(22,1,81,1) 
	if nHTB == 1 then 
	XacXuat = 25
	elseif nHTB == 2 then 
	XacXuat = 50
	elseif nHTB == 3 then 
	XacXuat = 75
	elseif nHTB > 4 then 
	XacXuat = 100
	else 
	XacXuat = 10
	end
	
hoankynangpet.SkillRate = {
	[0] = XacXuat,
	[1] = XacXuat,
	[2] = XacXuat,
	[3] = XacXuat,
	[4] = XacXuat,
	[5] = XacXuat,
}
local nDong = me.GetJbCoin()
if nDong < 300*10000 then 
	Dialog:Say("Bạn chưa đủ 300 vạn đồng thường rồi")
return 
end
if nCheck == "Bảo Ngọc" or "Tử Uyển" or "Diệp Tịnh"  or "Hạ Tiểu Sảnh"  or "Oanh Oanh"  or "Mộc Siêu" or "Tần Trọng"  then
	if  tbThatSacHon > 300 then
	local nRandom = MathRandom(1,24);
	local pSkillId = hoankynangpet.tbSkillList[nRandom];
	local pSkillName = KFightSkill.GetSkillName(pSkillId);
	if not pPartner then
		return 0;
	end

	local SkillList = {};

	local nNewSkillRate = hoankynangpet.SkillRate[pPartner.nSkillCount];

	local oldSkillCount = pPartner.nSkillCount;

	for i = 1, pPartner.nSkillCount do
		local tbSkill = pPartner.GetSkill(i - 1);
		SkillList[i]=tbSkill;
		if tbSkill.nId == pSkillId then
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",pSkillName));
				Task:DelItem(me, nThatSacHon, 2);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1517) and (tbSkill.nId <= 1521) and (pSkillId >=1517) and (pSkillId <=1521) then-----Phá Không Trảm Ảnh
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nThatSacHon, 2);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1503) and (tbSkill.nId <= 1507) and (pSkillId >=1503) and (pSkillId <=1507)  then-------Ngũ Hành Vô Tướng
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nThatSacHon, 2);
									me.AddJbCoin(-30*10000)
			return 0;
		end
		if (tbSkill.nId >= 1492) and (tbSkill.nId <= 1501) and (pSkillId >=1492) and (pSkillId <=1501) then-----Như Mộc Xuân Phong
			Dialog:Say(string.format("<color=red>Thật đáng tiếc<color> bạn vừa nhận được kỹ năng đã có <color=green>%s<color> ",KFightSkill.GetSkillName(SkillList[i].nId)));
				Task:DelItem(me, nThatSacHon, 2);
									me.AddJbCoin(-30*10000)
			return 0;
		end
	end

	local nRandom = MathRandom(1,99);
	me.Msg(string.format("Xác suất nhận được skill mới [%d] ，Xác xuất thay thế kĩ năng cũ [%d].",nNewSkillRate,nRandom));
	if nRandom <= nNewSkillRate then
		local tbAddSkill = {};
		tbAddSkill.nId = pSkillId;
		tbAddSkill.nLevel = 1;	
		pPartner.AddSkill(tbAddSkill);	
						Task:DelItem(me, nHTBXoa, 4);
										Task:DelItem(me, nThatSacHon, 300);
									me.AddJbCoin(-300*10000)
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
	else
		nRandom = MathRandom(1,pPartner.nSkillCount);
		SkillList[nRandom].nId = pSkillId;
		pPartner.DeleteAllSkill();
		for i = 1, oldSkillCount do
			pPartner.AddSkill(SkillList[i]);
		end
						Task:DelItem(me, nThatSacHon, 2);
									me.AddJbCoin(-30*10000)
		Dialog:Say(string.format("Đồng hành của bạn nhận mới kĩ năng <color=green>[%s]<color>",pSkillName));
	end
				-- Task:DelItem(me, nThatSacHon, 300);
									-- me.AddJbCoin(-300*10000)
										else
		Dialog:Say("Trong hành trang của bạn không có <enter><color=green> 300 Thất Sắc Hồn<enter><color=red> Hãy mang nó tới đây thì mới có thể tái tạo kỹ năng")
		return 0;
end	
		else
				Dialog:Say("<color=red>Chú ý : Đồng hành này không thể tẩy kỹ năng rồi <color>\nCó thể bạn chưa biết Đồng Hành Có thể Tẩy là: <color=yellow>\nBảo Ngọc\nHạ Tiểu Sảnh\nOanh Oanh\nMộc Siêu\nTừ Uyển\nTần Trọng\nDiệp Tịnh");
		return 0
end
end

