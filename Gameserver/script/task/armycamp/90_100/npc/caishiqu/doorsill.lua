-- nộp lên chỉ định sổ mục đích tài liệu khả dĩ khi đến nhất quan 
local tbNpc = Npc:GetClass("caishiqudoorsill");

tbNpc.tbNeedItemList = 
{
	{20,1,603,1,20},
}


function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if(tbInstancing.nCaiShiQuColItem == 1) then
		Task.tbArmyCampInstancingManager:ShowTip(me,"Dụng cụ cắt đá đã bị làm hại");
		return;
	end
	
	Dialog:Say("ở cơ khí trung để vào hai mươi mai thủ tự thải nghề đục đá tượng đích “dụng cụ cắt gọt ”nhưng tương kỳ làm hại ，giới thì Thợ Cả liền hội văn thanh ra 。",
		{
			{"đầu nhập đạo cụ", self.Destroy, self, tbInstancing},
			{"kết thúc đối thoại"}
		})	
	
end

function tbNpc:Destroy(tbInstancing)
	if (tbInstancing.nCaiShiQuColItem ~= 1) then
		Task:OnGift("tòng thải nghề đục đá tượng xử đạt được 20mai dụng cụ cắt gọt để vào ，nhưng hủy hoại Dụng cụ cắt đá 。", self.tbNeedItemList, {self.PassCaiKuangQu, self, tbInstancing}, nil, {self.CheckRepeat, self, tbInstancing});
	end
end

function tbNpc:PassCaiKuangQu(tbInstancing)
	TaskAct:Talk("<npc=4002>:“các ngươi này bang đồ ngu ，hựu phạm cái gì chuyện tốt ？xem ta bất hảo hảo giáo huấn các ngươi 。”");
	tbInstancing.nCaiShiQuColItem = 1;
	KNpc.Add2(4002, tbInstancing.nNpcLevel, -1, tbInstancing.nMapId, 1696, 3880);
end


function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nCaiShiQuColItem == 1) then
		return 0;
	end
	
	return 1;
end
