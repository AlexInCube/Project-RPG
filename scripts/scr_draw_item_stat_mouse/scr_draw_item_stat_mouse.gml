/// @description draw_item_stat_mouse(inventory_id,slot_id);
/// @function draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID
function draw_item_stat_mouse(argument0, argument1) {

	var inventory = argument0
	var slot_id = argument1
	var boxx = 10
	var boxy = 10

	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_small)
	var maxtextwidth = 200
	var statstring = ""
	//Get item name
	statstring+=string(global.item_index[# inventory[# slot_id, 0],item_stat.name])+"\n"
	//Get item type
	statstring+=find_keyword("item_type_"+string(global.item_index[# inventory[# slot_id, 0],item_stat.type]))+"\n"
	//Get item description
	statstring+=string(global.item_index[# inventory[# slot_id, 0],item_stat.description])+"\n"
	//Get item stats
	for (ii=6;ii<item_stat.total;ii++)
	{
		if is_real(ii)
		{
			var string1 = find_keyword("item_stat_"+string(ii))
		
			if global.item_index[# inventory[# slot_id, 0], ii]>=1
			{
				statstring+=string(global.item_index[# inventory[# slot_id, 0],ii])+" "+string1+"\n"
			}
		}
	}
	maxtextwidth = string_width(statstring)+15
	if surface_exists(obj_inventory.drawitemtooltip){
	surface_set_target(obj_inventory.drawitemtooltip)
	//Draw textbox
	draw_nine_slice_box(spr_nineslicebox,device_mouse_x_to_gui(0)+boxx,device_mouse_y_to_gui(0),device_mouse_x_to_gui(0)+boxx+maxtextwidth,device_mouse_y_to_gui(0)+20+string_height_ext(statstring,-1,maxtextwidth))
	//Draw string
	draw_text(device_mouse_x_to_gui(0)+boxx+10,device_mouse_y_to_gui(0),statstring)
	surface_reset_target()
	}







}
