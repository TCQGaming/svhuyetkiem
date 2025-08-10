local tb = { 
 
 		DoanThiChi_150={ --天龙神指
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		colddamage_v={
			[1]={{1,550*0.9*FightSkill.tbParam.nS1},{10,954},{20,1914}},
			[3]={{1,550*1.1*FightSkill.tbParam.nS1},{10,1086},{20,2046}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,5},{20,50},{21,50}}},
		state_hurt_attack={{{1,7},{10,35},{20,45},{30,60},{40,70},{45,80}},{{1,18},{10,18*2},{20,18*2},{30,18*4},{40,18*4.5},{45,18*5}}},
		state_slowall_attack={{{1,7},{10,35},{20,45},{30,60},{40,70},{45,80}},{{1,18},{10,18*2},{20,18*2},{30,18*4},{40,18*4.5},{45,18*5}}},
		missile_hitcount={{{1,5},{20,5}}},
	},
	DoanThiChi_150_1={ --天龙神指触发伤害
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		colddamage_v={
			[1]={{1,550*0.9*FightSkill.tbParam.nS1},{10,550*0.9},{20,550*0.9*FightSkill.tbParam.nS20},{21,550*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}},
			[3]={{1,550*1.1*FightSkill.tbParam.nS1},{10,550*1.1},{20,550*1.1*FightSkill.tbParam.nS20},{21,550*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_hurt_attack={{{1,7},{10,20},{20,25}},{{1,18},{20,18}}},
		state_slowall_attack={{{1,7},{10,20},{20,25}},{{1,18},{20,36},{21,36}}},
		missile_hitcount={{{1,5},{20,5}}},
	},
	DoanThiChi_150_Buff={	--天龙神指BUFF
		ignoreskill={{{1,30},{10,50},{20,70},{21,72},{22,74},{23,75}},0,{{1,3},{2,3}}},
		skill_statetime={18*2},
	},
 
 		DoanThiKiem_150={ --气吞万里主_伤
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,200}}},
		colddamage_v={
			[1]={{1,475*0.9*FightSkill.tbParam.nS1},{10,1127},{20,1627},{30,2127},{40,2627},{45,2972}},
			[3]={{1,475*1.1*FightSkill.tbParam.nS1},{10,1222},{20,1722},{30,2222},{40,2722},{45,3022}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		state_hurt_attack={{{1,5},{10,35},{20,55},{30,65},{40,75},{45,80}},{{1,18*2},{20,18*2},{30,18*3},{40,18*3}}},
		missile_hitcount={{{1,6},{2,6}}},
		missile_range={3,0,3},
	},
	DoanThiKiem_150_1={ --气吞万里子1_灼
		state_burn_attack={{{1,5},{10,9},{20,14},{30,22},{40,30},{45,35}},{{1,18*2},{10,18*3},{20,18*3},{30,18*4},{40,18*4}}},
		missile_hitcount={{{1,6},{2,6}}},
	},
	DoanThiKiem_150_2={ --气吞万里子2_缓
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,200}}},
		colddamage_v={
			[1]={{1,475*0.9*FightSkill.tbParam.nS1},{10,1127},{20,1627},{30,2127},{40,2627},{45,2972}},
			[3]={{1,475*1.1*FightSkill.tbParam.nS1},{10,1222},{20,1722},{30,2222},{40,2722},{45,3022}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_slowall_attack={{{1,15},{10,50},{20,60},{30,70},{40,70},{45,75}},{{1,45},{10,18*3},{11,18*3}}},
		missile_hitcount={{{1,6},{2,6}}},
		missile_range={3,0,3},
	},
	DoanThiKiem_150_3={ --六脉神剑子3_弱
		state_weak_attack={{{1,5},{10,9},{20,14},{30,22},{40,30},{45,35}},{{1,18*2},{10,18*3},{20,18*3},{30,18*4},{40,18*4}}},
		missile_hitcount={{{1,6},{2,6}}},
	},
	DoanThiKiem_150_4={ --气吞万里子4_晕
		state_stun_attack={{{1,5},{10,9},{20,14},{30,22},{40,30},{45,35}},{{1,18*2},{10,18*1.5},{20,18*1.5},{30,18*3},{40,18*3}}},
		missile_hitcount={{{1,6},{2,6}}},
	},
	DoanThiKiem_150_5={ --气吞万里子5_攻击
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,200}}},
		colddamage_v={
			[1]={{1,610*0.9*FightSkill.tbParam.nS1},{10,1249},{20,1749},{30,2249},{40,2749},{45,3249}},
			[3]={{1,610*1.1*FightSkill.tbParam.nS1},{10,1371},{20,1871},{30,2371},{40,2871},{45,3371}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,6},{2,6}}},
		missile_range={3,0,3},
	},
	
		NgaMyChuong_150_1={ --月华倾泻
		appenddamage_p= {{{1,150*FightSkill.tbParam.nS1},{10,250},{20,310}}},
		colddamage_v={
			[1]={{1,2000*0.9*FightSkill.tbParam.nS1},{10,2160},{20,2660},{30,4083},{40,5464},{45,5764}},
			[3]={{1,2000*1.1*FightSkill.tbParam.nS1},{10,2640},{20,3140},{30,5009},{40,6679},{45,6979}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		state_slowall_attack={{{1,15},{10,45},{20,50},{30,55},{40,60},{45,65}},{{1,18},{10,18*2.5},{20,18*3},{30,18*4},{31,18*4}}},
		missile_hitcount={{{1,5},{10,6},{20,7},{21,7}}},
		missile_range={9,0,9},
	},
	NgaMyChuong_150_2={ --月华倾泻子
		appenddamage_p= {{{1,150*FightSkill.tbParam.nS1},{10,250},{20,310}}},
		colddamage_v={
			[1]={{1,200*0.9*FightSkill.tbParam.nS1},{10,580},{20,1080},{30,1580},{40,2080},{45,2380}},
			[3]={{1,200*1.1*FightSkill.tbParam.nS1},{10,620},{20,1120},{30,1620},{40,2120},{45,2420}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_slowall_attack={{{1,5},{10,20},{20,30},{30,35},{40,40},{45,45}},{{1,18},{10,18*2.5},{20,18*3},{30,18*4},{31,18*4}}},
		missile_hitcount={{{1,6},{20,6}}},
		missile_range={1,0,1},
	},
	
		NgaMyKiem_150_1={ --冰霜绽放
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		colddamage_v={
			[1]={{1,900*0.7*0.9},{20,900*0.9},{21,900*FightSkill.tbParam.nSadd*0.9}},
			[3]={{1,900*0.7*1.1},{20,900*1.1},{21,900*FightSkill.tbParam.nSadd*1.1}}
		},
		state_slowall_attack={{{1,35},{20,65},{21,66}},{{1,45},{10,45},{11,45}}},
		seriesdamage_r={0},--={{{1,250},{10,250},{11,250}}},
		missile_hitcount={{{1,7},{10,7},{11,7}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
	},
	NgaMyKiem_150_2={ --冰霜绽放子
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		colddamage_v={
			[1]={{1,350*0.7*0.9},{20,350*0.9},{21,350*FightSkill.tbParam.nSadd*0.9}},
			[3]={{1,350*0.7*1.1},{20,350*1.1},{21,350*FightSkill.tbParam.nSadd*1.1}}
		},
		seriesdamage_r={0},--={{{1,250},{10,250},{11,250}}},
		missile_hitcount={{{1,5},{10,5},{11,5}}},
	},
	NgocTuyetTayTran_150_NMK={ --玉泉洗尘_130
		castspeed_v={{{1,24},{10,24},{12,27},{13,27}}},
		skill_statetime={{{1,18*20},{2,18*20}}},
	},
	NgaMyKiem_150_Buff={	--冰霜绽放BUFF
        allspecialstateresistrate={{{1,-50},{20,-250},{21,-260}}},
		skill_statetime={18*20},
	},
	
	
	
		ThuyYenDao_150_1={ --冰雀越枝
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		colddamage_v={
			[1]={{1,350*0.9*FightSkill.tbParam.nS1},{10,795},{20,1195},{30,1595},{40,1995},{45,2195}},
			[3]={{1,350*1.1*FightSkill.tbParam.nS1},{10,905},{20,1305},{30,1705},{40,2105},{45,2305}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,50},{20,100},{21,100}}},
		state_hurt_attack={{{1,5},{10,20},{20,25},{30,45},{40,50},{45,55}},{{1,18},{10,18*2},{20,18*2},{30,18*3},{31,18*3}}},
		state_slowall_attack={{{1,5},{10,15},{20,20},{30,40},{40,50},{45,55}},{{1,18},{10,18*2.5},{20,18*3},{30,18*4},{31,18*4}}},
		skill_startevent={{{1,1729},{20,1729}}},
		skill_showevent={{{1,1},{20,1}}},
		missile_hitcount={{{1,3},{20,3}}},
		missile_range={2,1,2},
	},
	ThuyYenDao_150_2={ --冰雀越枝子
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		colddamage_v={
			[1]={{1,750*0.9*FightSkill.tbParam.nS1},{10,1095},{20,1495},{30,1895},{40,2495},{45,2895}},
			[3]={{1,750*1.1*FightSkill.tbParam.nS1},{10,1205},{20,1605},{30,2005},{40,2605},{45,3005}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_slowall_attack={{{1,10},{10,30},{20,35},{30,55},{40,60},{45,65}},{{1,18},{10,18*2.5},{20,18*2.5},{30,18*4},{31,18*4}}},
		missile_hitcount={{{1,3},{20,3}}},
		missile_range={3,0,3},
	},

	ThuyYenDao_150_Buff={	--冰雀越枝子BUFF
        deadlystrikedamageenhance_p={{{1,10},{10,100},{11,100}}},
		skill_statetime={18*5},
	},
	
		ThuyYenChuong_150_1={ --水映曼秀
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		colddamage_v={
			[1]={{1,400*0.9*FightSkill.tbParam.nS1},{10,1060},{20,1760},{30,2460},{40,3160},{45,3460}},
			[3]={{1,400*1.1*FightSkill.tbParam.nS1},{10,1140},{20,1840},{30,2540},{40,3240},{45,3540}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		skill_flyevent={{{1,1732},{20,1732}},{{1,3},{2,3}}},
		skill_showevent={{{1,2},{20,2}}},
		missile_hitcount={{{1,5},{5,5},{10,6},{15,6},{20,7},{21,7}}},
	},
	ThuyYenChuong_150_2={ --水映曼秀子
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		colddamage_v={
			[1]={{1,225*0.9*FightSkill.tbParam.nS1},{10,602},{20,1002},{30,1402},{40,1802},{45,2002}},
			[3]={{1,225*1.1*FightSkill.tbParam.nS1},{10,847},{20,1247},{30,1647},{40,2047},{45,2247}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_slowall_attack={{{1,30},{10,50},{20,55},{30,60},{40,65},{45,70}},{{1,27},{10,18*2.5},{20,18*3},{30,18*5},{31,18*5}}},
		missile_hitcount={{{1,2},{10,3},{20,4},{21,4}}},
	},
	
	
			CaiBangBong_150_1={ --150 CBB
		appenddamage_p= {{{1,150*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,50*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		firedamage_v={
			[1]={{1,275*0.9*FightSkill.tbParam.nS1},{10,275*0.9},{20,275*0.9*FightSkill.tbParam.nS20},{21,275*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,275*1.1*FightSkill.tbParam.nS1},{10,275*1.1},{20,275*1.1*FightSkill.tbParam.nS20},{21,275*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		physicsenhance_p={{{1,0},{2,0}}},
		seriesdamage_r={{{1,0},{2,65},{10,265},{11,265}}},
		skill_deadlystrike_r={{{1,212},{20,212}}},
		state_weak_attack={{{1,5},{2,10},{10,15}},{{1,18*3},{10,18*3}}},
	},
	CaiBangBong150_BUFF={ --150 CBB BUFF
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,50},{20,50*FightSkill.tbParam.nS20},{21,50*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}},
		physicsenhance_p={{{1,66*FightSkill.tbParam.nS1},{10,66},{20,66*FightSkill.tbParam.nS20},{21,66*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}},
		seriesdamage_r={{{1,0},{2,65},{10,265},{11,265}}},
		state_weak_attack={{{1,15},{10,45},{20,50}},{{1,36},{20,54},{21,54}}},
		missile_hitcount={{{1,5},{5,6},{10,8},{15,9},{20,10},{21,10}}},
		missile_range={11,0,11},
	},
	
	CaiBangRong_150_1={ --150 CBR
		appenddamage_p= {{{1,70*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		firedamage_v={
			[1]={{1,350*0.9*FightSkill.tbParam.nS1},{10,815},{20,1315},{30,1815},{40,2315},{50,2515}},
			[3]={{1,350*1.1*FightSkill.tbParam.nS1},{10,885},{20,1385},{30,1885},{40,2385},{50,2585}}
			},
				seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		state_burn_attack={{{1,5},{10,35},{20,40},{30,50},{40,60},{50,65}},{{1,18},{10,18*3},{20,18*3.5},{30,18*4},{31,18*4}}},
		missile_hitcount={{{1,5},{10,5},{20,5},{21,5}}},
				missile_range={1,0,1},
		missile_speed_v={50},
	},
	CaiBangRong_150_2={ --龙抬头
		appenddamage_p= {{{1,70*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		firedamage_v={
			[1]={{1,2500*0.8*FightSkill.tbParam.nS1*0.3},{10,2300},{20,2530},{30,3795},{40,5060},{50,5692}},
			[3]={{1,2500*1.2*FightSkill.tbParam.nS1*0.3},{10,3450},{20,3795},{30,5692},{40,6600},{50,8538}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,2},{10,3},{20,4},{21,4}}},
	},

	CaiBangRong_150_Buff={	--龙游天地子BUFF
		decreaseskillcasttime={489, {{1,150}, {10, 150}}},
		skill_statetime={18*5},
	},
	
	ThienNhanDao_150_1={ --150 TNĐ Tật Hỏa Liêu Nguyên
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,150},{20,280}}},
		firedamage_v={
			[1]={{1,750*0.9*FightSkill.tbParam.nS1},{10,750*0.9},{20,750*0.9*FightSkill.tbParam.nS20},{21,750*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,750*1.1*FightSkill.tbParam.nS1},{10,750*1.1},{20,750*1.1*FightSkill.tbParam.nS20},{21,750*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		state_burn_attack={{{1,15},{20,30}},{{10,36},{20,36}}},
		skill_vanishedevent={{{1,1965},{20,1965}}},
		skill_showevent={{{1,8},{20,8}}},
	},
	ThienNhanDao_150_2={ --150 Tật Hỏa Liêu Nguyên tử 
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,150},{20,280}}},
		firedamage_v={
			[1]={{1,150*0.9*FightSkill.tbParam.nS1*2},{10,150*0.9*2},{20,150*0.9*FightSkill.tbParam.nS20*2},{21,150*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*2}},
			[3]={{1,150*1.1*FightSkill.tbParam.nS1*2},{10,150*1.1*2},{20,150*1.1*FightSkill.tbParam.nS20*2},{21,150*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*2}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_burn_attack={{{1,5},{20,25}},{{10,9},{20,9}}},
		missile_hitcount={{{1,3},{5,4},{10,5},{15,6},{20,7},{21,7}}},
	},
	
	ThienNhanKich_150_1={ --150 TN Kích Giang Hải Nộ Lan
		appenddamage_p= {{{1,120*FightSkill.tbParam.nS1},{10,200},{20,300}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		firedamage_v={
			[1]={{1,1000*0.9*FightSkill.tbParam.nS1},{10,1000*0.9},{20,1000*0.9*FightSkill.tbParam.nS20},{21,1000*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,1000*1.1*FightSkill.tbParam.nS1},{10,1000*1.1},{20,1000*1.1*FightSkill.tbParam.nS20},{21,1000*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,50},{20,100},{21,100}}},
		state_hurt_attack={{{1,15},{10,35},{20,50}},{{1,18},{20,18}}},
		state_burn_attack={{{1,15},{10,35},{20,40}},{{1,36},{20,54},{21,54}}},
		steallife_p={{{1,1},{20,10}},{{1,100},{20,100}}},
		stealmana_p={{{1,1},{20,10}},{{1,100},{20,100}}},
		missile_hitcount={{{1,3},{10,4},{20,5},{21,5}}},
	},
		ThienNhanThuong_Buff={ --150
		decreaseskillcasttime={847, {{1,150}, {10, 150}}},
		skill_statetime={18*3},
	},
	
			QuyThienDao_Tang1={ --Quy thiền đao 150
		appenddamage_p= {{{1,70*FightSkill.tbParam.nS1},{10,130},{20,230}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		physicsdamage_v={
			[1]={{1,750*0.9*FightSkill.tbParam.nS1},{10,750*0.9},{20,750*0.9*FightSkill.tbParam.nS20},{21,750*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,750*1.1*FightSkill.tbParam.nS1},{10,750*1.1},{20,750*1.1*FightSkill.tbParam.nS20},{21,750*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		skill_cost_v={{{1,10},{20,10},{21,10}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		state_hurt_attack={{{1,25},{10,45},{20,50}},{{1,18},{20,18}}},
		missile_hitcount={{{1,3},{10,5},{20,5},{21,5}}},
		-- addstartskill={1997, 1999, {{1,1}, {10, 10}}},
	},

	QuyThienDao_Tang2={ --quy thiền đao riêng 150
		appenddamage_p= {{{1,30*FightSkill.tbParam.nS1},{10,70},{20,150}}},
		physicsenhance_p={{{1,250*FightSkill.tbParam.nS1},{10,350},{20,450*FightSkill.tbParam.nS20}}},
		physicsdamage_v={
			[1]={{1,1000*0.9*FightSkill.tbParam.nS1},{10,1500*0.9},{20,2000*0.9*FightSkill.tbParam.nS20}},
			[3]={{1,1000*1.1*FightSkill.tbParam.nS1},{10,1500*1.1},{20,2000*1.1*FightSkill.tbParam.nS20}}
			},
		state_hurt_attack={{{1,20},{10,25},{20,30}},{{1,18},{20,18}}},
		missile_hitcount={{{1,3},{10,3},{20,3},{21,3}}},
	},
	
		ThieuLamBong_150_1={ --Vi Đà Hiển Chứ 150
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		physicsdamage_v={
			[1]={{1,750*0.9*FightSkill.tbParam.nS1},{10,750*0.9},{20,750*0.9*FightSkill.tbParam.nS20},{21,750*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,750*1.1*FightSkill.tbParam.nS1},{10,750*1.1},{20,750*1.1*FightSkill.tbParam.nS20},{21,750*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		skill_cost_v={{{1,10},{20,10},{21,10}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		state_hurt_attack={{{1,25},{10,45},{20,50}},{{1,18},{20,18}}},
		missile_hitcount={{{1,5},{5,6},{10,7},{15,8},{20,9},{21,9}}},
		-- addstartskill={1997, 1999, {{1,1}, {10, 10}}},
	},
	ThieuLamBong_150_2={ --Vi Đà Hiển Chứ _1 150
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsdamage_v={
			[1]={{1,750*0.9*FightSkill.tbParam.nS1},{10,750*0.9},{20,750*0.9*FightSkill.tbParam.nS20},{21,750*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},
			[3]={{1,750*1.1*FightSkill.tbParam.nS1},{10,750*1.1},{20,750*1.1*FightSkill.tbParam.nS20},{21,750*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_hurt_attack={{{1,15},{20,30}},{{1,18},{20,18}}},
		missile_hitcount={{{1,5},{5,6},{10,7},{15,8},{20,9},{21,9}}},
	},
	
		TVT_BaVuongTramKim_150={ --150
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		physicsdamage_v={
			[1]={{1,660*0.9*FightSkill.tbParam.nS1},{10,660*0.9},{20,660*0.9*FightSkill.tbParam.nS20},{21,660*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}},
			[3]={{1,660*1.1*FightSkill.tbParam.nS1},{10,660*1.1},{20,660*1.1*FightSkill.tbParam.nS20},{21,660*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,10},{20,10},{21,10}}},
		state_hurt_attack={{{1,15},{10,25},{20,30}},{{1,18},{20,18}}},
		addskilldamagep={2000, {{1,2},{20,50},{21,50}}},
	},
	

	TVT_BaVuongTramKimXa_150={ --霸王錾金远程伤害
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		physicsdamage_v={
			[1]={{1,660*0.9*FightSkill.tbParam.nS1},{10,660*0.9},{20,660*0.9*FightSkill.tbParam.nS20},{21,660*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}},
			[3]={{1,660*1.1*FightSkill.tbParam.nS1},{10,660*1.1},{20,660*1.1*FightSkill.tbParam.nS20},{21,660*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,5},{20,5}}},
	},
	
	TVC_TungHoanhBatHoang_150_1={ --150 TVC
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		physicsdamage_v={
			[1]={{1,250*0.9*FightSkill.tbParam.nS1},{10,250*0.9},{20,250*0.9*FightSkill.tbParam.nS20},{21,250*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}},
			[3]={{1,250*1.1*FightSkill.tbParam.nS1},{10,250*1.1},{20,250*1.1*FightSkill.tbParam.nS20},{21,250*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}}
			},
		skill_cost_v={{{1,10},{20,45},{21,45}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		state_hurt_attack={{{1,15},{10,25},{20,35}},{{1,18},{20,18}}},
		missile_hitcount={{{1,4},{20,4}}},
	},
	
		TVC_150_Buff={	--纵横四海BUFF
		damage_physics_resist={{{1,10},{10,50},{20,150},{21,157}}},
		damage_poison_resist={{{1,10},{10,50},{20,150},{21,157}}},
		damage_cold_resist={{{1,10},{10,50},{20,150},{21,157}}},
		damage_light_resist={{{1,10},{10,50},{20,150},{21,157}}},
		dynamicmagicshield_v={{{1,300},{10,800},{20,800}},25},
		skill_statetime={18*5},
	},
	
			MGC_150_1={ --驱虎式
		appenddamage_p= {{{1,70*FightSkill.tbParam.nS1},{10,120},{20,220}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		poisondamage_v={{{1,100*FightSkill.tbParam.nS1},{10,100},{20,100*FightSkill.tbParam.nS20},{21,100*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}},{{1,2*9},{20,2*9}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,27},{20,54},{21,54}}},
		state_hurt_attack={{{1,5},{10,55},{20,65},{30,68},{40,70},{45,75}},{{1,18*3.5},{20,18*3.5},{30,18*4},{40,18*4.5},{45,18*5}}},
		state_weak_attack={{{1,10},{10,20},{20,25}},{{1,36},{20,54},{21,54}}},
	},

	MGC_150_Xa={ --驱虎式远程伤害
		appenddamage_p= {{{1,80*FightSkill.tbParam.nS1},{10,80},{20,80*FightSkill.tbParam.nS20},{21,80*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd1}}},
		physicsenhance_p={{{1,15},{10,60},{20,110}}},
		poisondamage_v={{{1,100},{10,150},{20,250}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,5},{20,5}}},
	},
	MGK_KiemDangBatHoang_150={ --剑荡八荒
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		poisondamage_v={{{1,2*620*FightSkill.tbParam.nS1},{10,1432},{20,2353}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,150},{20,300},{21,300}}},
		state_weak_attack={{{1,25},{10,50},{20,64}},{{1,72},{20,72}}},
		state_hurt_attack={{{1,15},{10,15}},{{1,18*1.5},{20,18*1.5}}},
		skill_mintimepercast_v={{{1,1*18},{2,1*18}}},
		skill_mintimepercastonhorse_v={{{1,3*18},{2,3*18}}},
		missile_range={4,0,4},
		skill_vanishedevent={{{1,1438},{20,1438}}},
		skill_showevent={{{1,8},{20,8}}},
	},
	MGK_KiemDangBatHoang_150_Tu={ --剑荡八荒子
		appenddamage_p= {{{1,40*FightSkill.tbParam.nS1},{10,60},{20,80*FightSkill.tbParam.nS20}}},   --伤害次数减少54%，伤害伤害提升100%
		firedamage_v={
			[1]={{1,150*0.9*FightSkill.tbParam.nS1*2},{10,150*0.9*2},{20,150*0.9*FightSkill.tbParam.nS20*2},{21,150*0.9*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*2}},
			[3]={{1,150*1.1*FightSkill.tbParam.nS1*2},{10,150*1.1*2},{20,150*1.1*FightSkill.tbParam.nS20*2},{21,150*1.1*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*2}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_burn_attack={{{1,5},{20,25}},{{10,9},{20,9}}},
		missile_hitcount={{{1,3},{5,4},{10,5},{15,6},{20,7},{21,7}}},
	},
 NguDocDao_150_UHonPheAnh={ --幽魂噬影
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		poisondamage_v={{{1,50*FightSkill.tbParam.nS1},{10,57},{20,104},{30,294},{40,410},{45,468}},{{1,9*9},{20,9*9}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,50},{20,100},{21,100}}},
		state_hurt_attack={{{1,15},{10,25},{20,30},{30,45},{40,60},{45,65}},{{1,18},{20,18},{30,18*2},{40,18*3},{45,18*3}}},
		state_weak_attack={{{1,15},{10,45},{20,50}},{{1,36},{20,54}}},
		missile_hitcount={{{1,5},{10,5},{20,5},{21,5}}},
	},
	NguDocDao_150_UHonPheAnh_2={ --暗无天日
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		poisondamage_v={{{1,30*FightSkill.tbParam.nS1},{10,35},{20,39},{30,95},{40,127},{45,147}},{{1,9*9},{20,9*9}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,5},{20,5}}},
		skill_maxmissile={{{1,2},{20,2}}},
	},
	NguDocDao_150_UHonPheAnh_Buff={	--幽魂噬影BUFF
        	skilldamageptrim={{{1,-1},{10,-10}}},
		skill_statetime={18*5},
	},	
	
	NguDocChuong_150_UMinhQuyTrao_1={ --幽冥鬼爪
		appenddamage_p= {{{1,400*FightSkill.tbParam.nS1},{10,500},{20,700}}},
		poisondamage_v={{{1,250*FightSkill.tbParam.nS1},{10,288},{20,473}},{{1,5*9},{20,5*9}}},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		missile_hitcount={{{1,5},{5,6},{10,8},{15,9},{20,10},{21,10}}},
		missile_range={9,0,9},
	},
	NguDocChuong_150_UMinhQuyTrao_2={ --黑虎掏心
		appenddamage_p= {{{1,400*FightSkill.tbParam.nS1},{10,500},{20,700}}},
		poisondamage_v={{{1,200*FightSkill.tbParam.nS1},{10,200},{20,253}},{{1,5*9},{20,5*9}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		state_weak_attack={{{1,15},{10,45},{20,50}},{{1,36},{20,54},{21,54}}},
		missile_hitcount={{{1,5},{5,6},{10,8},{15,9},{20,10},{21,10}}},
		missile_range={11,0,11},
	},
	TrangThai_150_UMinhQuyTrao={	--幽冥鬼爪BUFF
        lifereplenish_p={{{1,-2},{20,-40},{21,-42}}},
		skill_statetime={18*5},
	},
	
	DMB_150_1={ --DMB 150 tích lịch cuồng nan
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,300},{20,400}}},
		poisondamage_v={{{1,45*1.2*FightSkill.tbParam.nS1},{10,45*1.2},{20,45*1.2*FightSkill.tbParam.nS20},{21,45*1.2*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},{{1,2*9},{20,2*9}}},
		physicsenhance_p={{{1,5},{10,100},{20,150},{30,190},{40,230},{45,250}}},
		skill_cost_v={{{1,150},{10,300},{11,300}}},
		skill_attackradius={750},		
		skill_maxmissile={{{1,2},{10,2},{11,2}}},
		missile_hitcount={{{1,2},{10,6},{11,6}}},
		missile_lifetime_v={1.5*18},
	},
	DMB_150_2={ --霹雳狂澜子2
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,300},{20,400}}},
		poisondamage_v={{{1,90*1.2*FightSkill.tbParam.nS1},{10,90*1.2},{20,90*1.2*FightSkill.tbParam.nS20},{21,90*1.2*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},{{1,2*9},{20,2*9}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,2},{10,6},{11,6}}},
	},
	DMB_150_3={ --霹雳狂澜子3
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,300},{20,400}}},
		poisondamage_v={{{1,45*1.2*FightSkill.tbParam.nS1},{10,45*1.2},{20,45*1.2*FightSkill.tbParam.nS20},{21,45*1.2*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},{{1,2*9},{20,2*9}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_hitcount={{{1,2},{10,6},{11,6}}},
	},
	
	DuongMonTien_150_1={ --khổng tước vũ 150 DMN
		appenddamage_p= {{{1,60*FightSkill.tbParam.nS1},{10,100},{20,200}}},
		poisondamage_v={{{1,50*FightSkill.tbParam.nS1},{10,50},{20,50*FightSkill.tbParam.nS20},{21,50*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},{{1,9*9},{20,9*9}}},
		skill_cost_v={{{1,5},{20,50},{21,50}}},
		state_hurt_attack={{{1,15},{20,40},{21,41}},{{1,18},{20,18}}},
		state_weak_attack={{{1,15},{10,45},{20,50},{21,51}},{{1,36},{20,54},{21,54}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		poisondamage_v={{{1,220},{10,303},{20,579},{30,892},{40,1190}},{{1,5*9},{20,5*9}}},
		missile_hitcount={{{1,5},{10,5},{20,5},{21,5}}},
	},
	DuongMonTien_150_2={ --孔雀翎子
		appenddamage_p= {{{1,60*FightSkill.tbParam.nS1},{10,100},{20,200}}},
		poisondamage_v={{{1,50*FightSkill.tbParam.nS1},{10,50},{20,50*FightSkill.tbParam.nS20},{21,50*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd}},{{1,9*9},{20,9*9}}},
		state_hurt_attack={{{1,15},{20,40},{21,41}},{{1,18},{20,18}}},
		state_weak_attack={{{1,15},{10,45},{20,50},{21,51}},{{1,36},{20,54},{21,54}}},
		missile_speed_v={40},
		missile_range={2,1,2},
		missile_hitcount={{{1,5},{10,5},{20,5},{21,5}}},
	},
	
		VoDangKhi_150={ --Cửu Cung Bát Quái 150 võ đang khí
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,100},{20,200}}},
		lightingdamage_v={
			[1]={{1,825*0.9*FightSkill.tbParam.nS1},{10,1442},{20,2742}},
			[3]={{1,825*1.1*FightSkill.tbParam.nS1},{10,1607},{20,2907}}
			},
		seriesdamage_r={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,100},{20,200},{21,200}}},
		state_stun_attack={{{1,12},{10,25},{20,35},{30,40},{40,45},{50,45}},{{1,18},{10,18*2},{20,18*2},{30,18*3},{31,18*3}}},
		missile_hitcount={{{1,5},{5,6},{10,8},{15,9},{20,10},{21,10}}},
	},
	
	VoDangKiem_150_1={ --无上剑道
		appenddamage_p= {{{1,50*FightSkill.tbParam.nS1},{10,130},{20,200}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		lightingdamage_v={
			[1]={{1,350*0.9*FightSkill.tbParam.nS1},{10,815},{20,2415}},
			[3]={{1,350*1.1*FightSkill.tbParam.nS1},{10,885},{20,2885}}
			},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,50},{20,100},{21,100}}},
		state_stun_attack={{{1,12},{10,30},{20,45},{30,60},{40,60},{50,75}},{{1,18},{10,18*4},{20,18*5},{30,18*5.5}}},
		state_hurt_attack={{{1,10},{10,15},{20,45},{30,60},{40,70},{50,85}},{{1,18},{10,18*3},{20,18*3},{30,18*4}}},
		skill_showevent={{{1,1},{20,1}}},
		missile_hitcount={{{1,3},{10,4},{20,5},{21,5}}},
	},
	VoDangKiem_150_2={ --无上剑道子
		state_stun_attack={{{1,1},{10,10},{20,15}},{{1,18},{20,18}}},
		missile_hitcount={{{1,3},{10,4},{20,5},{21,5}}},
	},
	
			ConLonDao_150={ --九天罡风
		appenddamage_p= {{{1,150*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		physicsenhance_p={{{1,100*FightSkill.tbParam.nS1},{10,156},{20,288}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,50},{20,100},{21,100}}},
		state_stun_attack={{{1,15},{10,40},{20,45},{30,60},{40,70},{50,80}},{{1,18},{10,18*2},{20,18*2},{30,18*3},{31,18*3}}},
		missile_hitcount={{{1,3},{10,3},{20,3},{21,3}}},
		missile_speed_v={60},
	},
	
		ConLonSet_150_1={ --天雷震岳
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		lightingdamage_v={
			[1]={{1,800*0.8},{10,1753},{20,2148},{30,2897},{40,3648},{50,4398}},
			[3]={{1,800*1.2},{10,2032},{20,2533},{30,3282},{40,4407},{50,4782}}
		},
		state_stun_attack={{{1,15},{10,30},{20,35},{30,50},{40,60},{50,70}},{{1,18},{10,18*3},{20,18*3},{30,18*3.5},{40,18*4},{50,18*4.5}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,5},{10,50},{20,100},{21,100}}},
		missile_hitcount={{{1,5},{10,5}}},
		skill_mintimepercast_v={0.5*18},
		skill_mintimepercastonhorse_v={2*18},
	},
	ConLonSet_150_2={ --天雷震岳_雷阵
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		lightingdamage_v={
			[1]={{1,800*0.8},{10,1115*0.9},{20,1465*0.9},{21,1465*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*0.9}},
			[3]={{1,800*1.2},{10,1115*1.1},{20,1465*1.1},{21,1465*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*1.1}}
		},
		state_stun_attack={{{1,15},{10,25},{20,30}},{{1,18},{20,18}}},
		missile_hitcount={{{1,5},{10,5}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		missile_range={3,0,3},
	},
	ConLonSet_150_3={ --天雷震岳子
		appenddamage_p= {{{1,200*FightSkill.tbParam.nS1},{10,250},{20,350}}},
		lightingdamage_v={
			[1]={{1,800*0.8},{10,1115*0.9},{20,1465*0.9},{21,1465*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*0.9}},
			[3]={{1,800*1.2},{10,1115*1.1},{20,1465*1.1},{21,1465*FightSkill.tbParam.nS20*FightSkill.tbParam.nSadd*1.1}}
		},
		state_stun_attack={{{1,15},{10,25},{20,30},{21,31}},{{1,18},{20,18}}},
		seriesdamage_r={0},--={{{1,100},{20,250},{21,250}}},
		skill_cost_v={{{1,5},{10,50},{20,100},{21,100}}},
		missile_hitcount={{{1,5},{10,5}}},
		addskilldamagep={192, {{1,2},{20,30},{21,35}},1},
		skill_mintimepercast_v={2*18},
		skill_mintimepercastonhorse_v={2*18},
	},
	
}
FightSkill:AddMagicData(tb) 

local tbSkill = FightSkill:GetClass("ConLonDao_150")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(181, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Cùng lúc thi triển:\n";
	szMsg = szMsg.."<color=green>[Ngạo Tuyết Tiếu Phong] "..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("VoDangKiem_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1552, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mỗi mục tiêu trúng đòn có <color=gold> xác suất<color> thi triển: \n";
	szMsg = szMsg.."<color=green>[Vô Cực Kiếm Đạo] "..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("NguDocDao_150_UHonPheAnh")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1440, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	local nCapDoSkil = tbInfo.nLevel
	local nTinhToan = nCapDoSkil*1
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Đánh trúng mục tiêu thi triển:\n";
	szMsg = szMsg.."<color=green>[Ám Vô Thiên Nhật] "..tbInfo.nLevel.." cấp <color>\nSau khi mục tiêu trúng đòn thi triển :\n<color=green>[U Hồn Phệ Ảnh]<color>:\nGây trạng thái bất lợi trừ lực tấn công cơ bản: <color=gold>"..nTinhToan.."%<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

	local tbSkill	= FightSkill:GetClass("NguDocChuong_150_UMinhQuyTrao_1");

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbInfo.nId, tbInfo.nLevel,me,1);
	local tbCCInfo		= KFightSkill.GetSkillInfo(1444, tbChildInfo.tbEvent.nLevel, me, 1)
	
	local tbMsg = {};
	local szMsg = "";
	szMsg = szMsg.."Trạng thái mục tiêu nhận được sau khi trúng đòn: \n";
	szMsg = szMsg.."<color=green>[U Minh Quỷ Trảo ]\n<color>";
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbCCInfo, 0);
	for i=1, #tbMsg do
		szMsg = szMsg.."    "..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	szMsg = szMsg.."\nThời gian duy trì tối đa <color=gold>5 giây<color>";
	return szMsg;
end;

local tbSkill = FightSkill:GetClass("MGC_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1977, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi đánh trúng mỗi mục tiêu, có <color=gold>xác suất<color> thi triển: \n";
	szMsg = szMsg.."<color=green>[Lưu Tinh Liên Hoàn Chùy] "..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("TVT_BaVuongTramKim_150")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(2000, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi đánh trúng mỗi mục tiêu, có <color=gold>50%<color> xác suất thi triển Tầng 2: \n";
	szMsg = szMsg.."<color=green>[Bá Vương Trạm Kim Xa] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("TVC_TungHoanhBatHoang_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1960, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mỗi mục tiêu trúng đòn, thi triển lên bản thân: \n";
	szMsg = szMsg.."<color=green>[Tung Hoành Bát Hoang] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("QuyThienDao_Tang1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1994, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi đánh trúng mỗi mục tiêu, có <color=gold>100%<color> xác suất thi triển: \n";
	szMsg = szMsg.."<color=green>[Quy Thiền Đao Pháp Cực] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("ThieuLamBong_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1998, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi đánh trúng mỗi mục tiêu, có <color=gold>100%<color> xác suất thi triển: \n";
	szMsg = szMsg.."<color=green>[Vi Đà Chử] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("ThienNhanKich_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1967, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mỗi mục tiêu trúng đòn có xác suất thi triển: \n";
	szMsg = szMsg.."<color=green>[Giang Hải Nộ Lan] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("CaiBangRong_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1975, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mỗi mục tiêu trúng đòn có <color=gold>xác suất<color> thi triển: \n";
	szMsg = szMsg.."<color=green>[Lục Long Đồng Du]"..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("CaiBangBong_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(845, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mỗi mục tiêu trúng đòn có <color=gold>20%<color> xác suất thi triển: \n";
	szMsg = szMsg.."<color=green>[Đả Cẩu Trận Pháp] Lv."..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end


local tbSkill	= FightSkill:GetClass("ThuyYenDao_150_1");
function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local tbMsg = {};
	local szMsg = "";
	szMsg = szMsg.."Tự xuất chiêu khi kẻ địch trúng đòn: \n";
	szMsg = szMsg.."<color=green>Băng Long Phá<color>\n";
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"..tostring(tbMsg[1]);
	return szMsg;
end;

local tbSkill	= FightSkill:GetClass("NgaMyKiem_150_1");

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbInfo.nId, tbInfo.nLevel,me,1);
	local tbCCInfo		= KFightSkill.GetSkillInfo(1727, tbChildInfo.tbEvent.nLevel, me, 1)
	
	local tbMsg = {};
	local szMsg = "";
	szMsg = szMsg.."Trạng thái mục tiêu nhận được sau khi trúng đòn: \n";
	szMsg = szMsg.."<color=green>[Băng Sương Điện Phóng ]\n<color>";
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbCCInfo, 0);
	for i=1, #tbMsg do
		szMsg = szMsg.."    "..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	szMsg = szMsg.."\nThời gian duy trì tối đa <color=gold>20 giây<color>";
	return szMsg;
end;

local tbSkill = FightSkill:GetClass("NgaMyChuong_150_1")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1723, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Khi mục tiêu trúng đòn sẽ thi triển: \n";
	szMsg = szMsg.."<color=green>[Nguyệt Hoa Khuynh Tả-Tử] "..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("DoanThiChi_150")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(1718, tbInfo.nLevel);
	local szMsg = ""	
	local tbMsg = {};
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo, 0);
	szMsg = szMsg.."\n"
	szMsg = szMsg.."Xuất chiêu đi kèm <color=green>[Thiên Long Chỉ]<color>\nXác xuất né tránh tuyệt đối duy trì <color=gold>2 giây<color>\n"
	szMsg = szMsg.."Khi mục tiêu trúng đòn sẽ thi triển: \n";
	szMsg = szMsg.."<color=green>[Thiên Long Thần Chỉ-Tử] "..tbInfo.nLevel.."<color>\n";
	for i=1, #tbMsg do
		szMsg = szMsg..""..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	return szMsg;
end

local tbSkill = FightSkill:GetClass("DoanThiKiem_150")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbInfo.nId, tbInfo.nLevel,me,1);
	local tbCCInfo1		= KFightSkill.GetSkillInfo(tbChildInfo.tbEvent.nStartSkillId, tbChildInfo.tbEvent.nLevel, me, 1);
	local tbCCInfo2		= KFightSkill.GetSkillInfo(tbCCInfo1.tbEvent.nStartSkillId, tbCCInfo1.tbEvent.nLevel, me, 1);
	local tbCCInfo3		= KFightSkill.GetSkillInfo(tbCCInfo2.tbEvent.nStartSkillId, tbCCInfo2.tbEvent.nLevel, me, 1);
	local tbCCInfo4		= KFightSkill.GetSkillInfo(tbCCInfo3.tbEvent.nStartSkillId, tbCCInfo3.tbEvent.nLevel, me, 1);
	local tbCCInfo5		= KFightSkill.GetSkillInfo(tbCCInfo4.tbEvent.nStartSkillId, tbChildInfo.tbEvent.nLevel);
	
	local szMsg	= string.format("<color=green>Phong Vân Kiếm<color>\nBăng công: <color=gold>%s-%s<color>\nTỉ lệ Làm chậm: <color=gold>%d%%<color>, duy trì <color=gold>%s giây<color>\nTấn công cơ bản: <color=gold>%s%%<color>\n<color=green>Kim Ngọc Kiếm<color>\nBăng công: <color=gold>%s-%s<color>\nTấn công cơ bản: <color=gold>%s%%<color>\n<color=green>Kinh Thiên Kiếm<color>\nTỉ lệ Gây bỏng: <color=gold>%d%%<color>, duy trì <color=gold>%s giây<color>\n<color=green>Khô Vinh Kiếm<color>\nTỉ lệ Làm suy yếu: <color=gold>%d%%<color>, duy trì <color=gold>%s giây<color>\n<color=green>Thiên Long Kiếm<color>\nTỉ lệ Làm choáng: <color=gold>%d%%<color>, duy trì <color=gold>%s giây<color>",
		
	tbCCInfo2.tbWholeMagic["colddamage_v"][1],
	tbCCInfo2.tbWholeMagic["colddamage_v"][3],
	tbCCInfo2.tbWholeMagic["state_slowall_attack"][1],
	FightSkill:Frame2Sec(tbCCInfo2.tbWholeMagic["state_slowall_attack"][2]),
	tbCCInfo2.nAppenDamageP,

	tbCCInfo5.tbWholeMagic["colddamage_v"][1],
	tbCCInfo5.tbWholeMagic["colddamage_v"][3],
	tbCCInfo5.nAppenDamageP,
		
	tbCCInfo1.tbWholeMagic["state_burn_attack"][1],
	FightSkill:Frame2Sec(tbCCInfo1.tbWholeMagic["state_burn_attack"][2]),
	
	tbCCInfo3.tbWholeMagic["state_weak_attack"][1],
	FightSkill:Frame2Sec(tbCCInfo3.tbWholeMagic["state_weak_attack"][2]),
		
	tbCCInfo4.tbWholeMagic["state_stun_attack"][1],
	FightSkill:Frame2Sec(tbCCInfo4.tbWholeMagic["state_stun_attack"][2]));
	return szMsg;
end
