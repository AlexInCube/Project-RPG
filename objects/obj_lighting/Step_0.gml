if !surface_exists(global.light){
	global.light = surface_create(camera_get_view_width(view),camera_get_view_height(view))
}
surface_set_target(global.light)
draw_set_color(c_ltgray)
draw_rectangle(0,0,camera_get_view_width(view),camera_get_view_height(view),false)
surface_reset_target()