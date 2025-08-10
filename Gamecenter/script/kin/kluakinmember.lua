-------------------------------------------------------------------
--File: kluakinmember.lua
--Author: lbh
--Date: 2007-7-3 16:20
--Describe: KLuaKinMember扩展脚本指令
-------------------------------------------------------------------
if not _KLuaKinMember then --调试需要
	_KLuaKinMember = {}
	print(GetLocalDate("%Y\\%m\\%d  %H:%M:%S").." build ok ..")
end

local self	--作为第一个Up Value

--用于生成家族任务变量对应的指令
local function _GEN_TASK_FUN(szDesc, nTaskId)
	local funGet = 
		function ()
			return self.GetTask(nTaskId)
		end
	local funSet = 
		function (nValue)
			return self.SetTask(nTaskId, nValue)
		end
	local funAdd = 
		function (nValue)
			return self.AddTask(nTaskId, nValue)
		end
	rawset(_KLuaKinMember, "Get"..szDesc, funGet)
	rawset(_KLuaKinMember, "Set"..szDesc, funSet)
	rawset(_KLuaKinMember, "Add"..szDesc, funAdd)
end

--单Bit指令
local function _GEN_TASK_FUN_FLAG(szDesc, nTaskId, nPos)
	local funGet = 
		function ()
			return self.GetTaskFlag(nTaskId, nPos)
		end
	local funSet = 
		function (nValue)
			return self.SetTaskFlag(nTaskId, nPos, nValue)
		end
	rawset(_KLuaKinMember, "Get"..szDesc, funGet)
	rawset(_KLuaKinMember, "Set"..szDesc, funSet)
end

local function _GEN_TMP_TASK_FUN(szDesc, nTaskId)
	local funGet = 
		function ()
			return self.GetTmpTask(nTaskId)
		end
	local funSet = 
		function (nValue)
			return self.SetTmpTask(nTaskId, nValue)
		end
	local funAdd = 
		function (nValue)
			return self.AddTmpTask(nTaskId, nValue)
		end
	rawset(_KLuaKinMember, "Get"..szDesc, funGet)
	rawset(_KLuaKinMember, "Set"..szDesc, funSet)
	rawset(_KLuaKinMember, "Add"..szDesc, funAdd)
end

_GEN_TASK_FUN("JoinTime", 1)				-- tham gia thời gian
_GEN_TASK_FUN("Figure", 2)					-- Chức vụ
--_GEN_TASK_FUN("Repute", 3)					--Giang hồ uy danh
_GEN_TASK_FUN("Ballot", 4)					-- phiếu bầu tộc trưởng
_GEN_TASK_FUN("VoteState", 5)				-- dù đã bình chọn
_GEN_TASK_FUN("VoteJourNum", 6)				-- Số phiếu bầu
_GEN_TASK_FUN("TongFlag", 7)				-- một số cờ của bang hội
_GEN_TASK_FUN("EnvoyFigure", 8)				-- nhiệm vụ phái viên
_GEN_TASK_FUN("LeaveInitTime", 9)			-- Thời điểm bắt đầu rời khỏi ứng dụng gia đình
_GEN_TASK_FUN("QuitVoteState", 10)			-- Cho dù bạn đã bỏ phiếu để rời khỏi bang hội, kết quả bỏ phiếu: 0 có thể không bỏ phiếu; 1 đồng ý; 2 từ chối
_GEN_TASK_FUN("WageFigure", 11) 			-- Biên bản công việc thanh toán lương tuần trước.
_GEN_TASK_FUN("WageValue", 12) 				-- Số tiền lương nhận được tuần trước.
_GEN_TASK_FUN("RetireTime",13)				-- Xin nghỉ hưu
_GEN_TASK_FUN("KinOffer", 14)				-- -- đóng góp bang hội của người chơi
--_GEN_TASK_FUN("WeeklyTongOffer", 15)		-- đóng góp bang hội tuần này không hợp lệ
_GEN_TASK_FUN("WeeklyKinOffer", 16)			-- Đóng góp của gia đình tuần này
_GEN_TASK_FUN("LastWeekKinOffer", 17)		-- đóng góp của gia đình tuần trước
_GEN_TASK_FUN("PersonalStock", 18)			-- số lượng cổ phiếu cá nhân
_GEN_TASK_FUN("StockFigure", 19)			--  vị thế vốn chủ sở hữu
_GEN_TASK_FUN("TongVoteState", 5)			-- liệu cuộc bầu chọn người đứng đầu có bỏ phiếu hay không
_GEN_TASK_FUN("GreatMemberVote", 20)		-- Thành viên bình chọn tuyệt vời
_GEN_TASK_FUN("MemberVoteNo", 21)			-- số sê-ri phiếu bầu thành viên xuất sắc
_GEN_TASK_FUN("ReceiveGreatBonusNo", 22)	-- số thứ tự của các thành viên xuất sắc tranh giải



--定义帮会变量标志
_GEN_TASK_FUN_FLAG("BitExcellent", 7, 1)	--cho dù đó là ưu tú
_GEN_TASK_FUN_FLAG("Can2Regular", 7, 2)		--  Có thể chuyển thành tích cực không

if not MODULE_GAMECLIENT then
	--临时任务变量定义
	_GEN_TMP_TASK_FUN("PlayerId", 1)		--Player Id
	_GEN_TMP_TASK_FUN("KickBallot", 2)	--Số lượng phản hồi để sa thải thành viên
else
	_GEN_TASK_FUN("PlayerId", 1001)
	_GEN_TASK_FUN("Online", 1002)	
	_GEN_TASK_FUN("Level", 1003)
	_GEN_TASK_FUN("Sex", 1004)
	_GEN_TASK_FUN("Faction", 1005)
	_GEN_TASK_FUN("HonorRank", 1006)
	_GEN_TASK_FUN("Honor", 1007)
	_GEN_TASK_FUN("ClientRepute", 1008)
	_GEN_TASK_FUN("Platform_MonthScore", 1009)
	_GEN_TASK_FUN("Platform_TotalScore", 1010)
end
