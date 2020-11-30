function enemy_pc_idle_state() {
}

function enemy_pc_awakening_state(){
}

function enemy_pc_turn_off_state(){
}

function enemy_pc_angry_state(){
}

function enemy_pc_check_for_player() {
	if (instance_exists(obj_player)){
		targetx = obj_player.x
		targety = obj_player.y
		var dis = point_distance(x,y,obj_player.x,obj_player.y)
		return dis < sight
	}else{
		return false
	}
}

function enemy_pc_chase_state() {
	if enemy_pc_check_for_player(){
		var dir = point_direction(x,y,targetx,targety)
		var hspd = lengthdir_x(spd, dir)
		var vspd = lengthdir_y(spd, dir)
		phy_position_x += hspd
		phy_position_y += vspd
		var dis = point_distance(x,y,obj_player.x,obj_player.y)
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