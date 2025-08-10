
DuaTopCap.Folder_top = "\\script\\global\\tcqgaming\\DuaTopCap\\";
DuaTopCap.List_top = "duatopcap.txt"; -- list 
DuaTopCap.AddTaskGroup = 9152;
DuaTopCap.AddTaskCount = 1;-- task save vsv
DuaTopCap.nTaskIdWeek = 2;-- task ngay
DuaTopCap.AddTaskId = 3;-- task nhận thưởng

function DuaTopCap:topcap()
    -- DoScript("\\script\\global\\tcqgaming\\DuaTopCap\\duatopcap.lua")
	    local szTitle = ""
    local tbsortpos = Lib:LoadTabFile(DuaTopCap.Folder_top..DuaTopCap.List_top.."")
    local nLineCount = #tbsortpos
    DuaTopCap.tbDanhSach = {}
    DuaTopCap.tbTopList = {}

    -- Lưu thông tin vào bảng tbDanhSach
    for nLine = 1, nLineCount do
        local szNames = tbsortpos[nLine].szName
        local nDangCap = tonumber(tbsortpos[nLine].DangCap) or 0
        local nKinhNghiem = tonumber(tbsortpos[nLine].KinhNghiem) or 0
        local szDate = tbsortpos[nLine].szDate or "Chưa xác định"
        local key = szNames .. "_" .. nDangCap
        self.tbDanhSach[key] = {DangCap = nDangCap, KinhNghiem = nKinhNghiem, szDate = szDate}
    end

-- Hàm để kiểm tra xem một người chơi đã có trong tbTopList hay chưa
local function isAlreadyInTopList(tbTopList, playerName)
    for _, v in ipairs(tbTopList) do
        if v.szName == playerName then
            return true
        end
    end
    return false
end

-- Chuyển self.tbDanhSach sang một mảng để sắp xếp
local players = {}
for name, info in pairs(self.tbDanhSach) do
    table.insert(players, {
        szName = name,
        nDangCap = info.DangCap or 0,
        nKinhNghiem = info.KinhNghiem or 0,
        szDate = info.szDate or "Chưa xác định"
    })
end

-- Sắp xếp mảng dựa trên cấp độ, sau đó là kinh nghiệm, và cuối cùng là thời gian cập nhật
table.sort(players, function(a, b)
    if a.nDangCap == b.nDangCap then
        if a.nKinhNghiem == b.nKinhNghiem then
            return a.szDate < b.szDate  -- Giả định rằng szDate có thể so sánh trực tiếp, bạn cần định dạng lại nếu cần
        else
            return a.nKinhNghiem > b.nKinhNghiem
        end
    else
        return a.nDangCap > b.nDangCap
    end
end)

-- Giờ chỉ cần lấy 10 người đầu tiên sau khi sắp xếp để đưa vào tbTopList
self.tbTopList = {}
for i = 1, math.min(30, #players) do
    if not isAlreadyInTopList(self.tbTopList, players[i].szName) then
        table.insert(self.tbTopList, players[i])
    end
end


-- Định nghĩa hàm formatExp
local function formatExp(nExp)
    if nExp >= 1000000000 then
        local billion = math.floor(nExp / 1000000000)
        local million = math.floor((nExp % 1000000000) / 1000000)
        local thousand = math.floor((nExp % 1000000) / 1000)
        return string.format("%d tỉ %d triệu %d nghìn exp", billion, million, thousand)
    elseif nExp >= 1000000 then
        local million = math.floor(nExp / 1000000)
        local thousand = math.floor((nExp % 1000000) / 1000)
        return string.format("%d triệu %d nghìn exp", million, thousand)
    else
        return tostring(nExp)
    end
end

    -- Sắp xếp danh sách top theo cấp độ, kinh nghiệm và thời gian
table.sort(self.tbTopList, function(a, b)
    if a.nDangCap ~= b.nDangCap then
        return a.nDangCap > b.nDangCap -- Sắp xếp giảm dần theo cấp độ
    elseif a.nKinhNghiem ~= b.nKinhNghiem then
        return a.nKinhNghiem > b.nKinhNghiem -- Nếu cùng cấp độ, sắp xếp giảm dần theo điểm kinh nghiệm
    else
        -- Nếu cùng cấp độ và cùng điểm kinh nghiệm, thì xem xét thời gian cập nhật
        return a.szDate < b.szDate -- Sắp xếp theo thời gian cập nhật (tức là cũ hơn trước)
    end
end)
local myName = me.szName -- Lấy tên người dùng hiện tại, giả sử rằng đây chỉ là tên mà không có cấp độ đi kèm
local nXepHang = nil -- Khởi tạo biến cho xếp hạng hiện tại

-- Sắp xếp và xác định vị trí người chơi trong toàn bộ danh sách, không chỉ top 10
local sortedPlayers = {} -- Giả định rằng đây là danh sách đã được sắp xếp của tất cả người chơi
for name, info in pairs(self.tbDanhSach) do
    table.insert(sortedPlayers, {
        szName = name,
        nDangCap = info.DangCap or 0,
        nKinhNghiem = info.KinhNghiem or 0,
        szDate = info.szDate or "Chưa xác định"
    })
end

-- Sắp xếp lại nếu cần
table.sort(sortedPlayers, function(a, b)
    if a.nDangCap == b.nDangCap then
        if a.nKinhNghiem == b.nKinhNghiem then
            return a.szDate < b.szDate
        else
            return a.nKinhNghiem > b.nKinhNghiem
        end
    else
        return a.nDangCap > b.nDangCap
    end
end)

-- Duyệt qua danh sách đã sắp xếp để tìm vị trí của người chơi
for i, playerInfo in ipairs(sortedPlayers) do
    local szPlayer = string.match(playerInfo.szName, "(.-)_%d+")
    if szPlayer == myName then
        nXepHang = i
        break
    end
end
-- Cập nhật thông tin vị trí của người dùng
if nXepHang then
    szTitle = szTitle .. string.format("\n<color=yellow>Xếp hạng hiện tại của bạn: %d<color>\n", nXepHang)
else
    szTitle = szTitle .. "<color=gold>Bạn không nằm trong bảng xếp hạng.<color>\n"
end
			local nKhoiDong = ConfigAll.OpenDuaTOP	
    local tbOpt = {}
	    -- Thêm các tùy chọn vào danh sách
    table.insert(tbOpt, {"Ta muốn<color=yellow> Xem Bảng Xếp Hạng 30 Người Cao Nhất<color>", self.xemdanhsach, self, me})
		if nKhoiDong == 1 then 	
    table.insert(tbOpt, {"Ghi Danh <color=yellow> Cập Nhật Cấp Độ Bản Thân<color>", self.nStartSave, self, me})
	end 
	    -- table.insert(tbOpt, {"Đồng ý <color=yellow>Nhận Thưởng<color>", self.NhanThuongTop_tk, self, nXepHang})
    table.insert(tbOpt, {"Kết thúc "})
    Dialog:Say(szTitle, tbOpt)
end 

function DuaTopCap:xemdanhsach()
    local szTitle = ""
    -- Load danh sách BXH từ file
    local tbsortpos = Lib:LoadTabFile(DuaTopCap.Folder_top..DuaTopCap.List_top.."")
    local nLineCount = #tbsortpos
    DuaTopCap.tbDanhSach = {}
    DuaTopCap.tbTopList = {}

    -- Lưu thông tin vào bảng tbDanhSach
    for nLine = 1, nLineCount do
        local szNames = tbsortpos[nLine].szName
        local nDangCap = tonumber(tbsortpos[nLine].DangCap) or 0
        local nKinhNghiem = tonumber(tbsortpos[nLine].KinhNghiem) or 0
        local szDate = tbsortpos[nLine].szDate or "Chưa xác định"
        local key = szNames .. "_" .. nDangCap
        self.tbDanhSach[key] = {DangCap = nDangCap, KinhNghiem = nKinhNghiem, szDate = szDate}
    end

-- Hàm để kiểm tra xem một người chơi đã có trong tbTopList hay chưa
local function isAlreadyInTopList(tbTopList, playerName)
    for _, v in ipairs(tbTopList) do
        if v.szName == playerName then
            return true
        end
    end
    return false
end

-- Chuyển self.tbDanhSach sang một mảng để sắp xếp
local players = {}
for name, info in pairs(self.tbDanhSach) do
    table.insert(players, {
        szName = name,
        nDangCap = info.DangCap or 0,
        nKinhNghiem = info.KinhNghiem or 0,
        szDate = info.szDate or "Chưa xác định"
    })
end

-- Sắp xếp mảng dựa trên cấp độ, sau đó là kinh nghiệm, và cuối cùng là thời gian cập nhật
table.sort(players, function(a, b)
    if a.nDangCap == b.nDangCap then
        if a.nKinhNghiem == b.nKinhNghiem then
            return a.szDate < b.szDate  -- Giả định rằng szDate có thể so sánh trực tiếp, bạn cần định dạng lại nếu cần
        else
            return a.nKinhNghiem > b.nKinhNghiem
        end
    else
        return a.nDangCap > b.nDangCap
    end
end)

-- Giờ chỉ cần lấy 10 người đầu tiên sau khi sắp xếp để đưa vào tbTopList
self.tbTopList = {}
for i = 1, math.min(30, #players) do
    if not isAlreadyInTopList(self.tbTopList, players[i].szName) then
        table.insert(self.tbTopList, players[i])
    end
end


-- Định nghĩa hàm formatExp
local function formatExp(nExp)
    if nExp >= 1000000000 then
        local billion = math.floor(nExp / 1000000000)
        local million = math.floor((nExp % 1000000000) / 1000000)
        local thousand = math.floor((nExp % 1000000) / 1000)
        return string.format("%d tỉ %d triệu %d nghìn exp", billion, million, thousand)
    elseif nExp >= 1000000 then
        local million = math.floor(nExp / 1000000)
        local thousand = math.floor((nExp % 1000000) / 1000)
        return string.format("%d triệu %d nghìn exp", million, thousand)
    else
        return tostring(nExp)
    end
end

    -- Sắp xếp danh sách top theo cấp độ, kinh nghiệm và thời gian
table.sort(self.tbTopList, function(a, b)
    if a.nDangCap ~= b.nDangCap then
        return a.nDangCap > b.nDangCap -- Sắp xếp giảm dần theo cấp độ
    elseif a.nKinhNghiem ~= b.nKinhNghiem then
        return a.nKinhNghiem > b.nKinhNghiem -- Nếu cùng cấp độ, sắp xếp giảm dần theo điểm kinh nghiệm
    else
        -- Nếu cùng cấp độ và cùng điểm kinh nghiệm, thì xem xét thời gian cập nhật
        return a.szDate < b.szDate -- Sắp xếp theo thời gian cập nhật (tức là cũ hơn trước)
    end
end)

local function nFunctionGioiHanKyTu(str, limit)
    -- Cắt chuỗi dựa trên giới hạn ký tự và trả về kết quả
    return string.sub(str, 1, limit)
end


    -- Hiển thị thông tin top 10
for i = 1, 30 do
    local playerInfo = self.tbTopList[i]
    if playerInfo then
        local szPlayer, nDangCap = string.match(playerInfo.szName, "(.-)_(%d+)")
        if not szPlayer then
            szPlayer = playerInfo.szName
        end
        local nKinhNghiem = playerInfo.nKinhNghiem or 0
        local szExp = formatExp(nKinhNghiem)
        local szDate = playerInfo.szDate or "Chưa xác định"
        
        -- local newString = string.format("<color=red>[Top] %d:<color> %s <color=gold>Cấp<color>: %d<color> <color=gold>Kinh nghiệm<color>: %s\n", i, szPlayer, nDangCap, szExp)
        local newString = string.format("<color=red>[Top] %d:<color> %s\n<color=gold>Cấp<color>: %d<color>\n<color=gold>Kinh nghiệm<color>: %s\n<color=gold>Thời gian cập nhật <color>:%s\n", i, szPlayer, nDangCap, szExp,szDate)
        szTitle = szTitle .. nFunctionGioiHanKyTu(newString, 10000 - #szTitle)
    else
        szTitle = szTitle .. string.format("Top %d:   Chưa xác định     0 Điểm\n", i)
    end
end

local myName = me.szName -- Lấy tên người dùng hiện tại, giả sử rằng đây chỉ là tên mà không có cấp độ đi kèm
local nXepHang = nil -- Khởi tạo biến cho xếp hạng hiện tại

-- Sắp xếp và xác định vị trí người chơi trong toàn bộ danh sách, không chỉ top 10
local sortedPlayers = {} -- Giả định rằng đây là danh sách đã được sắp xếp của tất cả người chơi
for name, info in pairs(self.tbDanhSach) do
    table.insert(sortedPlayers, {
        szName = name,
        nDangCap = info.DangCap or 0,
        nKinhNghiem = info.KinhNghiem or 0,
        szDate = info.szDate or "Chưa xác định"
    })
end

-- Sắp xếp lại nếu cần
table.sort(sortedPlayers, function(a, b)
    if a.nDangCap == b.nDangCap then
        if a.nKinhNghiem == b.nKinhNghiem then
            return a.szDate < b.szDate
        else
            return a.nKinhNghiem > b.nKinhNghiem
        end
    else
        return a.nDangCap > b.nDangCap
    end
end)

-- Duyệt qua danh sách đã sắp xếp để tìm vị trí của người chơi
for i, playerInfo in ipairs(sortedPlayers) do
    local szPlayer = string.match(playerInfo.szName, "(.-)_%d+")
    if szPlayer == myName then
        nXepHang = i
        break
    end
end
			local length = string.len(szTitle)
-- Cập nhật thông tin vị trí của người dùng
if nXepHang then
    -- szTitle = szTitle .. string.format("\n<color=yellow>Xếp hạng hiện tại của bạn: %d<color>\nSố ký tự :%s", nXepHang,length)
    szTitle = szTitle .. string.format("\n<color=yellow>Xếp hạng hiện tại của bạn: %d<color>\n", nXepHang)
else
    szTitle = szTitle .. "<color=gold>Bạn không nằm trong bảng xếp hạng.<color>\n"
end

		local nTenBang = "Bảng Xếp Hạng Đua Top Cấp"
		me.CallClientScript({"Ui:ServerCall", "UINewSayTCQ", "OnOpen", szTitle, nTenBang})
end
function DuaTopCap:nStartSave(me)
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
	GeneralProcess:StartProcess("Đang ghi danh", 60 * Env.GAME_FPS, {self.Save_topcap, self,me}, nil, tbBreakEvent);	
end

function DuaTopCap:NhanThuongTop_tk(nXepHang)
local tbItemInfo = {bForceBind = 1};
local nCount = me.GetTask(self.AddTaskGroup,self.AddTaskId);
 	local nTime = GetTime();
	local nWeekDay = tonumber(os.date("%w", nTime))
	-- if nWeekDay == 0 then
	-- local nTime = GetTime();
	-- local nCurTime = tonumber(os.date("%H%M", nTime))
	-- if nCurTime > 2159 then 
	-- if nCount > 0 then
		-- Dialog:Say("Một tuần chỉ có thể nhận thưởng 1 lần");
		-- return 0;
	-- end
		if me.CountFreeBagCell() < 5 then
		Dialog:Say("Trống 5 ô mới nhận được Phần Thưởng");
		return 0;
	end	
	if nXepHang == 1 then
		ConfigAll.TOP_1_TongKim_Tuan()
		me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 2 then
	ConfigAll.TOP_2_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 3 then
	ConfigAll.TOP_3_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 4 then
	ConfigAll.TOP_4_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	
	elseif nXepHang == 5 then
	ConfigAll.TOP_5_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
		
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------
	KDialog.MsgToGlobal(szMsg);
	GlobalExcute({"Dialog:GlobalNewsMsg_GS", szMsg});
	
	elseif nXepHang == 6 then
	ConfigAll.TOP_6_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 7 then
	ConfigAll.TOP_7_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	

	elseif nXepHang == 8 then
	ConfigAll.TOP_8_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------

	elseif nXepHang == 9 then
	ConfigAll.TOP_9_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa
	
----------------------------------------------------------------------------------------------------------------
	local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);


	elseif nXepHang == 10 then
	ConfigAll.TOP_10_TongKim_Tuan()
	me.SetTask(self.AddTaskGroup,self.AddTaskId,nCount + 1);-- không được xóa , + task check đã nhận thưởng hay chưa

		----------------------------------------------------------------------------------------------------
			local szMsg = "Người chơi <color=green>"..me.szName.."<color> đã nhận thưởng <color=gold>Top  "..nXepHang.." Đua Cấp hàng tuần thành công!<color>";
	KDialog.MsgToGlobal(szMsg);

	------------------------------------------------------------------------------------------------------------	
else
    -- Người chơi không có trên bảng xếp hạng, hiển thị thông báo chặn
    Dialog:Say("Bạn không có trên top 10 bảng xếp hạng. Không thể nhận thưởng.");	
end
	

	-- else
	-- Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
-- end
-- else
	-- Dialog:Say("Chỉ có thể nhận thưởng trong:\n- <color=green>Ngày Chủ Nhật sau 22h00<color>");	
-- end	
end
function DuaTopCap:Save_topcap(pPlayer)
    if not pPlayer then
        return 0
    end

	KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color>Đã ghi danh Đua TOP Cấp Độ thành công! <color=gold>Nếu đạt cấp 149 <color>hãy là người đầu tiên bấm ghi danh-Cùng cấp cùng lượng exp sẽ tính thời gian ai trước !!")
    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local KinhNghiem = pPlayer.GetExp()
    local nCapDoHienTai = pPlayer.nLevel
    local szFile = DuaTopCap.Folder_top .. DuaTopCap.List_top .. ""

    -- Đọc nội dung hiện tại của file
    local szData = KFile.ReadTxtFile(szFile)
    local lines = {}
    local found = false
    local updated = false

    if szData and szData ~= "" then
        -- File đã tồn tại, xử lý nội dung
        for line in szData:gmatch("([^\r\n]+)") do
            table.insert(lines, line)
            local name, level, exp = line:match("^(%S+)\t(%d+)\t(%d+)")
            if name and name == pPlayer.szName then
                found = true
                if tonumber(level) ~= nCapDoHienTai or tonumber(exp) ~= KinhNghiem then
                    lines[#lines] = pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate
                    updated = true
                end
            end
        end

        if not found then
            table.insert(lines, pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate)
            updated = true
        end

        table.insert(lines, "")
    else
        table.insert(lines, "szName\tDangCap\tKinhNghiem\tszDate")
        table.insert(lines, pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate)
        table.insert(lines, "")
        updated = true
    end

    if updated then
        local szNewData = table.concat(lines, "\n")
        KFile.WriteFile(szFile, szNewData)
    end

    return updated and 1 or 0
end

function DuaTopCap:capnhattopcap(pPlayer)
    if not pPlayer then
        return 0
    end

    if pPlayer.nLevel >= 149 then
        return 0
    end

    local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
    local KinhNghiem = pPlayer.GetExp()
    local nCapDoHienTai = pPlayer.nLevel
    local szFile = DuaTopCap.Folder_top .. DuaTopCap.List_top .. ""

    -- Đọc nội dung hiện tại của file
    local szData = KFile.ReadTxtFile(szFile)
    local lines = {}
    local found = false
    local updated = false

    if szData and szData ~= "" then
        -- File đã tồn tại, xử lý nội dung
        for line in szData:gmatch("([^\r\n]+)") do
            table.insert(lines, line)
            local name, level, exp = line:match("^(%S+)\t(%d+)\t(%d+)")
            if name and name == pPlayer.szName then
                found = true
                if tonumber(level) ~= nCapDoHienTai or tonumber(exp) ~= KinhNghiem then
                    lines[#lines] = pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate
                    updated = true
                end
            end
        end

        if not found then
            table.insert(lines, pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate)
            updated = true
        end

        table.insert(lines, "")
    else
        table.insert(lines, "szName\tDangCap\tKinhNghiem\tszDate")
        table.insert(lines, pPlayer.szName.."\t"..nCapDoHienTai.."\t"..KinhNghiem.."\t"..szDate)
        table.insert(lines, "")
        updated = true
    end

    if updated then
        local szNewData = table.concat(lines, "\n")
        KFile.WriteFile(szFile, szNewData)
    end

    return updated and 1 or 0
end


local function fnStrValue(szVal)
	local varType = loadstring("return "..szVal)();
	if type(varType) == 'function' then
		return varType();
	else
		return varType;
	end
end
function DuaTopCap:StrVal(szParam)	--加载题库
	local szText = string.gsub(szParam, "<%%(.-)%%>", fnStrValue);
	return szText;
end