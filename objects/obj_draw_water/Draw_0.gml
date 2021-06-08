shader_set(shd_water)
shader_set_uniform_f(uniTime, current_time);
draw_sprite(spr_water_perlin_noise,water_frame,x,y)
shader_reset()