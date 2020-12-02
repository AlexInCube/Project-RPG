///@description Draw item in mouse
//Draw item in mouse slot upper of interface
if instance_exists(obj_basicwindow){
	drawmousepickupeditem()
}

if surface_exists(overall_gui_surf){
	draw_surface(overall_gui_surf,0,0)
}