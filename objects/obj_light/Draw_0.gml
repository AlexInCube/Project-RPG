if !surface_exists(global.light) exit

gpu_set_blendmode_ext(bm_zero, bm_src_color)
draw_set_alpha(1)
draw_surface(global.light,camera_get_view_x(player_camera),camera_get_view_y(player_camera))
gpu_set_blendmode(bm_normal)