local szIPPath = "\\script\\IP\\banned.txt";
function IPBan:LoadInfo(nIp)    
    local tbIPSetting = Lib:LoadTabFile(szIPPath);
	local szCurIp = Lib:IntIpToStrIp(nIp);
    for nRow, tbRowData in pairs(tbIPSetting) do
        local tbTemp = {};
        tbTemp.szIPban = tbRowData["IP"];
        if (tbTemp.szIPban == szCurIp) then
        -- me.KickOut();
        Player:Arrest(me.szName);
            return 0;
        end
    end
end 
