var window_x = GUIWIDTH/2-sl_w/2, window_y = GUIHEIGHT/2-sl_h/2
var slot_x,slot_y

draw_sprite(spr_load_window,0,window_x,window_y)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_verylarge)
draw_set_color(c_white)


var yy=0; for(var i = drawelementstart;i<=drawelementstart+10;i++){
	slot_x = window_x+10
	slot_y = window_y+10+((5+ss_h)*yy)
	
	
	

	if ds_size!=i{
		var mouse_over_slot = scr_mouseover(slot_x,slot_y,slot_x+ss_w,slot_y+ss_h)
		draw_sprite(spr_save_slot,mouse_over_slot,slot_x,slot_y)
		draw_text(slot_x+10,slot_y,ds_saves[| i])
		//Resave Button (appear only in Pause Menu)
		if instance_exists(obj_pause){
			draw_sprite(spr_save_slots_icons,1,slot_x+ss_w-106,slot_y)
			if scr_mouseover(slot_x+ss_w-106,slot_y,slot_x+ss_w-74,slot_y+32){
				if mouse_check_button_pressed(mb_left){
					global.directory_save=ds_saves[| i]
					save_game()
				}
			}
		}
		//Load Save
		draw_sprite(spr_save_slots_icons,3,slot_x+ss_w-70,slot_y)
		if scr_mouseover(slot_x+ss_w-70,slot_y,slot_x+ss_w-34,slot_y+32){
			if mouse_check_button_pressed(mb_left){
			global.directory_save = ds_saves[| i]
			start_load()
			}
		}
		//Delete Save
		draw_sprite(spr_save_slots_icons,2,slot_x+ss_w-32,slot_y)
		if scr_mouseover(slot_x+ss_w-32,slot_y,slot_x+ss_w,slot_y+32){
			if mouse_check_button_pressed(mb_left){
				directory_destroy("Saves\\"+ds_saves[| i])
				show_debug_message("[Save Manager] Save deleted: "+ds_saves[| i])
				event_user(0)
				drawelementstart = clamp(drawelementstart,0,ds_size-10)
			}
		}
	}else /*if instance_exists(obj_pause)*/{
		var mouse_over_slot = scr_mouseover(slot_x,slot_y,slot_x+ss_w,slot_y+ss_h)
		draw_sprite(spr_save_slot,mouse_over_slot,slot_x,slot_y)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_sprite(spr_save_slots_icons,0,slot_x+ss_w/2-(string_width(createslot_word)/2)-34,(slot_y+ss_h/2)-15)
		draw_text(slot_x+ss_w/2,slot_y+ss_h/2,createslot_word)
		
		if mouse_over_slot{
			if mouse_check_button_pressed(mb_left){
				global.directory_save = string(irandom_range(1,999999))
				save_game()
			}
		}
		exit
	}/*else {
		exit
	}*/

	yy++
}