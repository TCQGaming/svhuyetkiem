--竞技赛类型
--孙多良.麦亚津
--2008.12.24

--雪仗活动相关定义
Esport.SNOWFIGHT_ITEM_SINGLEWIN	= 	{18,1,282,1}	--单场奖励宝箱一个

Esport.SNOWFIGHT_ITEM_JINZHOUBAOZHU	= 	{18,1,278,1}	--禁咒爆竹

Esport.SNOWFIGHT_ITEM_EXCOUNT	= 	{18,1,280,1}	--红粉莲花，可以额外获得参加次数

Esport.SNOWFIGHT_STATE = {
	[1] = 20131102,	--活动开始时间
	[2] = 20131201,	--活动结束时间
	[3] = 20131220,	--物品消失期
	[4] = 20131121,	--充值额外获得红粉莲花时间开始
	[5] = 20131201,	--充值额外获得红粉莲花时间结束
}

--活动开启时间
Esport.SNOWFIGHT_TIME_SCHTASK = 
{
 1000, 1030, 
 1100, 1130,
 1200, 1230,
 1300, 1330,
 1400, 1430,
 1500, 1530,
 1600, 1630,
 1700, 1730,
 1800, 1830,
 1900, 1930,
 2000, 2030,
 2100, 2130,
 2200, 2230,
 2300, 2330,
 0000, 0030,
 };

-- Cuộc thi đấu hệ thống tương quan định nghĩa

-- Nhiệm vụ lượng biến đổi định nghĩa
Esport.TSK_GROUP = 2064;-- Nhiệm vụ tổ
Esport.TSK_ATTEND_TOTAL = 1;-- Tham gia tổng số
Esport.TSK_ATTEND_WIN = 2;-- Tham gia thắng số
Esport.TSK_ATTEND_TIE = 3;-- Tham gia bình số
Esport.TSK_ATTEND_COUNT = 4;-- Mỗi ngày có thể tham gia số lần, ghi chép số lần
Esport.TSK_ATTEND_DAY = 5;-- Tính gộp lại số trời
Esport.TSK_ATTEND_EXCOUNT = 6;-- Ngoài định mức tham gia số lần
Esport.TSK_ATTEND_AWARD = 7;-- Ban thưởng tiêu chí

Esport.TSK_NEWYEAR_YANHUA = 8;-- Mỗi ngày nhận lấy năm mới pháo hoa tiêu chí
Esport.TSK_NEWYEAR_JINZHOUBAOZHU = 9 -- Mỗi ngày nhận lấy một cái cấm chú pháo
Esport.TSK_NEWYEAR_LIANHUA = 10 -- Xông 48 Ngoài định mức thu hoạch được phấn hồng hoa sen
Esport.TSK_NEWYEAR_LIANHUA_COUNT = 11 -- Mỗi ngày sử dụng phấn hồng hoa sen đổi lấy số lần nhiều nhất 3 Lần, ghi chép số lần
Esport.TSK_NEWYEAR_LIANHUA_DAY = 12 -- Mỗi ngày sử dụng phấn hồng hoa sen đổi lấy số lần nhiều nhất 3 Lần, ghi chép trời
Esport.TSK_NEWYEAR_LIGUAN_DAY = 13 -- Mỗi ngày chỉ có thể ở ngẫu nhiên xoát ra lễ quan chỗ nhận lấy một lần ngẫu nhiên ban thưởng, ghi chép trời

Esport.DEF_POINT_WIN= 6;-- Thắng thu hoạch được điểm tích lũy
Esport.DEF_POINT_TIE= 4;-- Bình thu hoạch được điểm tích lũy
Esport.DEF_POINT_LOST= 3;-- Phụ thu hoạch được điểm tích lũy
Esport.DEF_PLAYER_MAX= 120;-- Một cái chuẩn bị trận nhiều người nhất số ( Ảnh hưởng tranh tài động thái địa đồ tăng thêm tổng lượng )
Esport.DEF_PLAYER_TEAM= 6;-- Giao đấu một phương nhiều nhất mấy người ( Ảnh hưởng tranh tài động thái địa đồ tăng thêm tổng lượng )
Esport.DEF_PLAYER_LEVEL= 50;-- Đẳng cấp thấp nhất nhu cầu
Esport.DEF_PLAYER_COUNT= 2;-- Mỗi ngày ngầm thừa nhận có thể tham gia số lần
Esport.DEF_PLAYER_KEEP_MAX= 14;-- Nhiều nhất nhưng tính gộp lại nhiều ít trận

Esport.DEF_PLAYER_EXP_WIN= 120;-- Thắng lợi thu hoạch được 120 Phút tiêu chuẩn cơ bản kinh nghiệm
Esport.DEF_PLAYER_EXP_LOST= 90;-- Thất bại hoặc bình thu hoạch được 90 Phút tiêu chuẩn cơ bản kinh nghiệm

Esport.DEF_READY_MSG= "<color=green>Hoạt động bắt đầu sau: <color=white>%s<color>"; 
Esport.DEF_READY_TIME= Env.GAME_FPS * 595;-- Thời gian chuẩn bị;
Esport.DEF_READY_TIME2= Env.GAME_FPS * 5;-- Thời gian chuẩn bị kết thúc, giải tán đội ngũ, chờ đợi tiến vào đấu trường thời gian
Esport.DEF_READY_TIME_ENTER= Env.GAME_FPS * 10;-- Ra trận cuối cùng đếm ngược thời gian;
Esport.DEF_READY_MAP= {1504, 1505, 1506};-- Chuẩn bị sân bãi đồ ID
Esport.DEF_READY_POS= {{1607,3183}};-- Chuẩn bị trận truyền vào tọa độ, nhiều cái tọa độ ngẫu nhiên

Esport.DEF_MAP_TEMPLATE_ID= 1507;-- Sân thi đấu đồ khuôn mẫu ID
Esport.DEF_MAP_POS= {50848/32,102560/32};-- Đấu trường truyền vào tọa độ,1589,3205

-- Bộ nhớ tồn trữ biểu
Esport.tbGroupLists  = Esport.tbGroupLists or {};-- Đội ngũ liệt biểu
Esport.tbPlayerLists = Esport.tbPlayerLists or {};  -- Tuyển thủ sân bãi biểu
Esport.nReadyTimerId = Esport.nReadyTimerId or 0;-- Thời gian chuẩn bị timer
Esport.tbMissionLists = Esport.tbMissionLists or {};-- Khởi động mission Biểu
Esport.tbDynMapLists= Esport.tbDynMapLists or {};-- Động thái tranh tài địa đồ

Esport.SKILL_ID_SNOWBALL_ORIGINAL = 1300;

-- Npc 用数据
-- {[模板Id] = skill_id, ... }
Esport.tbTemplateId2Skill = 
	{[3609] = 1301, [3610] = 1302, [3611] = 1304, [3612] = 1306, [3613] = 1308, [3614] = 1309,
     [4290] = 1452, [4291] = 1453, [4292] = 1454, [4293] = 1455, [4294] = 1456,
    };

-- {[color] = trap_id, ... }
Esport.tbTemplateId2Trap = {[3615] = 1315, [3628] = 1316, [3629] = 1317, [3630] = 1318, [3631] = 1320,
    [4295] = 1315, [4296] = 1316, [4297] = 1317, [4298] = 1318, [4299] = 1320,
    };

-- {[模板Id] = buff_id, ... }
Esport.tbTemplateId2Buff = 
	{[3616] = 1312, [3624] = 1314, [3625] = 1311, [3626] = 1313,};
	
Esport.tbSkill2Level = 
	{[1301] = 3,	[1302] = 2,	[1304] = 2, [1306] = 2, [1308] = 2, [1309] = 4,
	 [1311] = 10,	[1312] = 1, [1313] = 1, [1314] = 1, [1315] = 3, [1316] = 3, [1317] = 5,
	 [1318] = 3,	[1320] = 3, 
	 [1452] = 1,	[1453] = 1, [1454] = 1, [1455] = 1, [1456] = 1,
	 };

Esport.tbSkill2Time = 
	{[1301] = 30,	[1302] = 30,	[1304] = 30, [1306] = 30, [1308] = 30, [1309] = 30,
	 [1311] = 30,	[1312] = 30, 	[1313] = 30, [1314] = 20, 
	 }; 

Esport.tbSkill2Original = 
	{
	 [1452] = 1451, [1453] = 1451, [1454] = 1451, [1455] = 1451, [1456] = 1451,
	}
	
Esport.tbBlizzardPos1 = 
{
	{50304,102304},
	{50400,103040},
	{50848,102048},
	{50816,103200},
	{51424,102048},
	{51200,102976},
	{51264,102400},
}
	 