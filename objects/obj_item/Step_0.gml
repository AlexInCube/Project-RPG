/// @description Insert description here
// You can write your code in this editor
if point_distance(x,y,obj_player.x,obj_player.y)<20
{
	if obj_controller.action_key
	{
	scr_gain_item(whatitem,amount)
	instance_destroy()
	}
	playernear=true
}
else
{
	playernear=false
}