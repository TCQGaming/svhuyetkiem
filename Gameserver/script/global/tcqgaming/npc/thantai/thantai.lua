-------Tác giả : TCQGaming
------- 15:21 10/06/2023

local tbThanTai = Npc:GetClass("thantai");
tbThanTai.TaskGourp = 9165; 
tbThanTai.TaskId_Day = 1; 
tbThanTai.TaskId_Count = 2; 
tbThanTai.TaskId_Last = 3; 
tbThanTai.Relay_Time = 0; 
tbThanTai.Use_Max = 5;  -- Số lần lãnh thưởng

tbThanTai.HONOR_CLASS_MONEY		= 8;	
tbThanTai.tbHonorLevelInfo	= {
	["money"]	= {
		nHonorId	= tbThanTai.HONOR_CLASS_MONEY,
	},
};

function tbThanTai:OnDialog()
DoScript("\\script\\global\\tcqgaming\\npc\\thantai\\thantai.lua");
	for szType, tbTypeInfo in pairs(self.tbHonorLevelInfo) do
	local nHonorId		= tbTypeInfo.nHonorId;
	local nHonorValue	= PlayerHonor:GetPlayerHonor(me.nId, nHonorId, 0);
	if nHonorValue < 25000 then
    	Dialog:Say("Bạn không đạt đủ <color=yellow>25000 <color>điểm Tài Phú để tham gia \nTài Phú Hiện Nay<color=yellow> "..nHonorValue.."<color> <color>");
		return 0;
	end
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if me.GetTask(self.TaskGourp, self.TaskId_Day) < nDate then
		me.SetTask(self.TaskGourp, self.TaskId_Day, nDate);
		me.SetTask(self.TaskGourp, self.TaskId_Count, 0);
		me.SetTask(self.TaskGourp, self.TaskId_Last, 0);
	end 
	local nCount = me.GetTask(self.TaskGourp, self.TaskId_Count);
    if nCount >= self.Use_Max then
         Dialog:Say(string.format("Hôm nay đã nhận thưởng tối đa "..self.Use_Max.." lần rồi"));
        return 0; 
    end    
	
	
	if me.CountFreeBagCell() < 20 then
		Dialog:Say("Phải Có 20 Ô Trống Trong Túi !");
		return 0;
	end
	if me.nLevel < 109 then
		Dialog:Say("Bạn chưa đạt level 109, không thể nhận thưởng !");
		return 0;
	end
 
local szMsg = "<color=yellow>"..me.szName.."<color> Đã nhận thưởng đuợc <color=cyan>"..nCount.."<color> lần"; 
local tbOpt = { 
{"<color=yellow>Ta muốn nhận thưởng...<color>",self.tienhanhgt,self};
}; 
Dialog:Say(szMsg, tbOpt);
 	-- end
		me.Msg(string.format("<color=yellow>nhận thưởng thành công lần thứ <color=cyan>%d<color><color> ",nCount + 1));
end

---------------- qua trinh giao thong
function tbThanTai:tienhanhgt()
	local tbEvent = 
	{
		Player.ProcessBreakEvent.emEVENT_MOVE,
		Player.ProcessBreakEvent.emEVENT_ATTACK,
		Player.ProcessBreakEvent.emEVENT_SITE,
		Player.ProcessBreakEvent.emEVENT_USEITEM,
		Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
		Player.ProcessBreakEvent.emEVENT_DROPITEM,
		Player.ProcessBreakEvent.emEVENT_SENDMAIL,
		Player.ProcessBreakEvent.emEVENT_TRADE,
		Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
		Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
		Player.ProcessBreakEvent.emEVENT_LOGOUT,
		Player.ProcessBreakEvent.emEVENT_DEATH,
		Player.ProcessBreakEvent.emEVENT_ATTACKED,
	}
	    GeneralProcess:StartProcess("<color=yellow>Đang nhận thưởng<color>", 1 * Env.GAME_FPS, {self.GetQuest, self, him.dwId}, nil, tbEvent);
	end


function tbThanTai:GetQuest(nNpcId)
    local pNpc = KNpc.GetById(nNpcId);
    if (not pNpc) then
        return;
    end
		local nCount = me.GetTask(self.TaskGourp, self.TaskId_Count);
	tbThanTai.Folder = "\\script\\global\\tcqgaming\\npc\\thantai\\"; -- duong dan folder
	tbThanTai.List_Player = "ghilog.txt"; -- list nhan vat
	local szFile = tbThanTai.Folder..tbThanTai.List_Player.."";
	local tbFile = Lib:LoadTabFile(szFile);

local nGioiHan = 0 -- Biến đếm số lần lặp
for index, tbRowData in pairs(tbFile) do
  nGioiHan = nGioiHan + 1
  if nGioiHan == 50 then
  pNpc.Delete();
 Dialog:Say("Phần thưởng sự kiện lần này đã đạt tối đa rồi");
 KDialog.MsgToGlobal("<color=yellow><color=pink>Thần Tài Năm Mới lần xuất hiện này đã phát đủ 50 lì xì tết và thoái ẩn hẹn quý vị lần kế tiếp<color>!!");	
 return 0;
  end
end
 local nMapId, nPosX, nPosY = me.GetWorldPos()
me.SetTask(self.TaskGourp, self.TaskId_Count, nCount + 1);
	-------Thưởng
local nRandom = MathRandom(1,12)
if nRandom == 1 then 
me.AddStackItem(18,1,1333,1,nil,10);-----Sách Kinh Nghiệm chân nguyên 10 cuốn
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được 10 cuốn Chân Nguyên Tu Luyện Đơn từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
-- me.AddStackItem(18,1,2033,9,nil,10);-----Sách Kinh Nghiệm chân nguyên 10 cuốn
		-- KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được 10 Vật Phẩm Đua TOP từ Thần Tài Năm Mới<color>");
elseif nRandom == 2 then 
me.AddStackItem(18,1,1,5,nil,1);-----Huyền tinh cấp 6 4 viên
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được 1 Huyền Tinh Cấp 5 từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
elseif nRandom == 3 then 
me.AddStackItem(18,1,1,6,nil,1);-----Huyền tinh cấp 7 1 viên
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được 1 Huyền Tinh Cấp 6 từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
elseif nRandom == 4 then 
local nRan = MathRandom(1,10)
me.AddStackItem(18,1,1338,2,nil,nRan);-----
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được "..nRan.." Tiểu Kim Nguyên Bảo từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
elseif nRandom == 5 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 1 Huyền Tinh Cấp 8\n<color=green>(80 vạn đồng)",self.muaht8,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			-- table.insert(tbOpt, {"<color=yellow>Ta muốn mua 10 Lệnh Bài Đồ Hải Tặc Cấp 1\n<color=green>(50 vạn đồng)",self.mualenhbaihaitac,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			table.insert(tbOpt, {"Bỏ qua ta chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
elseif nRandom == 6 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 1 hòa thị ngọc\n<color=green>(100 vạn đồng)",self.muahoathingoc,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			-- table.insert(tbOpt, {"<color=yellow>Ta muốn mua 10 Huyền Tinh Cấp 5\n<color=green>(30 vạn đồng)",self.muahuyentinh5,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
						table.insert(tbOpt, {"Bỏ qua ta chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
elseif nRandom == 7 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 100 Chân Nguyên Tu Luyện Đơn\n<color=green>(100 vạn đồng)",self.muachannguyentuluyendon,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			-- table.insert(tbOpt, {"<color=yellow>Ta muốn mua 10 Huyền Tinh Cấp 5\n<color=green>(30 vạn đồng)",self.muahuyentinh5,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
						table.insert(tbOpt, {"Bỏ qua ta chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
elseif nRandom == 8 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			-- table.insert(tbOpt, {"<color=yellow>Ta muốn mua 100 Sao Chiến Tích\n<color=green>(200 vạn đồng)",self.muasaochientich,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 100 Rương Trang Bị Đồng Hành\n<color=green>(50 vạn đồng)",self.muaruongdonghanh,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
						table.insert(tbOpt, {"Bỏ qua ta chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
elseif nRandom == 9 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 10 Huyền Tinh Cấp 6\n<color=green>(65 vạn đồng)",self.muaht6,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
						table.insert(tbOpt, {"Bỏ qua ta chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
elseif nRandom == 10 then 
	local szMsg = "Các hạ thật may mắn khi tìm tới gian hàng sale đợt này ";
    local tbOpt =     {} 
			table.insert(tbOpt, {"<color=yellow>Ta muốn mua 1 Huyền Tinh Cấp 7\n<color=green>(24 vạn đồng)",self.muaht7,self});-------Lanh thuong xong task ve 0 thi moi tham gia duoc 
						table.insert(tbOpt, {"Bỏ qua chấp nhận mất lượt"});
			Dialog:Say(szMsg, tbOpt)
			elseif nRandom == 11 then 
		local nRan = MathRandom(5,20)
		me.AddStackItem(18,1,1338,2,nil,nRan);-----
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được "..nRan.." Tiểu Kim Nguyên Bảo từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
		elseif nRandom == 12 then 
local nRan = MathRandom(10,50)
me.AddStackItem(18,1,1338,2,nil,nRan);-----
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> thật may mắn nhận được "..nRan.." Tiểu Kim Nguyên Bảo từ Thần Tài Năm Mới Tại : <pos="..nMapId..","..nPosX..","..nPosY.."><color>");
end 
	local szHistory = "\\script\\global\\tcqgaming\\npc\\thantai\\ghilog.txt";
	KFile.AppendFile(szHistory, ""..me.szName.."\n");
end

function tbThanTai:mualenhbaihaitac() 
		local nDong = me.GetJbCoin()
if nDong < 50*10000 then 
	Dialog:Say("Bạn chưa đủ 50 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2025,10,nil,10)
	me.AddJbCoin(-50*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 10 Lệnh Bài Đồ Hải Tặc Cấp 1 tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muahuyentinh5() 
		local nDong = me.GetJbCoin()
if nDong < 30*10000 then 
	Dialog:Say("Bạn chưa đủ 30 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1,5,nil,10)
	me.AddJbCoin(-30*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 10 Viên Huyền Tinh Cấp 5 tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muaht6() 
		local nDong = me.GetJbCoin()
if nDong < 65*10000 then 
	Dialog:Say("Bạn chưa đủ 65 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1,6,nil,10)
	me.AddJbCoin(-65*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 10 Viên Huyền Tinh Cấp 6 tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muaht7() 
		local nDong = me.GetJbCoin()
if nDong < 24*10000 then 
	Dialog:Say("Bạn chưa đủ 24 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1,7,nil,1)
	me.AddJbCoin(-24*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 1 Viên Huyền Tinh Cấp 7 tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muaht8() 
		local nDong = me.GetJbCoin()
if nDong < 80*10000 then 
	Dialog:Say("Bạn chưa đủ 80 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1,8,nil,1)
	me.AddJbCoin(-80*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 1 Viên Huyền Tinh Cấp 8 tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muahoathingoc() 
		local nDong = me.GetJbCoin()
if nDong < 100*10000 then 
	Dialog:Say("Bạn chưa đủ 100 vạn đồng thường rồi")
return 
end
	me.AddStackItem(22,1,81,1,nil,1)
	me.AddJbCoin(-100*10000)
		KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 1 viên hòa thị ngọc (thô) tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muachannguyentuluyendon() 
		local nDong = me.GetJbCoin()
if nDong < 100*10000 then 
	Dialog:Say("Bạn chưa đủ 100 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,402,1,nil,100)
	me.AddJbCoin(-100*10000)
			KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 100 Chân Nguyên Tu Luyện Đơn tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end

function tbThanTai:muasaochientich() 
		local nDong = me.GetJbCoin()
if nDong < 100*10000 then 
	Dialog:Say("Bạn chưa đủ 100 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2028,7,nil,100)
	me.AddJbCoin(-100*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 100 Sao Chiến Tích tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end
function tbThanTai:muaruongdonghanh() 
		local nDong = me.GetJbCoin()
if nDong < 50*10000 then 
	Dialog:Say("Bạn chưa đủ 50 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,1875,1,nil,100)---Rương Trang Bị Đồng Hành
	me.AddJbCoin(-50*10000)
	KDialog.MsgToGlobal("<color=gold>Người chơi <color=cyan>[ "..me.szName.." ]<color> đã mua thành công 50 Rương Trang Bị Đồng Hành tại Thần Tài Năm Mới thông qua Gian Hàng Sale<color>");
end


function tbThanTai:LamMoi()
	local szFile = tbThanTai.Folder..tbThanTai.List_Player.."";
	KFile.WriteFile(szFile, "TenNV\n");	
end