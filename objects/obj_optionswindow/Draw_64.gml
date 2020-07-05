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

//Draw entries
var yy = 0; for(i=drawelementstart;i<drawelementstart+11;i++){
	var rsy = start_y + (yy*y_buffer)
		switch(ds_grid[# 1,i]){
			case menu_element_type.title: 
				var text = ds_grid[# 0,i]
				var c = c_black
				draw_set_halign(fa_left)
				draw_text_color(start_x,rsy,text,c,c,c,c,1)
				draw_line_color(start_x,rsy+22,rsx-35,rsy+22,c,c)
			break;
		
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
				
				draw_sprite(spr_shift,0,rsx-entriesoffset-84,rsy)
				draw_sprite_ext(spr_shift,0,rsx-entriesoffset+84,rsy,-1,1,0,c_white,1)
			break;
			
			case menu_element_type.slider:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
				draw_set_halign(fa_center)
				draw_text_color(rsx-entriesoffset,rsy,string(ds_grid[# 3,i]*100)+"%",c,c,c,c,1)
				
				draw_sprite(spr_shift,0,rsx-entriesoffset-84,rsy)
				draw_sprite_ext(spr_shift,0,rsx-entriesoffset+84,rsy,-1,1,0,c_white,1)
			break;
		
			case menu_element_type.toggle:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
			
				var current_val = ds_grid[# 3,i]
				var c = c_white
				draw_set_halign(fa_center)
				draw_sprite(spr_checkbox,current_val,rsx-entriesoffset-12,rsy)
				
			break;
		
			case menu_element_type.input:
				var text = ds_grid[# 0,i]
				c = c_white
				draw_set_halign(fa_left)
				draw_text_color(window_x+10,rsy,text,c,c,c,c,1)
				
			var current_val = ds_grid[# 3,i]
			var string_val
			string_val = chr(current_val);
			c = c_white
			draw_set_halign(fa_center)
			draw_text_color(rsx-entriesoffset,rsy,string_val,c,c,c,c,1)
			
			break;
	}
	yy++
}
