/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
{
	if point_distance(obj_player.x,obj_player.y,x,y)<35 and y>obj_player.y
	{
		draw_sprite_ext(spr_tree,0,x,y,1,1,0,c_white,0.5)
	}
	else
	{
		draw_sprite_ext(spr_tree,0,x,y,1,1,0,c_white,1)
	}
}

