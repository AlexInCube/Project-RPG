if exist_story_tag("bush_destroyer"){
	instance_destroy()
}

t_scene_info = [
	[cutscene_change_variable,obj_player,"state",uncontrollable_state],
	[cutscene_change_variable,obj_player,"image_speed",0],
	[cutscene_change_variable,obj_player,"image_index",0],
	[cutscene_change_interface_state,true],
	[cutscene_create_monologue,"Чтобы взять палку нажми: "+return_normal_control_word(global.settings.controls.pickup_key)],
	[cutscene_set_to_default]
]