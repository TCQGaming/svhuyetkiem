local tbTraTieu	= Npc:GetClass("npctratieu");

function tbTraTieu:OnDialog()
-- tbTraTieu:nStart()
	local tbOpt = {

			{"<color=cyan>Nhận thưởng", SpecialEvent.VanTieu.PhanThuong,SpecialEvent.VanTieu},
			{"Để khi khác ta tới"},
		};
	Dialog:Say("Chào mừng bạn đến với Bích Huyết Kiếm", tbOpt);
end

function tbTraTieu:nStart()
		-- me.Msg("<color=yellow>Hủy trạng thái vận tiêu thành công!!")
		me.SetTask(9171,10,0)
end