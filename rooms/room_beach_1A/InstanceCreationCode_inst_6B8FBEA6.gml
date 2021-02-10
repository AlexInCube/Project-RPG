if exist_story_tag("bush_destroyer"){
	instance_destroy()
}
var myText
var i = 0;
myText[i]		= "Перед уходом на другую локацию, скажу одну вещь. Сохранение игры происходит автоматически при переходе."

t_scene_info = [
	[cutscene_take_player_control],
	[cutscene_change_interface_state,true],
	[cutscene_camera_change_mode,camera_mode.move_to_follow_object,0.1,obj_campfire],
	[cutscene_create_monologue, myText],
	[cutscene_set_to_default]
]