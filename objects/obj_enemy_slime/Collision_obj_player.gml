/// @description Insert description here
// You can write your code in this editor
if (state != scr_enemy_stall_state){
	var dir = point_direction(other.x,other.y,x,y)
	var xdir = lengthdir_x(1,dir)
	var ydir = lengthdir_y(1,dir)
	var damage = instance_create_layer(other.x+xdir,other.y+ydir,"Instances",obj_damage)
	damage.creator=id
	damage.damage = 1
	damage.damagetype = PHYSICALDAMAGETYPE
	damage.image_xscale=0.5
	damage.image_yscale=0.5
	damage.knockback=10
	
	state = scr_enemy_stall_state
	alarm[1] = room_speed
}