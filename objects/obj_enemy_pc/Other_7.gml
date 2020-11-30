switch(state){
	case enemy_pc_awakening_state: 
		state = enemy_pc_chase_state
		sprite_index = spr_enemy_pc_chase
	break;
	
	case enemy_pc_idle_state: 
		if enemy_pc_check_for_player(){
			state = enemy_pc_awakening_state
			sprite_index = spr_enemy_pc_awake
		}
	break;
	
	case enemy_pc_turn_off_state:
		state = enemy_pc_idle_state
		sprite_index = spr_enemy_pc_idle
	break
	
	case enemy_pc_angry_state:
		instance_destroy(id,false)
		var damage = instance_create_layer(x,y,"Instances",obj_damage)
		damage.creator=id
		damage.damage = self.damage
		damage.damagetype = PHYSICALDAMAGETYPE
		damage.image_xscale=2
		damage.image_yscale=2
		damage.knockback = self.knockback
	break
}