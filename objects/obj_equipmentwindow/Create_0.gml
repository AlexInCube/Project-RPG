///@description Inventory Window for Player/Chests inventories
event_inherited();

window_name=find_keyword("equipment_window")
window_sprite=spr_equipmenu
window_width=sprite_get_width(window_sprite)
window_height=sprite_get_height(window_sprite)
persistent=true

equipmode = 0//0 - default equip, 1 - advanced stats
basicword = find_keyword("basic")
advancedword = find_keyword("advanced")
strengthword = find_keyword("strength")
strengthdescription = find_keyword("strengthdescription")
agilityword = find_keyword("agility")
agilitydescription = find_keyword("agilitydescription")
defenseword = find_keyword("defense")
defensedescription = find_keyword("defensedescription")
energyword = find_keyword("energy")
energydescription = find_keyword("energydescription")
attribute_pointsword = find_keyword("attribute_points")
//Setup inventory
inventory = global.equipment
inventory_size = ds_grid_width(inventory)
/* 
Setup slots number and size 
*/
cell_size=32//Slot size
//Starting XY
slots_x=6
slots_y=59
//Free space between slots
x_buffer=1
y_buffer=1

event_user(0)

function assign_attribute_point_button(xx,yy,value){
	var mouse_o = mouseover(xx,yy,xx+16,yy+16)
	draw_sprite(spr_stat_plus,mouse_o,xx,yy)
	if mouse_o{
		//Draw attribute description
		var txt_x = window_x+11, txt_y = window_y+157
		switch(value){
			case "strength":
				draw_text_ext(txt_x,txt_y,strengthdescription,16,200)
			break
			case "agility":
				draw_text_ext(txt_x,txt_y,agilitydescription,16,200)
			break
			case "defense":
				draw_text_ext(txt_x,txt_y,defensedescription,16,200)
			break
			case "energy":
				draw_text_ext(txt_x,txt_y,energydescription,16,200)
			break
		}
		//Assign attribute
		if mouse_check_button_pressed(mb_left){
			if variable_instance_exists(obj_player_stats.id,value){
				obj_player_stats.attribute_points-=1
				variable_instance_set(obj_player_stats.id,value,variable_instance_get(obj_player_stats.id,value)+1)
			}
		}
	}
}