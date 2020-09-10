/// @description Insert description here
// You can write your code in this editor
if other.id != creator
{
	other.hp -= applydamage(damage,damagetype,other,true)
	
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