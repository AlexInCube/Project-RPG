#region INVENTORY
inventory = global.inventory
inventory_size = ds_grid_width(inventory)
inventory_backpack_word = find_keyword("backpack")
/* 
Setup slots number and size 
*/
inventory_x = (GUIWIDTH/2)-200
inventory_y = obj_gui_screen_controller.screen_start_y+30
cell_size=32//Slot size
//Starting XY
slots_x=8
slots_y=8
//Free space between slots
x_buffer=1
y_buffer=1
#endregion 

#region EQUIPMENT
equipment = global.equipment
equipment_size = ds_grid_width(equipment)
equipment_x = inventory_x
equipment_y = inventory_y+180
equipment_word = find_keyword("equipment")
#endregion

#region STATS
stats_block_x = (GUIWIDTH/2)+26
stats_block_y = obj_gui_screen_controller.screen_start_y+30
stats_x = stats_block_x+20
stats_y = stats_block_y+20
stats_word = find_keyword("stats")

stats_array = ["max_hp","hp_regen","max_mana","mana_regen","regen_multiplier","phys_armor","magic_armor","phys_damage","magic_damage","evasion"]
#endregion



event_user(0)