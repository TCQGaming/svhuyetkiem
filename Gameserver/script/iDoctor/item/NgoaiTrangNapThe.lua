-- date:12/8
-- by:iDoctor
-------------------------------------------------------
local tbNgoaiTrangNapThe ={};
SpecialEvent.NgoaiTrangNapThe= tbNgoaiTrangNapThe;

function tbNgoaiTrangNapThe:OnDialog()
	local nDongRut = me.GetTask(3028,1)
	local szMsg =  "Mời bạn chọn loại ngoại trang muốn nhận?";
    local tbOpt =     {}
			if nDongRut >= 300 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 300 vạn đồng",self.ngoaitrang150,self});
	        end
			
			if nDongRut >= 400 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 400 vạn đồng",self.ngoaitrang450,self});
	        end
			
			if nDongRut >= 500 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 500 vạn đồng",self.ngoaitrang750,self});
	        end
			
			if nDongRut >= 1000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 1000 vạn đồng",self.ngoaitrang1050,self});
	        end
			
			if nDongRut >= 2000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 2000 vạn đồng",self.ngoaitrang1500,self});
	        end
			
			if nDongRut >= 5000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 5000 vạn đồng",self.ngoaitrang2250,self});
	        end
			
			if nDongRut >= 7000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 7.000 vạn đồng",self.ngoaitrang1950,self});
	        end
			
			if nDongRut >= 10000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 10.000 vạn đồng",self.ngoaitrang10tr,self});
	        end
			
			if nDongRut >= 15000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 15.000 vạn đồng",self.ngoaitrang15tr,self});
	        end
			
			if nDongRut >= 20000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 20.000 vạn đồng",self.ngoaitrang20tr,self});
	        end
			
			if nDongRut >= 30000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 30.000 vạn đồng",self.ngoaitrang25tr,self});
	        end
			
			if nDongRut >= 50000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 50.000 vạn đồng",self.ngoaitrang30tr,self});
	        end
			
			if nDongRut >= 70000 then
            table.insert(tbOpt, {"Nhận tích lũy ngoại trang 70.000 vạn đồng",self.ngoaitrang45tr,self});
	        end
			
			-- if nDongRut >= 45000 then
            -- table.insert(tbOpt, {"Nhận tích lũy ngoại trang 45.000 vạn đồng",self.nt3000,self});
	        -- end
			
			-- if nDongRut >= 20000 then
            -- table.insert(tbOpt, {"Nhận tích lũy ngoại trang 20.000 vạn đồng",self.nt3000,self});
	        -- end
			
			-- if nDongRut >= 25000 then
            -- table.insert(tbOpt, {"Nhận tích lũy ngoại trang 25.000 vạn đồng",self.nt3500,self});
	        -- end
            table.insert(tbOpt, {"Ta chỉ xem qua thôi..."});

    Dialog:Say(szMsg, tbOpt)
end

function tbNgoaiTrangNapThe:nt3500()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
		me.AddItem(1,25,92,1); -- ao nu cap 1
		me.AddItem(1,26,92,1); -- non nu cap 1
		me.AddItem(1,25,91,1); -- ao nam cap 1
		me.AddItem(1,26,93,1); -- non nam cap 1
	-- end
end

function tbNgoaiTrangNapThe:nt3000()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	-- if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,95,1); -- ao nu cap 1
		me.AddItem(1,26,96,1); -- non nu cap 1
	-- elseif tbInfo.nSex ~= 1 then
		me.AddItem(1,25,96,1); -- ao nam cap 1
		me.AddItem(1,26,97,1); -- non nam cap 1
	-- end
end

function tbNgoaiTrangNapThe:nt2700()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	-- if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,97,1); -- ao nu cap 1
		me.AddItem(1,26,98,1); -- non nu cap 1
	-- elseif tbInfo.nSex ~= 1 then
		me.AddItem(1,25,98,1); -- ao nam cap 1
		me.AddItem(1,26,99,1); -- non nam cap 1
	-- end
end

function tbNgoaiTrangNapThe:ngoaitrang45tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,99,1); -- ao nu cap 1
		me.AddItem(1,26,100,1); -- non nu cap 1
else 
		me.AddItem(1,25,100,1); -- ao nam cap 1
		me.AddItem(1,26,101,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang25tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,88,1); -- ao nu cap 1
		me.AddItem(1,26,88,1); -- non nu cap 1
else 
		me.AddItem(1,25,103,1); -- ao nam cap 1
		me.AddItem(1,26,89,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang30tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,101,1); -- ao nu cap 1
		me.AddItem(1,26,102,1); -- non nu cap 1
else 
		me.AddItem(1,25,102,1); -- ao nam cap 1
		me.AddItem(1,26,103,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang20tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,90,1); -- ao nu cap 1
		me.AddItem(1,26,90,1); -- non nu cap 1
else 
		me.AddItem(1,25,89,1); -- ao nam cap 1
		me.AddItem(1,26,91,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang15tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end
	
		local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
			me.AddItem(1,25,93,1); -- ao nu cap 1
		me.AddItem(1,26,94,1); -- non nu cap 1
	else 
		me.AddItem(1,25,94,1); -- ao nam cap 1
		me.AddItem(1,26,95,1); -- non nam cap 1
	end 
end

function tbNgoaiTrangNapThe:ngoaitrang10tr()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,87,1); -- ao nu cap 1
		me.AddItem(1,26,87,1); -- non nu cap 1
else 
		me.AddItem(1,25,86,1); -- ao nam cap 1
		me.AddItem(1,26,86,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang2250()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,85,1); -- ao nu cap 1
		me.AddItem(1,26,85,1); -- non nu cap 1
else 
		me.AddItem(1,25,84,1); -- ao nam cap 1
		me.AddItem(1,26,84,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang1950()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,83,1); -- ao nu cap 1
		me.AddItem(1,26,83,1); -- non nu cap 1
else
		me.AddItem(1,25,82,1); -- ao nam cap 1
		me.AddItem(1,26,82,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang1500()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,81,1); -- ao nu cap 1
		me.AddItem(1,26,81,1); -- non nu cap 1
else 
		me.AddItem(1,25,80,1); -- ao nam cap 1
		me.AddItem(1,26,80,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang1050()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,79,1); -- ao nu cap 1
		me.AddItem(1,26,79,1); -- non nu cap 1
else 
		me.AddItem(1,25,78,1); -- ao nam cap 1
		me.AddItem(1,26,78,1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang750()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,77,1).Bind(1); -- ao nu cap 1
		me.AddItem(1,26,77,1).Bind(1); -- non nu cap 1
else 
		me.AddItem(1,25,76,1).Bind(1); -- ao nam cap 1
		me.AddItem(1,26,76,1).Bind(1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang450()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
    me.AddItem(1,25,75,1).Bind(1); -- ao nu cap 1
    me.AddItem(1,26,75,1).Bind(1); -- non nu cap 1
	else
		me.AddItem(1,25,74,1).Bind(1); -- ao nam cap 1
		me.AddItem(1,26,74,1).Bind(1); -- non nam cap 1
	end
end

function tbNgoaiTrangNapThe:ngoaitrang150()
	local nNeedBag = 3;
	if me.CountFreeBagCell() < nNeedBag then
    	local szAnnouce = "Hành trang yêu cầu "..nNeedBag.." ô trống";
    	Dialog:Say(szAnnouce);
    	return 0;    
	end

	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	if tbInfo.nSex ~= 0 then
		me.AddItem(1,25,71,1); -- ao nu cap 1
		me.AddItem(1,26,71,1); -- non nu cap 1
	else
		me.AddItem(1,25,70,1); -- ao nam cap 1
		me.AddItem(1,26,70,1); -- non nam cap 1
	end
end
