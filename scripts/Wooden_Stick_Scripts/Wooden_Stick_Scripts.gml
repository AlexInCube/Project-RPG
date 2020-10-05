function wooden_stick_create() {
	attacked=false
	attack_speed=1.2
	
}

function wooden_stick_tick() {
	if obj_controller.attack_key and attacked=false and obj_player.state!=attack_state{
		obj_player.image_index=0
		obj_player.state = attack_state;

		obj_player.image_speed = attack_speed
		switch(obj_player.sprite_index){
			case spr_player_down:
				obj_player.sprite_index = spr_player_attack_down
				break
	
			case spr_player_up:
				obj_player.sprite_index = spr_player_attack_up
				break
		
			case spr_player_left:
				obj_player.sprite_index = spr_player_attack_left
				break
		
			case spr_player_right:
				obj_player.sprite_index = spr_player_attack_right
				break
		}

		if obj_player.image_index>=3
		{
			var xx=0
			var yy=0
			switch(obj_player.sprite_index){
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
			damage.knockback = 5
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
	}


}
