if story_tag_exist("bush_destroyer"){
	instance_destroy()
}

t_scene_info = [
	[cutscene_take_player_control],
	[cutscene_change_interface_state,true],
	[cutscene_create_monologue,"Чтобы взять палку нажми: "+options_get_control_word(global.settings.controls.pickup_key)],
	[cutscene_set_to_default]
]