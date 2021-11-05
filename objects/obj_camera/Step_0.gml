//Get player_camera x and y
cx = camera_get_view_x(player_camera)
cy = camera_get_view_y(player_camera)


switch(mode){
	case camera_mode.follow_object: 
		if(!instance_exists(following)) break
		cx = following.x - (view_w/2)
		cy = following.y - (view_h/2)
	break
	
	case camera_mode.follow_mouse_peek: 
	if(!instance_exists(following)) break
		cx = lerp(following.x, mouse_x, 0.3)-(view_w/2)
		cy = lerp(following.y, mouse_y, 0.3)-(view_h/2)
	break
	
	case camera_mode.move_to_follow_object: 
		if(!instance_exists(following)) break
		cx = lerp(cx, following.x - (view_w/2), camera_speed*DELTATIME)
		cy = lerp(cy, following.y - (view_h/2), camera_speed*DELTATIME)
		
		if point_distance(cx,cy,following.x - (view_w/2),following.y - (view_h/2)) < 1{
			mode = camera_mode.move_to_follow_object
		}
	break
	
	case camera_mode.move_to_target: 
		cx = lerp(cx, target_x - (view_w/2), camera_speed*DELTATIME)
		cy = lerp(cy, target_y - (view_h/2), camera_speed*DELTATIME)
	break
}
//Shake effect
cx += (random_range(-shake,shake))
cy += (random_range(-shake,shake))
shake*=0.9
//Do not allow the player_camera to leave the room
if(!boundless){
	cx = clamp(cx, 0, room_width-view_w)
	cy = clamp(cy, 0, room_height-view_h)
}

camera_set_view_pos(player_camera,cx,cy)