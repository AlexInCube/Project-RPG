#region States
function enemy_chase_state() {
	check_for_player()
	var dir = point_direction(x,y,targetx,targety)
	var hspd = lengthdir_x(spd, dir)
	var vspd = lengthdir_y(spd, dir)
	if (sign(hspd) != 0) {
	    image_xscale = sign(hspd);
	}
	phy_position_x += hspd
	phy_position_y += vspd
}

function enemy_wander_state() {
	check_for_player()
	if point_distance(x,y,targetx,targety) > spd{
		var dir = point_direction(x,y,targetx,targety)
		var hspd = lengthdir_x(spd, dir)
		var vspd = lengthdir_y(spd, dir)
		if (sign(hspd) != 0) {
		    image_xscale = sign(hspd);
		}
		phy_position_x += hspd
		phy_position_y += vspd
	}
}

function enemy_idle_state() {
	check_for_player()
}

function enemy_stall_state() {
	if alarm[1] <= 0
	{
		state = enemy_idle_state
	}
}
#endregion
#region Helpers
function check_for_player() {
	if (instance_exists(obj_player)){
		var dis = point_distance(x,y,obj_player.x,obj_player.y)
		if (dis < sight){
			state = enemy_chase_state
			targetx = obj_player.x
			targety = obj_player.y
		} else {
			enemy_choose_next_state()
		}
	} else {
		enemy_choose_next_state()
	}
}

function enemy_choose_next_state() {
	if (alarm[0] <= 0){
		state = choose(enemy_idle_state,enemy_wander_state)
		alarm[0] = room_speed*irandom_range(2,3)
		targetx = irandom(room_width)
		targety = irandom(room_height)
	}
}
#endregion