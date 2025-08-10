local tbSuGiaEvent	= Npc:GetClass("long_tru_thatthanh_battu");

function tbSuGiaEvent:OnDialog()
	-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\sugiaevent.lua");
	local szMsg = "Xin chào "..me.szName.." Long trụ này đã bất tử rồi"
	    local tbOpt =     {} 
					table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
    Dialog:Say(szMsg, tbOpt)
end
 

