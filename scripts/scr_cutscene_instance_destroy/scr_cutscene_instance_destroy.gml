///@description cutscene_instance_destroy
///@arg id
function cutscene_instance_destroy(argument0) {
	show_debug_message("end action")

	with(argument0){
		instance_destroy()
	}



}
