-------------------------------------------------------
-- văn kiện danh 　：npc.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-15 15:28:48
-- văn kiện miêu tả ：
-------------------------------------------------------

-- tần lăng an toàn bộ khu NPC đối thoại 
-- By Peres 2009/06/13 PM 06:55

local tbF1_Npc_1 = Npc:GetClass("qinling_safenpc1_1");
local tbF1_Npc_2 = Npc:GetClass("qinling_safenpc1_2");
local tbF1_Npc_3 = Npc:GetClass("qinling_safenpc1_3");
local tbF1_Npc_4 = Npc:GetClass("qinling_safenpc1_4");

local tbF2_Npc_1 = Npc:GetClass("qinling_safenpc2_1");
local tbF2_Npc_2 = Npc:GetClass("qinling_safenpc2_2");
local tbF2_Npc_3 = Npc:GetClass("qinling_safenpc2_3");

-- tầng thứ nhất đích NPC 
function tbF1_Npc_1:OnDialog()
	Dialog:Say("Thầy thuốc: Muốn vào đây kiếm đồ thì nên chuẩn bị cho mình đầy đủ dược phẩm để còn đánh nhau ^.^",
		{"<color=gold>[Bạc khóa]<color>Dược phẩm", self.OnBuyYaoByBind, self},
		{"<color=gold>[Bạc khóa]<color>Thực phẩm", self.OnBuyCaiByBind, self},
		{"Ta không mua nữa"});
end

function tbF1_Npc_2:OnDialog()
	Dialog:Say("Giang Mai: Hoàng đế thực sự là Hoàng đế, tôi Giang Mai mở ngôi mộ của rất nhiều người đã chết, lần đầu tiên tôi thấy một nơi nguy hiểm...... thế này, anh hùng hãy cẩn thận nhé.");
end

function tbF1_Npc_3:OnDialog()
	Dialog:Say("Gia Cát Lượng: Keke... tôi chỉ nhanh chóng để nuốt những linh hồn người, sợ đến chết tôi đã có. Bạn có ở lại đây? Bạn muốn xem các xác chết thối rữa của các hoàng đế của hàng ngàn năm? Đừng mơ ước.",
		{"Hãy đưa ta về nhà！", self.OnLeave, self},
		{"Kết thúc đối thoại"}
		);
end

function tbF1_Npc_3:OnLeave()
	me.SetLogoutRV(0);
	me.NewWorld(Boss.Qinshihuang:GetLeaveMapPos());
end

function tbF1_Npc_4:OnDialog()
	Dialog:Say("Bổ Khoái: Hmmm, đây là sợ hãi ngớ ngẩn, phải không? Tôi có một số công thức chế tạo đồ tốt ở đây, bạn có thể mặc này ngay lập tức tái sinh cơ thể bị phá vỡ... nhưng chỉ khi bạn có thể đủ khả năng để mua.",
		{"Ta xem hàng 1 chút", self.OnShop, self},
		{"Kết thúc đối thoại"});
end


-- tầng thứ hai đích NPC 
function tbF2_Npc_1:OnDialog()
	Dialog:Say("Giang hồ tiền bối: Ta đã ở đây rất lâu để chờ chữa bệnh cho các anh hùng vào đây quyết chiến với Tần Thủy Hoàng, có lẽ cũng sắp phải về hưu thôi",
		{"<color=gold>[Bạc Khóa]<color>Dược phẩm", self.OnBuyYaoByBind, self},
		{"<color=gold>[Mua máu]<color> Toàn tổ đội<color>", self.muamaunhanh, self},
		{"<color=gold>[Bạc Khóa]<color>Thực phẩm", self.OnBuyCaiByBind, self},
		--{"Ta nhặt được thứ rất lạ", self.ChangeMask, self},
		--{"Đổi thanh đồng luyện hóa", self.ChangeRefine, self},  	-- vũ khí luyện hóa tập tranh ảnh tư liệu 
		{"<color=yellow>Vũ Khí Hoàng Kim<color>",self.ShopVuKhi_HK,self},
		{"Dùng danh vọng đổi luyện hóa", self.OnChangeReputeToRefine, self},
		{"Kết thúc đối thoại"});
end
function tbF2_Npc_1:muamaunhanh()
CTC_7_Thanh:MuaMauNhanh()
end 

function tbF2_Npc_1:ShopVuKhi_HK()
	local szMsg = "Xin mời bạn Chọn!!!";
	local tbOpt = {
		{"<pic=137> Shop Hệ <color=yellow>Kim<color>",self.Svukhi1,self};
		{"<pic=137> Shop Hệ <color=green>Mộc<color>",self.Svukhi2,self};
		{"<pic=137> Shop Hệ <color=blue>Thủy<color>",self.Svukhi3,self};
		{"<pic=137> Shop Hệ <color=red>Hỏa<color>",self.Svukhi4,self};
		{"<pic=137> Shop Hệ <color=wheat>Thổ<color>",self.Svukhi5,self};
		{"<pic=137> Kết thúc đối thoại"},
		}
		Dialog:Say(szMsg, tbOpt);
end
function tbF2_Npc_1:Svukhi1()
me.OpenShop(156, 1);
end

function tbF2_Npc_1:Svukhi2()
me.OpenShop(157, 1);
end

function tbF2_Npc_1:Svukhi3()
me.OpenShop(158, 1);
end

function tbF2_Npc_1:Svukhi4()
me.OpenShop(159, 1);
end

function tbF2_Npc_1:Svukhi5()
me.OpenShop(160, 1);
end
function tbF2_Npc_2:OnDialog()
	Dialog:Say("Kim hiệu úy: Anh hùng có thể giải thích cho ta điểu này không?");
end

function tbF2_Npc_3:OnDialog()
	Dialog:Say("Thần binh: Nơi đây ta bày bán những loại vũ khí có sức mạnh khủng khiếp mà không ở đâu dám bán. Không biết nhà ngươi có đủ sức cầm nổi không?",
		{"Vũ khí tần lăng hệ <color=gold>（Kim）<color>", self.OnShop, self, 1},
		{"Vũ khí tần lăng hệ <color=gold>（Mộc）<color>", self.OnShop, self, 2},
		{"Vũ khí tần lăng hệ <color=gold>（Thủy）<color>", self.OnShop, self, 3},
		{"Vũ khí tần lăng hệ <color=gold>（Hỏa）<color>", self.OnShop, self, 4},
		{"Vũ khí tần lăng hệ <color=gold>（Thổ）<color>", self.OnShop, self, 5},
		{"Kết thúc đối thoại"});
end


-- mua thuốc 
function tbF1_Npc_1:OnBuyYaoByBind()
CTC_7_Thanh:MuaMauNhanh()
end

-- mua thức ăn 
function tbF1_Npc_1:OnBuyCaiByBind()
	me.OpenShop(21,7);
end

function tbF2_Npc_1:OnBuyCaiByBind()
	me.OpenShop(21,7);
end

tbF2_Npc_1.tbData = {
	{18,1,370,100},
	{18,1,371,300},
	{18,1,372,100},	
}

-- đổi mặt nạ 
function tbF2_Npc_1:ChangeMask()
	Dialog:Say("Giang Hồ Tiền Bối：Để ta xem ngươi có gì quý muốn đổi cho ta.",
		{"Ta nhặt được 1 miếng vải phượng vũ", self.ChangeItemGift, self, 1},	-- 20 cách ba lô 
		{"Ta nhặt được 1 chiếc khăn tay", self.ChangeItemGift, self, 2},	-- 24 cách ba lô 
		{"Ta nhặt được 1 phát quán bình thường", self.ChangeItemGift, self, 3},  -- Tần Thủy Hoàng mặt nạ 
		{"Kết thúc đối thoại"}
		)
end

-- by zhangjinpin@kingsoft
function tbF2_Npc_1:ChangeRefine()
	local tbParam = 
	{
		tbAward = {{nGenre = 18, nDetail = 2, nParticular = 385, nLevel = 1, nCount = 1, nBind=1}},
		tbMareial = {{nGenre = 18, nDetail = 1, nParticular = 377, nLevel = 1, nCount = 5}},
	};
	Dialog:OpenGift("Đoi luyen hoa do", tbParam);
end

function tbF2_Npc_1:OnChangeReputeToRefine()
	Dialog:Say("Ta có thể lấy <color=yellow>500 Điểm danh vọng tần lăng<color> của ngươi để đổi lấy thanh đồng luyện hóa vũ khí 110, thế nào nhà ngươi chịu không?",
		{
			{"Có", self.ChangeReputeToRefine, self},
			{"Không"},
		}
		);
end

function tbF2_Npc_1:ChangeReputeToRefine()
	local nDelRepute	= 500;
	local nRepute		= me.GetReputeValue(9,2);
	local nLevel		= me.GetReputeLevel(9,2);
	if (nDelRepute> nRepute) then
		Dialog:Say("Bạn không đủ <color=yellow>500 Danh vọng <color>！");
		return;
	end

	if (me.CountFreeBagCell() <1) then
		Dialog:Say("Túi đồ đã đầy, Đổi thanh đồng luyện hóa đồ thất bại.");
		return;
	end	
	
	me.AddRepute(9, 2, -1*nDelRepute);
	local nNowRepute	= me.GetReputeValue(9,2);
	local nNowLevel		= me.GetReputeLevel(9,2);
	local szLog = string.format("%s delete %d repute, last Repute: %d, Level: %d, now Repute: %d, level: %d!!", me.szName, nDelRepute, nRepute, nLevel, nNowRepute, nNowLevel);
	Dbg:WriteLogEx(Dbg.LOG_INFO,"Qinshihuang","npc","ChangeReputeToRefine", szLog);
	local pItem			= me.AddItem(18,2,385,1,1,1);
	if (not pItem) then
		Dbg:WriteLogEx(Dbg.LOG_INFO,"Qinshihuang","ChangeReputeToRefine", string.format("%s get the item failed!", me.szName));
		return;
	end
	Dbg:WriteLogEx(Dbg.LOG_INFO,"Qinshihuang","ChangeReputeToRefine", string.format("%s get the item success!", me.szName));
end

function tbF2_Npc_1:ChangeItemGift(nItemId)
	local szMsg	= {
		[1]="Giang hồ tiền bối：Bạn có 1 miếng vải phượng vũ ？Ta có một <color=green>Túi 20 ô <color>Và ta có thể đổi, nhưng các hạ phải đưa thêm cho ta <color=yellow> đưa thêm cho ta 100 viên Dạ Minh Châu<color><color=red> Trao đổi thành công đồ sẽ khóa	<color>",
		[2]="Giang hồ tiền bối：Bạn có 1 khăn tay có chữ ？Ta có một <color=green>Túi 24 ô <color>Và ta thể đổi, nhưng các hạ phải đưa thêm cho ta <color=yellow>300 viên Dạ Minh Châu<color><color=red> Trao đổi thành công đồ sẽ khóa<color>",
		[3]="Giang hồ tiền bối：Bạn có 1 phát quán dị thường ？Ta có một <color=green>Mặt nạ Tần Thủy Hoàng <color>Và ta có thể đổi, nhưng các hạ phải đưa thêm cho ta <color=yellow>100 viên Dạ Minh Châu<color><color=red> Trao đổi thành công đồ sẽ khóa<color>",
	}
	Dialog:Say(szMsg[nItemId], {"<color=yellow>Vâng, Tôi đã chuẩn bị đủ Dạ Minh Châu<color>", self.ChangeItem, self, nItemId}, {"Không đổi nữa"});
end

function tbF2_Npc_1:ChangeItem(nItemId)
	
	local tbData = 
	{
		{100, 21, 8, 3, 1, 18, 1, 370, 1},
		{300, 21, 9, 5, 1, 18, 1, 371, 1},
		{100, 1, 13, 24, 1, 18, 1, 372, 1},
	};
	
	local nFind = me.GetItemCountInBags(18, 1, 357, 1);
	if nFind <tbData[nItemId][1] then
		Dialog:Say("Giang hồ tiền bối: Hãy chắc chắn đã chuẩn bị đủ <color=yellow>"..tbData[nItemId][1].."Dạ minh châu <color>？Đừng có lừa ta！");
		return;
	end
	
	local nFindItem = me.GetItemCountInBags(tbData[nItemId][6], tbData[nItemId][7], tbData[nItemId][8], tbData[nItemId][9]);
	if nFindItem <1 then
		Dialog:Say("Giang hồ tiền bối: Hãy chắc chắn đã chuẩn bị đủ mọi thứ, đừng có lừa ta！");
		return;
	end
	
	local bRet1 = me.ConsumeItemInBags2(tbData[nItemId][1], 18, 1, 357, 1);
	local bRet2 = me.ConsumeItemInBags2(1, tbData[nItemId][6], tbData[nItemId][7], tbData[nItemId][8], tbData[nItemId][9]);
	
	if bRet1 == 0 and bRet2 == 0 then
		local pItem = me.AddItem(tbData[nItemId][2], tbData[nItemId][3], tbData[nItemId][4], tbData[nItemId][5]);	
		if pItem then
			pItem.Bind(1);
			local szMsg = string.format("Bạn nhận được %s，Tiêu tốn %d Dạ minh châu", pItem.szName, tbData[nItemId][1]);
			me.PlayerLog(Log.emKPLAYERLOG_TYPE_JOINSPORT, szMsg);
		end
	end
end

-- mãi luyện hóa danh vọng vật phẩm 
function tbF1_Npc_4:OnShop()
	me.OpenShop(155, 1);
end

-- mãi vũ khí 
function tbF2_Npc_3:OnShop(nSeries)
	local tbData = {156,157,158,159,160};
	me.OpenShop(tbData[nSeries], 1);
end

-------------------------------------------------------
-- by zhangjinpin@kingsoft
-------------------------------------------------------

-- truyền tống npc
local tbEnterNpc1 = Npc:GetClass("qinling_enternpc_1");

function tbEnterNpc1:OnDialog()

	local tbOpt	= {
		{"Ta không sợ, hãy đưa ta đi", self.EnterQingling},
		{"Để ta về đóng bỉm đã"}
	};
	
	local szMsg ="Lương tiếu tiếu: Từ khi Tần Thủy Hoàng xây dựng lăng mộ này, đã có rất nhiều kẻ vào đây thó đồ nhưng đều bị chết rũ xương trong đó, Anh hùng có muốn vào kiếm ít đồ không?";
	
	Dialog:Say(szMsg, tbOpt);
end

-- tiến nhập tần lăng 
function tbEnterNpc1:EnterQingling()
	DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_3.lua");
	DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_4.lua");
	-- DoScript("\\script\\boss\\qinshihuang\\map\\qinshihuangling_5.lua");
	if Boss.Qinshihuang:_CheckState() ~= 1 then
		Dialog:Say("Xin lỗi, Hệ thống Lăng tạm thời đóng cửa", {"Tôi biết"});
		return;
	end
	

	local taiphu = PlayerHonor:GetPlayerMaxHonorLevel(me);
	if taiphu < ConfigAll.GioiHanTaiPhu_TanLang  then
	Dialog:Say("Tài Phú Phải Cấp "..ConfigAll.GioiHanTaiPhu_TanLang.." Trở Lên")
	return 0;
	end
	
	-- 100cấp mới có thể tiến nhập 
	if me.nLevel <100 then
		Dialog:Say("Lương mỉm cười: với vóc dáng này, bạn cũng muốn đi? Hãy đi tập thể hình chờ lên level 100 đi！", {"Ok, để tôi đi tập thể hình"});
		return;
	end
	
	-- Môn phái hạn chế 
	if me.nFaction <= 0 then
		Dialog:Say("Lương mỉm cười: Tên chữ trắng cũng muốn đi? Hãy gia nhập 1 môn phái nào đó trước khi đến đây！", {"Tôi biết"});
		return;
	end
	
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	
	-- thặng dư thời gian là 0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		Dialog:Say("Lương mỉm cười: Bạn đã ở trong Tần Lăng quá lâu, Hãy về nhà nghỉ ngơi và trở lại vào ngày mai ！", {"Tôi biết"});
		return;
	end
	
	me.SetFightState(0);
	me.NewWorld(1536, 1567, 3629);	-- 1tằng an toàn khu 
end

-- truyện tống trận 
local tbPassNpc1 = Npc:GetClass("qinling_pass1");
local tbPassNpc2 = Npc:GetClass("qinling_pass2");

function tbPassNpc1:OnDialog()
	
	-- khởi động tiến độ con 
	local tbBreakEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SIT,
		Player.ProcessBreakEvent.emEVENT_RIDE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_CHANGEEQUIP,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,		
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_REVIVE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	}
	GeneralProcess:StartProcess("truyền tống đáo Tần Lăng 5 ·nam", 20 * Env.GAME_FPS, {self.OnPassSouth, self}, nil, tbBreakEvent);	
end

function tbPassNpc1:OnPassSouth()
	me.NewWorld(1540, 1790, 3183);
end

function tbPassNpc2:OnDialog()
	
	-- khởi động tiến độ con 
	local tbBreakEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SIT,
		Player.ProcessBreakEvent.emEVENT_RIDE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_CHANGEEQUIP,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,		
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_REVIVE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	}
	GeneralProcess:StartProcess("truyền tống đáo Tần Lăng 5 ·bắc", 20 * Env.GAME_FPS, {self.OnPassNorth, self}, nil, tbBreakEvent);	
end

function tbPassNpc2:OnPassNorth()
	me.NewWorld(1540, 1915, 3312);
end
-------------------------------------------------------

-- mở bang trợ 
function tbEnterNpc1:OpenHelp()
end;

-- thần bộ Ngô Dụng 
local tbEnterNpc2 = Npc:GetClass("qinling_enternpc_2");

function tbEnterNpc2:OnDialog()
	local szMsg ="Wu: Vâng! Nhóm các chất thải phải tôi đã mặc chúng với một con dao trước khi họ đồng ý đi. Để biết rằng lăng mộ này đã được mở, số lượng các tên cướp mộ những người muốn di chuyển vào BRIC, làm thế nào chúng ta có thể để cho những điều này đã ở trong vô vọng để bất cứ ai thuộc về hoàng đế!";	
	Dialog:Say(szMsg, {"Kết thúc đối thoại"});
end
