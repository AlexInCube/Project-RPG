if !ds_exists(ds_saves,ds_type_list) exit
	draw_black_screen()
	draw_set_color(c_white)
	var window_x = GUIWIDTH/2-GUIHEIGHT/2, window_y = 0
	var slot_x,slot_y
	var window_width = window_x+GUIHEIGHT
	var window_height = window_y+GUIHEIGHT
	//Save window background
	draw_nine_slice_box(spr_basicwindow,window_x,window_y,window_width,window_height,0)

	draw_set_font(fnt_small)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_text(window_x+7,window_y,window_name)
	
	draw_set_font(fnt_verylarge)
	
	
	if mouseover(window_width-23,window_y+5,window_width-4,window_y+22)
	{
		if mouse_check_button_pressed(mb_left)
		{
			instance_destroy()
			exit
		}
	}
	
	//Draw button list
	var yy=0; for(var i = drawelementstart;i<=drawelementstart+drawelementheight;i++){
		if is_undefined(ds_saves[| i]) and !saving exit
		slot_x = window_x+10
		slot_y = window_y+30+((5+ss_h)*yy)
		//If game paused, we can save it, so create NEW SAVE button
		if i!=ds_size{//Draw saves list
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			var save_name = array_get(ds_saves[| i],0)
			var save_time = array_get(ds_saves[| i],1)
			var save_version = array_get(ds_saves[| i],2)
			var save_lvl = array_get(ds_saves[| i],3)
			var save_world_time = array_get(ds_saves[| i],4)
			var mouse_over_slot = mouseover(slot_x,slot_y,slot_x+ss_w,slot_y+ss_h)
			
			//Save slot background
			draw_nine_slice_box(spr_save_slot,slot_x,slot_y,slot_x+ss_w,slot_y+ss_h,mouse_over_slot)
			//Load Save
			if button(slot_x+ss_w-70,slot_y,spr_load_save_button,load,save_name)exit
			//Delete Save
			if button(slot_x+ss_w-32,slot_y,spr_delete_save_button,delete_question,save_name)exit

			//Save name
			draw_set_font(fnt_verylarge)
			draw_set_color(c_white)
			draw_text(slot_x+42,slot_y-5,/*string(i)+"  "+*/save_name)
			draw_set_font(fnt_small)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			//Draw player skin
			draw_sprite_ext(spr_player_down,0,slot_x+22,slot_y+(ss_h/2),2,2,0,c_white,1)
			//Player lvl
			draw_text(slot_x+42,slot_y+ss_h-46,lvl_word+": "+save_lvl)
			//Save world time
			draw_text(slot_x+160,slot_y+ss_h-46,world_time_word+": "+get_formatted_date(save_world_time.hours)+":"+get_formatted_date(save_world_time.minutes))
			//Save version
			draw_text(slot_x+42,slot_y+ss_h-30,gameversion_word+save_version)
			//Save time
			draw_set_halign(fa_right)
			draw_text(slot_x+ss_w-5,slot_y+ss_h-30,savetime_word+get_formatted_date(save_time.day)+"."+get_formatted_date(save_time.month)+"."+string(save_time.year)
			+"  "+get_formatted_date(save_time.hour)+":"+get_formatted_date(save_time.minute)+":"+get_formatted_date(save_time.second))
		}else{exit}
	yy++
}
