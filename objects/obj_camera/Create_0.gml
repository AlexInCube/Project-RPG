enum camera_mode{
	follow_object,
	follow_mouse_peek,
	move_to_target,
	move_to_follow_object,
}

#macro camera view_camera[0]

//Camera mode
mode = camera_mode.follow_object
//Move to follow object
default_camera_speed = 1
camera_speed = default_camera_speed//Camera speed (speed range must be 0.00 to 1.00)
following=obj_player
//Move to target
target_x = 0
target_y = 0
//Shake camera effect
shake = 0

boundless = false