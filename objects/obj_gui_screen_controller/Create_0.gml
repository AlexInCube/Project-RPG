screen_map = ds_map_create()//List of all screens
current_screen = ds_map_find_first(screen_map)
active_screen = false//Show screen or not


//quest_start("first_steps")
//quest_start("help_for_ewgen")
//quest_start("test")

#macro SCREEN_CRAFTING "crafting"
#macro SCREEN_QUEST_LIST "quest_list"
#macro SCREEN_INVENTORY "inventory"
#macro SCREEN_MAP "map"
add_screen(SCREEN_CRAFTING,spr_craft,obj_crafting_screen)
add_screen(SCREEN_QUEST_LIST,spr_open_quest_list,obj_quest_screen)
add_screen(SCREEN_INVENTORY,spr_backpack,obj_inventory_screen)
add_screen(SCREEN_MAP,spr_map,obj_map_screen)

buttons_order = [SCREEN_INVENTORY,SCREEN_CRAFTING,SCREEN_MAP,SCREEN_QUEST_LIST]


buttons_screen_width = 32
buttons_screen_height = 32
buttons_screen_offset_x = 4
buttons_screen_start_x = ((ds_map_size(screen_map)*(buttons_screen_width+buttons_screen_offset_x))/2)
buttons_screen_start_y = 40

line_y = buttons_screen_start_y+buttons_screen_height+5

screen_start_y = line_y + 1

function restore_surf(){
	buttons_surf = surface_create(GUIWIDTH,line_y+1)
}

buttons_surf = -1
restore_surf()

