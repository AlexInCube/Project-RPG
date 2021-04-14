///@description Draw item in mouse
//Draw item in mouse slot upper of interface
if global.interface_lock_by_game {exit}
if instance_exists(obj_basicwindow){
	drawmousepickupeditem()
}

