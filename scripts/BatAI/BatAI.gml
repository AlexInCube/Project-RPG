function bat_idle_state() {
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
	
	if enemy_check_for_target(){
		bat_set_aggresive_state()
	}
}

function bat_set_idle_state() {
	state = bat_idle_state
	sprite_index = spr_bat_idle
	alarm[0] = DELTATIME*irandom_range(convert_seconds_to_ticks(2),convert_seconds_to_ticks(3))
	targetx = irandom(room_width)
	targety = irandom(room_height)
}

function bat_attack_prepare(){
}

function bat_set_aggresive_state(){
	state = bat_attack_prepare
	travelled_distance = 0
	sprite_index = spr_bat_attack
	alarm[2] = DELTATIME*convert_seconds_to_ticks(1)
}

function bat_attack_state(){
	var dir = point_direction(x,y,targetx,targety)
	var len = spd*4

	//get hspd and vspd
	hspd = lengthdir_x(len,dir)
	vspd = lengthdir_y(len,dir)
	
	//move
	phy_position_x+=hspd*DELTATIME
	phy_position_y+=vspd*DELTATIME
	
	travelled_distance += len
	if travelled_distance >= max_travel{
		if enemy_check_for_target(false){
			bat_set_aggresive_state()
		}else{
			bat_set_idle_state()
		}
	}
	//dash effect
	var dash = instance_create_depth(x,y,1,obj_dash_effect)
	dash.sprite_index = sprite_index
	dash.image_index = image_index
}


