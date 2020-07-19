// Inherit the parent event
event_inherited();
draw_set_font(fnt_small)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var start_y = window_y+26, start_x = window_x+10, y_buffer = 24, ds_grid = ds_options
//X coord -- window right side
var rsx = window_x + window_width
//Center for info
var entriesoffset = 120

draw_sprite(spr_sliderbackground1,0,rsx-30,start_y)
draw_sprite(spr_slider,0,rsx-30,start_y+((236/(ds_grid_height(ds_grid)-10))*drawelementstart))

scr_applydeclinebutton(window_x+20,window_y+274,applyword,scr_savesettings)//Apply Settings
scr_applydeclinebutton(window_x+150,window_y+274,declineword,scr_declinesettings)//Decline Settings
//scr_applydeclinebutton(window_x+280,window_y+274,set_to_defaultword,nothing)

draw_set_valign(fa_top)
//Draw entries
var yy = 0; for(i=drawelementstart;i<drawelementstart+10;i++){
	var rsy = start_y + (yy*y_buffer)
		switch(ds_grid[# 1,i]){
			#region Title
			case menu_element_type.title: 
				var text = ds_grid[# 0,i]
				var c = c_black
				draw_set_halign(fa_left)
				draw_text_color(start_x,rsy,text,c,c,c,c,1)
				draw_line_color(start_x-2,rsy+22,rsx-35,rsy+22,c,c)
			break;
			#endregion
			#region Shift
			case menu_element_type.shift: 
				var text = ds_grid[# 0,i]
				var c = c_white
				draw_set_halign(fa_left)
				draw_text_color(start_x,rsy,text,c,c,c,c,1)
				
				var current_val = ds_grid[# 3,i]
				var current_array = ds_grid[# 4,i]
				c = c_white
				draw_set_halign(fa_center)
				draw_text_color(rsx-entriesoffset,rsy,current_array[current_val],c,c,c,c,1)
				
				var frameleft=0
				var frameright=0
				if scr_mouseover(rsx-entriesoffset-84,rsy,rsx-entriesoffset-60,rsy+24){
					frameleft=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] -=1
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,array_length_1d(current_array)-1)
						if ds_grid[# 5,i] == 1{
						script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
						}
					}
				}else frameleft=0
				
				if scr_mouseover(rsx-entriesoffset+64,rsy,rsx-entriesoffset+84,rsy+24){
					frameright=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] +=1
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,array_length_1d(current_array)-1)
						if ds_grid[# 5,i] == 1{
						script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
						}
					}
				}else frameright=0
				
				draw_sprite(spr_shift,frameleft,rsx-entriesoffset-84,rsy)
				draw_sprite_ext(spr_shift,frameright,rsx-entriesoffset+84,rsy,-1,1,0,c_white,1)
				
			break;
			#endregion
			#region Slider
			case menu_element_type.slider:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
				
				draw_sprite(spr_slidershiftbackground,0,rsx-entriesoffset-56,rsy+1)
				draw_sprite_ext(spr_slidershiftforeground,0,rsx-entriesoffset-54,rsy+1,ds_grid[# 3,i]/1,1,0,c_white,1)
				draw_set_halign(fa_center)
				draw_text_color(rsx-entriesoffset,rsy,string(round(ds_grid[# 3,i]*100))+"%",c,c,c,c,1)
				
				var frameleft=0
				var frameright=0
				if scr_mouseover(rsx-entriesoffset-84,rsy,rsx-entriesoffset-60,rsy+24){
					frameleft=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] -=ds_grid[# 4,i]
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,1)
						if ds_grid[# 5,i] == 1{
							script_execute(ds_grid[# 2,i],i,ds_grid[# 3,i])
						}
					}
				}else frameleft=0
				
				if scr_mouseover(rsx-entriesoffset+64,rsy,rsx-entriesoffset+84,rsy+24){
					frameright=1
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] +=ds_grid[# 4,i]
						ds_grid[# 3,i] = clamp(ds_grid[# 3,i],0,1)
						if ds_grid[# 5,i] == 1{
							script_execute(ds_grid[# 2,i],i,ds_grid[# 3,i])
						}
					}
				}else frameright=0
				
				draw_sprite(spr_shift,frameleft,rsx-entriesoffset-84,rsy)
				draw_sprite_ext(spr_shift,frameright,rsx-entriesoffset+84,rsy,-1,1,0,c_white,1)
				
				
			break;
			#endregion
			#region Toggle
			case menu_element_type.toggle:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
			
				var current_val = ds_grid[# 3,i]
				var c = c_white
				
				draw_sprite(spr_checkbox,current_val,rsx-entriesoffset-12,rsy)
				
				if scr_mouseover(rsx-entriesoffset-12,rsy,rsx-entriesoffset+12,rsy+24){
					if mouse_check_button_pressed(mb_left){
						ds_grid[# 3,i] = !ds_grid[# 3,i]
						if ds_grid[# 4,i] == 1{
						script_execute(ds_grid[# 2,i],ds_grid[# 3,i])
						}
					}
				}
				
				
			break;
			#endregion
			#region Input
			case menu_element_type.input:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
				var keymode = 0//0 - Default, 1 - Mouse adove key, 2 - INPUT MODE.
				var current_val = ds_grid[# 3,i]
				var string_val
				string_val = chr(current_val);
				c = c_white
				
				draw_set_halign(fa_center)
				
				
				if scr_mouseover(rsx-entriesoffset-12,rsy,rsx-entriesoffset+12,rsy+24){
					keymode=1
					if mouse_check_button_pressed(mb_left){
						if !inputting{
							inputting = true
							toinput = ds_grid[# 0,i]
						}
					}
				}else{keymode=0}
				
				if toinput == ds_grid[# 0,i]{
					keymode = 2
					if keyboard_check_pressed(vk_anykey){
						if inputting==true{
							var kk = keyboard_lastkey
							ds_grid[# 3, i] = kk
							if ds_grid[# 4,i] == 1{
								variable_global_set(ds_grid[# 2,i], ds_grid[# 3, i])
							}
							inputting=false
							toinput = 0
						}
					}
				}
				
			
				
				draw_sprite(spr_keyboardbutton,keymode,rsx-entriesoffset-12,rsy)
				draw_text_color(rsx-entriesoffset,rsy,string_val,c,c,c,c,1)
			break;
			#endregion
	}
	yy++
}
