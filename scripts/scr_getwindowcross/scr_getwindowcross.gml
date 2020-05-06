//if there is another window above the window, then disable moving the header.
var iid = argument0//Put window/object id


with(obj_basicwindow){
	for (i=0;i<ds_list_size(obj_controller.window_list);i++){
		if instance_exists(obj_controller.window_list[|i]){
			if id==iid{return true}
			if scr_mouseover(obj_controller.window_list[|i].window_x,
							obj_controller.window_list[|i].window_y,
							obj_controller.window_list[|i].window_x+obj_controller.window_list[|i].window_width,
							obj_controller.window_list[|i].window_y+obj_controller.window_list[|i].window_height)
			{
				return false
			}else{
				return true
			}
		}
	}
}
