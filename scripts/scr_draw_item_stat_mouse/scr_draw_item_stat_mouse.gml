/// @description draw_item_stat_mouse(inventory_id,slot_id);
/// @function draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID
function draw_item_stat_mouse(inventory, slot_id) {
	var boxx = 10
	var boxy = 10

	var statstring
	//Get item name
	statstring[0]=string(global.item_index[# inventory[# slot_id, 0],item_stat.name])
	//Get item type
	statstring[1]=find_keyword("item_type_"+string(global.item_index[# inventory[# slot_id, 0],item_stat.type]))
	//Get item description
	statstring[2]=string(global.item_index[# inventory[# slot_id, 0],item_stat.description])
	/*
	//Get item stats
	for (var ii=6;ii<item_stat.total;ii++)
	{
		if is_array(ii)continue
		if is_real(ii)
		{
			array_push(statstring,find_keyword("item_stat_"+string(ii)))
		}
	}
	*/
	if surface_exists(obj_controller.overall_gui_surf){
		surface_set_target(obj_controller.overall_gui_surf)
		//Draw textbox
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_set_font(fnt_small)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		var maxtextwidth = 300
		var sep = -1
		var mouse_xx = 0, mouse_yy = 0
		var totalheight = 0
		for (var i = 0;i<array_length(statstring);i++){
			totalheight += string_height_ext(statstring[i],sep,maxtextwidth)
		}
		mouse_xx = clamp(mouse_xx,device_mouse_x_to_gui(0),GUIWIDTH-maxtextwidth)
		mouse_yy = clamp(mouse_yy,device_mouse_y_to_gui(0),GUIHEIGHT-totalheight)
		draw_nine_slice_box(spr_hover_item_description,mouse_xx+boxx,mouse_yy,mouse_xx+(boxx*2)+maxtextwidth,mouse_yy+totalheight,0)
		//Draw string
		draw_set_halign(fa_middle)
		draw_text(mouse_xx+boxx+maxtextwidth/2,mouse_yy+0,statstring[0])
		draw_text(mouse_xx+boxx+maxtextwidth/2,mouse_yy+20,statstring[1])
		var yy = 0;for (var i = 2;i<array_length(statstring);i++){
			draw_text_ext(mouse_xx+boxx+maxtextwidth/2,mouse_yy+yy+36,statstring[i],sep,maxtextwidth)
			yy += string_height_ext(statstring[i],sep,maxtextwidth)
		}
		surface_reset_target()
	}
}
