--============================================================--
--Phát triển bởi Tình Tính Tang Dev
--SĐT: 0906024054
--Facebook: https://www.facebook.com/duongvantinh19843
--============================================================--
local tuongtk = Npc:GetClass("tuongtongkim");--Điêu Tượng CTC
function tuongtk:OnDialog()
local szMsg = "Vô Địch Chiến Trường"
local tbOpt = {
		{"Khạc Nhổ", self.khacnho, self},
		{"Sùng Bái", self.sungbai, self},
		};
		Dialog:Say(szMsg, tbOpt);
end
function tuongtk:khacnho()
KDialog.MsgToGlobal(" "..me.szName.."<color=yellow> Phun một bãi nước miếng lên tượng vinh danh, thất phu bần hàn<color>");
end
function tuongtk:sungbai()
KDialog.MsgToGlobal(" "..me.szName.."<color=yellow> Nói Vị anh hùng này thật khiến ta nể phục<color>");
end