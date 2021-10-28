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
attribute_pointsword = find_keyword("attribute_points")
stats_block_x = (GUIWIDTH/2)+26
stats_block_y = obj_gui_screen_controller.screen_start_y+25
stats_x = stats_block_x+30
stats_y = stats_block_y+34
stats_word = find_keyword("stats")

stats_array = ["energy","defense","strength","agility","phys_armor","magic_armor","phys_damage","magic_damage"]

function assign_attribute_point_button(xx,yy,value){
	var mouse_o = mouseover(xx,yy,xx+24,yy+24)
	draw_sprite(spr_stat_plus,mouse_o,xx,yy)
		//Assign attribute
	if mouse_o{
		if mouse_check_button_pressed(mb_left){
			if variable_instance_exists(obj_player_stats.id,value){
				obj_player_stats.attribute_points-=1
				variable_instance_set(obj_player_stats.id,value,variable_instance_get(obj_player_stats.id,value)+1)
				recalculate_stats(global.equipment)
			}
		}
	}
}
#endregion


event_user(0)