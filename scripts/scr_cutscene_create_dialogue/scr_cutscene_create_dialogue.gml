///@description scr_cutscene_create_dialogue
///@arg Text
///@arg Speaker
///@arg *Effects
///@arg *Speed
///@arg *Type
///@arg *Next_Line
///@arg *Scripts
///@arg *Text_Col
///@arg *Emotion
function scr_cutscene_create_dialogue(argument0) {
	if !instance_exists(obj_cutscene_speaker){
		var inst = instance_create_layer(0,0,"Text",obj_cutscene_speaker)
		inst.myText = argument0
		with (inst){
			create_dialogue(myText, obj_player);
		}
	}else if !instance_exists(obj_textbox){
		instance_destroy(obj_cutscene_speaker)
		scr_cutscene_end_action()
	}






}
