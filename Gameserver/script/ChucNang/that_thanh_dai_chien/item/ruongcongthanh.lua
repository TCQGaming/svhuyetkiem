-----Dev : TCQGaming
-----Time : 04/02/2023 2:38 PM
local KnbBiz = Item:GetClass("leruong_congthanh_7ctc");

function KnbBiz:OnUse()	
DoScript("\\script\\ChucNang\\that_thanh_dai_chien\\item\\ruongcongthanh.lua");
local ngaunhien = MathRandom(1,1300)
local ngaunhientiendulong = MathRandom(30,200)
local ngaunhiensachchannguyen = MathRandom(1,50)
local nNgauNhienLBC3 = MathRandom(1,5)
local nNgauNhienLBHTVK = MathRandom(1,3)
local nSoLanMoRuong = KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_RuongCongThanh)
if nSoLanMoRuong < 30 then 
if ngaunhien < 100 then
me.AddStackItem(18,1,1,5,nil,1)
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>1 viên huyền tinh 5<color> không khóa<color>");
elseif ngaunhien < 200 then
me.AddStackItem(18,1,1,7,nil,1)
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>1 viên huyền tinh 7<color> không khóa<color>");
elseif ngaunhien < 300 then
me.AddStackItem(18,1,1,6,nil,1)
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>1 viên huyền tinh 6<color> không khóa<color>");
elseif ngaunhien < 400 then
me.AddStackItem(18, 1, 553, 1, nil, ngaunhientiendulong); -- tiendulong
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..ngaunhientiendulong.." <color=gold>Tiền Du Long<color><color>");
elseif ngaunhien < 500 then
me.AddStackItem(18,1,402,1,nil,ngaunhiensachchannguyen)--20 Sách kinh nghiệm chân nguyên
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..ngaunhiensachchannguyen.." <color=gold>Sách Kinh Nghiệm Chân Nguyên<color>");
elseif ngaunhien < 600 then
me.AddStackItem(18,1,1,5,nil,1)
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>1 viên huyền tinh 5<color> không khóa<color>");
elseif ngaunhien < 700 then
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>30 Rương Trang Bị Đồng Hành<color> không khóa<color>");
	me.AddStackItem(18,1,1875,1,nil,30)---Rương Trang Bị Đồng Hành
	elseif ngaunhien < 800 then
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>10 Kim Nguyên Bảo<color> không khóa<color>");
	me.AddStackItem(18,1,1338,2,nil,10)---Rương Trang Bị Đồng Hành
	elseif ngaunhien < 900 then
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>10 Thất Sắc Hồn<color> không khóa<color>");
	me.AddStackItem(18,1,2026,1,nil,10)---Thất Sắc Hồn
	elseif ngaunhien < 1000 then
	me.AddStackItem(18,1,2025,12,nil,nNgauNhienLBC3)--LB Đồ Hải Tặc 3
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..nNgauNhienLBC3.." <color=gold>Lệnh bài đồ hải tặc cấp 3<color>");
	elseif ngaunhien < 1100 then
	me.AddStackItem(18,1,2025,11,nil,nNgauNhienLBC3)--LB Đồ Hải Tặc 3
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..nNgauNhienLBC3.." <color=gold>Lệnh bài đồ hải tặc cấp 2<color>");
	elseif ngaunhien < 1200 then
	me.AddStackItem(18,1,2025,10,nil,nNgauNhienLBC3)--LB Đồ Hải Tặc 3
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..nNgauNhienLBC3.." <color=gold>Lệnh bài đồ hải tặc cấp 1<color>");
elseif ngaunhien < 1300 then
me.AddStackItem(18,1,2033,13,nil,nNgauNhienLBHTVK)--LB Đồ Hải Tặc cấp 2
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận "..nNgauNhienLBHTVK.." <color=gold>Lệnh bài Vũ Khí Hải Tặc<color> không khóa");
-- KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_RuongCongThanh, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_RuongCongThanh)+1);
end
	KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_RuongCongThanh, KGblTask.SCGetDbTaskInt(DBTASD_UPDATE_RuongCongThanh)+1);
 else 
	me.AddStackItem(18,1,1,8,nil,1)
	KDialog.MsgToGlobal("<color=yellow>Người chơi <color=cyan>[ "..me.szName.." ]<color> mở rương thất thành nhận <color=gold>1 viên huyền tinh 8<color> không khóa<color>");
	KGblTask.SCSetDbTaskInt(DBTASD_UPDATE_RuongCongThanh, 0);
end 
return 1;-----Xóa vật phẩm sau khi sử dụng
end

