t_scene_info = [
	[cutscene_change_variable,obj_player,"state",uncontrollable_state],
	[cutscene_change_variable,obj_player,"image_index",0],
	[cutscene_change_variable,obj_player,"image_speed",0],
	[cutscene_wait,0.5],
	[cutscene_camera_change_target,obj_apartment_door,0.05],
	[cutscene_wait,0.6],
	[cutscene_change_variable,obj_apartment_door,"image_speed",1.5],
	[cutscene_play_sound,snd_door_knocking,1,0],
	[cutscene_wait,2.1],
	[cutscene_change_variable,obj_apartment_door,"image_index",0],
	[cutscene_change_variable,obj_apartment_door,"image_speed",0],
	[cutscene_set_to_default]
]