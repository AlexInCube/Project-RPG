///@description cutscene_camera_change_target
///@arg target
///@arg camera_speed (0 to 1)
function cutscene_camera_change_target(argument0, argument1) {
	obj_camera.target = argument0
	obj_camera.camera_speed = argument1

	cutscene_end_action()


}
