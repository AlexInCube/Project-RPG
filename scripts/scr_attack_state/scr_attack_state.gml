image_speed = 1
switch(sprite_index){
	case spr_player_down:
		sprite_index = spr_player_attack_down
		break
	
	case spr_player_up:
		sprite_index = spr_player_attack_up
		break
		
	case spr_player_left:
		sprite_index = spr_player_attack_left
		break
		
	case spr_player_right:
		sprite_index = spr_player_attack_right
		break
}

if image_index>=3 and attacked=false
{
	var xx=0
	var yy=0
	switch(sprite_index){
	case spr_player_attack_down:
		xx = x
		yy = y+17
		break
	
	case spr_player_attack_up:
		xx = x
		yy = y-15
		break
		
	case spr_player_attack_left:
		xx = x-15
		yy = y+2
		break
		
	case spr_player_attack_right:
		xx = x+15
		yy = y+2
		break
	}
	
	var damage = instance_create_layer(xx,yy,"Instances",obj_damage)
	damage.creator = id
	damage.knockback = 20
	if obj_player_stats.phys_damage>0
	{
		damage.damage = obj_player_stats.phys_damage
		damage.damagetype = PHYSICALDAMAGETYPE
	}else if obj_player_stats.magic_damage>0
	{
		damage.damage = obj_player_stats.magic_damage
		damage.damagetype = MAGICDAMAGETYPE
	}
	
	
	attacked=true
}