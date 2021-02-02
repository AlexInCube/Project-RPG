if exist_story_tag("bush_destroyer"){
	instance_destroy()
}
event_register([event.itemPickuped,"wooden_stick",1],id,instance_destroy_ext,id,true)
t_scene_info = [
	[cutscene_change_variable,obj_player,"state",uncontrollable_state],
	[cutscene_change_variable,obj_player,"image_speed",0],
	[cutscene_change_variable,obj_player,"image_index",0],
	[cutscene_change_interface_state,true],
	[cutscene_create_monologue,"Я не могу пока-что тут пройти."],
	[cutscene_move_character,obj_player,214,420,false,obj_player.spd],
	[cutscene_set_to_default]
]