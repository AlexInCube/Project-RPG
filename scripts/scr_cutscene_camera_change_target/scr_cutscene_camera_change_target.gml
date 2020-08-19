///@description cutscene_camera_change_target
///@arg target
///@arg camera_speed (0 to 1)
function scr_cutscene_camera_change_target(argument0, argument1) {
	obj_camera.target = argument0
	obj_camera.camera_speed = argument1

	scr_cutscene_end_action()


}
