

if other.id != creator
{
	
	obj_player_stats.hp -= apply_damage(damage,damagetype,other,false)
	obj_player_stats.last_hit = object_get_name(creator.object_index)
	
	if instance_exists(creator){
	var dir=point_direction(creator.x,creator.y,other.x,other.y)
	}
	else
	{
	var dir=point_direction(x,y,other.x,other.y)
	}
	var xforce = lengthdir_x(knockback,dir)
	var yforce = lengthdir_y(knockback,dir)
	with (other){
		physics_apply_impulse(x,y,xforce,yforce)
	}
}