if global.interface_lock_by_game exit
var _inst = instance_position(mouse_x,mouse_y,all)
if _inst != noone{
	if is_tagged(INTERACT,_inst){
		with _inst{
			var dr = interact_radius;
			if(point_in_rectangle(obj_player.x, obj_player.y, x-dr, y-dr, x+dr, y+dr)){
				draw_set_alpha(1)
				draw_rectangle_color_fast(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,true)
				if obj_inputManager.interact_key{
					//console_log("button interact")
					var boundMethod = method(self,interact)
					boundMethod();
				}
			}
		}
	}
}