-- 文件名　：qiancengtower_def.lua
-- 创建者　：zhouchenfei
-- 创建时间：2013-05-27 19:08:55


QianCengTower.tbPlayerMapInfo	= {};
QianCengTower.tbMissionList		= {};
QianCengTower.tbQianCengLadder	= {};

QianCengTower.TASK_GROUP_ID = 2239;
QianCengTower.TASK_TODAY_JOIN_COUNT	= 1; 	-- Số lần bạn vẫn có thể tham gia ngày hôm nay
QianCengTower.TASK_OPEN_MAPID		= 2;	-- id mở bản đồ
QianCengTower.TASK_OPEN_TIME		= 3;	-- thời gian mở bản đồ
QianCengTower.TASK_ROOM_NUM_SAVE	= 4;	-- lưu tiến trình sao chép
QianCengTower.TASK_ROOM_MISSION_ID	= 5;	-- 副本id
QianCengTower.TASK_LEAVE_MAPID		= 6;	-- mapid
QianCengTower.TASK_LEAVE_MAPX		= 7;	-- mapx
QianCengTower.TASK_LEAVE_MAPY		= 8;	-- mapy
QianCengTower.TASK_UPDATE_JOIN_COUNT_TIME = 9;	-- Làm mới thời gian rảnh rỗi của người chơi
QianCengTower.TASK_OPEN_ROOM_NUM 	= 10;	-- Kích hoạt các lớp sao chép
QianCengTower.TASK_PLAYER_REVIVE_COUNT = 11; -- Thời gian phục sinh của người chơi
QianCengTower.TASK_FAN_PAI_COUNT	= 12; -- Rút thêm người chơi
QianCengTower.TASK_BUY_FAN_PAI_TYPE	= 13; -- 金币购买翻牌次数记录
QianCengTower.TASK_BUY_FAN_PAI_RET	= 14; -- 翻牌结果
QianCengTower.TASK_FANPAI_LEAVE_NUM	= 15; -- 遗留未翻牌次数
QianCengTower.TASK_FINISH_AWARD_START_ROOM = 16; -- 金币购买翻牌次数记录
QianCengTower.TASK_FINISH_AWARD		= 17; -- 金币购买翻牌次数记录
QianCengTower.TASK_LAST_FANPAI_COUNT= 18; -- 在副本中未翻牌次数
QianCengTower.TASK_YUEJIA_BUFF		= 19; -- 岳家枪法buff



QianCengTower.TASK_Id_Day		= 20; -- task day
QianCengTower.TASK_Id_NT		= 21; -- task nhan thuong

QianCengTower.FREE_DALIY_COUNT		= 1;
QianCengTower.MAX_FREE_COUNT		= 14;

QianCengTower.NPC_ID_YAOSHANG		= 2647; -- mac dinh 11585 chu tiem thuoc
QianCengTower.NPC_ID_YELIANDASHI	= 3574;
QianCengTower.DEF_TIME_SIGN_UP		= 0.5 * 60;

QianCengTower.DEF_BEFORE_99_MAX_ROOM = 60;
QianCengTower.DEF_AFTER_99_MAX_ROOM = 160;

QianCengTower.DEF_MAX_FANPAI_COUNT	= 3;
QianCengTower.DEF_MAX_FANPAI_EX_COUNT	= 14;


QianCengTower.tbSignUpEventList = {
		{"SignUp", 		Env.GAME_FPS * QianCengTower.DEF_TIME_SIGN_UP, "OnSignUp"	},	-- 报名准备时间
	};

-- 报名
QianCengTower.MIN_JOIN_LEVEL		= 69;
QianCengTower.DEF_SQU_SIGN_UP_DIS	= 400;
QianCengTower.DEF_SIGN_MAX_TEAM_NUM	= 3;

QianCengTower.MAX_OPEN_MISSION_COUNT = 20;
QianCengTower.MAX_OPEN_MISSION_NEWPLAYER_COUNT = 200;

QianCengTower.DEF_ROOM_TYPE_NPC_KILL	= 1;
QianCengTower.DEF_ROOM_TYPE_BOSS_KILL	= 2;
QianCengTower.DEF_ROOM_TYPE_CATCH_STAR	= 3;
QianCengTower.DEF_ROOM_TYPE_CATCH_BOX	= 4;

QianCengTower.MSG_SIGN_UP = "<color=green>Thiên Tầng Tháp chuẩn bị mở\n<color=yellow>Thời gian mở còn lại: <color><color=white>%s<color>";
QianCengTower.MSG_LAST_TIME = "<color=yellow>Thời gian còn lại: <color>%s";

QianCengTower.tbFuBenMapName = {
	[1] = "Chương 1: Bờ Hồ Tây Tử",
	[2] = "Chương 2: Tẩy Kiếm",
	[3] = "Chương 3: Chiến Trường Yển Thành",
	[4] = "Chương 4: Hoàng Cung Mông Cổ",
	[5] = "Chương 5: Tuyết Sơn",
	[6] = "Chương 6: Đường Tơ Lụa",
	[7] = "Chương 7: Bồng Lai Tiên Cảnh",
	[8] = "Chương 8: Triều Sinh",
	[9] = "Chương 9: Võ Mục Kỳ Trân",
	[10] = "Chương 10: Nhạc Vương Điện",
};

QianCengTower.szDefaultName = "Chương thử nghiệm: Thử Thách Bất Tận";

QianCengTower.MSG_NORMAL_INFO	= "<color=yellow>%s <color>Tháp %s\n<color=yellow>Số tầng đã qua trong Tháp: <color>%s\n\n";
QianCengTower.MSG_UPDATE_INFO	= "<color=pink>Số lượt hồi sinh còn: %s lần\n<color>";
QianCengTower.MSG_STAR_COUNT_INFO = "<color=green>Đã nhặt được: %s/%s Sao Vàng<color>";
QianCengTower.MSG_NPC_COUNT_INFO = "<color=green>Vòng đánh hiện tại: %s/3\nSố quái vật còn lại: %s/%s<color>";

QianCengTower.tbBoxTaskMsgInfo = {
		[8] = "Giải cứu Gia quyến Nhạc Kha: %s/%s",
		[18] = "Đốt củi: %s/%s",
		[28] = "Treo cờ: %s/%s",
		[38] = "Giải cứu Đại Thần: %s/%s",
		[48] = "Phá hủy Bẫy Tuyết: %s/%s",
		[58] = "Dập tắt Quỷ Lửa: %s/%s",
		[68] = "Nhận Linh Đơn: %s/%s",
		[78] = "Phá hủy Hỏa Dược: %s/%s",
		[88] = "Sỡ hữu Kho Báu Võ Mục: %s/%s",
		[98] = "Ghi lại Kim Đà Túy Thiên: %s/%s",
	};

QianCengTower.MIS_UI = 
{
	[QianCengTower.DEF_ROOM_TYPE_NPC_KILL] = {
			[0] = "Chuẩn bị làm mới quái vật",
			[1] = "Tiêu diệt toàn bộ quái vật tầng này",
			[2] = "Chuẩn bị qua tầng sau",
			[3] = "Qua tầng thất bại chuẩn bị rời Tháp",
			[4] = "Qua Tháp thành công chuẩn bị rời Tháp",
		},
	[QianCengTower.DEF_ROOM_TYPE_BOSS_KILL] = {
			[0] = "Chuẩn bị làm mới quái vật",
			[1] = "Tiêu diệt toàn bộ quái vật tầng này",
			[2] = "Chuẩn bị qua tầng sau",
			[3] = "Qua tầng thất bại chuẩn bị rời Tháp",
			[4] = "Qua Tháp thành công chuẩn bị rời Tháp",
		},
	[QianCengTower.DEF_ROOM_TYPE_CATCH_STAR] = {
			[0] = "Chuẩn bị làm mới Sao",
			[1] = "Nhặt Sao Vàng",
			[2] = "Chuẩn bị qua tầng sau",
			[3] = "Qua tầng thất bại chuẩn bị rời Tháp",
			[4] = "Qua Tháp thành công chuẩn bị rời Tháp",
		},
	[QianCengTower.DEF_ROOM_TYPE_CATCH_BOX] = {
			[0] = "Chuẩn bị giải cứu",
			[1] = "Mở tất cả Kho Báu",
			[2] = "Chuẩn bị qua tầng sau",
			[3] = "Qua tầng thất bại chuẩn bị rời Tháp",
			[4] = "Qua Tháp thành công chuẩn bị rời Tháp",
		},
};

QianCengTower.DEF_TIME_NPC_STEP_REST	= Env.GAME_FPS * 5;
QianCengTower.DEF_TIME_NORMAL_NPC_STEP	= Env.GAME_FPS * 60;
QianCengTower.DEF_TIME_BOSS_NPC_STEP	= Env.GAME_FPS * 60 * 3;
QianCengTower.DEF_TIME_CATCH_STAR		= Env.GAME_FPS * 60 * 3;
QianCengTower.DEF_TIME_CATCH_BOX		= Env.GAME_FPS * 60 * 3;

QianCengTower.DEF_TIME_5_STEP_REST		= Env.GAME_FPS * 30;
QianCengTower.DEF_TIME_10_STEP_REST		= Env.GAME_FPS * 30; --Env.GAME_FPS * 60 * 1

QianCengTower.DEF_WEIWANG_FANPAI3		= 3;
QianCengTower.DEF_NPC_ID_FINISH_AWARD	= 11599;

QianCengTower.DEF_BUY_TYPE_FANPAI_COUNT_CONSUMEITEM	= 1; -- 用金币购买
QianCengTower.DEF_BUY_TYPE_FANPAI_COUNT_JINGHUO = 2; -- 用精活购买

QianCengTower.MAX_LADDER_NUM = 100;

