if surface_exists(map_surf)
{
	surface_set_target(map_surf)
	draw_clear_alpha(c_white,0.5)
	draw_sprite_ext(map_sprite,0,map_x,map_y,map_zoom,map_zoom,0,c_white,1)
	surface_reset_target()
	draw_surface_ext(map_surf,map_start_x,map_start_y,1,1,0,c_white,1)
}else{
	restore_map_surf()
}