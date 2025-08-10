local tbNpc = Npc:GetClass("tulengzhu_switch")

tbNpc.tbCommonRoomMsg =
{
--房间号 {x,y} 
	[4]  = {"Dùng cách của người khác để đối xử với cơ thể của người khác. Muốn mở đường tiến lên thì phải đỗ đạt, ai muốn đỗ thì đặt tay lên mặt bia. "," đặt tay lên bia đá"},
	[6]  = {"Sự vội vàng làm cho lãng phí. Muốn mở đường tiến lên thì phải đỗ đạt, ai muốn đỗ thì đặt tay lên mặt bia. "," đặt tay lên bia đá"},
	[23] = {"Nguy hiểm chưa từng thấy. Muốn mở đường tiến lên thì phải đỗ đạt, ai muốn đỗ thì đặt tay lên mặt bia. "," đặt tay lên bia đá"},
	[24] = {"Bạn sẽ có thể gặp bóng tối của bạn. Muốn mở đường tiến lên thì phải đỗ đạt, ai muốn đỗ thì đặt tay lên mặt bia. "," đặt tay lên bia đá"},
	[25] = {"Đi như gió, chạy như sấm. Muốn mở đường tiến lên thì phải đỗ đạt, ai muốn đỗ thì đặt tay lên mặt bia. "," đặt tay lên bia đá"},
}
tbNpc.tbCoreRoomMsg =
{
	szCoreRoom = {"Chìa khóa của con đường phía trước nằm ở %s. Ai muốn vượt qua thì hãy ấn tay lên bề mặt của tấm bia.","Hãy ấn tay vào tấm bia", "Tấm bia được khắc rõ ràng: %s, cơ chế đã được nhấn."},
	szRunRoom = {"%s, những người muốn vượt qua hãy đặt tay lên bề mặt của tấm bia. ","Ấn tay lên bia đá", "Con số được khắc rõ ràng trên bia đá: %s, cơ chế đã được ấn vào. "},
}

function tbNpc:OnDialog()
	self:OnSwitch(him.dwId, 0);
end

function tbNpc:OnSwitch(nNpcId, nSure)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0
	end	
	local tbTmp = pNpc.GetTempTable("KinGame");
	local pRoom = tbTmp.tbLockTable.tbRoom;
	local nRoomId = pRoom.nRoomId;
	if nRoomId >= 7 and nRoomId <= 22 then
		--密码间
		
		local tbLock = pRoom:GetNextLock();
		local nNextRoomId = tbLock[1].tbLock.nRoomId
		if nNextRoomId > 22 then
			if tbTmp.tbLockTable:IsLock() == 1 then
				Dialog:SendBlackBoardMsg(me, "Tấm bia đá này đã được mở qua.");
				return 0;
			end
			Dialog:Say("Nghe một tiếng \"rắc\" vang lên.");
			KinGame:NpcUnLockMulti(pNpc);
			return 0;
		end

		
		local szRoomName = KinGame.ROOM_NAME[nNextRoomId];		
		local szParam = "szCoreRoom";
		if nRoomId >=7 and nRoomId <= 14 then
			--天地日月，青龙，白虎，朱雀，玄武
			szParam = "szRunRoom"
		end
		if tbTmp.tbLockTable:IsLock() == 1 then
			Dialog:SendBlackBoardMsg(me, string.format(self.tbCoreRoomMsg[szParam][3],szRoomName));
			
			return 0;
		end
		if nSure == 1 then
			Dialog:SendBlackBoardMsg(me, string.format("Chạm tay vào cơ quan, %s mở ra.",szRoomName));
			KinGame:NpcUnLockMulti(pNpc);
			return 0;
		end		
		
		local szMsg = string.format(self.tbCoreRoomMsg[szParam][1],szRoomName);
		local tbOpt =
		{
			{self.tbCoreRoomMsg[szParam][2], self.OnSwitch, self, him.dwId, 1},
			{"Kết thúc đối thoại"}
		}
		Dialog:Say(szMsg, tbOpt);		
	else
		if tbTmp.tbLockTable:IsLock() == 1 then
			Dialog:SendBlackBoardMsg(me, "Tấm bia đá này đã được mở qua.");
			return 0;
		end
		if self.tbCommonRoomMsg[nRoomId] == nil then
			return 0;
		end
		if nSure == 1 then
			KinGame:NpcUnLockMulti(pNpc);
			Dialog:SendBlackBoardMsg(me,"Bạn chạm vào cơ quan, xuất hiện một số Thủ Vệ!");
			return 0;
		end
		local tbOpt =
		{
			{self.tbCommonRoomMsg[nRoomId][2], self.OnSwitch, self, him.dwId, 1},
			{"Kết thúc đối thoại"}
		}
		Dialog:Say(self.tbCommonRoomMsg[nRoomId][1], tbOpt);
	end
end
