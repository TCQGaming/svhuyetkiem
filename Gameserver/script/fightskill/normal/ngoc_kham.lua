Require("\\script\\fightskill\\fightskill.lua")
--??
local tb	= {
	vukhi_tancong={
        skilldamageptrim ={{{1,3},{2,6},{3,9},{4,12},{5,15},{6,20},{7,25},{8,30},{9,40},{10,50}}},
	},
	vukhi_vatcong={
        -- addphysicsdamage_v={{{1,500},{2,600},{3,700},{4,800},{5,900}}}, -- Vat cong ngoai - diem
		-- addphysicsmagic_v={{{1,500},{2,600},{3,700},{4,800},{5,900}}}, -- Vat cong noi - diem
		    addphysicsdamage_p ={{{1,5},{2,16},{3,28},{4,43},{5,60},{6,81},{7,107},{8,140}}}, -- vật công ngoại %
			addphysicsmagic_p ={{{1,5},{2,16},{3,28},{4,43},{5,60},{6,81},{7,107},{8,140},{9,173},{10,206}}}, ----- vật công nội %
	},
	vukhi_bokhang={
			ignoreresist_p ={{{1,30},{2,30},{3,30},{4,30},{5,30},{6,30},{7,30},{8,30},{9,30},{10,30}},{{1,1},{2,2},{3,3},{4,4},{5,5},{6,6},{7,10},{8,15},{9,20},{10,25}}},
	},
	trangsuc_ktc={
	damage_all_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},

	trangsuc_chimang={
        deadlystrikeenhance_r ={{{1,5},{2,10},{3,15},{4,20},{5,25},{6,30},{7,35},{8,50},{9,60},{10,80}}},
	},
	trangsuc_giamchimang={
       defencedeadlystrikedamagetrim ={{{1,2},{2,4},{3,6},{4,8},{5,10},{6,12},{7,14},{8,20},{9,25},{10,30}}}, -- Chiu sat thuong chi mang
	},
	phu_phuchoi={
         manareplenish_v={{{1,20},{2,25},{3,30},{4,35},{5,40},{6,44},{7,45},{8,46}}},--hồi sinh lực điểm
		lifereplenish_v={{{1,20},{2,25},{3,30},{4,35},{5,40},{6,44},{7,45},{8,46}}},-- hồi nội lực điểm
	},
	
	phongcu_ktc={
	damage_all_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},
	phongcu_sinhluc={
        lifemax_v ={{{1,50},{2,151},{3,252},{4,378},{5,530},{6,707},{7,934},{8,1212},{9,1490},{10,1768}}},
	},
	non_khang={
       damage_cold_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},
	ao_khang={
		       damage_fire_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},
	lung_khang={
       damage_light_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},

	tay_khang={
       damage_physics_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},

	giay_khang={
       damage_poison_resist={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}},
	},		

		ngua_cuongnhuochoa={
        seriesenhance ={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}}, -- Cuong hoa ngu hanh tuong khac
		        seriesabate ={{{1,3},{2,9},{3,27},{4,49},{5,76},{6,107},{7,145},{8,200},{9,255},{10,310}}}, -- Nhuoc hoa ngu hanh tuoc khac
	},	
		ngua_khang_vat_ly={
        damage_physics_receive_p ={{{1,1},{2,3},{3,5},{4,7},{5,9},{6,11},{7,13},{8,15},{9,17},{10,20}}}, --kháng vật lý
			},	
		ngua_khang_doc={
        damage_poison_receive_p ={{{1,1},{2,3},{3,5},{4,7},{5,9},{6,11},{7,13},{8,15},{9,17},{10,20}}}, --kháng độc công 
			},	
		ngua_khang_bang={
        damage_cold_receive_p ={{{1,1},{2,3},{3,5},{4,7},{5,9},{6,11},{7,13},{8,15},{9,17},{10,20}}},  --kháng băng công
			},	
		ngua_khang_hoa={
        damage_fire_receive_p ={{{1,1},{2,3},{3,5},{4,7},{5,9},{6,11},{7,13},{8,15},{9,17},{10,20}}},  --kháng hỏa công 
			},	
		ngua_khang_loi={
        damage_light_receive_p ={{{1,1},{2,3},{3,5},{4,7},{5,9},{6,11},{7,13},{8,15},{9,17},{10,20}}},  --kháng lôi công 
			},	
		ngua_vatcong={
        addphysicsdamage_v ={{{1,50},{2,100},{3,150},{4,200},{5,250},{6,300},{7,350},{8,400},{9,500},{10,600}}}, -- Vat cong ngoai - diem
		addphysicsmagic_v ={{{1,50},{2,100},{3,150},{4,200},{5,250},{6,300},{7,350},{8,400},{9,500},{10,600}}}, -- Vat cong nội - diem
			},	
			
			
		dabo={
		lifemax_p={{{1,10},{10,50},{11,55}}},
		lifemax_v ={{{1,1000},{2,2000},{3,3000},{10,10000}}},
		skilldamageptrim		={{{1,5},{10,50}}},
		skillselfdamagetrim		={{{1,5},{10,50}}},
		deadlystrikedamageenhance_p={{{1,5},{2,10},{3,15},{10,50}}},
		manareplenish_v={{{1,20},{2,25},{3,30},{4,35},{5,40},{6,45},{10,200}}},--hồi sinh lực điểm
		lifereplenish_v={{{1,20},{2,25},{3,30},{4,35},{5,40},{6,45},{10,200}}},-- hồi nội lực điểm
		seriesenhance ={{{1,20},{2,40},{10,200}}}, -- Cuong hoa ngu hanh tuong khac
		seriesabate ={{{1,20},{2,40},{10,200}}}, -- Cuong hoa ngu hanh tuong khac
		deadlystrikeenhance_r ={{{1,50},{2,100},{3,150},{4,200},{10,500}}},
		
		dynamicmagicshield_v={{{1,1000},{10,1000}},50},
			},	

}
FightSkill:AddMagicData(tb)