Require("\\script\\task\\armycamp\\campinstancing\\instancingmanager.lua")

Task.tbArmyCampInstancingManager.tbGift = Gift:New();

local tbGift = Task.tbArmyCampInstancingManager.tbGift;
tbGift._szTitle ="";
																							-- bAllowMore biểu thị có được hay không để vào bỉ yêu cầu số lượng đa 
function Task:OnGift(szTitle, tbNeedItemList, tbOkCallBack, tbCancelCallBack, tbRepeatCheck, bAllowMore)
	me.CallClientScript({"Task.tbArmyCampInstancingManager.tbGift:SetContent", szTitle});
	self.tbArmyCampInstancingManager.tbGift:OnGift(szTitle, tbNeedItemList, tbOkCallBack, tbCancelCallBack, tbRepeatCheck, bAllowMore);
end

function tbGift:SetContent(szContent)
	self._szContent = szContent;
end

function tbGift:OnGift(szTitle, tbNeedItemList, tbOkCallBack, tbCancelCallBack, tbRepeatCheck, bAllowMore)
	tbGift._szTitle = szTitle;
	local tbArmyCampGiftData = self:GetGiftData();
	tbArmyCampGiftData.tbNeedItemList = tbNeedItemList;
	tbArmyCampGiftData.tbOkCallBack = tbOkCallBack;
	tbArmyCampGiftData.tbCancelCallBack = tbCancelCallBack;
	tbArmyCampGiftData.tbRepeatCheck = tbRepeatCheck;
	tbArmyCampGiftData.bAllowMore = bAllowMore;
	
	Dialog:Gift("Task.tbArmyCampInstancingManager.tbGift");
end


function tbGift:GetGiftData()
	local tbPlayerData	= me.GetTempTable("Task");
	local tbArmyCampGiftData	= tbPlayerData.tbArmyCampGiftData;
	if (not tbArmyCampGiftData) then
		tbArmyCampGiftData	= {};
		tbPlayerData.tbArmyCampGiftData	= tbArmyCampGiftData;
	end;
	
	return tbArmyCampGiftData;
end


function tbGift:OnOK()
	local tbRepeatCheck = self:GetGiftData().tbRepeatCheck;
	local bAllowMore = self:GetGiftData().bAllowMore;
	if (tbRepeatCheck) then
		local bOK, nRet	= Lib:CallBack(tbRepeatCheck);	-- điều dùng quay về điều 
		if (nRet ~= 1) then
			return;
		end
	end
	
	local tbNeedItemList = self:GetGiftData().tbNeedItemList;
	assert(tbNeedItemList);

	-- bả table lý mỗi cá vật phẩm đích số lượng cùng cấp sinh nguyên thủy đích số lượng 
	for i=1, #tbNeedItemList do
		tbNeedItemList[i].nRemainCount = tbNeedItemList[i][5];
	end

	-- biến lịch phán đoán cấp cùng mặt biên trung mỗi cá ô vuông đích vật phẩm 
	local nFormItemCount = 0;
	local pFind = self:First();
	local bNotTaskItem = false;
	while pFind do
		if (self:DecreaseItemInList(pFind, tbNeedItemList, bAllowMore) == 0) then
			bNotTaskItem = true;
			break;
		end;
		pFind = self:Next();
	end
	if (bNotTaskItem) then
		me.Msg("Vật phẩm không đạt yêu cầu!")
		return;	
	end;
	for _,tbItem in ipairs(tbNeedItemList) do
		if (tbItem.nRemainCount ~= 0) then
			me.Msg("Vật phẩm không đạt yêu cầu!")
			return;
		end
	end
	
	-- bỏ đi vật phẩm 
	local pFind = self:First();
	while pFind do
		me.DelItem(pFind, Player.emKLOSEITEM_TYPE_TASKUSED);
		pFind = self:Next();
	end
	
	local tbCallBack = self:GetGiftData().tbOkCallBack;
	if (tbCallBack) then
		Lib:CallBack(tbCallBack);
	end
	
	me.CallClientScript({"Task.tbArmyCampInstancingManager.tbGift:SetContent",""});
	self:GetGiftData().tbOkCallBack = nil;
end;


-- phán đoán chỉ định vật phẩm là phủ ở cạnh tiêu vật phẩm liệt biểu trung ，nếu ở tắc bả số lượng -1
function tbGift:DecreaseItemInList(pFind, tbNeedItemList, bAllowMore)
	for _,tbItem in ipairs(tbNeedItemList) do
		if (tbItem[1] == pFind.nGenre and 
			tbItem[2] == pFind.nDetail and 
			tbItem[3] == pFind.nParticular and 
			(tbItem[4] == pFind.nLevel or tbItem[4] == -1)) then
				if (tbItem.nRemainCount <pFind.nCount and bAllowMore) then
					tbItem.nRemainCount = 0;
				else
					tbItem.nRemainCount = tbItem.nRemainCount - pFind.nCount;
				end;
				return 1;
		end
	end
	return 0;
end


function tbGift:OnCancel()
	local tbCallBack = self:GetGiftData().tbCancelCallBack;
	if (tbCallBack) then
		Lib:CallBack(tbCallBack);
	end
	
	me.CallClientScript({"Task.tbArmyCampInstancingManager.tbGift:SetContent",""});
	self:GetGiftData().tbCancelCallBack = nil;
end
