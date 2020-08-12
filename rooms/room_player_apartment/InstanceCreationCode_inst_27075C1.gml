t_scene_info = [
	[scr_cutscene_change_variable,obj_player,"state",scr_uncontrollable_state],
	[scr_cutscene_change_variable,obj_player,"image_speed",0],
	[scr_cutscene_wait,0.5],
	[scr_cutscene_camera_change_target,obj_apartment_door,0.05],
	[scr_cutscene_wait,1.2],
	[scr_cutscene_change_variable,obj_apartment_door,"image_speed",2],
	[scr_cutscene_wait,2],
	[scr_cutscene_set_to_default]
]