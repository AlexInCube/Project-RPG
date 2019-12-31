if obj_player.state == scr_move_state
{
	var damage = instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_damageprojectile)
	damage.sprite_index=spr_fireball
	damage.creator = id
	damage.knockback = 0
	
	var xforce = lengthdir_x(20,obj_player.face*90)
	var yforce = lengthdir_y(20,obj_player.face*90)
	with damage
	{
		physics_apply_local_impulse(obj_player.x,obj_player.y,xforce,yforce)
	}
	if obj_player_stats.attack>0
	{
		damage.damage = obj_player_stats.attack
		damage.damagetype = PHYSICALDAMAGETYPE
	}else if obj_player_stats.magicattack>0
	{
		damage.damage = obj_player_stats.magicattack
		damage.damagetype = MAGICDAMAGETYPE
	}
	
}