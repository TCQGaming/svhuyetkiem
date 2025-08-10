--quan phủ lệnh truy nã 
--tôn đa lương 
--2008.08.05
Require("\\script\\task\\wanted\\wanted_def.lua");

function Wanted:LoadLevelGroup()
	self.LevelGroup = {};
	local tbFile = Lib:LoadTabFile("\\setting\\task\\wanted\\level_group.txt");
	if not tbFile then
		return;
	end
	for i=2, #tbFile do 
		local nLevel = tonumber(tbFile[i].Level);
		local nLevelGroup = tonumber(tbFile[i].LevelGroup);
		self.LevelGroup[nLevelGroup] = nLevel;
	end
end

function Wanted:LoadTask()
	self.TaskFile = {};
	self.TaskLevelSeg = {};
	local tbFile = Lib:LoadTabFile("\\setting\\task\\wanted\\wanted_killnpc.txt");
	if not tbFile then
		return;
	end
	for i=2, #tbFile do
		local nTaskId	= tonumber(tbFile[i].TaskId);
		local nLevelSeg	= tonumber(tbFile[i].LevelSeg);
		local tbTemp = {
		szTaskName	= (tbFile[i].TaskName),
		szTargetName= (tbFile[i].TaskType),
		nMapId		= tonumber(tbFile[i].MapId),
		nPosX		= math.floor(tonumber(tbFile[i].PosX)),
		nPosY		= math.floor(tonumber(tbFile[i].PosY)),
		szMapName	= (tbFile[i].MapName),
		nNpcId		= tonumber(tbFile[i].NpcId),
		nNum		= tonumber(tbFile[i].Num) or 1,		
		nLevelSeg = nLevelSeg;
		}
		self.TaskFile[nTaskId] = tbTemp;
		if not self.TaskLevelSeg[nLevelSeg] then
			self.TaskLevelSeg[nLevelSeg] = {};
		end
		table.insert(self.TaskLevelSeg[nLevelSeg], nTaskId);
	end
end

-- mới bắt đầu hóa nhiệm vụ liên bảng 
function Wanted:InitFile()
	-- căn cứ đẳng cấp đoạn tới chọn nhiệm vụ 
	self:LoadLevelGroup();
	self:LoadTask();
	self:ReadMainTask();
	self:ReadTaskFile();
end;

function Wanted:ReadTaskFile()
	self.tbSubTaskData = {};
	for nTaskId, tbSubFile in pairs(self.TaskFile) do
		local tbParams = {};
		if tbSubFile.szTargetName =="KillNpc"then
			tbParams = {tbSubFile.nNpcId, tbSubFile.nMapId, tbSubFile.nNum};
		end;
		-- phục vụ đoan tài tái nhập Tử nhiệm vụ 
		if (MODULE_GAMESERVER) then
			self:ReadSubTask(nTaskId, tbSubFile.szTaskName, tbSubFile.szTargetName, tbParams);
		else
			-- cấp hộ khách đoan dùng chậm tồn 
			if self.tbSubTaskData[nTaskId]==nil then
				self.tbSubTaskData[nTaskId] = {};
			end;
			self.tbSubTaskData[nTaskId].szTaskName	= tbSubFile.szTaskName;
			self.tbSubTaskData[nTaskId].szTargetName	= tbSubFile.szTargetName;
			self.tbSubTaskData[nTaskId].tbParams		= tbParams;			
		end;
	end;
end;

function Wanted:ReadMainTask()
	
	local tbTaskData	= {};
	tbTaskData.nId		= self.TASK_MAIN_ID;
	tbTaskData.szName	= self.TEXT_NAME;
	
	
	-- chúa nhiệm vụ cơ sở thuộc tính 
	local tbAttribute	= {};
	tbTaskData.tbAttribute	= tbAttribute;
	
	tbAttribute["Order"]		= Lib:Str2Val("linear");	-- nhiệm vụ nước chảy ：tuyến tính 
	tbAttribute["Repeat"]		= Lib:Str2Val("true");		-- có hay không nhưng trọng tố ：thị 
	tbAttribute["Context"]		= Lib:Str2Val("");			-- nhiệm vụ miêu tả 
	tbAttribute["Share"]		= Lib:Str2Val("false");		-- có hay không nhưng cùng chung 
	tbAttribute["TaskType"]		= Lib:Str2Val("3");			-- nhiệm vụ loại hình ：3、ngẫu nhiên nhiệm vụ 
	tbAttribute["AutoTrack"]	= Lib:Str2Val("true");
	
	-- chủ nhiệm vụ hạ đích Tử nhiệm vụ 
	local tbReferIds	= {};
	tbTaskData.tbReferIds	= tbReferIds;
		
	for nTaskId, tbSubFile in pairs(self.TaskFile) do

		local nReferId		= nTaskId; -- trích dẫn Tử nhiệm vụ Id
		local nReferIdx		= #tbReferIds + 1;	-- trích dẫn Tử nhiệm vụ hướng dẫn tra cứu 
		local tbReferData	= {};
		
		-- bất năng tồn tại đã có đích nhiệm vụ 
		assert(not Task.tbReferDatas[nReferId]);
		
		Task.tbReferDatas[nReferId]	= tbReferData;
		
		tbReferIds[nReferIdx]		= nReferId;
		tbReferData.nReferId		= nReferId;
		tbReferData.nReferIdx		= nReferIdx;
		tbReferData.nTaskId			= self.TASK_MAIN_ID;
		tbReferData.nSubTaskId		= nTaskId;
		tbReferData.szName			= string.format("Truy nã Hải tặc %s",tbSubFile.szTaskName);
		tbReferData.tbDesc			= {};
		
		tbReferData.tbVisable	= {};	-- có thể thấy được điều kiện 
		tbReferData.tbAccept	= {}; 	-- nhưng nhận điều kiện 
		
		tbReferData.nAcceptNpcId	= 0;
		
		tbReferData.bCanGiveUp	= Lib:Str2Val("false");
		
		tbReferData.szGossip ="";			-- lời đồn đãi văn tự 
		tbReferData.nReplyNpcId	= 0;		-- hồi phục NPC
		tbReferData.szReplyDesc	="";		-- hồi phục văn tự 
		tbReferData.nBagSpaceCount = 0;		-- ba lô không gian kiểm tra 
		tbReferData.nLevel = 50;
		tbReferData.szIntrDesc ="";
		tbReferData.nDegree = 1;
		tbReferData.tbAwards	= {
			tbFix	= {},
			tbOpt	= {},
			tbRand	= {},
		};
	end;
	
	Task.tbTaskDatas[self.TASK_MAIN_ID]	= tbTaskData;
	return tbTaskData;
end;

-- độc nhập Tử nhiệm vụ ，Tử nhiệm vụ id，Tử nhiệm vụ loại hình （giết quái 、tầm vật chờ ），nhiệm vụ tiếng Trung danh 
function Wanted:ReadSubTask(nSubTaskId, szTaskName, szTargetName, tbParams)

	local tbSubData		= {};
	tbSubData.nId		= nSubTaskId;
	tbSubData.szName	= szTaskName;
	tbSubData.szDesc	= string.format("Hình bộ nha môn phát công văn thông báo, Hải tặc <pos=%s,%s,%s,%s> gần đây xuất hiện quanh <color=yellow>%s<color=white>. Bạn cần phải bắt chúng về quy án!",szTaskName,self.TaskFile[nSubTaskId].nMapId, self.TaskFile[nSubTaskId].nPosX, self.TaskFile[nSubTaskId].nPosY, self.TaskFile[nSubTaskId].szMapName);
	tbSubData.tbSteps	= {};
	tbSubData.tbExecute = {};
	tbSubData.tbStartExecute = {};
	tbSubData.tbFailedExecute = {};
	tbSubData.tbFinishExecute = {};
	-- nhiệm vụ thuộc tính 
	local tbAttribute	= {};
	tbSubData.tbAttribute	= tbAttribute;
	
	-- bắt đầu đối thoại 
	local tbDialog	= {};
	tbAttribute.tbDialog	= tbDialog;
	tbAttribute.tbDialog["Start"] = {szMsg=""};
	tbAttribute.tbDialog["Procedure"] = {szMsg =""};
	tbAttribute.tbDialog["Error"] = {szMsg =""};
	tbAttribute.tbDialog["Prize"] = {szMsg =""};
	tbAttribute.tbDialog["End"] = {szMsg =""};	

	-- bước(đi) 
	local tbStep	= {};
	table.insert(tbSubData.tbSteps, tbStep);

	-- bắt đầu sự kiện ，ở đây thiết một trống không npc
	local tbEvent	= {};
	tbStep.tbEvent	= tbEvent;
	tbEvent.nType	= 1;
	tbEvent.nValue	= 0;

	-- nhiệm vụ mục tiêu 
	local tbTargets		= {};
	tbStep.tbTargets	= tbTargets;

	local tbTagLib	= Task.tbTargetLib[szTargetName];
	assert(tbTagLib,"Target["..szTargetName.."] not found!!!");
	local tbTarget	= Lib:NewClass(tbTagLib);--căn cứ hàm số danh newmục tiêu 
	tbTarget:Init(unpack(tbParams));--từ Tử nhiệm vụ văn kiện bả mục tiêu số liệu độc nhập 
	tbTargets[#tbTargets+1]	= tbTarget;


	-- bước(đi) điều kiện 
	tbStep.tbJudge	= {};
	tbStep.tbExecute = {};

	
	Task.tbSubDatas[nSubTaskId]	= tbSubData;
	return tbSubData;
end;

