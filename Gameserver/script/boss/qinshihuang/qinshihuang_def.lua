-------------------------------------------------------
-- văn kiện danh 　：qinshihuang_def.lua
-- người khai sáng 　：zhangjinpin@kingsoft
-- sáng tạo thời gian ：2009-06-20 14:20:37
-- văn kiện miêu tả ：
-------------------------------------------------------

local tbQinshihuang = {};
Boss.Qinshihuang = tbQinshihuang;

tbQinshihuang.TASK_GROUP_ID = 2098;		-- nhiệm vụ lượng biến đổi tổ 

tbQinshihuang.TASK_USE_TIME = 1;		-- mỗi ngày hoàng lăng thời gian sử dụng 
tbQinshihuang.TASK_START_TIME = 2		-- một lần cuối cùng hoàng lăng mở ra thời gian 
tbQinshihuang.TASK_BUFF_LEVEL = 3;		-- chính diện buffđẳng cấp 
tbQinshihuang.TASK_BUFF_FRAME = 4;		-- chính diện buffthặng dư thời gian 
tbQinshihuang.TASK_PROTECT = 5;			-- đãng cơ bảo hộ 
tbQinshihuang.TASK_SAVEDATE = 8;
tbQinshihuang.TASK_REFINE_ITEM = 10;		-- mỗi ngày sử dụng luyện hóa danh vọng vật phẩm đích một sổ 

tbQinshihuang.MAX_DAILY_TIME = 60 * 60 * 2;	-- mỗi ngày 2tiếng đồng hồ 
tbQinshihuang.MAX_DAILY_REFINEITEM = 10;	-- mỗi ngày sử dụng luyện hóa danh vọng vật phẩm đích một sổ 

tbQinshihuang.SMALL_BOSS_POS_PATH ="\\setting\\boss\\qinshihuang\\smallboss_pos.txt";

tbQinshihuang.tbYemingzhu =				-- Dạ Minh Châu nhu cầu ，tạm thời không cần phối trí biểu liễu 
{
	[1] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	[2] = {0, 0, 0, 0, 0, 0, 1, 1, 3, 5},
	[3] = {0, 0, 0, 0, 0, 1, 1, 3, 9, 15},
	[4] = {0, 0, 0, 1, 1, 1, 2, 6, 18, 30},
	[5] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
};

if not tbQinshihuang.tbBoss then	
	tbQinshihuang.tbBoss = {};			-- {{nTempId, nStep, nDeathCount}}
end

if not tbQinshihuang.tbPlayerList then
	tbQinshihuang.tbPlayerList = {}; 	-- {{PlayerId, {MapLevel, StartTime}}}
end

tbQinshihuang._bOpen = 1;				-- hệ thống Đóng 
tbQinshihuang.bOpenQinFive = 0;			-- tầng thứ năm Đóng 
