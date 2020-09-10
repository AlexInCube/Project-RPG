///@description cutscene_change_state
///@arg obj_id
///@arg state_script
function cutscene_change_state(argument0, argument1) {
	with(argument0){
		state = argument1
	}

	cutscene_end_action()


}
