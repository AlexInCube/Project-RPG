if mouseover{
	if mouse_wheel_up(){
		drawelementstart-=1
		drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
		clear_ui_elements_list(ds_options_ui_elements)
		recreate_buttons()
	}else if mouse_wheel_down(){
		drawelementstart+=1
		drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
		clear_ui_elements_list(ds_options_ui_elements)
		recreate_buttons()
	}
}

if keyboard_check_pressed(global.settings.controls.pause_key){
	instance_destroy()
}