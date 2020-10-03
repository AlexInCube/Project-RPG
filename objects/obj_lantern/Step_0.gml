if surface_exists(global.light){
	gpu_set_blendmode(bm_subtract)
	surface_set_target(global.light)
	var camera_x = camera_get_view_x(view), camera_y = camera_get_view_y(view)
	draw_ellipse_color(x - size / 2 - camera_x, y - size / 2 - camera_y, x + size / 2 - camera_x, y + size / 2 - camera_y,c_orange,c_black,false)
	surface_reset_target()
	gpu_set_blendmode(bm_normal)
}