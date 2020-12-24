function enemy_choose_next_state_chinlin() {
	if (alarm[0] <= 0){
		state = choose(enemy_idle_state_chinlin,enemy_wander_state_chinlin)
		alarm[0] = DELTATIME*irandom_range(60,120)
		if state == enemy_wander_state_chinlin 
		{
			xaxis = random_range(-1,1)
			yaxis = random_range(-1,1)
		}
	}
}

function check_for_player_chinlin() {
	if (instance_exists(obj_player)){
		var dis = point_distance(x,y,obj_player.x,obj_player.y)
		if (dis < sight){
			state = enemy_chase_state_chinlin
			var dir = point_direction(x,y,obj_player.x,obj_player.y)
			xaxis = lengthdir_x(1,dir)
			yaxis = lengthdir_y(1,dir)
		} else {
			enemy_choose_next_state_chinlin()
		}
	} else {
		enemy_choose_next_state_chinlin()
	}
}

function enemy_chase_state_chinlin() {
	check_for_player_chinlin()
	move_axis()
}

  
function enemy_idle_state_chinlin() {
	movement = IDLE
	check_for_player_chinlin()
}

function enemy_wander_state_chinlin() {
	check_for_player_chinlin()
	move_axis()
}

function enemy_stall_state_chinlin() {
	movement = IDLE
	if alarm[1] <= 0
	{
		state = enemy_idle_state_chinlin
	}
}

function move_axis() {
	var dir = point_direction(0,0,xaxis,yaxis)
	var hspd = lengthdir_x(spd, dir)
	var vspd = lengthdir_y(spd, dir)
	if (sign(hspd) != 0) {
	    image_xscale = sign(hspd);
	}
	get_face(dir)
	movement = MOVE

	phy_position_x += hspd*DELTATIME
	phy_position_y += vspd*DELTATIME
}

function get_face(dir){
	face = round(dir/90)
	if(face==4) face = RIGHT
}