// Inherit the parent event
if mouse_wheel_up(){
	drawelementstart-=1
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}else if mouse_wheel_down(){
	drawelementstart+=1
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}

//show_debug_message("DES:"+string(drawelementstart)+" DEH:"+string(drawelementheight))
//show_debug_message(ds_size)

if keyboard_check_pressed(global.settings.controls.pause_key){
	instance_destroy()
}