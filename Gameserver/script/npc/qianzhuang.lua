
local tbNpc = Npc:GetClass("qianzhuang_macdinh");


function tbNpc:OnDialog()
	if me.IsAccountLock() ~= 0 then
		Dialog:Say("Tài khoản của bạn bị khóa, không thể thực hiện thao tác này!");
		return;
	end
	local tbOpt = {
		--{"Mua đại Kim Nguyên Bảo (100v Đồng)", self.MuaKNB, self, 1},
		--{"Mua tiểu Kim Nguyên Bảo (10v Đồng)", self.MuaKNB, self, 2},
		{"Vào cửa tiệm", self.OnOpenShop, self, me},
		{"Đổi ngũ hành hồn thạch", Dialog.Gift, Dialog, "Item.ChangeGift"},
		{"Đổi phi phong", self.SaleMantle, self},
		{"<color=yellow>Cửa Tiệm Phi Phong (Kim Cương)<color>", self.ShopPpKc, self},																				 
		{"Kết thúc đối thoại"},
	};
	if IVER_g_nSdoVersion == 0 then
		table.insert(tbOpt, 1, {"Tiền trang", self.OpenBank, self});
	end
	Dialog:Say(me.szName.."，ngươi muốn mua gì nào ?",tbOpt);
end
function tbNpc:ShopPpKc()
	local tbOpt = {
			{"<color=yellow>Tiếp tục thao tác<color>", self.Dongmuaf, self},
			{"Kết thúc đối thoại"},
		};
	Dialog:Say(me.szName.."，Khi bạn đạt mốc tích lũy mốc 10m, sẽ được phép thay đổi hình ảnh phi phong và mua miễn phí không mất NHHT tại đây",tbOpt);
end

function tbNpc:Dongmuaf()
	local nSeries = me.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Bạn hãy gia nhập phái");
		return;
	end

	local nSoDuThe = me.GetTask(3026,2)
	if nSoDuThe < 13000 then
	Dialog:Say("Cần Tích Lũy Mốc 10m");
	return 0;
	end

	local nNguHanh = me.nSeries;
	local nCapPp = PlayerHonor:GetHonorLevel(me, PlayerHonor.HONOR_CLASS_MONEY);
	local tbInfo	= GetPlayerInfoForLadderGC(me.szName);
	local szIdItem = 0;
	if tbInfo.nSex == 0 then
		if nNguHanh == 1 then
			szIdItem = 11;
		elseif nNguHanh == 2 then
			szIdItem = 13;
		elseif nNguHanh == 3 then
			szIdItem = 15;
		elseif nNguHanh == 4 then
			szIdItem = 17;
		elseif nNguHanh == 5 then
			szIdItem = 19;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	else
		if nNguHanh == 1 then
			szIdItem = 12;
		elseif nNguHanh == 2 then
			szIdItem = 14;
		elseif nNguHanh == 3 then
			szIdItem = 16;
		elseif nNguHanh == 4 then
			szIdItem = 18;
		elseif nNguHanh == 5 then
			szIdItem = 20;
		end
		local pItem = me.AddItem(1,17,szIdItem,nCapPp);
		if pItem then
			me.SetItemTimeout(pItem, 30*24*60,0);
		end
	end
end						 

function tbNpc:SaleMantle()
	Shop.MantleGift:OnOpen();
end


function tbNpc:OpenBank()
	if (Bank.nBankState == 0) then
		me.Msg("Không thể mở tiền trang.");
		return ;
	end
	me.CallClientScript({"UiManager:OpenWindow", "UI_BANK"});
end

function tbNpc:OnOpenShop(pPlayer)
	local nSeries = pPlayer.nSeries;
	if (nSeries == 0) then
		Dialog:Say("Vui lòng gia nhập môn phái trước khi vào mua đồ");
		return;
	end
	
	if (1 == nSeries) then
		pPlayer.OpenShop(140, 3);
	elseif (2 == nSeries) then
		pPlayer.OpenShop(141, 3);
	elseif (3 == nSeries) then
		pPlayer.OpenShop(142, 3);
	elseif (4 == nSeries) then
		pPlayer.OpenShop(143, 3);
	elseif (5 == nSeries) then
		pPlayer.OpenShop(144, 3);
	else
		Dbg:WriteLogEx(Dbg.LOG_INFO, "Npc qianzhuang", pPlayer.szName, "There is no Series", nSeries);
	end
end
