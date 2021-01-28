///@description Draw item in mouse
//Draw item in mouse slot upper of interface
if global.interface_lock_by_game {exit}
if instance_exists(obj_basicwindow){
	drawmousepickupeditem()
}

if surface_exists(overall_gui_surf){
	draw_surface(overall_gui_surf,0,0)
	surface_set_target(overall_gui_surf)
	draw_clear_alpha(c_white,0)
	surface_reset_target()
}else{
	overall_gui_surf = surface_create(GUIWIDTH,GUIHEIGHT)
}