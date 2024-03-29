enum camera_mode{
	follow_object,
	follow_mouse_peek,
	move_to_target,
	move_to_follow_object,
}

#macro DEFAULT_CAMERA_MODE change_camera_mode(camera_mode.follow_object,obj_player)
#macro MOVE_TO_PLAYER_CAMERA_MODE change_camera_mode(camera_mode.move_to_follow_object,obj_player,0.1)

#macro player_camera view_camera[0]

//player_camera mode
mode = camera_mode.follow_object
//Move to follow object
default_camera_speed = 1
camera_speed = default_camera_speed//player_camera speed (speed range must be 0.00 to 1.00)
following=obj_player
//Move to target
target_x = 0
target_y = 0
//Shake player_camera effect
shake = 0

boundless = false

event_user(0)