t_scene_info = [
	[cutscene_change_variable,obj_player,"state",uncontrollable_state],
	[cutscene_change_variable,obj_player,"image_index",0],
	[cutscene_change_variable,obj_player,"image_speed",0],
	[cutscene_camera_change_target,obj_apartment_door,0.05],
	[cutscene_wait,0.2],
	[cutscene_change_variable,obj_apartment_door,"sprite_index",spr_apartment_door_opening],
	[cutscene_change_variable,obj_apartment_door,"image_speed",2],
	[cutscene_wait,1.5],
	[cutscene_instance_create,456,278,"Instances",obj_penguinnpc],
	[cutscene_wait,0.5],
	[cutscene_start_speak,obj_penguinnpc,false],
	[cutscene_camera_change_target,obj_penguinnpc,0.05],
	[cutscene_move_character,obj_penguinnpc,450,300,false,1],
	[cutscene_wait,1],
	[cutscene_start_speak,obj_penguinnpc,true],
	[cutscene_set_to_default]
]