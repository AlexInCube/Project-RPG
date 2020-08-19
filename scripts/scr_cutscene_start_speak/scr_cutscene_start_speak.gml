///@description scr_cutscene_event_perform
///@arg object_id
///@arg event_type
///@arg event_number
function scr_cutscene_start_speak(argument0) {
	with(argument0){
		event_user(0)
		create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion);
		obj_inventory.inventorylock=true
		obj_player.image_speed=0
		obj_player.image_index=0
		scr_event_fire([event.talk,object_index])
	}
	scr_cutscene_end_action()


}
