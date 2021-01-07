switch(state){
	case enemy_pc_awakening_state: 
		state = enemy_pc_chase_state
		sprite_index = spr_enemy_pc_chase
	break;
	
	case enemy_pc_idle_state: 
		if enemy_check_for_target(){
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
		create_explosion(x+8,y+8,45,damage,id)
	break
}