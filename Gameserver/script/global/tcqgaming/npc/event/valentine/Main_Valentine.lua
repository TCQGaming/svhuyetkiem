
local tb_Valentine_Main ={};
SpecialEvent.tb_Valentine_Main= tb_Valentine_Main;
-- date:19/01/2024
-- by:TCQGaming
function tb_Valentine_Main:OnDialog()
	-- DoScript("\\script\\global\\tcqgaming\\npc\\event\\valentine\\Main_Valentine.lua");
	local szMsg = "Sự Kiện Ngày Lễ Tình Yêu Valentine Đang diễn ra"
	    local tbOpt =     {} 
					table.insert(tbOpt, {"<color=yellow>Ta muốn làm Chocolate Thường<color>",self.lamhopquathuong,self});
					table.insert(tbOpt, {"<color=yellow>Ta muốn làm Chocolate - Đặc Biệt<color>",self.lamhopquadacbiet,self});
					table.insert(tbOpt, {"<color=yellow>Làm mới event lần 2\n<color=green>(200 Vạn đồng)<color>",self.resetevent,self});
					table.insert(tbOpt, {"<color=yellow>Mua Full Event Valentine\n<color=green>(1500 Vạn đồng)<color>",self.muaevent,self});
					table.insert(tbOpt, {"Thoát"});
    Dialog:Say(szMsg, tbOpt)
end

-------------------------------------------------------
function tb_Valentine_Main:nhannl()
	me.AddStackItem(18,1,2034,34,nil,1000)-------Event đặc biệt
	me.AddStackItem(18,1,2034,35,nil,500)-------Event đặc biệt
	-- me.AddStackItem(18,1,2034,17,nil,1000)-------Event đặc biệt
	-- me.AddStackItem(18,1,2034,18,nil,1000)-------Event đặc biệt
	-- me.AddStackItem(18,1,2034,19,nil,1000)-------Event đặc biệt
end 

function tb_Valentine_Main:resetevent()
	local nCount = me.GetTask(9178,142)
	if nCount >= 1 then
		Dialog:Say(string.format("Bạn đã mua lại và làm mới event, sao lại đến nữa"));
		return 0;
	end
local nDong = me.GetJbCoin()
if nDong < 200*10000 then 
	Dialog:Say("Bạn chưa đủ 200 vạn đồng thường rồi")
return 
end
	me.SetTask(9178,118, 0)--Event thường 
	me.SetTask(9178,119, 0)--Event đặc biệt
	me.SetTask(9178,142, nCount + 1);
	me.AddJbCoin(-200*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 200 vạn đồng thường để làm mới event Valentine tại Sứ Giả Sự Kiện<color>");
	end
	
function tb_Valentine_Main:muaevent()
local nDong = me.GetJbCoin()
if nDong < 1500*10000 then 
	Dialog:Say("Bạn chưa đủ 1500 vạn đồng thường rồi")
return 
end
	me.AddStackItem(18,1,2034,35,nil,500)-------Event đặc biệt
	me.AddStackItem(18,1,2034,34,nil,1000)-------Event đặc biệt
	me.AddJbCoin(-1500*10000)
	KDialog.MsgToGlobal("<color=green>Người chơi <color=yellow>[ "..me.szName.." ]<color> đã dùng 1500 vạn đồng thường để mua Max Event Valentine Tại NPC Sứ Giả Sự Kiện<color>");
end
 
function tb_Valentine_Main:lamhopquathuong()
	local szMsg = "<color=yellow>Để làm Chocolate Thường cần: \n<color=yellow>1 Bình Sữa Bò\n1 Hạt Ca Cao\n*500 Tinh Hoạt Lực<color>";
	local tbOpt = 
	{
			{"Tiến Hành làm Chocolate Thường",self.naulamhopquathuong, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end
function tb_Valentine_Main:lamhopquadacbiet()
	local szMsg = "<color=yellow>Để làm Chocolate Đặc Biệt cần: \n<color=yellow>1 Sữa Bò\n1 Vạn Đồng\n1 Hạt Ca Cao";
	local tbOpt = 
	{
			{"Tiến Hành làm Chocolate Đặc Biệt",self.naulamhopquadacbiet, self};	
		{"Ta Chỉ Xem Qua Thôi..."},
	}
	Dialog:Say(szMsg,tbOpt)
end

function tb_Valentine_Main:muakhuon()
	if me.CountFreeBagCell() < 15 then
		local szAnnouce = "Hành trang của bạn không đủ 15 ô trống.";
		me.Msg(szAnnouce);
		return 0;
	end	
    local szMsg = "<color=yellow>Hãy tắt AutoPK rồi thực hiện";
    local tbOpt = 
    {
        {"Đã tắt AutoPK", self.muakhuon1, self},
        {"Ta Chỉ Xem Qua Thôi..."},
    }
    Dialog:Say(szMsg, tbOpt)
end

function tb_Valentine_Main:muakhuon1()
    Dialog:AskNumber("Nhập Số Lượng", 1000, self.muakhuon2, self)
end

function tb_Valentine_Main:muakhuon2(nSoLuong)
local nDong = me.GetJbCoin()
    if (nDong < 10000*nSoLuong) then 
        Dialog:Say("Bạn chưa đủ " .. nSoLuong.. " vạn đồng thường rồi")
        return 
    end

    me.AddStackItem(18, 1, 2034, 19, nil, nSoLuong) -- Event đặc biệt
    me.AddJbCoin(-1 * (nSoLuong * 10000))
end


function tb_Valentine_Main:naulamhopquadacbiet()
    local nCount = me.GetJbCoin()
    local nSuaBo = me.GetItemCountInBags(18, 1, 2034, 29) 
    local nCaCao = me.GetItemCountInBags(18, 1, 2034, 30) 
    local nSoDu = math.min(nSuaBo, nCaCao)

    if nSoDu < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu để làm Chocolate rồi xin hãy kiểm tra lại")
        return
    end

    Dialog:AskNumber("Số lượng đổi", nSoDu, self.naulamhopquadacbiet1, self)
end

 

function tb_Valentine_Main:naulamhopquadacbiet1(szHoaDacBiet)
    local nSuaBo = me.GetItemCountInBags(18, 1, 2034, 29) 
    local nCaCao = me.GetItemCountInBags(18, 1, 2034, 30) 
local nDong = me.GetJbCoin()
local SoDong = math.floor(nDong/10000)
	local tbSuaBo	= {18,1,2034,29,0,0}; 
	local tbCaCao	= {18,1,2034,30,0,0}; 
	if (nSuaBo < 1*szHoaDacBiet) or (nCaCao < 1*szHoaDacBiet)   or (nDong < 10000*szHoaDacBiet) then
	Dialog:Say("Để tiến hành làm "..szHoaDacBiet.." Chocolate cần Tối thiểu :\n"..1*szHoaDacBiet.." vạn Đồng thường\n"..1*szHoaDacBiet.." Sữa Bò , Hạt Ca Cao mỗi thứ 1 loại\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nSuaBo.." Sữa Bò \n"..nCaCao.." Hạt Ca Cao\n"..SoDong.." Vạn Đồng Thường")
	return  
	end
		me.AddJbCoin(-1*(szHoaDacBiet*10000))
		Task:DelItem(me, tbSuaBo, szHoaDacBiet);
		Task:DelItem(me, tbCaCao, szHoaDacBiet);
		me.AddStackItem(18,1,2034,34,nil,szHoaDacBiet)
end

function tb_Valentine_Main:naulamhopquathuong()
    local nSuaBo = me.GetItemCountInBags(18, 1, 2034, 29) 
    local nCaCao = me.GetItemCountInBags(18, 1, 2034, 30) 

local nTinhLuc = me.dwCurGTP;
local nHoatLuc = me.dwCurMKP;
local nGioiHanTinhLuc = 500
local nGioiHanHoatLuc = 500
if (nTinhLuc < 500) or (nHoatLuc < 500) then 
	Dialog:Say("Để tiến hành cần tối thiểu 500 tinh hoạt lực 1 cái\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nTinhLuc.." Tinh Lực / "..nHoatLuc.." Hoạt Lực")
	return
	end
local nSoDu1 = 0
    local nSuaBo = me.GetItemCountInBags(18, 1, 2034, 29) 
    local nCaCao = me.GetItemCountInBags(18, 1, 2034, 30) 

    local nSoDu1 = math.min(nSuaBo, nCaCao)

    if nSoDu1 < 1 then
        Dialog:Say("Bạn thiếu nguyên liệu để làm Chocolate Thường rồi xin hãy kiểm tra lại")
        return
    end
Dialog:AskNumber("Số lượng đổi", nSoDu1, self.naulamhopquathuong1, self);
end 

 
function tb_Valentine_Main:naulamhopquathuong1(szHoaThuong)
    local nSuaBo = me.GetItemCountInBags(18, 1, 2034, 29) 
    local nCaCao = me.GetItemCountInBags(18, 1, 2034, 30) 
	local nTinhLuc = me.dwCurGTP;
	local nHoatLuc = me.dwCurMKP;
	local tbSuaBo	= {18,1,2034,29,0,0}; 
	local tbCaCao	= {18,1,2034,30,0,0}; 
	if (nTinhLuc < 500*szHoaThuong) or (nHoatLuc < 500*szHoaThuong) or (nSuaBo < 1*szHoaThuong) or (nCaCao < 1*szHoaThuong)  then
	Dialog:Say("Để tiến hành làm "..szHoaThuong.." Chocolate Thường cần Tối thiểu :\n"..500*szHoaThuong.." Tinh Lực\n"..500*szHoaThuong.." Hoạt Lực\n"..1*szHoaThuong.." Sữa Bò , Hạt Ca Cao mỗi thứ 1 loại\n<color=red>Hiện Tại Bạn Có<color><color=gold>\n"..nSuaBo.." Sữa Bò \n"..nCaCao.." Hạt Ca Cao\n"..nTinhLuc.." Tinh Lực\n"..nHoatLuc.." Hoạt Lực")
	return  
	end
	me.ChangeCurMakePoint(-1*(szHoaThuong*500)); --Từ Tinh Lực
	me.ChangeCurGatherPoint(-1*(szHoaThuong*500)); --Trừ Hoạt Lực
	me.AddStackItem(18,1,2034,35,nil,szHoaThuong)
		Task:DelItem(me, tbSuaBo, szHoaThuong);
		Task:DelItem(me, tbCaCao, szHoaThuong);
	end

