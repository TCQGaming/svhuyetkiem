-------------------------------------------------------
-- 文件名　：youlongmibao_npc.lua
-- 创建者　：zhangjinpin@kingsoft
-- 创建时间：2009-11-05 23:22:33
-- 文件描述：
-------------------------------------------------------

Require("\\script\\event\\youlongmibao\\youlongmibao_def.lua");

-- 九公主芊芊
local tbNpc = Npc:GetClass("qianqian_dialog");

function tbNpc:OnDialog()
	local nCount = me.GetTask(2106, 14);
	local nNgayMoSV = Youlongmibao:GetServerOpenDay();
		-- local nNgayMoSV = DietQuai:NgayMoMayChu();
	local nMaxDuLong = 15 * nNgayMoSV;
    Dialog:Say(string.format("Máy chũ đã mở "..nNgayMoSV.." ngày\nNgươi đã khiêu chiến "..nCount.."/"..nMaxDuLong.."\n", nMaxDuLong));
	local szMsg = "Mỗi ngày bạn có thể khiêu chiến 15 lượt và nếu không đi sẽ tích lũy\nMáy chũ đã mở "..nNgayMoSV.." ngày\nTổng Số lượt đã khiêu chiến <color=yellow> "..nCount.."/"..nMaxDuLong.."";
	local tbOpt = 
	{
		{"Tiến hành tỷ thí", self.StartGame, self},
		{"Đổi chiến thư", self.Challenge, self},
		{"Đổi danh vọng lệnh", self.Shengwang, self},
		{"Rời khỏi mật thất", self.LeaveHere, self},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:StartGame()
	
	if Youlongmibao.tbPlayerList[me.nId] then	
		Youlongmibao:RecoverAward(me);
	else
		Youlongmibao:Continue(me);
	end
end

function tbNpc:GetAward()
	
	local nGetAward = Youlongmibao:CheckGetAward(me);
	
	if nGetAward == 1 then
		Youlongmibao:RecoverAward(me);
	else
		Dialog:Say("Bạn đã nhận thưởng.");
	end
end

function tbNpc:Challenge()
	Dialog:OpenGift("Hãy đặt Nguyệt Ảnh Thạch vào ", nil, {Youlongmibao.OnChallenge, Youlongmibao});
end

function tbNpc:LeaveHere()
	
	local tbOpt = 
	{
		{"Đồng ý", Youlongmibao.OnPlayerLeave, Youlongmibao},
		{"Kết thúc đối thoại"},
	}	
	Dialog:Say("Bạn có chắc chắn muốn rời khỏi đây ?", tbOpt);
end

function tbNpc:Shengwang()
	local szMsg = "Ta có thể dùng <color=yellow>Du long danh vọng lệnh<color> đổi lấy <color=yellow>“Điểm danh vọng tương ứng”<color> cho anh hùng, anh hùng muốn đổi loại nào ?"
	local tbOpt = 
	{
		{"Du long danh vọng lệnh[Phù]", self.OnShengwang, self, 1},
		{"Du long danh vọng lệnh[Nón]", self.OnShengwang, self, 2},
		{"Du long danh vọng lệnh[Áo]", self.OnShengwang, self, 3},
		{"Du long danh vọng lệnh[Đai lưng]", self.OnShengwang, self, 4},
		{"Du long danh vọng lệnh[Giày]", self.OnShengwang, self, 5},
		{"Không có thứ để đổi"},
	};
	Dialog:Say(szMsg, tbOpt);
end

function tbNpc:OnShengwang(nType)
	Dialog:OpenGift("Hãy đặt danh vọng lệnh vào ", nil, {Youlongmibao.OnShengwang, Youlongmibao, nType});
end
