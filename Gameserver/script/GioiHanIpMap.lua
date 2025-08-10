


GioiHanIpMap.MapBoss_CheckNumAccount = 0;--Tắt mở chức năng 0 là tắt,1 là mở
GioiHanIpMap.MapBoss_HardWare_Folder = "\\script\\map\\gioihanmap\\HardWareId\\"; -- Đường dẫn folder Ổ cứng
GioiHanIpMap.MapBoss_HardWare_List = "list.txt"; -- Đường dẫn folder Ổ cứng
GioiHanIpMap.MapBoss_HardWare_Max = 1;--Số lượng tài khoản tối đa đăng nhập trên 1 máy

function GioiHanIpMap:CheckHardWare(pPlayer)
    local nIp = pPlayer.GetTask(2063, 1);
   
    local szCurIp = Lib:IntIpToStrIp(nIp);
	if not pPlayer then 
		return -1,0,"Người chơi không tồn tại";
	end	
	local nHardWareId_p = szCurIp;
	if not nHardWareId_p then 
		return -1,0,"Lỗi thông tin ổ cứng";
	end	

	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
	local Msg = "";
	local OldNum = 0;
	local State = 0;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if ((nHardWareId_p == tbRow["nHardWareId"]) and (tonumber(tbRow.nNum) >= GioiHanIpMap.MapBoss_HardWare_Max)) then
				OldNum		= GioiHanIpMap.MapBoss_HardWare_Max;
				Msg = "Máy tính của bạn đã vượt quá "..GioiHanIpMap.MapBoss_HardWare_Max.." tài khoản được vào bản đồ";				-- break;
				elseif ((nHardWareId_p == tbRow["nHardWareId"]) and (tonumber(tbRow.nNum) < GioiHanIpMap.MapBoss_HardWare_Max)) then
				OldNum		= tonumber(tbRow.nNum);
				Msg = "Thành công";				-- break;
				State = 1;
				end
			
			end

	end	
	return State,OldNum,Msg;
end
function GioiHanIpMap:WriteNewHardWare(pPlayer,nNumOld)
-- local szRoleName = me.szName;
-- local nPlayerId = KGCPlayer.GetPlayerIdByName(szRoleName);
    -- local npPlayer = KPlayer.GetPlayerObjById(nPlayerId);
    local nIp = me.GetTask(2063, 1);
   
    local szCurIp = Lib:IntIpToStrIp(nIp);
	-- local nHardWareId_p = me.dwHardWareId;
 -- Dialog:Say("ip:"..szCurIp.."");
	if not pPlayer then 
		return;
	end	
	local nHardWareId = szCurIp;
	if not nHardWareId then 
		return ;
	end	

	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	

	--if nNumOld >= GioiHanIpMap.MapBoss_HardWare_Max then
	--return 0;
	--end
	Lib:EditTabFile(szFile,1,""..nHardWareId.."",2,""..tonumber(nNumOld) +1 .."");
end

function GioiHanIpMap:TruNewHardWare(pPlayer,nNumOld)
    local nIp = pPlayer.GetTask(2063, 1);
   
    local szCurIp = Lib:IntIpToStrIp(nIp);
	if not pPlayer then 
		return;
	end	
	local nHardWareId = szCurIp;
	if not nHardWareId then 
		return ;
	end	

	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end
	
	Lib:EditTabFile(szFile,1,""..nHardWareId.."",2,""..tonumber(nNumOld) -1 .."");
end

function GioiHanIpMap:CheckValidHardware(pPlayer)
    local nIp = pPlayer.GetTask(2063, 1);
   
    local szCurIp = Lib:IntIpToStrIp(nIp);
	if not pPlayer then 
		return;
	end	
	local nHardWareId_p = szCurIp;
	if not nHardWareId_p then 
		return;
	end	
	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
	local IdCheck = 0;
	local IdCheck_ = 0;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if nHardWareId_p == tbRow["nHardWareId"] then						
					IdCheck = 1;
				end
			end
	end	
	if IdCheck == 1 then
		IdCheck_ = 1;
	end

	return IdCheck_;
end
function GioiHanIpMap:WriteZeroHardWare(pPlayer)
    local nIp = pPlayer.GetTask(2063, 1);
   
    local szCurIp = Lib:IntIpToStrIp(nIp);
	local nHardWareId = szCurIp;
	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
		KFile.AppendFile(szFile, ""..nHardWareId.."\t0\n");	
end
function GioiHanIpMap:resetHWfile()
	local szFile = GioiHanIpMap.MapBoss_HardWare_Folder..GioiHanIpMap.MapBoss_HardWare_List.."";
	KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
end
