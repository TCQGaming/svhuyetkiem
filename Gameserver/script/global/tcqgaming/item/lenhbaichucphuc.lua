
local tbItem 	= Item:GetClass("praylingpai");
tbItem.tbLevelItem = 
{
	[1] = {30, 5},
	[2] = {200,10},
	[3] = {640,20},
	[4] = {30, 5},
	[5] = {200,10},
	[6] = {640,20},
}

function tbItem:OnUse()
	local pPlayer	= me;
	local nNowTime	= GetTime();
	local nType		= it.nLevel;
	local nRepute	= self.tbLevelItem[nType][1];
	local nCount	= self.tbLevelItem[nType][2];
	-- local ngaybatdau = Youlongmibao:GetServerOpenDay();
	local ngaybatdau = DietQuai:NgayMoMayChu();
	local solannuot = pPlayer.GetTask(8080,1);
	local nSoLanConLai = ngaybatdau - solannuot
	if nType >= 2 then
		if me.IsAccountLock() ~= 0 then
			me.Msg("Tài khoản của ngươi đang khóa, không thể sử dụng vật phẩm này.");
			return 0;
		end
	end
	if solannuot > ngaybatdau then
	-- pPlayer.Msg("bản đã dùng đủ số lượng cho phép"..ngaybatdau.."lần");
		pPlayer.Msg("Số lần nuốt được \n lệnh bài chúc phúc còn lại là<color=yellow> :"..nSoLanConLai.." lần ");
	return 0;
	end
	
	local nFlag = Player:AddRepute(pPlayer, 5,4,nRepute);
	me.SetTask(8080,1,solannuot + 1);
	
	pPlayer.Msg("Số lần nuốt được \nlệnh bài chúc phúc còn lại là :<color=yellow> "..nSoLanConLai.." lần ");
	if (1 == nFlag) then
		pPlayer.Msg("Bạn đã đạt danh vọng chúc phúc cao nhất, sẽ không thể nhận thêm danh vọng, nhưng có thể nhận cơ hội chúc phúc tương ứng!");
	end

	Task.tbPlayerPray:AddCountByLingPai(pPlayer, nCount);
	Task.tbPlayerPray:SetLingPaiUsedTime(pPlayer, nNowTime);
	
	pPlayer.Msg(string.format("Nhận được %d lần chúc phúc!", nCount));
	
	return 1;
end
