local kiemgayne = Item:GetClass("trungrong");

function kiemgayne:OnUse()
	DoScript("\\script\\ChucNang\\bobaothach\\trungrong.lua");

	local nTuanHienTai = tonumber(GetLocalDate("%W"));
	local solanthanhcong = me.GetTask(8047,1)
	local nNgayMoSV = Youlongmibao:GetServerOpenDay();
	local nBatDauTuTuan = 40
	local nTuanHienTai = tonumber(GetLocalDate("%W"));
	local nReal = nTuanHienTai - nBatDauTuTuan;--23-20
	local nNum = nReal * 3;-- số lượng trứng nâng của 1 tuần
local szMsg = "<color=red>Trứng Rồng Đã Luyện <color> "..solanthanhcong.." / 60 lần Tối đa\n"..
			  "<color=pink>Máy chủ Cho Sử Dụng Trứng vào Tuần Thứ 40 / 53 tuần của năm 2024\n<color=blue>Hiện tại là tuần "..nTuanHienTai.." năm 2024. Tổng bạn đã nâng<color> \n"..solanthanhcong.."/ "..nNum.." Lần\n"..
			  "<color=yellow>Mỗi Lần Nâng Thành Công Tốn 50V Đồng, Thất Bại Không Bị Mất Đồng\n"..
			  "<color=blue>Trứng Rồng Nhận Được Khi Tham Gia Tống Kim\n"..
			   "<color=green>Tỷ Lệ Thành Công Là 50%\n"..
			   "<color=yellow>Từ Cấp 50 Trở Đi Nâng Cấp 1 Lần Tốn 50v Đồng Và 3 Trứng Thất Bại Mất 50v Đồng"..
			   
			   "\n KiemHiepTruyenKy.Net"
local tbOpt = {
{"Ta Muốn Luyện Linh Hồn Rồng", self.khamok, self},
{"Kết thúc đối thoại..."},
		};
		Dialog:Say(szMsg,tbOpt);
end

function kiemgayne:khamok()
	local solanthanhcong = me.GetTask(8047,1)
	local nNgayMoSV = Youlongmibao:GetServerOpenDay();
	local nBatDauTuTuan = 40
	local nTuanHienTai = tonumber(GetLocalDate("%W"));
	local nReal = nTuanHienTai - nBatDauTuTuan;--23-20
	local nNum = nReal * 3;-- số lượng trứng nâng của 1 tuần
	local pItem = me.GetEquip(Item.EQUIPPOS_ZHENYUAN_SUB1);
	if pItem == nil then
	me.Msg("Bạn Chưa Có Linh Hồn Rồng");
	return 0;
	end
	if solanthanhcong >= nNum then
	Dialog:Say("Mỗi tuần được phép nâng tối đa 3 lần \n<color=red>Số Lần Nâng hiện tại là : <color><color=yellow>\nTổng bạn đã nâng<color> \n"..solanthanhcong.."/ "..nNum.." Lần");
	return 0;
	end
	if solanthanhcong >= 60 then
	Dialog:Say("Bạn Đã Luyện Max Linh Hồn Rồng");
	return 0;
	end
	local tienxu = me.GetJbCoin();
	if tienxu < 500000  then
	Dialog:Say("Cho Ta Thấy 50 Vạn Đồng Trong Hành Trang, Nếu Luyện Thất Bại Ta Sẽ Trả Lại");
	return
	end
	local trungrong	= {18,1,20400,1,0,0};
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	nRand = MathRandom(1, 10000);
local nLanThanhCong= me.GetTask(8047,1)
if nLanThanhCong > 49 then
	local tbRate = {3000,7000};
	local tbAward = {1,2};
	
	for i = 1, 5 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
	if nIndex == 0 then
		me.Msg("Xin lỗi, bạn không nhận được gì.");
		return 0;
	end;
	--
	local henxui = tbAward[nIndex];
	if henxui == 2 then
	me.AddJbCoin(-500000);
	Task:DelItem(me, trungrong, 3);
	Dialog:Say("<color=green>Thất Bại, Thật đáng tiếc");
	return;
	else
	Item:UpgradeSoulSignetNoItem(pItem,35000,1);
	Item:UpgradeSoulSignetNoItem(pItem,35000,2);
	Item:UpgradeSoulSignetNoItem(pItem,8400,3);
	Item:UpgradeSoulSignetNoItem(pItem,8400,4);
	Item:UpgradeSoulSignetNoItem(pItem,1334,5);
	local solanthanhcong1= me.GetTask(8047,1)
	me.SetTask(8047,1,solanthanhcong1 + 1);
	me.AddJbCoin(-500000);
	Task:DelItem(me, trungrong, 3);
	local solanthanhcong2= me.GetTask(8047,1)
	Dialog:Say("<color=green>Bạn Đã Luyện Thành Công Tầng Thứ "..solanthanhcong2.." /60");
	KDialog.MsgToGlobal("<color=blue> "..me.szName.."Vừa Luyện Rồng Thành Công<color> "..solanthanhcong2.." / 60 Lần");
	end
else 
	
	local tbRate = {3000,7000};
	local tbAward = {1,2};
	
	-- get index
	for i = 1, 5 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
	
	if nIndex == 0 then
		me.Msg("Xin lỗi, bạn không nhận được gì.");
		return 0;
	end;
	--
	local henxui = tbAward[nIndex];
	if henxui == 2 then
	Task:DelItem(me, trungrong, 1);
	Dialog:Say("<color=green>Thất Bại, Thật đáng tiếc");
	return;
	else
	Item:UpgradeSoulSignetNoItem(pItem,35000,1);
	Item:UpgradeSoulSignetNoItem(pItem,35000,2);
	Item:UpgradeSoulSignetNoItem(pItem,8400,3);
	Item:UpgradeSoulSignetNoItem(pItem,8400,4);
	Item:UpgradeSoulSignetNoItem(pItem,1334,5);

	local solanthanhcong1= me.GetTask(8047,1)
	me.SetTask(8047,1,solanthanhcong1 + 1);
	me.AddJbCoin(-500000);
	Task:DelItem(me, trungrong, 1);
	local solanthanhcong2= me.GetTask(8047,1)
	Dialog:Say("<color=green>Bạn Đã Luyện Thành Công Tầng Thứ "..solanthanhcong2.." /60");
	KDialog.MsgToGlobal("<color=blue> "..me.szName.."Vừa Luyện Rồng Thành Công<color> "..solanthanhcong2.." / 60 Lần");
	end
	end
end