if !surface_exists(global.light){
	global.light = surface_create(camera_get_view_width(view),camera_get_view_height(view))
}
gpu_set_blendmode(bm_subtract)
draw_surface(global.light,camera_get_view_x(view),camera_get_view_y(view))
gpu_set_blendmode(bm_normal)