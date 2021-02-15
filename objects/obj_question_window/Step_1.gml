var xx = window_x+8,yy = window_y+window_height-46
if mouseover(xx,yy,xx+39+str_width_yes,yy+39){
	if mouse_check_button_pressed(mb_left){
		if is_undefined(yes_arg){
			script_execute(yes_script)
		}else{
			script_execute_ext(yes_script,yes_arg)
		}
		instance_destroy()
	}
}
xx = window_x+window_width-8-str_height_no-39
yy = window_y+window_height-46
if mouseover(xx,yy,xx+39+str_height_no,yy+39){
	if mouse_check_button_pressed(mb_left){
		if is_undefined(no_arg){
			script_execute(no_script)
		}else{
			script_execute_ext(no_script,no_arg)
		}
		instance_destroy()
	}
}