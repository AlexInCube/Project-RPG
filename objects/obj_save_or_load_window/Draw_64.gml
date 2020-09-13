if !ds_exists(ds_saves,ds_type_list) exit
	var window_x = GUIWIDTH/2-GUIHEIGHT/2, window_y = 0
	var slot_x,slot_y
	
	//Save window background
	draw_nine_slice_box(spr_save_load_window_bg,window_x,window_y,window_x+GUIHEIGHT,window_y+GUIHEIGHT,0)
	
	draw_set_font(fnt_verylarge)
	draw_set_color(c_white)


	var yy=0; for(var i = drawelementstart;i<=drawelementstart+drawelementheight;i++){
		slot_x = window_x+10
		slot_y = window_y+10+((5+ss_h)*yy)


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
					global.directory_save = get_string("Write your save name:","Your_save"+string(ds_size))
					save_game()
				}
			}
		} else if i!=ds_size{
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
						global.directory_save=ds_saves[| i]
						with(obj_pause)save_game()
						exit
					}
				}
			}
			//Load Save
			draw_sprite(spr_load_save_button,0,slot_x+ss_w-70,slot_y)
			if mouseover(slot_x+ss_w-70,slot_y,slot_x+ss_w-34,slot_y+32){
				if mouse_check_button_pressed(mb_left){
					global.directory_save = ds_saves[| i]
					start_load()
					exit
				}
			}
			//Delete Save
			draw_sprite(spr_delete_save_button,0,slot_x+ss_w-32,slot_y)
			if mouseover(slot_x+ss_w-32,slot_y,slot_x+ss_w,slot_y+32){
				if mouse_check_button_pressed(mb_left){
					directory_destroy("Saves\\"+ds_saves[| i])
					show_debug_message("[Save Manager] Save deleted: "+ds_saves[| i])
					create_saves_list()
					drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
				}
			}
			//Save name
			draw_text(slot_x+10,slot_y-5,ds_saves[| i])
		}else{exit}
	yy++
}
