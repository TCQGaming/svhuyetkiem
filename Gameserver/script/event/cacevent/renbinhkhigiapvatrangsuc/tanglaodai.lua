local tbTangLaoDai = Npc:GetClass("sltk_thorenvukhi");
tbTangLaoDai.tbItemInfo = {
        bForceBind=1,
};  
function tbTangLaoDai:OnDialog()
DoScript("\\script\\event\\cacevent\\renbinhkhigiapvatrangsuc\\tanglaodai.lua");

local szMsg = "<color=yellow>Sự Kiện<color> Oẳn Tù Tì\n"..
"<color=yellow>Bắt đầu<color> 12h00 trưa - 12h30 trưa Hàng Ngày\n"..
"<color=yellow>Có Tiền thì đến gặp ta<color>"
local nCurTime = tonumber(os.date("%H%M", GetTime()));
if (nCurTime >= 1200 and nCurTime <= 1230) then
self:OnDialog_1()
return
end
Dialog:Say(szMsg)
end
function tbTangLaoDai:OnDialog_1()
if me.nLevel >= 100 and me.nLevel <= 150 then
local szMsg = "<color=yellow>Sự Kiện<color> Oẳn Tù Tì\n"..
"<color=yellow>Bắt đầu<color> 12h00 - 12h30 Hàng Ngày\n"..
"<color=yellow>Có Tiền thì đến gặp ta<color>"
local tbOpt = {
{"Sự Kiện <color=yellow>Oẳn Tù Tì<color>", self.EventOanTuTi, self},
		};
Dialog:Say(szMsg,tbOpt);
return
end
Dialog:Say("Đẳng Cấp của ngươi là "..me.nLevel.."")
end
function tbTangLaoDai:EventOanTuTi()
local tienxu = me.GetJbCoin();
if tienxu < 20000  then
Dialog:Say("<color=red>THẰNG BẦN TIỆN NGHÈO KHỔ, MANG TRÊN NGƯỜI KHÔNG TỚI 3 VẠN MÀ ĐỒI VÀO SÒNG BẠC <color>")
return
end
local szMsg = "Mời <color=yellow>"..me.szName.."<color> chọn"
local tbOpt = {
{"<color=green>Kéo", self.Chon_Keo, self},
{"<color=green>Búa", self.Chon_Dam, self},
{"<color=green>Bao", self.Chon_La, self},
};
Dialog:Say(szMsg,tbOpt);
end
function tbTangLaoDai:Chon_La()
local nMapId, nPosX, nPosY = me.GetWorldPos();

	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	

	nRand = MathRandom(1, 9);
	

	local tbRate = {3,3,3};
	local tbAward = {1,2,3};
	-- Nguoi choi dang chon La
	-- 1 la Keo
    -- 2 la Dam
	-- 3 la La
	for i = 1, 3 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
if (tbAward[nIndex]==1) then -- NPC Chon Keo - Member Chon La
me.Msg("Thua")
me.AddJbCoin(-10000);
end
if (tbAward[nIndex]==2) then -- NPC Chon Dam - Member Chon La
me.Msg("Thắng")
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Oẳn Tù Tì  <color=green><color> <color=green>Thắng<color>1 vạn đồng<color>");	   
me.AddJbCoin(10000);
end
if (tbAward[nIndex]==3) then -- NPC Chon La - Member Chon La
me.Msg("Hòa")
end
end
function tbTangLaoDai:Chon_Dam()
local nMapId, nPosX, nPosY = me.GetWorldPos();
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	

	nRand = MathRandom(1, 9);
	

	local tbRate = {3,3,3};
	local tbAward = {1,2,3};
	-- Nguoi choi dang chon Dam
	-- 1 la Keo
    -- 2 la Dam
	-- 3 la La
	for i = 1, 3 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
if (tbAward[nIndex]==1) then -- NPC Chon Keo - Member Chon Dam
me.Msg("Thắng");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Oẳn Tù Tì <color=green><color> <color=green>Thắng<color>1 vạn đồng<color>");	   
me.AddJbCoin(10000);
end
if (tbAward[nIndex]==2) then -- NPC Chon Dam - Member Chon Dam
me.Msg("Hòa")
end
if (tbAward[nIndex]==3) then -- NPC Chon La - Member Chon Dam
me.Msg("Thua");
me.AddJbCoin(-10000);
end
end
function tbTangLaoDai:Chon_Keo()
local nMapId, nPosX, nPosY = me.GetWorldPos();
	local i = 0;
	local nAdd = 0;
	local nRand = 0;
	local nIndex = 0;
	

	nRand = MathRandom(1, 9);
	

	local tbRate = {3,3,3};
	local tbAward = {1,2,3};
	-- Nguoi choi dang chon Keo
	-- 1 la Keo
    -- 2 la Dam
	-- 3 la La
	for i = 1, 3 do
		nAdd = nAdd + tbRate[i];
		if nAdd >= nRand then
			nIndex = i;
			break;
		end
	end
if (tbAward[nIndex]==1) then -- NPC Chon Keo - Member Chon Keo
me.Msg("Hòa");
end
if (tbAward[nIndex]==2) then -- NPC Chon Dam - Member Chon Keo
me.Msg("Thua");
me.AddJbCoin(-10000);
end
if (tbAward[nIndex]==3) then -- NPC Chon La - Member Chon Keo
me.Msg("Thắng");
KDialog.MsgToGlobal("<color=yellow>Người chơi <color=green>["..me.szName.."]<color> Oẳn Tù Tì <color=green><color> <color=green>Thắng<color>1 vạn đồng<color>");	   
me.AddJbCoin(10000);
end
end
