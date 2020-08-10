t_scene_info = [
	[scr_cutscene_change_variable,obj_player,"state",scr_uncontrollable_state],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_sleep],
	[scr_cutscene_wait,1],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_left],
	[scr_cutscene_wait,1],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_right],
	[scr_cutscene_change_variable,obj_player,"state",scr_move_state]
]