t_scene_info = [
	[cutscene_change_variable,obj_player,"state",uncontrollable_state],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_up],
	[cutscene_wait,1],
	[cutscene_play_sound,snd_clock_alarm,1,0],
	[cutscene_wait,1],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_left],
	[cutscene_wait,1],
	[cutscene_stop_sound,snd_clock_alarm],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_right],
	[cutscene_create_monologue,"Как же я ненавижу этот будильник!!!"],
	[cutscene_move_character,obj_player,600,295,false,0.5],
	[cutscene_wait,0.1],
	[cutscene_set_to_default]
]
cutscene_id=0