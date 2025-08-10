-- Trâu lan trại 
-- nộp lên chỉ định sổ mục đích tài liệu khả dĩ khi đến nhất quan 
local tbNpc = Npc:GetClass("qianlai");

tbNpc.tbNeedItemList = 
{
	{20, 1, 485, 1, 2},
}

function tbNpc:OnDialog()
	local nSubWorld,_,_	= him.GetWorldPos();
	local tbInstancing = Task.tbArmyCampInstancingManager:GetInstancing(nSubWorld);
	assert(tbInstancing);
	
	if (tbInstancing.nNiuLanZhaiPass ~= 1) then
		Dialog:Say("tiền lai ：“ta đợi phụng Hồ Gia đại nhân chi mệnh lẫn vào Trâu lan trại dò hỏi tin tức ，may mắn trở thành Khán Thủ cửa lớn đích Tiêu Binh 。ngươi nếu là nghĩa quân huynh đệ ，vậy nã lưỡng khối Trâu lan trại lệnh bài cấp ta ，đây là Hồ đại nhân ra lệnh ，không phải ta cũng không có thể thả ngươi tiến nhập Trâu lan trại 。”",
		{
			{"cấp tiền lai hai cái Trâu lan trại lệnh bài", self.Give, self, tbInstancing, me.nId},
			{"kết thúc đối thoại"}
		})
	end
end

function tbNpc:Give(tbInstancing, nPlayerId)
	Task:OnGift("giao cho tiền lai lưỡng khối Trâu lan trại lệnh bài là được tự do xuất nhập sinh Trâu lan trại 。", self.tbNeedItemList, {self.Pass, self, tbInstancing, nPlayerId}, nil, {self.CheckRepeat, self, tbInstancing});
end

function tbNpc:Send(tbInstancing)
	--me.NewWorld(tbInstancing.nMapId, 1911, 3000);
end


function tbNpc:Pass(tbInstancing, nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);	
	tbInstancing.nNiuLanZhaiPass = 1;
	local pNpc = KNpc.GetById(tbInstancing.nNiuLanZhaiLaoMenId);
	if (pNpc) then
		pNpc.Delete();
	end
	
	if (pPlayer) then
		Task.tbArmyCampInstancingManager:ShowTip(pPlayer,"ta bây giờ khả dĩ yên tâm khứ Trâu lan trại liễu");
	end
end

function tbNpc:CheckRepeat(tbInstancing)
	if (tbInstancing.nNiuLanZhaiPass == 1) then
		return 0;
	end
	
	return 1; 
end
