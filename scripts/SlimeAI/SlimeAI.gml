#region States
function slime_chase_state() {
	slime_check_for_player()
	var dir = point_direction(x,y,targetx,targety)
	var hspd = lengthdir_x(spd, dir)
	var vspd = lengthdir_y(spd, dir)
	if (sign(hspd) != 0) {
	    image_xscale = sign(hspd);
	}
	phy_position_x += hspd*DELTATIME
	phy_position_y += vspd*DELTATIME
}

function slime_wander_state() {
	slime_check_for_player()
	if point_distance(x,y,targetx,targety) > spd{
		var dir = point_direction(x,y,targetx,targety)
		var hspd = lengthdir_x(spd, dir)
		var vspd = lengthdir_y(spd, dir)
		if (sign(hspd) != 0) {
		    image_xscale = sign(hspd);
		}
		phy_position_x += hspd*DELTATIME
		phy_position_y += vspd*DELTATIME
	}
}

function slime_idle_state() {
	slime_check_for_player()
}

function slime_stall_state() {
	if alarm[1] <= 0
	{
		state = slime_idle_state
	}
}
#endregion
#region Helpers
function slime_check_for_player() {
	if (instance_exists(target)){
		var dis = point_distance(x,y,target.x,target.y)
		if (dis < sight){
			state = slime_chase_state
			targetx = target.x
			targety = target.y
		} else {
			slime_choose_next_state()
		}
	} else {
		slime_choose_next_state()
	}
}

function slime_choose_next_state() {
	if (alarm[0] <= 0){
		state = choose(slime_idle_state,slime_wander_state)
		alarm[0] = irandom_range(60,180)*DELTATIME
		var dir = irandom(360);
		targetx = xstart + lengthdir_x(distance_from_spawn, dir)
		targety = ystart + lengthdir_y(distance_from_spawn, dir)
	}
}
#endregion