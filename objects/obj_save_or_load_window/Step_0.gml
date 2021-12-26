// Inherit the parent event
if mouse_wheel_up(){
	drawelementstart-=1
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}else if mouse_wheel_down(){
	drawelementstart+=1
	drawelementstart = clamp(drawelementstart,0,max(0,ds_size-drawelementheight))
}

//console_log("DES:"+string(drawelementstart)+" DEH:"+string(drawelementheight))
//console_log(ds_size)

if obj_inputManager.pause_key{
	instance_destroy()
}