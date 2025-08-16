--Require("\\script\\fightskill\\fightskill.lua")
--??
local tb	= {
	equip_huizhang={ --
		attackrating_p ={{{1,1},{2,2},{60,60}}},--Tỷ lệ đánh trúng
		skilldamageptrim ={{{1,1},{2,2},{60,60}}},--phát huy
		-- seriesenhance ={{{1,1},{2,2},{60,60}}},--Cường Hóa ngũ hành tương khắc
		-- seriesabate ={{{1,1},{2,2},{60,60}}},--Nhược Hóa ngũ hành tương khắc
		-- ignoredefense_v ={{{1,1},{2,2},{60,20}}},	-- bo qua ne tranh doi thu
		-- deadlystrikedamageenhance_p ={{{1,1},{2,2},{60,20}}},	-- Tan cong khi danh chi mang	
 		damage_all_resist={{{1,2},{2,4},{60,120}}},-- Khang tat ca	
		allseriesstateresisttime ={{{1,2},{2,4},{60,120}}},	-- Thoi gian bi trang thai ngu hanh
		allseriesstateresistrate ={{{1,2},{2,4},{60,120}}},	-- Xác suất bị trạng thái ngũ hành
		-- adddefense_v ={{{1,1},{2,2},{60,60}}},-- ne tranh	
		lifemax_v={{{1,200},{2,400},{60,12000}}},	-- Ti le SL toi da
		-- manamax_p={{{1,1},{2,2},{60,60}}},	-- Ti le SL toi da
		-- fastmanareplenish_v={{{1,1},{2,2},{60,60}}},	-- Mỗi nữa giây hồi phục sinh lực
		-- fastlifereplenish_v={{{1,1},{2,2},{60,60}}},	-- Mỗi nữa giây hồi phục noi luc
		-- skilldamageptrim={{{1,1},{2,2},{60,60}}},	-- Mỗi nữa giây hồi phục noi luc
		defencedeadlystrikedamagetrim={{{1,1},{2,2},{60,60}}},-- Chiu sat thuong chi mang	
	},	

}
FightSkill:AddMagicData(tb)