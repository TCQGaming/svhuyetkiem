
local tbNpc = Npc:GetClass("qianzhuang");

function tbNpc:OnDialog()
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản của bạn bị khóa, không thể thực hiện thao tác này!");
		return;
	end
	local tbOpt = {
			{"<color=yellow>Cửa Tiệm Phi Phong<color>", self.OnOpenShop, self, me},
			-- {"<color=yellow>Cửa Tiệm Mật Tịch Trung<color>",SpecialEvent.BanMatTichTrung.OnDialog,SpecialEvent.BanMatTichTrung};
			-- {"<color=yellow>Cửa Tiệm Mật Tịch Trung giá 0 NHHT<color>",SpecialEvent.MatTichMienPhi.OnDialog,SpecialEvent.MatTichMienPhi};
			{"<color=yellow>Cửa Tiệm Mật Tịch Cao giá 0 TDL<color>",SpecialEvent.MatCaoMienPhi.OnDialog,SpecialEvent.MatCaoMienPhi};
			-- {"<color=yellow>Mua Trận Pháp Trung (+597 Tài Phú)<color>", self.hoimuatran, self, me},
			{"Đổi ngũ hành hồn thạch", Dialog.Gift, Dialog, "Item.ChangeGift"},
			{"Đổi phi phong", self.SaleMantle, self},
			{"<color=yellow>Cửa Tiệm Phi Phong (Mua Ngay)<color>", self.ShopMuaNgay, self},
			{"<color=yellow>Luyện Nhanh Mật Tịch<color>\n<color=green>(Miễn phí)", self.LuyenNhanh, self},
			{"<color=yellow>Cửa Tiệm Phi Phong (Kim Cương)<color>", self.ShopPpKc, self},
			{"<color=yellow>Xóa Bỏ Kỹ Năng Mật Tịch Phái Nếu Quá Nhiều<color>", self.xoamattichphaine, self},
			{"Kết thúc đối thoại"},
		};
	--if IVER_g_nSdoVersion == 0 then
		--table.insert(tbOpt, 1, {"Tiền trang", self.OpenBank, self});
	--end
	Dialog:Say(me.szName.."，ngươi muốn mua gì nào ?",tbOpt);
end
-------------------------------------------------------------------------------------
tbNpc.nMijiLevel			= 100;	
tbNpc.nAddedKarmaPerTime	= 3000;		
function tbNpc:LuyenNhanh()
	-- local nDongRut = me.GetTask(3028,1)
	-- if nDongRut < 1000 then
		-- Dialog:Say("Bạn chưa đạt mốc tích lũy nạp tiền 1000 Vạn Đồng");
		-- return 0;
	-- end
	local pItem		= me.GetEquip(Item.EQUIPPOS_BOOK);
	if (not pItem) then
        Dialog:Say("1. Trang bị mật tịch lên <color=yellow>Thuộc Tính Nhân Vật (F1)<color> mới có thể luyện max mật tịch!", {"Kết thúc đối thoại !"}); 
		return;
	end
	local nLevel = pItem.GetGenInfo(1);
	if nLevel >=  self.nMijiLevel then
		me.Msg("Cấp độ đã đạt mức cao nhất");
		return;
	end
	for i = 1, 1000 do
		local nLevel = pItem.GetGenInfo(1);			-- 秘籍当前等级
		if (nLevel >= self.nMijiLevel) then
			break;
		end
		Item:AddBookKarma(me, self.nAddedKarmaPerTime);
	end
	
end

function tbNpc:xoamattichphaine()
	local szMsg = "Nếu bạn học quá nhiều mật tịch các hệ phái khi Full Kỹ năng Bấm F3 phần xem chung dis Game thì hãy xóa những kỹ năng không dùng đến các hệ phái sau này nếu chơi thì luyện lại"
    local tbOpt =     {} 
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Thiếu Lâm<color>",self.xoamattichphai,self,1});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Thiên Vương<color>",self.xoamattichphai,self,2});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Đường Môn<color>",self.xoamattichphai,self,3});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Ngũ Độc<color>",self.xoamattichphai,self,4});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Nga My<color>",self.xoamattichphai,self,5});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Thúy Yên<color>",self.xoamattichphai,self,6});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Cái Bang<color>",self.xoamattichphai,self,7});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Thiên Nhẫn<color>",self.xoamattichphai,self,8});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Võ Đang<color>",self.xoamattichphai,self,9});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Côn Lôn<color>",self.xoamattichphai,self,10});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Minh Giáo<color>",self.xoamattichphai,self,11});
			table.insert(tbOpt, {"Xóa Mật Tịch Trung Cao Phái <color=yellow>Đoàn Thị<color>",self.xoamattichphai,self,12});

						table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
function tbNpc:xoamattichphai(nIndex)
if nIndex == 1 then --- Thiếu Lâm 
me.DelFightSkill(1241);--Đại Thừa Như Lai Chú Đao Thiếu-- MT Cao
me.DelFightSkill(1242);--Như Ý Thúc Cốt Công Côn Thiếu-----MT Cao
me.DelFightSkill(1200);--Đạt ma bế tức Đao Thiếu-- mt trung
me.DelFightSkill(1201);--Đạt ma bế tức Côn Thiếu-- mt trung
elseif  nIndex == 2 then --- Thiên Vương 
me.DelFightSkill(1202);--Phi Kinh Trảm Thích -- MT trung cả 2 đường 
me.DelFightSkill(1243);--Liên Hoàn Đoạt Mệnh Thưong tvt-- MT cao
me.DelFightSkill(1244);--càn khôn chùy tvc-- MT cao
elseif nIndex == 3 then --- Đường môn 
me.DelFightSkill(1204);--Mãn Thiên Hoa Vũ -- MT trung 
me.DelFightSkill(1246);--Xuyên vân tiễn 
me.DelFightSkill(1203);--Hàm Sa Xạ Ảnh mt trung hãm tĩnh
me.DelFightSkill(1245);--Mê Hồn Trận- cao - hãm tĩnh
elseif nIndex == 4 then --- Ngũ Độc
me.DelFightSkill(1205);--Hóa Huyết Tiệt Mạch - 5dd
me.DelFightSkill(1206);--Truy phong độc thích - 5dc
me.DelFightSkill(1247);--Huyết Đỉnh Công - 5dd
me.DelFightSkill(1248);--Luyện Ngục Hủ Cổ - 5dc
elseif nIndex == 5 then --- Nga My
me.DelFightSkill(1207);--Kim Đỉnh Miên Chưởng - NMC
me.DelFightSkill(1208);--Độ Nguyên Công - nmk
me.DelFightSkill(1249);--Vạn Tướng Thần Công - nmc
me.DelFightSkill(1250);--Liên Hoa Tâm Kinh - nmk
elseif nIndex == 6 then --- Thúy Yên
me.DelFightSkill(1209);--Vũ Đả Lê Hoa - TYC
me.DelFightSkill(1251);--Phi Tự Phiêu Hoa - TYC - mt cao
me.DelFightSkill(1210);--Đạp Tuyết Vô Ngấn - TYD
me.DelFightSkill(1252);--Dạ Lai Tây Phong - TYD - mt cao
elseif nIndex == 7 then --- Cái Bang
me.DelFightSkill(1212);--Thâu Long Chuyển Phượng - CBB
me.DelFightSkill(1211);--Thần Long Bài Vĩ - CBR
me.DelFightSkill(1253);--Bá Vương Tá Giáp - CBR - mt cao
me.DelFightSkill(1254);--Minh Sát Thu Hào - CBB - mt cao
elseif nIndex == 8 then --- Thiên Nhẫn
me.DelFightSkill(1213);--Bích Nguyệt Phi Tinh - kích trung
me.DelFightSkill(1214);--Huyền Minh Hấp Tinh - ma nhẫn trung
me.DelFightSkill(1255);--Cửu khúc hợp thương - tnk
me.DelFightSkill(1256);--Nghịch Chuyển Tâm Kinh - ma nhẫn ca0
elseif nIndex == 9 then --- Võ Đang
me.DelFightSkill(1215);--Lưỡng nghi tâm pháp - khí võ trung
me.DelFightSkill(1216);--Lưu  tinh cản nguyệt - kiếm võ trung
me.DelFightSkill(1257);--Bát quái du long
me.DelFightSkill(1258);--Lưỡng Nghi Kiếm Pháp
elseif nIndex == 10 then --- Côn Lôn
me.DelFightSkill(1217);--Lưỡng nghi chân khí - CLD
me.DelFightSkill(1259);--phản lưỡng nghi đao pháp - CLD
me.DelFightSkill(1218);--Hóa tủy vô ý - CLS
me.DelFightSkill(1260);--ngự phong thuật - CLS
elseif nIndex == 11 then ---Minh Giáo
me.DelFightSkill(1219);--Lưu Tinh Chùy - MGC
me.DelFightSkill(1220);--Nhân Huân Tử Khí - MGK
me.DelFightSkill(1261);--Hồn Phách Phi Dương - MGC
me.DelFightSkill(1262);--Mục Dã Ưng Dương - MGK
elseif nIndex == 12 then --- Đoàn Thị
me.DelFightSkill(1222);--Bách Hồng Thực Nhật - DTK - mt trung
me.DelFightSkill(1264);--Luyện Khí Hoàn Thần - DTK - mt cao
me.DelFightSkill(1221);--Bách Bộ Xuyên Dương - DTC - mt trung
me.DelFightSkill(1263);--Huyền Băng Cửu Kiếp - DTC - mt cao
else 
Dialog:Say("Bạn chưa hề gia nhập môn phái")
end 
Dialog:Say("Đã xóa thành công")
end 

function tbNpc:ShopPpKc()
	local tbOpt = {
			-- {"<color=yellow>Tiếp tục thao tác với Phi Phong Cũ<color>", self.muaphiphongcune, self},
			{"<color=yellow>Tiếp tục thao tác<color>", self.Dongmuaf, self},
			{"Kết thúc đối thoại"},
		};
	Dialog:Say(me.szName.."，\nKhi bạn đạt mốc tích lũy rút đồng là : <color=yellow>\n23000 vạn Đồng<color>\nSẽ được phép thay đổi hình ảnh phi phong và mua miễn phí không mất NHHT tại đây",tbOpt);
end

function tbNpc:muaphiphongcune()
	local nSeries = me.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Bạn hãy gia nhập phái");
		return;
	end

	local nSoDuThe = me.GetTask(3028,1)
	if nSoDuThe < 16375 then
	Dialog:Say("Bạn cần tích lũy nạp đủ 16375 vạn đồng");
	return 0;
	end

	local nNguHanh = me.nSeries;
	local nCapPp = PlayerHonor:GetHonorLevel(me, PlayerHonor.HONOR_CLASS_MONEY);
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then
		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		-- if pItem then
			-- me.SetItemTimeout(pItem, 30*24*60,0);
		-- end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		-- if pItem then
			-- me.SetItemTimeout(pItem, 30*24*60,0);
		-- end
	end
end

function tbNpc:Dongmuaf()
	local nSeries = me.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Bạn hãy gia nhập phái");
		return;
	end

	local nSoDuThe = me.GetTask(3028,1)
	if nSoDuThe < 23000 then
	Dialog:Say("Bạn cần tích lũy nạp đủ 23000 vạn đồng");
	return 0;
	end

	local nNguHanh = me.nSeries;
	local nCapPp = PlayerHonor:GetHonorLevel(me, PlayerHonor.HONOR_CLASS_MONEY);
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then
		if nNguHanh == 1 then
			szIdItem = 11;
		elseif nNguHanh == 2 then
			szIdItem = 13;
		elseif nNguHanh == 3 then
			szIdItem = 15;
		elseif nNguHanh == 4 then
			szIdItem = 17;
		elseif nNguHanh == 5 then
			szIdItem = 19;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		-- if pItem then
			-- me.SetItemTimeout(pItem, 30*24*60,0);
		-- end
	else
		if nNguHanh == 1 then
			szIdItem = 12;
		elseif nNguHanh == 2 then
			szIdItem = 14;
		elseif nNguHanh == 3 then
			szIdItem = 16;
		elseif nNguHanh == 4 then
			szIdItem = 18;
		elseif nNguHanh == 5 then
			szIdItem = 20;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		-- if pItem then
			-- me.SetItemTimeout(pItem, 30*24*60,0);
		-- end
	end
end
-------------------------------------------------------------------------------------

tbNpc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= PlayerHonor.HONOR_CLASS_MONEY,
		nLevelTaskId= PlayerHonor.TSK_ID_HONORLEVEL_MONEY;
		szName		= "Tài Phú",
		tbLevel		= {};
	},
};

function tbNpc:ShopMuaNgay()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate < ConfigAll.TimeMoShopFF then
		Dialog:Say(ConfigAll.ThongBaoFF)
	return 0 
	end 
	local nSeries = me.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Bạn hãy gia nhập phái");
		return;
	end
	
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local szMsg = "Bạn có thể mua ngay phi phong nếu đủ điểm tài phú\nPhi phong tối đa được mua ngay hỗ trợ giai đoạn đầu tối đa được mua ngay tới Kinh Thế";
	local tbOpt = {
			{"<color=yellow>Siêu Phàm (600 Tài Phú)<color><enter><color=green>Giá : 153 NHHT<color>", self.SieuPham, self},
			{"<color=yellow>Xuất Trần (1.000 Tài Phú)<color><enter><color=green>Giá : 252 NHHT<color>", self.XuatTran, self},
			{"<color=yellow>Lăng Tuyệt (1.500 Tài Phú)<color><enter><color=green>Giá : 378 NHHT<color>", self.LangTuyet, self},
			{"<color=yellow>Kinh Thế (3.000 Tài Phú)<color><enter><color=green>Giá : 765 NHHT<color>", self.KinhThe, self},
			{"<color=yellow>Ngự Không (6.000 Tài Phú)<color><enter><color=green>Giá : 1050 NHHT<color>", self.NguKhong, self},
			{"<color=yellow>Hỗn Thiên (12.000 Tài Phú)<color><enter><color=green>Giá : 2345 NHHT<color>", self.HonThien, self},
			{"<color=yellow>Sồ Phượng (24.000 Tài Phú)<color><enter><color=green>Giá : 6300 NHHT<color>", self.SoPhuong, self},
			-- {"<color=yellow>Tiềm Long (60.000 Tài Phú)<color><enter><color=green>Giá : 15750 NHHT<color>", self.TiemLong, self},
			{"Kết thúc đối thoại"},
		};
    Dialog:Say(szMsg, tbOpt)
end

function tbNpc:TiemLong()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 60000 then
    	Dialog:Say("<color=white>Phi phong Tiềm Long cần:<color=yellow>\n60.000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 15750 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>1 vạn 5750 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 15750);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,8);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,8);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:SoPhuong()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 24000 then
    	Dialog:Say("<color=white>Phi phong Sồ Phượng cần:<color=yellow>\n24.000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 6300 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>6300 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 6300);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,7);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,7);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:HonThien()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 12000 then
    	Dialog:Say("<color=white>Phi phong Hỗn Thiên cần:<color=yellow>\n12.000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 2345 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>2345 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 2345);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,6);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,6);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:NguKhong()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 6000 then
    	Dialog:Say("<color=white>Phi phong Ngự Không cần:<color=yellow>\n6.000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 1050 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>1050 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 1050);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,5);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,5);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:KinhThe()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 3000 then
    	Dialog:Say("<color=white>Phi phong Kinh Thế cần:<color=yellow>\n3.000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 765 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>765 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 765);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,4);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,4);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:LangTuyet()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 1500 then
    	Dialog:Say("<color=white>Phi phong Lăng Tuyệt cần:<color=yellow>\n1.500 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 378 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>378 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 378);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,3);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,3);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

function tbNpc:XuatTran()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 1000 then
    	Dialog:Say("<color=white>Phi phong Xuất Trần cần:<color=yellow>\n1000 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue
		.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 252 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>252 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 252);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,2);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,2);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end

tbNpc.HONOR_CLASS_MONEY		= 8;	
tbNpc.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbNpc.HONOR_CLASS_MONEY,
	},
};
function tbNpc:SieuPham()
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
		local nHonorId		= tbTypeInfo.nHonorId;
		local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 600 then
    	Dialog:Say("<color=white>Phi phong Siêu Phàm cần:<color=yellow>\n600 điểm Tài phú<color>\nTài Phú hiện tại:<color=cyan> "..nHonorValue.."<color><color>");
		return 0;
	end
	end

	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 153 then
    	Dialog:Say("Để mua <color=yellow>Phi phong này<color> cần <color=green>153 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 153);

	local nNguHanh = me.nSeries;
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then

		if nNguHanh == 1 then
			szIdItem = 1;
		elseif nNguHanh == 2 then
			szIdItem = 3;
		elseif nNguHanh == 3 then
			szIdItem = 5;
		elseif nNguHanh == 4 then
			szIdItem = 7;
		elseif nNguHanh == 5 then
			szIdItem = 9;
		end
		local pItem = me.AddItem(1,17,szIdItem,1);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 2;
		elseif nNguHanh == 2 then
			szIdItem = 4;
		elseif nNguHanh == 3 then
			szIdItem = 6;
		elseif nNguHanh == 4 then
			szIdItem = 8;
		elseif nNguHanh == 5 then
			szIdItem = 10;
		end
		local pItem = me.AddItem(1,17,szIdItem,1);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end
------------------------------------------------------------------------------------

function tbNpc:hoimuatran()

	local tbOpt = {
			{"<color=yellow>Ta đồng ý<color>", self.tranphap, self, me},
			{"Kết thúc đối thoại"},
		};

	Dialog:Say(me.szName.."，Bạn muốn sử dụng<color=green> 600 Ngũ Hành Hồn Thạch<color> mua Lục Thao Tập Chú ?",tbOpt);
end

function tbNpc:tranphap()
	local nCount = me.GetItemCountInBags(18,1,205,1) -- ngũ hành hồn thạch
	if nCount < 600 then
    	Dialog:Say("Để mua <color=yellow>Lục Thao Tập Chú (Trận Pháp Trung)<color> cần <color=green>600 Ngũ Hành Hồn Thạch<color>");
		return 0;
	end
	
	local tbItemId1	= {18,1,205,1,0,0}; -- ngũ hành hồn thạch
	Task:DelItem(me, tbItemId1, 600);

	local pItem = me.AddItem(18,1,320,1);
	if pItem then
		me.SetItemTimeout(pItem, 30*24*60,0);
	end
        return 1;
end

function tbNpc:SaleMantle()
	Shop.MantleGift:OnOpen();
end


function tbNpc:OpenBank()
	if (Bank.nBankState == 0) then
		me.Msg("Không thể mở tiền trang.");
		return ;
	end
	
--------------HÀM TẮT TIỀN TRANG------------------
	if me.nLevel > 1 then
		me.Msg("Không thể mở tiền trang.");
		return 0;
	end
----------------------------------------------------------
	
	me.CallClientScript({"UiManager:OpenWindow", "UI_BANK"});
end

function tbNpc:OnOpenShop(pPlayer)
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	if (nCurTime < 0305) and (nCurTime >= 0255) then
		Dialog:Say("Từ 02h05 đến 03h05 không được phép vào tiền trang");
		return;
	end

	local nSeries = pPlayer.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Vui lòng gia nhập môn phái trước khi vào mua đồ");
		return;
	end
	
	if (1 == nSeries) then
		pPlayer.OpenShop(140, 3);
	elseif (2 == nSeries) then
		pPlayer.OpenShop(141, 3);
	elseif (3 == nSeries) then
		pPlayer.OpenShop(142, 3);
	elseif (4 == nSeries) then
		pPlayer.OpenShop(143, 3);
	elseif (5 == nSeries) then
		pPlayer.OpenShop(144, 3);
	else
		Dbg:WriteLogEx(Dbg.LOG_INFO, "Npc qianzhuang", pPlayer.szName, "There is no Series", nSeries);
	end
end
