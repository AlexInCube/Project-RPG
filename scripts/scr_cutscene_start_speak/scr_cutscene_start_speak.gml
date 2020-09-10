///@description cutscene_start_speak
///@arg object_id
///@arg instant_end?
function cutscene_start_speak(argument0,argument1) {
if !instance_exists(obj_textbox) and !instance_exists(obj_textevent){
		with(argument0){
			event_user(0)
			create_dialogue(myText, mySpeaker, myEffects, myTextSpeed, myTypes, myNextLine, myScripts, myTextCol, myEmotion);
			obj_inventory.inventorylock=true
			obj_player.image_speed=0
			obj_player.image_index=0
			event_fire([event.talk,object_index])
		}
	}
	if argument1{
		cutscene_end_action()
	}
}
