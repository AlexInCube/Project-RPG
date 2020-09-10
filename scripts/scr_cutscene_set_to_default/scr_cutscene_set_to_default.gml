///@description cutscene_set_to_default
function cutscene_set_to_default() {
	obj_player.state=move_state
	obj_camera.target=obj_player
	obj_camera.camera_speed=obj_camera.default_camera_speed
	cutscene_end_action()
}
