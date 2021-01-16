if !surface_exists(global.light) exit

gpu_set_blendmode_ext(bm_zero, bm_src_color)
draw_set_alpha(obj_controller.darkness)
draw_surface(global.light,camera_get_view_x(camera),camera_get_view_y(camera))
gpu_set_blendmode(bm_normal)