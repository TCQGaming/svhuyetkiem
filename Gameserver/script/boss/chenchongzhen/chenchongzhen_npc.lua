-- 文件名　:chenchongzhen_npc.lua
-- 创建者　:zhangjunjie
-- 创建时间:2012-02-20 15:22:36
-- 描述:npc

local tbEvent = 
{
	Player.ProcessBreakEvent.emEVENT_MOVE,
	Player.ProcessBreakEvent.emEVENT_ATTACK,
	Player.ProcessBreakEvent.emEVENT_SITE,
	Player.ProcessBreakEvent.emEVENT_USEITEM,
	Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
	Player.ProcessBreakEvent.emEVENT_DROPITEM,
	Player.ProcessBreakEvent.emEVENT_SENDMAIL,
	Player.ProcessBreakEvent.emEVENT_TRADE,
	Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
	Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	Player.ProcessBreakEvent.emEVENT_LOGOUT,
	Player.ProcessBreakEvent.emEVENT_DEATH,
	Player.ProcessBreakEvent.emEVENT_ATTACKED,
}


local tbNpc = Npc:GetClass("chenchongzhen_npc")

function tbNpc:OnDialog()
	if KGblTask.SCGetDbTaskInt(DBTASK_CROSSTIMEROOM_CLOSESTATE) ~= 0 then
		Dialog:Say(string.format("Bà già: xin chào ，%s!",me.szName));
		return 0;
	end
	-- if TimeFrame:GetState("OpenBoss120") ~= 1 then
		-- Dialog:Say(string.format("Bà già: xin chào ，%s!",me.szName));
		-- return 0;
	-- else
		-- local nOpenBoss120Week = Lib:GetLocalWeek(TimeFrame:GetTime("OpenBoss120"));
		-- local nNowWeek = Lib:GetLocalWeek(GetTime());
		-- if nNowWeek <= nOpenBoss120Week then
			-- Dialog:Say(string.format("Bà già: xin chào ，%s!",me.szName));
			-- return 0;
		-- end
	-- end
	local szMsg = "    	Cảnh xưa thoáng hiện nôn nao dạ, người ấy đâu đây thấp thỏm lòng, ký ức ùa về trong chót lát, trái tim rao rực phút giây xong.\n   Ngươi hỏi về thương đội của Thương Hội ha? Ta chưa gặp bao giờ. Nhưng đây có phải là Tích Si Tỏa đã lạc mất từ lâu không? Cho ta xem thủ nhé?";
	local tbOpt = {};
	tbOpt[#tbOpt + 1] = {"Bà Già Hãy Mở [Phó Bản Thần Trùng Trấn]",self.Process,self};
	tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
	Dialog:Say(szMsg,tbOpt);
end

function tbNpc:Process()
	local szMsg = "Tôi có thể đưa bạn đến Thần Trùng Trấn!";
	local tbOpt = {};
	if me.nFaction <= 0 then
		Dialog:Say("Muốn vào Thần Trùng Trấn，Hãy gia nhập môn phái trước đã!");
		return 0;
	end
	if me.nLevel < 100 then
		Dialog:Say("Muốn vào Thần Trùng Trấn，Hãy đạt level 100 rồi đến gặp ta!");
		return 0;
	end
	local nTeamId = me.nTeamId;
	if nTeamId <= 0 then
		Dialog:Say("Muốn vào Thần Trùng Trấn, xin tạo tổ đội!");
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByTeamId(me.nTeamId);
	if not pGame then
		tbOpt[#tbOpt + 1] = {"Mở Thần Trùng Trấn",self.ApplyGame,self};
	else
		tbOpt[#tbOpt + 1] = {"Vào Thần Trùng Trấn",self.Transfer,self};
	end
	tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
	Dialog:Say(szMsg,tbOpt);
end


function tbNpc:ApplyGame()
	if me.nFaction <= 0 then
		Dialog:Say("Muốn vào Thần Trùng Trấn，Hãy gia nhập môn phái trước đã!");
		return 0;
	end
	if me.nLevel < 100 then
		Dialog:Say("Muốn vào Thần Trùng Trấn，tu luyện đạt cấp 100 hãy gặp ta!");
		return 0;
	end
	if me.nTeamId <= 0 then
		Dialog:Say("Muốn vào Thần Trùng Trấn, xin lập đội!");
		return 0;
	end
	if me.IsCaptain() ~= 1 then
		Dialog:Say("Muốn vào Thần Trùng Trấn, hãy kêu đội trưởng đến gặp ta!");
		return 0;
	end
	local nRet,szError = ChenChongZhen:CheckCanApply();
	if nRet ~= 1 then
		Dialog:Say(szError);
		return 0;
	end
	local nNearby = 0;
	local tbMemberId,nCount = KTeam.GetTeamMemberList(me.nTeamId);
	local tbPlayerList = KPlayer.GetAroundPlayerList(me.nId, 40);
	for _,tbRound in pairs(tbPlayerList or {}) do
		for _, nMemberId in pairs(tbMemberId) do
			local pMember = KPlayer.GetPlayerObjById(nMemberId);
			if pMember and pMember.szName == tbRound.szName then
				nNearby = nNearby + 1;
			end
		end
	end
	if nNearby ~= nCount then
		Dialog:Say("Thật xin lỗi, Không có đồng đội xung quanh !");
		return 0;
	end
	--todo,检查队友身上次数，和队友身上道具是否符合条件
	local nIsPlayerHasNoItem ,tbNoItemPlayerName = 0 , {};
	local nIsPlayerNoGetLevel,tbNoGetLevelPlayerName = 0,{};
	local nIsPlayerNoFaction,tbNoFactionPlayerName = 0, {};
	local nIsPlayerNotGetTask,tbNoTaskPlayerName = 0,{};
	for _, nMemberId in pairs(tbMemberId) do
		local pMember = KPlayer.GetPlayerObjById(nMemberId);
		if pMember then
			if ChenChongZhen:CheckHaveJoinItem(pMember) ~= 1 then
				nIsPlayerHasNoItem = 1;
				table.insert(tbNoItemPlayerName,pMember.szName);
			end
			if pMember.nLevel < 100 then
				nIsPlayerNoGetLevel = 1;
				table.insert(tbNoGetLevelPlayerName,pMember.szName);
			end
			if pMember.nFaction <= 0 then
				nIsPlayerNoFaction = 1;
				table.insert(tbNoFactionPlayerName,pMember.szName);
			end
			if not Task:GetPlayerTask(pMember).tbTasks[ChenChongZhen.nHaveTaskId] or 
				Task:GetPlayerTask(pMember).tbTasks[ChenChongZhen.nHaveTaskId].nCurStep ~= ChenChongZhen.nTaskNeedStep then
				nIsPlayerNotGetTask = 1;
				table.insert(tbNoTaskPlayerName,pMember.szName);
			end
		end
	end
	if nIsPlayerNoGetLevel == 1 then	--有等级未达到的
		local szMsg = "";
		for _,szName in pairs(tbNoGetLevelPlayerName) do
			szMsg = szMsg .. "<color=yellow>" .. szName .. "<color>Cấp độ dưới 100 . \n";
		end
		Dialog:Say(szMsg);
		return 0;
	end
	if nIsPlayerNoFaction == 1 then		--有未加入门派的
		local szMsg = "";
		for _,szName in pairs(tbNoFactionPlayerName) do
			szMsg = szMsg .. "<color=yellow>" .. szName .. "<color>Chưa gia nhập môn phái. \n";
		end
		Dialog:Say(szMsg);
		return 0;
	end
	-- if nIsPlayerHasNoItem == 1 then
		-- local szMsg = "";
		-- for _,szName in pairs(tbNoItemPlayerName) do
			-- szMsg = szMsg .. "<color=yellow>" .. szName .. "<color>Ngươi không có bản đồ Thần Trùng Trấn. \n";
		-- end
		-- Dialog:Say(szMsg);
		-- return 0;
	-- end
--[[	if nIsPlayerNotGetTask == 1 then
		local szMsg = "";
		for _,szName in pairs(tbNoTaskPlayerName) do
			szMsg = szMsg .. "<color=yellow>" .. szName .. "<color> không nhận được nhiệm vụ Thần Trùng Trấn hoặc nhiệm vụ đã nhận không đạt đến bước chỉ định . \n";
		end
		Dialog:Say(szMsg);
		return 0;
	end]]
	local pGame = ChenChongZhen:GetGameObjByTeamId(me.nTeamId);
	if not pGame then
		local nNum = ChenChongZhen:GetGameNum(GetServerId());
		if nNum >= ChenChongZhen.MAX_GAME then
			Dialog:Say("Địa điểm tổ chức sự kiện hiện tại đã kín chỗ !");
			return 0;
		end
		GCExcute{"ChenChongZhen:ApplyGame_GC",me.nId,GetServerId(),me.nMapId};
		return 1;
	else
		Dialog:Say("Đội trưởng của ngươi đã mở phó bản !");
		return 0;
	end
end

function tbNpc:Transfer()
	ChenChongZhen:JoinGame();
end





--------room1 end的对话npc
local tbRoom1End = Npc:GetClass("chenchongzhen_room1_end");

function tbRoom1End:OnDialog()
	local szMsg = "    Đừng lo lắng, các anh hùng, đoàn lữ hành bạn đang tìm kiếm đã bị bắt bởi một giáo dân bên ngoài thị trấn. Bạn chỉ đang làm theo mệnh lệnh, không phải ý của bạn. . ";
	local tbOpt = {};
	tbOpt[#tbOpt + 1] = {"Nguy hiểm ư，Ngươi coi thường ta quá. Hãy đưa ta qua，Ta sẽ chứng mính cho ngươi thấy.. ",self.EndRoom,self};
	tbOpt[#tbOpt + 1] = {"Có vẻ như nó thật tuyệt vời ... Hãy quên nó đi . "};
	Dialog:Say(szMsg,tbOpt);
end

function tbRoom1End:EndRoom()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	pGame:StartRoom(2);	--开启第二关
end


---room2 开启的对话npc
local tbRoom2Start = Npc:GetClass("chenchongzhen_room2_start");

function tbRoom2Start:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	pGame:ProcessRoom2Start(him.dwId);
end



-----room4
local tbStarManager = Npc:GetClass("chenchongzhen_room4_start");

function tbStarManager:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local szMsg = "";
	local tbOpt = {};
	if pGame:GetRoom4LightIsBegin() ~= 1 then
		szMsg = "    Ai. Các ngươi đợi tin lời gièm pha, lầm sấm ta Đăng Kỳ Trận. Trận này một ngày mở ra rất khó đình chỉ, các vị nếu phải rời khỏi,<color=yellow>Tu châm giá bàn cờ trung của có chút tọa giá cắm nến, phá huỷ mắt trận —— ta của huyễn ảnh.<color>\n\n    Tôi không thể Đóng trận này, chỉ nhắc bạn cần vị trí đèn thắp sáng.<color=yellow>Nếu quên vị trí, và tôi sẽ được nhắc nhở ba lần, nhưng mỗi lần sẽ khởi động lại trận này. Sau ba trận đèn sẽ thay đổi và sau đó bắt đầu.<color>\n\n    Trên đường tự cháy của đui đèn quân làm hại nhân vật, hoàn thỉnh các vị thận trọng, đúng lúc tương chi tổn hại.  ";
		tbOpt[#tbOpt + 1] = {"Mở Đăng Kỳ Trận",self.BeginLight,self,him.dwId};
		tbOpt[#tbOpt + 1] = {"Hum. Tôi sợ tất cả các bạn sắp xếp nó. Hưu nghe hắn đầu độc"};
	else
		szMsg = "    Nếu quên vị trí, và tôi sẽ được nhắc nhở ba lần, nhưng mỗi lần sẽ khởi động lại trận này. Sau khi ba đèn trận cờ sẽ thay đổi và sau đó bắt đầu.\n    Trên đường tự cháy của đui đèn quân làm hại nhân vật, hoàn thỉnh các vị thận trọng, đúng lúc tương chi tổn hại.";
		tbOpt[#tbOpt + 1] = {"Vị trí tháp sang đèn đã sai 3 lần, yêu cầu tiên sinh mở lại Đăng Kỳ Trận",self.ViewLightOrder,self,him.dwId};
		tbOpt[#tbOpt + 1] = {"Xin hỏi tiên sinh, chúng ta còn có mấy lần cơ hội",self.ViewErrorCount,self,him.dwId};
		tbOpt[#tbOpt + 1] = {"Tôi không có gì tốt để yêu cầu"};
	end
	Dialog:Say(szMsg,tbOpt);
end


function tbStarManager:BeginLight(nNpcId,bSure)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	if pGame:GetRoom4LightIsBegin() == 1 then
		return 0;
	end
	if bSure and bSure == 1 then
		pGame:StartRoom4Light();
	else
		local szMsg = "Xác định phải mở ra Đăng Kỳ Trận của tôi?";
		local tbOpt = {};
		tbOpt[#tbOpt + 1] = {"Đồng ý mở",self.BeginLight,self,nNpcId,1};
		tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
		Dialog:Say(szMsg,tbOpt);
	end
end

function tbStarManager:ViewLightOrder(nNpcId,bSure)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	if bSure and bSure == 1 then
		pGame:ProcessRoom4NotifyLight();
	else
		local szMsg = "Nếu quên vị trí, và tôi sẽ được nhắc nhở ba lần, nhưng mỗi lần sẽ khởi động lại trận này!";
		local tbOpt = {};
		tbOpt[#tbOpt + 1] = {"Đồng ý, mở lại Đăng Kỳ Trận.",self.ViewLightOrder,self,nNpcId,1};
		tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
		Dialog:Say(szMsg,tbOpt);
	end
end

function tbStarManager:ViewErrorCount(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local szMsg = string.format("Ai，Đèn cờ trận đã bị làm rối loạn<color=yellow>%s<color>, phải cẩn thận nhiều hơn a!",pGame:GetRoom4ErrorLightCount());
	Dialog:Say(szMsg,{"Ta biết rồi"});
end


--灯座
local tbLight = Npc:GetClass("chenchongzhen_room4_light"); 


function tbLight:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	GeneralProcess:StartProcess("Đang đốt đèn...", 5 * Env.GAME_FPS, {self.FireLight,self,him.dwId},nil,tbEvent);
end

function tbLight:FireLight(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local nIsNeed = pNpc.GetTempTable("ChenChongZhen").nIsNeedFire or 0;
	local _,nX,nY = pNpc.GetWorldPos();
	pGame:ProcessRoom4FireLight(nIsNeed,nNpcId,nX,nY);
end



-----马匹
local tbHorse = Npc:GetClass("chenchongzhen_room7_horse"); 

tbHorse.tbGdpl = {1,12,62,1};	--给的马匹

tbHorse.nHorseItemTime = 5 * 60;	--给的马匹的时间

function tbHorse:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local nRet,szError = self:CheckCanGetHorse();
	if nRet ~= 1 then
		Dialog:Say(szError);
		return 0;
	end
	GeneralProcess:StartProcess("Thuần phục ngựa bên trong...", 5 * Env.GAME_FPS, {self.GetHorse,self,him.dwId},nil,tbEvent);
end

function tbHorse:GetHorse(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local nRet,szError = self:CheckCanGetHorse();
	if nRet ~= 1 then
		Dialog:Say(szError);
		return 0;
	end
	local pItem = me.AddItemEx(self.tbGdpl[1],self.tbGdpl[2],self.tbGdpl[3],self.tbGdpl[4],nil,nil,GetTime() + self.nHorseItemTime);
	if pItem then
		me.AutoEquip(pItem); --自动装备上
		me.RideHorse(1);	--自动上马
	end
	pNpc.Delete();
end

function tbHorse:CheckCanGetHorse()
	if me.CountFreeBagCell() < 1 then
		return 0,"Cần <color=green>1 ô<color> trống hành trang, xin thử lại!";
	end
	local pHorse = me.GetEquip(Item.EQUIPPOS_HORSE);
	local nIsEquipHorse = 0;
	if pHorse and pHorse.SzGDPL() == string.format("%s,%s,%s,%s",self.tbGdpl[1],self.tbGdpl[2],self.tbGdpl[3],self.tbGdpl[4]) then
		nIsEquipHorse = 1;
	end
	local tbFind = me.FindItemInAllPosition(unpack(self.tbGdpl));
	if #tbFind > 0 or nIsEquipHorse == 1 then
		return 0,"Bạn đã Trải qua nhận lấy qua một con ngựa!";
	end
	return 1;
end


---机关
local tbSwitch = Npc:GetClass("chenchongzhen_room7_machine"); 

function tbSwitch:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	if pGame:IsPlayerOpenedRoom7Switch(me.nId) == 1 then
		Dialog:Say("Bạn đã mở qua cơ quan!");
		return 0;
	end
	GeneralProcess:StartProcess("Đang mở cơ quan...", 5 * Env.GAME_FPS, {self.OpenSwitch,self,him.dwId},nil,tbEvent);
end

function tbSwitch:OpenSwitch(nNpcId)
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId) --获得对象
	if not pGame then
		return 0;
	end
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	if pGame:IsPlayerOpenedRoom7Switch(me.nId) == 1 then
		Dialog:Say("Bạn đã mở qua cơ quan!");
		return 0;
	end
	pGame:ProcessRoom7Switch(me.nId);
	pNpc.Delete();
	return 1;
end



---路路通
local tbLulutong = Npc:GetClass("chenchongzhen_llt");

tbLulutong.tbTransferPos =
{
	[1] = {},
	[2] = {"Khu hoàn thành Ải 1",{1618,3191}},
	[3] = {"Khu hoàn thành Ải 2",{56512/32,96832/32}},
	[4] = {"Khu hoàn thành Ải 3",{49408/32,97792/32}},
	[5] = {"Khu hoàn thành Ải 4",{45920/32,102176/32}},
	[6] = {"Khu hoàn thành Ải 5",{58944/32,102080/32}},
	[7] = {},
};

function tbLulutong:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	local nStepId = pGame.nTransferRoomMaxId;
	if not nStepId then
		return 0;
	end
	local tbInfo = {};
	for i = 1 , nStepId do
		if #self.tbTransferPos[i] ~= 0 then
			table.insert(tbInfo,self.tbTransferPos[i]);
		end
	end
	
	if #tbInfo <= 0 then
		local szMsg = "    Xin chào, không quá xa, chạy chính mình, để cho anh ta thực hiện nó.";
		local tbOpt = {};
		tbOpt[#tbOpt + 1] = {"Ta muốn rời khỏi",self.LeaveGame,self};
		tbOpt[#tbOpt + 1] = {"Ta biết rồi"};
		Dialog:Say(szMsg,tbOpt);
		return 0;
	elseif pGame:CheckAllPlayerLock() == 0 and me.GetTask(2191, 5) == 1 then
		Dialog:Say("Xin vui lòng chờ kết thúc ，Hãy sử dụng truyền tống phù!");
		return 0;
	else
		local szMsg = "    Nhật đi trăm dặm nghiêm túc, muốn đi na, ta có thể miễn phí tiễn ngươi một đoạn đường!";
		local tbOpt = {};
		for _,tbPos in ipairs(tbInfo) do 
			tbOpt[#tbOpt + 1] = {"Đưa ta đi <color=yellow>" .. tbPos[1] .. "<color>",self.Transfer,self,tbPos[2]};
		end
		tbOpt[#tbOpt + 1] = {"Ta muốn rời khỏi",self.LeaveGame,self};
		tbOpt[#tbOpt + 1] = {"Ta biết rồi"};
		Dialog:Say(szMsg,tbOpt);
		return 0;
	end
end

function tbLulutong:LeaveGame(bSure)
	if not bSure or bSure ~= 1 then
		local szMsg = "Xác định phải rời khỏi sao??";
		local tbOpt = {};
		tbOpt[#tbOpt + 1] = {"Xác định",self.LeaveGame,self,1};
		tbOpt[#tbOpt + 1] = {"Ta suy nghĩ thêm"};
		Dialog:Say(szMsg,tbOpt);
	else
		local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
		if not pGame then
			return 0;
		end
		pGame:KickPlayer(me);		
	end
end


function tbLulutong:Transfer(tbPos)
	if not tbPos then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	me.NewWorld(me.nMapId,tbPos[1],tbPos[2]);
	if me.nFightState == 0 then
		me.SetFightState(1);
	end
	if pGame:CheckAllPlayerLock() == 1 then
		pGame:UnlockAllPlayer();
	else
		me.SetTask(2191, 5, 0);
	end
	-- me.RemoveSkillState(2566);
	-- me.RemoveSkillState(2587);
	me.RemoveSkillState(1839);
	me.RemoveSkillState(1840);
end



--解debuff 的灯
local tbLightHelper = Npc:GetClass("chenchongzhen_room4_lighthelper");

tbLightHelper.nDebuffId = 2733;

tbLightHelper.tbEvent = 
{
	Player.ProcessBreakEvent.emEVENT_MOVE,
	Player.ProcessBreakEvent.emEVENT_ATTACK,
	Player.ProcessBreakEvent.emEVENT_SITE,
	Player.ProcessBreakEvent.emEVENT_USEITEM,
	Player.ProcessBreakEvent.emEVENT_ARRANGEITEM,
	Player.ProcessBreakEvent.emEVENT_DROPITEM,
	Player.ProcessBreakEvent.emEVENT_SENDMAIL,
	Player.ProcessBreakEvent.emEVENT_TRADE,
	Player.ProcessBreakEvent.emEVENT_CHANGEFIGHTSTATE,
	Player.ProcessBreakEvent.emEVENT_CLIENTCOMMAND,
	Player.ProcessBreakEvent.emEVENT_LOGOUT,
	Player.ProcessBreakEvent.emEVENT_DEATH,
}

function tbLightHelper:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	if me.GetSkillState(self.nDebuffId) <= 0 then
		return 0;
	end
	GeneralProcess:StartProcess("Đang giải độc...", 2 * Env.GAME_FPS, {self.RemoveDebuff,self,him.dwId},nil,self.tbEvent);
end

function tbLightHelper:RemoveDebuff(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	if me.GetSkillState(self.nDebuffId) <= 0 then
		return 0;
	end
	me.RemoveSkillState(self.nDebuffId);
end


------宝箱
local tbBox = Npc:GetClass("chenchongzhen_box");

function tbBox:OnDialog()
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	GeneralProcess:StartProcess("Đang giám định...", 5 * Env.GAME_FPS, {self.DropItem,self,him.dwId},nil,tbEvent);
end

function tbBox:DropItem(nNpcId)
	local pNpc = KNpc.GetById(nNpcId);
	if not pNpc then
		return 0;
	end
	local pGame = ChenChongZhen:GetGameObjByMapId(me.nMapId); --获得对象
	if not pGame then
		return 0;
	end
	local nRoomId = pNpc.GetTempTable("ChenChongZhen").nRoomId or 1;
	local tbInfo = ChenChongZhen.tbDropRateInfo[nRoomId];
	if not tbInfo then
		return 0;
	end
	for _,tb in pairs(tbInfo) do
		local szFile = tb[1];
		local nCount = tb[2];
		if szFile and nCount then
			pNpc.DropRateItem(szFile,nCount,0,-1,me.nId); 
		end
	end
	pNpc.Delete();
end

