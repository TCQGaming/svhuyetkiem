
QianCengTower.nStart_Time = 0000; -- thời gian mở thiên tầm tháp
QianCengTower.nEnd_Time = 2200;-- thời gian đóng thiên tầm tháp

QianCengTower.nStart_Time_NT = 2200; -- thời gian mở nhận thưởng thiên tầm tháp
QianCengTower.nEnd_Time_NT = 2350;-- thời gian nhận thưởng đóng thiên tầm tháp

QianCengTower.Folder = "\\script\\\mission\\\qiancengtower\\"; -- duong dan folder
QianCengTower.List_Player = "QianCengTower_Player.txt"; -- list nhan vat
QianCengTower.Top1 = 0;
QianCengTower.NameHang1 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top2 = 0;
QianCengTower.NameHang2 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top3 = 0;
QianCengTower.NameHang3 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top4 = 0;
QianCengTower.NameHang4 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top5 = 0;
QianCengTower.NameHang5 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top6 = 0;
QianCengTower.NameHang6 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top7 = 0;
QianCengTower.NameHang7 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top8 = 0;
QianCengTower.NameHang8 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top9 = 0;
QianCengTower.NameHang9 = "<color=gray>Chưa xác định<color>";
QianCengTower.Top10 = 0;
QianCengTower.NameHang10 = "<color=gray>Chưa xác định<color>";

local nId1 = 1;
QianCengTower.tbDanhSach = {};

QianCengTower.PhanThuong = { -- config phan thuong su kien

	[1] = {
		["BacThuong"] = 15 * 10000, -- 5 van
		["BacKhoa"] = 15 * 10000, -- 5 van
		["DongKhoa"] = 15 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,8}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 20}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},
	[2] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 2}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 15}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[3] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 10}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[4] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 9}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},		
	[5] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 8}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[6] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 7}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[7] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 6}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[8] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 5}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[9] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 4}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
	[10] = {
		["BacThuong"] = 5 * 10000, -- 5 van
		["BacKhoa"] = 5 * 10000, -- 5 van
		["DongKhoa"] = 5 * 10000, -- 5 van
		["KinhNghiem"] = 30 * 1000000, -- 30tr exp  
		["Item1"] = {{18,1,114,7}, 1}, -- huyền tinh 8
		["Item2"] = {{18,1,1333,1}, 3}, -- sách chân nguyên
		["event"] = {{18,1,2031,1}, 500}, -- NL EVent
		},	
}

function QianCengTower:OnDialog_Top()
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if me.GetTask(QianCengTower.TASK_GROUP_ID, QianCengTower.TASK_Id_Day) < nDate then
		me.SetTask(QianCengTower.TASK_GROUP_ID, QianCengTower.TASK_Id_Day, nDate);
		me.SetTask(QianCengTower.TASK_GROUP_ID, QianCengTower.TASK_Id_NT, 0);
		me.SetTask(9162,1,0)------Task Thưởng 10 tầng ngày
	end 
	
	
	local szFile = QianCengTower.Folder..QianCengTower.List_Player.."";
	local tbsortpos = Lib:LoadTabFile(szFile);
	local nLineCount = #tbsortpos;
	nId1 = nLineCount;
	for nLine=1, nLineCount do
		local nId  = #self.tbDanhSach + 1;
		local szNames = tbsortpos[nLine].szName;
		local Rank = tonumber(tbsortpos[nLine].Rank) or 0;		
		self.tbDanhSach[nId] = {};
		self.tbDanhSach[nId].szNames = self:StrVal(Lib:ClearStrQuote(szNames));
		self.tbDanhSach[nId].Rank = Rank;
	end
	
		local nXepHang = 0;
	for k,v in pairs(tbsortpos) do
		if me.szName == v.szName then
			nXepHang = k;
			break;
		end
	end
	local nSoTang = 0 
for _, tbRowData in pairs(tbsortpos) do
 if me.szName == tbRowData['szName'] then
 nSoTang = tbRowData['Rank']
 end
 end
 
	-- local nSoTang = 0
	-- for _, tbRowData in pairs(tbsortpos) do
	-- local Rank = tonumber(tbsortpos[tbRowData].Rank) or 0;	
		-- local nSoTang = tonumber(tbRowData.Rank);
	-- end
	
	for i=1,nId1 do
	--lay ra nguoi co TS lon nhat
			if self.tbDanhSach[i].Rank > QianCengTower.Top1 then
					QianCengTower.Top1 = self.tbDanhSach[i].Rank;
					QianCengTower.NameHang1 = self.tbDanhSach[i].szNames;
			end		
	end
	for i =1,nId1 do
		if self.tbDanhSach[i].Rank > QianCengTower.Top2 and self.tbDanhSach[i].Rank <= QianCengTower.Top1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 then
					QianCengTower.Top2 = self.tbDanhSach[i].Rank;	
					QianCengTower.NameHang2 = self.tbDanhSach[i].szNames;
		end	
	end
	for i =1,nId1 do
		--lay ra nguoi co TS lon thu 3
		if self.tbDanhSach[i].Rank > QianCengTower.Top3 and self.tbDanhSach[i].Rank <= QianCengTower.Top2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 then
				QianCengTower.Top3 = self.tbDanhSach[i].Rank;	
				QianCengTower.NameHang3 = self.tbDanhSach[i].szNames;	
		end	
	end
	for i =1,nId1 do
			--lay ra nguoi co TS lon thu 4
		if self.tbDanhSach[i].Rank > QianCengTower.Top4 and self.tbDanhSach[i].Rank <= QianCengTower.Top3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 then
				QianCengTower.Top4 = self.tbDanhSach[i].Rank;	
				QianCengTower.NameHang4 = self.tbDanhSach[i].szNames;	
		end	
	end
			--lay ra nguoi co TS lon thu 5
	for i =1,nId1 do
		if self.tbDanhSach[i].Rank > QianCengTower.Top5 and self.tbDanhSach[i].Rank <= QianCengTower.Top4 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4 then
			QianCengTower.Top5 = self.tbDanhSach[i].Rank;	
			QianCengTower.NameHang5 = self.tbDanhSach[i].szNames;	
		end	
	end
	for i =1,nId1 do
			--lay ra nguoi co TS lon thu 6		
			if self.tbDanhSach[i].Rank > QianCengTower.Top6 and self.tbDanhSach[i].Rank <= QianCengTower.Top5 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4  and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang5 then
						QianCengTower.Top6 = self.tbDanhSach[i].Rank;	
						QianCengTower.NameHang6 = self.tbDanhSach[i].szNames;	
			end	
	end
			--lay ra nguoi co TS lon thu 7
	for i =1,nId1 do
			if self.tbDanhSach[i].Rank > QianCengTower.Top7 and self.tbDanhSach[i].Rank <= QianCengTower.Top6 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4  and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang5 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang6 then
						QianCengTower.Top7 = self.tbDanhSach[i].Rank;	
						QianCengTower.NameHang7 = self.tbDanhSach[i].szNames;	
			end		
	end
	for i =1,nId1 do
			--lay ra nguoi co TS lon thu 8
			if self.tbDanhSach[i].Rank > QianCengTower.Top8 and self.tbDanhSach[i].Rank <= QianCengTower.Top7 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4  and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang5 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang6 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang7 then
						QianCengTower.Top8 = self.tbDanhSach[i].Rank;	
						QianCengTower.NameHang8 = self.tbDanhSach[i].szNames;	
			end			
	end		
	for i =1,nId1 do
			--lay ra nguoi co TS lon thu 9
			if self.tbDanhSach[i].Rank > QianCengTower.Top9 and self.tbDanhSach[i].Rank <= QianCengTower.Top8 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4  and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang5 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang6 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang7 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang8 then
						QianCengTower.Top9 = self.tbDanhSach[i].Rank;	
						QianCengTower.NameHang9 = self.tbDanhSach[i].szNames;	
			end				
	end		
	for i =1,nId1 do
			
			--lay ra nguoi co TS lon thu 10
			if self.tbDanhSach[i].Rank > QianCengTower.Top10 and self.tbDanhSach[i].Rank <= QianCengTower.Top9 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang1 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang2 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang3 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang4  and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang5 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang6 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang7 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang8 and self.tbDanhSach[i].szNames ~= QianCengTower.NameHang9 then
						QianCengTower.Top10 = self.tbDanhSach[i].Rank;	
						QianCengTower.NameHang10 = self.tbDanhSach[i].szNames;	
			end				
	end		
		local nMsg = "";
		local nNhanThuongTop = 0;
		if me.szName == QianCengTower.NameHang1 then
			nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>1<color><color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 1;
		elseif me.szName == QianCengTower.NameHang2 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>2<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 2;
		elseif me.szName == QianCengTower.NameHang3 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>3<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 3;
		elseif me.szName == QianCengTower.NameHang4 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>4<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 4;
		elseif me.szName == QianCengTower.NameHang5 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>5<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 5;
		elseif me.szName == QianCengTower.NameHang6 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>6<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 6;
		elseif me.szName == QianCengTower.NameHang7 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>7<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 7;
		elseif me.szName == QianCengTower.NameHang8 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>8<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 8;
		elseif me.szName == QianCengTower.NameHang9 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>9<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 9;
		elseif me.szName == QianCengTower.NameHang10 then
		nMsg = "<color=green>"..me.szName.."<color> được hạng <color=yellow>10<color>\n<color=green>Số tầng<color> đã vượt hiện tại :"..nSoTang.."";
				-- nMsg = "<color=green>"..me.szName.." Xếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng đã vượt hiện tại :"..nSoTang.."";	
			nNhanThuongTop = 10;
		else
			nMsg = "<color=green>"..me.szName.." chưa lọt vào TOP 10 \nXếp Hạng Hiện Tại : "..nXepHang.."\nSố tầng<color> đã vượt hiện tại :"..nSoTang.."";		
		end
			local tbOpt = {
			};
		local szTitle =	"            <color=yellow>Bảng Xếp Hạng<color><enter>"..
						"<color=green>TOP 1:   "..QianCengTower.NameHang1.."     "..QianCengTower.Top1.." Tầng<color>\n"..
						"<color=yellow>TOP 2:   "..QianCengTower.NameHang2.."    "..QianCengTower.Top2.." Tầng<color>\n"..
						"<color=red>TOP 3:   "..QianCengTower.NameHang3.."    "..QianCengTower.Top3.." Tầng<color>\n"..
						"TOP 4:   "..QianCengTower.NameHang4.."    "..QianCengTower.Top4.." Tầng\n"..
						"TOP 5:   "..QianCengTower.NameHang5.."    "..QianCengTower.Top5.." Tầng\n"..
						"TOP 6:   "..QianCengTower.NameHang6.."    "..QianCengTower.Top6.." Tầng\n"..
						"TOP 7:   "..QianCengTower.NameHang7.."    "..QianCengTower.Top7.." Tầng\n"..
						"TOP 8:   "..QianCengTower.NameHang8.."    "..QianCengTower.Top8.." Tầng\n"..
						"TOP 9:   "..QianCengTower.NameHang9.."    "..QianCengTower.Top9.." Tầng\n"..
						"TOP 10:   "..QianCengTower.NameHang10.."    "..QianCengTower.Top10.." Tầng\n\n"..
						""..nMsg..""..
						"";
			local nTime = GetTime();
			local nCurTime = tonumber(os.date("%H%M", nTime))

			if nCurTime >= QianCengTower.nStart_Time_NT and nCurTime <= QianCengTower.nEnd_Time_NT then
				table.insert(tbOpt,1, {"<color=yellow>Nhận Thưởng Xếp Hạng", QianCengTower.NhanThuong_Daily, QianCengTower,nNhanThuongTop});
				table.insert(tbOpt, 	{"<color=yellow>Nhận Thưởng qua 10 Tầng\n<color=green>(5 Sách Exp Chân Nguyên)", self.thuong10tang, self});
				table.insert(tbOpt, {"Kết Thúc Đối Thoại"});
			end				
		Dialog:Say(szTitle, tbOpt);
end

function QianCengTower:thuong10tang()
local nGioiHan = me.GetTask(9162,1)
if nGioiHan > 0 then 
		Dialog:Say("Hôm nay nhà ngươi đã lãnh thưởng rồi mà ?");
return 0;
end
	local szFile = QianCengTower.Folder..QianCengTower.List_Player.."";
	local tbsortpos = Lib:LoadTabFile(szFile);
	local nSoTang = 0 
for _, tbRowData in pairs(tbsortpos) do
 if me.szName == tbRowData['szName'] then
 nSoTang = tbRowData['Rank']
 end
 end
 if tonumber(nSoTang) >= 10 then 
	me.AddStackItem(18,1,1333,1,tbItemInfo,5)
	me.SetTask(9162,1,1)
	else
			Dialog:Say("Các hạ chưa vượt qua 10 tầng thiên tầng tháp\nHiện nay theo ta thấy các hạ mới vượt được <color=yellow>"..nSoTang.." tầng<color> mà thôi ngày mai cố gắng");
end
end

function QianCengTower:NhanThuong_Daily(nNhanThuongTop)
	local nThuong = 0;	
	if nNhanThuongTop < 1 then
		Dialog:Say("Ngươi không có dữ liệu xếp hạng");
		return 0;
	end
	if nNhanThuongTop >= 10 then
		nThuong = 10;
	else
		nThuong	= nNhanThuongTop;
	end
	--me.Msg("Thông báo : "..nNhanThuongTop.."-"..nThuong.."");
	if nThuong < 1 then
		Dialog:Say("Có lỗi xãy ra vui lòng liên hệ GM");
		return 0;
	end
	local nCount = me.GetTask(QianCengTower.TASK_GROUP_ID,QianCengTower.TASK_Id_NT)
	if nCount > 0 then
		Dialog:Say("Mỗi người chơi chỉ được nhận thưởng 1 lần trong ngày");
		return 0;
	end
	for szThuong, tbUseRateItem in pairs(QianCengTower.PhanThuong[nThuong]) do
		if szThuong == "Item1" then
			local tbItemInfo = {bForceBind = 1};
			me.AddStackItem(tbUseRateItem[1][1], tbUseRateItem[1][2], tbUseRateItem[1][3], tbUseRateItem[1][4], tbItemInfo, tbUseRateItem[2]);
		elseif szThuong == "Item2" then 
			local tbItemInfo = {bForceBind = 1};
			me.AddStackItem(tbUseRateItem[1][1], tbUseRateItem[1][2], tbUseRateItem[1][3], tbUseRateItem[1][4], tbItemInfo, tbUseRateItem[2]);
		elseif szThuong == "event" then 
			local tbItemInfo = {bForceBind = 1};
			me.AddStackItem(tbUseRateItem[1][1], tbUseRateItem[1][2], tbUseRateItem[1][3], tbUseRateItem[1][4], tbItemInfo, tbUseRateItem[2]);
		elseif szThuong == "BacThuong" then	
			me.Earn(tbUseRateItem,0);
		elseif szThuong == "BacKhoa" then	
			me.AddBindMoney(tbUseRateItem);
		elseif szThuong == "DongKhoa" then	
			me.AddBindCoin(tbUseRateItem);
		elseif szThuong == "KinhNghiem" then	
			me.AddExp(tbUseRateItem);	
		end	
		me.SetTask(QianCengTower.TASK_GROUP_ID,QianCengTower.TASK_Id_NT, 1)
	end
	local szMsg = "Chúc mừng "..me.szName.." đã nhận thưởng <color=green> TOP "..nNhanThuongTop.." Thiên Tầm Tháp<color> thành công.";
	KDialog.MsgToGlobal(szMsg);
	--KDialog.NewsMsg(0, Env.NEWSMSG_COUNT,szMsg);

end
local function fnStrValue(szVal)
	local varType = loadstring("return "..szVal)();
	if type(varType) == 'function' then
		return varType();
	else
		return varType;
	end
end
function QianCengTower:StrVal(szParam)	--加载题库
	local szText = string.gsub(szParam, "<%%(.-)%%>", fnStrValue);
	return szText;
end
