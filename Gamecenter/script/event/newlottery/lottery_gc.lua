-- 文件名　：lottery_gc.lua
-- 创建者　：sunduoliang
-- 创建时间：2009-09-18 19:11:52
-- 描  述  ：

NewLottery.tbBufId2TblName = {
	[1] = "tbLottery",
	[2] = "tbAward",
	[3] = "tbGoldPlayerName",
	};

function NewLottery:SaveTable()
	local tb = {};
	for nBufId, szTblName in pairs(self.tbBufId2TblName) do
		tb[nBufId] = self[szTblName];
	end
	SetGblIntBuf(GBLINTBUF_LOTTERY_200909, 0, 1, tb);
end

function NewLottery:OnGCStart()

	--print("Lottery:OnGCStart()")
	local tb = {};
	local tbBuf = GetGblIntBuf(GBLINTBUF_LOTTERY_200909, 0, 1);
	if tbBuf and type(tbBuf)=="table"  then
		tb = tbBuf;
	end
	local nLastDate = self:GetLastDate();
	local nFirstDate = self:GetFirstDate();
	if nLastDate < 0 then
		nLastDate = 0;
	end
	if nFirstDate < 0 then
		nFirstDate = 0;
	end	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nSec = Lib:GetDate2Time(nLastDate) + self.AWARD_KEEP_DAY*24*3600;
	local nEndDate = tonumber(os.date("%Y%m%d", nSec));
	if nCurDate < nFirstDate or nCurDate > nEndDate then
		tb = {};
	end
	
	for nBufId, szTblName in pairs(self.tbBufId2TblName) do
		self[szTblName] = tb[nBufId] or {};
	end
end

function NewLottery:OnGCShutDown()
	--print("NewLottery:OnGCShutDown()");
	self:SaveTable();
end

function NewLottery:OnRecConnectEvent(nConnectId)
	GSExcute(nConnectId, {"NewLottery:GSSynStart"});
	for nDate, tbAwardInDate in pairs(self.tbAward) do
		for szName, tbPlayerAward in pairs(tbAwardInDate) do
			for nAward, nAwardNum in pairs(tbPlayerAward) do
				GSExcute(nConnectId, {"NewLottery:__AddAwardEntry", szName, nAward, nAwardNum, nDate});
			end
		end
	end
	
	GSExcute(nConnectId, {"NewLottery:GSSynEnd"});
end

GCEvent:RegisterGCServerStartFunc(NewLottery.OnGCStart, NewLottery);
GCEvent:RegisterGCServerShutDownFunc(NewLottery.OnGCShutDown, NewLottery);

--?gc DoScript("\\script\\event\\lottery\\lottery_gc.lua")
