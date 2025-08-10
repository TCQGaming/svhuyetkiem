Require("\\script\\fightskill\\fightskill.lua")
--??
local tb	= {
	thunuoi_vk ={ -- Vu Khi
		lifemax_p={{{1,10},{2,12},{3,15},{4,20},{5,20}}}, -- Ti le SL toi da
        deadlystrikedamageenhance_p ={{{1,15},{2,20},{3,25},{4,30},{5,30}}},	-- Tan cong khi danh chi mang	
	},
	thunuoi_yp ={ -- Y Phuc
        manamax_p={{{1,10},{2,12},{3,15},{4,20},{5,20}}}, -- Ti le NL toi da
        defencedeadlystrikedamagetrim ={{{1,15},{2,20},{3,25},{4,30},{5,30}}}, -- Chiu sat thuong chi mang
	},
	thunuoi_nhan ={ -- Nhan
		addphysicsdamage_p={{{1,100},{2,150},{3,200},{4,250},{5,250}}}, -- Vat cong ngoai
        addphysicsmagic_p ={{{1,100},{2,150},{3,200},{4,250},{5,250}}},	-- Vat cong noi
        manareplenish_p ={{{1,11},{2,13},{3,16},{4,19},{5,19}}},	-- Hieu suat phuc hoi noi luc
        allseriesstateresisttime ={{{1,50},{2,75},{3,100},{4,125},{5,125}}},	-- Thoi gian bi trang thai ngu hanh
	},
	thunuoi_tay ={ -- Tay
		damage_all_resist={{{1,75},{2,90},{3,105},{4,115},{5,115}}}, -- Khang tat ca
        lifereplenish_p ={{{1,11},{2,13},{3,16},{4,19},{5,19}}},	-- Hieu suat phuc hoi sinh luc
	},
	thunuoi_hphu ={ -- Ho than phu
		lifereplenish_v={{{1,30},{2,40},{3,50},{4,60},{5,60}}}, -- Moi 5 giay hoi phuc sinh luc
        manareplenish_v ={{{1,30},{2,40},{3,50},{4,60},{5,60}}},	-- Moi 5 giay hoi phuc noi luc
        staminareplenish_v ={{{1,30},{2,40},{3,50},{4,60},{5,60}}},	-- Moi 5 giay hoi phuc the luc
        damage_all_resist ={{{1,15},{2,20},{3,25},{4,30},{5,30}}},	-- Khang tat ca
	},
	thunuoi_lien ={ -- Hang lien
        skilldamageptrim ={{{1,10},{2,17},{3,25},{4,32},{5,32}}}, -- Luc tan cong co ban
        ignoredefenseenhance_v ={{{1,155},{2,415},{3,605},{4,798},{5,798}}}, -- Bo qua ne tranh doi thu
        stealmana_p ={{{1,1},{2,3},{3,5},{4,7},{5,7}}}, -- Chuyen hoa st thanh noi luc
        seriesenhance ={{{1,55},{2,135},{3,205},{4,265},{5,265}}}, -- Cuong hoa ngu hanh tuong khac
	},
	thunuoi_lung ={ -- Lung
		damage_all_resist={{{1,70},{2,105},{3,140},{4,175},{5,175}}}, -- Khang tat ca
        lifemax_v ={{{1,500},{2,1000},{3,1500},{4,2000},{5,2000}}}, -- Sinh luc toi da diem
        seriesabate ={{{1,55},{2,135},{3,205},{4,265},{5,265}}}, -- Nhuoc hoa ngu hanh tuoc khac
	},
	thunuoi_giay ={ -- Giay
		addphysicsdamage_v={{{1,2560},{2,4100},{3,5120},{4,6140},{5,6140}}}, -- Vat cong ngoai - diem
		addphysicsmagic_v={{{1,2560},{2,4100},{3,5120},{4,6140},{5,6140}}}, -- Vat cong noi - diem
        deadlystrikeenhance_r ={{{1,10},{2,15},{3,20},{4,30},{5,30}}},	-- Tang ti le chi mang
	},
	thunuoi_boi ={ -- Boi
        skilldamageptrim ={{{1,5},{2,10},{3,15},{4,20},{5,20}}}, -- Luc tan cong co ban
        skillselfdamagetrim={{{1,5},{2,10},{3,15},{4,20},{5,20}}}, -- Luc tan cong ky nang
        staminamax_v={{{1,500},{2,750},{3,1000},{4,1250},{5,1250}}}, -- Tang the luc toi da - diem
	},
	thunuoi_non ={ -- Non
		damage_all_resist={{{1,50},{2,100},{3,150},{4,200},{5,200}}}, -- Khang tat ca
        seriesabate ={{{1,50},{2,135},{3,205},{4,265},{5,265}}}, -- Nhuoc hoa ngu hanh tuoc khac
        defencedeadlystrikedamagetrim ={{{1,10},{2,15},{3,20},{4,30},{5,30}}}, -- Chiu sat thuong chi mang
	},	
	skill_quanham ={ -- Non
        skilldamageptrim ={{{1,2},{10,25}}}, -- Luc tan cong co ban
        skillselfdamagetrim={{{1,2},{10,25}}}, -- Luc tan cong ky nang
		lifemax_v ={{{1,90},{10,784}}}, -- Sinh luc toi da diem
		lifemax_p ={{{1,9},{10,78}}}, -- Sinh luc toi da diem
		damage_all_resist={{{1,15},{10,117}}}, -- Khang tat ca		
		adddefense_v ={{{1,64},{10,537}}},
	},
	skill_quanham_x ={ -- Non
        skilldamageptrim ={{{1,2},{10,25}}}, -- Luc tan cong co ban
        skillselfdamagetrim={{{1,2},{10,25}}}, -- Luc tan cong ky nang
		lifemax_v ={{{1,90},{10,784}}}, -- Sinh luc toi da diem
		lifemax_p ={{{1,9},{10,78}}}, -- Sinh luc toi da diem
		damage_all_resist={{{1,15},{10,117}}}, -- Khang tat ca		
		adddefense_v ={{{1,64},{10,537}}},
	},	
}
FightSkill:AddMagicData(tb)