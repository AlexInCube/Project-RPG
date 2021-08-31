

if other.id != creator
{
	var dmg = apply_damage(other,damage,damagetype)
	
	if global.settings.interface.showdamage = true{
		var showdmg = instance_create_layer(target.x,target.y,"Text",obj_show_damage)
			showdmg.damage = dmg
			showdmg.xx=other.x
			showdmg.yy=other.y
	}
	
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
}