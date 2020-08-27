#macro view view_camera[0]
if manual_control == true and !instance_exists(obj_cutscene) and !instance_exists(obj_textbox){
	if instance_exists(target){
	target = id
	camera_speed = default_camera_speed
	var camera_x = mean(obj_player.x,obj_player.x, mouse_x);
	var camera_y = mean(obj_player.y,obj_player.y, mouse_y);
	x = lerp(x,camera_x,camera_speed);
	y = lerp(y,camera_y,camera_speed);
	}
}
if instance_exists(target)
{
	var _x = clamp(target.x-camera_get_view_width(view)/2,0,room_width-camera_get_view_width(view))
	var _y = clamp(target.y-camera_get_view_height(view)/2,0,room_height-camera_get_view_height(view))
	
	var _cur_x = camera_get_view_x(view)
	var _cur_y = camera_get_view_y(view)
	
	var _spd = camera_speed
	
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd))
}