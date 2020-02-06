scr_draw_black_screen()

var gwidth = display_get_gui_width(), gheight = display_get_gui_height()


var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid)
var y_buffer = 20, x_buffer = 10
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x = gwidth/2
var c = c_black

var ltx = start_x - x_buffer, lty

if room!=room_pause{draw_sprite(spr_logo,0,start_x,100)}



//Draw left side
var yy = 0; repeat(ds_height){
	lty = start_y + (yy*y_buffer)
	c = c_white
	
	/*
	if scr_mouseover(ltx-190,lty-3,ltx+10,lty+23){
		c = c_orange
		menu_option[page] = yy
		if mouse_check_button_pressed(mb_left){event_perform(ev_other,ev_user0)}
	}else 
	*/
	if (yy == menu_option[page]){
		c = c_orange
	}
	
	var string_option = ds_grid[# 0,yy]
	var string_option_width = string_width(ds_grid[# 0,yy])
	//draw_set_halign(fa_center)
	
	if ds_grid == ds_menu_main or ds_grid == ds_menu_settings
	{
		draw_set_halign(fa_center)
		draw_text_color(ltx,lty,string_option,c,c,c,c,1)
	}else{
		draw_set_halign(fa_left) 
		draw_text_color(ltx-string_option_width,lty,string_option,c,c,c,c,1)
		draw_line(start_x,start_y,start_x,lty+y_buffer)
	}
	
	//draw_set_halign(fa_left)
	
	//draw_rectangle(ltx-190,lty-3,ltx+10,lty+23,true)
	yy++	
}
//Draw divide line


var rtx = start_x + x_buffer, rty
//Draw right side
yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer)
	
	switch(ds_grid[# 1,yy]){
		case menu_element_type.shift: 
			var current_val = ds_grid[# 3,yy]
			var current_array = ds_grid[# 4,yy]
			var left_shift = "<< "
			var right_shift = " >>"
			
			if(current_val == 0) left_shift = ""
			if(current_val == array_length_1d(ds_grid[# 4,yy])-1) right_shift = ""	
			c = c_white
			
			if inputting and yy == menu_option[page]{c = c_yellow}
			
			draw_text_color(rtx,rty,left_shift+current_array[current_val]+right_shift,c,c,c,c,1)
		break;
		
		case menu_element_type.slider:
			var len = 64
			var current_val = ds_grid[# 3,yy]
			var current_array = ds_grid[# 4,yy]
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]))
			c = c_white
			
			draw_line_width(rtx,rty+12,rtx+len,rty+12,2)
			if inputting and yy == menu_option[page]{c = c_yellow}
			draw_circle_color(rtx + (circle_pos*len),rty+12,4,c,c,false)
			draw_text_color(rtx + (len * 1.2),rty,string(floor(circle_pos*100))+"%",c,c,c,c,1)
			
		break;
		
		case menu_element_type.toggle:
			
			var c1,c2
			var current_array = ds_grid[# 4,yy]
			var current_val = ds_grid[# 3,yy]
			c = c_white
			if inputting and yy == menu_option[page]{c = c_yellow}
			if(current_val == 0){c1 = c;c2 = c_black}
			else				{c1 = c_black;c2 = c}
			
			draw_text_color(rtx,rty,current_array[0],c1,c1,c1,c1,1)
			var xtextoffset = string_width(current_array[0])+10
			draw_text_color(rtx+xtextoffset,rty,current_array[1],c2,c2,c2,c2,1)
			
			
		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3,yy]
			var string_val
			
			
			string_val = chr(current_val);
			
			
			c = c_white
			if inputting and yy == menu_option[page]{c = c_yellow}
			draw_text_color(rtx,rty,string_val,c,c,c,c,1)
			
		break;
	}
	
	yy++
}