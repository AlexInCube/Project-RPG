if story_tag_exist("bush_destroyer"){
	instance_destroy()
}

var myText
var i = 0;
myText[i]		= "Я всё забыл!!!"
i++;
myText[i]		= "Шучу, я видел такое начало в одной другой игре, но [c_blue]забыл[/c] её название.";
t_scene_info = [
	[cutscene_take_player_control],
	[cutscene_change_interface_state,true],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_down],
	[cutscene_wait,convert_seconds_to_ticks(0.5)],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_right],
	[cutscene_wait,convert_seconds_to_ticks(0.5)],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_up],
	[cutscene_wait,convert_seconds_to_ticks(0.5)],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_left],
	[cutscene_wait,convert_seconds_to_ticks(0.5)],
	[cutscene_change_variable,obj_player,"sprite_index",spr_player_down],
	[cutscene_wait,convert_seconds_to_ticks(0.5)],
	[cutscene_create_monologue,myText],
	[cutscene_wait,0.1],
	[cutscene_script_execute,quest_start,["first_steps"]],
	[cutscene_set_to_default]
]
