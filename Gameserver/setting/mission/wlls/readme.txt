

Ĭ�Ͻ�����.
���û����ÿ�콱����,�ļ���ʽΪ 
������szFileName .. "_lv1.txt"
�߼���szFileName .. "_lv2.txt"
���£�

��һ�����	award_session_1  ���ļ���Ϊ  award_session_1_lv1.txt
�ڶ������	award_session_2  ���ļ���Ϊ  award_session_2_lv1.txt
...

��һ��߼�	award_session_1  ���ļ���Ϊ  award_session_1_lv2.txt
�ڶ���߼�	award_session_2  ���ļ���Ϊ  award_session_2_lv2.txt
...

���ͱ�:
--��᳡����׼�������ͣ�
Wlls.MAP_LINK_TYPE_RANDOM 	= 1;		--���ѡ�����;���׼����
Wlls.MAP_LINK_TYPE_SERIES 	= 2;		--���ж�Ӧ����;׼������ͼ���Ϊս������,������Ҳ��
Wlls.MAP_LINK_TYPE_FACTION 	= 3;		--���ɶ�Ӧ����;׼������ͼ���Ϊս������,������Ҳ��

--ս��������ͣ�
Wlls.LEAGUE_TYPE_SEX_FREE 		= 0;		--�����Ա�
Wlls.LEAGUE_TYPE_SEX_SINGLE 		= 1;		--ͬһ�Ա�;
Wlls.LEAGUE_TYPE_SEX_MIX 		= 2;		--����Ա�;
Wlls.LEAGUE_TYPE_CAMP_FREE 		= 0;		--������Ӫ;
Wlls.LEAGUE_TYPE_CAMP_SINGLE 		= 1;		--ͬһ��Ӫ;
Wlls.LEAGUE_TYPE_CAMP_MIX 		= 2;		--�����Ӫ;
Wlls.LEAGUE_TYPE_SERIES_FREE 		= 0;		--��������;
Wlls.LEAGUE_TYPE_SERIES_SINGLE 		= 1;		--ͬһ����;
Wlls.LEAGUE_TYPE_SERIES_MIX 		= 2;		--�������;
Wlls.LEAGUE_TYPE_SERIES_RESTRAINT	= 3;		--�������;��δ������
Wlls.LEAGUE_TYPE_FACTION_FREE 		= 0;		--��������;
Wlls.LEAGUE_TYPE_FACTION_SINGLE 	= 1;		--ͬһ����;
Wlls.LEAGUE_TYPE_FACTION_MIX 		= 2;		--�������;
Wlls.LEAGUE_TYPE_TEACHER_FREE 		= 0;		--����ʦͽ;
Wlls.LEAGUE_TYPE_TEACHER_MIX 		= 1;		--���ʦͽ;

--GMָ�2009.03.12��
?gc Wlls: SetMacthSession(4);	--���ý���;
?gc Wlls: GameState0Into1();	--�������������Ъ�ڣ��ɽ���ս�ӣ���һ�죩	1��0��
?gc Wlls: GameState1Into2();	--��Ъ�ڽ�������ڣ�����˥�����Ͻ�ս����գ�	7��0��	
?gc Wlls: GameState2Into3();	--�����ڽ����ǿ�ڣ���ǿ������ս����		28��0��	
?gc Wlls: GameState3Into1();	--��ǿ�ڽ����Ъ�ڣ��콱��ս����		28��24��
?gc Wlls: LeagueRank(0);	--��������
?gc Wlls: GamePkStart(nId);	--������������;��ǿ���׶�nId�����壨1��8��4��2��4��2��3��������1��4��������2��5��������3����
?gc Wlls: Game8PkStart(1)	--������ǿ�����������Զ�����5����
?gc Wlls: UpdateHelpNews(Wlls: GetMacthSession());	--��������ս��
?gc League: SetLeagueTask(Wlls.LGTYPE,"ս����",Wlls.LGTASK_TOTAL,48); --�����ܳ���
?gc League: SetLeagueTask(Wlls.LGTYPE,"ս����",Wlls.LGTASK_WIN,48);   --����ʤ���������ָ���ʤ�������㣩
?gc Wlls.MACTH_TIME_UPDATA_RANK	= 18*600; GlobalExcute{"GM:DoCommand",[[Wlls.MACTH_TIME_UPDATA_RANK = 18*600]]};	--����������ʼ����ˢ������
?gc Wlls.MACTH_TIME_READY 	= 18*60; GlobalExcute{"GM:DoCommand",[[Wlls.MACTH_TIME_READY = 18*60]]};	--׼��ʱ��;
?pl Wlls.MACTH_LEAGUE_MIN	= 2;	--׼�������ٶ����˲��ܿ���
