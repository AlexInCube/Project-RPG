///@description scr_cutscene_stop_sound
///@arg soundid
function scr_cutscene_stop_sound(argument0) {
	audio_stop_sound(argument0)

	scr_cutscene_end_action()


}
