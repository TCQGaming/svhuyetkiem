local tb	= {
	statusmooncake={
		fastwalkrun_p={0},
		skill_statetime={18*60},
	},
	mooncake={
		deadlystrikedamageenhance_p={{{1,30}}},
		defencedeadlystrikedamagetrim={{{1,30}}},
		expenhance_p={{{1,20}}},
		appenddamage_p= {{{1,100}}},
		skill_statetime={18*60*2},
	},
	peiyuanxinfa={ -- Ngo?i C?ng
        lifemax_p={{{1,20},{2,32},{3,45},{4,50}}}, -- Ti le sinh luc toi da
        lifereplenish_p={{{1,10},{2,25},{3,35},{4,40}}}, -- Hieu suat phuc hoi sinh luc
	},
	yujinjue={ -- Ngo?i C?ng
         skillselfdamagetrim={{{1,2},{2,4},{3,7}}},--phát huy kỹ năng
		 skilldamageptrim ={{{1,2},{2,4},{3,7}}},
	},
	hunyuangong={ -- Ngo?i C?ng
		-- steallifeenhance_p={{{1,2},{2,2}},{{1,100},{10,100}}},
		-- stealmanaenhance_p={{{1,2},{2,2}},{{1,100},{10,100}}},
		-- addphysicsmagic_p={{{1,130},{2,150}}},
		-- addphysicsdamage_p={{{1,150},{2,150}}},
        damage_physics_receive_p={{{1,20},{2,30},{3,40},{4,50}}}, -- Chiu sat thuong vat ly
        damage_poison_receive_p={{{1,20},{2,30},{3,40},{4,50}}}, -- Chiu sat thuong vat ly
        damage_cold_receive_p={{{1,20},{2,30},{3,40},{4,50}}}, -- Chiu sat thuong vat ly
        damage_fire_receive_p={{{1,20},{2,30},{3,40},{4,50}}}, -- Chiu sat thuong vat ly
        damage_light_receive_p={{{1,20},{2,30},{3,40},{4,50}}}, -- Chiu sat thuong vat ly
		
	},
}

FightSkill:AddMagicData(tb)
