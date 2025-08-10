-------Tác giả : TCQGaming
------- 9:32 01/08/2023
if not MODULE_GAMESERVER then
return;
end


function XoaDanhSachNapTuan:XoaDanhSachNapTuanGS()
SpecialEvent.tbDuaNapTuan:ResetFile_duanaptuan()
KDialog.MsgToGlobal("<color=yellow><color=pink>Làm mới Bảng Xếp Hạng Nạp Tuần Thành Công<color>!!<color>");	
end 