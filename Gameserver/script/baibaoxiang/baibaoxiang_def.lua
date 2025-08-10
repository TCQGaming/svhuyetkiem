-------------------------------------------------------
-- văn kiện danh 　：baibaoxiang_def.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-04-20 10:14:53
-- văn kiện miêu tả ：
-------------------------------------------------------

Baibaoxiang.TASK_GROUP_ID 			= 2086;	-- Bách Bảo Rương nhiệm vụ lượng biến đổi tổ 
Baibaoxiang.TASK_BAIBAOXIANG_LEVEL 	= 1;	-- tưởng thưởng tổng đẳng cấp 
Baibaoxiang.TASK_BAIBAOXIANG_TIMES 	= 2;	-- ngoạn gia chuyển đích số lần 
Baibaoxiang.TASK_BAIBAOXIANG_TYPE 	= 3;	-- cuối thưởng cho loại hình 
Baibaoxiang.TASK_BAIBAOXIANG_COIN 	= 4;	-- đặt tiền cuộc vỏ sò số lượng 
Baibaoxiang.TASK_BAIBAOXIANG_RESULT = 5;	-- trò chơi kết quả (1một 32vị số nguyên bảo tồn tối đa 6thứ kết quả)
Baibaoxiang.TASK_BAIBAOXIANG_OVERFLOW = 6;	-- bạo cơ tiêu chí 
Baibaoxiang.TASK_BAIBAOXIANG_CONTINUE = 7;	-- kế tục tiêu chí 
Baibaoxiang.TASK_BAIBAOXIANG_WEEKEND = 8;	-- mỗi tuần khai cái rương Đánh dấu 
Baibaoxiang.TASK_BAIBAOXIANG_INTERVAL = 9;	-- lần trước điểm kích thời gian 

Baibaoxiang.tbRateStart 	= {};			-- bảo tồn mới bắt đầu xác suất biểu 
Baibaoxiang.tbRateNormal 	= {};			-- bảo tồn tiến giai xác suất biểu 

Baibaoxiang.MAX_LEVEL 	= 6;				-- tối cao thưởng cho đẳng cấp ：6cấp 
Baibaoxiang.MAX_EXTRA	= 20000;			-- màu trì thưởng cho hạn mức cao nhất ：2vạn 

Baibaoxiang.COIN_ID		= {18, 1, 325, 1};	-- vỏ sò vật phẩm ID
Baibaoxiang.BOX_ID		= {18, 1, 324, 1};	-- cái rương vật phẩm ID

Baibaoxiang.bOpen 		= 1;

-- biểu đích đường nhỏ 
Baibaoxiang.RATE_START_PATH ="\\setting\\baibaoxiang\\rate_start.txt";
Baibaoxiang.RATE_NORMAL_PATH ="\\setting\\baibaoxiang\\rate_normal.txt";

-- thưởng cho loại hình 
Baibaoxiang.tbAwardType = 
{
	[1] ="Huyền Tinh",
	[2] ="Tinh hoạt lực",
	[3] ="Bạc",
	[4] ="Bạc khóa",
	[5] ="Bảo rương",
};

-- thưởng cho nghịch chiếu biểu 
Baibaoxiang.tbAwardConType = 
{
	["Huyền Tinh"] = 1,
	["Tinh hoạt lực"] = 2,
	["Bạc"] = 3,
	["Bạc khóa"] = 4,
	["Bảo rương"] = 5,
};

-- thưởng cho trị số 
Baibaoxiang.tbAwardValue = 
{
	["Huyền Tinh"] = {4, 5, 6, 7, 8, 9},
	["Tinh hoạt lực"] = {300, 900, 3000, 10500, 36000, 120000},
	["Bạc"] = {10000, 30000, 100000, 350000, 1200000, 4000000},
	["Bạc khóa"] = {60, 180, 600, 2100, 7200, 24000},
	["Bảo rương"] = {1},
	["Vỏ Sò"] = {1, 3, 10, 35, 120, 400},
};
