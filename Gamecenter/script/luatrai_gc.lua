if not MODULE_GC_SERVER then
return;
end
--- gọi lửa trại
function LuaTrai:CallLuaTrai()
	GlobalExcute({"LuaTrai:CallLuaTrai_GS"});
end
--- xóa lửa trại
function LuaTrai:DelLuaTrai()
	GlobalExcute({"LuaTrai:DelLuaTrai_GS"});
end	
