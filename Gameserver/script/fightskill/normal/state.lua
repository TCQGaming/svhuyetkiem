local tb	= {
	zilsongtamphap={ --??????
		lifemax_v={{{1,2500},{2,2800}}},
		adddefense_v={{{1,40},{2,50}}},
	},
	zilsongdzaophap={ --??????
		lifemax_v={{{1,2500},{2,2800}}},
		adddefense_v={{{1,40},{2,50}}},
		skilldamageptrim={{{1,5},{2,6}}},
		dynamicmagicshield_v={{{1,50},{2,60}},10},
		defencedeadlystrikedamagetrim={{{1,10},{2,15}}},
	},	
	
	
	
	
	--����buff
	noobbuff={
		lifemax_p={{{1,5},{2,8},{3,12},{4,16},{5,20},{6,25},{7,30},{8,36},{9,43},{10,50}}},
		lifemax_v={{{1,60},{2,96},{3,144},{4,192},{5,240},{6,300},{7,360},{8,432},{9,516},{10,600}}},
		damage_all_resist={{{1,10},{2,16},{3,23},{4,31},{5,40},{6,50},{7,61},{8,73},{9,86},{10,100}}},
		autoskill={{{1,106},{2,106}},{{1,1},{2,2}}},
		skill_statetime={18*90*60},
	},
	noobbuff_child={
		dynamicmagicshield_v	={{{1,99999},{10,99999}},{{1,85},{10,85}}},
		posionweaken			={{{1,99999},{10,99999}},{{1,85},{10,85}}},
		skill_statetime={18*10},
	},
	
	--Խ�ϰ�ĳbuff
	vn_some_state={
		lifemax_p=	{{{1,5},{2,10}}},
		manamax_p=	{{{1,5},{2,10}}},
	},

--�չ�ת�������й���
	changeseriesdammage={
		magic_turnphysicaldammage={{{1,80},{2,80}}},
		skill_statetime={18*60*60*2},
	},

	enhance_exp={
		expenhance_p={{{1,10},{2,20}}},
		skill_statetime={18}
	},
	
	enhance_luck={
		lucky_v={{{1,5},{2,10},{3,2},{4,5},{5,9},{6,14},{7,20}}},
		skill_statetime={18*60*30}
	},
	enhance_exp_mod={
		expenhance_p={{{1,10},{2,20}}},
		skill_statetime={18*60*30}		
	},
	
	enhance_luck_mod={
		lucky_v={{{1,5},{2,10},{3,2},{4,5},{5,9},{6,14},{7,20}}},
		skill_statetime={18*60*30}
	},
	pray_exp={
		expenhance_p={{{1,10},{2,15},{3,20},{4,30},{5,50}}},
		skill_statetime={18}
	},
	
	pray_luck={
		lucky_v={{{1,10},{2,15},{3,20},{4,30},{5,50}}},
		skill_statetime={18*60*30}
	},
	
	addtion_exp={
		skillexpaddtionp={{{1,100},{2,150}}},
		skill_statetime={18}
	},
	
	open_xiuwei={
		expxiuwei_v={0},
		skill_statetime={18}
	},
	lockstate={
		locked_state ={--�Ƿ����ƶ�,ʹ�ü���,ʹ����Ʒ
			[1] = {{1,1},{10,1}},
			[2] = {{1,0},{10,0}},
			[3] = {{1,0},{10,0}},
			},
	},  
	state_exp={
		expenhance_p={{{1,5},{2,10}}},
	},
	npc_resistseriesrate={
		state_hurt_resistrate={{{1,10},{10,100},{20,180}}},						
		state_weak_resistrate={{{1,10},{10,100},{20,180}}},					
		state_slowall_resistrate={{{1,10},{10,100},{20,180}}},						
		state_burn_resistrate={{{1,10},{10,100},{20,180}}},		
		state_stun_resistrate={{{1,10},{10,100},{20,180}}},	
	},
	npc_resistseriestime={
		state_hurt_resisttime={{{1,10},{10,100},{20,180}}},						
		state_weak_resisttime={{{1,10},{10,100},{20,180}}},					
		state_slowall_resisttime={{{1,10},{10,100},{20,180}}},						
		state_burn_resisttime={{{1,10},{10,100},{20,180}}},		
		state_stun_resisttime={{{1,10},{10,100},{20,180}}},				
	},
	npc_ignoreseriesstate={
	ignoredebuff = {{{1,32767},{10,32767}}},
	--[[
		state_hurt_ignore={1},
		state_weak_ignore={1},
		state_slowall_ignore={1},
		state_burn_ignore={1},
		state_stun_ignore={1},
		state_fixed_ignore={1},
		state_palsy_ignore={1},
		--state_slowrun_ignore={1},
		--state_freeze_ignore={1},
		state_confuse_ignore={1},
		state_knock_ignore={1},
		state_drag_ignore={1},
		--state_silence_ignore={1},--ħ������̫��,ɾ�� ]]
	},
	longtimefood={
		fastlifereplenish_v={{{1,15},{2,30},{3,45},{4,60},{5,75},{6,60},{7,75}}},
		fastmanareplenish_v={{{1,15},{2,30},{3,45},{4,60},{5,75},{6,60},{7,75}}},
		skill_statetime={{{1,18*60*30},{5,18*60*30},{6,18*60*60*24*30},{7,18*60*60*24*30}}},
	},
	noob_lifereplenish={
		fastlifereplenish_v={999},
		skill_statetime={{{1,18*60*30},{5,18*60*30}}},
	},
	mapprotect={
		protected={1},
	},
	--װ����������
	tianyuanxinfa={ --�����ƽ��·�
		subexplose={{{1,80},{2,85}}},
		damage_all_resist={{{1,35},{2,45}}},
	},
	tongweixianhua={ --����ñ��
		autoskill={{{1,32},{2,32}},{{1,1},{2,2}}},
		skill_statetime={{{1,-1},{2,-1}}}
	},
	tongweixianhua_child1={ --����ñ��_����
		npcdamageadded={{{1,15},{2,20}}},
	},
	tongweixianhua_child2={ --����ñ��_����
		npcdamageadded={{{1,35},{2,50}}},
		lifemax_p={{{1,30},{2,40}}},
		manamax_p={{{1,30},{2,40}}},
	},
	bootskill={ --����/�ƽ�Ь��
		autoskill={{{1,51},{2,51}},{{1,1},{2,2}}},
		skill_statetime={{{1,-1},{2,-1}}}
	},
	bootskill_team={ --����/�ƽ�Ь��_����
		fastwalkrun_p={{{1,10},{2,10}}},
		seriesenhance={{{1,50},{2,100}}},
		seriesabate={{{1,50},{2,100}}},
	},
	bootskill_self={ --����/�ƽ�Ь��_����
		fastwalkrun_p={{{1,10},{2,20}}},
		seriesenhance={{{1,300},{2,500}}},
		seriesabate={{{1,300},{2,500}}},
	},
	cuffskill_self={ --����/�ƽ���
		staminareplenish_v={{{1,50},{2,100}}},
		allspecialstateresistrate={{{1,100},{2,245}}},
	},
	zixiashengong={ --�߼�����
		allspecialstateresisttime={{{1,100},{2,245},{3,500}}},
		seriesenhance={{{1,0},{2,FightSkill.IVER_nZiXiaShenGongSeriersAbate},{3,FightSkill.IVER_nZiXiaShenGongSeriersAbate+200}}},
		seriesabate={{{1,0},{2,FightSkill.IVER_nZiXiaShenGongSeriersAbate},{4,FightSkill.IVER_nZiXiaShenGongSeriersAbate+200}}},
	},
	tianxiashengong={ --�����޵�
		autoskill={{{1,52},{2,52}},{{1,1},{2,1}}},
		skill_statetime={{{1,-1},{2,-1}}},
	},
	tianxiashengong_child={ --�����޵�
		prop_invincibility={1},
		defense_dummy = {1},
		skill_statetime={{{1,18*5},{2,18*5}}},
	},
	
	xixasuitskill={ --������װ����
		autoskill={{{1,111},{2,111}},{{1,1},{2,2}}},
		skill_statetime={{{1,-1},{2,-1}}}
	},
	xixasuitskill_child1={ --�������״̬
		removestate={{{1,1996},{2,1996}}},--��ʼʱ�������ԭbuff
	},
	xixasuitskill_child2={ --����buff
		--redeivedamage_dec_p2={{{1,7},{2,7}}},
		superposemagic={{{1,14},{10,14}}},
		missile_missrate={{{1,50},{2,50}}},
		skill_statetime={{{1,18*5},{2,18*5}}},
	},
	
	dispute_defend={
		lifemax_p={{{1,5},{2,8},{3,12},{4,16},{5,20},{6,25},{7,30},{8,36},{9,43},{10,50}}},
		lifemax_v={{{1,60},{2,96},{3,144},{4,192},{5,240},{6,300},{7,360},{8,432},{9,516},{10,600}}},
		damage_all_resist={{{1,10},{2,16},{3,23},{4,31},{5,40},{6,50},{7,61},{8,73},{9,86},{10,100}}},
		addphysicsdamage_p={{{1,20},{2,32},{3,46},{4,62},{5,80},{6,100},{7,122},{8,146},{9,172},{10,200}}},
		addphysicsmagic_p={{{1,20},{2,32},{3,46},{4,62},{5,80},{6,100},{7,122},{8,146},{9,172},{10,200}}},
		skill_statetime={18}
	},
	
	chuzhanshachang={
		lifemax_p={{{1,5},{2,8},{3,12},{4,16},{5,20},{6,25},{7,30},{8,36},{9,43},{10,50}}},
		lifemax_v={{{1,60},{2,96},{3,144},{4,192},{5,240},{6,300},{7,360},{8,432},{9,516},{10,600}}},
		damage_all_resist={{{1,10},{2,16},{3,23},{4,31},{5,40},{6,50},{7,61},{8,73},{9,86},{10,100}}},
		addphysicsdamage_p={{{1,20},{2,32},{3,46},{4,62},{5,80},{6,100},{7,122},{8,146},{9,172},{10,200}}},
		addphysicsmagic_p={{{1,20},{2,32},{3,46},{4,62},{5,80},{6,100},{7,122},{8,146},{9,172},{10,200}}},
		skill_statetime={18}
	},
	
	--����ͷ�μ��ܣ���������
	ignoreattack_skill={
		ignoreattack={
			[1]={	--(lvl�Լ�-���ֵȼ�)*�ɳ�ֵ
				{1, (3-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{2, (4-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{3, (5-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{4, (6-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{5, (7-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{6, (8-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue}, 
				{7, (9-FightSkill.tbParam.nTitleLevel)*FightSkill.tbParam.nTitleGrowValue},
				},	
			[2]={	--�ȼ����� =  [100+(lvl�Լ�-���ֵȼ�)^2*c] /100
				{1, 100+((3-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{2, 100+((4-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{3, 100+((5-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{4, 100+((6-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{5, 100+((7-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{6, 100+((8-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				{7, 100+((9-FightSkill.tbParam.nTitleLevel)^FightSkill.tbParam.nTitleLevelPower)*FightSkill.tbParam.nTitleLevelAdjust}, 
				},	
			[3]={{1, 4}, {6, 4}},	--��ʼֵ
			},
	},
	chopskill={ --��ӡ���Թ����ü���
		autoskill={{{1,33},{2,33}},{{1,1},{2,2}}},
		skill_statetime={{{1,-1},{2,-1}}}
	},
	chopskill_team={ --��ӡ���Թ����ü���_����
		missile_hitcount			={{{1,10},{2,10},{8,10}}},
		skilldamageptrim			={{{1, 5*0.5},{2,10*0.5},{8,10*0.5}}},
		allseriesstateresistrate	={{{1,30*0.5},{2,50*0.5},{8,50*0.5}}},
		lifemax_p					={{{1,30*0.5},{2,50*0.5},{8,50*0.5}}},
		manamax_p					={{{1,30*0.5},{2,50*0.5},{8,50*0.5}}},
		seriesstate_added			={{{1,30*0.5},{2,50*0.5},{8,50*0.5}}},
	},
	chopskill_self={ --��ӡ���Թ����ü���_����
		skilldamageptrim			={{{1, 5},{2,10},{8,10}}},
		allseriesstateresistrate	={{{1,30},{2,50},{8,50}}},
		lifemax_p					={{{1,30},{2,50},{8,50}}},
		manamax_p					={{{1,30},{2,50},{8,50}}},
		seriesstate_added			={{{1,30},{2,50},{8,50}}},
	},

-------------------����װ������-------------
	xkd_avtive_equip={ --buff����װ������
		skill_activeequipattrib ={{{1,1},{2,2}}},
	},
	armor_reduce_speed={ -- װ���;ö��½����ٶ�
		magic_item_abrade_p={{{1,10},{2,20}}},
	},
}

FightSkill:AddMagicData(tb)

local tbSkill	= FightSkill:GetClass("tongweixianhua");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local tbChildInfo2	= KFightSkill.GetSkillInfo(tbChildInfo.tbEvent.nStartSkillId, tbChildInfo.tbEvent.nLevel);
	local szMsg	= string.format("\nC��ch %s giay thi tri?n: <color=green>Th?ng Vi Hi?n H��a<color>\n<color=blue>Hi?u qu? b?n than:<color>\nS��t th??ng qu��i: +<color=gold>%s%%<color>\nSinh l?c t?i ?a: +<color=gold>%s%%<color>\nN?i l?c t?i ?a: +<color=gold>%s%%<color>\n<color=blue>Hi?u qu? ??ng ??i:<color>\nS��t th??ng qu��i: +<color=gold>%s%%<color>\nDuy tr�� <color=gold>%s giay<color>",
		FightSkill:Frame2Sec(tbAutoInfo.nPerCastTime),
		tbChildInfo2.tbWholeMagic["npcdamageadded"][1],
		tbChildInfo2.tbWholeMagic["lifemax_p"][1],
		tbChildInfo2.tbWholeMagic["manamax_p"][1],
		tbChildInfo.tbWholeMagic["npcdamageadded"][1],
		FightSkill:Frame2Sec(tbChildInfo.nStateTime));
	return szMsg;
end;

local tbSkill	= FightSkill:GetClass("bootskill");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local tbChildInfo2	= KFightSkill.GetSkillInfo(tbChildInfo.tbEvent.nStartSkillId, tbChildInfo.tbEvent.nLevel);
	local szMsg	= string.format("\nC��ch %s giay thi tri?n: <color=green>Du Long Chan Kh��<color>\n<color=blue>Hi?u qu? b?n than:<color>\nT?c ?? di chuy?n: +<color=gold>%s%%<color>\nC??ng h��a t??ng kh?c ng? h��nh: +<color=gold>%s<color>\nNh??c h��a t??ng kh?c ng? h��nh: +<color=gold>%s<color>\n<color=blue>Hi?u qu? ??ng ??i:<color>\nT?c ?? di chuy?n: +<color=gold>%s%%<color>\nC??ng h��a t??ng kh?c ng? h��nh: +<color=gold>%s<color>\nNh??c h��a t??ng kh?c ng? h��nh: +<color=gold>%s<color>\nDuy tr�� <color=gold>%s giay<color>",
		FightSkill:Frame2Sec(tbAutoInfo.nPerCastTime),
		tbChildInfo2.tbWholeMagic["fastwalkrun_p"][1],
		tbChildInfo2.tbWholeMagic["seriesenhance"][1],
		tbChildInfo2.tbWholeMagic["seriesabate"][1],
		tbChildInfo.tbWholeMagic["fastwalkrun_p"][1],
		tbChildInfo.tbWholeMagic["seriesenhance"][1],
		tbChildInfo.tbWholeMagic["seriesabate"][1],
		FightSkill:Frame2Sec(tbChildInfo.nStateTime));
	return szMsg;
end;

local tbSkill	= FightSkill:GetClass("chopskill");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local tbChildInfo2	= KFightSkill.GetSkillInfo(tbChildInfo.tbEvent.nStartSkillId, tbChildInfo.tbEvent.nLevel);
	
	local tb = {
			"T? l? gay th? th??ng: +<color=gold>",
			"T? l? suy nh??c: +<color=gold>",
			"T? l? l��m ch?m: +<color=gold>",
			"T? l? b?ng: +<color=gold>",
			"T? l? cho��ng: +<color=gold>",
			"T? l? hi?u qu? ng? h��nh: +<color=gold>",
		};
	local nSeries = me.nSeries;
	if (nSeries >  6 or nSeries <=0) then
		nSeries = 6;
	end;
	
	local szMsg1 = tb[nSeries] .. tbChildInfo2.tbWholeMagic["seriesstate_added"][1] .. "<color>";
	local szMsg2 = tb[nSeries] .. tbChildInfo.tbWholeMagic["seriesstate_added"][1] .. "<color>";
	
	local szMsg	= string.format("\n<color=blue>Hi?u qu? b?n than:<color>\nPh��t huy l?c t?n c?ng c? b?n: +<color=gold>%s%%<color>\nX��c su?t tr?ng th��i ng? h��nh: -<color=gold>%s<color>\nT? l? sinh m?ng: +<color=gold>%s%%<color>\nT? l? n?i l?c: +<color=gold>%s%%<color>\n%s\n<color=blue>Hi?u qu? ??ng ??i:<color>\nPh��t huy l?c t?n c?ng c? b?n: +<color=gold>%s%%<color>\nX��c su?t tr?ng th��i ng? h��nh: -<color=gold>%s<color>\nT? l? sinh l?c: +<color=gold>%s%%<color>\nT? l? n?i l?c: +<color=gold>%s%%<color>\n%s\nS? m?c ti��u ?nh h??ng l?n nh?t: <color=gold>%s<color>\nDuy tr�� <color=gold>%s giay<color>",
		tbChildInfo2.tbWholeMagic["skilldamageptrim"][1],
		tbChildInfo2.tbWholeMagic["allseriesstateresistrate"][1],
		tbChildInfo2.tbWholeMagic["lifemax_p"][1],
		tbChildInfo2.tbWholeMagic["manamax_p"][1],
		szMsg1,
		tbChildInfo.tbWholeMagic["skilldamageptrim"][1],
		tbChildInfo.tbWholeMagic["allseriesstateresistrate"][1],
		tbChildInfo.tbWholeMagic["lifemax_p"][1],
		tbChildInfo.tbWholeMagic["manamax_p"][1],
		szMsg2,
		tbChildInfo.tbWholeMagic["missile_hitcount"][1],
		FightSkill:Frame2Sec(tbChildInfo.nStateTime));
	return szMsg;
end;

local tbSkill	= FightSkill:GetClass("tianxiashengong");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local szMsg	= string.format("T? l? tri?n khai khi s?p h?n m��: <color=gold>%d%%<color>\nKh?ng ch?u b?t c? s��t th??ng n��o, duy tr�� <color=Gold>%s giay<color>\nTh?i gian gi?n c��ch: <color=Gold>%s giay<color>",
		tbAutoInfo.nPercent,
		FightSkill:Frame2Sec(tbChildInfo.nStateTime),
		FightSkill:Frame2Sec(tbAutoInfo.nPerCastTime));
	return szMsg;
end;

local tbSkill = FightSkill:GetClass("changeseriesdammage")

function tbSkill:GetExtraDesc(tbInfo)
	if (not tbInfo) then
		return "";
	end

	local szMsg	= string.format("<color=gray>(?ang trong tr?ng th��i n?u d��ng l?n n?a s? ?��ng k? n?ng)<color>");
	return szMsg;
end

local tbSkill	= FightSkill:GetClass("noobbuff");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local szMsg	= string.format("?????50%%?????:\n    <color=green>????<color>\n    ???????<color=Gold>%s%%<color>,??<color=Gold>%s?<color>\n    ??????:<color=Gold>%s?<color>",
		tbChildInfo.tbWholeMagic["dynamicmagicshield_v"][2],
		FightSkill:Frame2Sec(tbChildInfo.nStateTime),
		FightSkill:Frame2Sec(tbAutoInfo.nPerCastTime));
	return szMsg;
end;

local tbSkill	= FightSkill:GetClass("xixasuitskill");

function tbSkill:GetAutoDesc(tbAutoInfo, tbSkillInfo)
	local tbChildInfo	= KFightSkill.GetSkillInfo(tbAutoInfo.nSkillId, tbAutoInfo.nSkillLevel);
	local tbChildInfo2 = KFightSkill.GetSkillInfo(1996, tbAutoInfo.nSkillLevel);
	
	local tbMsg = {};
	local szMsg = "";
	--szMsg = szMsg.."<color=green>???<color>\n";
	szMsg = szMsg.."?????????????????:\n";
	FightSkill:GetClass("default"):GetDescAboutLevel(tbMsg, tbChildInfo2, 0);
	for i=1, #tbMsg do
		szMsg = szMsg.."    "..tostring(tbMsg[i])..(i ~= #tbMsg and "\n" or "");
	end
	--szMsg = szMsg.."\n<color=gold>???????????<color>";
	return szMsg;
end;
