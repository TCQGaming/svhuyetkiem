--quan phủ phát lệnh truy nã nhiệm vụ 
--tôn đa lương 
--2008.08.06

Wanted.TASK_MAIN_ID = 50001;		--chủ nhiệm vụ Id
Wanted.TEXT_NAME	="[Truy nã]";--chủ nhiệm vụ tên gọi 
Wanted.ACCEPT_NPC_ID= 2994;			--tiếp nhận chức vụ vụ npc

Wanted.Day_COUNT	= 6;	--mỗi ngày luy kế 6thứ ;


Wanted.TASK_GROUP 	= 2040;	--nhiệm vụ lượng biến đổi tổ ；
Wanted.TASK_ACCEPT_ID = 1;		--dĩ tiếp nhận chức vụ vụ ID
Wanted.TASK_COUNT 	= 2;		--dĩ thặng nhiệm vụ số lần ；
Wanted.TASK_FIRST 	= 3;		--canh tân hậu hoặc mới xây vai cùng ngày dành cho 6thứ tiêu chí ；
Wanted.TASK_LEVELSEG = 4;		--tiếp nhận chức vụ vụ đẳng cấp đoạn ；
Wanted.TASK_FINISH  = 7;		--có hay không dĩ hoàn thành mục tiêu ；1,vẫn chưa xong,0dĩ hoàn thành hoặc không có nhiệm vụ 

Wanted.LIMIT_COUNT_MAX	= 36;	--lớn nhất luy kế 36thứ ;
Wanted.LIMIT_LEVEL		= 50;	--đẳng cấp hạn chế ;
Wanted.LIMIT_REPUTE		= 50;	--giang hồ uy vọng hạn chế ;

Wanted.ITEM_WULINMIJI = {{18,1,191,1}, 300} --võ lâm bí tịch (sơ cấp) ID,đổi lấy cần danh bộ lệnh số lượng 
Wanted.ITEM_XISUIJING = {{18,1,192,1}, 300} --Tẩy tủy kinh (sơ cấp) ID,đổi lấy cần danh bộ lệnh số lượng 
Wanted.ITEM_MINGBULING = {18,1,190,1} --danh bộ lệnh 
Wanted.AWARD_LIST =
{
	[1] = 1,	--50giáo viên chủ nhiệm vụ thưởng cho danh bộ lệnh một sổ 
	[2] = 2,	--60giáo viên chủ nhiệm vụ thưởng cho danh bộ lệnh một sổ 
	[3] = 3,
	[4] = 4,
	[5] = 5,
}

Wanted.DROPLUCK = 10; --rơi xuống ngẫu nhiên trang bị thu được ma pháp thuộc tính thêm vào tăng may mắn giá trị 。
Wanted.DROPRATE =
{
	[55] ="\\setting\\npc\\droprate\\guanfutongji\\tongji_lv55.txt",	--55cấp bossrơi xuống biểu 
	[65] ="\\setting\\npc\\droprate\\guanfutongji\\tongji_lv65.txt",	--65cấp bossrơi xuống biểu 
	[75] ="\\setting\\npc\\droprate\\guanfutongji\\tongji_lv75.txt",	--75cấp bossrơi xuống biểu 
	[85] ="\\setting\\npc\\droprate\\guanfutongji\\tongji_lv85.txt",	--85cấp bossrơi xuống biểu 
	[95] ="\\setting\\npc\\droprate\\guanfutongji\\tongji_lv95.txt",	--95cấp bossrơi xuống biểu 
}
