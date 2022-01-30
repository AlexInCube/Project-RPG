if !surface_exists(global.light){
	global.light = surface_create(camera_get_view_width(player_camera),camera_get_view_height(player_camera))
}

surface_set_target(global.light)
draw_clear(c_black)
draw_set_color(obj_controller.light_colour)
draw_rectangle(0,0,camera_get_view_width(player_camera),camera_get_view_height(player_camera),false)
surface_reset_target()
