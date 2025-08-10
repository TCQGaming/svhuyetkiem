Config.Mission_Battle_CheckNumAccount = 0;--Tắt mở chức năng 0 là tắt,1 là mở
Config.Mission_Battle_HardWare_Folder = "\\script\\Sesshomaru2017\\battle\\HardWareId\\"; -- Đường dẫn folder Ổ cứng
Config.Mission_Battle_HardWare_List = "list.txt"; -- Đường dẫn folder Ổ cứng
Config.Mission_Battle_HardWare_Max = 6;--Số lượng tài khoản tối đa đăng nhập trên 1 máy

function Battle:CheckHardWare(pPlayer)
	if not pPlayer then 
		return -1,0,"Người chơi không tồn tại";
	end	
	local nHardWareId_p = pPlayer.dwHardWareId;
	if not nHardWareId_p then 
		return -1,0,"Lỗi thông tin ổ cứng";
	end	

	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
	if me.nLevel < 110 then
	local nSoNguoi = 6;
	local Msg = "";
	local OldNum = 0;
	local State = 0;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if ((nHardWareId_p == tonumber(tbRow.nHardWareId)) and (tonumber(tbRow.nNum) >= nSoNguoi)) then
				OldNum		= nSoNguoi;
				Msg = "Tối đa chỉ có thể tham gia "..nSoNguoi.." nhân vật";				-- break;
				elseif ((nHardWareId_p == tonumber(tbRow.nHardWareId)) and (tonumber(tbRow.nNum) < nSoNguoi)) then
				OldNum		= tonumber(tbRow.nNum);
				Msg = "Thành công";				-- break;
				State = 1;
				end
			
			end

	end	
	return State,OldNum,Msg;
	---
	else
	local nSoNguoi = 6;
	
	local Msg = "";
	local OldNum = 0;
	local State = 0;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if ((nHardWareId_p == tonumber(tbRow.nHardWareId)) and (tonumber(tbRow.nNum) >= nSoNguoi)) then
				OldNum		= nSoNguoi;
				Msg = "Tối đa chỉ có thể tham gia "..nSoNguoi.." nhân vật";				-- break;
				elseif ((nHardWareId_p == tonumber(tbRow.nHardWareId)) and (tonumber(tbRow.nNum) < nSoNguoi)) then
				OldNum		= tonumber(tbRow.nNum);
				Msg = "Thành công";				-- break;
				State = 1;
				end
			
			end

	end	
	return State,OldNum,Msg;

end
	
end
function Battle:WriteNewHardWare(pPlayer,nNumOld)
	if not pPlayer then 
		return;
	end	
	local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return ;
	end	

	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	

	local szIPPath = "\\script\\iDoctor\\DontLimitBattle\\Account.txt";  
    local tbIPSetting = Lib:LoadTabFile(szIPPath);

    for nRow, tbRowData in pairs(tbIPSetting) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["szAccount"];
        if (tbTemp.szIPban == me.szAccount) then
		    me.Msg("<color=yellow>Không giới hạn nhân vật này:<color><color=cyan> Successfully<color>");
            return 0;
        end
	end
	
	--if nNumOld >= Config.Mission_Battle_HardWare_Max then
	--return 0;
	--end
	Lib:EditTabFile(szFile,1,""..nHardWareId.."",2,""..tonumber(nNumOld)+1 .."");
end

function Battle:TruNewHardWare(pPlayer,nNumOld)
	if not pPlayer then 
		return;
	end	
	local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return ;
	end	

	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end
	
	local szIPPath = "\\script\\iDoctor\\DontLimitBattle\\Account.txt";  
    local tbIPSetting = Lib:LoadTabFile(szIPPath);

    for nRow, tbRowData in pairs(tbIPSetting) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["szAccount"];
        if (tbTemp.szIPban == me.szAccount) then
		    me.Msg("<color=yellow>Không giới hạn nhân vật này:<color><color=cyan> Successfully<color>");
            return 0;
        end
	end
	
	Lib:EditTabFile(szFile,1,""..nHardWareId.."",2,""..tonumber(nNumOld)-1 .."");
end

function Battle:CheckValidHardware(pPlayer)
	if not pPlayer then 
		return;
	end	
	local nHardWareId_p = pPlayer.dwHardWareId;
	if not nHardWareId_p then 
		return;
	end	
	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
	local IdCheck = 0;
	local IdCheck_ = 0;
	if szFile then 
		local tbFile =  Lib:LoadTabFile(szFile);
			for nIndex, tbRow  in ipairs(tbFile) do
				if nHardWareId_p == tonumber(tbRow.nHardWareId) then						
					IdCheck = 1;
				end
			end
	end	
	if IdCheck == 1 then
		IdCheck_ = 1;
	end

	return IdCheck_;
end
function Battle:WriteZeroHardWare(pPlayer)
	local nHardWareId = pPlayer.dwHardWareId;
	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	if not szFile then 
		KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
	end	
		KFile.AppendFile(szFile, ""..nHardWareId.."\t0\n");	
end
function Battle:resetHWfile()
	local szFile = Config.Mission_Battle_HardWare_Folder..Config.Mission_Battle_HardWare_List.."";
	KFile.WriteFile(szFile, "nHardWareId\tnNum\n");	
end
