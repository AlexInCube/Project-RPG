current_screen = ds_map_find_first(global.screen_map)
active_screen = false//Show screen or not


buttons_order = [SCREEN_INVENTORY,SCREEN_CRAFTING,SCREEN_LOCATION_MAP,SCREEN_QUEST_LIST]


buttons_screen_width = 32
buttons_screen_height = 32
buttons_screen_offset_x = 4
buttons_screen_start_x = ((ds_map_size(global.screen_map)*(buttons_screen_width+buttons_screen_offset_x))/2)
buttons_screen_start_y = 40

line_y = buttons_screen_start_y+buttons_screen_height+5

screen_start_y = line_y + 1

function restore_surf(){
	buttons_surf = surface_create(GUIWIDTH,line_y+1)
}

buttons_surf = -1
restore_surf()

