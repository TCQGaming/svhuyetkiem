--script\CTC\define.lua
CTC.ISOPEN = 1;-- 0 tat 1 mo
CTC.CTC_TIME_BD = 10 * 60;-- thoi gian bao danh
CTC.CTC_TIME = 60 * 60; -- 60 *60, thời gian diễn ra sự kiện
CTC.nTimerId = 0;
CTC.nTimerId_BD = 0;
CTC.nTimerId_BD_1 = 0;
CTC.Check_ThongBao_SK = 0;
CTC.Show_Line_BD = 0;
CTC.Show_Line_NT = 0;
CTC.ThanhLong  = "";
CTC.HuyenVu  = "";
CTC.ChuTuoc  = "";
CTC.BachHo  = "";
CTC.NgaiVang = "";
CTC.nTask_Group = 9046;
CTC.nTaskId_Day = 1;
CTC.nTaskId_Count = 2;
CTC.nTaskId_Count_TV = 3;
---------------Thời gian-------------
CTC.ENDTIME = 2100;-- cau hinh thoi gian su kien dien ra, sau time này mới có thể nhận thưởng thành viên và bang chủ gs
CTC.WEEKDAY = 4;-- 4 là thứ 5; ngày diễn ra sự kiện gs. Cần đồng bộ gamecenter
-------------------------------------

CTC.MAXTONG = 4;-- giới hạn tối đa 4 bang hội

CTC.MapID = 1832;
CTC.NPCIDLongTru = {{10356,{CTC.MapID, 1626, 3466},0},{10357,{CTC.MapID, 1788, 3627},0},{10358,{CTC.MapID, 1952, 3462},0},{10359,{CTC.MapID, 1788, 3299},0}};

CTC.NPCNgaiVang = {10360,{CTC.MapID, 1786, 3453}};
CTC.MapPos = {{CTC.MapID, 1664, 3551},{CTC.MapID, 1861, 3340},{CTC.MapID, 1913, 3552},{CTC.MapID, 1707, 3338},{CTC.MapID, 1664, 3551},{CTC.MapID, 1861, 3340},{CTC.MapID, 1913, 3552},{CTC.MapID, 1707, 3338}};

CTC.MapPos_Prepare =
{
{1832, 1505,3691},
{1832, 2070,3227},
{1832, 1966,3827},
{1832, 1614,3137},
{1832, 1613,3813},
{1832, 1977,3111},
{1832, 2072,3709},
{1832, 1510,3248},
}

CTC.NPCLevel = 50;
CTC.TongList = {};
CTC.Point = {30,100,5};-- diem point long tru 2500 là trụ bình thường, 5000 là ngai vàng, bao ve tru.giết địch
CTC.PlayerList = {};
CTC.Result = {};
CTC.Winner = 0;
CTC.ReadyTimerId = 0;
CTC.ExpProtect = 0;-- kinh nghiệm bảo vệ trụ
CTC.CoinProtect = 0;-- tiền bảo vệ trụ
CTC.TimeProtectOnDeath = 10;
CTC.ITemAward = {{18, 1, 1,10,{bForceBind = 1},4},{18, 1, 1,9,{bForceBind = 1},4},{18, 1, 1,9,{bForceBind = 1},2},{18, 1, 1,9,{bForceBind = 1},1}};-- phần thưởng kết thúc sự kiện theo xếp hạng
CTC.CoinAward = {50000,40000,30000,20000};-- phần thưởng kết thúc sự kiện theo xếp hạng
CTC.EXPAward = {50000000,40000000,30000000,20000000};-- phần thưởng kết thúc sự kiện theo xếp hạng
--script\CTC\define.lua
CTC.Folder = "\\script\\CTC\\"; -- duong dan folder
CTC.List = "Save_CTC.txt"; -- list name nhan thuong theo rank
CTC.List_HWID = "HWID_CTC.txt"; -- list hwid nhan vat
CTC.Max_HWID = 600; -- gioi han 1 HWID 1 may

function CTC:AddAward(pPlayer)
	for i = 1,#CTC.Result do
		if pPlayer.dwTongId == CTC.Result[i][1] then
		--	pPlayer.AddStackItem(unpack(CTC.ITemAward[i]));--Thêm vật phẩm
			--pPlayer.Earn(CTC.CoinAward[i],0);
			--pPlayer.AddExp(CTC.EXPAward[i]);
			pPlayer.Msg("Bang hội của bạn đạt hạng ".. i .. " nhận được rất nhiều phần thưởng");
			CTC:WriteFile(pPlayer,i,1);
			--
		end	
	end
end
function CTC:WriteFile_HWID(pPlayer,nCount_HWID,nCheck)
	if not pPlayer then 
		return;
	end	
	local nHardWareId = pPlayer.dwHardWareId;
	if not nHardWareId then 
		return ;
	end	
	local szFile = CTC.Folder..CTC.List_HWID.."";
	local nNewCount_HWID = nCount_HWID + 1;
	if nCheck == 1 then
		--Lib:EditTabFile(szFile,1,""..pPlayer.szName.."",2,""..nNewCount_HWID .."");
		Lib:EditTabFile(szFile,1,""..nHardWareId.."",2,""..nNewCount_HWID .."");
	else
		KFile.AppendFile(szFile, ""..nHardWareId.."\t"..nNewCount_HWID.."\t"..pPlayer.szName.."\r\n");	
	end
end
function CTC:WriteFile(pPlayer,nRank,nCheck)
	if not pPlayer then 
		return;
	end	
	local pTong = KTong.GetTong(pPlayer.dwTongId);
	local szTongName = pTong.GetName();
	local szFile = CTC.Folder..CTC.List.."";
	if not nRank then
		nRank = 0;
	end
	if nCheck == 1 then
		Lib:EditTabFile(szFile,1,""..szTongName.."",2,""..nRank .."");
	else
		KFile.AppendFile(szFile, ""..szTongName.."\t"..nRank.."\t"..pPlayer.szName.."\r\n");	
	end
end
function CTC:ResetFile()
	local szFile = CTC.Folder..CTC.List.."";
	KFile.WriteFile(szFile, "szTongName\tRank\tszName\n");	
	
	local szFile_HWID = CTC.Folder..CTC.List_HWID.."";
	KFile.WriteFile(szFile_HWID, "nHWID\tnNum\tszName\n");	

end

function CTC:xoalognhanthuongbc()
	 local szFile = "\\script\\CTC\\bangchunhanthuong.txt"
	KFile.WriteFile(szFile, "");	
end
