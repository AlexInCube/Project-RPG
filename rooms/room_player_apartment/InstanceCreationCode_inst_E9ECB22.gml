t_scene_info = [
	[scr_cutscene_change_variable,obj_player,"state",scr_uncontrollable_state],
	[scr_cutscene_change_variable,obj_player,"image_index",0],
	[scr_cutscene_change_variable,obj_player,"image_speed",0],
	[scr_cutscene_camera_change_target,obj_apartment_door,0.05],
	[scr_cutscene_wait,0.2],
	[scr_cutscene_change_variable,obj_apartment_door,"sprite_index",spr_apartment_door_opening],
	[scr_cutscene_change_variable,obj_apartment_door,"image_speed",2],
	[scr_cutscene_wait,1.5],
	[scr_cutscene_instance_create,456,278,"Instances",obj_penguinnpc],
	[scr_cutscene_wait,0.2],
	[scr_cutscene_move_character,obj_penguinnpc,450,300,false,1],
	[scr_cutscene_wait,1],
	[scr_cutscene_start_speak,obj_penguinnpc],
	[scr_cutscene_set_to_default]
]