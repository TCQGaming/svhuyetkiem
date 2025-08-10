-------------------------------------------------------
-- τݾĻaúqinshihuangling_4.lua
-- Դݨ֟aúzhangjinpin@kingsoft
-- Դݨʱݤú2009-06-09 13:00:49
-- τݾĨ˶ú
-------------------------------------------------------


-------------- ֨ӥ֨֘͘ͼܘַ ---------------
local tbMap = Map:GetClass(1539);

-- ֨ӥΦݒ޸ɫ˂ݾ
function tbMap:OnEnter(szParam)
	
	-- Ɛ׏ʣԠʱݤ
	local nUseTime = me.GetTask(Boss.Qinshihuang.TASK_GROUP_ID, Boss.Qinshihuang.TASK_USE_TIME);
	
	-- ʣԠʱݤΪ0
	if nUseTime>= Boss.Qinshihuang.MAX_DAILY_TIME then
		me.NewWorld(1538, 1762, 3191);		-- ֚ɽӣքвȫȸ
		me.SetFightState(0);
		return;
	end
	
	-- սַѣۤ
	Player:AddProtectedState(me, 6);
	
	-- ݓɫձǰ֘ͼքҭ
	Boss.Qinshihuang:AddPlayer(me.nId, 4);
	
	-- ֘ͼהΦݒӰЬ
	Boss.Qinshihuang:OnMapEffect(me.nId, 4);
	
	self:_SetState(me);
end;

-- ֨ӥΦݒkߪ˂ݾ
function tbMap:OnLeave(szParam)
	
	-- ȥԽ֘ͼЧڻ
	Boss.Qinshihuang:OnMapLeave(me.nId, 4);
			
	-- ӆԶձǰ֘ͼքҭ
	Boss.Qinshihuang:RemovePlayer(me.nId);
	
	self:_ResetState(me);
end;

function tbMap:_SetState(pPlayer)
	
	-- ʨ׃Ϊѯܡģʽ
	pPlayer.nPkModel = Player.emKPK_STATE_TONG;
	
	-- ޻ֹњ̯
	pPlayer.DisabledStall(1);	
	
	-- ޻ֹȐۻսַ״̬
	pPlayer.nForbidChangePK	= 1;
end

function tbMap:_ResetState(pPlayer)
	pPlayer.DisabledStall(0);
	pPlayer.nForbidChangePK	= 0;
end

-------------- ֨ӥ֨͘Trap֣ܘַ ---------------


-- ޸ɫ5ӣ֣1
local tbTrap1 = tbMap:GetTrapClass("trap_f5_1");

function tbTrap1:OnPlayer()
	
	-- ޸ɫ֚ϥӣҪݬӢ
	if Boss.Qinshihuang:CheckOpenQinFive() ~= 1 then 
		Dialog:SendBlackBoardMsg(me,"Cổng dịch chuyển nhanh đến tầng 5 đã xuất");
		return;
	end
	
	me.NewWorld(1540, 1540, 3241);
	me.SetFightState(1);
end;


-- ޸ɫ5ӣ֣2
local tbTrap2 = tbMap:GetTrapClass("trap_f5_2");

function tbTrap2:OnPlayer()
	
	-- ޸ɫ֚ϥӣҪݬӢ
	if Boss.Qinshihuang:CheckOpenQinFive() ~= 1 then 
		Dialog:SendBlackBoardMsg(me,"Cổng dịch chuyển nhanh đến tầng 5 đã xuất hiện");
		return;
	end
	
	me.NewWorld(1540, 1572, 3194);
	me.SetFightState(1);
end;

-- ׵ܘ3ӣ֣1
local tbTrap3 = tbMap:GetTrapClass("trap_f3_1");

function tbTrap3:OnPlayer()
	me.NewWorld(1538, 1713, 3477);
	me.SetFightState(1);
end;


-- ׵ܘ3ӣ֣2
local tbTrap4 = tbMap:GetTrapClass("trap_f3_2");

function tbTrap4:OnPlayer()
	me.NewWorld(1538, 1759, 3432);
	me.SetFightState(1);
end;
