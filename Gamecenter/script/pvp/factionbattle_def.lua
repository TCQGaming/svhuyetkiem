-------------------------------------------------------------------
--File: 	factionbattle_def.lua
--Author: 	zhengyuhua
--Date: 	2008-1-8 17:38
--Describe:	Môn phái chiến định nghĩa 
-------------------------------------------------------------------

if not FactionBattle then --điều chỉnh thử cần 
	FactionBattle = {};
	print(GetLocalDate("%Y\\%m\\%d %H:%M:%S").."build ok..");
end

local preEnv =_G;	--bảo tồn cũ đích hoàn cảnh 
setfenv(1, FactionBattle);	--thiết trí trước mặt hoàn cảnh vi FactionBattle

SETTING_PATH 	="\\setting\\factionbattle\\";
ARENA_RANGE		="arena_range.txt";
ARENA_POINT		="arena_point.txt";
BOX_POINT		="box_point.txt";
	
MAX_ATTEND_PLAYER			= 400; 		-- lớn nhất dự thi nhân số 
MIN_ATTEND_PLAYER			= 2;		-- nhỏ nhất tham gia nhân số 		
MIN_RESTART_MELEE			= 8;		-- ít nhất phân tràng nhân số 	
PLAYER_PER_ARENA			= 50;		-- từng hỗn chiến nơi dung nạp đích lớn nhất nhân số 
MAX_ARENA					= 8;		-- lớn nhất hỗn chiến tràng một sổ 
MELEE_PROTECT_TIME			= 15;		-- hỗn chiến tiền bảo hộ thời gian 15miểu 
MELEE_RESTART_PROTECT		= 10;		-- hỗn chiến trọng phân nơi sân hậu bảo hộ thời gian 10miểu 
ELIMI_PROTECT_TIME			= 30;		-- đấu loại bảo hộ thời gian 30miểu 
END_DELAY					= 5;		-- chiến khu thặng dư duy nhất một nhân thì yếu truyền ra truyền tống lùi lại 
ADD_BOX_DELAY				= 5; 		-- quyết ra thắng bại hậu Bảo rương cà ra lùi lại thời gian 
ADDEXP_SECOND_PRE_TIME		= 30;		-- mỗi lần +kinh nghiệm khoảng cách thời gian 30miểu 
ADDEXP_QUEUE_NUM			= 10;		-- +kinh nghiệm đội ngũ sổ 
RATIO						= 1;		-- +kinh nghiệm làm cơ chuẩn kinh nghiệm bội số 
TAKE_BOX_TIME				= 5;		-- nhặt thưởng cho cái rương đích thời gian 
REST_ACTITIVE_TIME			= 7*60;		-- mỗi lần nghỉ ngơi hoạt động thời gian 7phút 	
FLAG_NPC_TAMPLATE_ID		= 2702;		-- quán quân cờ NPCgỗ cốp pha ID
FLAG_X						= 1575;		-- quán quân cờ tọa độ 
FLAG_Y						= 3375;		-- quán quân cờ tọa độ 
FLAG_EXIST_TIME				= 10*60;		-- quán quân cờ sinh tồn kỳ 			
ANOUNCE_TIME				= 6*60;		-- kinh qua bao lâu Nhắc nhở thặng dư thời gian 		
YANHUA_SKILL_ID				= 391;		-- Pháo hoa đích kỹ năng ID
AWARD_ITEM_ID				= {1,78,1};	-- cái rương đạo cụ ID
GOUHUO_NPC_ID				= 2728;		-- nhiều người Lửa trại ID
GOUHUO_EXISTENTIME 			= 600; 		-- Lửa trại duy trì liên tục thời gian 
GOUHUO_BASEMULTIP			= 400; 		-- Lửa trại thu được kinh nghiệm bội tỷ số tỉ lệ phần trăm 
TITLE_GROUP					= 4;		-- quán quân xưng hào tổ 
TITLE_ID					= 1;		-- xưng hào ID
MIN_LEVEL					= 50;		-- tham gia đẳng cấp hạn cuối 
--MAX_LEVEL					= 100; 		-- tham gia đẳng cấp hạn mức cao nhất 

TASK_GROUP_ID				= 2016		-- nhiệm vụ lượng biến đổi tổ ID
DEGREE_TASK_ID				= 1;		-- giới nhiệm vụ ID
SCORE_TASK_ID				= 2;		-- cờ vi tích phân ID
TASK_USED_LINGPAI			= 3;		-- cùng ngày sử dụng một sổ nhiệm vụ lượng biến đổi 
TASK_LINGPAI_DATE 			= 4;		-- ghi lại sử dụng ngày nhiệm vụ lượng biến đổi 
ELIMINATION_TASK_ID			= 5;		-- ghi lại các ngoạn gia tiến nhập kỷ mạnh nhiệm vụ ID（hoán vi tích phân dùng ）

HONOR_CLASS					= 2;		-- vinh dự loại lớn 
HONOR_WULIN_TYPE			= 0;		-- võ lâm vinh dự tiểu loại 

NOTHING					= 0;		-- hoạt động vị khởi động 
SIGN_UP					= 1; 		-- báo danh giai đoạn 
MELEE					= 2;		-- hỗn chiến giai đoạn 
READY_ELIMINATION		= 3;		-- đấu loại chuẩn bị giai đoạn 
ELIMINATION				= 4;		-- đấu loại giai đoạn 
CHAMPION_AWARD			= 5;		-- quán quân trao giải 
END						= 6;		-- kết thúc 

-- mở ra ở chu 2，4
OPEN_WEEK_DATE = {2,5};

-- tự do PKmột lần nữa đầu nhập thời gian chiến đấu biểu 
return_TO_MELEE_TIME = 
{	-- tử vong số lần 			đợi thời gian 
		[1] = 			10,
		[2] = 			20,
		[3] = 			40,
		[4] = 			60,
}

-- chú ý ：thưởng cho hội chồng ，các thưởng cho thị trước thưởng cho lúc tái thêm 
AWARD_TABLE = 
{--		tâm đắc 		uy vọng 		Môn phái danh vọng 	thêm vào thưởng cho （Xphút kinh nghiệm 、Xcái rương ） công ty cổ phần số đếm 	vinh dự 
	{	200000,		0,			160,		0,			0,					0,			0	},	-- vô sát nhân thưởng cho 
	{	100000,		0,			80,			0,			0,					0,			0	},	-- có sát nhân thưởng cho 
	{	100000,		6,			110,		90,			1,					100,			40	},	-- tấn cấp 16cường thưởng cho 
	{	200000,		6,			50,			120,		2,					100,			10	},	-- 16tiến 8thưởng cho 
	{	200000,		10,			100,		180,		4,					300,			10	},	-- 8tiến 4thưởng cho 
	{	0,			0,			0,			180,		4,					0,			20	},	-- 4tiến 2thưởng cho 
	{	200000,		10,			100,		240,		8,					500,			20	},	-- 2tiến 1thưởng cho 
	{	0,			0,			0,			0,			0,					0,			0	},	-- quán quân thưởng cho 
}	

-- hỗn chiến giai đoạn vinh dự 、uy vọng 
MELEE_HONOR = 
{
	--phần trăm 	-- vinh dự 	-- uy vọng 
	{0.1,	50,		0,		50},
	{0.3,	40,		0,		40},
	{0.7,	30,		0,		30},
	{0.9,	20,		0,		20},
	{1,		10,		0,		10},
}

-- cà bất đồng cái rương nhân số của đoạn 
PLAYER_COUNT_LIMIT	= 
{
	[1]	= 16, [2] = 50, [3] = 100, [4] = 150, [5] = 100000 --(vô cùng lớn,giả như bởi vì nhân số>10Wnhân mà tạo thành BUG，chúng ta cai chúc mừng liễu)
}

-- đấu loại cà cái rương số lượng biểu 
BOX_NUM =
{--	bỉ tái các cường 	rơi lả tả Bảo rương sổ (2)	(3)		(4)		(5)
	{16, 			1,			2,		3,		4};			-- 16tiến 8thưởng cho 
	{8, 			2,			4,		6,		8};			-- 8tiến 4thưởng cho 
	{4,				4, 			8,		12,		16};		-- 4tiến 2thưởng cho 
	{2,				8, 			16,		24,		30};		-- 2tiến 1thưởng cho 
	{1,				8, 			16,		24,		30};		-- quán quân thưởng cho 
}

-- đánh với biểu 
ELIMI_VS_TABLE =
{
	{1, 16},
	{8,	9},
	{4,	13},
	{5,	12},
	{2,	15},
	{7,	10},
	{3,	14},
	{6,	11},
}

-- Môn phái thi đấu thể thao địa đồ đối ứng biểu 
ThiDauMonPhai_TO_MAP =
{
	[1] 	= 241,
	[2] 	= 241,
	[3] 	= 241,
	[4] 	= 241,
	[5] 	= 241,
	[6] 	= 241,
	[7] 	= 241,
	[8] 	= 241,
	[9] 	= 241,
	[10] 	= 241,
	[11] 	= 241,
	[12] 	= 241
};

FACTION_TO_MAP =
{
[1] = 241,
[2] = 242,
[3] = 243,
[4] = 244,
[5] = 245,
[6] = 246,
[7] = 247,
[8] = 248,
[9] = 249,
[10] = 250,
[11] = 251,
[12] = 252
};

-- tiến nhập điểm dữ sống lại điểm 
REV_POINT = 
{
	{1470, 3426},
	{1517, 3377},
	{1542, 3492},
	{1590, 3442}
};

STATE_TRANS	=
{
--	trạng thái 					đúng giờ thời gian 				đã đến giờ quay về công hàm thuyên chuyển công tác sổ (hàm số phản hồi 0biểu thị không đang tiếp tục đúng giờ ，kết thúc hoạt động)
	{SIGN_UP, 				30 * 60, 				"StartMelee"		},		-- báo danh đúng giờ 
	{MELEE,					5 * 60,					"RestartMelee"		},		-- hỗn chiến đúng giờ 
	{MELEE,					5 * 60,					"RestartMelee"		},		-- hỗn chiến đúng giờ 
	{MELEE,					5 * 60,					"RestartMelee"		},		-- hỗn chiến đúng giờ 
--	{MELEE,					6 * 60,					"RestartMelee"		},		-- hỗn chiến đúng giờ 
	{MELEE,					5 * 60,					"EndMelee"			},		
	{READY_ELIMINATION,		3 * 60,					"StartElimination"	}, 		-- đấu loại chuẩn bị 
	{ELIMINATION,			7 * 60,					"EndElimination"	}, 		-- đấu loại 1giai 	quyết ra 8cường 
	{READY_ELIMINATION,		7 * 60,					"StartElimination"	}, 		-- đấu loại chuẩn bị 
	{ELIMINATION,			7 * 60,					"EndElimination"	}, 		-- đấu loại 2giai 	quyết ra 4cường 
	{READY_ELIMINATION,		7 * 60,					"StartElimination"	}, 		-- đấu loại chuẩn bị 
	{ELIMINATION,			7 * 60,					"EndElimination"	}, 		-- đấu loại 3giai 	quyết ra 2cường 
	{READY_ELIMINATION,		7 * 60,					"StartElimination"	}, 		-- đấu loại chuẩn bị 
	{ELIMINATION,			7 * 60,					"EndElimination"	}, 		-- đấu loại 4giai 	quán quân 
	{CHAMPION_AWARD,		10 * 60,				"EndChampionAward"	}, 		-- quán quân thưởng cho 
	{END}
};

preEnv.setfenv(1, preEnv);	--khôi phục toàn cục hoàn cảnh 
