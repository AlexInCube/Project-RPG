var xx = window_x+8,yy = window_y+window_height-46
if mouseover(xx,yy,xx+39+str_width_yes,yy+39){
	if mouse_check_button_pressed(mb_left){
		script_execute(yes_script)
	}
}
xx = window_x+window_width-8-str_height_no-39
yy = window_y+window_height-46
if mouseover(xx,yy,xx+39+str_height_no,yy+39){
	if mouse_check_button_pressed(mb_left){
		script_execute(no_script)
	}
}