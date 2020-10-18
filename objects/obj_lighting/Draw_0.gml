if !surface_exists(global.light){
	global.light = surface_create(camera_get_view_width(camera),camera_get_view_height(camera))
}
gpu_set_blendmode(bm_subtract)
draw_surface(global.light,camera_get_view_x(camera),camera_get_view_y(camera))
gpu_set_blendmode(bm_normal)