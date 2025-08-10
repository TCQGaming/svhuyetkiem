--报名npc
--sunduoliang
--2008.12.29

local tbNpc = Npc:GetClass("esport_yanruoxue");

tbNpc.tbFollowInsertItem 	= {18, 1, 477, 1};
tbNpc.tbTypeName = {"Ném tuyết","Đua Thuyền","Bảo Hộ Tổ Tiên"}


tbNpc.tbChangeItemList = {
	[1] = {
		szContext = "Đổi lấy một đôi găng tay ấm áp",
		tbGiftParam = {
			tbAward = { {nGenre=18, nDetail=1, nParticular=477, nLevel=1,nCount=1,},},
			tbMareial = { { nGenre = 18, nDetail = 1, nParticular = 476,nLevel = 1, nCount = 1,},},
		},
	},
	[2] = {
		szContext = "Đổi lấy một đôi găng tay ấm áp Hoàng Tuyết",
		tbGiftParam = {
			tbAward = { {nGenre=18, nDetail=1, nParticular=478, nLevel=1,nCount=1,},},
			tbMareial = { { nGenre = 18, nDetail = 1, nParticular = 476,nLevel = 1, nCount = 5,},},
		},
	},
};
function tbNpc:OnDialog()
	-- local szMsg = string.format("Hoạt động gia tộc và các hoạt động hàng ngày");
	local szMsg = string.format("Bao nhiêu năm tháng rồi mới có người ghé thăm ta!! hừm!!!");

	local tbOpt = {
		-- {"Hoạt động gia tộc", self.OnDialogEx, self},
		-- {"<color=yellow>Hoạt động Tổ tiên bảo hộ<color>", TowerDefence.tbNpc.OnDialog, TowerDefence.tbNpc},
		{"Kết thúc đối thoại"},
	};	
	Dialog:Say(szMsg, tbOpt);	
end

function tbNpc:OnDialogEx()
	local nState = EPlatForm:GetMacthState();
	local nFlag = 0;
	local tbOpt = {{"Tôi đến để xem"},};
	if (nState == EPlatForm.DEF_STATE_REST) then
		nFlag =1;
		tbOpt = {
			{"Nhận thưởng hoạt động cuối cùng", EPlatForm.GetPlayerAward_Final, EPlatForm},
			{"Nhận thưởng hoạt động gia tộc", EPlatForm.GetKinAward, EPlatForm},
			{"Tôi đến để xem"},	
		};
	end
	if nFlag == 1 then
		Dialog:Say("Bạn đang thực sự quan tâm, có thể đến thăm tôi, tôi vô cùng biết ơn, nhưng bây giờ không phải hoạt động tháng này, xin vui lòng trở lại sau!", tbOpt);
		return 0;
	end
	
	if EPlatForm:IsSignUpByAward(me) > 0 then
		Dialog:Say("Nhần thưởng cho trận đấu cuối cùng, mau chóng nhận?", 
			{
				{"Vâng, ta nhận", EPlatForm.GetPlayerAward_Single, EPlatForm},
				{"Kết thúc đối thoại"},
			}
		);
		return 0;
	end
	
	if (nState == EPlatForm.DEF_STATE_CLOSE) then
		Dialog:Say("Thi đấu gia tộc chưa mở");
		return 0;
	end
	
	EPlatForm:UpdateEventCount(me);
	local nCount = EPlatForm:GetEventCount(me);
	local nTotalCount = EPlatForm:GetPlayerTotalCount(me);
	local szStateName = EPlatForm.DEF_STATE_MSG[nState];
	local nTypeEx = EPlatForm:GetMacthType(EPlatForm:GetMacthSession());
	local szMsg = string.format("Hoạt động gia tộc tháng này là <color=yellow>%s<color>. Hiện đã đến <color=yellow> %s <color>, bạn muốn tham gia không?\n\n", self.tbTypeName[nTypeEx], szStateName);
	if (nState == EPlatForm.DEF_STATE_MATCH_1 or nState == EPlatForm.DEF_STATE_MATCH_2) then
		szMsg = string.format("%s<color=yellow>Hôm nay còn %s lần\n", szMsg, nCount);
		if (nState == EPlatForm.DEF_STATE_MATCH_1) then
			szMsg = string.format("%s Đã tham gia： %d lần", szMsg, nTotalCount);
		end
	end
	local tbOpt = {
		{"Thi đấu gia tộc", EPlatForm.tbNpc.OnDialog, EPlatForm.tbNpc},
		{"Xem tình hình đấu trường", EPlatForm.tbNpc.QueryMatch, EPlatForm.tbNpc},
		{"Nhận thưởng Hoạt động cuối cùng", EPlatForm.GetPlayerAward_Final, EPlatForm},
		{"Nhận thưởng hoạt động gia tộc", EPlatForm.GetKinAward, EPlatForm},
		{"Nguyệt ảnh thạch", self.ChangeItem, self},
		{"Tìm hiểu các hoạt động gia tộc", self.OnAboutEx, self, nTypeEx},
		{"Kết thúc đối thoại"},
	};
	if nTypeEx == 2 then
		table.insert(tbOpt, 6,{"Đổi thuyền", Npc:GetClass("dragonboat_signup").ProductBoat,	Npc:GetClass("dragonboat_signup")});
	end
	if nTypeEx == 3 then
		table.insert(tbOpt, 6, {"Sửa tổ tiên hộ phù", TowerDefence.Npc_ProductTD, TowerDefence});
	end
	Dialog:Say(szMsg, tbOpt);
end

-- 放入物品
function tbNpc:ChangeItem(nLevel)
	
	me.OpenShop(166,3);
	do return end;
	
	if (EPlatForm:GetMacthType(EPlatForm:GetMacthSession()) ~= 1) then
		Dialog:Say("Hoạt động chưa mở, không thể trao đổi đạo cụ.");
		return;
	end
	
	if (not nLevel) then
		Dialog:Say("Đổi lấy một đôi găng tay ấm áp, Đổi lấy một đôi găng tay ấm áp Hoàng Tuyết. Những gì bạn muốn trao đổi đạo cụ?",
			{
				{"Đổi Găng tay ấm áp", self.ChangeItem, self, 1},
				{"Găng tay ấm áp.Hoàng Tuyết", self.ChangeItem, self, 2},
				{"Ta đã xem"},	
			}
		);
		return 0;
	end
	local tbParam = self.tbChangeItemList[nLevel];
	
	if (not tbParam or not tbParam.tbGiftParam) then
		return 0;
	end
	
	Dialog:OpenGift(tbParam.szContext, tbParam.tbGiftParam);
end

function tbNpc:GetAward()
	if EPlatForm:IsSignUpByAward(me) <= 0 then
		Dialog:Say("Muốn món quà gi? Muốn, thì chúng ta nên ghi danh ném tuyết", {{"Quay lại", self.OnDialog, self}});		
		return 0;
	end

	if (0 == EPlatForm:GetPlayerAward(me)) then
		return 0;
	end
	Dialog:Say("Đây là những gì tôi cung cấp cho bạn một món quà, bạn có thể chấp nhận món quà", {{"Cảm ơn!", self.OnDialog, self}});
	return 0;
end

function tbNpc:OnOpenRank()
	local nTotal = EPlatForm:GetPlayerTotalMatch(me);
	local nWin 	 = EPlatForm:GetPlayerWinMatch(me);
	local nTie 	 = EPlatForm:GetPlayerLoseMatch(me);
	local nLost  = nTotal - nWin - nTie;
	local szRate  = "Không chiến thắng";
	if nTotal > 0 then
		szRate = string.format("%.2f", (nWin/nTotal)*100) .. "％";
	end
	local szMsg = string.format([[Án Nhược Tuyết có thể giúp bạn mở danh sách danh dự, bạn đang ở trong giao diện dưới "danh sách khác" trong mục "hoạt động xếp hạng" truy vấn các thông tin xếp hạng, bạn cần tôi để giúp bạn mở biểu đồ bạn?
<color=green>
--- Thông tin nhập ---

Tổng số: %s
Thắng: %s
Phẳng lĩnh vực số: %s
Bại: %s
Tỷ lệ chiến thắng: %s
<color>

	]], nTotal, nWin, nTie, nLost, szRate);
	local tbOpt = {
		{"Mở bảng xếp hạng", self.OnOpenRankList, self},
		{"Ta đã xem"},
	}
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:OnOpenRankList()
	me.CallClientScript({"UiManager:OpenWindow", "UI_LADDER"});
end

tbNpc.tbAbout = {
[1] = [[
    Cuộc thi được chia thành ba giai đoạn:
     Gia đình thử nghiệm giai đoạn: cận chiến duy nhất. Vào ngày 7 hàng tháng - ngày 20, tổng cộng 14 ngày, hoạt động mở cửa hàng ngày từ 10:00 - 23:00, 15 phút trên 10 điểm trò chơi cho 22:45 đầu tiên là ngày cuối cùng, thời gian áp dụng 5 phút.
     Gia đình đủ điều kiện giai đoạn: Team Battle trò chơi. Tổng số điểm trên 120 gia đình các nhóm gia tộc có thể tham gia cuộc thi. Vào ngày 21 hàng tháng - ngày 26, tổng cộng sáu ngày. Hoạt động của thời gian mở cửa hàng ngày 2 vào buổi chiều và buổi tối của mỗi người: hàng ngày 15:00-17:00, 21:30-23:00.
     Kết gia đình: trận chung kết đội gia đình, 8 đội đứng đầu có đủ điều kiện để nhập. Vào ngày 27 mỗi tháng, một khoảng thời gian 1 ngày, thời gian trò chơi 21:30 ~ 23:00.
]],

[2] = [[
    Thử nghiệm gia đình giai đoạn bạn có thể đăng ký ở đây một mình đến với tôi, và sau đó hai giai đoạn của trò chơi bạn cần gia tộc trước khi họ có thể tham gia cuộc thi, đòi hỏi các nỗ lực chung của các thành viên gia đình của bạn đủ điều kiện cho công việc. Không gia đình là không thể tham gia giải đấu gia tộc.
]],
[3] = [[
    Bạn đi vào sân thi đấu sẽ tìm thấy tất cả mọi người đã được biến thành một nhóm trẻ em, và truy cập đến một nơi gọi là "ném quả bóng tuyết" kỹ năng, bạn sử dụng nó để tấn công và bạn không thích trẻ em có thể có được điểm. Bạn cũng sẽ tìm thấy các trò chơi sẽ có một số người tuyết kỳ lạ, rune hoặc một cái gì đó, click chuột phải, bạn có thể có được các kỹ năng mạnh mẽ khác, nhấn đối thủ có thể nhận được nhiều điểm hơn. Có, ah, địa điểm thường mưa đá, chú ý đến an toàn. Cao điểm là một con quái vật, nhưng đã được đánh thức không thể tin được, con quái vật này tính khí lớn.
]],
[4] = [[
    1. Mặc dù bạn đã đăng ký nhưng do số lượng của các vấn đề có thể tạm biệt, được rồi, ra khỏi sân và sau đó đăng ký nó đã sẵn sàng.
    
    2. vào đấu trường, thuộc tính tất cả mọi người là như nhau, và vai trò của kỹ năng và do đó không có bất kỳ mối quan hệ, oh.
    
    3. có chướng ngại vật trên đường đua có thể ném quả bóng tuyết của những người khác thoát, nhưng thường mưa đá gần những trở ngại, hãy cẩn thận.
]],
};

function tbNpc:OnAboutEx(nFlag)
	local szMsg = "Thi đấu gia tộc có các loại sau đây, bạn muốn biết về điều đó?"
	local tbOpt = {
		{"Tìm hiểu hợt động ném tuyết", self.OnAbout, self},
		{"Tìm hiểu hoạt động Đua thuyền", Npc:GetClass("dragonboat_signup").OnAbout, Npc:GetClass("dragonboat_signup")},
		{"Tìm hiểu hoạt động Tổ tiên bảo hộ", TowerDefence.OnAbout, TowerDefence},
		{"Cứ xem tự nhiên"},
	};
	
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:OnAbout(nSel)
	if nSel then
		Dialog:Say(self.tbAbout[nSel], {{"Quay lại", self.OnDialog, self}});
		return 0;
	end
	local szMsg = "Bạn có muốn biết các khía cạnh của hoạt động thông tin quả cầu tuyết chiến đấu với nó?"; 
	local tbOpt = {
		{"Hoạt động liên quan"	, self.OnAbout, self, 1},
		{"Điều kiện tham gia"		, self.OnAbout, self, 2},
		{"Ném tuyết"	, self.OnAbout, self, 3},
		{"biện pháp phòng ngừa"		, self.OnAbout, self, 4},
		{"Quay lại"		, self.OnDialog, self},
	};
	Dialog:Say(szMsg, tbOpt);
end
------------------------