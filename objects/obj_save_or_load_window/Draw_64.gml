if !ds_exists(ds_saves,ds_type_map) exit
	var window_x = GUIWIDTH/2-GUIHEIGHT/2, window_y = 0
	var slot_x,slot_y
	
	//Save window background
	draw_nine_slice_box(spr_save_load_window_bg,window_x,window_y,window_x+GUIHEIGHT,window_y+GUIHEIGHT,0)
	
	draw_set_font(fnt_verylarge)
	draw_set_color(c_white)
	
	
	var save_name = ds_map_find_first(ds_saves)
	var save_time_and_version = ds_saves[? save_name]
	//Draw button list
	var yy=0; for(var i = drawelementstart;i<=drawelementstart+drawelementheight;i++){
		slot_x = window_x+10
		slot_y = window_y+10+((5+ss_h)*yy)

		//If game paused, we can save it, so create NEW SAVE button
		if instance_exists(obj_pause) and yy == 0
		{
			var mouse_over_slot = mouseover(slot_x,slot_y,slot_x+ss_w,slot_y+ss_h)
			draw_nine_slice_box(spr_save_slot,slot_x,slot_y,slot_x+ss_w,slot_y+ss_h,mouse_over_slot)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_sprite(spr_create_save_button,0,slot_x+ss_w/2-(string_width(createslot_word)/2)-34,(slot_y+ss_h/2)-15)
			draw_text(slot_x+ss_w/2,slot_y+ss_h/2,createslot_word)
		
			if mouse_over_slot{
				if mouse_check_button_pressed(mb_left){
					//TODO: Make in game textbox and checking equal names
					global.directory_save = get_string(write_your_save_name_word,"Your_save"+string(ds_size))
					resume_game()//resume game for saving (activate all instances)
					save_game()
					exit
				}
			}
			i-- //Fix for begin draw saves from save 0, not 1
		} else if i!=ds_size{//Draw saves list
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)

	
			var mouse_over_slot = mouseover(slot_x,slot_y,slot_x+ss_w,slot_y+ss_h)
			
			//Save slot background
			draw_nine_slice_box(spr_save_slot,slot_x,slot_y,slot_x+ss_w,slot_y+ss_h,mouse_over_slot)
			//Resave Button (appear only in Pause Menu)
			if instance_exists(obj_pause){
				draw_sprite(spr_resave_button,0,slot_x+ss_w-106,slot_y)
				if mouseover(slot_x+ss_w-106,slot_y,slot_x+ss_w-74,slot_y+32){
					if mouse_check_button_pressed(mb_left){
						global.directory_save = save_name
						resume_game()//resume game for saving (activate all instances)
						save_game()
						exit
					}
				}
			}
			//Load Save
			draw_sprite(spr_load_save_button,0,slot_x+ss_w-70,slot_y)
			if mouseover(slot_x+ss_w-70,slot_y,slot_x+ss_w-34,slot_y+32){
				if mouse_check_button_pressed(mb_left){
					global.directory_save = save_name
					global.lastsave = global.directory_save
					start_load()
					exit
				}
			}
			//Delete Save
			draw_sprite(spr_delete_save_button,0,slot_x+ss_w-32,slot_y)
			if mouseover(slot_x+ss_w-32,slot_y,slot_x+ss_w,slot_y+32){
				if mouse_check_button_pressed(mb_left){
					directory_destroy("Saves\\"+save_name)
					show_debug_message("[Save Manager] Save deleted: "+save_name)
					create_saves_map()
					drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
					exit
				}
			}
			//Save name
			draw_set_font(fnt_verylarge)
			draw_text(slot_x+10,slot_y-5,save_name)
			draw_set_font(fnt_small)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			//Save version
			draw_text(slot_x+10,slot_y+35,array_get(save_time_and_version,1))
			//Save time
			var time_array = array_get(save_time_and_version,0)
			//Draw day, month and year
			draw_set_halign(fa_right)
			draw_text(slot_x+ss_w-10,slot_y+35,string(array_get(time_array,0))+"."+string(array_get(time_array,1))+"."+string(array_get(time_array,2)))
			//Draw hours and minutes
			draw_text(slot_x+ss_w-100,slot_y+35,string(array_get(time_array,3))+":"+string(array_get(time_array,4)))
			
			save_name = ds_map_find_next(ds_saves,save_name)
			save_time_and_version = ds_saves[? save_name]
		}else{exit}
	yy++
}
