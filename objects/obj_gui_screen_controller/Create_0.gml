screen_map = ds_map_create()
current_screen = ds_map_find_first(screen_map)
active_screen = false

#macro SCREEN_EQUIPMENT "equipment"
#macro SCREEN_CRAFTING "crafting"
#macro SCREEN_QUEST_LIST "quest_list"
#macro SCREEN_INVENTORY "inventory"
add_screen(SCREEN_EQUIPMENT,spr_equipment,obj_equipment_screen)
add_screen(SCREEN_CRAFTING,spr_craft,obj_crafting_screen)
add_screen(SCREEN_QUEST_LIST,spr_open_quest_list,obj_questlist_screen)
add_screen(SCREEN_INVENTORY,spr_backpack,obj_inventory_screen)

buttons_order = [SCREEN_INVENTORY,SCREEN_EQUIPMENT,SCREEN_CRAFTING,SCREEN_QUEST_LIST]



current_obj_screen = noone//create_screen_obj(current_screen)

buttons_screen_width = 32
buttons_screen_height = 32
buttons_screen_offset_x = 4
buttons_screen_start_x = (GUIWIDTH/2)-((ds_map_size(screen_map)*(buttons_screen_width+buttons_screen_offset_x))/2)
buttons_screen_start_y = 40

line_y = buttons_screen_start_y+buttons_screen_height+5

screen_start_y = line_y + 5