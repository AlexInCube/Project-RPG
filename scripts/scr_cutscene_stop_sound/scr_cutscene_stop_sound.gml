///@description cutscene_stop_sound
///@arg soundid
function cutscene_stop_sound(argument0) {
	audio_stop_sound(argument0)

	cutscene_end_action()


}
