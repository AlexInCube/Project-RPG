///@function create_damage(damage_sprite,creato,knockbac,light_radiu,projectile?)
///@param damage_sprite
///@param creator
///@param knockback
///@param light_radius
///@param projectile?
function create_damage(damage_sprite,creato,knockbac,light_radiu,projectile_or_not){
	if projectile_or_not{
		var projectile = instance_create_layer(x,y,"Instances",obj_damageprojectile)
	}else{
		var projectile = instance_create_layer(x,y,"Instances",obj_damage)
	}
	
	with projectile{
		sprite_index = damage_sprite
		creator = creato
		knockback = knockbac
		light_radius =light_radiu
	}
	return projectile
}

function knockback_player(knockback_power,dir){
	//Knockback player (working if player not moving)
	var xforce = lengthdir_x(knockback_power,dir)
	var yforce = lengthdir_y(knockback_power,dir)
	with (obj_player){
		physics_apply_local_impulse(x,y,-xforce,-yforce)
	}
}