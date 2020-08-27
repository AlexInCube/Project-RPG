///@description scr_cutscene_event_perform
///@arg object_id
///@arg event_type
///@arg event_number
function scr_cutscene_event_perform(argument0, argument1, argument2) {
	with(argument0){
	event_perform(argument1,argument2)
	}
	scr_cutscene_end_action()


}
