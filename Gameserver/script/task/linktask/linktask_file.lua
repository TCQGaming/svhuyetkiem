
-- ====================== văn kiện tin tức ======================

-- kiếm hiệp thế giới môn phái nhiệm vụ liên đầu văn kiện （đệ nhị hãy ）
-- Edited by peres
-- 2007/12/11 PM 08:50

-- rất nhiều chuyện không cần dự trắc 
-- dự trắc hội đái lai do dự 
-- bởi vì tâm lý hội có chỉ cụ 

-- ======================================================

LinkTask.tbfile_SubTask		= {};	-- Tử nhiệm vụ đích bảng nội dung tập hợp 
LinkTask.tbSubTaskData		= {};	-- Tử nhiệm vụ đích hoãn tồn sổ cứ 

-- mới bắt đầu hóa nhiệm vụ liên bảng 
function LinkTask:InitFile()
	-- cây cứ chờ cấp đoạn lai đăng khan nhiệm vụ 
	self.tbfile_TaskLevelGroup		= Lib:NewClass(Lib.readTabFile,"\\setting\\task\\linktask\\level_group.txt");
	
	-- các loại nhiệm vụ loại hình đích quyền nặng 
	self.tbfile_TaskType			= Lib:NewClass(Lib.readTabFile,"\\setting\\task\\linktask\\type_select.txt");
	
	for i=1, self.tbfile_TaskType:GetRow() do
		
		local nMainTaskId	= self.tbfile_TaskType:GetCellInt("TypeId", i);
		local szEntityFile	= self.tbfile_TaskType:GetCell("FileName", i);
		
		if nMainTaskId>0 and szEntityFile~=""then
			self:_Debug("Start create entity file:", nMainTaskId, szEntityFile);
			self.tbfile_SubTask[nMainTaskId]		= Lib:NewClass(Lib.readTabFile,"\\setting\\task\\linktask\\"..szEntityFile);		
		end;
	end;
	
	self:ReadTaskFile();
end;

function LinkTask:ReadTaskFile()
	
	for nMainTaskId,_ in pairs(self.tbfile_SubTask) do

		self:_ReadTask(nMainTaskId);
		
		local tabfileSubTask	= self.tbfile_SubTask[nMainTaskId];
		
		for i=1, tabfileSubTask:GetRow() do
			local nSubTaskId		= tabfileSubTask:GetCellInt("TaskId", i); -- trích dẫn Tử nhiệm vụ Id
			local szTargetName		= tabfileSubTask:GetCell("TaskType", i);
			local szTaskName		= tabfileSubTask:GetCell("TaskName", i);
			
			local tbParams			= {};
			
			-- hoa vật phẩm nhiệm vụ 
			if szTargetName =="SearchItemWithDesc"then
				local nGenre, nDetail, nParticular, nLevel, nSeries, nNum = 0,0,0,0,0,0;
				local szItemName		="";
				
				nGenre		= tabfileSubTask:GetCellInt("Genre", i);
				nDetail		= tabfileSubTask:GetCellInt("Detail", i);
				nParticular	= tabfileSubTask:GetCellInt("Particular", i);
				nLevel		= tabfileSubTask:GetCellInt("Level", i);
				nSeries		= tabfileSubTask:GetCellInt("Series", i);
				nNum		= tabfileSubTask:GetCellInt("Num", i);
				szItemName	= tabfileSubTask:GetCell("ItemName", i);
	
				tbParams	= {szItemName, 
								nGenre, nDetail, nParticular, nLevel, nSeries,"", 
								nNum, 1};
			end;
			
			if szTargetName =="KillNpc"then
				local nMapId		= tabfileSubTask:GetCellInt("MapId", i);
				local nNpcId		= tabfileSubTask:GetCellInt("NpcId", i);
				local nCount		= tabfileSubTask:GetCellInt("Num", i);
				
				tbParams	= {nNpcId, nMapId, nCount};
			end;
			
			if szTargetName =="SearchItemBySuffix"then
				local szItemName	= tabfileSubTask:GetCell("ItemName", i);
				local szSuffix		= tabfileSubTask:GetCell("Suffix", i);
				local nCount		= tabfileSubTask:GetCellInt("Num", i);
				
				tbParams	= {szItemName, szSuffix, nCount, 1};
			end;
						
			-- phục vụ đoan tài tái nhập Tử nhiệm vụ 
			if (MODULE_GAMESERVER) then
				self:_ReadSubTask(nSubTaskId, szTaskName, szTargetName, tbParams);
				-- self:_Debug("Find item id:", nSubTaskId, szTaskName, unpack(tbParams));
			else
				-- cấp hộ khách đoan dùng hoãn tồn 
				if self.tbSubTaskData[nSubTaskId]==nil then
					self.tbSubTaskData[nSubTaskId] = {};
				end;
				self.tbSubTaskData[nSubTaskId].szTaskName		= szTaskName;
				self.tbSubTaskData[nSubTaskId].szTargetName		= szTargetName;
				self.tbSubTaskData[nSubTaskId].tbParams			= tbParams;
			end;
		end;
	end;
end;

function LinkTask:_ReadTask(nTaskId)
	
	local tbTaskData	= {};
	tbTaskData.nId		= nTaskId;
	tbTaskData.szName	="【"..self:GetMainTaskName(nTaskId).."】";
	
	
	-- chủ nhiệm vụ đích cơ sở đặc tính 
	local tbAttribute	= {};
	tbTaskData.tbAttribute	= tbAttribute;
	
	tbAttribute["Order"]		= Lib:Str2Val("linear");	-- nhiệm vụ nước chảy ：tuyến tính 
	tbAttribute["Repeat"]		= Lib:Str2Val("true");		-- có hay không nhưng trọng tố ：thị 
	tbAttribute["Context"]		= Lib:Str2Val("");			-- nhiệm vụ miêu tả 
	tbAttribute["Share"]		= Lib:Str2Val("false");		-- có hay không nhưng cùng chung 
	tbAttribute["TaskType"]		= Lib:Str2Val("3");			-- nhiệm vụ loại hình ：3、tùy ki nhiệm vụ 
	tbAttribute["AutoTrack"]	= Lib:Str2Val("true");
	
	-- chủ nhiệm vụ hạ đích Tử nhiệm vụ 
	local tbReferIds	= {};
	tbTaskData.tbReferIds	= tbReferIds;

	-- nhiệm vụ đích nội dung biểu 
	local tabfileSubTask	= self.tbfile_SubTask[nTaskId];

	-- ở ở đây tuần hoàn tương Tử nhiệm vụ phóng tới nhiệm vụ table lý khứ 
	
	self:_Debug("Start read subtask in maintask!");
	
	for i=1, tabfileSubTask:GetRow() do

		local nReferId		= tabfileSubTask:GetCellInt("TaskId", i); -- trích dẫn Tử nhiệm vụ Id
		local nReferIdx		= #tbReferIds + 1;	-- trích dẫn Tử nhiệm vụ hướng dẫn tra cứu 
		local tbReferData	= {};
		
		-- bất năng tồn tại đã có đích nhiệm vụ 
		assert(not Task.tbReferDatas[nReferId]);
		
		Task.tbReferDatas[nReferId]	= tbReferData;
		
		tbReferIds[nReferIdx]		= nReferId;
		tbReferData.nReferId		= nReferId;
		tbReferData.nReferIdx		= nReferIdx;
		tbReferData.nTaskId			= nTaskId;
		tbReferData.nSubTaskId		= tabfileSubTask:GetCellInt("TaskId", i);
		tbReferData.szName			= tabfileSubTask:GetCell("TaskName", i);
		tbReferData.tbDesc			="";
		
		tbReferData.tbVisable	= {};	-- có thể thấy điều kiện 
		tbReferData.tbAccept	= {}; 	-- nhưng nhận điều kiện 
		
		tbReferData.nAcceptNpcId	= 0;
		
		tbReferData.bCanGiveUp	= Lib:Str2Val("false");
		
		tbReferData.szGossip ="";			-- lời đồn đãi văn tự 
		tbReferData.nReplyNpcId	= 0;		-- quay về phục NPC
		tbReferData.szReplyDesc	="";		-- quay về phục văn tự 
		tbReferData.nBagSpaceCount = 0;		-- ba lô không gian kiểm tra 
		tbReferData.nLevel = 1;
		tbReferData.szIntrDesc ="";
		tbReferData.nDegree = 100;
		tbReferData.tbAwards	= {
			tbFix	= {},
			tbOpt	= {},
			tbRand	= {},
		};
		
		self:_Debug("Read sub task:"..tbReferData.szName.."Refer Id:"..nReferId.."Refer Idx:"..nReferIdx);
	end;
	
	Task.tbTaskDatas[nTaskId]	= tbTaskData;
	return tbTaskData;
end;

-- độc nhập Tử nhiệm vụ ，Tử nhiệm vụ id，Tử nhiệm vụ loại hình （sát quái 、tầm vật chờ ），nhiệm vụ tiếng Trung danh 
function LinkTask:_ReadSubTask(nSubTaskId, szTaskName, szTargetName, tbParams)

	local tbSubData		= {};
	tbSubData.nId		= nSubTaskId;
	tbSubData.szName	="【"..szTaskName.."】";
	tbSubData.szDesc	="";
	
	tbSubData.tbSteps	= {};
	tbSubData.tbExecute = {};
	tbSubData.tbStartExecute = {};
	tbSubData.tbFailedExecute = {};
	tbSubData.tbFinishExecute = {};
	-- nhiệm vụ đặc tính 
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

	-- bộ sậu 
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
	local tbTarget	= Lib:NewClass(tbTagLib);--cây cứ hàm sổ danh newmục tiêu 
	tbTarget:Init(unpack(tbParams));--tòng Tử nhiệm vụ văn kiện bả mục tiêu sổ cứ độc nhập 
	tbTargets[#tbTargets+1]	= tbTarget;


	-- bộ sậu điều kiện 
	tbStep.tbJudge	= {};
	tbStep.tbExecute = {};

	
	Task.tbSubDatas[nSubTaskId]	= tbSubData;
	return tbSubData;
end;

-- cây cứ một chủ nhiệm vụ Id lai thu hoạch đáng chủ nhiệm vụ đích tiếng Trung danh 
function LinkTask:GetMainTaskName(nTaskId)
	local nRow =	self.tbfile_TaskType:GetDateRow("TypeId", nTaskId);
		if nRow == 0 then
			self:_Debug("GetMainTaskName Error!");
			return"";
		end;
	return self.tbfile_TaskType:GetCell("TypeName", nRow);
end;


function LinkTask:_Debug(...)
--	print ("[LinkTask]:", unpack(arg));
end;
