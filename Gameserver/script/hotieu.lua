--Chức năng vận Xe Lương 
--Dev TCQGaming
--Zalo : 0357091972
--===========================
local VanTieu ={};
SpecialEvent.VanTieu= VanTieu;
local nToaDo = {
    {1792, 3578},
    {1779, 3588},
    {1774, 3599},
    {1767, 3608},
    {1756, 3621},
    {1747, 3632},
    {1735, 3623},
    {1723, 3616},
    {1712, 3613},
    {1703, 3617},
    {1691, 3615},
    {1680, 3613},
    {1669, 3618},
    {1657, 3622},
    {1643, 3611},
    {1632, 3597},
    {1621, 3587},
    {1608, 3573},
    {1602, 3566},
}

local nToaDoHanThuyCoDo = {
{1622, 3233},
{1621, 3251},
{1623, 3271},
{1627, 3290},
{1629, 3311},
{1631, 3331},
{1634, 3350},
{1640, 3368},
{1654, 3377},
{1667, 3392},
{1671, 3413},
{1673, 3432},
{1676, 3451},
{1682, 3471},
{1686, 3488},
{1678, 3502},
{1675, 3520},
{1677, 3538},
{1685, 3556},
{1691, 3572},
{1706, 3582},
{1722, 3590},
{1738, 3603},
{1741, 3621},
{1750, 3640},
{1758, 3658},
{1762, 3677},
{1766, 3695},
{1773, 3715},
{1778, 3731},
{1788, 3743},
{1805, 3743},
{1820, 3741},
{1835, 3738},
{1846, 3756},
{1857, 3773},
{1859, 3793},
{1860, 3812},
{1861, 3824},
{1867, 3838},
}


local nMapId  = 2
local nNpcID = {
[1] = 10365,
[2] = 10367,
[3] = 10367,
[4] = 10369,
[5] = 10369,
}

function VanTieu:OnDialog() 
			if me.nLevel < 90 then 
			Dialog:Say("Bạn chưa đủ cấp độ 90")
			return 
			end 
	--DoScript("\\script\\hotieu.lua");
	if not self:IsNgayVanLuong() then
		Dialog:Say("Vận lương chỉ mở vào Thứ 7 và Chủ Nhật.");
		return;
	end
	
	local nTrangThai = me.GetTask(9171,10)
	if nTrangThai == 1 then 
	      return Dialog:Say("Bạn đang vận Xe Lương mà , nhận thưởng đi đã.")
    end
	local nGioiHanSoTieu = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)

    if nGioiHanSoTieu >= 18 then
        return Dialog:Say("Đã có quá nhiều Xe Lương được nhận cùng lúc. Vui lòng chờ họ vận xong.")
    end
	local nGioiHanNgay = me.GetTask(9171,1)
	local nGioiHanNgayCuop = me.GetTask(9171,2)
	
local TieuKhongLamMoi = 0
local nTieuKhongLamMoi = MathRandom(1,100)
if nTieuKhongLamMoi <= 15 then
TieuKhongLamMoi = 5
elseif nTieuKhongLamMoi <= 35 then
TieuKhongLamMoi = 4
elseif nTieuKhongLamMoi <= 55 then
TieuKhongLamMoi = 3
elseif nTieuKhongLamMoi <= 75 then
TieuKhongLamMoi = 2
elseif nTieuKhongLamMoi <= 100 then
TieuKhongLamMoi= 1
end
local nTieuIdTieuXa = nNpcID[TieuKhongLamMoi] 

	local nTieuXa = "<color=gold>Ngẫu nhiên<color>"
			Dialog:Say("<color=gold>Hiện đang có :"..nGioiHanSoTieu.." Xe Lương đang vận\nNhiệm vụ vận Xe Lương ngày:\n<color>\n<color=green>Quy Tắc : \n<color>*Mỗi ngày số lượt vận Xe Lương là 3 lần\n*Lần đầu miễn phí lượt 2 trở đi tốn 15knb/lượt\n*Làm mới Xe Lương tốn 5 vạn đồng / lượt\n<color=green>Nhân Vật<color> :\n*Số lượt vận Xe Lương hôm nay : <color=yellow>"..nGioiHanNgay.."/3<color> lần\n*Nếu không làm mới thì Xe Lương xuất hiện : "..nTieuXa.."", {
							{"Làm mới", VanTieu.LamMoi, VanTieu},
				           -- {"Bắt đầu vận Xe Lương", VanTieu.nStart, VanTieu},
						    {"Bắt đầu vận Xe Lương", VanTieu.nStart, VanTieu , nTieuIdTieuXa},
				  {"Ta chưa muốn vận", VanTieu.OnExit, VanTieu},
				});	
end

function VanTieu:IsNgayVanLuong()
	local nWeekDay = tonumber(os.date("%w")); -- 0=CN, 6=T7
	return nWeekDay == 0 or nWeekDay == 6;
end


function VanTieu:LamMoi()
	local nGioiHanNgay = me.GetTask(9171,1)
	local nGioiHanNgayCuop = me.GetTask(9171,2)
	if nGioiHanNgay >= 3 then 
	    me.Msg("<color=yellow> Hôm nay bạn đã vận tối đa 3 lần Xe Lương ngày mai hãy quay lại đây")
	return 
	end
	local nDong = me.GetJbCoin()
if nDong < 5*10000 then 
	Dialog:Say("Bạn chưa đủ 5 vạn đồng thường rồi")
return 
end
local nNgauNhien = 0
local nRandom = MathRandom(1,100)
if nRandom <= 15 then
    nNgauNhien = 5
elseif nRandom <= 35 then
    nNgauNhien = 4
elseif nRandom <= 55 then
    nNgauNhien = 3
elseif nRandom <= 75 then
    nNgauNhien = 2
elseif nRandom <= 100 then
    nNgauNhien = 1
end


    self.nCurrentNpcId = nNpcID[nNgauNhien]
    local nTieuXa = ""
    if nNgauNhien == 1 then 
        nTieuXa = "<color=white>Xe Lương Trắng<color>"
    elseif nNgauNhien == 2 then 
        nTieuXa = "<color=blue>Xe Lương Lam<color>"
	 elseif nNgauNhien == 3 then 
        nTieuXa = "<color=blue>Xe Lương Lam<color>"
			 elseif nNgauNhien == 4 then 
        nTieuXa = "<color=gold>Xe Lương Cam<color>"
			 elseif nNgauNhien == 5 then 
        nTieuXa = "<color=gold>Xe Lương Cam<color>"
    end
    me.Msg("Làm mới rơi vào tỉ lệ : <color=yellow>"..nRandom.." phần trăm<color>\nĐạt được : "..nTieuXa.." bạn có muốn vận Xe Lương này luôn không!!")
	me.SetTask(9171,11,1)------ Task Làm mới
	me.AddJbCoin(-5*10000)
			Dialog:Say("<color=gold>Nhiệm vụ vận Xe Lương ngày:\n<color>\n<color=green>Quy Tắc : \n<color>*Mỗi ngày số lượt vận Xe Lương là 3 lần\n*Làm mới Xe Lương tốn 5 vạn đồng / lượt\n<color=red>*Tỉ Lệ Xuất Hiện: Cam 35% ,Lam 40% Tỉ Lệ Còn Lại Trắng 25%<color>\n<color=green>Nhân Vật<color> :\n*Số lượt vận Xe Lương hôm nay : <color=yellow>"..nGioiHanNgay.."/3<color> lần\n*Xe Lương Hiện Tại : "..nTieuXa.."\n<color=red>Nếu thoát khỏi bảng Xe Lương sẽ về Xe Lương trắng", {

        {"Làm mới", VanTieu.LamMoi, VanTieu},
        {"Bắt đầu vận Xe Lương", VanTieu.nStart_LamMoi, VanTieu , nRandom},
        -- {"Ta chưa muốn vận", VanTieu.OnExit, VanTieu},
    })
end

function VanTieu:nStart_LamMoi(nRandom)
	
local nGioiHanNgay = me.GetTask(9171,1)
local nDauLamMoi = me.GetTask(9171,11)
	if nGioiHanNgay >= 3 then 
		me.Msg("<color=yellow>Hôm nay các hạ đã chuyển giúp ta đủ 3 chuyến hàng , ngày mai quay lại đây!!")
		return 
	end
	local LuotMienPhi = me.GetTask(9171,30)
	if LuotMienPhi > 0 then 
			local nDong = me.GetJbCoin()
	if nDong < 15*10000 then 
		Dialog:Say("Bạn chưa đủ 15 vạn đồng thường rồi")
	return 
	end
end

    if nDauLamMoi == 1 then
		local nLoaiTieu = 0
        if nRandom <= 15 then
            self.nCurrentNpcId = nNpcID[5]
			            nLoaiTieu = 9
        elseif nRandom <= 35 then
            self.nCurrentNpcId = nNpcID[4]
			            nLoaiTieu = 9
        elseif nRandom <= 55 then
            self.nCurrentNpcId = nNpcID[3]
			            nLoaiTieu = 7
        elseif nRandom <= 75 then
            self.nCurrentNpcId = nNpcID[2]
			            nLoaiTieu = 7
        elseif nRandom <= 100 then
            self.nCurrentNpcId = nNpcID[1]
			            nLoaiTieu = 5
        end
			me.SetTask(9171, nLoaiTieu, 1) 
 else
	local nLoaiTieu = 0 

        if self.nCurrentNpcId == nNpcID[1] then 
            nLoaiTieu = 5
        elseif self.nCurrentNpcId == nNpcID[2] then 
            nLoaiTieu = 7
        elseif self.nCurrentNpcId == nNpcID[3] then 
            nLoaiTieu = 7
        elseif self.nCurrentNpcId == nNpcID[4] then 
            nLoaiTieu = 9
        elseif self.nCurrentNpcId == nNpcID[5] then 
            nLoaiTieu = 9
        end
		me.SetTask(9171, nLoaiTieu, 1)  
end 
		me.SetTask(9171,10,1)
			if LuotMienPhi > 0 then 
		me.AddJbCoin(-15*10000)
		end 
				if LuotMienPhi == 0 then 
				me.SetTask(9171,30,1)
				end 
		VanTieu:OnAccept()
		KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)+1);
		KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> Đã Nhận nhiệm vụ vận Xe Lương thành công!")
end

function VanTieu:nStart(nTieuIdTieuXa)
	
local nGioiHanNgay = me.GetTask(9171,1)
local nDauLamMoi = me.GetTask(9171,11)
	if nGioiHanNgay >= 3 then 
		me.Msg("<color=yellow>Hôm nay các hạ đã chuyển giúp ta đủ 3 chuyến hàng , ngày mai quay lại đây!!")
		return 
	end
	
	local LuotMienPhi = me.GetTask(9171,30)
	if LuotMienPhi > 0 then 
			local nDong = me.GetJbCoin()
	if nDong < 15*10000 then 
		Dialog:Say("Bạn chưa đủ 15 vạn đồng thường rồi")
	return 
	end
end
	local nLoaiTieu = 0 

        if nTieuIdTieuXa ==  10365 then 
            nLoaiTieu = 5
        elseif nTieuIdTieuXa == 10367 then 
            nLoaiTieu = 7
        elseif nTieuIdTieuXa == 10367 then 
            nLoaiTieu = 7
        elseif nTieuIdTieuXa == 10369 then 
            nLoaiTieu = 9
        elseif nTieuIdTieuXa == 10369 then 
            nLoaiTieu = 9
        end
		me.SetTask(9171,10,1)
		me.SetTask(9171, nLoaiTieu, 1) 
			if LuotMienPhi > 0 then 
		me.AddJbCoin(-15*10000)
		end 
				if LuotMienPhi == 0 then 
				me.SetTask(9171,30,1)
				end 
		VanTieu:OnAccept_KhongLamMoi(nTieuIdTieuXa)
		KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)+1);
		KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> Đã Nhận nhiệm vụ vận Xe Lương thành công!")
end

function VanTieu:OnAccept_KhongLamMoi(nTieuIdTieuXa)
    local nMapId, nPosX, nPosY = me.GetWorldPos()
	    local pNpc = KNpc.Add2(nTieuIdTieuXa, 50, 1, 31, 2023, 3555, 0, 1)
    local nTieuXa = ""
	if nTieuIdTieuXa == 10365 then 
	nTieuXa = "Xe Lương Trắng<color>"
	-- elseif nTieuIdTieuXa == 10366 then 
	-- nTieuXa = "<color=green>Xe Lương Lục<color>" 
			elseif nTieuIdTieuXa == 10367 then 
        nTieuXa = "Xe Lương Lam<color>"
				-- elseif nTieuIdTieuXa == 10368 then 
        -- nTieuXa = "<color=pink>Xe Lương Tím<color>"
		elseif nTieuIdTieuXa == 10369 then 
        nTieuXa = "Xe Lương Cam<color>"
	end 
    if not pNpc then return end
    pNpc.szName = " "..nTieuXa.." của "..me.szName..""
	 if     nTieuXa == "<color=white>Xe Lương Trắng<color>" then
    -- pNpc.SetTitle("<pic=199>")
	-- elseif     nTieuXa == "<color=green>Xe Lương Lục<color>" then 
    -- pNpc.SetTitle("<pic=200>")
			elseif            nTieuXa == "<color=blue>Xe Lương Lam<color>" then 
    -- pNpc.SetTitle("<pic=201>")
			-- elseif            nTieuXa == "<color=pink>Xe Lương Tím<color>" then 
    -- pNpc.SetTitle("<pic=202>")
		elseif           nTieuXa == "<color=gold>Xe Lương Cam<color>" then 
    -- pNpc.SetTitle("<pic=203>")
		end
				self.nMoveNpcId = pNpc.dwId;
	-- me.NewWorld(31,2023,3555); 
    VanTieu:SetNpcMove(pNpc,me)
end

function VanTieu:OnAccept()
    local nMapId, nPosX, nPosY = me.GetWorldPos()
	    local pNpc = KNpc.Add2(self.nCurrentNpcId, 50, 1, nMapId, nPosX, nPosY, 0, 1)

    local nTieuXa = ""
	if self.nCurrentNpcId == nNpcID[1] then 
	nTieuXa = "Xe Lương Trắng"
	elseif self.nCurrentNpcId == nNpcID[2] then 
	nTieuXa = "Xe Lương Lam" 
			elseif self.nCurrentNpcId == nNpcID[3] then 
        nTieuXa = "Xe Lương Lam"
				elseif self.nCurrentNpcId == nNpcID[4] then 
        nTieuXa = "Xe Lương Cam"
		elseif self.nCurrentNpcId == nNpcID[5] then 
        nTieuXa = "Xe Lương Cam"
	end 
    if not pNpc then return end
    pNpc.szName = " "..nTieuXa.." của "..me.szName..""
	 if     nTieuXa == "<color=white>Xe Lương Trắng<color>" then
    -- pNpc.SetTitle("<pic=199>")
	-- elseif     nTieuXa == "<color=green>Xe Lương Lục<color>" then 
    -- pNpc.SetTitle("<pic=200>")
			elseif            nTieuXa == "<color=blue>Xe Lương Lam<color>" then 
    -- pNpc.SetTitle("<pic=201>")
			-- elseif            nTieuXa == "<color=pink>Xe Lương Tím<color>" then 
    -- pNpc.SetTitle("<pic=202>")
		elseif           nTieuXa == "<color=gold>Xe Lương Cam<color>" then 
    -- pNpc.SetTitle("<pic=203>")
		end
				self.nMoveNpcId = pNpc.dwId;
	-- me.NewWorld(31,2023,3555); 
    VanTieu:SetNpcMove(pNpc,me)
end

function VanTieu:SetNpcMove(pNpc, me)
		local nGioiHanNgay = me.GetTask(9171,1)
	local nGioiHanNgayCuop = me.GetTask(9171,2)
    local tbRoad = nToaDoHanThuyCoDo
	pNpc.AI_ClearPath()
    for _, Pos in ipairs(tbRoad) do
        if Pos[1] and Pos[2] then
            pNpc.AI_AddMovePos(Pos[1] * 32, Pos[2] * 32)
        end
    end
	local playerCamp = me.GetCamp()
	pNpc.SetCurCamp(6)    
	pNpc.SetNpcAI(9, 0, 0, 0, 0, 0, 0, 0);
    pNpc.SetActiveForever(1)
	Npc:RegPNpcOnDeath(pNpc, function() self:OnDeath(pNpc) end, self);
	local GioiHanHienThi = nGioiHanNgay + 1;
		local szMsg				= "";
	local szMsg = "<color=cyan>Hàng ngày<color> :\n<color=green>Số Lượt Vận Xe Lương :<color=yellow> "..GioiHanHienThi.."/3<color>"

Dialog:SendBattleMsg(me, szMsg)
Dialog:ShowBattleMsg(me, 1, 0)
  local function OnArrive()
        self:OnNpcArrive(pNpc)
		me.SetTask(9171,4,1)
		me.SetTask(9171,1,nGioiHanNgay + 1)
			local nGioiHanSoTieu = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)
			if nGioiHanSoTieu > 0 then 
			KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)-1);
			end 
		KDialog.MsgToGlobal("<color=green>"..pNpc.szName.."<color> đã đến nơi tiếp nhận xin hãy đối thoại Hỏa Đao Vương để nhận thưởng !")
    end
    pNpc.GetTempTable("Npc").tbOnArrive = {OnArrive}
end

function VanTieu:OnNpcArrive(pNpc)
    pNpc.Delete()
end

function VanTieu:OnDeath(pNpc)
		VanTieu:StopAutoRuntime()
		local nGioiHanNgayCuop = me.GetTask(9171,2)
		local nDiemHoatDong = me.GetTask(9177,1) 
		if nGioiHanNgayCuop < 2 then 
		me.AddStackItem(18,1,114,5,{bForceBind=1},1)
			me.SetTask(9177,1,nDiemHoatDong +1);-------Điểm Hoạt Động
			me.Msg("<color=yellow>Cướp thành công (+1 điểm hoạt động)<color>");
		me.SetTask(9171,2,nGioiHanNgayCuop + 1)
			local nNgauNhienLenhBai = MathRandom(1,100)
			if nNgauNhienLenhBai < 15 then 
			me.AddStackItem(18,1,2030,9,nil,1)
			me.Msg("Cướp thành công nhận được 1 <color=yellow>Lệnh Bài Vận Lương <color=pink> từ " .. pNpc.szName .. " thật may mắn")
			end
		KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã Xe Lương diệt thành công <color=pink> " .. pNpc.szName .. " ")
		else 
		 KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã Xe Lương diệt thành công <color=pink> " .. pNpc.szName .. "<color> không nhận được gì vì đã cướp 2 lần ngày hôm nay ")
		 return
		end 
end

function VanTieu:PhanThuong()
	-- local nGioiHanNgay = me.GetTask(9171,1)
		-- if nGioiHanNgay >= 3 then 
			-- me.Msg("<color=yellow> Hôm nay bạn đã nhận thưởng tối đa 3 lần Xe Lương ngày mai hãy quay lại đây ")
			-- return 
		-- end
local nTieuTrang = me.GetTask(9171,5)
local nTieuLuc = me.GetTask(9171,6)
local nTieuLam = me.GetTask(9171,7)
local nTieuTim = me.GetTask(9171,8)
local nTieuCam = me.GetTask(9171,9)
local nTrangThaiVanTieu = me.GetTask(9171,4)
local nTrangThaiLamMoi = me.GetTask(9171,11)
local nDiemHoatDong = me.GetTask(9177,1) --DAY
		    local nTieuXa = ""
	if nTrangThaiVanTieu == 1 then 	
					------------------------------------------------Thưởng Xe Lương Trắng--------------------------------------------------------------
if nTieuTrang == 1 then  
me.AddExp(1000000);-----1tr Exp
			nTieuXa = "<color=white>Xe Lương Trắng<color>"
            me.AddStackItem(18,1,114,6,{bForceBind=1},1)
	me.AddRepute(10,1,1);
						------------------------------------------------Thưởng Xe Lương Lam--------------------------------------------------------------
elseif nTieuLuc == 1 then 
-- me.AddExp(3000000);-----3tr Exp
				nTieuXa = "<color=green>Xe Lương Lam<color>" 
			me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.AddRepute(10,1,1);
						------------------------------------------------Thưởng Xe Lương Lam--------------------------------------------------------------
elseif nTieuLam == 1 then 
				nTieuXa = "<color=green>Xe Lương Lam<color>" 
			me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.AddRepute(10,1,1);
						------------------------------------------------Thưởng Xe Lương Tím--------------------------------------------------------------
elseif nTieuTim == 1 then 
			 nTieuXa = "<color=gold>Xe Lương Cam<color>"
			me.AddStackItem(18,1,114,6,{bForceBind=1},2)
	me.AddRepute(10,1,3);
			local nNgauNhienLenhBai = MathRandom(1,100)
			if nNgauNhienLenhBai < 15 then 
			me.AddStackItem(18,1,2030,9,nil,2)
			KDialog.MsgToGlobal("<color=cyan>"..me.szName.."<color> vừa nhận được 2 <color=yellow>Lệnh Bài Vận Lương từ <color=pink>Xe Lương Cam<color> thật may mắn")
			end
						------------------------------------------------Thưởng Xe Lương Cam--------------------------------------------------------------
elseif nTieuCam == 1 then 
			 nTieuXa = "<color=gold>Xe Lương Cam<color>"
			me.AddStackItem(18,1,114,6,{bForceBind=1},3)
	me.AddRepute(10,1,5);
			local nNgauNhienLenhBai = MathRandom(1,100)
			if nNgauNhienLenhBai < 15 then 
			me.AddStackItem(18,1,2030,9,nil,3)
			KDialog.MsgToGlobal("<color=cyan>"..me.szName.."<color> vừa nhận được 3 <color=yellow>Lệnh Bài Vận Lương từ <color=pink>Xe Lương Cam<color> thật may mắn")
			end
end

			KDialog.MsgToGlobal("Người chơi <color=cyan>"..me.szName.."<color> đã vận Xe Lương thành công "..nTieuXa.." !")
			-- me.Msg("Bạn nhận được 8 vạn đồng thường")
			-- me.Msg("<color=yellow>Nhận thành công (+1 điểm hoạt động)<color>");
			-- me.AddJbCoin(8*10000)
			-- me.SetTask(9177,1,nDiemHoatDong +1);-------Điểm Hoạt Động
			me.SetTask(9171,5,0)
			me.SetTask(9171,6,0)
			me.SetTask(9171,7,0)
			me.SetTask(9171,8,0)
			me.SetTask(9171,9,0)
			me.SetTask(9171,4,0)
			me.SetTask(9171,10,0)
	local nGioiHanSoTieu = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu)

    -- if nGioiHanSoTieu >= 6 then
	-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_GioiHanVanTieu, -1);
    -- end
if nTrangThaiLamMoi == 1 then 
			me.SetTask(9171,11,0)
end 
---------------------------------------------------------------------------------------------------------------------------------------------------------
	else 
			me.Msg("<color=yellow>Ngươi có nhận nhiệm vụ vận Xe Lương chưa , có vẻ như ta chưa thấy chiếc Xe Lương nào của ngươi cập bến")
	end 
end

function VanTieu:Chat(pNpc)
	if pNpc then
	local tbHoTongMsg = {"Úm ba la đừng ai nhìn thấy đừng ai nhìn thấy...",
				   "Các hạ thật uy dũng~~~",
				   "Chào mừng bạn đến với S3 Thần Ưng!"};
		local nRand = MathRandom(#tbHoTongMsg);
		pNpc.SendChat(tbHoTongMsg[nRand]);
	end
end;