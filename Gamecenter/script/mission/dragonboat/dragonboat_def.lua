-- 文件名　：dragonboat_def.lua
-- 創建者　：sunduoliang
-- 創建時間：2009-05-04 16:41:51
-- 描  述  ：


Esport.DragonBoat = Esport.DragonBoat or {};
local DragonBoat = Esport.DragonBoat;

DragonBoat.TSK_GROUP		= 2064;
DragonBoat.TSK_RANK			= 14;	--排名
DragonBoat.TSK_ATTEND_COUNT		= 15;	--次數
DragonBoat.TSK_ATTEND_COUNT_EX	= 16;	--額外次數
DragonBoat.TSK_EXCHANGE_COUNT	= 17;	--每天換取額外次數
DragonBoat.TSK_EXCHANGE_DAY		= 18;	--每天換取額外次數
DragonBoat.TSK_ATTEND_DAY		= 19;	--第一次記錄天數;
DragonBoat.TSK_MERCHANT_COUNT	= 20;	--完成商會輪數，可領取龍舟原型數量﹔
DragonBoat.TSK_ITEM_ZONGZIEXP_COUNT	= 21;	--使用粽子數量﹔最多100個﹔
DragonBoat.TSK_ATTEND_COUNT_SUM	= 22;	--累計參加次數﹔
DragonBoat.TSK_AWARD_FINISH		= 23;	--獎勵標志﹔

DragonBoat.DEF_EXCHANGE_MAX		= 2;	--每天換取額外次數;最大4次﹔
DragonBoat.DEF_PLAYER_LEVEL		= 60;	--60級才能參加
DragonBoat.DEF_PLAYER_MAXCOUNT	= 14;	--累計最大次數;
DragonBoat.DEF_PLAYER_PRECOUNT	= 2;	--累計最大次數;


DragonBoat.DEF_STATE ={
	DrangonBoat.IVER_nRaceBegin,
	DrangonBoat.IVER_nRacetEnd,
	DrangonBoat.IVER_nRewardBegin,
	DrangonBoat.IVER_nRewardEnd,
};

--龍舟屬性
DragonBoat.GEN_WEAR		  	= 1;
DragonBoat.GEN_SKILL_ATTACK = {2,3};
DragonBoat.GEN_SKILL_DEFEND = {4,5};
DragonBoat.DEF_FINISH_RANK 	= 1000000;

DragonBoat.MAP_POS_START = {{1360,3439},{1363,3442},{1367,3445}};	--開始點的坐標

DragonBoat.ITEM_BOAT_ID	 = {18,1,327}; --龍舟Id
DragonBoat.ITEM_ZONGZI_ID= {18,1,326,4}; --葫蘆香溪粽Id
DragonBoat.ITEM_ORG_BOAT_ID= {18,1,329,1}; --龍舟原型

DragonBoat.AWARD_REPUTE = 
{
	[1] = 8,	--第一名5點
	[2] = 6,	--第二名3點
	[3] = 4,	--第三名3點
	[4] = 3,
	[5] = 2,
	[6] = 2,
	[7] = 1,
	[8] = 1,
}

DragonBoat.PRODUCT_SKILL = {
	
	--攻擊性
	[1] = {
		--技能Id，名稱，描述，改造龍舟等級,需要綁定銀兩
		{1363, "履冰", "使目標遲緩5秒，定點攻擊。",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1364, "暗礁", "使目標眩暈2秒，定點攻擊。",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1365, "掀浪", "使目標定身3秒，定點攻擊。",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1366, "漩渦", "使目標混亂2秒，定點攻擊。",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
	},
	
	--防御性
	[2] = {
		--技能Id，名稱，描述，改造龍舟等級,需要綁定銀兩
		{1372, "石膚", "受定身及減速效果幾率減少40%",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1373, "龍心", "受混亂及減速效果幾率減少40%",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1374, "海魂", "受眩暈及減速效果幾率減少40%",{[1]=1,[2]=1,[3]=1,[4]=1}, 15000},
		{1375, "逆鱗", "受所有負面效果幾率減少30%",{[4]=1}, 30000},
	},
};

DragonBoat.PRODUCT_BOAT = {
	--耐久，攻擊改造，防御改造，是否可重造
	[1] = {10,2,0,{1383,1}},	--1級,15耐久，2次攻擊性改造，0次防御行改造，變身技能
	[2] = {10,1,1,{1383,2}},	--2級,15耐久，1次攻擊性改造，1次防御行改造，變身技能
	[3] = {10,0,2,{1383,3}},	--3級,15耐久，0次攻擊性改造，2次防御行改造，變身技能
	[4] = {10,2,1,{1383,4}},	--4級,15耐久，2次攻擊性改造，1次防御行改造，變身技能
}
DragonBoat.CALLNPC_TYPE	= {
	--召喚npc類型 = Id, 概率
	[1]	= {3649, 30}, --秘印
	[2] = {3650, 25}, --巨綜
	[3] = {3644, 45}, --天罰
}

DragonBoat.SKILL_ITEM_LIST = {
	[1] = {
		--主動技能
		{1376, 4},
		{1377, 4},
		{1378, 4},
		{1379, 4},
		{1380, 4},
		{1381, 4},
	},
	[2] = {
		--負面狀態,粽子
		{1389, 3},
		{1385, 3},
		{1386, 3},
		{1387, 3},
		{1388, 3},
	},
	[3] = {
		--龍舟機關技能
		{1367, 2},
		{1368, 2},
		{1369, 2},
		{1370, 2},
		{1371, 2},
	},
	[4] = {
		--玄晶
		{18, 1, 114, 4},
		{18, 1, 114, 5},
		{18, 1, 114, 6},
		{18, 1, 114, 7},
	},
	[5] = {
		--天罰負面狀態
		{1385, 11},	--減速
		{1386, 11},	--暈
		{1387, 11},  --定
		{1388, 11},  --亂
	},
}


--玄晶概率
DragonBoat.SKILL_ITEM_GET_RATE = {
	[4] = {
		[1] = 6490,
		[2] = 3000,
		[3] = 500,
		[4] = 10
	};
}

--巨粽子幾率
DragonBoat.SKILL_ITEM_RATE = {
	--概率表﹔ {上面那種} = [概率]﹔
	[1] = 60,
	[2] = 30,
	[3] = 0,
	[4] = 10,
}

DragonBoat.MIS_LIST 	= 
{	
	{"PkToPkStart", 	Env.GAME_FPS * 10, 	"OnGameStart"},	--准備時間 10秒
	{"PkStartToEnd", 	Env.GAME_FPS * 590, "OnGameOver"},	--比賽時間 600秒
};
DragonBoat.MIS_UI 	= 
{
	[1] = {"<color=green>比賽開始剩余時間：<color=white>%s<color>"};
	[2] = {"<color=green>比賽剩余時間：<color=white>%s<color>"};
};


--單場獎勵
DragonBoat.AWARD_ITEM = 
{
	[1] = {18, 1, 328, 1},	--箱子
	[2] = {18, 1, 328, 2},	--箱子
	[3] = {18, 1, 328, 2},	--箱子
	[4] = {18, 1, 328, 3},	--箱子
	[5] = {18, 1, 328, 3},	--箱子
	[6] = {18, 1, 114, 5},	--
	[7] = {18, 1, 114, 5},	--
	[8] = {18, 1, 114, 5},	--
}

--最終排名獎勵
DragonBoat.AWARD_FINISH = 
{
	{10,  {{18,1,114,10}} },
	{100, {{18,1,114,9},{18,1,114,9}} },
	{500, {{18,1,114,9}} },
	{1500,{{18,1,114,8},{18,1,114,8}} },
	{3000,{{18,1,114,8}} },
}
