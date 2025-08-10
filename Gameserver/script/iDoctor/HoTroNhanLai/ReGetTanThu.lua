-- date:30/1/2023
-- By : TCQGaming
-------------------------------------------------------
local tbReGetTanThu ={};
Doctor.ReGetTanThu= tbReGetTanThu;
local nGioiHanCap = ConfigAll.GioiHanEXP
tbReGetTanThu.Phi_Dong = 30000;
tbReGetTanThu.Task_Groups = 3073;
tbReGetTanThu.Task_Day = 1;
tbReGetTanThu.Level_Exp = nGioiHanCap;
tbReGetTanThu.Task_Bach = 3134;
tbReGetTanThu.Day_Bach = 1;
tbReGetTanThu.Task_Tkim = 3135;
tbReGetTanThu.Day_Tkim = 1;
tbReGetTanThu.Task_Bvan = 3136;
tbReGetTanThu.Day_Bvan = 1;
tbReGetTanThu.SoDongMuaLai_TK = 40000-- 4 vạn
tbReGetTanThu.Phi_Dong_BHD = 40000 -- 3 vạn
function tbReGetTanThu:OnDialog()
-- DoScript("\\script\\iDoctor\\HoTroNhanLai\\ReGetTanThu.lua");
	local nNgayMoSV = DietQuai:NgayMoMayChu();
	local nNeedBag = 8;
	if me.CountFreeBagCell() < nNeedBag then
    local szAnnouce = "Sắp xếp hành trang còn trống "..nNeedBag.." ô";
    Dialog:Say(szAnnouce);
    return 0;    
	end
	local szMsg = "Trang Chủ : <color=gold>HuyetKiem2009.Net<color>\nNhận lại hoạt động miễn phí mại zô mại zô<color>\n<color=gold>Máy chủ đã khai mở được <color>"..nNgayMoSV.." ngày";
		    local tbOpt =     {} 
					table.insert(tbOpt, {"<color=cyan>Bạch Hổ Đường<color>",self.tbachhoduong,self});
					table.insert(tbOpt, {"<color=cyan>Tống Kim<color>",self.tttongkim,self});
					table.insert(tbOpt, {"<color=cyan>Bao Vạn Đồng <color>",self.tbaovandong,self});
					-- table.insert(tbOpt, {"<color=cyan>Nhiệm Vụ Hàng Ngày<color>",self.lnthugnhan,self});
		-- if me.nLevel >= 80 then 
					table.insert(tbOpt, {"<color=cyan>Tiêu Dao Cốc<color>",self.nMuaLaiTDC,self});
		-- end 
		if me.nLevel >= 90 then 
					table.insert(tbOpt, {"<color=cyan>Quân Doanh<color>",self.nMuaLaiQuanDoanh,self});
		end 
			table.insert(tbOpt, {"Hiện tại ta chưa muốn"});
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:nMuaLaiQuanDoanh()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD);
			local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[5]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9045,1)
local nLuotMuaConLai = nSoCho - nCount
	if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên trận nào hoặc đã mua hết rồi !")
	return 0;
	end 

			local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Quân Doanh Bỏ Lỡ<color>\n+<color=gold> Quà 1 lượt :<color>\n50 vạn Bạc Khóa\n5 Vạn Đồng Khóa\n2 Huyền Tinh Cấp 7";

	local tbOpt = {
		 -- {"Mua 1 Trận Trả Phí "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 4 vạn đồng)<color>",self.nMuaLaiQuanDoanh1,self};
		 -- {"Mua 10 Trận Trả Phí "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 40 vạn đồng)<color>",self.nMuaLaiQuanDoanh_10Lan,self};
		 {"Nhận lại <color=green>"..nLuotMuaConLai.." lần Quân Doanh",self.muatoanboquandoanh,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:muatoanboquandoanh()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD);
			local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[5]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nSoLanDaMua = me.GetTask(9045,1)
	local nSoDu = 1
	if nSoCho > nSoLanDaMua then 
	nSoDu = nSoCho - nSoLanDaMua
	end 
		-- Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbo_QuanDoanh_1, tbReGetTanThu, nSoDu);
					  Dialog:AskNumber("Nhập Số Lượng", nSoDu, self.muatoanbo_QuanDoanh_1, self);
end

function tbReGetTanThu:muatoanbo_QuanDoanh_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[5]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9045,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại Quân Doanh rồi, chờ lần sau nhé");
		return 0;
	end
	-- local nSoTienTru = math.floor(40000*nSoDu / 10000);
	-- local nMyCoin = me.nCoin;
	-- if (nMyCoin < 40000*nSoDu) then
	-- Dialog:Say("Nhà ngươi không đủ <color=yellow>"..nSoTienTru.." vạn<color> đồng thường\n<color=green>1 lần 4 vạn hiện ngươi muốn mua lại tổng "..nSoDu.." lần");
    -- return 0; 
	-- end

	-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(15000000*nSoDu);
	-- end
	-- me.AddJbCoin(-40000*nSoDu);
			me.SetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID,me.GetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID)+nSoDu);
			 me.AddBindCoin(50000*nSoDu);-----5 vạn đồng khóa
			 me.AddBindMoney(500000*nSoDu);--50 vạn bạc khóa
			-- me.AddStackItem(18,1,114,5,{bForceBind=1},2*nSoDu)
			me.AddStackItem(18,1,114,7,{bForceBind=1},2*nSoDu)
			tbReGetTanThu:nMuaLaiQuanDoanh()
end

function tbReGetTanThu:nMuaLaiQuanDoanh1()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[5]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9045,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại Quân Doanh rồi, chờ lần sau nhé");
		return 0;
	end
 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 4*10000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>4 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(15000000);
	end
	me.AddJbCoin(-4*10000);
			me.SetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID,me.GetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID)+1);
			 me.AddBindCoin(150000);-----15 vạn đồng khóa
			 me.AddBindMoney(150000);--15 vạn bạc khóa
			me.AddStackItem(18,1,114,5,{bForceBind=1},2)
			me.AddStackItem(18,1,114,6,{bForceBind=1},1)
			tbReGetTanThu:nMuaLaiQuanDoanh()
end

function tbReGetTanThu:nMuaLaiQuanDoanh_10Lan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGQD);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[5]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9045,1)
		-- local nSoLanMua = 10
	if nCount  >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại Quân Doanh rồi, chờ lần sau nhé");
		return 0;
	end
 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 40*10000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>40 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(15000000);
	end
	me.AddJbCoin(-40*10000);
			me.SetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID,me.GetTask(Cf.MuaLaiHD_nGROUP[5], Cf.MuaLaiHD_nTASK_ID)+10);
			 me.AddBindCoin(1500000);-----150 vạn đồng khóa
			 me.AddBindMoney(1500000);--150 vạn bạc khóa
			me.AddStackItem(18,1,114,5,{bForceBind=1},20)
			me.AddStackItem(18,1,114,6,{bForceBind=1},10)
			tbReGetTanThu:nMuaLaiQuanDoanh()
end

function tbReGetTanThu:nMuaLaiTDC()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTDC);
			local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[2]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9042,1)
		local nLuotMuaConLai = nSoTran - nCount
	if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên trận nào hoặc đã mua hết rồi !")
	return 0;
	end 
	local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Tiêu Dao Cốc đã bỏ lỡ <color>\n+<color=gold> Quà 1 lượt :<color>\n5 vạn Bạc Khóa\n5 Vạn Đồng Khóa\n2 Huyền Tinh Cấp 5";
	local tbOpt = {
		 -- {"Mua 1 Ải Trả Phí "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 2 vạn đồng)<color>",self.nMuaLaiTDC1,self};
		 -- {"Mua 10 Ải Trả Phí "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 20 vạn đồng)<color>",self.nMuaLaiTDC10,self};
		 	 {"Nhận lại <color=green>"..nLuotMuaConLai.." lần Tiêu Dao Cốc",self.muatoanbotieudaococ,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:muatoanbotieudaococ()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTDC);
			local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[2]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nSoLanDaMua = me.GetTask(9042,1)
	local nSoDu = 1
	if nSoCho > nSoLanDaMua then 
	nSoDu = nSoCho - nSoLanDaMua
	end 
		-- Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbotieudaococ_1, tbReGetTanThu, nSoDu);
			  Dialog:AskNumber("Nhập Số Lượng", nSoDu, self.muatoanbotieudaococ_1, self);
end

function tbReGetTanThu:muatoanbotieudaococ_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTDC);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[2]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9042,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt nhận lại Tiêu Dao Cốc rồi, chờ lần sau nhé");
		return 0;
	end

			me.SetTask(9042,1,nCount + nSoDu);
			 me.AddBindCoin(50000*nSoDu);-----5 vạn đồng khóa
			 me.AddBindMoney(50000*nSoDu);--5 vạn bạc khóa
			me.AddStackItem(18,1,114,5,{bForceBind=1},2*nSoDu)
			tbReGetTanThu:nMuaLaiTDC()
end

function tbReGetTanThu:nMuaLaiTDC1()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTDC);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[2]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9042,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại ải Tiêu Dao Cốc rồi, chờ lần sau nhé");
		return 0;
	end
 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 20000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>2 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(5000000);
	end

local nRandom = MathRandom(1,100)
	me.AddJbCoin(-20000);
	me.SetTask(9042,1,nCount + 1);
	if nRandom <= 15 then 
		me.AddStackItem(18,1,202,1,{bForceBind=1},1)
	end 
			 me.AddBindCoin(50000);-----5 vạn đồng khóa
			 me.AddBindMoney(50000);--30 vạn bạc khóa
			me.AddStackItem(18,1,114,5,{bForceBind=1},1)
			tbReGetTanThu:nMuaLaiTDC()
end

function tbReGetTanThu:nMuaLaiTDC10()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTDC);
	local nTask_nTDC = me.GetTask(tonumber(Cf.MuaLaiHD_nGROUP[2]),tonumber(Cf.MuaLaiHD_nTASK_ID));--tdc
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9042,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại ải Tiêu Dao Cốc rồi, chờ lần sau nhé");
		return 0;
	end
 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 200000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>20 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(50000000);
	end

local nRandom = MathRandom(1,100)
	me.AddJbCoin(-200000);
	me.SetTask(9042,1,nCount + 10);
	if nRandom <= 15 then 
		me.AddStackItem(18,1,202,1,{bForceBind=1},1)
	end 
			 me.AddBindCoin(500000);-----5 vạn đồng khóa
			 me.AddBindMoney(500000);--30 vạn bạc khóa
			me.AddStackItem(18,1,114,5,{bForceBind=1},10)
			tbReGetTanThu:nMuaLaiTDC()
end

function tbReGetTanThu:lnthugnhan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(5014,8)   
	local nLuotMuaConLai = nSoCho - nCount
	if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên lần nào hoặc đã mua hết rồi !")
	return 0;
	end 

	local szMsg = "Có thể nhận lại: <color=green>"..nLuotMuaConLai.." nhiệm vụ<color>\n+<color=gold>Chọn Nhận MIỄN PHÍ bao gồm<color>: 500.000 EXP, 1 Huyền Tinh Cấp 5\n+<color=gold>Chọn Nhận TRẢ PHÍ 2v ĐỒNG bao gồm:<color> 1 triệu EXP, 1 Huyền Tinh Cấp 6 , 2 vạn đồng khóa";
	local tbOpt = {
		{"Nhận miễn phí "..nCount.." / "..nSoTran.." lần",self.frethuong,self};
		{"Nhận Trả Phí 1 Lần "..nCount.." / "..nSoTran.." lần\n(Giá <color=green> 4 vạn đồng)",self.traphinvngay,self};
		{"Nhận Trả Phí 10 Lần "..nCount.." / "..nSoTran.." lần\n(Giá <color=green> 40 vạn đồng)",self.mua10lannvngay,self};
		{"Mua lại <color=green>"..nLuotMuaConLai.." lần Nhiệm Vụ Ngày",self.muatoanbonhiemvungay,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:muatoanbonhiemvungay()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nSoLanDaMua = me.GetTask(5014,8)
	local nSoDu = 1
	if nSoCho > nSoLanDaMua then 
	nSoDu = nSoCho - nSoLanDaMua
	end 
		Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbonhiemvungay_1, tbReGetTanThu, nSoDu);
end

function tbReGetTanThu:muatoanbonhiemvungay_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(5014,8)   
	if nCount  > nSoCho then
	Dialog:Say("Số lượt mua lại Nhiệm Vụ ngày của bạn đã hết, khi nào quên làm gặp ta nhé");
		return 0;
	end
		local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	me.SetTask(5014,8,nCount + 1*nSoDu);
	me.AddStackItem(18,1,114,6,nil,1*nSoDu);
	me.AddBindCoin(20000*nSoDu);
	tbReGetTanThu:lnthugnhan()
		if me.nLevel < self.Level_Exp then
	me.AddExp(500000*nSoDu);
	end
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động "..nSoDu.." lần Nhiệm vụ ngày Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else 
	local nSoTienTru = math.floor(40000*nSoDu / 10000);
	local nMyCoin = me.nCoin;
	if (nMyCoin < 40000*nSoDu) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>"..nSoTienTru.." vạn<color> đồng thường\n<color=green>1 lần 4 vạn hiện ngươi muốn mua lại tổng "..nSoDu.." lần");
    return 0; 
	end
		if me.nLevel < self.Level_Exp then
	me.AddExp(500000*nSoDu);
	end
	me.AddJbCoin(-40000*nSoDu);
	me.SetTask(5014,8,nCount + 1*nSoDu);
	me.AddStackItem(18,1,114,6,nil,1*nSoDu);
	me.AddBindCoin(20000*nSoDu);
tbReGetTanThu:lnthugnhan()
end
end 

function tbReGetTanThu:frethuong()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(5014,8)   
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt chưa làm nhiệm vụ ngày của bạn đã hết, khi nào quên làm thì tới gặp ta nhé");
		return 0;
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(500000);
	end

	me.SetTask(5014,8,nCount + 1);
	me.AddItem(18,1,114,5);
tbReGetTanThu:lnthugnhan()
end

function tbReGetTanThu:traphinvngay()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(5014,8)   
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt chưa làm nhiệm vụ ngày của bạn đã hết, khi nào quên làm thì tới gặp ta nhé");
		return 0;
	end
	if me.CountFreeBagCell() < 2 then
	Dialog:Say("Túi của bạn đã đầy, cần ít nhất 2 ô trống.");
	return 0;
 	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(1000000);
	end
	me.SetTask(5014,8,nCount + 1);
	me.AddBindCoin(20000);	----- Đồng khóa
	me.AddItem(18,1,114,6);
tbReGetTanThu:lnthugnhan()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 1 lần Nhiệm Vụ Ngày Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 40000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow> 4 vạn<color> đồng thường");
    return 0; 
	end
	if me.nLevel < self.Level_Exp then
	me.AddExp(1000000);
	end
	me.AddJbCoin(-20000);
	me.SetTask(5014,8,nCount + 1);
	me.AddBindCoin(20000);	----- Đồng khóa
	me.AddItem(18,1,114,6);
tbReGetTanThu:lnthugnhan()
end
end 

function tbReGetTanThu:mua10lannvngay()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGNVHN);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(5014,8)   
	local nSoLanMua = 10
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt chưa làm nhiệm vụ ngày của bạn đã hết, khi nào quên làm thì tới gặp ta nhé");
		return 0;
	end
	if me.CountFreeBagCell() < 15 then
	Dialog:Say("Túi của bạn đã đầy, cần ít nhất 15 ô trống.");
	return 0;
 	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(10000000);
	end
	me.SetTask(5014,8,nCount + nSoLanMua);
	 me.AddStackItem(18,1,114,6,nil,10);
	me.AddBindCoin(200000);
tbReGetTanThu:lnthugnhan()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 10 lần Nhiệm Vụ Ngày Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 400000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>40v<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(10000000);
	end
	me.AddJbCoin(-400000);
	me.SetTask(5014,8,nCount + nSoLanMua);
	 me.AddStackItem(18,1,114,6,nil,10);
	me.AddBindCoin(200000);
tbReGetTanThu:lnthugnhan()
end 
end

function tbReGetTanThu:tbaovandong()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(2024,80)   
	local nLuotMuaConLai = nSoCho - nCount
		if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên trận nào hoặc đã mua hết rồi !")
	return 0;
	end 
		local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Bao Vạn Đồng Bỏ Lỡ<color>\n+<color=gold> Quà 1 lượt :<color>\n3 vạn Bạc Khóa\n3 Vạn Đồng Khóa\n2 Huyền Tinh Cấp 5\n8 Tiền Du Long";

	local tbOpt = {
		-- {"Nhận miễn phí "..nCount.." / "..nSoTran.." lần",self.freboavnad,self};
		-- {"Nhận Trả Phí 1 Lần "..nCount.." / "..nSoTran.." lần\n(Giá <color=green>4 vạn đồng)",self.muabvd1lantcq,self};
		-- {"Nhận Trả Phí 10 Lần "..nCount.." / "..nSoTran.." lần\n(Giá <color=green>40 vạn đồng)",self.muabvd10lantcq,self};
		{"Nhận lại <color=green>"..nLuotMuaConLai.." lần Bao Vạn Đồng",self.muatoanbobaovandong,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:muatoanbobaovandong()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nSoLanDaMua = me.GetTask(2024,80)
	local nSoDu = 1
	if nSoCho > nSoLanDaMua then 
	nSoDu = nSoCho - nSoLanDaMua
	end 
		-- Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbobaovandong_1, tbReGetTanThu, nSoDu);
						  Dialog:AskNumber("Nhập Số Lượng", nSoDu, self.muatoanbobaovandong_1, self);
end

function tbReGetTanThu:muatoanbobaovandong_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(2024,80)   
	if nCount  > nSoCho then
	Dialog:Say("Số lượt Bao Vạn Đồng của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end

		local nTichLuy = me.GetTask(3028,1)
-- if nTichLuy >= 1000 then 
	me.SetTask(2024,80,nCount + 1*nSoDu);
	me.AddStackItem(18,1,114,5,nil,2*nSoDu);
	me.AddBindCoin(30000*nSoDu);
	me.AddBindMoney(30000*nSoDu);
	me.AddStackItem(18,1,553,1,{bForceBind=1},8*nSoDu)---Tiền Du Long
	tbReGetTanThu:tbaovandong()
		-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(2000000*nSoDu);
	-- end
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  nhận Lại Hoạt Động "..nSoDu.." lần Bao Vạn Đồng Xin Chúc Mừng<color>");
-- else 
	-- local nSoTienTru = math.floor(40000*nSoDu / 10000);
	-- local nMyCoin = me.nCoin;
	-- if (nMyCoin < 40000*nSoDu) then
	-- Dialog:Say("Nhà ngươi không đủ <color=yellow>"..nSoTienTru.." vạn<color> đồng thường\n<color=green>1 lần 4 vạn hiện ngươi muốn mua lại tổng "..nSoDu.." lần");
    -- return 0; 
	-- end
	-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(2000000*nSoDu);
	-- end
	-- me.AddJbCoin(-40000*nSoDu);
	-- me.SetTask(2024,80,nCount + 1*nSoDu);
	-- me.AddStackItem(18,1,114,5,nil,1*nSoDu);
	-- me.AddBindCoin(30000*nSoDu);
	-- me.AddBindMoney(150000*nSoDu);
-- tbReGetTanThu:tbaovandong()
-- end
end 

function tbReGetTanThu:freboavnad()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(2024,80)   
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt Bao Vạn Đồng của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(2000000);
	end
	me.SetTask(2024,80,nCount + 1);
	me.AddStackItem(18,1,114,4,nil,1);
	-- me.AddBindCoin(30000);
	me.AddBindMoney(150000);
tbReGetTanThu:tbaovandong()
end

function tbReGetTanThu:muabvd1lantcq()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(2024,80)   
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt Bao Vạn Đồng của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(2000000);
	end
	me.SetTask(2024,80,nCount + 1);
	me.AddStackItem(18,1,114,5,nil,1);
	me.AddBindCoin(30000);
	me.AddBindMoney(150000);
tbReGetTanThu:tbaovandong()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 1 lần Bao Vạn Đồng Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else
	local nMyCoin = me.nCoin;
	if (nMyCoin < self.Phi_Dong_BHD) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>4v<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(2000000);
	end

	me.AddJbCoin(-40000);
	me.SetTask(2024,80,nCount + 1);
	me.AddStackItem(18,1,114,5,nil,1);
	me.AddBindCoin(30000);
	me.AddBindMoney(150000);
tbReGetTanThu:tbaovandong()
end
end 

function tbReGetTanThu:muabvd10lantcq()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(2024,80)   
	local nSoLanMua = 10
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt Bao Vạn Đồng của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(20000000);
	end
	me.SetTask(2024,80,nCount + 10);
	 me.AddStackItem(18,1,114,5,nil,10);
	me.AddBindCoin(300000);
	me.AddBindMoney(1500000);
tbReGetTanThu:tbaovandong()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 10 lần Bao Vạn Đồng Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");

else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 400000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>40v<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(20000000);
	end

	me.AddJbCoin(-400000);
	me.SetTask(2024,80,nCount + 10);
	 me.AddStackItem(18,1,114,5,nil,10);
	me.AddBindCoin(300000);
	me.AddBindMoney(1500000);
tbReGetTanThu:tbaovandong()
end
end 

function tbReGetTanThu:tttongkim()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)
	local nLuotMuaConLai = nSoCho - nCount
		if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên trận nào hoặc đã nhận hết rồi !")
	return 0;
	end 
	local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Tống Kim đã bỏ lỡ <color>\n+<color=gold> Quà 1 lượt :<color>\n5 vạn Bạc Khóa\n5 Vạn Đồng Khóa\n1 Huyền Tinh Cấp 6";
	local tbOpt = {
		-- {"Nhận Miễn Phí "..nCount.." / "..nSoCho.." lần",self.fretgognkjm,self};
		 -- {"Nhận Trả Phí "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 4 vạn đồng)<color>",self.nMuaLaiTK,self};
		 {"Nhận lại <color=green>"..nLuotMuaConLai.." lần Tống Kim",self.muatoanbotongkim,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbReGetTanThu:muatoanbotongkim()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoLanDaMua = me.GetTask(9043,1)
	local nSoDu = 1
	if nSoTran > nSoLanDaMua then 
	nSoDu = nSoTran - nSoLanDaMua
	end 
		-- Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbotongkim_1, tbReGetTanThu, nSoDu);
							  Dialog:AskNumber("Nhập Số Lượng", nSoDu, self.muatoanbotongkim_1, self);
end

function tbReGetTanThu:muatoanbotongkim_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nCount = me.GetTask(9043,1)
	if nCount  >= nSoTran then
		Dialog:Say("Bạn đã hết lượt Nhận lại tống kim rồi, chờ trận sau nhé");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
-- if nTichLuy >= 1000 then 	
	me.SetTask(9043,1,nCount + nSoDu);
	me.AddStackItem(18,1,114,6,nil,1*nSoDu)---10 Viên HT 6 Khóa
	me.AddBindCoin(50000*nSoDu);
	me.AddBindMoney(50000*nSoDu);
	tbReGetTanThu:tttongkim()
		-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(5000000*nSoDu);
	-- end
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Nhận Lại Hoạt Động "..nSoDu.." lần Tống Kim Xin Chúc Mừng<color>");
-- else 
	-- local nSoTienTru = math.floor(40000*nSoDu / 10000);
	-- local nMyCoin = me.nCoin;
	-- if (nMyCoin < 40000*nSoDu) then
	-- Dialog:Say("Nhà ngươi không đủ <color=yellow>"..nSoTienTru.." vạn<color> đồng thường\n<color=green>1 lần 4 vạn hiện ngươi muốn mua lại tổng "..nSoDu.." lần");
    -- return 0; 
	-- end
		-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(5000000*nSoDu);
	-- end
	-- me.AddJbCoin(-40000*nSoDu);
	-- me.SetTask(9043,1,nCount + nSoDu);
	-- me.AddStackItem(18,1,114,6,nil,1*nSoDu)---10 Viên HT 6 Khóa
	-- me.AddBindCoin(60000*nSoDu);
	-- me.AddBindMoney(150000*nSoDu);
	-- tbReGetTanThu:tttongkim()
-- end
end 

function tbReGetTanThu:nMuaLaiTK()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)

	local szMsg = "Có thể nhận lại: <color=green>"..nCount
	.." / "..nSoCho.." trận<color>\n+<color=gold>Nhận Trả Phí bao gồm:<color>\n5 triệu EXP, 15v Bạc Khóa, 6v Đồng Khóa và 1 Huyền Tinh Cấp 6";
	local tbOpt = {
		 {"Nhận Trả Phí 1 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 4 vạn đồng)<color>",self.gettofnqwkm,self};
		 {"Nhận Trả Phí 10 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 40 vạn đồng)<color>",self.muatongkim10lan,self};
		 {"Nhận Trả Phí 30 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 120 vạn đồng)<color>",self.muatongkim30lan,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbReGetTanThu:muatongkim10lan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)
	local nSoLanMua = 10
	if nCount + nSoLanMua > nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại tống kim rồi, chờ trận sau nhé");
		return 0;
	end
	if me.CountFreeBagCell() < 15 then
	Dialog:Say("Túi của bạn đã đầy, cần ít nhất 15 ô trống.");
	return 0;
 	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(50000000);
	end
	me.SetTask(9043,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,10)---10 Viên HT 6 Khóa
	me.AddBindCoin(600000);-- Đồng Khóa
	me.AddBindMoney(1500000);--Bạc Khóa
tbReGetTanThu:nMuaLaiTK()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 10 lần Tống Kim Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 400000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>40 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(50000000);
	end

	me.AddJbCoin(-400000);
	me.SetTask(9043,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,10)---10 Viên HT 6 Khóa
	me.AddBindCoin(600000);-- Đồng Khóa
	me.AddBindMoney(1500000);--Bạc Khóa
tbReGetTanThu:nMuaLaiTK()
end 
end
function tbReGetTanThu:muatongkim30lan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)
	local nSoLanMua = 30
	if nCount + nSoLanMua > nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại tống kim rồi, chờ trận sau nhé");
		return 0;
	end
	if me.CountFreeBagCell() < 35 then
	Dialog:Say("Túi của bạn đã đầy, cần ít nhất 35 ô trống.");
	return 0;
 	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(150000000);
	end
	me.SetTask(9043,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,30)---30 Viên HT 6 Khóa
	me.AddBindCoin(1800000);--Đồng Khóa 180 vạn
	me.AddBindMoney(4500000);--Bạc Khóa 450 vạn
tbReGetTanThu:nMuaLaiTK()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 30 lần Tống Kim Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 1200000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>120 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(150000000);
	end

	me.AddJbCoin(-1200000);
	me.SetTask(9043,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,30)---30 Viên HT 6 Khóa
	me.AddBindCoin(1800000);--Đồng Khóa 180 vạn
	me.AddBindMoney(4500000);--Bạc Khóa 450 vạn
tbReGetTanThu:nMuaLaiTK()
end
end 

function tbReGetTanThu:gettofnqwkm()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại tống kim rồi, chờ trận sau nhé");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
	if nTichLuy >= 1000 then 
		if me.nLevel < self.Level_Exp then
	me.AddExp(5000000);
	end
	me.SetTask(9043,1,nCount + 1);
	me.AddItem(18,1,114,6);
	me.AddBindCoin(60000);
	me.AddBindMoney(150000);
tbReGetTanThu:nMuaLaiTK()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 1 lần Tống Kim Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 40000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>4 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(5000000);
	end

	me.AddJbCoin(-40000);
	me.SetTask(9043,1,nCount + 1);
	me.AddItem(18,1,114,6);
	me.AddBindCoin(50000);
	me.AddBindMoney(150000);
tbReGetTanThu:nMuaLaiTK()
end 
end

function tbReGetTanThu:fretgognkjm()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGTK);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(9043,1)
	if nCount >= nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại tống kim rồi, chờ trận sau nhé");
		return 0;
	end
	if me.nLevel < self.Level_Exp then
	me.AddExp(5000000);
	end

	me.SetTask(9043,1,nCount + 1);
	me.AddItem(18,1,114,5);
	me.AddBindMoney(50000);
	-- me.AddBindCoin(20000);
tbReGetTanThu:tttongkim()
end

function tbReGetTanThu:tbachhoduong()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)   
	local nLuotMuaConLai = nSoCho - nCount
	if nLuotMuaConLai <= 0 then 
	Dialog:Say("<color=yellow>Bạn không bỏ quên trận nào hoặc đã mua hết rồi !")
	return 0;
	end 
	local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Bạch Hổ Đường đã bỏ lỡ <color>\n+<color=gold> Quà 1 lượt :<color>\n3 vạn Bạc Khóa\n3 Vạn Đồng Khóa\n2 Huyền Tinh Cấp 5\n10 Tiền Du Long";
	local tbOpt = {
		-- {"Nhận Miễn Phí "..nCount.." / "..nSoCho .." lần",self.frebchaoh,self};
		-- {"Nhận Trả Phí "..nCount.." / "..nSoCho .." lần\n(Giá <color=green> 3 vạn đồng)<color>",self.traphine,self};
		{"Nhận Miễn Phí Lại <color=green>"..nLuotMuaConLai.." lần Bạch Hổ Đường",self.muatoanbobachhoduong,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbReGetTanThu:traphine()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)   
	local nLuotMuaConLai = nSoCho - nCount
	local szMsg = "Có thể nhận lại : <color=green>"..nLuotMuaConLai.." trận Bạch Hổ Đường<color>\n+<color=gold>Chọn Nhận Miễn Phí bao gồm:<color> 3.000.000 EXP, 5 vạn Bạc Khóa và 2 Huyền Tinh Cấp 5\n+<color=gold>Chọn Nhận Trả Phí bao gồm:<color> 3.000.000 EXP, 15 vạn Bạc Khóa, 10 vạn Đồng Khóa và 1 Huyền Tinh Cấp 6\n<color=red>Gói Trả Phí Nếu Mốc Tích Nạp Của Bạn Lớn Hơn 1000 Vạn bạn sẽ không mất đồng";
	local tbOpt = {
		 {"Nhận Trả Phí 1 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 3 vạn đồng)<color>",self.getbachaoh,self};
		 {"Nhận Trả Phí 10 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 30 vạn đồng)<color>",self.muabhd10lan,self};
		 {"Nhận Trả Phí 30 Lần "..nCount.." / "..nSoCho.." lần\n(Giá <color=green> 90 vạn đồng)<color>",self.muabhd30lan,self};
		 {"Quay lại bảng menu",self.OnDialog,self};
	};
	Dialog:Say(szMsg, tbOpt);
end
function tbReGetTanThu:muatoanbobachhoduong()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nSoLanDaMua = me.GetTask(3148,1)
	local nSoDu = 1
	if nSoCho > nSoLanDaMua then 
	nSoDu = nSoCho - nSoLanDaMua
	end 
		-- Dialog:AskNumber("Nhập Số Lượng:", nSoDu, tbReGetTanThu.muatoanbobachhoduong_1, tbReGetTanThu, nSoDu);
					  Dialog:AskNumber("Nhập Số Lượng", nSoDu, self.muatoanbobachhoduong_1, self);
end

function tbReGetTanThu:muatoanbobachhoduong_1(nSoDu)
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)
	local nSoLanMua = nSoDu
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt Bạch Hổ Đường của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end
			local nTichLuy = me.GetTask(3028,1)
-- if nTichLuy >= 1000 then 
	me.SetTask(3148,1,nCount + nSoDu);
	me.AddStackItem(18,1,114,5,nil,2*nSoDu);
	me.AddBindCoin(30000*nSoDu);
	me.AddBindMoney(30000*nSoDu);
	me.AddStackItem(18,1,553,1,{bForceBind=1},10*nSoDu)---Tiền Du Long
	tbReGetTanThu:tbachhoduong()
			-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(3000000*nSoDu);
	-- end
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Nhận Lại Hoạt Động "..nSoDu.." lần BHĐ Xin Chúc Mừng<color>");
-- else 
	-- local nSoTienTru = math.floor(30000*nSoDu / 10000);
	-- local nMyCoin = me.nCoin;
	-- if (nMyCoin < 30000*nSoDu) then
	-- Dialog:Say("Nhà ngươi không đủ <color=yellow>"..nSoTienTru.." vạn<color> đồng thường\n<color=green>1 lần 3 vạn hiện ngươi muốn mua lại tổng "..nSoDu.." lần");
    -- return 0; 
	-- end
		-- if me.nLevel < self.Level_Exp then
	-- me.AddExp(3000000*nSoDu);
	-- end
	-- me.AddJbCoin(-30000*nSoDu);
	-- me.SetTask(3148,1,nCount + nSoDu);
	-- me.AddStackItem(18,1,114,6,nil,1*nSoDu);
	-- me.AddBindCoin(100000*nSoDu);
	-- me.AddBindMoney(150000*nSoDu);
	-- tbReGetTanThu:tbachhoduong()
-- end
end 

function tbReGetTanThu:getbachaoh()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
	Dialog:Say("Số lượt Bạch Hổ Đường của bạn đã hết, hẹn ngày mai nhé");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
	if nTichLuy >= 1000 then 
		if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,1);
	me.AddBindCoin(100000);
	me.AddBindMoney(150000);
tbReGetTanThu:traphine()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 1 lần BHĐ Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else 
	local nMyCoin = me.nCoin;
	if (nMyCoin < 30000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>3 Vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end

	me.AddJbCoin(-30000);
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,1);
	me.AddBindCoin(100000);
	me.AddBindMoney(150000);
tbReGetTanThu:traphine()
end 
end

function tbReGetTanThu:muabhd10lan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)
	local nSoLanMua = 10
	if nCount + nSoLanMua > nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại BHĐ rồi");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,10);
	me.AddBindCoin(1000000);
	me.AddBindMoney(1500000);
tbReGetTanThu:traphine()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 10 lần BHĐ Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");

else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 300000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>30 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.AddJbCoin(-300000);
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,10);
	me.AddBindCoin(1000000);
	me.AddBindMoney(1500000);
tbReGetTanThu:traphine()
end
end 

function tbReGetTanThu:muabhd30lan()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBHD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)
	local nSoLanMua = 30
	if nCount + nSoLanMua > nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại BHĐ rồi");
		return 0;
	end
	local nTichLuy = me.GetTask(3028,1)
if nTichLuy >= 1000 then 
	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,30);
	me.AddBindCoin(3000000);
	me.AddBindMoney(4500000);
tbReGetTanThu:traphine()
	me.Msg("<color=cyan>[ "..me.szName.." ]<color> Bạn đã  Mua Lại Hoạt Động 30 lần BHĐ Trả Phí Nhưng Không Mất Đồng Vì Đạt Mốc 1000 Vạn Đồng Tích Nạp Trở Lên Xin Chúc Mừng<color>");
else
	local nMyCoin = me.nCoin;
	if (nMyCoin < 900000) then
	Dialog:Say("Nhà ngươi không đủ <color=yellow>90 vạn<color> đồng thường");
    return 0; 
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.AddJbCoin(-900000);
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,6,nil,30);
	me.AddBindCoin(3000000);
	me.AddBindMoney(4500000);
tbReGetTanThu:traphine()
end 
end

function tbReGetTanThu:frebchaoh()
	local nSoTran = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_MUALAIHOATDONGBVD);
	local nSoCho = nSoTran;
	local nCount = me.GetTask(3148,1)
	local nSoLanMua = 1
	if nCount + nSoLanMua > nSoCho then
		Dialog:Say("Bạn đã hết lượt mua lại BHĐ rồi");
		return 0;
	end

	if me.nLevel < self.Level_Exp then
	me.AddExp(3000000);
	end
	me.SetTask(3148,1,nCount + nSoLanMua);
	me.AddStackItem(18,1,114,5,nil,2);
	me.AddBindMoney(50000);
	-- me.AddBindCoin(30000);
tbReGetTanThu:tbachhoduong()
end
