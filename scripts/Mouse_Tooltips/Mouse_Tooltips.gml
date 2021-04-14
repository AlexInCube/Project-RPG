/// @description draw_item_stat_mouse(inventory_id,slot_id);
/// @function draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID
function draw_item_stat_mouse(inventory, slot_id) {
	var boxx = 10
	
	var statstring
	//Get item name
	var _item = inventory[# slot_id,0]
	var _item_struct = return_struct_from_item_index_by_item_id(_item)
	statstring[0]=_item_struct[$ "item_locale_name"]
	//Get item type
	statstring[1]=find_keyword(_item_struct[$ "item_type"])
	//Get item description
	statstring[2]=_item_struct[$ "item_description"]
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
	if surface_exists(obj_controller.global.overlay_surf){
		surface_set_target(obj_controller.global.overlay_surf)
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

/// @description draw_effect_stat_mouse(effect_struct);
/// @function draw_item_stat_mouse
/// @param inventory_ID
/// @param slot_ID
function draw_effect_stat_mouse(effect_struct) {
	var boxx = 10
	var boxy = 10

	var statstring
	//Get item name
	statstring[0]=effect_struct[$ "effect_locale_name"]
	//Get item description
	statstring[1]=effect_struct[$ "effect_description"]

	if surface_exists(obj_controller.global.overlay_surf){
		surface_set_target(obj_controller.global.overlay_surf)
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
		//Restrict box go to behind screen
		mouse_xx = clamp(mouse_xx,device_mouse_x_to_gui(0),GUIWIDTH-maxtextwidth)
		mouse_yy = clamp(mouse_yy,device_mouse_y_to_gui(0),GUIHEIGHT-totalheight)
		//Draw background
		draw_nine_slice_box(spr_hover_item_description,mouse_xx+boxx,mouse_yy,mouse_xx+(boxx*2)+maxtextwidth,mouse_yy+totalheight,0)
		draw_set_halign(fa_middle)
		//Draw name
		draw_text(mouse_xx+boxx+maxtextwidth/2,mouse_yy+0,statstring[0])
		//Draw description
		//draw_text(mouse_xx+boxx+maxtextwidth/2,mouse_yy+20,statstring[1])
		draw_text_ext(mouse_xx+boxx+maxtextwidth/2,mouse_yy+18,statstring[1],sep,maxtextwidth)
		surface_reset_target()
	}
}

