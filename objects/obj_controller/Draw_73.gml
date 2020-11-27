var _inst = instance_position(mouse_x,mouse_y,all)
if _inst != noone{
	if is_tagged(INTERACT,_inst){
		with _inst{
			draw_rectangle_color_fast(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,true)
			if obj_controller.interact_key{
				show_debug_message("button interact")
				var boundMethod = method(self,interact)
				boundMethod();
			}
		}
	}
}