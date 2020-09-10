///@description cutscene_create_monologue
///@arg Text
function cutscene_create_monologue(argument0) {
	if !instance_exists(obj_cutscene_speaker){
		var inst = instance_create_layer(0,0,"Text",obj_cutscene_speaker)
		inst.myText = argument0
		with (inst){
			create_dialogue(myText, obj_player);
		}
	}else if !instance_exists(obj_textbox){
		instance_destroy(obj_cutscene_speaker)
		cutscene_end_action()
	}
}
