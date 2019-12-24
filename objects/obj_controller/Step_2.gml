/// @description Insert description here
// You can write your code in this 
#macro view view_camera[0]
if instance_exists(obj_player)
{
	var _x = clamp(obj_player.x-camera_get_view_width(view)/2,0,room_width-camera_get_view_width(view))
	var _y = clamp(obj_player.y-camera_get_view_height(view)/2,0,room_height-camera_get_view_height(view))
	
	var _cur_x = camera_get_view_x(view)
	var _cur_y = camera_get_view_y(view)
	
	var _spd = .1
	
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd))
}