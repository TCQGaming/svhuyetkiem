
local tbTruTuongDuong	= Npc:GetClass("long_tru_thatthanh_tuongduong");
tbTruTuongDuong.nGouhuoSkillId		= 377;	
-- Hàm xóa Long Trụ cũ
function tbTruTuongDuong:RemoveOldNpc()
	ClearMapNpc(2166);
end

function tbTruTuongDuong:OnDeath_Boss(nTongId,pNpc)
if not pNpc then 
CTC_7_Thanh:CreatNPC_TuongDuong()
return 1;
end 
if not nTongId then 
CTC_7_Thanh:CreatNPC_TuongDuong()
return 1;
end 
	local pPlayer = pNpc.GetPlayer();
	local nMapId, nX, nY = him.GetWorldPos();
	local nPosX = nX;
	local nPosY = nY;
	local szTongNameOld = "";
	if not pPlayer then
	CTC_7_Thanh:CreatNPC_TuongDuong()
		return 1;
	end
	if nTongId ~= 0 then
		local pTongOld = KTong.GetTong(nTongId);
		szTongNameOld = "của <color=yellow>"..pTongOld.GetName().."<color>";
	end
    local logFilePath = "" -- Đường dẫn tới file log tương ứng với từng loại trụ
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	local szTongName = pTong.GetName();
	local szDate = os.date("%Y-%m-%d %H:%M:%S", GetTime())
	local szLogMessage = string.format("%s", szTongName)
	-- Lấy thời gian hiện tại
    local startTime = GetTime()
    local dateInfo = os.date("*t", startTime)
-- Lưu giá trị thời gian hiện tại vào task
local nTaskValue = dateInfo.hour * 3600 + dateInfo.min * 60 + dateInfo.sec
KGblTask.SCSetDbTaskInt(DBTASD_CongThanhTruTuongDuong, nTaskValue)
	    local nThoiGianDemNguoc_BatTu

	if  him.nTemplateId == 10401 then -- Long Trụ Tương Dương
		logFilePath = "\\script\\ChucNang\\that_thanh_dai_chien\\longtruchiem\\longtrutuongduong.txt"
		 CTC_7_Thanh.LongTru_TuongDuong = szTongName;	
		CTC_7_Thanh.StartTime_LongTru_TuongDuong = startTime		 
		 nThoiGianDemNguoc_BatTu = CTC_7_Thanh.TimeBatTu -- Đặt thời gian bất tử riêng cho Long Trụ 
	end		

	local pNpc2 = KNpc.Add2(him.nTemplateId,him.nLevel,-1,2166, 1665,3142, 0, 0, 1);
	pNpc2.SetVirtualRelation(Npc.emNPCVRELATIONTYPE_TONE, pPlayer.dwTongId);
	Npc:RegPNpcOnDeath(pNpc2, tbTruTuongDuong.OnDeath_Boss, self,pPlayer.dwTongId);
	pNpc2.SetTitle ( "<color=green>Bang Hội <color=gold>"..szTongName.." Chiếm Lĩnh<color> Chưa bất tử");
    local nDemGiay = 1
    local timerId_BatTu

    local function CountdownTimer_BatTu()
        nThoiGianDemNguoc_BatTu = nThoiGianDemNguoc_BatTu - nDemGiay

        if nThoiGianDemNguoc_BatTu < 0 then
            nThoiGianDemNguoc_BatTu = 0
        end

        if nThoiGianDemNguoc_BatTu == 0 then
            Timer:Close(timerId_BatTu)
			-- Tính toán số giây chênh lệch
    local startTime = GetTime()
    local dateInfo = os.date("*t", startTime)
	local nTaskSaved = KGblTask.SCGetDbTaskInt(DBTASD_CongThanhTruTuongDuong)
    local nCurrentTime = dateInfo.hour * 3600 + dateInfo.min * 60 + dateInfo.sec
    local nTinhToan = nCurrentTime - nTaskSaved
	if nTinhToan > CTC_7_Thanh.TimeBatTu then 
	nTinhToan = CTC_7_Thanh.TimeBatTu
	end 
				if nTinhToan == CTC_7_Thanh.TimeBatTu then 
				tbTruTuongDuong:SetImmortalStatus(szTongName)
				end 

            return
        end
    end

    if timerId_BatTu then
        Timer:Close(timerId_BatTu)
    end
    timerId_BatTu = Timer:Register(Env.GAME_FPS * nDemGiay, CountdownTimer_BatTu)


    if nTongId ~= pPlayer.dwTongId then
        KTong.Msg2Tong(pPlayer.dwTongId, "Đã chiếm thành công ".. him.szName.. "")
		local szMsg = "Bang hội <color=yellow>" .. szTongName .. "<color> đã chiếm thành công <color=cyan>" .. him.szName .. "<color> " .. szTongNameOld .. "<color>"
		KDialog.MsgToGlobal(szMsg)

	 end 
        KFile.WriteFile(logFilePath, "")

        local szData = KFile.ReadTxtFile(logFilePath)
        szData = szData and (szData .. "\n" .. szLogMessage) or szLogMessage
        KFile.WriteFile(logFilePath, szData)
end

function tbTruTuongDuong:SetImmortalStatus(szTongName)
    self:RemoveOldNpc()
    self:AddImmortalNpc(szTongName)
		KGblTask.SCSetDbTaskInt(DBTASD_CongThanhTruTuongDuong, 0)
end

function tbTruTuongDuong:AddImmortalNpc(szTongName)
	local pNpc2 = KNpc.Add2(10402, 200, -1, 2166, 1665,3142);
	pNpc2.SetTitle ( "<color=green>Bang Hội<color><color=gold> "..szTongName.." chiếm lĩnh<color>");
	pNpc2.SetCurCamp(6)    
			local szMsg = "Long Trụ Tương Dương Đã Bất Tử Bang Hội Chiếm Lĩnh <color=yellow>" .. szTongName .. "<color>"
		KDialog.MsgToGlobal(szMsg)
	   return pNpc2.dwId
end


function tbTruTuongDuong:Restore_Life(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	pNpc.RestoreLife();
	Timer:Close(self.Npc_TimerId);
end
function tbTruTuongDuong:OnNpcTimer(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end
	local tbTmp		= pNpc.GetTempTable("Npc");
	self:AddAroundPlayersExp(nNpcId,nTongId);							-- 给Npc周围队伍玩家加经验
	return 15 * Env.GAME_FPS;
end 
function tbTruTuongDuong:AddAroundPlayersExp(nNpcId,nTongId)
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	local tbTmp			 = pNpc.GetTempTable("Npc");
	local tbPlayer = KNpc.GetAroundPlayerList(nNpcId, 40);
	local tbPlayerId = {};
	if tbPlayer then
		for _, pPlayer in pairs(tbPlayer) do
			
			if pPlayer.dwTongId == nTongId then
			table.insert(tbPlayerId, pPlayer.nId);
			end
		end
	end

	for _, nPlayerId in pairs(tbPlayerId) do
		self:AddExp2Player(nPlayerId, nNpcId);
	end
end
function tbTruTuongDuong:AddExp2Player(nPlayerId, nNpcId)
	local szMsg		= "Ngươi có công bảo vệ long trụ, nhận được phần thưởng.";
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId)
	if pPlayer == nil then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	if (not pNpc) then
		return 0;
	end
	
	local tbTmp		= pNpc.GetTempTable("Npc");
	pPlayer.CastSkill(self.nGouhuoSkillId, 10, -1, pPlayer.GetNpc().nIndex);
	pPlayer.AddExp(CTC.ExpProtect);

end
