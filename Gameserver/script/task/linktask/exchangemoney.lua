-- dùng sinh đoái hoán ngân phiếu 
-- phổ thông đoái hoán ngân phiếu 
Require("\\script\\task\\linktask\\linktask_head.lua");

local tbExchangeNormal = Npc:GetClass("exchangenormal");

function tbExchangeNormal:OnDialog()
	local nNpcId = 0;
	if him.nTemplateId == 2961 then
		nNpcId = him.dwId;
		local nLimit = 0;
		
		if not BaiHuTang.tbGetAwardCount[nNpcId] then 
			BaiHuTang.tbGetAwardCount[nNpcId] = 0;
		end
		
		nLimit = BaiHuTang.tbGetAwardCount[nNpcId];
		
		if nLimit>= 30 then
			Dialog:Say("xin thứ lỗi ，mỗi tràng Bạch Hổ Đường ta chỉ năng đoái hoán <color=yellow>30 thứ <color>ngân phiếu ，ngài vẫn lần sau tái lai ba ！");
			return
		end;
	end;
	
	Dialog:Say("ta ở đây khả dĩ đoái hoán nghĩa quân túi vạn cùng sở khai ra ngân phiếu ，ngươi bây giờ yếu mã thượng đoái hoán mạ ？", 
		{"bây giờ tựu đoái hoán", LinkTask.ShowBillGiftDialog, LinkTask, nNpcId},
		{"không được"})
end


local tbYiJunJunXuGuan = Npc:GetClass("yijunjunxuguan");

-- thân thỉnh đoái hoán ngân phiếu 
function tbYiJunJunXuGuan:ApplyEchangeYinPia(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
	
	--print("Step1：\n", pPlayer.szName.."thân thỉnh đoái hoán ngân phiếu");
	local nCurrTime = GetTime();
	local nToday = tonumber(os.date("%Y%m%d", nCurrTime));
	local nAvailablyData = pPlayer.GetTask(2057, 1);
	
	--print("Step2：","ngày hôm nay ngày thị ===>", nToday);
--	print("trước ký lục đích kích hoạt tính đến ngày ===>", nAvailablyData)
	
	if (nAvailablyData>= nToday) then
		LinkTask:ShowBillGiftDialog();
		return;
	end
	
	local szToday = os.date("%Yniên %mnguyệt %dnhật", nCurrTime);
	local szAvailablyData = os.date("%Yniên %mnguyệt %dnhật", nCurrTime + 3600 * 24 * 31);
	local szMsg ="mỗi lần sung trị 15 nguyên có thể sử một du hí trướng hào hạ đích một vai có 31 ngày ngân phiếu đoái hoán kỳ ，ngài bây giờ khả dĩ khai khải 31 ngày ngân phiếu đoái hoán kỳ ，đoái hoán kỳ tòng <color=yellow>"..szToday.."<color> đáo <color=yellow>"..szAvailablyData.."<color>，ngài xác nhận yếu khai khải mạ ？";
	Dialog:Say(szMsg,
			{"thị", self.ActiveForLinkTask, self, nPlayerId},
			{"phủ"}
		);
end



-- có được hay không kích hoạt lúc này 
function tbYiJunJunXuGuan:ActiveForLinkTask(nPlayerId)
	local pPlayer = KPlayer.GetPlayerObjById(nPlayerId);
	assert(pPlayer);
--	print("step3：\n"..pPlayer.szName.."thân thỉnh kích hoạt lúc này trướng hào")
	local nToday = tonumber(os.date("%Y%m%d", GetTime()));
	local nAvailablyData = pPlayer.GetTask(2057, 1);
	if (nAvailablyData> nToday) then
		pPlayer.Msg("thử trướng hào tháng này không cần kích hoạt rồi");
		return;
	end
	
	local nMoneyPerOne = 15;	-- 15khối kích hoạt một 
	--local nCurActiveNum = pPlayer.GetLinkTaskActiveAccountNum();
--	print("step4：\n"..pPlayer.szName.."lúc này đã kích hoạt sổ con mắt", nCurActiveNum,"\ntháng này trùng giá trị Kim ngạch ："..pPlayer.GetExtMonthPay());
	--assert(nCurActiveNum <12);	-- liuchang tối đa thành lập 12cá vai ，sau khi có san vai công năng khả năng hội có Bug
	
	if (nMoneyPerOne <= pPlayer.GetExtMonthPay()) then
		--pPlayer.AddLinTaskActiveAccount();
		local nAvailablyData = tonumber(os.date("%Y%m%d", GetTime() + 3600 * 24 * 31)); -- tăng 31thiên 
		pPlayer.SetTask(2057, 1, nAvailablyData);
		self:ApplyEchangeYinPia(nPlayerId);
	else
		pPlayer.Msg("ngươi đương nguyệt trùng giá trị không đủ ，mỗi lần sung trị 15 nguyên khả dĩ sử một vai có 31 ngày ngân phiếu đoái hoán kỳ 。");
	end
end
