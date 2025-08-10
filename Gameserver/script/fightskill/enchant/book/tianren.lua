Require("\\script\\fightskill\\enchant\\enchant.lua");

local tb	=
{
	biyuefeixingadd =
	{
		{
			RelatedSkillId = 787,--幻影追魂枪&子
			magic =
			{
				missile_range =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,1}, {10, 1}}},
					value3 = {SkillEnchant.OP_ADD, {{1,1}, {10, 1}}},
				},
			},
		},

		{
			RelatedSkillId = 492,--幻影追魂枪
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {20, -18*10}}},
				},
				skill_mintimepercastonhorse_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {20, -18*10}}},
				},
			},
		},

		{
			RelatedSkillId = 148,
			magic =
			{
				missile_range =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,2}, {10, 4}, {11, 4}}},
					value3 = {SkillEnchant.OP_ADD, {{1,2}, {10, 4}, {11, 4}}},
				},
			},
		},
	},
	zhanrenadvancedbookadd =
	{
		{
			RelatedSkillId = 492,--幻影追魂枪
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18*0.5}, {10, -18*2.5}, {11, -18*2.5}}},
				},
				skill_mintimepercastonhorse_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18*0.5}, {10, -18*2.5}, {11, -18*2.5}}},
				},
			},
		},
		{
			RelatedSkillId = 787,--幻影追魂枪
			magic =
			{
				state_zhican_attack =
				{
					value1 = {SkillEnchant.OP_ADD,  {{1,40},{10,100},{11,105}}},
					value2 = {SkillEnchant.OP_ADD,  {{1,2.5*18},{10,2.5*18}}},
				},
			},
		},
		{
			RelatedSkillId = 148,--魔音噬魄
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {11, -18*10}}},
				},
				skill_mintimepercastonhorse_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {11, -18*10}}},
				},
			},
		},

		{
			RelatedSkillId = 847,--飞鸿无迹
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*15}, {11, -18*15}}},
				},
				skill_mintimepercastonhorse_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*15}, {11, -18*15}}},
				},
			},
		},
	},
	xuanmingxixingadd =
	{
		{
			RelatedSkillId = 494,
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {11, -18*10}}},
				},
				skill_mintimepercastonhorse_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18}, {10, -18*10}, {11, -18*10}}},
				},
				missile_range =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,2}, {10, 6}, {11, 6}}},
					value3 = {SkillEnchant.OP_ADD, {{1,2}, {10, 6}, {11, 6}}},
				},
				missile_lifetime_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,18}, {10, 18*5}, {11, 18*5}}},
				},
			},
		},

		{
			RelatedSkillId = 151,
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18*0.5}, {5, -18*1}, {10, -18*1.5}, {11, -18*1.5}}},
				},
			},
		},

		{
			RelatedSkillId = 153,
			magic =
			{
				skill_mintimepercast_v =
				{
					value1 = {SkillEnchant.OP_ADD, {{1,-18*0.5}, {5, -18*1}, {10, -18*1.5}, {11, -18*1.5}}},
				},
			},
		},
	},
};


SkillEnchant:AddBooksInfo(tb)
