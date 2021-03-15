if exist_story_tag("ewgen_saved_from_slimes"){
	instance_destroy()
}
var myText
var i = 0;
myText[i]		= "Похоже этот человек попал в беду!"
i++;
myText[i]		= "Надо ему помочь"

t_scene_info = [
	[cutscene_take_player_control],
	[cutscene_wait,convert_seconds_to_ticks(1)],
	[cutscene_change_interface_state,true],
	[cutscene_create_monologue,myText],
	[cutscene_set_to_default]
]