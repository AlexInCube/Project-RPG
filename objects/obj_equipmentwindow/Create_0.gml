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

additioninfo[0,0] = find_keyword("phys_damage")
additioninfo[0,1] = "phys_damage"
additioninfo[1,0] = find_keyword("magic_damage")
additioninfo[1,1] = "magic_damage"
additioninfo[2,0] = find_keyword("phys_armor")
additioninfo[2,1] = "phys_armor"
additioninfo[3,0] = find_keyword("magic_armor")
additioninfo[3,1] = "magic_armor"
additioninfo[4,0] = find_keyword("evasion")
additioninfo[4,1] = "evasion"
additioninfo[5,0] = find_keyword("regen_amount")
additioninfo[5,1] = "regen_amount"
//Setup inventory
inventory = global.equipment
inventory_size = ds_grid_width(inventory)

event_user(0)

function assign_attribute_point_button(xx,yy,value){
	var mouse_o = mouseover(xx,yy,xx+16,yy+16)
	draw_sprite(spr_stat_plus,mouse_o,xx,yy)
	if mouse_o
	{
		if surface_exists(obj_controller.global.overlay_surf)
		{
			surface_set_target(obj_controller.global.overlay_surf)
				//Draw textbox
				draw_set_alpha(1)
				draw_set_color(c_white)
				draw_set_font(fnt_small)
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				var mouse_xx = device_mouse_x_to_gui(0)+25, mouse_yy = device_mouse_y_to_gui(0)
				draw_nine_slice_box(spr_hover_item_description,mouse_xx,mouse_yy,mouse_xx+400,mouse_yy+32,0)
				switch(value){
					case "strength":
						draw_text(mouse_xx+10,mouse_yy,strengthdescription)
					break
					case "agility":
						draw_text(mouse_xx+10,mouse_yy,agilitydescription)
					break
					case "defense":
						draw_text(mouse_xx+10,mouse_yy,defensedescription)
					break
					case "energy":
						draw_text(mouse_xx+10,mouse_yy,energydescription)
					break
				}
							
			surface_reset_target()
		}
		//Assign attribute
		if mouse_check_button_pressed(mb_left){
			if variable_instance_exists(obj_player_stats.id,value){
				obj_player_stats.attribute_points-=1
				variable_instance_set(obj_player_stats.id,value,variable_instance_get(obj_player_stats.id,value)+1)
				recalculate_stats(global.equipment)
			}
		}
	}
}