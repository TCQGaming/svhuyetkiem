-------------------------------------------------------------------
--File: 	factionbattle_npc.lua
--Author: 	zhengyuhua
--Date: 	2008-1-8 17:38
--Describe:	Môn phái chiến npcđối thoại ăn khớp 
-------------------------------------------------------------------

-- Môn phái thi đấu thể thao công năng chọn hạng đối thoại 
function FactionBattle:ChoiceFunc(nFaction)
	local nBaoDanh = me.GetTask(3118,50)
	local nThuongThanhTich = me.GetTask(2016,5)
	 local nTuan    = tonumber(GetLocalDate("%W%y"));
	local nTuanGioiHanThuongThamGia    = me.GetTask(3118,49)
	if me.GetTask(3118,48) ~= nTuan then
		me.SetTask(3118,48, nTuan);
		 me.SetTask(3118, 50, 0);
		me.SetTask(3118,51, 0);------Reset thưởng tham gia tuần
		me.SetTask(3118,52, 0);------Reset thưởng tham gia tuần
	end 

--------Giới hạn hệ nhân vật / PC--------
local nHardWareId = me.dwHardWareId;

local tbHwidPaths = {
    ["TLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLD.txt",
    ["TLB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTLB.txt",
    ["TVT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVT.txt",
    ["TVC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTVC.txt",
    ["DMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMB.txt",
    ["DMT"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDMT.txt",
    ["NDD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDD.txt",
    ["NDC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNDC.txt",
    ["NMC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMC.txt",
    ["NMB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiNMB.txt",
    ["TYC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYC.txt",
    ["TYK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTYK.txt",
    ["CBB"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBB.txt",
    ["CBR"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCBR.txt",
    ["TNK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTNK.txt",
    ["TND"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiTND.txt",
    ["VDK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDK.txt",
    ["VDQ"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiVDQ.txt",
    ["CLD"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLD.txt",
    ["CLK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiCLK.txt",
    ["MGC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGC.txt",
    ["MGK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiMGK.txt",
    ["DTC"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTC.txt",
    ["DTK"] = "\\script\\iDoctor\\CampBattle\\GioiHanMonPhaiDTK.txt"
}

local tbFactionLimits = {
    {nMonPhai = 1,  nHeMonPhai = 1,  key = "TLD", name = "Thiếu Lâm Đao"},
    {nMonPhai = 2,  nHeMonPhai = 1,  key = "TLB", name = "Thiếu Lâm Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 2,  key = "TVT", name = "Thiên Vương Thương"},
    {nMonPhai = 2,  nHeMonPhai = 2,  key = "TVC", name = "Thiên Vương Chùy"},
    {nMonPhai = 1,  nHeMonPhai = 3,  key = "DMB", name = "Đường Môn Bẫy"},
    {nMonPhai = 2,  nHeMonPhai = 3,  key = "DMT", name = "Đường Môn Tiễn"},
    {nMonPhai = 1,  nHeMonPhai = 4,  key = "NDD", name = "Ngũ Độc Đao"},
    {nMonPhai = 2,  nHeMonPhai = 4,  key = "NDC", name = "Ngũ Độc Chưởng"},
    {nMonPhai = 1,  nHeMonPhai = 5,  key = "NMC", name = "Nga My Chưởng"},
    {nMonPhai = 2,  nHeMonPhai = 5,  key = "NMB", name = "Nga My Buff"},
    {nMonPhai = 1,  nHeMonPhai = 6,  key = "TYK", name = "Thúy Yên Kiếm"},
    {nMonPhai = 2,  nHeMonPhai = 6,  key = "TYC", name = "Thúy Yên Đao"},
    {nMonPhai = 1,  nHeMonPhai = 7,  key = "CBR", name = "Cái Bang Rồng"},
    {nMonPhai = 2,  nHeMonPhai = 7,  key = "CBB", name = "Cái Bang Bổng"},
    {nMonPhai = 1,  nHeMonPhai = 8,  key = "TNK", name = "Thiên Nhẫn Kích"},
    {nMonPhai = 2,  nHeMonPhai = 8,  key = "TND", name = "Thiên Nhẫn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 9,  key = "VDK", name = "Võ Đang Khí"},
    {nMonPhai = 1,  nHeMonPhai = 9,  key = "VDQ", name = "Võ Đang Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 10, key = "CLD", name = "Côn Lôn Đao"},
    {nMonPhai = 2,  nHeMonPhai = 10, key = "CLK", name = "Côn Lôn Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 11, key = "MGC", name = "Minh Giáo Chùy"},
    {nMonPhai = 2,  nHeMonPhai = 11, key = "MGK", name = "Minh Giáo Kiếm"},
    {nMonPhai = 1,  nHeMonPhai = 12, key = "DTC", name = "Đoàn Thị Chỉ"},
    {nMonPhai = 2,  nHeMonPhai = 12, key = "DTK", name = "Đoàn Thị Kiếm"}
}

local nSoAccLimit = ConfigAll.GioiHanMonPhai -- Giới hạn số lượng acc/phái

local function CheckFactionLimit(faction)
    local tbHwidOld = Lib:LoadTabFile(tbHwidPaths[faction.key])
    local nNum = 0

    for _, tbRowData in ipairs(tbHwidOld) do
        if tonumber(tbRowData.MaMay) == nHardWareId then
            nNum = nNum + 1
        end
    end

    if nNum >= nSoAccLimit then
        local bFound = false
        for _, tbRowData in ipairs(tbHwidOld) do
            if tbRowData.PlayerName == me.szName and tonumber(tbRowData.MaMay) == nHardWareId then
                bFound = true
                break
            end
        end

        if not bFound then
            Dialog:Say(string.format("<color=cyan>Mỗi Máy tính chỉ được vào %d Nhân vật phái %s\nMáy tính của bạn đã gia nhập %d nhân vật <color=green>%s<color><color>",
                nSoAccLimit, faction.name, nNum, faction.name))
            return true
        end
    end
    return false
end

for _, faction in ipairs(tbFactionLimits) do
    if me.nRouteId == faction.nMonPhai and me.nFaction == faction.nHeMonPhai then
        if CheckFactionLimit(faction) then
            return
        end
    end
end
--------End giới hạn--------

	    local tbOpt =     {} 
local szMsg = "Xin chào: <color=yellow>"..me.szName.." \nThi đấu loạn phái tổ chức mỗi Thứ 3 và thứ 6 thi đấu môn phái\n19h30 Báo danh\n20h00 Chính thức bắt đầu \n<color=red>Đang thi đấu thoát ra sẽ mất cơ hội thi đấu<color>";
			table.insert(tbOpt, {"<color=yellow>Ta muốn Báo Danh Tham gia thi đấu<color>",self.EnterMap, self, nFaction});
				if nThuongThanhTich >= 2 then
			table.insert(tbOpt, {"<color=yellow>Nhận phần thưởng thi đấu<color>",self.ExchangeExp, self, me.nId});
				end
				if nBaoDanh == 1 then 
			table.insert(tbOpt, {"<color=yellow>Nhận phần thưởng tham gia<color>\n<color=green>(20h50-23h59 cùng ngày)",self.thuongthamgia});
				end
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end

function FactionBattle:thuongthamgia() 
    local nGroupId = 2016;
    local nScoreId = 2;
    local nScore = me.GetTask(nGroupId, nScoreId);
    local nBaoDanh = me.GetTask(3118,50)
    local nTuanGioiHanThuongThamGia = me.GetTask(3118,49)
    local nTime = GetTime();
    local nCurTime = tonumber(os.date("%H%M", nTime))
    local nWeekDay = tonumber(os.date("%w", nTime))
    
    -- Kiểm tra nếu là Thứ 3 (2) hoặc Thứ 6 (5)
    if nWeekDay == 2 or nWeekDay == 5 then 
        if nCurTime > 2050 then 
            if nScore >= 0 and nBaoDanh == 1 then
                -- Kiểm tra nếu đã nhận thưởng vào ngày này chưa
                local nDaNhanThuong = me.GetTask(3118, nWeekDay == 2 and 51 or 52) -- Task 51 cho Thứ 3, 52 cho Thứ 6
                if nDaNhanThuong == 0 then
                    ConfigAll.ThuongBaoDanh(nWeekDay)
                else 
                    Dialog:Say(string.format("Bạn đã nhận thưởng <color=yellow>%s</color> này rồi!", nWeekDay == 2 and "Thứ 3" or "Thứ 6"))
                    return 0;
                end 
            else  
                Dialog:Say("Bạn không tham gia hay sao mà tới<color=yellow> 0 điểm cờ </color>cũng không có mà đòi tới đây lãnh thưởng sao\nĐiểm cờ của người đợt này là<color=yellow> "..nScore.." điểm</color>\nHoặc bạn chưa đủ điều kiện nhận thưởng!")
            end
        else  
            Dialog:Say("Nhận thưởng sau 20h50 "..(nWeekDay == 2 and "Thứ 3" or "Thứ 6").." hàng tuần")
        end
    else  
        Dialog:Say("Nhận thưởng sau 20h50 Thứ 3 hoặc Thứ 6 Hàng Tuần")
    end
end
-- báo danh tham gia Môn phái chiến 
function FactionBattle:SignUp(nFaction)
	local tbData = self:GetFactionData(nFaction);
	if not tbData then
		Dialog:Say("Hiện nay không diễn ra Thi Đấu Loạn Phái xin hãy chờ Thứ 3 hoặc thứ 6 thi đấu môn phái hàng tuần 19:00 báo danh 20:00 bắt đầu");
		return 0;
	elseif tbData.nState> self.SIGN_UP then
		Dialog:Say("Thi đấu 20h00 bắt đầu rồi");
		return 0;
	end
	if me.nFaction ~= nFaction then
		Dialog:Say("Ngươi không phải để tự môn phái! Không thể tham gia!");
		return 0;
	end
	if me.nLevel <self.MIN_LEVEL then
		Dialog:Say("ngươi học nghệ không tinh ，cấp bậc chưa đủ"..self.MIN_LEVEL.."cấp ，Có thể tham gia vào bên trong theo dõi thi đấu");
		return 0;
	end
--	if (Wlls:CheckFactionLimit() == 1 and me.nLevel>= self.MAX_LEVEL) then
--		Dialog:Say("ngươi đã xuất sư ，không thể vào bản môn đích Môn phái sân đấu!");
--		return 0;
--	end
	if tbData:GetAttendPlayuerCount()>= self.MAX_ATTEND_PLAYER then
		Dialog:Say("Báo danh nhân số 400 người hạn mức cao nhất ，hiện nay đã max người tham chiến");
	else
		local nRet = tbData:AddAttendPlayer(me.nId);
		if nRet == 0 then
			Dialog:Say("Ngươi đã báo danh quá tên");
		else
			Dialog:Say("Báo danh thành công ，chớ rời khỏi ，nếu không sẽ mất đi tư cách tranh tài !<color=yellow>Thi đấu 20:00 sẽ chính thức bắt đầu");
		end
	end
end

-- gia nhập môn phái sân đấu địa đồ 
function FactionBattle:EnterMap(nFaction)
local nTime = GetTime()
local nCurTime = tonumber(GetLocalDate("%H%M")) -- Dùng GetLocalDate thay cho os.date
local nWeekDay = tonumber(GetLocalDate("%w"))   -- Lấy thứ theo giờ VN

local thutu = {"Chủ Nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"}
local nFlag = self:GetBattleFlag(nFaction)

if nFlag ~= 1 then
    Dialog:Say(string.format(
        "Thi đấu tổ chức Thứ 3 và Thứ 6 (Báo danh 19:30-20:00)\n"..
        "<color=gold>Hôm nay là %s - Chưa đến giờ mở<color>", 
        thutu[nWeekDay + 1]  -- Hiển thị đúng tên thứ
    ))
    return 0
end
	if me.nFaction ~= nFaction then
		Dialog:Say("ngươi điều không phải đệ tử bản môn ，không thể vào bản môn đích Môn phái sân đấu!");
		return 0;
	end
--	if (Wlls:CheckFactionLimit() == 1 and me.nLevel>= self.MAX_LEVEL) then
--		Dialog:Say("ngươi đã xuất sư ，không thể vào bản môn đích Môn phái sân đấu!");
--		return 0;
--	end
	if me.nLevel <self.MIN_LEVEL then
		Dialog:Say("ngươi cấp bậc chưa đủ"..self.MIN_LEVEL.."cấp ，bất năng tham gia luận võ thi đấu thể thao bỉ tái 。");
		return 0;
	end
	
	self:TrapIn(me);
	-- ghi lại tham gia số lần 
	local nNum = me.GetTask(StatLog.StatTaskGroupId, 2) + 1;
	me.SetTask(StatLog.StatTaskGroupId, 2, nNum);

end

-- rời đi môn phái sân đấu đối thoại 
function FactionBattle:LeaveMap(nFaction, bConfirm)
CampBattle:RemovePlayerGioiHan_MonPhai(me);
		local nCurTime = GetTime();
		local nCurTimer = tonumber(GetLocalDate("%H%M"))
		local nBaoDanh = me.GetTask(3118,50)
	if bConfirm == 1 then
    if nCurTimer < 2030 then
	me.SetTask(3118,50, 0);
	else 
	me.SetTask(3118,50,1);
    end
		Npc.tbMenPaiNpc:Transfer(nFaction);
		return 0;
	end
	Dialog:Say("Ngươi nhất định phải rời bỏ sân đấu sao ? nếu như rời bỏ lúc bắt đầu ngươi sẽ mất đi tư cách tranh tài\n<color=yellow>Nếu ngươi thoát khỏi đấu trường loạn phái vào thời gian sớm hơn 20h30 thì sẽ không nhận được thưởng tham gia xin chú ý",
		{
			{"Rời khỏi thi đấu môn phái", FactionBattle.LeaveMap, FactionBattle, nFaction, 1},
			{"Ta suy nghĩ thêm một chút"}
		}
	);
end

function FactionBattle:CancelSignUp(nFaction, bConfirm)
	if bConfirm == 1 then
		local tbData = self:GetFactionData(nFaction);
		if tbData ~= nil then
			if tbData.nState ~= self.SIGN_UP then
				Dialog:Say("Thi đấu đã bắt đầu,ngươi đã chậm mất rồi !");
				return 0;
			end
			tbData:DelAttendPlayer(me.nId)
			Dialog:Say("Ngươi muốn hủy bỏ thi đấu môn phái");
		end
		return 0;
	end
	Dialog:Say("Ngươi thực sự muốn hủy báo danh thi đấu",
		{
			{"Ta muốn hủy báo danh", FactionBattle.CancelSignUp, FactionBattle, nFaction, 1},
			{"Ta suy nghĩ thêm một chút"}
		}
	);	
end

function FactionBattle:ChampionFlagNpc(pPlayer, pNpc)
	Dialog:Say("Thi đấu môn phái tranh tài kết thúc");
end

