/// @description Insert description here
// You can write your code in this editor
var halfviewwidth = camera_get_view_width(view_camera[0])/2
var halfviewheight = camera_get_view_height(view_camera[0])/2
if instance_exists(obj_player)
{
camera_set_view_pos(view_camera[0], obj_player.x - halfviewwidth, obj_player.y - halfviewheight)
}