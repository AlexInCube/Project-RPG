

if other.id != creator
{
	if effect_exists(obj_player_stats,BUFF_INVISIBLE){
		exit
	}
	var dmg = apply_damage(obj_player_stats,damage,damagetype,other,false)
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
	script_execute(on_collision_script)
	
	effect_apply(obj_player_stats,BUFF_INVISIBLE,obj_player_stats.invisibility_duration)
}