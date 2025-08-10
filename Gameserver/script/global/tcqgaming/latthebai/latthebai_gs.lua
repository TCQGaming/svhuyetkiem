-- Event Lật thẻ bài
--me.CallClientScript({"UiManager:OpenWindow", "UI_LatTheBai"}); call xuống client mở open ui
function LatTheBai:StartGame()
	local nStep = me.GetTask(2217,6);
-- Thay đổi điều kiện kiểm tra số lượt quay
local nTurnCount = me.GetTask(9178,80)
	if nTurnCount == 0 and nStep == 0 then
		local szMsg = "<color=yellow>Cần tối thiểu 1 lượt quay để tham gia"
		Dialog:SendBlackBoardMsg(me, szMsg);
		me.Msg(szMsg);
		return 0;
	end
		if me.CountFreeBagCell() < 5 then
		local szMsg = string.format("Cần 5 Ô trống hành trang, hãy sắp xếp và thử lại.");
		Dialog:SendBlackBoardMsg(me, szMsg);
		me.Msg(szMsg);
			return 0;
		end

	if nStep == 0 then
	-- Task Trừ Lượt
		me.SetTask(9178, 80,nTurnCount - 1)
		-- me.Msg("<color=yellow>Bạn vừa sử dụng 1 lượt để lật thiệp mừng xuân số lượt còn lại là "..nTurnCount.." lần")
		me.Msg("<color=yellow>Bạn vừa sử dụng 1 lượt để lật thiệp may mắn số lượt còn lại là "..nTurnCount.." lần")
		me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "StartGame"});
		me.SetTask(2217,6,1);
		self.CheckBai();
	elseif nStep == 2 then
		self.CheckBai();
		self.NhanThuong();
	end
end
function LatTheBai:ClickCard(nPos,nId)
	local NorPos = {};
	local NorPic = {};
	local j = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	nRand = MathRandom(1,11100);
	local tbRate = {50,200,100,20,5,100,3000,4240,100,5,15,15,200,50,3000};	
	for j = 1, 15 do
		nAdd = nAdd + tbRate[j];
		if nAdd >= nRand then
			nIndex = j;
			break;
		end
	end
	-- me.SetTask(9179, 80,-1)

	me.SetTask(2217,nId + 1,nIndex);
	me.SetTask(2218,nPos,1);
	me.SetTask(2219,nPos,nIndex);
	me.SetTask(2220,nId + 1,nPos);
	me.SetTask(2217,7,nId+1);
	if (nId + 1) == 5 then
		me.SetTask(2217,6,2);
		self.EndGame();
		self.CheckBai();
	else
		me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "UpdateCard",nPos,nIndex,nId+1});
	end
end
function LatTheBai:EndGame()
	local NorPos = {};
	local NorPic = {};
	for i = 1, 25 do
		local nRandomItem = MathRandom(15);
		local nTask = me.GetTask(2218,i);
		if nTask == 0 then
			me.SetTask(2219,i,nRandomItem);
			local nTask2 = me.GetTask(2219,i);
			table.insert(NorPos, nTask);
			table.insert(NorPic, nTask2);
		end
	end
	me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "OpenAll",NorPos,NorPic});
end
function LatTheBai:LoadCard()
	local nPos = {};
	local AwardItem = {};
	local nId = {};
	for i = 1, 25 do
		local nTask = me.GetTask(2218,i);
		local nTask2 = me.GetTask(2219,i);
		table.insert(nPos, nTask);
		table.insert(AwardItem, nTask2);
	end
	for j = 1, 5 do
		local nTaskPos = me.GetTask(2220,j);
		table.insert(nId, nTaskPos);
	end
	local nIdCount = me.GetTask(2217,7);
	if nIdCount >= 5 then
		me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "OpenAll",nPos,AwardItem});
	end
	me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "UpdateCardStart",nPos,AwardItem,nId});
end

function LatTheBai:NhanThuong()
	local szInfo = {};
	local FileItem = "\\script\\global\\tcqgaming\\latthebai\\latthebai_config.txt";
	local tbSortItem = Lib:LoadTabFile(FileItem);
	if not tbSortItem then
		print("Khong co file"..FileItem);
		return 0;
	end
	for nId, tbItem in pairs(tbSortItem) do
		local nIdItem = tostring(tbItem.Iditem);
		table.insert(szInfo, nIdItem);
	end
	me.SetTask(2217,7,0);
	me.SetTask(2217,6,0);
	local nTaskStart = me.GetTask(2217,6);
	me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "CheckButton",nTaskStart});
	for i = 1, 5 do
		local nTask = me.GetTask(2217,i);
		if nTask >= 1 then
			me.SetTask(2217,i,0);
			me.SetTask(2220,i,0);
			local nItem = szInfo[nTask];
			local tbGDPL = LatTheBai.split(nItem,",");
			local tbG = tonumber(tbGDPL[1]);
			local tbD = tonumber(tbGDPL[2]);
			local tbP = tonumber(tbGDPL[3]);
			local tbL = tonumber(tbGDPL[4]);
			local tbKhoa = tonumber(tbGDPL[5]);
			local nSoLuong = tonumber(tbGDPL[6]);
			me.AddStackItem(tbG,tbD,tbP,tbL,{bForceBind=tbKhoa,},nSoLuong) -- 
		end
	end
	for i = 1, 25 do
		me.SetTask(2218,i,0);
		me.SetTask(2219,i,0);
	end
end

function LatTheBai:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

function LatTheBai:CheckBai()
	local szInfo = {};
	local FileItem = "\\script\\global\\tcqgaming\\latthebai\\latthebai_config.txt";
	local tbSortItem = Lib:LoadTabFile(FileItem);
	if not tbSortItem then
		print("Khong co file"..FileItem);
		return 0;
	end
	for nId, tbItem in pairs(tbSortItem) do
		local nIdItem = tostring(tbItem.Iditem);
		table.insert(szInfo, nIdItem);
	end
	local nTask = me.GetTask(2217,6);
	local nId = me.GetTask(2217,7);
	me.CallClientScript({"Ui:ServerCall", "UI_LatTheBai", "CheckButton",nTask,nId,szInfo}); 
end

