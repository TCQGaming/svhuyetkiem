local tbTNDS = Npc:GetClass("thk_tnds");
tbTNDS.tbItemInfo = {bForceBind=1,};
tbTNDS.TASK_GROUP_ID1 = 3024;
tbTNDS.TASK_GROUP_ID2 = 3025;
tbTNDS.TaskId_Count = 1;
function tbTNDS:OnDialog()
DoScript("\\script\\event\\cacevent\\cauca\\thuongnhandacsan.lua");
local szMsg = "Những thứ ta bán đều là đặc sản của vùng này, ngươi có muốn xem thử không?"
local tbOpt = { 
--{"Sự Kiện <color=yellow>Câu Cá<color>",self.Event_CauCa,self};
{"Đặc sản",self.OpenShop,self};
--{"Không mua nữa",self.LuyenLamLongDon,self};
}; 
Dialog:Say(szMsg, tbOpt);
end
function tbTNDS:OpenShop()
me.OpenShop(109,1)
end
