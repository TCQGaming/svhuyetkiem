--============================================================--
--Phát triển bởi Tình Tính Tang Dev
--SĐT: 0906024054
--Facebook: https://www.facebook.com/duongvantinh19843
--============================================================--
local taton = Npc:GetClass("taton");--Điêu Tượng CTC
function taton:OnDialog()
local szMsg = "Không biết các hạ đến đây cần gì chỉ giáo?"
local tbOpt = {
		{"Ta muốn lĩnh ngộ võ công thượng thừa", self.hocskill, self},
		};
		Dialog:Say(szMsg, tbOpt);
end

function taton:hocskill()
local msg = "<color=cyan> BỘ KỸ NĂNG NÀY CẦN TỐN 50V ĐỒNG + 1000 DANH BỔ LỆNH + 2HT 11 NGƯỜI ĐỒNG Ý CHỨ?<color>"
	local tbOpt = {
		{"Ta đã sẳn sàng", self.dongy, self},
	}
	Dialog:Say(msg,tbOpt)
end
function taton:dongy()
if me.GetTask(4029,1) == 1 then
		Dialog:Say("Bạn Đã Lĩnh Ngộ Tuyệt Học Này Rồi");
		return;
end
local tbGiftId1	= {18,1,190,1,0,0}; -- danh bo lenh
local nCount1 = me.GetItemCountInBags(18,1,190,1); -- danh bo lenh
local tbGiftId2	= {18,1,114,11,0,0}; -- huyen tinh
local nCount2 = me.GetItemCountInBags(18,1,114,11); -- huyen tinh
local tienxu = me.GetJbCoin();
if nCount1 < 1000 or tienxu < 500000 or nCount2 < 2 then
Dialog:Say("Không đủ nguyên liệu Bạn chỉ có "..nCount1.." cái. "..tienxu.." đồng." ..nCount2.." Huyền Tinh.")
return;
end
	me.AddJbCoin(-500000);
	Task:DelItem(me, tbGiftId1, 1000);
	Task:DelItem(me, tbGiftId2, 2);
	me.AddFightSkill(561,1);
	me.SetTask(4029,1,1);
	KDialog.MsgToGlobal("\<color=green> "..me.szName.." LĨNH NGỘ THÀNH CÔNG TUYỆT HỌC CỬU DƯƠNG THẦN CÔNG TRĂM NĂM KHÔNG AI BẰNG, NGÀN NĂM KHÔNG AI SÁNH KỊP ");
end