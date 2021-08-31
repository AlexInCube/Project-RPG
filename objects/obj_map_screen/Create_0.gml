map_start_x = 0
map_start_y = obj_gui_screen_controller.screen_start_y
map_x = 0
map_y = 0
map_sprite = spr_map_screen
map_width = sprite_get_width(map_sprite)
map_height = sprite_get_height(map_sprite)

mx = -1;
my = -1;
drag = false;

map_zoom = 1
map_zoom_step = 0.5
map_zoom_max = 2
map_zoom_min = 0.5

map_surf_width = GUIWIDTH
map_surf_height = GUIHEIGHT-map_start_y
function restore_map_surf(){
	map_surf = surface_create(map_surf_width,map_surf_height)
}

restore_map_surf()