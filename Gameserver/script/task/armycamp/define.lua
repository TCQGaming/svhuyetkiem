
if (not Task.tbArmyCampInstancingManager) then
	Task.tbArmyCampInstancingManager = {};
	Task.tbArmyCampInstancingManager.tbSettings = {};
end
Task.tbArmyCampInstancingManager.szAnnouce ="Phó bản quân doanh bắt đầu nhận báo danh, mời các đại hiệp trên cấp 90 thông qua \"Truyền Tống Quân Doanh\"Tân Thủ Thôn đến \"Phục Ngưu Sơn Quân Doanh\"tham gia báo danh.";
Task.tbArmyCampInstancingManager.nInstancingMaxCount = 30;													-- đồng thời khả dĩ khai khải thử FBđích tổng số 

-- một chờ cấp đoạn khả năng hội có bao nhiêu cá FB
local tbArmyCampInstancingSettings = 
{	
	{
		nInstancingTemplateId		= 1,													-- phó bản gỗ cốp pha Id
		szName						="Hậu Sơn Phục Ngưu",										-- phó bản tên 
		szEnterMsg					="Phó bản nhận báo danh trong 10 phút, do đội trưởng báo danh, cần ít nhất 4 người chơi chữ trắng trên cấp 90 nhận qua nhiệm vụ quân doanh tổ đội ở khu này. Điều kiện vào:\n<color=yellow>1. Đã báo danh\n2. Cùng thời gian, người chơi chỉ được vào phó bản đội đầu tiên mở\n3. Đã nhận qua nhiệm vụ quân doanh<color>",
		nMinLevel 					= 90, 													-- chờ cấp hạn cuối 
		nMaxLevel 					= 150,													-- chờ cấp hạn mức cao nhất 
		nInstancingMapTemplateId	= 557,													-- FBgỗ cốp pha Id	
		nInstancingEnterLimit_D 	= {nTaskGroup = 2043, nTaskId = 1, nLimitValue = 1},	-- Số lần tham gia mỗi ngày
		nJuQingTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 52, nLimitValue = 2},	-- ngoạn gia mỗi tuần nhưng nhận kịch chuyện phó bản nhiệm vụ đích hạn mức cao nhất 
		nDailyTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 51, nLimitValue = 14},	-- ngoạn gia mỗi tuần nhưng nhận hằng ngày phó bản nhiệm vụ hạn mức cao nhất 
		nRegisterMapId				= {nTaskGroup = 2043, nTaskId = 2},						-- lần trước chú sách FBđích báo danh điểm địa đồ Id
		nInstancingExistTime		= 90*60,												-- FBnặng đưa đích thời gian 
		tbRevivePos					= {1643, 3623},											-- ngoạn gia ở phó bản nội đích linh thì sống lại điểm 
		nMinPlayer					= 3,													-- khai khải FBcần nhỏ nhất ngoạn gia sổ 
		nMaxPlayer					= 6,													-- FBcó thể chứa nạp đích lớn nhất ngoạn gia sổ 
		tbOpenHour					= {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 
									12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23},		-- khai khải đích giờ 
		tbOpenDuration				= 10;													-- kéo dài đích phút 
		tbInstancingTimeId			= {nTaskGroup = 2043, nTaskId = 4},						-- ký lục ngoạn gia lần trước tiến nhập thử FBđích giờ sổ 
		tbInstancingMapId			= {nTaskGroup = 2043, nTaskId = 5},						-- ký lục ngoạn gia lần trước tiến nhập FBđích địa đồ Id
		tbHaveTask					= {225, 226, 227},										-- phải có việc này nhiệm vụ tài năng chú sách và tiến nhập FB
		nNoPlayerDuration			= 10*60,													-- FBtrung không có ngoạn gia chỉ định thời gian tắc nặng đưa 
		szNoTaskMsg					="chưa nhận nhiệm vụ phó bản Phục Ngưu Sơn!",								-- vị tiếp nhận chức vụ vụ Nhắc nhở 
	},
	{
		nInstancingTemplateId		= 2,													-- phó bản gỗ cốp pha Id
		szName						="Bách Man Sơn",										-- phó bản tên 
		szEnterMsg					="Phó bản nhận báo danh trong 10 phút, do đội trưởng báo danh, cần ít nhất 4 người chơi chữ trắng trên cấp 90 nhận qua nhiệm vụ quân doanh tổ đội ở khu này. Điều kiện vào:\n<color=yellow>1. Đã báo danh\n2. Cùng thời gian, người chơi chỉ được vào phó bản đội đầu tiên mở\n3. Đã nhận qua nhiệm vụ quân doanh<color>",
		nMinLevel 					= 90, 													-- chờ cấp hạn cuối 
		nMaxLevel 					= 150,													-- chờ cấp hạn mức cao nhất 
		nInstancingMapTemplateId	= 560,													-- FBgỗ cốp pha Id	
		nInstancingEnterLimit_D 	= {nTaskGroup = 2043, nTaskId = 1, nLimitValue = 1},	-- Số lần tham gia Bách Man Sơn
		nJuQingTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 52, nLimitValue = 2},	-- ngoạn gia mỗi tuần nhưng nhận kịch chuyện phó bản nhiệm vụ đích hạn mức cao nhất 
		nDailyTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 51, nLimitValue = 14},	-- ngoạn gia mỗi tuần nhưng nhận hằng ngày phó bản nhiệm vụ hạn mức cao nhất 
		nRegisterMapId				= {nTaskGroup = 2043, nTaskId = 2},						-- lần trước chú sách FBđích báo danh điểm địa đồ Id
		nInstancingExistTime		= 90*60,												-- FBnặng đưa đích thời gian 
		tbRevivePos					= {1724, 3131},											-- ngoạn gia ở phó bản nội đích linh thì sống lại điểm 
		nMinPlayer					= 3,													-- khai khải FBcần nhỏ nhất ngoạn gia sổ 
		nMaxPlayer					= 6,													-- FBcó thể chứa nạp đích lớn nhất ngoạn gia sổ 
		tbOpenHour					= {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 
									12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23},		-- khai khải đích giờ 
		tbOpenDuration				= 10;													-- kéo dài đích phút 
		tbInstancingTimeId			= {nTaskGroup = 2043, nTaskId = 4},						-- ký lục ngoạn gia lần trước tiến nhập thử FBđích giờ sổ 
		tbInstancingMapId			= {nTaskGroup = 2043, nTaskId = 5},						-- ký lục ngoạn gia lần trước tiến nhập FBđích địa đồ Id
		tbHaveTask					= {333, 334, 337, 338},									-- phải có việc này nhiệm vụ tài năng chú sách và tiến nhập FB
		nNoPlayerDuration			= 10*60,													-- FBtrung không có ngoạn gia chỉ định thời gian tắc nặng đưa 
		szNoTaskMsg					="chưa nhận nhiệm vụ phó bản Bách Man Sơn!",								-- vị tiếp nhận chức vụ vụ Nhắc nhở 
	},
	{
		nInstancingTemplateId		= 3,													-- phó bản gỗ cốp pha Id
		szName						="Hải Lăng Vương Mộ",											-- phó bản tên 
		szEnterMsg					="Phó bản nhận báo danh trong 10 phút, do đội trưởng báo danh, cần ít nhất 4 người chơi chữ trắng trên cấp 90 nhận qua nhiệm vụ quân doanh tổ đội ở khu này. Điều kiện vào:\n<color=yellow>1. Đã báo danh\n2. Cùng thời gian, người chơi chỉ được vào phó bản đội đầu tiên mở\n3. Đã nhận qua nhiệm vụ quân doanh<color>",
		nMinLevel 					= 90, 													-- chờ cấp hạn cuối 
		nMaxLevel 					= 150,													-- chờ cấp hạn mức cao nhất 
		nInstancingMapTemplateId	= 493,													-- FBgỗ cốp pha Id	
		nInstancingEnterLimit_D 	= {nTaskGroup = 2043, nTaskId = 1, nLimitValue = 1},	-- Số lần tham gia hải lăng vương mộ
		nJuQingTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 52, nLimitValue = 2},	-- ngoạn gia mỗi tuần nhưng nhận kịch chuyện phó bản nhiệm vụ đích hạn mức cao nhất 
		nDailyTaskLimit_W			= {nTaskGroup = 1024, nTaskId = 51, nLimitValue = 14},	-- ngoạn gia mỗi tuần nhưng nhận hằng ngày phó bản nhiệm vụ hạn mức cao nhất 
		nRegisterMapId				= {nTaskGroup = 2043, nTaskId = 2},						-- lần trước chú sách FBđích báo danh điểm địa đồ Id
		nInstancingExistTime		= 90*60,												-- FBnặng đưa đích thời gian 
		tbRevivePos					= {1586, 3157},											-- ngoạn gia ở phó bản nội đích linh thì sống lại điểm 
		nMinPlayer					= 3,													-- khai khải FBcần nhỏ nhất ngoạn gia sổ 
		nMaxPlayer					= 6,													-- FBcó thể chứa nạp đích lớn nhất ngoạn gia sổ 
		tbOpenHour					= {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 
									12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23},		-- khai khải đích giờ 
		tbOpenDuration				= 10;													-- kéo dài đích phút 
		tbInstancingTimeId			= {nTaskGroup = 2043, nTaskId = 4},						-- ký lục ngoạn gia lần trước tiến nhập thử FBđích giờ sổ 
		tbInstancingMapId			= {nTaskGroup = 2043, nTaskId = 5},						-- ký lục ngoạn gia lần trước tiến nhập FBđích địa đồ Id
		tbHaveTask					= {363, 364, 365, 366, 367, 368},						-- phải có việc này nhiệm vụ tài năng chú sách và tiến nhập FB
		nNoPlayerDuration			= 10*60,													-- FBtrung không có ngoạn gia chỉ định thời gian tắc nặng đưa 
		szNoTaskMsg					="chưa nhận nhiệm vụ phó bản Hải Lăng Vương Mộ",								-- vị tiếp nhận chức vụ vụ Nhắc nhở 
	},
}


for _, tbInstaingSetting in ipairs(tbArmyCampInstancingSettings) do
	assert(not Task.tbArmyCampInstancingManager.tbSettings[tbInstaingSetting.nInstancingTemplateId]);	-- bảo đảm không có trọng phục đích Id
	Task.tbArmyCampInstancingManager.tbSettings[tbInstaingSetting.nInstancingTemplateId] = tbInstaingSetting;
end

