function enemy_pc_idle_state() {
}

function enemy_pc_awakening_state(){
}

function enemy_pc_turn_off_state(){
}

function enemy_pc_angry_state(){
}

function enemy_pc_chase_state() {
	if enemy_check_for_target(){
		var dir = point_direction(x,y,targetx,targety)
		var hspd = lengthdir_x(spd, dir)
		var vspd = lengthdir_y(spd, dir)
		phy_position_x += hspd*DELTATIME
		phy_position_y += vspd*DELTATIME
		var dis = point_distance(x,y,target.x,target.y)
		if dis < angry_sight{
			state = enemy_pc_angry_state
			image_index = 0
			sprite_index = spr_enemy_pc_angry
		}
	}else{
		state = enemy_pc_turn_off_state
		sprite_index = spr_enemy_pc_turn_off
	}
}