t_scene_info = [
	[scr_cutscene_change_variable,obj_player,"state",scr_uncontrollable_state],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_sleep],
	[scr_cutscene_wait,1],
	[scr_cutscene_play_sound,snd_clock_alarm,1,0],
	[scr_cutscene_wait,1],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_left],
	[scr_cutscene_wait,1],
	[scr_cutscene_stop_sound,snd_clock_alarm],
	[scr_cutscene_change_variable,obj_player,"sprite_index",spr_player_right],
	[scr_cutscene_create_monologue,"Как же я ненавижу этот будильник!!!"],
	[scr_cutscene_move_character,obj_player,600,295,false,0.5],
	[scr_cutscene_wait,0.1],
	[scr_cutscene_set_to_default]
]